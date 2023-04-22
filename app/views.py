from django.http import HttpResponse
from .models import Kindergarten, Kindergartenadditionalinfo, Parent
from django.shortcuts import render, redirect, get_object_or_404
from .forms import RegisterUserForm
from django.contrib import messages
from django.contrib.auth import login, authenticate
import pandas as pd


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


def get_kindergarten_details(request, kindergarten_id):
    kindergarten = get_object_or_404(Kindergarten, pk=kindergarten_id)
    kindergarten_info = get_object_or_404(Kindergartenadditionalinfo, pk=kindergarten_id)
    return render(request, 'kindergarten.html', {'kindergarten': kindergarten, 'kindergarten_info': kindergarten_info})


def fix_parent(request):
    df = pd.read_csv('/home/djaffe/PycharmProjects/LittleExplorer/data/parent.csv')
    df = df.reset_index()
    for index, row in df.iterrows():
        email = row["user_name"].lstrip()
        password = row["password"].lstrip()
        first_name = row["first_name"].lstrip()
        last_name = row["last_name"].lstrip()
        home_address = row["home_address"].lstrip()
        home_region = row["home_region"].lstrip()
        work_address = row["work_address"].lstrip()
        work_region = row["work_region"].lstrip()
        user = Parent.objects.create_user(email=email, username=email, password=password, first_name=first_name,
                                          last_name=last_name, home_address=home_address, home_region=home_region,
                                          work_address=work_address, work_region=work_region)
        if user is not None:
            login(request, user)
    return render(request, 'index.html')
