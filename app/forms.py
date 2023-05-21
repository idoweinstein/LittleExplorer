from django import forms
from django.contrib.auth.forms import UserCreationForm

from .models import Parent, Comment, Kindergarten, Kindergartenadditionalinfo


class RegisterParentForm(UserCreationForm):
    home_address = forms.CharField(max_length=50, widget=forms.TextInput(attrs={'class': 'form-control'}))
    home_region = forms.CharField(max_length=50, widget=forms.TextInput(attrs={'class': 'form-control'}))
    work_address = forms.CharField(max_length=50, widget=forms.TextInput(attrs={'class': 'form-control'}))
    work_region = forms.CharField(max_length=50, widget=forms.TextInput(attrs={'class': 'form-control'}))

    class Meta:
        model = Parent
        fields = (
            'email', 'first_name', 'last_name', 'home_address', 'home_region', 'work_address', 'work_region',
            'password1',
            'password2')

    def save(self, commit=True):
        user = super(RegisterParentForm, self).save(commit=False)
        user.set_password(self.cleaned_data["password1"])
        user.username = self.cleaned_data["email"]
        user.user_type = self.user_type
        if commit:
            user.save()
        return user

    def __init__(self, *args, **kwargs):
        super(RegisterParentForm, self).__init__(*args, **kwargs)

        self.fields['email'].widget.attrs['class'] = 'form-control'
        self.fields['password1'].widget.attrs['class'] = 'form-control'
        self.fields['password2'].widget.attrs['class'] = 'form-control'

        self.fields['home_address'].required = False
        self.fields['home_region'].required = False
        self.fields['work_address'].required = False
        self.fields['work_region'].required = False

        self.fields['email'].label = "אימייל"
        self.fields['first_name'].label = "שם פרטי"
        self.fields['last_name'].label = "שם משפחה"
        self.fields['home_address'].label = "כתובת מגורים"
        self.fields['home_region'].label = "עיר מגורים"
        self.fields['work_address'].label = "כתובת עבודה"
        self.fields['work_region'].label = "עיר עבודה"
        self.fields['password1'].label = "סיסמה"
        self.fields['password2'].label = "חזור על הסיסמה"

        self.user_type = "parent"


class RegisterTeacherForm(UserCreationForm):
    class Meta:
        model = Parent
        fields = (
            'email', 'first_name', 'last_name', 'password1', 'password2')

    def save(self, commit=True):
        user = super(RegisterTeacherForm, self).save(commit=False)
        user.set_password(self.cleaned_data["password1"])
        user.username = self.cleaned_data["email"]
        user.user_type = self.user_type
        if commit:
            user.save()
        return user

    def __init__(self, *args, **kwargs):
        super(RegisterTeacherForm, self).__init__(*args, **kwargs)

        self.fields['email'].widget.attrs['class'] = 'form-control'
        self.fields['password1'].widget.attrs['class'] = 'form-control'
        self.fields['password2'].widget.attrs['class'] = 'form-control'

        self.fields['email'].label = "אימייל"
        self.fields['first_name'].label = "שם פרטי"
        self.fields['last_name'].label = "שם משפחה"
        self.fields['password1'].label = "סיסמה"
        self.fields['password2'].label = "חזור על הסיסמה"

        self.user_type = "teacher"


class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['comment', 'grade']
        widgets = {
            'comment': forms.Textarea(attrs={'rows': 10, 'cols': 50})
        }
        labels = {
            'comment': 'תגובה',
            'grade': 'ציון- (1 - גרוע מאוד, 5 - מצוין) '
        }


class KindergartenForm(forms.ModelForm):
    class Meta:
        open_time = forms.TimeField(widget=forms.TimeInput(format='%H:%M:%S'))
        close_time = forms.TimeField(widget=forms.TimeInput(format='%H:%M:%S'))
        model = Kindergarten
        fields = ['name', 'address', 'region', 'min_age', 'max_age', 'capacity', 'kids_count', 'num_of_teachers',
                  'open_time',
                  'close_time', 'has_parking']

    def save(self, commit=True):
        kindergarten = super(KindergartenForm, self).save(commit=False)
        kindergarten.set_geolocation()
        if commit:
            kindergarten.save()
        return kindergarten


class KindergartenAdditionalInfoForm(forms.ModelForm):
    class Meta:
        model = Kindergartenadditionalinfo
        fields = ['phone', 'mail', 'description']

    def save(self, kindergarten, commit=True):
        kindergarten_addition_info = super(KindergartenAdditionalInfoForm, self).save(commit=False)
        kindergarten_addition_info.kindergarten = kindergarten
        if commit:
            kindergarten_addition_info.save()
        return kindergarten_addition_info
