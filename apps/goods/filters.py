# -*- coding: utf-8 -*-

import django_filters
from django.db.models import Q

from .models import Goods


# 商品的过滤类
class GoodsFilter(django_filters.rest_framework.FilterSet):
    # 相当于是执行 Goods.object.filter(shop_price__gte=)
    pricemin = django_filters.NumberFilter(name='shop_price', lookup_expr='gte')
    pricemax = django_filters.NumberFilter(name='shop_price', lookup_expr='lte')
    # sql里的模糊查询, icontains 忽略大小写, 不置顶lookup_expr就是全部匹配
    name = django_filters.CharFilter(name='name', lookup_expr='contains')

    # 结合vue了，获取一级分类, 字段要和 前端提供的字段适应
    top_category = django_filters.NumberFilter(method="top_category_filter")

    # 这几个参数是默认会传进来， value == category.id, 父category.id, ...
    def top_category_filter(self, queryset, name, value):
        queryset = queryset.filter(Q(category_id=value) | Q(category__parent_category_id=value) | Q(
            category__parent_category__parent_category_id=value))
        return queryset

    class Meta:
        model = Goods
        fields = ['pricemin', 'pricemax', 'name', 'is_hot', 'is_new']
