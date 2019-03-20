# -*- coding: utf-8 -*-

# 在rest_framework中用来取代 django的 froms
# serializer针对json， froms针对html
from rest_framework import serializers
from goods.models import IndexAd

class GoodsSerializer(serializers.Serializer):
    # 用两个字段简单的演示, 自己设置 和 goods.model保持一致
    name = serializers.CharField(required=True, max_length=100)
    click_num = serializers.IntegerField(default=0)
    # 相较于django的序列化, 路径会帮你自动加上settings.media
    goods_front_image = serializers.ImageField()

    # 重载create方法，可以保存字段, 会将上面的字段传入 validated_data
    # 如果需要在前端增加一个 添加商品的接口就可以这样写
    def create(self, validated_data):
        return goods.objects.create(**validated_data)


from goods.models import Goods, GoodsCategory

class CategoryModelSerializer3(serializers.ModelSerializer):
    class Meta:
        model = GoodsCategory
        fields = '__all__'


class CategoryModelSerializer2(serializers.ModelSerializer):
    sub_cat = CategoryModelSerializer3(many=True)
    class Meta:
        model = GoodsCategory
        fields = '__all__'


class CategoryModelSerializer(serializers.ModelSerializer):
    # 在model里定义的related_name
    # 要和 在model里定义的related_name 值相等
    # 根据一类 获取 二类  要传入 many=True
    sub_cat = CategoryModelSerializer2(many=True)
    class Meta:
        model = GoodsCategory
        fields = '__all__'


from .models import GoodsImage
class GoodsImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = GoodsImage
        fields = ('image',)


# class CategoryModelSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = GoodsCategory
#         fields = '__all__'
class GoodsModelSerializer(serializers.ModelSerializer):
    # 原先是显示主键，可以这样字覆盖，序列化的嵌套
    category = CategoryModelSerializer()  # 嵌套序列化
    images = GoodsImageSerializer(many=True)

    class Meta:
        model = Goods  # 通过model做的映射
        # fields = ('name', 'click_num')  # 可以指明字段
        fields = '__all__'  # 取出全部字段



from goods.models import Banner
class BannerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Banner
        fields = '__all__'



from .models import GoodsCategoryBrand
class BrandSerializer(serializers.ModelSerializer):
    class Meta:
        model = GoodsCategoryBrand
        fields = '__all__'


from django.db.models import Q

# 首页 商品分类序列化
class IndexCategorySerializer(serializers.ModelSerializer):
    # 在brands表里有一个外键指向 category, 所以一个cate会对应多个brand
    brands = BrandSerializer(many=True)
    # 这样取不到数据，因为这里取的是第一级分类，而商品分类的时候会有许多子级分类
    # goods = GoodsSerializer()
    goods = serializers.SerializerMethodField()
    sub_cat = CategoryModelSerializer2(many=True)
    ad_goods = serializers.SerializerMethodField()

    def get_ad_goods(self, obj):
        goods_json = {}
        ad_goods = IndexAd.objects.filter(category_id=obj.id)
        if ad_goods:
            good_ins = ad_goods[0].goods
            goods_json = GoodsModelSerializer(good_ins, many=False).data
        return goods_json


    def get_goods(self, obj):
        all_goods = Goods.objects.filter(Q(category_id=obj.id) | Q(category__parent_category_id=obj.id) | Q(
            category__parent_category__parent_category_id=obj.id))
        goods_serializer = GoodsModelSerializer(all_goods, many=True)
        return goods_serializer.data

    class Meta:
        model = GoodsCategory
        fields = '__all__'
