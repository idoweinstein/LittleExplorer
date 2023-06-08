from django import forms
from django.contrib.auth.forms import UserCreationForm

from .models import Users, Comment, Kindergarten


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
    def clean(self):
        cleaned_data = super(AddKindergartenForm, self).clean()
        kids_count = cleaned_data.get('kids_count')
        capacity = cleaned_data.get('capacity')
        if capacity and kids_count and capacity < kids_count:
            self.add_error('kids_count',
                           "The kindergarten capacity can't be lower from the current number of children in the kindergarten.")

        min_age = cleaned_data.get('min_age')
        max_age = cleaned_data.get('max_age')
        if min_age and max_age and min_age > max_age:
            self.add_error('max_age', "The maximum age can't be lower from the minimum age.")

        return cleaned_data

    class Meta:
        model = Kindergarten
        fields = ['name', 'address', 'region', 'min_age',
                  'max_age', 'capacity', 'kids_count', 'num_of_teachers',
                  'open_time', 'close_time', 'has_parking', 'phone', 'mail', 'description']
        PARKING_CHOICES = [(True, 'כן'), (False, 'לא')]
        widgets = {
            'open_time': forms.TimeInput(attrs={'type': 'time'}, format='%H:%M:%S'),
            'close_time': forms.TimeInput(attrs={'type': 'time'}, format='%H:%M:%S'),
            'has_parking': forms.RadioSelect(choices=PARKING_CHOICES),
            'description': forms.Textarea(attrs={'rows': 5, 'cols': 50, 'placeholder': 'תיאור הגן...'})
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
        self.fields['has_parking'].widget.attrs['class'] = 'form-control'
        self.fields['phone'].widget.attrs['class'] = 'form-control'
        self.fields['mail'].widget.attrs['class'] = 'form-control'
        self.fields['description'].widget.attrs['class'] = 'form-control'

        self.fields['has_parking'].required = False

        self.fields['name'].label = 'שם הגן'
        self.fields['address'].label = 'כתובת (רחוב ומספר)'
        self.fields['region'].label = 'עיר'
        self.fields['min_age'].label = 'גיל מינימלי לילדים בגן (בחודשים)'
        self.fields['max_age'].label = 'גיל מקסימלי לילדים בגן (בחודשים)'
        self.fields['capacity'].label = 'מספר מקומות בגן'
        self.fields['kids_count'].label = 'מספר ילדים רשומים'
        self.fields['num_of_teachers'].label = 'מספר גננות בגן'
        self.fields['open_time'].label = 'שעת פתיחה'
        self.fields['close_time'].label = 'שעת סגירה'
        self.fields['has_parking'].label = 'האם יש חניה ליד הגן?'
        self.fields['phone'].label = 'טלפון'
        self.fields['mail'].label = 'מייל'
        self.fields['description'].label = 'זה המקום לרשום לנו כמה מילים על הגן שלך!'
