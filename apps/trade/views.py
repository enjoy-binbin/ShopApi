import time

from django.shortcuts import redirect
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.authentication import SessionAuthentication
from rest_framework import mixins

from .serializers import ShopCartSerializer, ShopCartDetailSerializer, OrderSerializer, OrderDetailSerializer
from utils.permissions import IsOwnerOrReadOnly
from .models import ShoppingCart, OrderInfo, OrderGoods


class ShoppingCartView(viewsets.ModelViewSet):
    """
    list:
        获取购物车详情
    create:
        加入购物车
    delete:
        删除购物记录
    """
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    serializer_class = ShopCartSerializer
    lookup_field = 'goods_id'
    # queryset = ShoppingCart.objects.all()
    def get_queryset(self):
        return ShoppingCart.objects.filter(user=self.request.user)

    def get_serializer_class(self):
        if self.action == 'list':
            return ShopCartDetailSerializer
        else:
            return ShopCartSerializer

    # 商品库存，当加入购物车时，便将库存量减去购物车商品数量
    def perform_create(self, serializer):
        shop_cart = serializer.save()
        goods = shop_cart.goods
        goods.goods_num -= shop_cart.nums
        goods.save()

    def perform_destroy(self, instance):
        goods = instance.goods
        goods.goods_num += instance.nums
        goods.save()
        instance.delete()

    def perform_update(self, serializer):
        existed_record = ShoppingCart.objects.get(id=serializer.instance.id)
        existed_nums = existed_record.nums  # 修改保存前的数量

        saved_record = serializer.save()  # 修改后的
        nums = saved_record.nums - existed_nums

        goods = saved_record.goods
        goods.goods_num -= nums  # 修改商品库存
        goods.save()


# 订单一般不允许修改，所以不需要update方法
class OrderViewset(mixins.RetrieveModelMixin, mixins.ListModelMixin, mixins.DestroyModelMixin, mixins.CreateModelMixin, viewsets.GenericViewSet):
    """
    订单管理
    list:
        订单列表
    create:
        新增订单
    delete:
        删除订单
    """
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    serializer_class = OrderSerializer

    def get_queryset(self):
        return OrderInfo.objects.filter(user=self.request.user)

    def get_serializer_class(self):
        if self.action == 'retrieve':
            return OrderDetailSerializer
        return OrderSerializer

    # 在save之前，创建订单，清空购物车
    def perform_create(self, serializer):
        order = serializer.save()
        shop_carts = ShoppingCart.objects.filter(user=self.request.user)
        for shop_cart in shop_carts:
            order_goods = OrderGoods()
            order_goods.goods = shop_cart.goods
            order_goods.goods_num = shop_cart.nums
            order_goods.order = order
            order_goods.save()
            shop_cart.delete()
        return order


from rest_framework.views import APIView
from utils.alipay import AliPay
from MxShop.settings import ali_pub_key_path, private_key_path
from datetime import datetime
from rest_framework.response import Response
class AlipayView(APIView):
    def get(self, request):
        # 处理支付宝的 return_url
        processed_dict = {}
        for key, value in request.GET.items():
            processed_dict[key] = value

        sign = processed_dict.pop('sign', None)  # 得将sign pop出来

        alipay = AliPay(
            appid="2016091400506109",
            app_notify_url="http://119.29.27.194:8005/alipay/return/",  # POST异步请求url
            app_private_key_path=private_key_path,  # 私钥路径
            alipay_public_key_path=ali_pub_key_path,  # 支付宝的公钥路径，验证支付宝回传消息使用，不是你自己的公钥
            debug=True,  # 默认False, True为调用沙箱url
            return_url="http://119.29.27.194:8005/alipay/return/"  # GET同步请求url
        )
        verify_res = alipay.verify(processed_dict, sign)

        if verify_res:
            order_sn = processed_dict.get('out_trade_no', None)
            trade_no = processed_dict.get('trade_no', None)
            # trade_status = processed_dict.get('trade_status', None)

            existed_orders = OrderInfo.objects.filter(order_sn=order_sn)
            for existed_order in existed_orders:
                # 更新订单信息，将支付宝返回的一些信息更新进数据库
                # existed_order.pay_status = trade_status
                existed_order.trade_no = trade_no
                existed_order.pay_time = datetime.now()
                existed_order.save()
            # return Response('success')  # 返回一个success给支付宝

            response = redirect('index')  # 跳转到 vue的首页
            # 设置 cookie, 在vue那接收到后进行下一个url的跳转
            response.set_cookie('nextPath', 'pay', max_age=2)
            return response
        else:
            response = redirect('index')
            return response

    def post(self, request):
        # 处理支付宝的 notify_url, 在支付成功后支付宝会POST进来
        # 通过debug时可以看出数据是放在 request.POST里，可以一个个str
        processed_dict = {}
        for key, value in request.POST.items():
            processed_dict[key] = value

        sign = processed_dict.pop('sign', None)  # 得将sign pop出来

        alipay = AliPay(
            appid = "2016091400506109",
            app_notify_url = "http://119.29.27.194:8005/alipay/return/",  # POST异步请求url
            app_private_key_path = private_key_path,  # 私钥路径
            alipay_public_key_path = ali_pub_key_path,  # 支付宝的公钥路径，验证支付宝回传消息使用，不是你自己的公钥
            debug = True,  # 默认False, True为调用沙箱url
            return_url = "http://119.29.27.194:8005/alipay/return/"  # GET同步请求url
        )
        verify_res = alipay.verify(processed_dict, sign)

        if verify_res:
            order_sn = processed_dict.get('out_trade_no', None)
            trade_no = processed_dict.get('trade_no', None)
            trade_status = processed_dict.get('trade_status', None)

            existed_orders = OrderInfo.objects.filter(order_sn=order_sn)
            for existed_order in existed_orders:
                # 修改商品售出数量
                order_goods = existed_order.goods.all()  # 用related_name反向取
                for order_good in order_goods:
                    goods = order_good.goods
                    goods.sold_num += order_good.goods_num
                    goods.save()

                # 更新订单信息，将支付宝返回的一些信息更新进数据库
                existed_order.pay_status = trade_status
                existed_order.trade_no = trade_no
                existed_order.pay_time = datetime.now()
                existed_order.save()

            return Response('success')  # 返回一个success给支付宝
