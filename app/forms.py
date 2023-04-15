from django import forms
from django.forms import ModelForm
from .models import Parent
from django.contrib.auth.forms import UserCreationForm


# Create a signup form
class SignupForm(UserCreationForm):
    class Meta:
        model = Parent
        fields = ('username', 'home_address', 'home_region', 'work_address', 'work_region')
