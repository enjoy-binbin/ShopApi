from rest_framework import viewsets
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication  # jwt认证
from rest_framework.authentication import SessionAuthentication  # login后的session

from .serializers import UserFavSerializer, UserFavDetailSerializer
from .models import UserFav
from utils.permissions import IsOwnerOrReadOnly

class UserFavViewset(mixins.CreateModelMixin, mixins.ListModelMixin, mixins.RetrieveModelMixin, 
                     mixins.DestroyModelMixin,
                     viewsets.GenericViewSet):
    """
    list:
        获取用户收藏列表
    retrieve:
        判断商品是否已经收藏
    create:
        收藏商品
    """

    # serializer_class = UserFavSerializer
    # queryset = UserFav.objects.all()
    # 权限检查    # IsAuthenticated未登录返回 身份认证信息未提供
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)  # IsOwnerOrReadOnly在删除的时候会验证
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    lookup_field = 'goods_id'  # 外键 根据goods的id查找记录，而不是根据 UserFav.id查找

    # 这样就不能获取全部的 UserFav.objects.all了
    def get_queryset(self):
        return UserFav.objects.filter(user=self.request.user)

    def get_serializer_class(self):
        if self.action == 'list':
            return UserFavDetailSerializer
        elif self.action == 'create':
            return UserFavSerializer

        return UserFavSerializer

    # 重写，在create用户收藏的时候，给商品收藏数加1
    # 或者可以使用信号量，详看 user_operation.signals
    # def perform_create(self, serializer):
    #     instance = serializer.save()
    #     good = instance.goods
    #     good.fav_num += 1
    #     good.save()



from .serializers import LeavingMessageSerializer
from .models import UserLeavingMessage
class LeavingMessageViewset(mixins.DestroyModelMixin, mixins.ListModelMixin, mixins.CreateModelMixin,
                            viewsets.GenericViewSet):
    """
    list:
        获取用户留言
    create:
        添加留言
    delete:
        删除留言
    """
    serializer_class = LeavingMessageSerializer
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)  # IsOwnerOrReadOnly在删除的时候会验证
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)

    def get_queryset(self):
        return UserLeavingMessage.objects.filter(user=self.request.user)


from .models import UserAddress
from .serializers import AddressSerializer
# class AddressViewset(mixins.ListModelMixin, mixins.CreateModelMixin, mixins.DestroyModelMixin,
#                      mixins.UpdateModelMixin, viewsets.GenericViewSet):
class AddressViewset(viewsets.ModelViewSet):
    """
    list:
        获取用户收获地址
    create:
        新增收货地址
    delete:
        删除收获地址
    update:
        更新收货地址
    """
    serializer_class = AddressSerializer
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)  # IsOwnerOrReadOnly在删除的时候会验证
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)

    def get_queryset(self):
        return UserAddress.objects.filter(user=self.request.user)
