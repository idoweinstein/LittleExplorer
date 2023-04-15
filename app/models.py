from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import ugettext_lazy as _


# Create your models here.


class Comment(models.Model):
    comment_id = models.AutoField(primary_key=True)
    kindergarten = models.ForeignKey('Kindergarten', models.DO_NOTHING)
    parent = models.ForeignKey('Parent', models.DO_NOTHING)
    comment = models.CharField(max_length=1500)
    grade = models.PositiveIntegerField(blank=True, null=True)
    date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'comment'


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

    class Meta:
        managed = False
        db_table = 'kindergarten'


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
    name = models.CharField(max_length=100)
    home_address = models.CharField(max_length=1000, blank=True, null=True)
    home_region = models.CharField(max_length=100, blank=True, null=True)
    work_address = models.CharField(max_length=1000, blank=True, null=True)
    work_region = models.CharField(max_length=100, blank=True, null=True)

    USERNAME_FIELD = "email"

    REQUIRED_FIELDS = []

    class Meta:
        managed = False
        db_table = 'parent'
