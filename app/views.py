from django.http import HttpResponse
from .models import Kindergarten, Kindergartenadditionalinfo, Comment, Parent
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth import login, authenticate, logout
from django.views.decorators.http import require_GET
from django.db.models import Min, Max, Q

from django.contrib.gis.measure import D
from django.contrib.gis.db.models.functions import Distance
from django.contrib.gis.geos import Point

from .forms import RegisterParentForm, CommentForm, RegisterTeacherForm, \
    KindergartenForm, KindergartenAdditionalInfoForm, \
    AddKindergartenForm, AddKindergartenAdditionalInfoForm
from .geolocation import get_coordinates

import operator
from functools import reduce
from datetime import time, date

from django.core.mail import send_mail
import LittleExplorerApp.settings


class Value:
    def __init__(self, value):
        self.value = value


class RangedValue(Value):
    def __init__(self, value, min, max):
        super().__init__(value)
        self.min = min
        self.max = max


def index(request):
    return render(request, 'index.html')


def log_in(request):
    if request.method == 'GET':
        return render(request, 'login.html', {})

    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('/')
        else:
            messages.success(request, ("There Was An Error Logging In, Try Again..."))
            return redirect('login')


def sign_up(request, user_type):
    if request.method == "POST":
        form = RegisterParentForm(request.POST) if user_type == "parent" else RegisterTeacherForm(request.POST)
        if form.is_valid():
            form.save()
            email = form.cleaned_data['email']
            password = form.cleaned_data['password1']
            user = authenticate(username=email, password=password)
            login(request, user)
            messages.success(request, ("Registration Successful!"))
            return redirect('/')
    else:
        form = RegisterParentForm() if user_type == "parent" else RegisterTeacherForm()

    html_page = 'parent_register.html' if user_type == 'parent' else 'register.html'
    return render(request, html_page, {
        'form': form,
    })


def parent_sign_up(request):
    return sign_up(request, "parent")


def teacher_sign_up(request):
    return sign_up(request, "teacher")


def log_out(request):
    logout(request)
    return redirect('/')


@require_GET
def search(request):
    parameters = request.GET
    method = parameters.get("method")
    value = parameters.get("value")

    if method not in ["name", "location"]:
        method = "name"

    # TODO: VALIDATE INPUTS!!! (Can be done after version 0)
    l = Kindergarten.objects.all().aggregate(
        Min('min_age'), Max('min_age'),
        Min('max_age'), Max('max_age'),
        Min('capacity'), Max('capacity'),
        Min('open_time'), Max('open_time'),
        Min('close_time'), Max('close_time'))
    (min_age_min, min_age_max, max_age_min, max_age_max, min_capacity, max_capacity, min_open, max_open, min_close,
     max_close) = (
        int(l['min_age__min']), int(l['min_age__max']), int(l['max_age__min']), int(l['max_age__max']),
        int(l['capacity__min']), int(l['capacity__max']),
        l['open_time__min'], l['open_time__max'], l['close_time__min'], l['close_time__max']
    )

    min_age_value = int(parameters.get("min_age")) if parameters.get("min_age") else min_age_min
    max_age_value = int(parameters.get("max_age")) if parameters.get("max_age") else max_age_max
    if min_age_value > max_age_value:
        min_age_value = max_age_value
    capacity_value = int(parameters.get("capacity")) if parameters.get("capacity") else max_capacity
    open_value = parameters.get("open_time") if parameters.get("open_time") else max_open
    close_value = parameters.get("close_time") if parameters.get("close_time") else min_close

    if isinstance(min_open, str):
        min_open = time.fromisoformat(min_open)
    if isinstance(max_open, str):
        max_open = time.fromisoformat(max_open)
    if isinstance(open_value, str):
        open_value = time.fromisoformat(open_value)

    if isinstance(min_close, str):
        min_close = time.fromisoformat(min_close)
    if isinstance(max_close, str):
        max_close = time.fromisoformat(max_close)
    if isinstance(close_value, str):
        close_value = time.fromisoformat(close_value)

    filters = list()
    point = None
    if method == "name":
        filters.append(Q(name__contains=value))
    else:
        # method == "location"
        regional_search = value in Kindergarten.objects.order_by('region').values_list('region', flat=True).distinct()
        if regional_search:
            filters.append(Q(region=value))
        else:
            coords = get_coordinates(value)
            point = Point(coords[1], coords[0], srid=4326)  # 4326 stands for (lat, long) coordinates system

    for key, (attr_key, attr_value) in {"min_age": ("min_age__gte", min_age_value),
                                        "max_age": ("max_age__lte", max_age_value),
                                        "capacity": ("capacity__lte", capacity_value),
                                        "open_time": ("open_time__lte", open_value),
                                        "close_time": ("close_time__gte", close_value)
                                        }.items():
        if parameters.get(key):
            filters.append(Q(**{attr_key: attr_value}))

    if filters:
        kindergartens = Kindergarten.objects.filter(reduce(operator.and_, filters))
    else:
        kindergartens = Kindergarten.objects.all()

    if method == "location" and not regional_search:
        kindergartens = kindergartens.annotate(distance=Distance('geolocation', point)).order_by("distance")

    context = {'results': kindergartens,
               'value': Value(value),
               'min_age': RangedValue(min_age_value, min_age_min, min_age_max),
               'max_age': RangedValue(max_age_value, max_age_min, max_age_max),
               'capacity': RangedValue(capacity_value, min_capacity, max_capacity),
               'open_time': RangedValue(open_value.isoformat("minutes"), min_open.isoformat("minutes"),
                                        max_open.isoformat("minutes")),
               'close_time': RangedValue(close_value.isoformat("minutes"), min_close.isoformat("minutes"),
                                         max_close.isoformat("minutes"))}

    return render(request, 'search.html', context)


def get_kindergarten_details(request, kindergarten_id):
    kindergarten = get_object_or_404(Kindergarten, pk=kindergarten_id)
    kindergarten_info = get_object_or_404(Kindergartenadditionalinfo, pk=kindergarten_id)
    comments_with_parent = Comment.objects.filter(kindergarten_id=kindergarten_id).order_by('-date').select_related(
        'parent').all()
    return render(request, 'kindergarten.html',
                  {'kindergarten': kindergarten,
                   'kindergarten_info': kindergarten_info,
                   'comments_with_parent': comments_with_parent
                   })


def add_comment(request, kindergarten_id):
    if request.method == "POST":
        form = CommentForm(request.POST)
        if form.is_valid():
            comment = form.save(commit=False)
            comment.date = date.today()
            comment.parent = request.user
            comment.kindergarten = get_object_or_404(Kindergarten, pk=kindergarten_id)
            comment.save()

            # TODO: we want to show a response to the user
            return redirect('/')
    else:
        form = CommentForm()

    return render(request, 'comment.html', {
        'form': form,
    })


def add_kindergarten(request):
    if request.method == "POST":
        kindergarten_form = AddKindergartenForm(request.POST)
        kindergarten_additional_info_form = AddKindergartenAdditionalInfoForm(request.POST)
        if kindergarten_form.is_valid() and kindergarten_additional_info_form.is_valid():
            kindergarten = kindergarten_form.save(commit=False)
            kindergarten.teacher_id = request.user.parent_id
            kindergarten.set_geolocation()
            kindergarten = kindergarten.save()
            kindergarten_additional_info_form.save(kindergarten)

            # TODO: we want to show a response to the user
            return redirect('/')
    else:
        kindergarten_form = AddKindergartenForm()
        kindergarten_additional_info_form = AddKindergartenAdditionalInfoForm()

    return render(request, 'add_kindergarten.html', {
        'kindergarten_form': kindergarten_form,
        'kindergarten_additional_info': kindergarten_additional_info_form
    })


def sign_up_kid_to_kindergarten(request, kindergarten_id):
    if request.method == "POST":
        kindergarten = Kindergarten.objects.get(kindergarten_id=kindergarten_id)
        kindergarten_name = kindergarten.name  # get kindergarten name
        subject = f"הרשמה חדשה עבור {kindergarten_name}"

        parent_email = request.user.email
        message = f"הוריו של {request.POST['first-name']} {request.POST['last-name']} רשמו אותו לגן" \
                  f"\n{request.POST['first-name']} מתרגש מאוד להצטרף לגן והוא בן {request.POST['age-months']} חודשים" \
                  f"\n{parent_email} ליצירת קשר עם ההורים ניתן לשלוח מייל לכתובת הבאה" \
                  f"\n,בברכה" \
                  f"\nLittleExplorer"

        teacher_id = kindergarten.teacher_id
        teacher = Parent.objects.get(parent_id=teacher_id)
        recipient = [teacher.email]

        email_from = LittleExplorerApp.settings.EMAIL_HOST_USER

        send_mail(subject, message, email_from, recipient)

        kindergarten.kids_count = kindergarten.kids_count + 1
        kindergarten.save()
        return redirect('/')

    return render(request, 'payment.html')
