from django.db import models
from django.contrib.auth.models import AbstractUser
from django.core.validators import MaxValueValidator, MinValueValidator
from django.utils.translation import gettext_lazy as _

from django.contrib.gis.db.models import PointField
from .geolocation import get_coordinates
from django.contrib.gis.geos import Point


# Create your models here.


class Users(AbstractUser):
    parent_id = models.AutoField(primary_key=True)
    email = models.EmailField(_('email address'), unique=True)
    password = models.CharField(max_length=16)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    home_address = models.CharField(max_length=1000, blank=True, null=True)
    home_region = models.CharField(max_length=100, blank=True, null=True)
    work_address = models.CharField(max_length=1000, blank=True, null=True)
    work_region = models.CharField(max_length=100, blank=True, null=True)
    user_type = models.CharField(max_length=100, blank=True, null=True)

    USERNAME_FIELD = "email"

    REQUIRED_FIELDS = []

    class Meta:
        managed = False
        db_table = 'users'

    def is_parent(self):
        if self.user_type == "parent":
            return True
        return False

    def is_teacher(self):
        if self.user_type == "teacher":
            return True
        return False


class Kindergarten(models.Model):
    kindergarten_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45)
    address = models.CharField(max_length=1000)
    region = models.CharField(max_length=100)
    min_age = models.PositiveSmallIntegerField()
    max_age = models.PositiveSmallIntegerField()
    capacity = models.PositiveSmallIntegerField()
    kids_count = models.PositiveSmallIntegerField()
    num_of_teachers = models.PositiveSmallIntegerField()
    open_time = models.TimeField()
    close_time = models.TimeField()
    has_parking = models.BooleanField(blank=True, null=True)
    geolocation = PointField(blank=True, null=True, srid=4326)
    teacher = models.ForeignKey(Users, models.DO_NOTHING)
    phone = models.CharField(max_length=45, blank=True, null=True)
    mail = models.EmailField(max_length=45, blank=True, null=True)
    description = models.CharField(max_length=250, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'kindergarten'

    @staticmethod
    def _months_to_display(months):
        years = months // 12
        months = months % 12
        text = []
        if years > 0:
            text.append(f"{years} year{'s' if years > 1 else ''}")
        if months > 0:
            text.append(f"{months} month{'s' if months > 1 else ''}")
        return " and ".join(text)

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

    def get_longitude(self):
        return self.geolocation.x

    def get_latitude(self):
        return self.geolocation.y

    def set_geolocation(self):
        location = f"{self.address} {self.region}"
        coordinates = get_coordinates(location)
        pnt = Point(coordinates[1], coordinates[0], srid=4326)
        self.geolocation = pnt

    def is_free(self):
        if self.kids_count < self.capacity:
            return True
        return False


class Comment(models.Model):
    comment_id = models.AutoField(primary_key=True)
    kindergarten = models.ForeignKey(Kindergarten, models.DO_NOTHING)
    parent = models.ForeignKey(Users, models.DO_NOTHING)
    comment = models.CharField(max_length=1500)
    grade = models.PositiveIntegerField(validators=[MinValueValidator(1), MaxValueValidator(5)])
    date = models.DateField()

    class Meta:
        managed = False
        db_table = 'comment'


class Connections(models.Model):
    connector = models.ForeignKey(Users, on_delete=models.DO_NOTHING, related_name='outgoing_connections',
                                  db_column='connector')
    connectee = models.ForeignKey(Users, on_delete=models.DO_NOTHING, related_name='incoming_connections',
                                  db_column='connectee')

    class Meta:
        managed = False
        db_table = 'connections'
        constraints = [
            models.UniqueConstraint(fields=['connector', 'connectee'], name='unique_connection')
        ]
