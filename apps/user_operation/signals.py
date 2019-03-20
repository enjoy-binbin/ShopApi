# -*- coding: utf-8 -*-

# 信号量操作，会使代码的分离性更好
# 需要在 app里的 apps 里 定义ready方法，将signals文件import
# def ready(self):
#     import users.signals

from django.db.models.signals import post_save, post_delete
from django.dispatch import receiver
from rest_framework.authtoken.models import Token

from .models import UserFav


@receiver(post_save, sender=UserFav)
def create_userfav(sender, instance=None, created=False, **kwargs):
    if created:  # 如果UserFav首次创建 这个会有Ture，否则会为false
        good = instance.goods
        good.fav_num += 1  # 增加收藏
        good.save()


@receiver(post_delete, sender=UserFav)
def delete_userfav(sender, instance=None, created=False, **kwargs):
    good = instance.goods
    good.fav_num -= 1  # 减少收藏
    good.save()