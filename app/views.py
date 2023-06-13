from datetime import date

from django.contrib import messages
from django.contrib.auth import login, authenticate, logout
from django.core.exceptions import ValidationError, PermissionDenied
from django.core.mail import send_mail
from django.core import serializers
from django.core.validators import validate_email
from django.db import IntegrityError
from django.http import JsonResponse, HttpResponseRedirect
from django.shortcuts import render, redirect, get_object_or_404
from django.views.decorators.http import require_GET

from django.contrib.auth.decorators import user_passes_test

from django.views.decorators.http import require_POST

import LittleExplorerApp.settings
from app.search import get_boundaries_of_fields, get_filtered_kindergartens, RangedValue, Value
from .forms import RegisterParentForm, AddCommentForm, RegisterTeacherForm, \
    AddKindergartenForm, AddKindergartenAdditionalInfoForm
from .models import Kindergarten, Users, Connections, Kindergartenadditionalinfo, Comment
from .geolocation import BING_KEY


def assert_true(func):
    def inner(*args, **kwargs):
        value = func(*args, **kwargs)
        if not value:
            raise PermissionDenied
        return value
    return inner


@assert_true
def unauthenticated(user):
    return not user.is_authenticated


@assert_true
def authenticated(user):
    return user.is_authenticated


@assert_true
def parent(user):
    return user.is_parent()


@assert_true
def teacher(user):
    return user.is_teacher()


def index(request):
    return render(request, 'index.html')


@user_passes_test(unauthenticated)
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
            messages.error(request, ("Login failed. Please re-enter your Email and password."))
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

    html_page = 'parent_register.html' if user_type == 'parent' else 'teacher_register.html'
    return render(request, html_page, {
        'form': form,
    })


@user_passes_test(unauthenticated)
def parent_sign_up(request):
    return sign_up(request, "parent")


@user_passes_test(unauthenticated)
def teacher_sign_up(request):
    return sign_up(request, "teacher")


@user_passes_test(authenticated)
def log_out(request):
    logout(request)
    return redirect('/')


@require_GET
def search(request):
    parameters = request.GET
    method = parameters.get("method")
    value = parameters.get("value")

    if not value:
        # Empty search query is blocked by our frontend.
        # Therefore, this scenario can only happen by tampering frontend code.
        # If so, navigate to the index page.
        return redirect('/')

    if method not in ["name", "location", "advanced"]:
        method = "name"

    boundaries = get_boundaries_of_fields(parameters)
    kindergartens = get_filtered_kindergartens(parameters, method, value)

    context = {'results': kindergartens,
               'json_results': serializers.serialize("json", kindergartens),
               'api_key': BING_KEY,
               'value': Value(value),
               'min_age': RangedValue(boundaries['min_age_value'], boundaries['min_age_min'],
                                      boundaries['min_age_max']),
               'max_age': RangedValue(boundaries['max_age_value'], boundaries['max_age_min'],
                                      boundaries['max_age_max']),
               'capacity': RangedValue(boundaries['capacity_value'], boundaries['min_capacity'],
                                       boundaries['max_capacity']),
               'open_time': RangedValue(boundaries['open_value'].isoformat("minutes"),
                                        boundaries['min_open'].isoformat("minutes"),
                                        boundaries['max_open'].isoformat("minutes")),
               'close_time': RangedValue(boundaries['close_value'].isoformat("minutes"),
                                         boundaries['min_close'].isoformat("minutes"),
                                         boundaries['max_close'].isoformat("minutes")),
               'is_free': parameters.get('is_free') == 'on',
               'request': request.GET}

    return render(request, 'search.html', context)


def get_kindergarten_details(request, kindergarten_id):
    kindergarten = get_object_or_404(Kindergarten, pk=kindergarten_id)
    kindergarten_info = get_object_or_404(Kindergartenadditionalinfo, pk=kindergarten_id)
    comments_with_parent = Comment.objects.filter(kindergarten_id=kindergarten_id).order_by('-date').select_related(
        'parent').all()

    context = {
        'kindergarten': kindergarten,
        'kindergarten_info': kindergarten_info,
        'comments_with_parent': comments_with_parent,
        'add_comment_form': AddCommentForm()
    }

    if request.method == "POST":
        action = request.POST.get('action')
        if action == 'add_comment':
            add_comments_form, comment_id = add_comment(request, kindergarten_id)
            if comment_id is not None:
                return HttpResponseRedirect(f'/kindergarten/{kindergarten_id}#comment-{comment_id}')
            context['hash'] = 'add_comment'
            context['add_comment_form'] = add_comments_form

    return render(request, 'kindergarten.html', context)


@require_POST
@user_passes_test(parent)
def add_comment(request, kindergarten_id):
    form = AddCommentForm(request.POST)
    comment_id = None
    if form.is_valid():
        comment = form.save(commit=False)
        comment.date = date.today()
        comment.parent = request.user
        comment.kindergarten = get_object_or_404(Kindergarten, pk=kindergarten_id)
        comment.save()

        # Set the updated comment id
        comment_id = comment.comment_id

    return form, comment_id



@user_passes_test(teacher)
def add_kindergarten(request):
    if request.method == "POST":
        kindergarten_form = AddKindergartenForm(request.POST)
        kindergarten_additional_info_form = AddKindergartenAdditionalInfoForm(request.POST)
        if kindergarten_form.is_valid() and kindergarten_additional_info_form.is_valid():
            kindergarten = kindergarten_form.save(commit=False)
            kindergarten.teacher_id = request.user.parent_id
            kindergarten.set_geolocation()
            kindergarten.save()
            kindergarten_additional_info_form.save(kindergarten)

            return redirect(f'/kindergarten/{ kindergarten.kindergarten_id }')
    else:
        kindergarten_form = AddKindergartenForm()
        kindergarten_additional_info_form = AddKindergartenAdditionalInfoForm()

    return render(request, 'add_kindergarten.html', {
        'kindergarten_form': kindergarten_form,
        'kindergarten_additional_info': kindergarten_additional_info_form
    })


@user_passes_test(parent)
def sign_up_kid_to_kindergarten(request, kindergarten_id):
    if request.method == "POST":
        kindergarten = Kindergarten.objects.get(kindergarten_id=kindergarten_id)
        kindergarten_name = kindergarten.name  # get kindergarten name
        subject = f"A new registration for {kindergarten_name}"

        parent_email = request.user.email
        message = f"{request.POST['first-name']} {request.POST['last-name']} has just been registered to your kindergarten by the parent." \
                  f"\n{request.POST['first-name']} is very excited, and is {request.POST['age-months']} months old." \
                  f"\nTo contact the parent, please use the following Email address: {parent_email}" \
                  f"\nBest regards," \
                  f"\nLittleExplorer"

        teacher_id = kindergarten.teacher_id
        teacher = Users.objects.get(parent_id=teacher_id)
        recipient = [teacher.email]

        email_from = LittleExplorerApp.settings.EMAIL_HOST_USER

        send_mail(subject, message, email_from, recipient)

        kindergarten.kids_count = kindergarten.kids_count + 1
        kindergarten.save()
        return redirect('/')

    return render(request, 'payment.html')


@user_passes_test(authenticated)
def add_connection(request):
    if request.method == 'POST':
        user_email = request.POST.get('user_email')
        try:
            validate_email(user_email)
        except ValidationError:
            response_data = {
                'message': 'Invalid email address',
            }
            return JsonResponse(response_data, status=400)

        try:
            connectee = Users.objects.get(email=user_email)
        except Users.DoesNotExist:
            response_data = {
                'message': 'User does not exist',
            }
            return JsonResponse(response_data, status=404)

        connector_id = request.user.parent_id
        connector = Users.objects.get(parent_id=connector_id)

        try:
            if connector.email == connectee.email:
                raise ValidationError("You entered your own email")
            if connectee.user_type == "teacher":
                raise ValidationError("User does not exist")
        except ValidationError as e:
            response_data = {
                'message': e.message,
            }
            return JsonResponse(response_data, status=400)

        connection = Connections(connector=connector, connectee=connectee)

        try:
            connection.save()
        except IntegrityError:
            response_data = {
                'message': 'You have this connection already',
            }
            return JsonResponse(response_data, status=500)

        response_data = {
            'message': 'Connection added successfully',
        }
        return JsonResponse(response_data)
