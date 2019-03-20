from django.shortcuts import render

# Create your views here.
from django.contrib.auth.backends import ModelBackend
from django.contrib.auth import get_user_model
from django.db.models import Q

User = get_user_model()


# 自定义用户认证类
class CustomBackend(ModelBackend):
    # 重写这个函数
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = User.objects.get(Q(username=username) | Q(mobile=username))
            if user.check_password(password):  # 加密比对密码是否相等
                return user
        except Exception as e:
            return None



# 利用云片网发送手机验证码, 会往model里create数据，所以用了CreateModelMixin
from .models import VerifyCode
from rest_framework.mixins import CreateModelMixin
from rest_framework import viewsets
from .serializers import SmsSerializer
from rest_framework.response import Response
from rest_framework import status
from utils.yunpian import YunPian
from MxShop.settings import APIKEY
from random import choice
class SmsCodeViewSet(CreateModelMixin, viewsets.GenericViewSet):
    '''利用云片网发送短信验证码'''
    serializer_class = SmsSerializer

    # 重载 CreateModelMixin里的 create方法
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        # 加入自己的逻辑
        yunpian = YunPian(APIKEY)
        mobile = serializer.validated_data['mobile']
        code = self.generate_code()

        sms_status = yunpian.send_sms(code=code, mobile=mobile)

        if sms_status['code'] == 0:
            code_record = VerifyCode(code=code, mobile=mobile)
            code_record.save()

            return Response({
                'mobile': mobile
            }, status=status.HTTP_201_CREATED)  # 成功
        else:
            return Response({
                'mobile': sms_status['msg']
            }, status=status.HTTP_400_BAD_REQUEST)


    # 随机生成四位验证码
    def generate_code(self):
        seeds = '1234567890'
        random_str = []
        for i in range(4):
            random_str.append(choice(seeds))
        return "".join(random_str)


from .serializers import UserRegSerializer, UserDetailSerializer
# json web token
from rest_framework_jwt.serializers import jwt_encode_handler, jwt_payload_handler
from rest_framework import mixins
from rest_framework import permissions
from rest_framework import authentication
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
# 用户注册                                                put
class UserViewset(CreateModelMixin, mixins.UpdateModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    serializer_class = UserRegSerializer
    queryset = User.objects.all()
    authentication_classes = (JSONWebTokenAuthentication, authentication.SessionAuthentication, )

    def get_serializer_class(self):
        if self.action == 'retrieve':  # 只有viewset才有这个action
            return UserDetailSerializer
        elif self.action == 'create':
            return UserRegSerializer
        return UserDetailSerializer

    # permission, 在用户访问这个viewset里的所有方法，都必须要登陆
    # permission_classes = (permissions.IsAuthenticated, )
    def get_permissions(self):
        # 根据行为动态设置permission
        if self.action == 'retrieve':  # 只有viewset才有这个action
            return [permissions.IsAuthenticated()]
        elif self.action == 'create':
            return []
        return []

    # 重载CreateModelMixin里的 create方法
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        # 通过 user生成一个 json web token，并且根据前端的要求 将token返回
        user = self.perform_create(serializer)
        payload = jwt_payload_handler(user)

        re_dict = serializer.data  # 定制化返回的数据
        re_dict['token'] = jwt_encode_handler(payload)
        re_dict['name'] = user.name if user.name else user.username

        headers = self.get_success_headers(serializer.data)
        return Response(re_dict, status=status.HTTP_201_CREATED, headers=headers)
        # return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    def get_object(self):  # users/id --> users/乱填 都会return 当期的user
        return self.request.user

    # 重载这个函数，返回一个user 对象
    def perform_create(self, serializer):
        # serializer.save()
        return serializer.save()