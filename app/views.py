from django.shortcuts import render
from django.http import HttpResponse
from .models import Kindergarten
from django.shortcuts import render, redirect
from .forms import SignupForm
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.utils import timezone
from django.contrib.auth import login, authenticate, logout
from .models import Parent


def index(request):
    return render(request, 'index.html')


def sign_up(request):
    if request.method == 'GET':
        form = SignupForm()
        return render(request, 'register.html', {'form': form})

    if request.method == 'POST':
        user_name = request.POST['username']
        password = request.POST['password1']
        home_address = request.POST['home_address']
        user = Parent.objects.create_user(username=user_name, password=password, home_address=home_address)
        user.save()
        return HttpResponseRedirect('/')
        # form = SignupForm(request.POST)
        # if form.is_valid():
        #     user = form.save(commit=False)
        #     # user.last_login = timezone.now()
        #     # user.save(update_fields=['last_login'])
        #     user.save()
        #     # messages.success(request, 'You have singed up successfully.')
        #     login(request, user)
        #     return HttpResponseRedirect('/')
        # else:
        #     return render(request, 'register.html', {'form': form})


def log_in(request):
    if request.method == 'GET':
        return render(request, 'registration/login.html', {})

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


def get_kindergarten(request):
    kindergartens = Kindergarten.objects.all()[:5]
    output = '<br>'.join([c.name for c in kindergartens])
    return HttpResponse(output)
