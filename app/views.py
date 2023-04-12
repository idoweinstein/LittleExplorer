from django.shortcuts import render
from django.http import HttpResponse
from .models import Kindergarten
from django.shortcuts import render
from .forms import SignupForm
from django.http import HttpResponseRedirect


def index(request):
    return render(request, 'index.html')


def sign_up(request):
    submitted = False
    if request.method == "POST":
        form = SignupForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/register?submitted=True')
    else:
        form = SignupForm
        if 'submitted' in request.GET:
            submitted = True

    return render(request, 'register.html', {'form': form, 'submitted': submitted})

    # Create your views here.


def get_kindergarten(request):
    kindergartens = Kindergarten.objects.all()[:5]
    output = '<br>'.join([c.name for c in kindergartens])
    return HttpResponse(output)
