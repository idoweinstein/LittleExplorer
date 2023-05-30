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

        self.fields['email'].widget.attrs['class'] = 'form-control'
        self.fields['password1'].widget.attrs['class'] = 'form-control'
        self.fields['password2'].widget.attrs['class'] = 'form-control'

        self.fields['email'].label = "אימייל"
        self.fields['first_name'].label = "שם פרטי"
        self.fields['last_name'].label = "שם משפחה"
        self.fields['password1'].label = "סיסמה"
        self.fields['password2'].label = "חזור על הסיסמה"

        self.user_type = "teacher"


class AddCommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['comment', 'grade']
        widgets = {
            'comment': forms.Textarea(attrs={'rows': 10, 'cols': 50, 'placeholder': 'תגובה...'}),
            'grade': forms.HiddenInput()
        }
        labels = {
            'comment': 'תגובה',
            'grade': 'ציון- (1 - גרוע מאוד, 5 - מצוין) '
        }


class AddKindergartenForm(forms.ModelForm):
    class Meta:
        model = Kindergarten
        fields = ['name', 'address', 'region', 'min_age',
                  'max_age', 'capacity', 'kids_count', 'num_of_teachers',
                  'open_time', 'close_time', 'has_parking']
        PARKING_CHOICES = [(True, 'כן'), (False, 'לא')]
        widgets = {
            'open_time': forms.TimeInput(attrs={'type': 'time'}, format='%H:%M:%S'),
            'close_time': forms.TimeInput(attrs={'type': 'time'}, format='%H:%M:%S'),
            'has_parking': forms.RadioSelect(choices=PARKING_CHOICES)
        }

        labels = {
            'name': 'שם הגן',
            'address': 'כתובת (רחוב ומספר)',
            'region': 'עיר',
            'min_age': 'גיל מינימלי לילדים בגן (בחודשים)',
            'max_age': 'גיל מקסימלי לילדים בגן (בחודשים)',
            'capacity': 'כמות מקסימלית של ילדים בגן',
            'kids_count': 'כמה ילדים כבר יש בגן היום?',
            'num_of_teachers': 'מספר גננות בגן',
            'open_time': 'שעת פתיחה',
            'close_time': 'שעת סגירה',
            'has_parking': 'האם יש חניה ליד הגן?',
        }

    def clean(self):
        cleaned_data = super(AddKindergartenForm, self).clean()
        kids_count = cleaned_data.get('kids_count')
        capacity = cleaned_data.get('capacity')
        if capacity < kids_count:
            self.add_error('kids_count', "The kindergarten capacity can't be lower from the current number of children in the kindergarten.")

        min_age = cleaned_data.get('min_age')
        max_age = cleaned_data.get('max_age')
        if min_age > max_age:
            self.add_error('max_age', "The maximum age can't be lower from the minimum age.")

        return cleaned_data


class AddKindergartenAdditionalInfoForm(forms.ModelForm):
    class Meta:
        model = Kindergartenadditionalinfo
        fields = ['phone', 'mail', 'description']
        labels = {
            'phone': 'טלפון',
            'mail': 'מייל',
            'description': 'זה המקום לרשום לנו כמה מילים על הגן שלך!',
        }
        widgets = {
            'description': forms.Textarea(attrs={'rows': 10, 'cols': 50, 'placeholder': 'תיאור הגן...'})
        }

    def save(self, kindergarten, commit=True):
        kindergarten_addition_info = super(AddKindergartenAdditionalInfoForm, self).save(commit=False)
        kindergarten_addition_info.kindergarten = kindergarten
        if commit:
            kindergarten_addition_info.save()
        return kindergarten_addition_info