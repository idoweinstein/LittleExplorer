from django.contrib.auth.forms import UserCreationForm
from .models import Parent
from django import forms


class RegisterUserForm(UserCreationForm):
    home_address = forms.CharField(max_length=50, widget=forms.TextInput(attrs={'class': 'form-control'}))
    home_region = forms.CharField(max_length=50, widget=forms.TextInput(attrs={'class': 'form-control'}))
    work_address = forms.CharField(max_length=50, widget=forms.TextInput(attrs={'class': 'form-control'}))
    work_region = forms.CharField(max_length=50, widget=forms.TextInput(attrs={'class': 'form-control'}))

    class Meta:
        model = Parent
        fields = fields = (
            'email', 'first_name', 'last_name', 'home_address', 'home_region', 'work_address', 'work_region',
            'password1',
            'password2')

    def save(self, commit=True):
        user = super(RegisterUserForm, self).save(commit=False)
        user.set_password(self.cleaned_data["password1"])
        user.username = self.cleaned_data["email"]
        if commit:
            user.save()
        return user

    def __init__(self, *args, **kwargs):
        super(RegisterUserForm, self).__init__(*args, **kwargs)

        self.fields['email'].widget.attrs['class'] = 'form-control'
        self.fields['password1'].widget.attrs['class'] = 'form-control'
        self.fields['password2'].widget.attrs['class'] = 'form-control'

        self.fields['first_name'].required = False
        self.fields['last_name'].required = False
        self.fields['home_address'].required = False
        self.fields['home_region'].required = False
        self.fields['work_address'].required = False
        self.fields['work_region'].required = False
