# -*- coding: utf-8 -*-
from rest_framework import serializers
from rest_framework.validators import UniqueTogetherValidator

from .models import UserFav

class UserFavSerializer(serializers.ModelSerializer):
    """ 用户收藏序列化 """
    # 覆盖user, 获取当前登陆的用户
    user = serializers.HiddenField(
        default = serializers.CurrentUserDefault()
    )

    class Meta:
        model = UserFav
        fields = ('user', 'goods', 'id')  # 添加id是后面取消收藏要用
        # 可以写在meta里，也可以在model里设置 unique_together
        validators = [
            UniqueTogetherValidator(
                queryset=UserFav.objects.all(),
                fields=('user', 'goods'),
                message="已收藏"  # cuowu
            )
        ]

from goods.serializers import GoodsModelSerializer  # 嵌套
class UserFavDetailSerializer(serializers.ModelSerializer):
    """ 用户收藏列表显示 序列化 """
    goods = GoodsModelSerializer()

    class Meta:
        model = UserFav
        fields = ('goods', 'id')


from .models import UserLeavingMessage
class LeavingMessageSerializer(serializers.ModelSerializer):
    """ 用户留言序列化类 """
    user = serializers.HiddenField(  # 获取当前用户
        default=serializers.CurrentUserDefault()
    )

    add_time = serializers.DateTimeField(format('%Y-%m-%d %H:%M:%S'), read_only=True)  # 只返回，不提交。

    class Meta:
        model = UserLeavingMessage
        fields = ('id', 'user', 'message_type', 'subject', 'message', 'file', 'add_time')


from .models import UserAddress
class AddressSerializer(serializers.ModelSerializer):
    add_time = serializers.DateTimeField(read_only=True)
    user = serializers.HiddenField(default=serializers.CurrentUserDefault())
    class Meta:
        model = UserAddress
        # fields = ('id', 'user', 'province', 'city', 'district', 'address', 'add_time', 'signer_name', 'signer_mobile')
        fields = '__all__'