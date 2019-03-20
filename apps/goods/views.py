from django.shortcuts import render
from django.views.generic.base import View
# from django.views.generic import ListView


from goods.models import Goods


# 基于django的View --》 商品列表页
# 先用django的view返回 json数据
class GoodsListView1(View):
    def get(self, request):
        goods = Goods.objects.all()[:10]
        json_list = []
        for good in goods:
            # 这里如果字段过多，一个个写是很麻烦的
            # 而且对于 datetime， image 等一些类型在序列化时会出错
            # 所以引入 django restframework
            json_dict = {}
            json_dict['name'] = good.name
            json_dict['category'] = good.category.name
            json_dict['market_price'] = good.market_price
            json_list.append(json_dict)

        # 这里django提供了一个方法，可以将 model转换为dict, 而且可以取出所有字段
        # from django.forms.models import model_to_dict
        # for good in goods:
        #     json_dict = model_to_dict(good)
        #     json_list.append(json_dict)

        import json
        from django.http import HttpResponse
        return HttpResponse(json.dumps(json_list), content_type='application/json')


# serializers序列化
class GoodsListView2(View):
    def get(self, request):
        goods = Goods.objects.all()[:10]

        # django里提供的用来处理 序列户的函数
        from django.core import serializers
        import json

        json_data = serializers.serialize('json', goods)  # 可以直接将goods序列化成json
        # json_data = json.loads(json_data)
        from django.http import HttpResponse
        # return HttpResponse(json.dumps(json_data), content_type='application/json')
        # return HttpResponse(json_data, content_type='application/json')
        from django.http import JsonResponse
        json_data = json.loads(json_data)
        return JsonResponse(json_data, safe=False)




######################
# 基于rest_framework #
#####################

# 先通过最基础的 APIView来实现, 实际上APIView也是继承了django的VIew
from rest_framework.views import APIView
from rest_framework.response import Response
# 这里需要写 Serializer，用于取代django里的forms，前者针对json，后者针对html
from goods.serializers import GoodsSerializer
from rest_framework import status

class GoodsListView3(APIView):
    '''页面显示descrition描述信息呀'''
    def get(self, request, format=None):  # format=json，会返回json格式
        goods = Goods.objects.all()[:10]
        # 拿着这个serializer对 goods直接进行序列化
        goods_serializer = GoodsSerializer(goods, many=True)  # 对列表要设置many，序列化成数组对象
        return Response(goods_serializer.data)

    def post(self, request, format=None):
        serializer = GoodsSerializer(data=request.data)
        if serializer.is_valid():  # 和django的forms一样
            serializer.save()  # 会调用 GoodsSerializer.create方法
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_REQUEST)



from goods.serializers import GoodsModelSerializer
class GoodsListView_Model(APIView):
    def get(self, request, format=None):
        goods = Goods.objects.all()[:10]
        goods_serializer = GoodsModelSerializer(goods, many=True)
        return Response(goods_serializer.data)



# 使用 mixins,  GenericAPIView继承了APIView
from rest_framework import mixins
from rest_framework import generics
class GoodsListView4(mixins.ListModelMixin, generics.GenericAPIView):
    ''' 描述信息 ListModelMixin '''
    queryset = Goods.objects.all()[:10]
    serializer_class = GoodsModelSerializer
    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

# ListAPIView
# 自己定制分页class
from rest_framework.pagination import PageNumberPagination
class GoodsPagination(PageNumberPagination):
    page_size = 12
    page_size_query_param = 'page_size'  # 自己定制 get传参的参数
    page_query_param = 'page'  # 自己定制 get传参的参数
    max_page_size = 100

# ListAPIView 这个可以直接顶替上面的，在类里帮我们继承了和重写了get
class GoodsListView(generics.ListAPIView):
    ''' 描述信息 ListAPIView '''
    queryset = Goods.objects.all()
    # 在settings里配置分页
    # REST_FRAMEWORK = {'PAGE_SIZE': 10}
    serializer_class = GoodsModelSerializer
    pagination_class = GoodsPagination


###### 进阶开发 viewsets， 要和route配套使用 url中as_view({})
from rest_framework import viewsets
class GoodsListViewSet1(mixins.ListModelMixin, viewsets.GenericViewSet):
    ''' 描述信息 Mixin + GenericViewSet '''
    queryset = Goods.objects.all()  # 属性和方法，选一个就行 ?? 实验不行
    serializer_class = GoodsModelSerializer
    pagination_class = GoodsPagination

    # 过滤，在这里可以增加自己的逻辑
    def get_queryset(self):
        # queryset = Goods.objects.all()  # 这里只是拼出sql, 并没有真的取出all
        pricemin = self.request.query_params.get("pricemin", 0)
        if pricemin:
            self.queryset = self.queryset.filter(shop_price__gt=int(pricemin))
        return self.queryset


## 使用django-filters 进行过滤
from django_filters.rest_framework import DjangoFilterBackend
from .filters import GoodsFilter
class GoodsListViewSet2(mixins.ListModelMixin, viewsets.GenericViewSet):
    ''' 描述信息 GoodsListViewSet--django-filters '''
    queryset = Goods.objects.all()
    serializer_class = GoodsModelSerializer
    pagination_class = GoodsPagination
    filter_backends =(DjangoFilterBackend,)
    # filter_fields = ('name' ,'shop_price')  # 右上角多一个过滤器按钮，过滤字段，要求值完全相同
    # 用filter过滤类
    filter_class = GoodsFilter


# 不全局配置rest_framework.authentication.TokenAuthentication
# 在viewset里配置认证类
from rest_framework.authentication import TokenAuthentication

## 用rest_framework里面的 filters, 模糊搜索最佳还是用elesticsearch
from rest_framework_extensions.cache.mixins import CacheResponseMixin  # 缓存
from rest_framework.throttling import UserRateThrottle, AnonRateThrottle
from rest_framework import filters         # RetrieveModelMixin 配合 url.register 会自动配置 goods/id
class GoodsListViewSet(CacheResponseMixin, mixins.ListModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    ''' 描述信息 GoodsListViewSet--django-filters '''
    queryset = Goods.objects.all()
    serializer_class = GoodsModelSerializer
    pagination_class = GoodsPagination
    filter_backends =(DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter)
    # filter_fields = ('name' ,'shop_price')  # 右上角多一个过滤器按钮，过滤字段，要求值完全相同
    # 用filter过滤类
    filter_class = GoodsFilter
    search_fields = ('name', 'goods_brief', 'goods_desc')
    ordering_fields = ('sold_num', 'shop_price')
    # 局部配置认证类 如果全局配置有个副作用
    # 用户带token访问  公开信息时，token无效是访问不出来的
    # 可以类似这样进行 接口设置
    # authentication_classes = (TokenAuthentication, )

    # 限速类
    throttle_classes = (UserRateThrottle, AnonRateThrottle)

    # 重载retrieve方法
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.click_num += 1  # 点击数加1
        instance.save()  # 保存
        serializer = self.get_serializer(instance)
        return Response(serializer.data)



from .models import GoodsCategory
from .serializers import CategoryModelSerializer
# 商品分类  RetrieveModelMixin 用于获取某一个的详细信息, 只要加了 就可以自动根据 url/id获取
class CategoryViewSet(mixins.ListModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    '''
    List:
        商品分页列表数据
    '''
    # queryset = GoodsCategory.objects.filter(category_type=1)  # 取出一类，子类在序列化类了嵌套
    queryset = GoodsCategory.objects.all()
    serializer_class = CategoryModelSerializer



from .models import Banner
from .serializers import BannerSerializer
class BannerViewset(mixins.ListModelMixin, viewsets.GenericViewSet):
    """ 获取轮播图列表 """
    queryset = Banner.objects.all().order_by('index')
    serializer_class = BannerSerializer



from .serializers import IndexCategorySerializer
class IndexCategoryViewset(mixins.ListModelMixin, viewsets.GenericViewSet):
    """ 首页商品分类数据 """
    queryset = GoodsCategory.objects.filter(is_tab=True)  # , name__in=['生鲜食品', '酒水饮料']
    serializer_class = IndexCategorySerializer
