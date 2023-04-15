from django.http import HttpResponse
from .models import Kindergarten
from django.shortcuts import render, redirect
from .forms import RegisterUserForm
from django.contrib import messages
from django.contrib.auth import login, authenticate


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


def get_kindergarten(request):
    kindergartens = Kindergarten.objects.all()[:5]
    output = '<br>'.join([c.name for c in kindergartens])
    return HttpResponse(output)
