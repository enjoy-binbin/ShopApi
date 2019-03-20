from datetime import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser


# 用户信息
class UserProfile(AbstractUser):
    name = models.CharField(verbose_name="姓名", max_length=30, null=True, blank=True)
    birthday = models.DateField(verbose_name='生日', null=True, blank=True)
    gender = models.CharField(verbose_name='性别', max_length=6, choices=(('male', '男'),('female', '女')), default='male')
    mobile = models.CharField(null=True, blank=True, verbose_name='电话', max_length=11)
    email = models.EmailField(verbose_name='邮箱', max_length=100, null=True, blank=True)

    class Meta:
        verbose_name = '用户'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username  # 这里返回 AbstractUser.username, 因为有时候 name会为空


# 短信验证码
class VerifyCode(models.Model):
    code = models.CharField(verbose_name='验证码', max_length=10)
    mobile = models.CharField(verbose_name='电话', max_length=11)
    add_time = models.DateTimeField(verbose_name='添加时间', default=datetime.now)

    class Meta:
        verbose_name = '短信验证码'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.code