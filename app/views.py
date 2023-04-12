from django.shortcuts import render
from django.http import HttpResponse
from .models import Kindergarten
from django.shortcuts import render


def index(request):
    return render(request, 'index.html')


# Create your views here.

def get_kindergarten(request):
    kindergartens = Kindergarten.objects.all()[:5]
    output = '<br>'.join([c.name for c in kindergartens])
    return HttpResponse(output)
