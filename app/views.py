from django.http import HttpResponse
from .models import Kindergarten, Kindergartenadditionalinfo
from django.shortcuts import render, redirect, get_object_or_404
from .forms import RegisterUserForm
from django.contrib import messages
from django.contrib.auth import login, authenticate
from django.views.decorators.http import require_GET
from django.db.models import Min, Max, Q

from .models import Kindergarten
from .forms import RegisterUserForm

import operator
from functools import reduce
from datetime import time

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


def sign_up(request):
    if request.method == "POST":
        form = RegisterUserForm(request.POST)
        if form.is_valid():
            form.save()
            email = form.cleaned_data['email']
            password = form.cleaned_data['password1']
            user = authenticate(username=email, password=password)
            login(request, user)
            messages.success(request, ("Registration Successful!"))
            return redirect('/')
    else:
        form = RegisterUserForm()

    return render(request, 'register.html', {
        'form': form,
    })


@require_GET
def search(request):
    parameters = request.GET
    method = parameters.get("method")
    value = parameters.get("value")

    if method not in ["name", "location"]:
        method = "name"

    # TODO: VALIDATE INPUTS!!!
    min_age_min = list(Kindergarten.objects.all().aggregate(Min('min_age')).values())[0]
    min_age_max = list(Kindergarten.objects.all().aggregate(Max('min_age')).values())[0]
    min_age_value = int(parameters.get("min_age")) if parameters.get("min_age") else min_age_min
    max_age_min = list(Kindergarten.objects.all().aggregate(Min('max_age')).values())[0]
    max_age_max = list(Kindergarten.objects.all().aggregate(Max('max_age')).values())[0]
    max_age_value = int(parameters.get("max_age")) if parameters.get("max_age") else max(max_age_min, min_age_value)
    if min_age_value > max_age_value:
        min_age_value = max_age_value
    max_capacity = list(Kindergarten.objects.all().aggregate(Max('capacity')).values())[0]
    min_capacity = list(Kindergarten.objects.all().aggregate(Min('capacity')).values())[0]
    capacity_value = int(parameters.get("capacity")) if parameters.get("capacity") else max_capacity
    min_open = list(Kindergarten.objects.all().aggregate(Min('open_time')).values())[0].isoformat(timespec="minutes")
    max_open = list(Kindergarten.objects.all().aggregate(Max('open_time')).values())[0].isoformat(timespec="minutes")
    open_value = parameters.get("open_time") if parameters.get("open_time") else max_open
    min_close = list(Kindergarten.objects.all().aggregate(Min('close_time')).values())[0].isoformat(timespec="minutes")
    max_close = list(Kindergarten.objects.all().aggregate(Max('close_time')).values())[0].isoformat(timespec="minutes")
    close_value = parameters.get("close_time") if parameters.get("close_time") else min_close

    filters = list()
    if method == "name":
        filters.append(Q(name__contains=value))
    else:
        # TODO: implement address search
        filters.append(Q())

    for key, (attr_key, attr_value) in {"min_age": ("min_age__gte", min_age_value),
                       "max_age": ("max_age__lte", max_age_value),
                       "capacity": ("capacity__lte", capacity_value),
                       "open_time": ("open_time__lte", time.fromisoformat(open_value)),
                       "close_time": ("close_time__gte",  time.fromisoformat(close_value))
                    }.items():
        if parameters.get(key):
            filters.append(Q(**{attr_key: attr_value}))

    kindergartens = Kindergarten.objects.filter(reduce(operator.and_, filters))[:100]

    context = {'results': kindergartens,
               'value': Value(value),
               'min_age': RangedValue(min_age_value, min_age_min, min_age_max),
               'max_age': RangedValue(max_age_value, max_age_min, max_age_max),
               'capacity': RangedValue(capacity_value, min_capacity, max_capacity),
               'open_time': RangedValue(open_value, min_open, max_open),
               'close_time': RangedValue(close_value, min_close, max_close)}

    return render(request, 'search.html', context)


@require_GET
def search(request):
    parameters = request.GET
    method = parameters.get("method")
    value = parameters.get("value")

    if method not in ["name", "location"]:
        method = "name"

    # TODO: VALIDATE INPUTS!!!
    min_age_min = list(Kindergarten.objects.all().aggregate(Min('min_age')).values())[0]
    min_age_max = list(Kindergarten.objects.all().aggregate(Max('min_age')).values())[0]
    min_age_value = int(parameters.get("min_age")) if parameters.get("min_age") else min_age_min
    max_age_min = list(Kindergarten.objects.all().aggregate(Min('max_age')).values())[0]
    max_age_max = list(Kindergarten.objects.all().aggregate(Max('max_age')).values())[0]
    max_age_value = int(parameters.get("max_age")) if parameters.get("max_age") else max(max_age_min, min_age_value)
    if min_age_value > max_age_value:
        min_age_value = max_age_value
    max_capacity = list(Kindergarten.objects.all().aggregate(Max('capacity')).values())[0]
    min_capacity = list(Kindergarten.objects.all().aggregate(Min('capacity')).values())[0]
    capacity_value = int(parameters.get("capacity")) if parameters.get("capacity") else max_capacity
    min_open = list(Kindergarten.objects.all().aggregate(Min('open_time')).values())[0].isoformat(timespec="minutes")
    max_open = list(Kindergarten.objects.all().aggregate(Max('open_time')).values())[0].isoformat(timespec="minutes")
    open_value = parameters.get("open_time") if parameters.get("open_time") else max_open
    min_close = list(Kindergarten.objects.all().aggregate(Min('close_time')).values())[0].isoformat(timespec="minutes")
    max_close = list(Kindergarten.objects.all().aggregate(Max('close_time')).values())[0].isoformat(timespec="minutes")
    close_value = parameters.get("close_time") if parameters.get("close_time") else min_close

    filters = list()
    if method == "name":
        filters.append(Q(name__contains=value))
    else:
        # TODO: implement address search
        filters.append(Q())

    for key, (attr_key, attr_value) in {"min_age": ("min_age__gte", min_age_value),
                       "max_age": ("max_age__lte", max_age_value),
                       "capacity": ("capacity__lte", capacity_value),
                       "open_time": ("open_time__lte", time.fromisoformat(open_value)),
                       "close_time": ("close_time__gte",  time.fromisoformat(close_value))
                    }.items():
        if parameters.get(key):
            filters.append(Q(**{attr_key: attr_value}))

    kindergartens = Kindergarten.objects.filter(reduce(operator.and_, filters))[:100]

    context = {'results': kindergartens,
               'value': Value(value),
               'min_age': RangedValue(min_age_value, min_age_min, min_age_max),
               'max_age': RangedValue(max_age_value, max_age_min, max_age_max),
               'capacity': RangedValue(capacity_value, min_capacity, max_capacity),
               'open_time': RangedValue(open_value, min_open, max_open),
               'close_time': RangedValue(close_value, min_close, max_close)}

    return render(request, 'search.html', context)


def get_kindergarten_details(request, kindergarten_id):
    kindergarten = get_object_or_404(Kindergarten, pk=kindergarten_id)
    kindergarten_info = get_object_or_404(Kindergartenadditionalinfo, pk=kindergarten_id)
    return render(request, 'kindergarten.html',{'kindergarten': kindergarten, 'kindergarten_info' : kindergarten_info})
