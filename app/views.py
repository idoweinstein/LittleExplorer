from django.shortcuts import render
from django.http import HttpResponse
from .models import Kindergarten
from django.shortcuts import render
from .forms import SignupForm
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.utils import timezone
from django.contrib.auth import login, authenticate, logout


def index(request):
    return render(request, 'index.html')


def sign_up(request):
    if request.method == 'GET':
        form = SignupForm()
        return render(request, 'register.html', {'form': form})

    if request.method == 'POST':
        form = SignupForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            # user.last_login = timezone.now()
            # user.save(update_fields=['last_login'])
            user.save()
            # messages.success(request, 'You have singed up successfully.')
            login(request, user)
            return HttpResponseRedirect('/')
        else:
            return render(request, 'register.html', {'form': form})


def get_kindergarten(request):
    kindergartens = Kindergarten.objects.all()[:5]
    output = '<br>'.join([c.name for c in kindergartens])
    return HttpResponse(output)
