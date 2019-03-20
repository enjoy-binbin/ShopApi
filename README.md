![display](https://github.com/enjoy-binbin/ShopApi/blob/master/ApiList.png)

![display](https://github.com/enjoy-binbin/ShopApi/blob/master/ApiDetail.png)



###  用作记录。后面都是当时写的一些笔记，目录里有依赖，有数据库文件，有商场的前端Vue。仅供展示



vue + django REST framework 记录笔记

视频: 17年七月的  bobby

环境: win10 X86  python3.6   ide:pycharm

###  设置 虚拟环境 目录所在home
###  系统环境变量中添加
	WORKON_HOME = D:\Envs

###  首先 创建一个虚拟环境
	mkvirtualenv VueShop

###  安装django
	pip install -i https://pypi.douban.com/simple django==1.11.3

###  安装 django REST framework
	pip install djangorestframework==3.6.3
	pip install markdown==2.6.8  ###  Markdown support for the browsable API
	pip install django-filter==1.0.4  ###  Filtering support


###  pycharm中创建项目，指定目录和虚拟环境
###  more settings中 添加一个 users, 不勾选启用 django admin

###  配置settings
###  修改数据库
	DATABASES = {
	    'default': {
	        'ENGINE': 'django.db.backends.mysql',
	        'NAME': 'vue_shop',
	        'USER': 'root',
	        'PASSWORD': '1123',
	        'HOST': '127.0.0.1',
	        'OPTIONS': {'init_command': 'SET storage_engine=INNODB;'}
	    }
	}
###  修改时间地区
	LANGUAGE_CODE = 'zh-hans'
	TIME_ZONE = 'Asia/Shanghai'
	USE_I18N = True
	USE_L10N = True
	USE_TZ = False  ###  默认是ture, 时间为utc时间，因为要用本地时间，所以改为false

###  安装mysqlclient
	pip install -i https://pypi.douban.com/simple mysqlclient==1.3.10

###  安装 pillow
	pip install -i https://pypi.douban.com/simple pillow==4.2.1


###  在项目目录下　新建apps目录用于存放自己的app 和 extra_apps用来存放第三方包

###  设置settings
	import sys
	sys.path.insert(0, BASE_DIR)
	sys.path.insert(1, os.path.join(BASE_DIR, 'apps'))
	sys.path.insert(2, os.path.join(BASE_DIR, 'extra_apps'))




###  部署vue前端项目
###  解压源码 , 要求事先自己安装 nodejs 和 cnpm
###  目录下打开cmd, 安装依赖
	cnpm install
###  运行项目
	cnpm run dev
###  里面关于和 rest交互的api都放在了 src/api/api.js


###  创建app
startapp goods
startapp trade
startapp user_operation



###  设计users.model  自己看代码
###  在settings里设置 
	AUTH_USER_MODEL = 'users.UserProfile'



###  获取 UserProfile
###  from django.contrib.auth import get_user_model
###  from users.models import UserProfile
###  当开发第三方应用，不知道别人设计的model
###  可以这样获取到settings里设置的user.model
User = get_user_model()





###  配置 xadmin (0, 6, 0)
###  将xadmin复制到 extra_apps中
###  安装xadmin的依赖
	pip install django-crispy-forms==1.6.1
	pip install django-reversion==2.0
	pip install django-formtools==2.0
	pip install future==0.16.0
	pip install httplib2==0.9.2
	pip install six==1.10.0
	pip install xlwt==1.2.0
	pip install xlsxwriter==0.9.8
###  settings注册app
	xadmin
###  建立数据表
	makemigrations xadmin
	migrate xadmin
###  配置xadmin的路由url
	import xadmin
###  创建superuser
	createsuperuser
	bin
	binbin123


###  设置apps.py里app的 verbose_name
###  可以在app里的 __init__里
	###  设置app_config
	default_app_config = "articles.apps.ArticlesConfig"
###  或者在settings里 用这种方式注册app
	'users.apps.UsersConfig',

###  settings中配置media， URL为访问路径, ROOT为后台上传文件时的根
	MEDIA_URL = '/media/'
	MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
###  urls.py配置media的访问url, django中专门处理静态文件的serve
	from MxShop.settings import MEDIA_ROOT
	from django.views.static import serve
	url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT})



###  前后端分离优缺点, 在一些app,web应用中，前后端分离是一种趋势
	为什么要前后端分离:
	1. pc, app, pad多端适应
	2. SPA(单页Web应用, single page web application) 开发模式的流行
	3. 前后端开发职责不清
	4. 开发效率问题，前后端互相等待
	5. 前端一直配合着后端，能力受限
	6. 后台开发语言和模板高度耦合，导致开发语言依赖严重
	前后端分离缺点：
	1. 前后端学习门槛增加
	2. 数据依赖导致文档重要性增加
	3. 前端工作量加大
	4. SEO难度加大
	5. 后端开发模式迁移增加成本



###  官网文档地址:
	http://www.django-rest-framework.org/### api-guide
###  restful api  (Representational State Transfer)
	是目前前后端分离最佳实践，算是一种标准了
	1. 轻量, 通过http或https， 不需要额外的协议 get/post/put/delete
	2. 面向资源，一目了然，具有自解释性
	3. 数据描述简单，一般通过json或者xml做数据通信



###  pip install 报错 utf decode错误的话
###  修改 虚拟环境里的 site-packages/pip/ __init__.py中的 75行
	return s.decode('gbk')  ###  改为gbk




###  安装 django rest framework
###  安装依赖, 有些依赖在前面已经装过了，看官网文档
	pip install django-guardian==1.4.9
	pip install coreapi==2.3.1

###  在settings里 注册rest_framework app


###  views 代码书写。
###  其他的看项目代码吧。。。。
###  views, Serializer序列化，Filter过滤
###  class CategoryViewSet(mixins.ListModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
###  class GoodsModelSerializer(serializers.ModelSerializer):
###  class GoodsFilter(django_filters.rest_framework.FilterSet):



###  解决跨域问题，前端可以通过控制代理，后端设置服务器
###  这里使用 django-cors-headers 后端服务器设置允许跨域(github看文档)
	pip install django-cors-headers==2.1.0

###  settings里注册app 
	corsheaders
###  增加中间键, 放在 csrf 之前
	'corsheaders.middleware.CorsMiddleware',
###  增加配置
	CORS_ORIGIN_ALLOW_ALL = True





###  auth用户认证
	http://www.django-rest-framework.org/api-guide/authentication/
###  在前后端分离的项目中，session实现的比较少见，这里用token认证方式
###  重点核心在 TokenAuthentication
###  在settings里 注册这个app， 实际上migrate会生成表
	'rest_framework.authtoken'
	
	REST_FRAMEWORK = {
	    'DEFAULT_AUTHENTICATION_CLASSES': (
		    ###  'rest_framework.authentication.BasicAuthentication',
	        ###  'rest_framework.authentication.SessionAuthentication',
	        'rest_framework.authentication.TokenAuthentication',
	    )
	}

###  配置url
	from rest_framework.authtoken import views
	urlpatterns += [
	    url(r'^api-token-auth/', views.obtain_auth_token)
	]
###  火狐有个插件, httprequester， 火狐太高版本无法安装 emmm
###  装 RESTClient 用于测试  POST数据，header 
	增加一个header post json数据 Name : Content-type Value: application/json
	http://127.0.0.1:8000/api-token-auth/
	POST {"username":"bin","password":"binbin123"}
	return {"token":"b0fa9e3edf0c5f0cc723974e1294633cc8efb6a9"}
###  增加header（token后边有个空格）
	Authorization: Token b0fa9e3edf0c5f0cc723974e1294633cc8efb6a9
###  之后用这个请求头，GET请求 商品列表，debug模式，在 modelList里的 list里打个断点
###  看看里面的 request里是否有 user

###  在用户创建之处，创建token很简单
	from rest_framework.authtoken.models import Token
	
	token = Token.objects.create(user=...)
	print token.key


###  上面那样全局配置有个副作用
###  用户带token访问  公开信息时，token无效是访问不出来的
###  所以在viewset里配置，通过debug注释，无论怎样都能获取到数据
###  并且可以获得 request里的 auth user信息
###  不全局配置rest_framework.authentication.TokenAuthentication
###  在viewsets里配置认证类
	from rest_framework.authentication import TokenAuthentication
	###  配置认证类
	authentication_classes = (TokenAuthentication, ) 



###  drf的 token认证模式里有些缺点，所以一般用 jwt用户认证
###  json web token 前后端分离之jwt
###  安装 djangorestframework-jwk
###  https://github.com/GetBlimp/django-rest-framework-jwt
	pip install djangorestframework-jwt==1.11.0
###  看文档吧
	'rest_framework_jwt.authentication.JSONWebTokenAuthentication',
###  配置url
	from rest_framework_jwt.views import obtain_jwt_token
	url(r'^jwt-auth/', obtain_jwt_token),
###  用RESTClient POST json 用户名密码测试 http://127.0.0.1:8000/jwt-auth/
	"token": "。。。token信息。。。"
###  继续 GET http://127.0.0.1:8000/goods/ 打断点查看 request.user里的信息
###  将上面的token       Authorization: JWT <your_token> 添加到headers



###  自定义django 自定义用户认证函数
###  settings里
	AUTHENTICATION_BACKENDS = (
	    'users.views.CustomBackend',
	)
###  同理用 RESTClient 对 http://127.0.0.1:8000/login/ 进行测试
###  json post username password 返回token



###  第三方短信发送服务，云片网 1123.0
###  自己看文档吧，进行注册，实名认证，签名审核，模板审核，ip白名单设置
###  实现代码看 utlis.yunpian里


###  实现用户注册 登陆，商品列表，热卖商品。。。。看代码
###  先写 view, 继承 mixins 和 viewset
###  然后写 serializer 序列化, 继承serializers (根据需要继承 modelserializer or not)



### ### ### ### ### ### ### ### ### ### ### ### ### ###  看代码


###  django代理vue前端页面
###  首先在vue项目目录里
	cnpm run build
###  这条命令会在项目目录里生成 dist 文件夹
###  里面包含着生成好的静态文件
###  在django里 创建static，放进去
###  把 index.html 放入模板, 修改 js.src = /static/...
###  配置url， 指向 index.html
###  访问线上url



###  sentry




###  使用 drf-ext 缓存
	pip install drf-extensions==0.3.1
	from rest_framework_extensions.cache.mixins import CacheResponseMixin
	在需要缓冲的view里继承
###  设置过期时间
	###  drf_ext 配置
	REST_FRAMEWORK_EXTENSIONS = {
	    'DEFAULT_CACHE_RESPONSE_TIMEOUT': 5, ###  设置缓冲过期时间
	}


###  配置redis
	pip install django-redis==4.9.0
###  配置redis缓存, 它会自动根据 url，参数，过滤条件设置不同的redis缓存
	CACHES = {
	    'default': {
	        'BACKEND': 'django_redis.cache.RedisCache',
	        'LOCATION': 'redis://:1123@127.0.0.1:6379', ###  没密码就这样设置 redis://127.0.0.1:6379
	        'OPTIONS': {
	            'CLIENT_CLASS': 'django_redis.client.DefaultClient',
	        }
	    }
	}
###  开启redis服务端
	redis-server.exe redis.windows.conf
###  连接redis
	redis-cli.exe -h 127.0.0.1 -p 6379 -a 1123
	keys *  ###  查看所有key







###  继承微博登陆, 说明文档地址
###  http://open.weibo.com/apps
###  authorize文档: http://open.weibo.com/wiki/Oauth2/authorize
###  文档: http://open.weibo.com/wiki/Oauth2/access_token
###  使用第三方集成登陆
###  文档： https://github.com/python-social-auth/social-app-django
	pip install social-auth-app-django==2.1.0
###  在settings里注册app
	social_django
###  增加 backend
	'social_core.backends.weibo.WeiboOAuth2',
	'social_core.backends.qq.QQOAuth2',
	'social_core.backends.weixin.WeixinOAuth2',
	'django.contrib.auth.backends.ModelBackend',
###  social_django里有些model需要使用到innodb, migrate
	'OPTIONS': {'init_command': 'SET storage_engine=INNODB;'}
###  'social_django.context_processors.backends',
  'social_django.context_processors.login_redirect',
###  在settings里设置微博key和secret
	SOCIAL_AUTH_WEIBO_KEY = '3623674980'
	SOCIAL_AUTH_WEIBO_SECRET = 'caa8d5c10201fb9477e8d6f00bd22f08'
###  在微博开放平台里设置好回调地址 
	http://127.0.0.1:8005/complete/weibo/

###  修改social_core源码
###  将其复制到 extra_apps目录下
