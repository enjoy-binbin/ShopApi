"""MxShop URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
# from django.contrib import admin
import xadmin
from django.views.static import serve
from rest_framework.documentation import include_docs_urls

from MxShop.settings import MEDIA_ROOT
from goods.views import GoodsListView, GoodsListView_Model

from goods.views import GoodsListViewSet
goods_list = GoodsListViewSet.as_view({
    'get': 'list',  # 将get请求绑定到list方法上，继承自mixin
    # 'post': 'create'
})


# 使用route配置url
from rest_framework.routers import DefaultRouter
router = DefaultRouter()
router.register(r'goods', GoodsListViewSet, base_name="goods")
from goods.views import CategoryViewSet
router.register(r'categorys', CategoryViewSet, base_name='categorys')

# 验证码
from users.views import SmsCodeViewSet
router.register(r'code', SmsCodeViewSet, base_name='code')

# 用户注册
from users.views import UserViewset
router.register(r'users', UserViewset, base_name='users')

# 用户收藏
from user_operation.views import UserFavViewset
router.register(r'userfavs', UserFavViewset, base_name='userfavs')

# 用户留言
from user_operation.views import LeavingMessageViewset
router.register(r'messages', LeavingMessageViewset, base_name='messages')

# 用户收货地址
from user_operation.views import AddressViewset
router.register(r'address', AddressViewset, base_name='address')

# 购物车
from trade.views import ShoppingCartView
router.register(r'shopcarts', ShoppingCartView, base_name='shopcarts')

# 订单
from trade.views import OrderViewset
router.register(r'orders', OrderViewset, base_name='orders')

# 轮播图
from goods.views import BannerViewset
router.register(r'banners', BannerViewset, base_name='banners')

# 首页商品分类
from goods.views import IndexCategoryViewset
router.register(r'indexgoods', IndexCategoryViewset, base_name='indexgoods')


# auth token认证
from rest_framework.authtoken import views
# jwt认证
from rest_framework_jwt.views import obtain_jwt_token

from trade.views import AlipayView

from django.views.generic import TemplateView

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),

    # url(r'goods/$', GoodsListView.as_view(), name="goods-list"),
    # url(r'goods/$', goods_list, name="goods-list"),
    url(r'^', include(router.urls)),

    # drf自带的token认证模式
    url(r'^api-token-auth/', views.obtain_auth_token),
    # json web token认证接口
    # url(r'^jwt-auth/', obtain_jwt_token),
    url(r'^login/$', obtain_jwt_token),  # 一般后端要配合前端接口

    # restframework的文档url
    url(r'docs/', include_docs_urls(title='彬彬很优秀')),

    # 登陆的一些配置url
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),

    # 支付宝return配置
    url(r'^alipay/return/', AlipayView.as_view(), name='apipay'),

    url(r'^index/', TemplateView.as_view(template_name='index.html'), name='index'),

    # 第三方登陆 social-django
    url('', include('social_django.urls', namespace='social')),
]
