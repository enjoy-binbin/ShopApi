# -*- coding: utf-8 -*-
import re
from datetime import datetime
from datetime import timedelta

from rest_framework import serializers
from django.contrib.auth import get_user_model

from MxShop.settings import REGEX_MOBILE
from .models import VerifyCode

User = get_user_model()

# 这里 不用 modelSerializer, 因为model里的code是必填字段
# 这里只需要验证 手机号码是否合法，是否已注册
class SmsSerializer(serializers.Serializer):
    mobile = serializers.CharField(max_length=11)

    # 对mobile字段进行验证函数, validate_字段名
    def validate_mobile(self, mobile):
        # 验证手机号是否合法
        if not re.match(REGEX_MOBILE, mobile):
            raise serializers.ValidationError('手机号不合法')

        # 手机是否已注册 查询userprofile表
        if User.objects.filter(mobile=mobile).count():
            raise serializers.ValidationError("手机号已注册")

        # 验证 信息间隔时间
        one_min_ago = datetime.now() - timedelta(hours=0, minutes=1, seconds=0)
        if VerifyCode.objects.filter(add_time__gt=one_min_ago, mobile=mobile):
            raise serializers.ValidationError('间隔一分钟发送')

        return mobile


from rest_framework.validators import UniqueValidator
class UserRegSerializer(serializers.ModelSerializer):
    code = serializers.CharField(help_text='验证码', required=True, max_length=4, min_length=4,
                                 write_only=True, label="验证码",  # write_only 表示字段在 return response不会被序列化
                                 error_messages={
                                     'blank': '请输入验证码',  # 针对 code字段都没传入, 传了空字符串也算
                                     "required": '请输入验证码',  # 字段名称都没传
                                     "max_length": '最大四个',
                                     'min_length': '最少四个'
                                 })  # 在model里没有，所以我们自己定义
    username = serializers.CharField(required=True, allow_blank=False, label='用户名',
                                     validators=[UniqueValidator(queryset=User.objects.all(),
                                                                 message='用户已存在')])
    password = serializers.CharField(style={'input_type': 'password'}, label="密码", write_only=True)

    # 重载create方法，将密码加密再save
    # 可以写到 信号量那里， @receiver(post_save)
    # def create(self, validated_data):
    #     user = super(UserRegSerializer, self).create(validated_data=validated_data)
    #     user.set_password(validated_data['password'])
    #     user.save()
    #     return user

    # 验证验证码
    def validate_code(self, code):
        # 如果用get，需要捕获异常
        # try:
        #     verify_records = VerifyCode.objects.get(mobile=self.initial_data['username'], code=code)
        # except VerifyCode.DoesNotExist as e:
        #     pass
        # except VerifyCode.MultipleObjectsReturned as e:
        #     pass

        verify_records = VerifyCode.objects.filter(mobile=self.initial_data['username']).order_by('-add_time')
        if verify_records:
            last_record = verify_records[0]  # 获取最后一条
            five_min_ago = datetime.now() - timedelta(hours=0, minutes=5, seconds=0)
            if five_min_ago > last_record.add_time:
                raise serializers.ValidationError('验证码过期')

            if last_record.code != code:
                raise serializers.ValidationError('验证码错误')
            # return code  # 可以不return, 因为不用存入数据库
        else:
            raise serializers.ValidationError('请先获取验证码')

    # 作用于所有的字段之上 attrs是所有字段validate之后返回的一个总的dict
    def validate(self, attrs):
        attrs['mobile'] = attrs['username']
        del attrs['code']
        return attrs

    class Meta:
        model = User
        fields = ('username', 'code', 'mobile', 'password')


# 用户详情序列化类
class UserDetailSerializer(serializers.ModelSerializer):
    """ 用户详情序列化类 """
    class Meta:
        model = User
        fields = ('name', 'gender', 'birthday', 'email', 'mobile')