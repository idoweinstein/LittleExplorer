from django import forms
from django.forms import ModelForm
from .models import Parent


# Create a signup form
class SignupForm(ModelForm):
    class Meta:
        model = Parent
        fields = ('username', 'password', 'home_address', 'home_region', 'work_address', 'work_region')
