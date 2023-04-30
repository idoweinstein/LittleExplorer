from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext_lazy as _

from django.contrib.gis.db.models import PointField


# Create your models here.


class Kindergarten(models.Model):
    kindergarten_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45)
    address = models.CharField(max_length=1000)
    region = models.CharField(max_length=100)
    min_age = models.PositiveSmallIntegerField()
    max_age = models.PositiveSmallIntegerField()
    capacity = models.PositiveSmallIntegerField()
    kids_count = models.PositiveSmallIntegerField(blank=True, null=True)
    num_of_teachers = models.PositiveSmallIntegerField()
    open_time = models.TimeField()
    close_time = models.TimeField()
    has_parking = models.PositiveIntegerField(blank=True, null=True)
    geolocation = PointField(blank=True, null=True, srid=4326)

    class Meta:
        managed = False
        db_table = 'kindergarten'

    @staticmethod
    def _months_to_display(months):
        years = months // 12
        months = months % 12
        text = []
        if years > 0:
            text.append("שנה" if years == 1 else f"{years} שנים")
        if months > 0:
            text.append("חודש" if months == 1 else f"{months} חודשים")
        return " ו-".join(text).replace("ו-חודש", "וחודש")

    def get_min_age_display(self):
        return Kindergarten._months_to_display(self.min_age)

    def get_max_age_display(self):
        return Kindergarten._months_to_display(self.max_age)

    def get_open_time_display(self):
        return self.open_time.isoformat(timespec="minutes")

    def get_close_time_display(self):
        return self.close_time.isoformat(timespec="minutes")

    def ratio_children_teachers(self):
        return round(self.capacity / self.num_of_teachers, 2)

    def display_ratio_children_teachers(self):
        return str(self.capacity) + ' : ' + str(self.num_of_teachers)


class Kindergartenadditionalinfo(models.Model):
    kindergarten = models.OneToOneField(Kindergarten, models.DO_NOTHING, primary_key=True)
    phone = models.CharField(max_length=45, blank=True, null=True)
    mail = models.CharField(max_length=45, blank=True, null=True)
    description = models.CharField(max_length=250, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'kindergartenadditionalinfo'


class Parent(AbstractUser):
    parent_id = models.AutoField(primary_key=True)
    email = models.EmailField(_('email address'), unique=True)
    password = models.CharField(max_length=16)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    home_address = models.CharField(max_length=1000, blank=True, null=True)
    home_region = models.CharField(max_length=100, blank=True, null=True)
    work_address = models.CharField(max_length=1000, blank=True, null=True)
    work_region = models.CharField(max_length=100, blank=True, null=True)

    USERNAME_FIELD = "email"

    REQUIRED_FIELDS = []

    class Meta:
        managed = False
        db_table = 'parent'


class Comment(models.Model):
    comment_id = models.AutoField(primary_key=True)
    kindergarten = models.ForeignKey(Kindergarten, models.DO_NOTHING)
    parent = models.ForeignKey(Parent, models.DO_NOTHING)
    comment = models.CharField(max_length=1500)
    grade = models.PositiveIntegerField(blank=True, null=True)
    date = models.DateField()

    class Meta:
        managed = False
        db_table = 'comment'
