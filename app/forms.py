from django import forms
from django.contrib.auth.forms import UserCreationForm

from .models import Users, Comment, Kindergarten, Kindergartenadditionalinfo


class RegisterParentForm(UserCreationForm):
    home_address = forms.CharField(max_length=50, widget=forms.TextInput(attrs={'class': 'form-control'}))
    home_region = forms.CharField(max_length=50, widget=forms.TextInput(attrs={'class': 'form-control'}))
    work_address = forms.CharField(max_length=50, widget=forms.TextInput(attrs={'class': 'form-control'}))
    work_region = forms.CharField(max_length=50, widget=forms.TextInput(attrs={'class': 'form-control'}))

    class Meta:
        model = Users
        fields = ('email', 'first_name', 'last_name',
                'home_address', 'home_region', 'work_address', 'work_region',
                'password1', 'password2')

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
        self.fields['first_name'].widget.attrs['class'] = 'form-control'
        self.fields['last_name'].widget.attrs['class'] = 'form-control'
        self.fields['email'].widget.attrs['class'] = 'form-control'
        self.fields['password1'].widget.attrs['class'] = 'form-control'
        self.fields['password2'].widget.attrs['class'] = 'form-control'

        self.fields['home_address'].required = False
        self.fields['home_region'].required = False
        self.fields['work_address'].required = False
        self.fields['work_region'].required = False

        self.fields['email'].label = "Email"
        self.fields['first_name'].label = "First name"
        self.fields['last_name'].label = "Last name"
        self.fields['home_address'].label = "Home address"
        self.fields['home_region'].label = "Home city"
        self.fields['work_address'].label = "Work address"
        self.fields['work_region'].label = "Work city"
        self.fields['password1'].label = "Password"
        self.fields['password2'].label = "Repeat password"

        self.user_type = "parent"


class RegisterTeacherForm(UserCreationForm):
    class Meta:
        model = Users
        fields = ('email', 'first_name', 'last_name', 'password1', 'password2')

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

        self.fields['first_name'].widget.attrs['class'] = 'form-control'
        self.fields['last_name'].widget.attrs['class'] = 'form-control'
        self.fields['email'].widget.attrs['class'] = 'form-control'
        self.fields['password1'].widget.attrs['class'] = 'form-control'
        self.fields['password2'].widget.attrs['class'] = 'form-control'

        self.fields['email'].label = "Email"
        self.fields['first_name'].label = "First name"
        self.fields['last_name'].label = "Last name"
        self.fields['password1'].label = "Password"
        self.fields['password2'].label = "Repeat password"

        self.user_type = "teacher"


class AddCommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['comment', 'grade']
        widgets = {
            'comment': forms.Textarea(attrs={'rows': 4, 'placeholder': 'Review...'}),
            'grade': forms.HiddenInput(attrs={'required':''})
        }
        labels = {
            'comment': 'Comment',
            'grade': 'Grade - (1 - Bad, 5 - Excellent) '
        }

    def __init__(self, *args, **kwargs):
        super(AddCommentForm, self).__init__(*args, **kwargs)
        self.fields['comment'].widget.attrs['class'] = 'form-control'


class AddKindergartenForm(forms.ModelForm):
    def clean(self):
        cleaned_data = super(AddKindergartenForm, self).clean()
        kids_count = cleaned_data.get('kids_count')
        capacity = cleaned_data.get('capacity')
        if capacity and kids_count and capacity < kids_count:
            self.add_error('kids_count', "The kindergarten capacity can't be lower from the current number of children in the kindergarten.")

        min_age = cleaned_data.get('min_age')
        max_age = cleaned_data.get('max_age')
        if min_age and max_age and min_age > max_age:
            self.add_error('max_age', "The maximum age can't be lower from the minimum age.")

        return cleaned_data

    class Meta:
        model = Kindergarten
        fields = ['name', 'address', 'region', 'min_age',
                  'max_age', 'capacity', 'kids_count', 'num_of_teachers',
                  'open_time', 'close_time', 'has_parking']
        PARKING_CHOICES = [(True, 'Yes'), (False, 'No')]
        widgets = {
            'open_time': forms.TimeInput(attrs={'type': 'time'}, format='%H:%M:%S'),
            'close_time': forms.TimeInput(attrs={'type': 'time'}, format='%H:%M:%S'),
            'has_parking': forms.RadioSelect(choices=PARKING_CHOICES)
        }
    
    def __init__(self, *args, **kwargs):
        super(AddKindergartenForm, self).__init__(*args, **kwargs)
        self.fields['name'].widget.attrs['class'] = 'form-control'
        self.fields['address'].widget.attrs['class'] = 'form-control'
        self.fields['region'].widget.attrs['class'] = 'form-control'
        self.fields['min_age'].widget.attrs['class'] = 'form-control'
        self.fields['max_age'].widget.attrs['class'] = 'form-control'
        self.fields['capacity'].widget.attrs['class'] = 'form-control'
        self.fields['kids_count'].widget.attrs['class'] = 'form-control'
        self.fields['num_of_teachers'].widget.attrs['class'] = 'form-control'
        self.fields['open_time'].widget.attrs['class'] = 'form-control'
        self.fields['close_time'].widget.attrs['class'] = 'form-control'
        self.fields['has_parking'].widget.attrs['class'] = 'form-check-input'

        self.fields['has_parking'].required = False

        self.fields['name'].label = 'Name'
        self.fields['address'].label = 'Address (street name and number)'
        self.fields['region'].label = 'City'
        self.fields['min_age'].label = 'Minimal age (in months)'
        self.fields['max_age'].label = 'Maximal age (im months)'
        self.fields['capacity'].label = 'Maximum number of children'
        self.fields['kids_count'].label = 'Current number of children'
        self.fields['num_of_teachers'].label = 'Number of teachers'
        self.fields['open_time'].label = 'Opening hour'
        self.fields['close_time'].label= 'Closing hour'
        self.fields['has_parking'].label = 'Is parking available nearby?'


class AddKindergartenAdditionalInfoForm(forms.ModelForm):
    class Meta:
        model = Kindergartenadditionalinfo
        fields = ['phone', 'mail', 'description']
        widgets = {
            'description': forms.Textarea(attrs={'rows': 5, 'cols': 50, 'placeholder': 'Description about the kindergarten...'})
        }

    def __init__(self, *args, **kwargs):
        super(AddKindergartenAdditionalInfoForm, self).__init__(*args, **kwargs)
        self.fields['phone'].widget.attrs['class'] = 'form-control'
        self.fields['mail'].widget.attrs['class'] = 'form-control'
        self.fields['description'].widget.attrs['class'] = 'form-control'

        self.fields['phone'].label = 'Phone number'
        self.fields['mail'].label = 'Email address'
        self.fields['description'].label = 'This is your place to write a few words about your kindergarden!'

    def save(self, kindergarten, commit=True):
        kindergarten_addition_info = super(AddKindergartenAdditionalInfoForm, self).save(commit=False)
        kindergarten_addition_info.kindergarten = kindergarten
        if commit:
            kindergarten_addition_info.save()
        return kindergarten_addition_info