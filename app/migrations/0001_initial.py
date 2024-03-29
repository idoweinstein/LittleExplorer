# Generated by Django 3.2.19 on 2023-06-08 11:05

import django.contrib.auth.models
import django.contrib.auth.validators
import django.contrib.gis.db.models.fields
import django.core.validators
from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Users',
            fields=[
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=150, unique=True, validators=[django.contrib.auth.validators.UnicodeUsernameValidator()], verbose_name='username')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('parent_id', models.AutoField(primary_key=True, serialize=False)),
                ('email', models.EmailField(max_length=254, unique=True, verbose_name='email address')),
                ('password', models.CharField(max_length=16)),
                ('first_name', models.CharField(max_length=150)),
                ('last_name', models.CharField(max_length=150)),
                ('home_address', models.CharField(blank=True, max_length=1000, null=True)),
                ('home_region', models.CharField(blank=True, max_length=100, null=True)),
                ('work_address', models.CharField(blank=True, max_length=1000, null=True)),
                ('work_region', models.CharField(blank=True, max_length=100, null=True)),
                ('user_type', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'users',
                'managed': False,
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('comment_id', models.AutoField(primary_key=True, serialize=False)),
                ('comment', models.CharField(max_length=1500)),
                ('grade', models.PositiveIntegerField(validators=[django.core.validators.MinValueValidator(1), django.core.validators.MaxValueValidator(5)])),
                ('date', models.DateField()),
            ],
            options={
                'db_table': 'comment',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Connections',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'db_table': 'connections',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Kindergarten',
            fields=[
                ('kindergarten_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=45)),
                ('address', models.CharField(max_length=1000)),
                ('region', models.CharField(max_length=100)),
                ('min_age', models.PositiveSmallIntegerField()),
                ('max_age', models.PositiveSmallIntegerField()),
                ('capacity', models.PositiveSmallIntegerField()),
                ('kids_count', models.PositiveSmallIntegerField()),
                ('num_of_teachers', models.PositiveSmallIntegerField()),
                ('open_time', models.TimeField()),
                ('close_time', models.TimeField()),
                ('has_parking', models.BooleanField(blank=True, null=True)),
                ('geolocation', django.contrib.gis.db.models.fields.PointField(blank=True, null=True, srid=4326)),
                ('phone', models.CharField(blank=True, max_length=45, null=True)),
                ('mail', models.EmailField(blank=True, max_length=45, null=True)),
                ('description', models.CharField(blank=True, max_length=250, null=True)),
            ],
            options={
                'db_table': 'kindergarten',
                'managed': False,
            },
        ),
    ]
