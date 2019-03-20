# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-06-08 12:55
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('goods', '0002_auto_20180531_1931'),
        ('user_operation', '0002_auto_20180530_2156'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='userfav',
            unique_together=set([('user', 'goods')]),
        ),
    ]
