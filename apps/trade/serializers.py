# -*- coding: utf-8 -*-
import time

from rest_framework import serializers

from goods.models import Goods
from .models import ShoppingCart, OrderInfo, OrderGoods
from goods.serializers import GoodsModelSerializer, GoodsSerializer


class ShopCartDetailSerializer(serializers.ModelSerializer):
    goods = GoodsModelSerializer(many=False)

    class Meta:
        model = ShoppingCart
        fields = "__all__"


class ShopCartSerializer(serializers.Serializer):
    """ 购物车序列化类 """
    user = serializers.HiddenField(default=serializers.CurrentUserDefault())
    nums = serializers.IntegerField(required=True, min_value=1, label='数量',
                                    error_messages={
                                        'min_value': '商品数量最少为一',
                                        'required': '必填'
                                    })
    goods = serializers.PrimaryKeyRelatedField(label="商品", required=True, queryset=Goods.objects.all())

    def create(self, validated_data):
        user = self.context['request'].user
        nums = validated_data['nums']
        goods = validated_data['goods']  # 会被序列化为一个goods对象

        existed = ShoppingCart.objects.filter(user=user, goods=goods)
        if existed:
            existed = existed[0]
            existed.nums += 1
            existed.save()
        else:
            existed = ShoppingCart.objects.create(**validated_data)

        return existed

    # 因为不是继承 ModelSerializer，想修改需要重写update方法
    def update(self, instance, validated_data):
        instance.nums = validated_data['nums']
        instance.save()
        return instance

from utils.alipay import AliPay
from MxShop.settings import private_key_path, ali_pub_key_path
class OrderSerializer(serializers.ModelSerializer):
    user = serializers.HiddenField(default=serializers.CurrentUserDefault())
    pay_status = serializers.CharField(read_only=True)
    order_sn = serializers.CharField(read_only=True)
    trade_no = serializers.CharField(read_only=True)
    pay_time = serializers.CharField(read_only=True)
    add_time = serializers.CharField(read_only=True)
    alipay_url = serializers.SerializerMethodField(read_only=True)

    def get_alipay_url(self, obj):  # obj为这个serializer对象
        alipay = AliPay(
            appid="2016091400506109",
            app_notify_url="http://119.29.27.194:8005/alipay/return/",  # POST异步请求url
            app_private_key_path=private_key_path,  # 私钥路径
            alipay_public_key_path=ali_pub_key_path,  # 支付宝的公钥路径，验证支付宝回传消息使用，不是你自己的公钥
            debug=True,  # 默认False, True为调用沙箱url
            return_url="http://119.29.27.194:8005/alipay/return/"  # GET同步请求url
        )
        url = alipay.direct_pay(
            subject=obj.order_sn,  # 订单标题
            out_trade_no=obj.order_sn,  # 自己创建的不重复的订单号
            total_amount=obj.order_mount  # 价格总计
        )
        re_url = "https://openapi.alipaydev.com/gateway.do?{data}".format(data=url)

        return re_url

    # 生成订单编号
    def generate_order_sn(self):
        # 时间戳 + userid + 随机数
        from random import Random
        ram_ins = Random()
        order_sn = "{time_str}{userid}{ranstr}".format(time_str=time.strftime("%Y%m%d%H%M%S"), userid=self.context['request'].user.id, ranstr=ram_ins.randint(10,99))
        return order_sn

    def validate(self, attrs):
        attrs['order_sn'] = self.generate_order_sn()
        return attrs

    class Meta:
        model = OrderInfo
        fields = '__all__'


class OrderGoodsSerializer(serializers.ModelSerializer):
    goods = GoodsModelSerializer(many=False)

    class Meta:
        model = OrderGoods
        fields = '__all__'


class OrderDetailSerializer(serializers.ModelSerializer):
    goods = OrderGoodsSerializer(many=True)
    alipay_url = serializers.SerializerMethodField(read_only=True)

    def get_alipay_url(self, obj):  # obj为这个serializer对象
        alipay = AliPay(
            appid="2016091400506109",
            app_notify_url="http://119.29.27.194:8005/alipay/return/",  # POST异步请求url
            app_private_key_path=private_key_path,  # 私钥路径
            alipay_public_key_path=ali_pub_key_path,  # 支付宝的公钥路径，验证支付宝回传消息使用，不是你自己的公钥
            debug=True,  # 默认False, True为调用沙箱url
            return_url="http://119.29.27.194:8005/alipay/return/"  # GET同步请求url
        )
        url = alipay.direct_pay(
            subject=obj.order_sn,  # 订单标题
            out_trade_no=obj.order_sn,  # 自己创建的不重复的订单号
            total_amount=obj.order_mount  # 价格总计
        )
        re_url = "https://openapi.alipaydev.com/gateway.do?{data}".format(data=url)

        return re_url

    class Meta:
        model = OrderInfo
        fields = '__all__'


