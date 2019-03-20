/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50636
Source Host           : 127.0.0.1:3306
Source Database       : mxshop

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2019-03-20 19:53:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authtoken_token
-- ----------------------------
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authtoken_token
-- ----------------------------
INSERT INTO `authtoken_token` VALUES ('b0fa9e3edf0c5f0cc723974e1294633cc8efb6a9', '2018-06-04 21:28:34.721928', '1');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add permission', '1', 'add_permission');
INSERT INTO `auth_permission` VALUES ('2', 'Can change permission', '1', 'change_permission');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete permission', '1', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can add content type', '3', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('8', 'Can change content type', '3', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete content type', '3', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('10', 'Can add session', '4', 'add_session');
INSERT INTO `auth_permission` VALUES ('11', 'Can change session', '4', 'change_session');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete session', '4', 'delete_session');
INSERT INTO `auth_permission` VALUES ('13', 'Can add 用户', '5', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('14', 'Can change 用户', '5', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete 用户', '5', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('16', 'Can add 短信验证码', '6', 'add_verifycode');
INSERT INTO `auth_permission` VALUES ('17', 'Can change 短信验证码', '6', 'change_verifycode');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete 短信验证码', '6', 'delete_verifycode');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 轮播商品', '7', 'add_banner');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 轮播商品', '7', 'change_banner');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 轮播商品', '7', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 商品', '8', 'add_goods');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 商品', '8', 'change_goods');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 商品', '8', 'delete_goods');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 商品类别', '9', 'add_goodscategory');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 商品类别', '9', 'change_goodscategory');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 商品类别', '9', 'delete_goodscategory');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 品牌', '10', 'add_goodscategorybrand');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 品牌', '10', 'change_goodscategorybrand');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 品牌', '10', 'delete_goodscategorybrand');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 订单商品', '11', 'add_ordergoods');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 订单商品', '11', 'change_ordergoods');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 订单商品', '11', 'delete_ordergoods');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 订单', '12', 'add_orderinfo');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 订单', '12', 'change_orderinfo');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 订单', '12', 'delete_orderinfo');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 购物车', '13', 'add_shoppingcart');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 购物车', '13', 'change_shoppingcart');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 购物车', '13', 'delete_shoppingcart');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 收货地址', '14', 'add_useraddress');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 收货地址', '14', 'change_useraddress');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 收货地址', '14', 'delete_useraddress');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 用户收藏', '15', 'add_userfav');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 用户收藏', '15', 'change_userfav');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 用户收藏', '15', 'delete_userfav');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 用户留言', '16', 'add_userleavingmessage');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 用户留言', '16', 'change_userleavingmessage');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 用户留言', '16', 'delete_userleavingmessage');
INSERT INTO `auth_permission` VALUES ('49', 'Can view group', '2', 'view_group');
INSERT INTO `auth_permission` VALUES ('50', 'Can view permission', '1', 'view_permission');
INSERT INTO `auth_permission` VALUES ('51', 'Can view content type', '3', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('52', 'Can view 轮播商品', '7', 'view_banner');
INSERT INTO `auth_permission` VALUES ('53', 'Can view 商品', '8', 'view_goods');
INSERT INTO `auth_permission` VALUES ('54', 'Can view 商品类别', '9', 'view_goodscategory');
INSERT INTO `auth_permission` VALUES ('55', 'Can view 品牌', '10', 'view_goodscategorybrand');
INSERT INTO `auth_permission` VALUES ('56', 'Can view session', '4', 'view_session');
INSERT INTO `auth_permission` VALUES ('57', 'Can view 订单商品', '11', 'view_ordergoods');
INSERT INTO `auth_permission` VALUES ('58', 'Can view 订单', '12', 'view_orderinfo');
INSERT INTO `auth_permission` VALUES ('59', 'Can view 购物车', '13', 'view_shoppingcart');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 用户', '5', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('61', 'Can view 短信验证码', '6', 'view_verifycode');
INSERT INTO `auth_permission` VALUES ('62', 'Can view 收货地址', '14', 'view_useraddress');
INSERT INTO `auth_permission` VALUES ('63', 'Can view 用户收藏', '15', 'view_userfav');
INSERT INTO `auth_permission` VALUES ('64', 'Can view 用户留言', '16', 'view_userleavingmessage');
INSERT INTO `auth_permission` VALUES ('65', 'Can add Bookmark', '17', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('66', 'Can change Bookmark', '17', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete Bookmark', '17', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('68', 'Can add User Setting', '18', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('69', 'Can change User Setting', '18', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('70', 'Can delete User Setting', '18', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('71', 'Can add User Widget', '19', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('72', 'Can change User Widget', '19', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('73', 'Can delete User Widget', '19', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('74', 'Can add log entry', '20', 'add_log');
INSERT INTO `auth_permission` VALUES ('75', 'Can change log entry', '20', 'change_log');
INSERT INTO `auth_permission` VALUES ('76', 'Can delete log entry', '20', 'delete_log');
INSERT INTO `auth_permission` VALUES ('77', 'Can view Bookmark', '17', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('78', 'Can view log entry', '20', 'view_log');
INSERT INTO `auth_permission` VALUES ('79', 'Can view User Setting', '18', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('80', 'Can view User Widget', '19', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('81', 'Can add 商品图片', '21', 'add_goodsimage');
INSERT INTO `auth_permission` VALUES ('82', 'Can change 商品图片', '21', 'change_goodsimage');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete 商品图片', '21', 'delete_goodsimage');
INSERT INTO `auth_permission` VALUES ('84', 'Can view 商品图片', '21', 'view_goodsimage');
INSERT INTO `auth_permission` VALUES ('85', 'Can add Token', '22', 'add_token');
INSERT INTO `auth_permission` VALUES ('86', 'Can change Token', '22', 'change_token');
INSERT INTO `auth_permission` VALUES ('87', 'Can delete Token', '22', 'delete_token');
INSERT INTO `auth_permission` VALUES ('88', 'Can view Token', '22', 'view_token');
INSERT INTO `auth_permission` VALUES ('89', 'Can add 首页商品类别广告', '23', 'add_indexad');
INSERT INTO `auth_permission` VALUES ('90', 'Can change 首页商品类别广告', '23', 'change_indexad');
INSERT INTO `auth_permission` VALUES ('91', 'Can delete 首页商品类别广告', '23', 'delete_indexad');
INSERT INTO `auth_permission` VALUES ('92', 'Can view 首页商品类别广告', '23', 'view_indexad');
INSERT INTO `auth_permission` VALUES ('93', 'Can add association', '24', 'add_association');
INSERT INTO `auth_permission` VALUES ('94', 'Can change association', '24', 'change_association');
INSERT INTO `auth_permission` VALUES ('95', 'Can delete association', '24', 'delete_association');
INSERT INTO `auth_permission` VALUES ('96', 'Can add code', '25', 'add_code');
INSERT INTO `auth_permission` VALUES ('97', 'Can change code', '25', 'change_code');
INSERT INTO `auth_permission` VALUES ('98', 'Can delete code', '25', 'delete_code');
INSERT INTO `auth_permission` VALUES ('99', 'Can add nonce', '26', 'add_nonce');
INSERT INTO `auth_permission` VALUES ('100', 'Can change nonce', '26', 'change_nonce');
INSERT INTO `auth_permission` VALUES ('101', 'Can delete nonce', '26', 'delete_nonce');
INSERT INTO `auth_permission` VALUES ('102', 'Can add user social auth', '27', 'add_usersocialauth');
INSERT INTO `auth_permission` VALUES ('103', 'Can change user social auth', '27', 'change_usersocialauth');
INSERT INTO `auth_permission` VALUES ('104', 'Can delete user social auth', '27', 'delete_usersocialauth');
INSERT INTO `auth_permission` VALUES ('105', 'Can add partial', '28', 'add_partial');
INSERT INTO `auth_permission` VALUES ('106', 'Can change partial', '28', 'change_partial');
INSERT INTO `auth_permission` VALUES ('107', 'Can delete partial', '28', 'delete_partial');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('1', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('22', 'authtoken', 'token');
INSERT INTO `django_content_type` VALUES ('3', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'goods', 'banner');
INSERT INTO `django_content_type` VALUES ('8', 'goods', 'goods');
INSERT INTO `django_content_type` VALUES ('9', 'goods', 'goodscategory');
INSERT INTO `django_content_type` VALUES ('10', 'goods', 'goodscategorybrand');
INSERT INTO `django_content_type` VALUES ('21', 'goods', 'goodsimage');
INSERT INTO `django_content_type` VALUES ('23', 'goods', 'indexad');
INSERT INTO `django_content_type` VALUES ('4', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('24', 'social_django', 'association');
INSERT INTO `django_content_type` VALUES ('25', 'social_django', 'code');
INSERT INTO `django_content_type` VALUES ('26', 'social_django', 'nonce');
INSERT INTO `django_content_type` VALUES ('28', 'social_django', 'partial');
INSERT INTO `django_content_type` VALUES ('27', 'social_django', 'usersocialauth');
INSERT INTO `django_content_type` VALUES ('11', 'trade', 'ordergoods');
INSERT INTO `django_content_type` VALUES ('12', 'trade', 'orderinfo');
INSERT INTO `django_content_type` VALUES ('13', 'trade', 'shoppingcart');
INSERT INTO `django_content_type` VALUES ('5', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'verifycode');
INSERT INTO `django_content_type` VALUES ('14', 'user_operation', 'useraddress');
INSERT INTO `django_content_type` VALUES ('15', 'user_operation', 'userfav');
INSERT INTO `django_content_type` VALUES ('16', 'user_operation', 'userleavingmessage');
INSERT INTO `django_content_type` VALUES ('17', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('20', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('18', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('19', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-05-30 13:56:39.376163');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2018-05-30 13:56:40.334563');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-05-30 13:56:44.568501');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-05-30 13:56:45.509678');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-05-30 13:56:45.555112');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-05-30 13:56:45.605306');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-05-30 13:56:45.656932');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-05-30 13:56:45.759395');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-05-30 13:56:45.880358');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2018-05-30 13:56:45.989641');
INSERT INTO `django_migrations` VALUES ('11', 'goods', '0001_initial', '2018-05-30 13:56:51.751979');
INSERT INTO `django_migrations` VALUES ('12', 'sessions', '0001_initial', '2018-05-30 13:56:52.557272');
INSERT INTO `django_migrations` VALUES ('13', 'users', '0001_initial', '2018-05-30 13:56:58.837407');
INSERT INTO `django_migrations` VALUES ('14', 'trade', '0001_initial', '2018-05-30 13:57:00.802400');
INSERT INTO `django_migrations` VALUES ('15', 'trade', '0002_auto_20180530_2156', '2018-05-30 13:57:06.611578');
INSERT INTO `django_migrations` VALUES ('16', 'user_operation', '0001_initial', '2018-05-30 13:57:07.684559');
INSERT INTO `django_migrations` VALUES ('17', 'user_operation', '0002_auto_20180530_2156', '2018-05-30 13:57:12.853190');
INSERT INTO `django_migrations` VALUES ('18', 'xadmin', '0001_initial', '2018-05-31 03:21:21.722681');
INSERT INTO `django_migrations` VALUES ('19', 'xadmin', '0002_log', '2018-05-31 03:21:23.339117');
INSERT INTO `django_migrations` VALUES ('20', 'xadmin', '0003_auto_20160715_0100', '2018-05-31 03:21:24.207445');
INSERT INTO `django_migrations` VALUES ('21', 'goods', '0002_auto_20180531_1931', '2018-05-31 19:31:46.484567');
INSERT INTO `django_migrations` VALUES ('22', 'authtoken', '0001_initial', '2018-06-04 17:55:24.239849');
INSERT INTO `django_migrations` VALUES ('23', 'authtoken', '0002_auto_20160226_1747', '2018-06-04 17:55:25.289526');
INSERT INTO `django_migrations` VALUES ('24', 'users', '0002_auto_20180607_1335', '2018-06-07 13:35:21.432780');
INSERT INTO `django_migrations` VALUES ('25', 'user_operation', '0003_auto_20180608_1255', '2018-06-08 13:15:49.429163');
INSERT INTO `django_migrations` VALUES ('26', 'goods', '0003_indexad', '2018-06-24 21:18:36.189167');
INSERT INTO `django_migrations` VALUES ('27', 'trade', '0003_auto_20180624_2118', '2018-06-24 21:18:36.749172');
INSERT INTO `django_migrations` VALUES ('28', 'default', '0001_initial', '2018-06-28 16:38:45.194462');
INSERT INTO `django_migrations` VALUES ('29', 'social_auth', '0001_initial', '2018-06-28 16:38:45.235251');
INSERT INTO `django_migrations` VALUES ('30', 'default', '0002_add_related_name', '2018-06-28 16:38:46.035912');
INSERT INTO `django_migrations` VALUES ('31', 'social_auth', '0002_add_related_name', '2018-06-28 16:38:46.076893');
INSERT INTO `django_migrations` VALUES ('32', 'default', '0003_alter_email_max_length', '2018-06-28 16:38:46.911002');
INSERT INTO `django_migrations` VALUES ('33', 'social_auth', '0003_alter_email_max_length', '2018-06-28 16:38:46.960838');
INSERT INTO `django_migrations` VALUES ('34', 'default', '0004_auto_20160423_0400', '2018-06-28 16:38:47.003622');
INSERT INTO `django_migrations` VALUES ('35', 'social_auth', '0004_auto_20160423_0400', '2018-06-28 16:38:47.043634');
INSERT INTO `django_migrations` VALUES ('36', 'social_auth', '0005_auto_20160727_2333', '2018-06-28 16:38:47.328401');
INSERT INTO `django_migrations` VALUES ('37', 'social_django', '0006_partial', '2018-06-28 16:38:48.011977');
INSERT INTO `django_migrations` VALUES ('38', 'social_django', '0007_code_timestamp', '2018-06-28 16:38:49.063309');
INSERT INTO `django_migrations` VALUES ('39', 'social_django', '0008_partial_timestamp', '2018-06-28 16:38:50.072641');
INSERT INTO `django_migrations` VALUES ('40', 'social_django', '0002_add_related_name', '2018-06-28 16:38:50.116616');
INSERT INTO `django_migrations` VALUES ('41', 'social_django', '0005_auto_20160727_2333', '2018-06-28 16:38:50.153356');
INSERT INTO `django_migrations` VALUES ('42', 'social_django', '0003_alter_email_max_length', '2018-06-28 16:38:50.193900');
INSERT INTO `django_migrations` VALUES ('43', 'social_django', '0004_auto_20160423_0400', '2018-06-28 16:38:50.236254');
INSERT INTO `django_migrations` VALUES ('44', 'social_django', '0001_initial', '2018-06-28 16:38:50.277425');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1e1br6ti2dgqcgpiaywc09rnhz3j5auf', 'Njg4N2Y2NTgxNGVjMmM2NmVmYjExMWNjYjE0YmYyMzU2M2I4NTFjMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImMwNGUzNjExZWM0ZjE0MGZhYWJlMGEzYTA2MDU2OGU5Mjg2YmI5ZTgifQ==', '2018-12-17 17:19:14.024178');
INSERT INTO `django_session` VALUES ('47pi04l9nmhm3pnr7x3j7ombz3f4259s', 'MGY0NmYxODdlNmZkODY3ZDNmOWUxNDZhYTE5YzBlOWE1NmY3ODEyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImMwNGUzNjExZWM0ZjE0MGZhYWJlMGEzYTA2MDU2OGU5Mjg2YmI5ZTgiLCJMSVNUX1FVRVJZIjpbWyJnb29kcyIsImluZGV4YWQiXSwiIl0sIndlaWJvX3N0YXRlIjoiOWVidWIxcFdUODhHa1M5dE5SREVFRkVZTlEyZnl6V2wifQ==', '2018-07-13 10:44:37.396704');

-- ----------------------------
-- Table structure for goods_banner
-- ----------------------------
DROP TABLE IF EXISTS `goods_banner`;
CREATE TABLE `goods_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_banner_goods_id_99e23129_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_banner_goods_id_99e23129_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_banner
-- ----------------------------
INSERT INTO `goods_banner` VALUES ('1', 'banner/banner3_NIhOyGU.jpg', '0', '2018-06-24 20:04:00.000000', '1');
INSERT INTO `goods_banner` VALUES ('2', 'banner/banner2_l0AxWT7.jpg', '0', '2018-06-24 20:04:00.000000', '3');
INSERT INTO `goods_banner` VALUES ('3', 'banner/banner1_1imsGJd.jpg', '0', '2018-06-24 20:05:00.000000', '7');

-- ----------------------------
-- Table structure for goods_goods
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods`;
CREATE TABLE `goods_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_sn` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `click_num` int(11) NOT NULL,
  `sold_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `goods_num` int(11) NOT NULL,
  `market_price` double NOT NULL,
  `shop_price` double NOT NULL,
  `goods_brief` longtext NOT NULL,
  `goods_desc` longtext NOT NULL,
  `ship_free` tinyint(1) NOT NULL,
  `goods_front_image` varchar(100) DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL,
  `is_hot` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id` (`category_id`),
  CONSTRAINT `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_goods
-- ----------------------------
INSERT INTO `goods_goods` VALUES ('1', '', '新鲜水果甜蜜香脆单果约800克', '1', '0', '0', '0', '232', '156', '食用百香果可以增加胃部饱腹感，减少余热量的摄入，还可以吸附胆固醇和胆汁之类有机分子，抑制人体对脂肪的吸收。因此，长期食用有利于改善人体营养吸收结构，降低体内脂肪，塑造健康优美体态。', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/1_P_1449024889889.jpg', '0', '1', '2018-05-31 19:31:26.337527', '20');
INSERT INTO `goods_goods` VALUES ('2', '', '新鲜水果甜蜜香脆单果约800克2', '0', '0', '0', '0', '232', '156', '食用百香果可以增加胃部饱腹感，减少余热量的摄入，还可以吸附胆固醇和胆汁之类有机分子，抑制人体对脂肪的吸收。因此，长期食用有利于改善人体营养吸收结构，降低体内脂肪，塑造健康优美体态。', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/1_P_1449024889889.jpg', '0', '1', '2018-05-31 19:31:51.522289', '20');
INSERT INTO `goods_goods` VALUES ('3', '', '田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛', '0', '0', '0', '0', '106', '88', '前腿+后腿+羊排共8斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/2_P_1448945810202.jpg', '0', '1', '2018-05-31 19:31:51.949472', '7');
INSERT INTO `goods_goods` VALUES ('4', '', '酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐', '0', '0', '0', '0', '286', '238', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/7_P_1448945104883.jpg', '0', '1', '2018-05-31 19:31:52.050001', '15');
INSERT INTO `goods_goods` VALUES ('5', '', '日本蒜蓉粉丝扇贝270克6只装', '0', '0', '0', '0', '156', '108', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/47_P_1448946213263.jpg', '0', '1', '2018-05-31 19:31:52.149466', '20');
INSERT INTO `goods_goods` VALUES ('6', '', '内蒙新鲜牛肉1斤清真生鲜牛肉火锅食材', '0', '0', '0', '0', '106', '88', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/10_P_1448944572085.jpg', '1', '0', '2018-05-31 19:31:52.259525', '7');
INSERT INTO `goods_goods` VALUES ('7', '', '乌拉圭进口牛肉卷特级肥牛卷', '0', '0', '0', '0', '90', '75', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/4_P_1448945381985.jpg', '1', '0', '2018-05-31 19:31:52.432964', '21');
INSERT INTO `goods_goods` VALUES ('8', '', '五星眼肉牛排套餐8片装原味原切生鲜牛肉', '0', '0', '0', '0', '150', '125', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/8_P_1448945032810.jpg', '0', '0', '2018-05-31 19:31:52.532482', '23');
INSERT INTO `goods_goods` VALUES ('9', '', '澳洲进口120天谷饲牛仔骨4份原味生鲜', '0', '0', '0', '0', '31', '26', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/11_P_1448944388277.jpg', '0', '0', '2018-05-31 19:31:52.633192', '7');
INSERT INTO `goods_goods` VALUES ('10', '', '潮香村澳洲进口牛排家庭团购套餐20片', '1', '0', '0', '0', '239', '199', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/6_P_1448945167279.jpg', '0', '0', '2018-05-31 19:31:52.766334', '22');
INSERT INTO `goods_goods` VALUES ('11', '', '爱食派内蒙古呼伦贝尔冷冻生鲜牛腱子肉1000g', '1', '0', '0', '0', '202', '168', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/9_P_1448944791617.jpg', '0', '0', '2018-05-31 19:31:52.865853', '20');
INSERT INTO `goods_goods` VALUES ('12', '', '澳洲进口牛尾巴300g新鲜肥牛肉', '0', '0', '0', '0', '306', '255', '新鲜羊羔肉整只共15斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/3_P_1448945490837.jpg', '0', '0', '2018-05-31 19:31:53.032907', '2');
INSERT INTO `goods_goods` VALUES ('13', '', '新疆巴尔鲁克生鲜牛排眼肉牛扒1200g', '0', '0', '0', '1111', '126', '88', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/48_P_1448943988970.jpg', '0', '0', '2018-05-31 19:31:53.132744', '7');
INSERT INTO `goods_goods` VALUES ('14', '', '澳洲进口安格斯牛切片上脑牛排1000g', '0', '0', '0', '0', '144', '120', '澳大利亚是国际公认的没有疯牛病和口蹄疫的国家。为了保持澳大利亚产品的高标准，澳大利亚牛肉业和各级政府共同努力简历了严格的标准和体系，以保证生产的整体化和产品的可追溯性', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/5_P_1448945270390.jpg', '0', '0', '2018-05-31 19:31:53.340945', '12');
INSERT INTO `goods_goods` VALUES ('15', '', '帐篷出租', '0', '0', '0', '0', '120', '100', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'images/201705/goods_img/53_P_1495068879687.jpg', '0', '0', '2018-05-31 19:31:53.524340', '21');
INSERT INTO `goods_goods` VALUES ('16', '', '52度茅台集团国隆双喜酒500mlx6', '0', '0', '0', '0', '23', '19', '贵州茅台酒厂（集团）保健酒业有限公司生产，是以“龙”字打头的酒水。中国龙文化上下8000年，源远而流长，龙的形象是一种符号、一种意绪、一种血肉相联的情感。', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/16_P_1448947194687.jpg', '0', '0', '2018-05-31 19:31:53.591477', '37');
INSERT INTO `goods_goods` VALUES ('17', '', '52度水井坊臻酿八號500ml', '0', '0', '0', '0', '43', '36', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/14_P_1448947354031.jpg', '0', '0', '2018-05-31 19:31:53.657770', '36');
INSERT INTO `goods_goods` VALUES ('18', '', '53度茅台仁酒500ml', '0', '0', '0', '0', '190', '158', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/12_P_1448947547989.jpg', '0', '0', '2018-05-31 19:31:53.758450', '32');
INSERT INTO `goods_goods` VALUES ('19', '', '双响炮洋酒JimBeamwhiskey美国白占边', '0', '0', '0', '0', '38', '28', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/46_P_1448946598711.jpg', '0', '0', '2018-05-31 19:31:53.824908', '29');
INSERT INTO `goods_goods` VALUES ('20', '', '西夫拉姆进口洋酒小酒版', '1', '0', '0', '0', '55', '46', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/21_P_1448946793276.jpg', '0', '0', '2018-05-31 19:31:53.974426', '36');
INSERT INTO `goods_goods` VALUES ('21', '', '茅台53度飞天茅台500ml', '0', '0', '0', '0', '22', '18', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/15_P_1448947257324.jpg', '0', '0', '2018-05-31 19:31:54.075119', '30');
INSERT INTO `goods_goods` VALUES ('22', '', '52度兰陵·紫气东来1600mL山东名酒', '0', '0', '0', '0', '42', '35', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/13_P_1448947460386.jpg', '0', '0', '2018-05-31 19:31:54.224388', '29');
INSERT INTO `goods_goods` VALUES ('23', '', 'JohnnieWalker尊尼获加黑牌威士忌', '0', '0', '0', '0', '24', '20', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/50_P_1448946543091.jpg', '0', '0', '2018-05-31 19:31:54.374513', '36');
INSERT INTO `goods_goods` VALUES ('24', '', '人头马CLUB特优香槟干邑350ml', '0', '0', '0', '0', '31', '26', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/51_P_1448946466595.jpg', '0', '0', '2018-05-31 19:31:54.566526', '30');
INSERT INTO `goods_goods` VALUES ('25', '', '张裕干红葡萄酒750ml*6支', '0', '0', '0', '0', '54', '45', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/17_P_1448947102246.jpg', '0', '0', '2018-05-31 19:31:54.682628', '31');
INSERT INTO `goods_goods` VALUES ('26', '', '原瓶原装进口洋酒烈酒法国云鹿XO白兰地', '0', '0', '0', '0', '46', '38', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/20_P_1448946850602.jpg', '0', '0', '2018-05-31 19:31:54.757953', '29');
INSERT INTO `goods_goods` VALUES ('27', '', '法国原装进口圣贝克干红葡萄酒750ml', '0', '0', '0', '0', '82', '68', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/19_P_1448946951581.jpg', '0', '0', '2018-05-31 19:31:54.832829', '25');
INSERT INTO `goods_goods` VALUES ('28', '', '法国百利威干红葡萄酒AOP级6支装', '0', '0', '0', '0', '67', '56', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/18_P_1448947011435.jpg', '0', '0', '2018-05-31 19:31:55.010593', '25');
INSERT INTO `goods_goods` VALUES ('29', '', '芝华士12年苏格兰威士忌700ml', '0', '0', '0', '0', '71', '59', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/22_P_1448946729629.jpg', '0', '0', '2018-05-31 19:31:55.219288', '30');
INSERT INTO `goods_goods` VALUES ('30', '', '深蓝伏特加巴维兰利口酒送预调酒', '0', '0', '0', '0', '31', '18', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/45_P_1448946661303.jpg', '0', '0', '2018-05-31 19:31:55.283332', '36');
INSERT INTO `goods_goods` VALUES ('31', '', '赣南脐橙特级果10斤装', '0', '0', '0', '0', '43', '36', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/32_P_1448948525620.jpg', '0', '0', '2018-05-31 19:31:55.358299', '62');
INSERT INTO `goods_goods` VALUES ('32', '', '泰国菠萝蜜16-18斤1个装', '0', '0', '0', '0', '11', '9', '【懒人吃法】菠萝蜜果肉，冰袋保鲜，收货就吃，冰爽Q脆甜，2斤装，全国顺丰空运包邮，发出后48小时内可达，一线城市基本隔天可达', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/30_P_1448948663450.jpg', '0', '0', '2018-05-31 19:31:55.433368', '66');
INSERT INTO `goods_goods` VALUES ('33', '', '四川双流草莓新鲜水果礼盒2盒', '0', '0', '0', '0', '22', '18', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/31_P_1448948598947.jpg', '0', '0', '2018-05-31 19:31:55.583093', '70');
INSERT INTO `goods_goods` VALUES ('34', '', '新鲜头茬非洲冰草冰菜', '0', '0', '0', '0', '67', '56', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/35_P_1448948333610.jpg', '0', '0', '2018-05-31 19:31:55.749970', '58');
INSERT INTO `goods_goods` VALUES ('35', '', '仿真蔬菜水果果蔬菜模型', '0', '0', '0', '0', '6', '5', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/36_P_1448948234405.jpg', '0', '0', '2018-05-31 19:31:55.999805', '58');
INSERT INTO `goods_goods` VALUES ('36', '', '现摘芭乐番石榴台湾珍珠芭乐', '0', '0', '0', '0', '28', '23', '海南产精品释迦果,\n        释迦是水果中的贵族,\n        产量少,\n        味道很甜,\n        奶香十足,\n        非常可口,\n        果裹果园顺丰空运,\n        保证新鲜.果子个大,\n        一斤1-2个左右,\n        大个头的果子更尽兴!\n        ', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/33_P_1448948479966.jpg', '0', '0', '2018-05-31 19:31:56.116353', '62');
INSERT INTO `goods_goods` VALUES ('37', '', '潍坊萝卜5斤/箱礼盒', '0', '0', '0', '0', '46', '38', '脐橙规格是65-90MM左右（标准果果径平均70MM左右，精品果果径平均80MM左右），一斤大概有2-4个左右，脐橙产自江西省赣州市信丰县安西镇，全过程都是采用农家有机肥种植，生态天然', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/34_P_1448948399009.jpg', '0', '0', '2018-05-31 19:31:56.224997', '70');
INSERT INTO `goods_goods` VALUES ('38', '', '休闲零食膨化食品焦糖/奶油/椒麻味', '0', '0', '0', '0', '154', '99', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/43_P_1448948762645.jpg', '0', '0', '2018-05-31 19:31:56.300288', '74');
INSERT INTO `goods_goods` VALUES ('39', '', '蒙牛未来星儿童成长牛奶骨力型190ml*15盒', '0', '0', '0', '0', '84', '70', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/38_P_1448949220255.jpg', '0', '0', '2018-05-31 19:31:56.375126', '105');
INSERT INTO `goods_goods` VALUES ('40', '', '蒙牛特仑苏有机奶250ml×12盒', '0', '0', '0', '0', '70', '32', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/44_P_1448948850187.jpg', '0', '0', '2018-05-31 19:31:56.450087', '103');
INSERT INTO `goods_goods` VALUES ('41', '', '1元支付测试商品', '0', '0', '0', '0', '1', '1', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'images/201511/goods_img/49_P_1448162819889.jpg', '0', '0', '2018-05-31 19:31:56.525083', '102');
INSERT INTO `goods_goods` VALUES ('42', '', '德运全脂新鲜纯牛奶1L*10盒装整箱', '0', '0', '0', '0', '70', '58', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/40_P_1448949038702.jpg', '0', '0', '2018-05-31 19:31:56.608467', '103');
INSERT INTO `goods_goods` VALUES ('43', '', '木糖醇红枣早餐奶即食豆奶粉538g', '0', '0', '0', '0', '38', '32', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/39_P_1448949115481.jpg', '0', '0', '2018-05-31 19:31:56.733490', '106');
INSERT INTO `goods_goods` VALUES ('44', '', '高钙液体奶200ml*24盒', '0', '0', '0', '0', '26', '22', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/41_P_1448948980358.jpg', '0', '0', '2018-05-31 19:31:56.808588', '107');
INSERT INTO `goods_goods` VALUES ('45', '', '新西兰进口全脂奶粉900g', '0', '0', '0', '0', '720', '600', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/37_P_1448949284365.jpg', '0', '0', '2018-05-31 19:31:56.883373', '104');
INSERT INTO `goods_goods` VALUES ('46', '', '伊利官方直营全脂营养舒化奶250ml*12盒*2提', '0', '0', '0', '0', '43', '36', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/42_P_1448948895193.jpg', '0', '0', '2018-05-31 19:31:57.008493', '103');
INSERT INTO `goods_goods` VALUES ('47', '', '维纳斯橄榄菜籽油5L/桶', '0', '0', '0', '0', '187', '156', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/27_P_1448947771805.jpg', '0', '0', '2018-05-31 19:31:57.083472', '51');
INSERT INTO `goods_goods` VALUES ('48', '', '糙米450gx3包粮油米面', '0', '0', '0', '0', '18', '15', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/23_P_1448948070348.jpg', '0', '0', '2018-05-31 19:31:57.158538', '41');
INSERT INTO `goods_goods` VALUES ('49', '', '精炼一级大豆油5L色拉油粮油食用油', '0', '0', '0', '0', '54', '45', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/26_P_1448947825754.jpg', '0', '0', '2018-05-31 19:31:57.272220', '56');
INSERT INTO `goods_goods` VALUES ('50', '', '橄榄玉米油5L*2桶', '0', '0', '0', '0', '31', '26', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/28_P_1448947699948.jpg', '0', '0', '2018-05-31 19:31:57.399468', '54');
INSERT INTO `goods_goods` VALUES ('51', '222', '山西黑米农家黑米4斤', '2', '2', '2', '2', '222', '22', '222', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/24_P_1448948023823.jpg', '0', '0', '2018-05-31 19:31:00.000000', '55');
INSERT INTO `goods_goods` VALUES ('52', '', '稻园牌稻米油粮油米糠油绿色植物油', '0', '0', '0', '0', '14', '12', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/25_P_1448947875346.jpg', '0', '0', '2018-05-31 19:31:57.649924', '47');
INSERT INTO `goods_goods` VALUES ('53', '', '融氏纯玉米胚芽油5l桶', '0', '0', '0', '0', '14', '12', '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', '1', 'goods/images/29_P_1448947631994.jpg', '0', '0', '2018-05-31 19:31:57.766367', '41');

-- ----------------------------
-- Table structure for goods_goodsbrand
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodsbrand`;
CREATE TABLE `goods_goodsbrand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `desc` longtext NOT NULL,
  `image` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsbrand_category_id_6fc84a73_fk_goods_goodscategory_id` (`category_id`),
  CONSTRAINT `goods_goodsbrand_category_id_6fc84a73_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_goodsbrand
-- ----------------------------
INSERT INTO `goods_goodsbrand` VALUES ('1', 'nike', '1111', 'brands/lyfs-1_g9bhQmH.jpg', '2018-06-26 00:26:00.000000', '1');
INSERT INTO `goods_goodsbrand` VALUES ('2', '11111', '1111', 'brands/scsg-2_s2g3L7M_3D67iHl.jpg', '2018-06-26 01:08:00.000000', '1');

-- ----------------------------
-- Table structure for goods_goodscategory
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodscategory`;
CREATE TABLE `goods_goodscategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `code` varchar(30) NOT NULL,
  `desc` longtext NOT NULL,
  `category_type` int(11) NOT NULL,
  `is_tab` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodscategory_parent_category_id_ccec2509_fk_goods_goo` (`parent_category_id`),
  CONSTRAINT `goods_goodscategory_parent_category_id_ccec2509_fk_goods_goo` FOREIGN KEY (`parent_category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_goodscategory
-- ----------------------------
INSERT INTO `goods_goodscategory` VALUES ('1', '生鲜食品', 'sxsp', '', '1', '1', '2018-05-31 16:06:19.255396', null);
INSERT INTO `goods_goodscategory` VALUES ('2', '精品肉类', 'jprl', '', '2', '0', '2018-05-31 16:06:19.328873', '1');
INSERT INTO `goods_goodscategory` VALUES ('3', '羊肉', 'yr', '', '3', '0', '2018-05-31 16:06:19.362256', '2');
INSERT INTO `goods_goodscategory` VALUES ('4', '禽类', 'ql', '', '3', '0', '2018-05-31 16:06:19.462236', '2');
INSERT INTO `goods_goodscategory` VALUES ('5', '猪肉', 'zr', '', '3', '0', '2018-05-31 16:06:19.495487', '2');
INSERT INTO `goods_goodscategory` VALUES ('6', '牛肉', 'nr', '', '3', '0', '2018-05-31 16:06:19.529348', '2');
INSERT INTO `goods_goodscategory` VALUES ('7', '海鲜水产', 'hxsc', '', '2', '0', '2018-05-31 16:06:19.562293', '1');
INSERT INTO `goods_goodscategory` VALUES ('8', '参鲍', 'cb', '', '3', '0', '2018-05-31 16:06:19.587946', '7');
INSERT INTO `goods_goodscategory` VALUES ('9', '鱼', 'yu', '', '3', '0', '2018-05-31 16:06:19.612185', '7');
INSERT INTO `goods_goodscategory` VALUES ('10', '虾', 'xia', '', '3', '0', '2018-05-31 16:06:19.645408', '7');
INSERT INTO `goods_goodscategory` VALUES ('11', '蟹/贝', 'xb', '', '3', '0', '2018-05-31 16:06:19.678862', '7');
INSERT INTO `goods_goodscategory` VALUES ('12', '蛋制品', 'dzp', '', '2', '0', '2018-05-31 16:06:19.712722', '1');
INSERT INTO `goods_goodscategory` VALUES ('13', '松花蛋/咸鸭蛋', 'xhd_xyd', '', '3', '0', '2018-05-31 16:06:19.745458', '12');
INSERT INTO `goods_goodscategory` VALUES ('14', '鸡蛋', 'jd', '', '3', '0', '2018-05-31 16:06:19.779257', '12');
INSERT INTO `goods_goodscategory` VALUES ('15', '叶菜类', 'ycl', '', '2', '0', '2018-05-31 16:06:19.812349', '1');
INSERT INTO `goods_goodscategory` VALUES ('16', '生菜', 'sc', '', '3', '0', '2018-05-31 16:06:19.845789', '15');
INSERT INTO `goods_goodscategory` VALUES ('17', '菠菜', 'bc', '', '3', '0', '2018-05-31 16:06:19.879087', '15');
INSERT INTO `goods_goodscategory` VALUES ('18', '圆椒', 'yj', '', '3', '0', '2018-05-31 16:06:19.912615', '15');
INSERT INTO `goods_goodscategory` VALUES ('19', '西兰花', 'xlh', '', '3', '0', '2018-05-31 16:06:19.995452', '15');
INSERT INTO `goods_goodscategory` VALUES ('20', '根茎类', 'gjl', '', '2', '0', '2018-05-31 16:06:20.029483', '1');
INSERT INTO `goods_goodscategory` VALUES ('21', '茄果类', 'qgl', '', '2', '0', '2018-05-31 16:06:20.062448', '1');
INSERT INTO `goods_goodscategory` VALUES ('22', '菌菇类', 'jgl', '', '2', '0', '2018-05-31 16:06:20.096119', '1');
INSERT INTO `goods_goodscategory` VALUES ('23', '进口生鲜', 'jksx', '', '2', '0', '2018-05-31 16:06:20.129003', '1');
INSERT INTO `goods_goodscategory` VALUES ('24', '酒水饮料', 'jsyl', '酒水饮料', '1', '1', '2018-05-31 16:06:00.000000', null);
INSERT INTO `goods_goodscategory` VALUES ('25', '白酒', 'bk', '', '2', '0', '2018-05-31 16:06:20.195610', '24');
INSERT INTO `goods_goodscategory` VALUES ('26', '五粮液', 'wly', '', '3', '0', '2018-05-31 16:06:20.229409', '25');
INSERT INTO `goods_goodscategory` VALUES ('27', '泸州老窖', 'lzlj', '', '3', '0', '2018-05-31 16:06:20.262437', '25');
INSERT INTO `goods_goodscategory` VALUES ('28', '茅台', 'mt', '', '3', '0', '2018-05-31 16:06:20.304492', '25');
INSERT INTO `goods_goodscategory` VALUES ('29', '葡萄酒', 'ptj', '', '2', '0', '2018-05-31 16:06:20.337516', '24');
INSERT INTO `goods_goodscategory` VALUES ('30', '洋酒', 'yj', '', '2', '0', '2018-05-31 16:06:20.371196', '24');
INSERT INTO `goods_goodscategory` VALUES ('31', '啤酒', 'pj', '', '2', '0', '2018-05-31 16:06:20.403960', '24');
INSERT INTO `goods_goodscategory` VALUES ('32', '其他酒品', 'qtjp', '', '2', '0', '2018-05-31 16:06:20.437480', '24');
INSERT INTO `goods_goodscategory` VALUES ('33', '其他品牌', 'qtpp', '', '3', '0', '2018-05-31 16:06:20.470538', '32');
INSERT INTO `goods_goodscategory` VALUES ('34', '黄酒', 'hj', '', '3', '0', '2018-05-31 16:06:20.504499', '32');
INSERT INTO `goods_goodscategory` VALUES ('35', '养生酒', 'ysj', '', '3', '0', '2018-05-31 16:06:20.537445', '32');
INSERT INTO `goods_goodscategory` VALUES ('36', '饮料/水', 'yls', '', '2', '0', '2018-05-31 16:06:20.571097', '24');
INSERT INTO `goods_goodscategory` VALUES ('37', '红酒', 'hj', '', '2', '0', '2018-05-31 16:06:20.603813', '24');
INSERT INTO `goods_goodscategory` VALUES ('38', '白兰地', 'bld', '', '3', '0', '2018-05-31 16:06:20.637877', '37');
INSERT INTO `goods_goodscategory` VALUES ('39', '威士忌', 'wsj', '', '3', '0', '2018-05-31 16:06:20.670498', '37');
INSERT INTO `goods_goodscategory` VALUES ('40', '粮油副食', '粮油副食', '', '1', '0', '2018-05-31 16:06:20.704522', null);
INSERT INTO `goods_goodscategory` VALUES ('41', '食用油', '食用油', '', '2', '0', '2018-05-31 16:06:20.737328', '40');
INSERT INTO `goods_goodscategory` VALUES ('42', '其他食用油', '其他食用油', '', '3', '0', '2018-05-31 16:06:20.837437', '41');
INSERT INTO `goods_goodscategory` VALUES ('43', '菜仔油', '菜仔油', '', '3', '0', '2018-05-31 16:06:20.870320', '41');
INSERT INTO `goods_goodscategory` VALUES ('44', '花生油', '花生油', '', '3', '0', '2018-05-31 16:06:20.904153', '41');
INSERT INTO `goods_goodscategory` VALUES ('45', '橄榄油', '橄榄油', '', '3', '0', '2018-05-31 16:06:20.937017', '41');
INSERT INTO `goods_goodscategory` VALUES ('46', '礼盒', '礼盒', '', '3', '0', '2018-05-31 16:06:20.970549', '41');
INSERT INTO `goods_goodscategory` VALUES ('47', '米面杂粮', '米面杂粮', '', '2', '0', '2018-05-31 16:06:21.003604', '40');
INSERT INTO `goods_goodscategory` VALUES ('48', '面粉/面条', '面粉/面条', '', '3', '0', '2018-05-31 16:06:21.145435', '47');
INSERT INTO `goods_goodscategory` VALUES ('49', '大米', '大米', '', '3', '0', '2018-05-31 16:06:21.212179', '47');
INSERT INTO `goods_goodscategory` VALUES ('50', '意大利面', '意大利面', '', '3', '0', '2018-05-31 16:06:21.245319', '47');
INSERT INTO `goods_goodscategory` VALUES ('51', '厨房调料', '厨房调料', '', '2', '0', '2018-05-31 16:06:21.279196', '40');
INSERT INTO `goods_goodscategory` VALUES ('52', '调味油/汁', '调味油/汁', '', '3', '0', '2018-05-31 16:06:21.311970', '51');
INSERT INTO `goods_goodscategory` VALUES ('53', '酱油/醋', '酱油/醋', '', '3', '0', '2018-05-31 16:06:21.345893', '51');
INSERT INTO `goods_goodscategory` VALUES ('54', '南北干货', '南北干货', '', '2', '0', '2018-05-31 16:06:21.378699', '40');
INSERT INTO `goods_goodscategory` VALUES ('55', '方便速食', '方便速食', '', '2', '0', '2018-05-31 16:06:21.412243', '40');
INSERT INTO `goods_goodscategory` VALUES ('56', '调味品', '调味品', '', '2', '0', '2018-05-31 16:06:21.445250', '40');
INSERT INTO `goods_goodscategory` VALUES ('57', '蔬菜水果', '蔬菜水果', '蔬菜水果', '1', '1', '2018-05-31 16:06:00.000000', null);
INSERT INTO `goods_goodscategory` VALUES ('58', '有机蔬菜', '有机蔬菜', '', '2', '0', '2018-05-31 16:06:21.562010', '57');
INSERT INTO `goods_goodscategory` VALUES ('59', '西红柿', '西红柿', '', '3', '0', '2018-05-31 16:06:21.595889', '58');
INSERT INTO `goods_goodscategory` VALUES ('60', '韭菜', '韭菜', '', '3', '0', '2018-05-31 16:06:21.628991', '58');
INSERT INTO `goods_goodscategory` VALUES ('61', '青菜', '青菜', '', '3', '0', '2018-05-31 16:06:21.662492', '58');
INSERT INTO `goods_goodscategory` VALUES ('62', '精选蔬菜', '精选蔬菜', '', '2', '0', '2018-05-31 16:06:21.695209', '57');
INSERT INTO `goods_goodscategory` VALUES ('63', '甘蓝', '甘蓝', '', '3', '0', '2018-05-31 16:06:21.729299', '62');
INSERT INTO `goods_goodscategory` VALUES ('64', '胡萝卜', '胡萝卜', '', '3', '0', '2018-05-31 16:06:21.761974', '62');
INSERT INTO `goods_goodscategory` VALUES ('65', '黄瓜', '黄瓜', '', '3', '0', '2018-05-31 16:06:21.796038', '62');
INSERT INTO `goods_goodscategory` VALUES ('66', '进口水果', '进口水果', '', '2', '0', '2018-05-31 16:06:21.828712', '57');
INSERT INTO `goods_goodscategory` VALUES ('67', '火龙果', '火龙果', '', '3', '0', '2018-05-31 16:06:21.862537', '66');
INSERT INTO `goods_goodscategory` VALUES ('68', '菠萝蜜', '菠萝蜜', '', '3', '0', '2018-05-31 16:06:21.945518', '66');
INSERT INTO `goods_goodscategory` VALUES ('69', '奇异果', '奇异果', '', '3', '0', '2018-05-31 16:06:21.979144', '66');
INSERT INTO `goods_goodscategory` VALUES ('70', '国产水果', '国产水果', '', '2', '0', '2018-05-31 16:06:22.012022', '57');
INSERT INTO `goods_goodscategory` VALUES ('71', '水果礼盒', '水果礼盒', '', '3', '0', '2018-05-31 16:06:22.045877', '70');
INSERT INTO `goods_goodscategory` VALUES ('72', '苹果', '苹果', '', '3', '0', '2018-05-31 16:06:22.079067', '70');
INSERT INTO `goods_goodscategory` VALUES ('73', '雪梨', '雪梨', '', '3', '0', '2018-05-31 16:06:22.112735', '70');
INSERT INTO `goods_goodscategory` VALUES ('74', '休闲食品', '休闲食品', '', '1', '0', '2018-05-31 16:06:22.144605', null);
INSERT INTO `goods_goodscategory` VALUES ('75', '休闲零食', '休闲零食', '', '2', '0', '2018-05-31 16:06:22.179538', '74');
INSERT INTO `goods_goodscategory` VALUES ('76', '果冻', '果冻', '', '3', '0', '2018-05-31 16:06:22.212087', '75');
INSERT INTO `goods_goodscategory` VALUES ('77', '枣类', '枣类', '', '3', '0', '2018-05-31 16:06:22.245823', '75');
INSERT INTO `goods_goodscategory` VALUES ('78', '蜜饯', '蜜饯', '', '3', '0', '2018-05-31 16:06:22.278920', '75');
INSERT INTO `goods_goodscategory` VALUES ('79', '肉类零食', '肉类零食', '', '3', '0', '2018-05-31 16:06:22.312555', '75');
INSERT INTO `goods_goodscategory` VALUES ('80', '坚果炒货', '坚果炒货', '', '3', '0', '2018-05-31 16:06:22.345462', '75');
INSERT INTO `goods_goodscategory` VALUES ('81', '糖果', '糖果', '', '2', '0', '2018-05-31 16:06:22.379423', '74');
INSERT INTO `goods_goodscategory` VALUES ('82', '创意喜糖', '创意喜糖', '', '3', '0', '2018-05-31 16:06:22.412557', '81');
INSERT INTO `goods_goodscategory` VALUES ('83', '口香糖', '口香糖', '', '3', '0', '2018-05-31 16:06:22.445447', '81');
INSERT INTO `goods_goodscategory` VALUES ('84', '软糖', '软糖', '', '3', '0', '2018-05-31 16:06:22.478730', '81');
INSERT INTO `goods_goodscategory` VALUES ('85', '棒棒糖', '棒棒糖', '', '3', '0', '2018-05-31 16:06:22.512578', '81');
INSERT INTO `goods_goodscategory` VALUES ('86', '巧克力', '巧克力', '', '2', '0', '2018-05-31 16:06:22.545602', '74');
INSERT INTO `goods_goodscategory` VALUES ('87', '夹心巧克力', '夹心巧克力', '', '3', '0', '2018-05-31 16:06:22.579126', '86');
INSERT INTO `goods_goodscategory` VALUES ('88', '白巧克力', '白巧克力', '', '3', '0', '2018-05-31 16:06:22.612149', '86');
INSERT INTO `goods_goodscategory` VALUES ('89', '松露巧克力', '松露巧克力', '', '3', '0', '2018-05-31 16:06:22.645087', '86');
INSERT INTO `goods_goodscategory` VALUES ('90', '黑巧克力', '黑巧克力', '', '3', '0', '2018-05-31 16:06:22.678928', '86');
INSERT INTO `goods_goodscategory` VALUES ('91', '肉干肉脯/豆干', '肉干肉脯/豆干', '', '2', '0', '2018-05-31 16:06:22.712637', '74');
INSERT INTO `goods_goodscategory` VALUES ('92', '牛肉干', '牛肉干', '', '3', '0', '2018-05-31 16:06:22.745802', '91');
INSERT INTO `goods_goodscategory` VALUES ('93', '猪肉脯', '猪肉脯', '', '3', '0', '2018-05-31 16:06:22.829177', '91');
INSERT INTO `goods_goodscategory` VALUES ('94', '牛肉粒', '牛肉粒', '', '3', '0', '2018-05-31 16:06:22.862445', '91');
INSERT INTO `goods_goodscategory` VALUES ('95', '猪肉干', '猪肉干', '', '3', '0', '2018-05-31 16:06:22.896368', '91');
INSERT INTO `goods_goodscategory` VALUES ('96', '鱿鱼丝/鱼干', '鱿鱼丝/鱼干', '', '2', '0', '2018-05-31 16:06:22.937262', '74');
INSERT INTO `goods_goodscategory` VALUES ('97', '鱿鱼足', '鱿鱼足', '', '3', '0', '2018-05-31 16:06:22.971261', '96');
INSERT INTO `goods_goodscategory` VALUES ('98', '鱿鱼丝', '鱿鱼丝', '', '3', '0', '2018-05-31 16:06:23.004311', '96');
INSERT INTO `goods_goodscategory` VALUES ('99', '墨鱼/乌贼', '墨鱼/乌贼', '', '3', '0', '2018-05-31 16:06:23.037753', '96');
INSERT INTO `goods_goodscategory` VALUES ('100', '鱿鱼仔', '鱿鱼仔', '', '3', '0', '2018-05-31 16:06:23.070495', '96');
INSERT INTO `goods_goodscategory` VALUES ('101', '鱿鱼片', '鱿鱼片', '', '3', '0', '2018-05-31 16:06:23.104199', '96');
INSERT INTO `goods_goodscategory` VALUES ('102', '奶类食品', '奶类食品', '', '1', '0', '2018-05-31 16:06:23.187190', null);
INSERT INTO `goods_goodscategory` VALUES ('103', '进口奶品', '进口奶品', '', '2', '0', '2018-05-31 16:06:23.230306', '102');
INSERT INTO `goods_goodscategory` VALUES ('104', '国产奶品', '国产奶品', '', '2', '0', '2018-05-31 16:06:23.253795', '102');
INSERT INTO `goods_goodscategory` VALUES ('105', '奶粉', '奶粉', '', '2', '0', '2018-05-31 16:06:23.287529', '102');
INSERT INTO `goods_goodscategory` VALUES ('106', '有机奶', '有机奶', '', '2', '0', '2018-05-31 16:06:23.320594', '102');
INSERT INTO `goods_goodscategory` VALUES ('107', '原料奶', '原料奶', '', '2', '0', '2018-05-31 16:06:23.354433', '102');
INSERT INTO `goods_goodscategory` VALUES ('108', '天然干货', '天然干货', '', '1', '0', '2018-05-31 16:06:23.387280', null);
INSERT INTO `goods_goodscategory` VALUES ('109', '菌菇类', '菌菇类', '', '2', '0', '2018-05-31 16:06:23.421307', '108');
INSERT INTO `goods_goodscategory` VALUES ('110', '腌干海产', '腌干海产', '', '2', '0', '2018-05-31 16:06:23.453965', '108');
INSERT INTO `goods_goodscategory` VALUES ('111', '汤料', '汤料', '', '2', '0', '2018-05-31 16:06:23.488084', '108');
INSERT INTO `goods_goodscategory` VALUES ('112', '豆类', '豆类', '', '2', '0', '2018-05-31 16:06:23.529117', '108');
INSERT INTO `goods_goodscategory` VALUES ('113', '干菜/菜干', '干菜/菜干', '', '2', '0', '2018-05-31 16:06:23.562648', '108');
INSERT INTO `goods_goodscategory` VALUES ('114', '干果/果干', '干果/果干', '', '2', '0', '2018-05-31 16:06:23.595995', '108');
INSERT INTO `goods_goodscategory` VALUES ('115', '豆制品', '豆制品', '', '2', '0', '2018-05-31 16:06:23.629538', '108');
INSERT INTO `goods_goodscategory` VALUES ('116', '腊味', '腊味', '', '2', '0', '2018-05-31 16:06:23.712602', '108');
INSERT INTO `goods_goodscategory` VALUES ('117', '精选茗茶', '精选茗茶', '', '1', '0', '2018-05-31 16:06:23.746422', null);
INSERT INTO `goods_goodscategory` VALUES ('118', '白茶', '白茶', '', '2', '0', '2018-05-31 16:06:23.779105', '117');
INSERT INTO `goods_goodscategory` VALUES ('119', '红茶', '红茶', '', '2', '0', '2018-05-31 16:06:23.812719', '117');
INSERT INTO `goods_goodscategory` VALUES ('120', '绿茶', '绿茶', '111', '2', '1', '2018-05-31 16:06:00.000000', '117');

-- ----------------------------
-- Table structure for goods_goodsimage
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodsimage`;
CREATE TABLE `goods_goodsimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_goodsimage
-- ----------------------------
INSERT INTO `goods_goodsimage` VALUES ('1', 'goods/images/1_P_1449024889889.jpg', '2018-05-31 19:31:51.683158', '2');
INSERT INTO `goods_goodsimage` VALUES ('2', 'goods/images/1_P_1449024889264.jpg', '2018-05-31 19:31:51.749758', '2');
INSERT INTO `goods_goodsimage` VALUES ('3', 'goods/images/1_P_1449024889726.jpg', '2018-05-31 19:31:51.816063', '2');
INSERT INTO `goods_goodsimage` VALUES ('4', 'goods/images/1_P_1449024889018.jpg', '2018-05-31 19:31:51.882947', '2');
INSERT INTO `goods_goodsimage` VALUES ('5', 'goods/images/1_P_1449024889287.jpg', '2018-05-31 19:31:51.917175', '2');
INSERT INTO `goods_goodsimage` VALUES ('6', 'goods/images/2_P_1448945810202.jpg', '2018-05-31 19:31:51.983439', '3');
INSERT INTO `goods_goodsimage` VALUES ('7', 'goods/images/2_P_1448945810814.jpg', '2018-05-31 19:31:52.016260', '3');
INSERT INTO `goods_goodsimage` VALUES ('8', 'goods/images/7_P_1448945104883.jpg', '2018-05-31 19:31:52.082852', '4');
INSERT INTO `goods_goodsimage` VALUES ('9', 'goods/images/7_P_1448945104734.jpg', '2018-05-31 19:31:52.117044', '4');
INSERT INTO `goods_goodsimage` VALUES ('10', 'goods/images/47_P_1448946213263.jpg', '2018-05-31 19:31:52.183294', '5');
INSERT INTO `goods_goodsimage` VALUES ('11', 'goods/images/47_P_1448946213157.jpg', '2018-05-31 19:31:52.216051', '5');
INSERT INTO `goods_goodsimage` VALUES ('12', 'goods/images/10_P_1448944572085.jpg', '2018-05-31 19:31:52.282807', '6');
INSERT INTO `goods_goodsimage` VALUES ('13', 'goods/images/10_P_1448944572532.jpg', '2018-05-31 19:31:52.316499', '6');
INSERT INTO `goods_goodsimage` VALUES ('14', 'goods/images/10_P_1448944572872.jpg', '2018-05-31 19:31:52.399481', '6');
INSERT INTO `goods_goodsimage` VALUES ('15', 'goods/images/4_P_1448945381985.jpg', '2018-05-31 19:31:52.466088', '7');
INSERT INTO `goods_goodsimage` VALUES ('16', 'goods/images/4_P_1448945381013.jpg', '2018-05-31 19:31:52.499420', '7');
INSERT INTO `goods_goodsimage` VALUES ('17', 'goods/images/8_P_1448945032810.jpg', '2018-05-31 19:31:52.566520', '8');
INSERT INTO `goods_goodsimage` VALUES ('18', 'goods/images/8_P_1448945032646.jpg', '2018-05-31 19:31:52.599211', '8');
INSERT INTO `goods_goodsimage` VALUES ('19', 'goods/images/11_P_1448944388277.jpg', '2018-05-31 19:31:52.666069', '9');
INSERT INTO `goods_goodsimage` VALUES ('20', 'goods/images/11_P_1448944388034.jpg', '2018-05-31 19:31:52.699766', '9');
INSERT INTO `goods_goodsimage` VALUES ('21', 'goods/images/11_P_1448944388201.jpg', '2018-05-31 19:31:52.732700', '9');
INSERT INTO `goods_goodsimage` VALUES ('22', 'goods/images/6_P_1448945167279.jpg', '2018-05-31 19:31:52.799166', '10');
INSERT INTO `goods_goodsimage` VALUES ('23', 'goods/images/6_P_1448945167015.jpg', '2018-05-31 19:31:52.832913', '10');
INSERT INTO `goods_goodsimage` VALUES ('24', 'goods/images/9_P_1448944791617.jpg', '2018-05-31 19:31:52.899830', '11');
INSERT INTO `goods_goodsimage` VALUES ('25', 'goods/images/9_P_1448944791129.jpg', '2018-05-31 19:31:52.932657', '11');
INSERT INTO `goods_goodsimage` VALUES ('26', 'goods/images/9_P_1448944791077.jpg', '2018-05-31 19:31:52.966459', '11');
INSERT INTO `goods_goodsimage` VALUES ('27', 'goods/images/9_P_1448944791229.jpg', '2018-05-31 19:31:52.999162', '11');
INSERT INTO `goods_goodsimage` VALUES ('28', 'goods/images/3_P_1448945490837.jpg', '2018-05-31 19:31:53.066137', '12');
INSERT INTO `goods_goodsimage` VALUES ('29', 'goods/images/3_P_1448945490084.jpg', '2018-05-31 19:31:53.099642', '12');
INSERT INTO `goods_goodsimage` VALUES ('30', 'goods/images/48_P_1448943988970.jpg', '2018-05-31 19:31:53.166474', '13');
INSERT INTO `goods_goodsimage` VALUES ('31', 'goods/images/48_P_1448943988898.jpg', '2018-05-31 19:31:53.199622', '13');
INSERT INTO `goods_goodsimage` VALUES ('32', 'goods/images/48_P_1448943988439.jpg', '2018-05-31 19:31:53.283102', '13');
INSERT INTO `goods_goodsimage` VALUES ('33', 'goods/images/5_P_1448945270390.jpg', '2018-05-31 19:31:53.374626', '14');
INSERT INTO `goods_goodsimage` VALUES ('34', 'goods/images/5_P_1448945270067.jpg', '2018-05-31 19:31:53.407904', '14');
INSERT INTO `goods_goodsimage` VALUES ('35', 'goods/images/5_P_1448945270432.jpg', '2018-05-31 19:31:53.441748', '14');
INSERT INTO `goods_goodsimage` VALUES ('36', 'images/201705/goods_img/53_P_1495068879687.jpg', '2018-05-31 19:31:53.558009', '15');
INSERT INTO `goods_goodsimage` VALUES ('37', 'goods/images/16_P_1448947194687.jpg', '2018-05-31 19:31:53.624822', '16');
INSERT INTO `goods_goodsimage` VALUES ('38', 'goods/images/14_P_1448947354031.jpg', '2018-05-31 19:31:53.691274', '17');
INSERT INTO `goods_goodsimage` VALUES ('39', 'goods/images/14_P_1448947354433.jpg', '2018-05-31 19:31:53.724467', '17');
INSERT INTO `goods_goodsimage` VALUES ('40', 'goods/images/12_P_1448947547989.jpg', '2018-05-31 19:31:53.791224', '18');
INSERT INTO `goods_goodsimage` VALUES ('41', 'goods/images/46_P_1448946598711.jpg', '2018-05-31 19:31:53.857986', '19');
INSERT INTO `goods_goodsimage` VALUES ('42', 'goods/images/46_P_1448946598301.jpg', '2018-05-31 19:31:53.890890', '19');
INSERT INTO `goods_goodsimage` VALUES ('43', 'goods/images/21_P_1448946793276.jpg', '2018-05-31 19:31:54.008350', '20');
INSERT INTO `goods_goodsimage` VALUES ('44', 'goods/images/21_P_1448946793153.jpg', '2018-05-31 19:31:54.040400', '20');
INSERT INTO `goods_goodsimage` VALUES ('45', 'goods/images/15_P_1448947257324.jpg', '2018-05-31 19:31:54.107625', '21');
INSERT INTO `goods_goodsimage` VALUES ('46', 'goods/images/15_P_1448947257580.jpg', '2018-05-31 19:31:54.156491', '21');
INSERT INTO `goods_goodsimage` VALUES ('47', 'goods/images/13_P_1448947460386.jpg', '2018-05-31 19:31:54.257831', '22');
INSERT INTO `goods_goodsimage` VALUES ('48', 'goods/images/13_P_1448947460276.jpg', '2018-05-31 19:31:54.299714', '22');
INSERT INTO `goods_goodsimage` VALUES ('49', 'goods/images/13_P_1448947460353.jpg', '2018-05-31 19:31:54.333317', '22');
INSERT INTO `goods_goodsimage` VALUES ('50', 'goods/images/50_P_1448946543091.jpg', '2018-05-31 19:31:54.407949', '23');
INSERT INTO `goods_goodsimage` VALUES ('51', 'goods/images/50_P_1448946542182.jpg', '2018-05-31 19:31:54.449474', '23');
INSERT INTO `goods_goodsimage` VALUES ('52', 'goods/images/51_P_1448946466595.jpg', '2018-05-31 19:31:54.607845', '24');
INSERT INTO `goods_goodsimage` VALUES ('53', 'goods/images/51_P_1448946466208.jpg', '2018-05-31 19:31:54.640405', '24');
INSERT INTO `goods_goodsimage` VALUES ('54', 'goods/images/17_P_1448947102246.jpg', '2018-05-31 19:31:54.717086', '25');
INSERT INTO `goods_goodsimage` VALUES ('55', 'goods/images/20_P_1448946850602.jpg', '2018-05-31 19:31:54.791208', '26');
INSERT INTO `goods_goodsimage` VALUES ('56', 'goods/images/19_P_1448946951581.jpg', '2018-05-31 19:31:54.866560', '27');
INSERT INTO `goods_goodsimage` VALUES ('57', 'goods/images/19_P_1448946951726.jpg', '2018-05-31 19:31:54.957602', '27');
INSERT INTO `goods_goodsimage` VALUES ('58', 'goods/images/18_P_1448947011435.jpg', '2018-05-31 19:31:55.125812', '28');
INSERT INTO `goods_goodsimage` VALUES ('59', 'goods/images/22_P_1448946729629.jpg', '2018-05-31 19:31:55.260805', '29');
INSERT INTO `goods_goodsimage` VALUES ('60', 'goods/images/45_P_1448946661303.jpg', '2018-05-31 19:31:55.324801', '30');
INSERT INTO `goods_goodsimage` VALUES ('61', 'goods/images/32_P_1448948525620.jpg', '2018-05-31 19:31:55.399807', '31');
INSERT INTO `goods_goodsimage` VALUES ('62', 'goods/images/30_P_1448948663450.jpg', '2018-05-31 19:31:55.474416', '32');
INSERT INTO `goods_goodsimage` VALUES ('63', 'goods/images/30_P_1448948662571.jpg', '2018-05-31 19:31:55.508361', '32');
INSERT INTO `goods_goodsimage` VALUES ('64', 'goods/images/30_P_1448948663221.jpg', '2018-05-31 19:31:55.549857', '32');
INSERT INTO `goods_goodsimage` VALUES ('65', 'goods/images/31_P_1448948598947.jpg', '2018-05-31 19:31:55.624376', '33');
INSERT INTO `goods_goodsimage` VALUES ('66', 'goods/images/31_P_1448948598475.jpg', '2018-05-31 19:31:55.658325', '33');
INSERT INTO `goods_goodsimage` VALUES ('67', 'goods/images/35_P_1448948333610.jpg', '2018-05-31 19:31:55.908400', '34');
INSERT INTO `goods_goodsimage` VALUES ('68', 'goods/images/35_P_1448948333313.jpg', '2018-05-31 19:31:55.966068', '34');
INSERT INTO `goods_goodsimage` VALUES ('69', 'goods/images/36_P_1448948234405.jpg', '2018-05-31 19:31:56.040766', '35');
INSERT INTO `goods_goodsimage` VALUES ('70', 'goods/images/36_P_1448948234250.jpg', '2018-05-31 19:31:56.075087', '35');
INSERT INTO `goods_goodsimage` VALUES ('71', 'goods/images/33_P_1448948479966.jpg', '2018-05-31 19:31:56.149934', '36');
INSERT INTO `goods_goodsimage` VALUES ('72', 'goods/images/33_P_1448948479886.jpg', '2018-05-31 19:31:56.191206', '36');
INSERT INTO `goods_goodsimage` VALUES ('73', 'goods/images/34_P_1448948399009.jpg', '2018-05-31 19:31:56.266479', '37');
INSERT INTO `goods_goodsimage` VALUES ('74', 'goods/images/43_P_1448948762645.jpg', '2018-05-31 19:31:56.340783', '38');
INSERT INTO `goods_goodsimage` VALUES ('75', 'goods/images/38_P_1448949220255.jpg', '2018-05-31 19:31:56.416381', '39');
INSERT INTO `goods_goodsimage` VALUES ('76', 'goods/images/44_P_1448948850187.jpg', '2018-05-31 19:31:56.490578', '40');
INSERT INTO `goods_goodsimage` VALUES ('77', 'images/201511/goods_img/49_P_1448162819889.jpg', '2018-05-31 19:31:56.586319', '41');
INSERT INTO `goods_goodsimage` VALUES ('78', 'goods/images/40_P_1448949038702.jpg', '2018-05-31 19:31:56.699935', '42');
INSERT INTO `goods_goodsimage` VALUES ('79', 'goods/images/39_P_1448949115481.jpg', '2018-05-31 19:31:56.774993', '43');
INSERT INTO `goods_goodsimage` VALUES ('80', 'goods/images/41_P_1448948980358.jpg', '2018-05-31 19:31:56.849676', '44');
INSERT INTO `goods_goodsimage` VALUES ('81', 'goods/images/37_P_1448949284365.jpg', '2018-05-31 19:31:56.974690', '45');
INSERT INTO `goods_goodsimage` VALUES ('82', 'goods/images/42_P_1448948895193.jpg', '2018-05-31 19:31:57.049845', '46');
INSERT INTO `goods_goodsimage` VALUES ('83', 'goods/images/27_P_1448947771805.jpg', '2018-05-31 19:31:57.124870', '47');
INSERT INTO `goods_goodsimage` VALUES ('84', 'goods/images/23_P_1448948070348.jpg', '2018-05-31 19:31:57.199920', '48');
INSERT INTO `goods_goodsimage` VALUES ('85', 'goods/images/26_P_1448947825754.jpg', '2018-05-31 19:31:57.358084', '49');
INSERT INTO `goods_goodsimage` VALUES ('86', 'goods/images/28_P_1448947699948.jpg', '2018-05-31 19:31:57.441459', '50');
INSERT INTO `goods_goodsimage` VALUES ('87', 'goods/images/28_P_1448947699777.jpg', '2018-05-31 19:31:57.483107', '50');
INSERT INTO `goods_goodsimage` VALUES ('88', 'goods/images/24_P_1448948023823.jpg', '2018-05-31 19:31:57.566380', '51');
INSERT INTO `goods_goodsimage` VALUES ('89', 'youku-vip.png', '2018-05-31 19:31:57.608236', '51');
INSERT INTO `goods_goodsimage` VALUES ('90', 'goods/images/25_P_1448947875346.jpg', '2018-05-31 19:31:57.724932', '52');
INSERT INTO `goods_goodsimage` VALUES ('91', 'goods/images/29_P_1448947631994.jpg', '2018-05-31 19:31:57.808290', '53');
INSERT INTO `goods_goodsimage` VALUES ('92', '20170202012146821.png', '2018-06-08 00:41:20.068281', '51');

-- ----------------------------
-- Table structure for goods_indexad
-- ----------------------------
DROP TABLE IF EXISTS `goods_indexad`;
CREATE TABLE `goods_indexad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_indexad_category_id_cf834e34_fk_goods_goodscategory_id` (`category_id`),
  KEY `goods_indexad_goods_id_e1361e4f_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_indexad_category_id_cf834e34_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`),
  CONSTRAINT `goods_indexad_goods_id_e1361e4f_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_indexad
-- ----------------------------
INSERT INTO `goods_indexad` VALUES ('6', '1', '1');
INSERT INTO `goods_indexad` VALUES ('7', '24', '3');

-- ----------------------------
-- Table structure for social_auth_association
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_association`;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_auth_association
-- ----------------------------

-- ----------------------------
-- Table structure for social_auth_code
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_code`;
CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_auth_code
-- ----------------------------

-- ----------------------------
-- Table structure for social_auth_nonce
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_nonce`;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_auth_nonce
-- ----------------------------

-- ----------------------------
-- Table structure for social_auth_partial
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_partial`;
CREATE TABLE `social_auth_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint(5) unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_auth_partial
-- ----------------------------

-- ----------------------------
-- Table structure for social_auth_usersocialauth
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_usersocialauth`;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersoci_user_id_17d28448_fk_users_use` (`user_id`),
  CONSTRAINT `social_auth_usersoci_user_id_17d28448_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_auth_usersocialauth
-- ----------------------------
INSERT INTO `social_auth_usersocialauth` VALUES ('1', 'weibo', '3869806480', '{\"auth_time\": 1530241113, \"id\": 3869806480, \"username\": \"\\u5f6c\\u5f6c\\u540c\\u5b66\\u5440\\u4e36\", \"profile_image_url\": \"http://tvax1.sinaimg.cn/crop.0.0.960.960.50/e6a88f90ly8fors4ajljxj20qo0qomzf.jpg\", \"gender\": \"m\", \"access_token\": \"2.00Y8_tNEe5ZOxD2214ec7441stksNE\", \"token_type\": null}', '1');

-- ----------------------------
-- Table structure for trade_ordergoods
-- ----------------------------
DROP TABLE IF EXISTS `trade_ordergoods`;
CREATE TABLE `trade_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id` (`goods_id`),
  KEY `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id` (`order_id`),
  CONSTRAINT `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id` FOREIGN KEY (`order_id`) REFERENCES `trade_orderinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trade_ordergoods
-- ----------------------------
INSERT INTO `trade_ordergoods` VALUES ('2', '1', '2018-06-20 12:51:26.056348', '33', '6');
INSERT INTO `trade_ordergoods` VALUES ('3', '1', '2018-06-20 12:51:26.182365', '31', '6');
INSERT INTO `trade_ordergoods` VALUES ('4', '1', '2018-06-20 12:53:02.227377', '31', '7');

-- ----------------------------
-- Table structure for trade_orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `trade_orderinfo`;
CREATE TABLE `trade_orderinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(30) DEFAULT NULL,
  `trade_no` varchar(100) DEFAULT NULL,
  `pay_status` varchar(30) NOT NULL,
  `post_script` varchar(200) NOT NULL,
  `order_mount` double NOT NULL,
  `pay_time` datetime(6) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `signer_name` varchar(20) NOT NULL,
  `singer_mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  UNIQUE KEY `trade_no` (`trade_no`),
  KEY `trade_orderinfo_user_id_08ffa22c_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `trade_orderinfo_user_id_08ffa22c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trade_orderinfo
-- ----------------------------
INSERT INTO `trade_orderinfo` VALUES ('6', '20180620125116171', null, 'paying', '111', '54', null, '北京市北京城区西城区11', '11', '11', '2018-06-20 12:51:25.957382', '1');
INSERT INTO `trade_orderinfo` VALUES ('7', '20180620125302154', null, 'paying', '0', '36', null, '北京市北京城区西城区11', '11', '11', '2018-06-20 12:53:02.105957', '1');

-- ----------------------------
-- Table structure for trade_shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `trade_shoppingcart`;
CREATE TABLE `trade_shoppingcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trade_shoppingcart_user_id_goods_id_92225e66_uniq` (`user_id`,`goods_id`),
  KEY `trade_shoppingcart_goods_id_8b0f3cb4_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `trade_shoppingcart_goods_id_8b0f3cb4_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `trade_shoppingcart_user_id_da423c9c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trade_shoppingcart
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$36000$VF4IRTwyBiAl$cAZpl2kwlKhMZ140e6wD0vgnJ+J2KjFzQnxi53U+5Fc=', '2018-12-03 17:19:13.981443', '1', 'bin', '彬彬同学呀丶', '', '1', '1', '2018-05-31 03:25:15.896676', 'binbin1', '2018-06-18', 'male', '666', '520@wjq.com');
INSERT INTO `users_userprofile` VALUES ('2', 'pbkdf2_sha256$36000$fQV2S7LfUwtp$wVk0hGAcH6m0YQ/A1pXnzGlxbLH+4e17/7OOIplp/2Y=', null, '0', 'zzz', '', '', '0', '1', '2018-06-07 13:36:01.220325', null, null, 'male', null, '');
INSERT INTO `users_userprofile` VALUES ('5', 'pbkdf2_sha256$36000$5nUzd7ihKoEW$DwbhgTRQcynsxModpDj+4uRPFr0U4YbvjYTli7YFp2k=', null, '0', '18520734281', '', '', '0', '1', '2018-06-07 17:05:28.310101', null, null, 'male', '18520734281', null);
INSERT INTO `users_userprofile` VALUES ('6', 'pbkdf2_sha256$36000$twWrcEjiYRgw$/rchE6Qx+lnxr+QojyYXgCmDk195nBe/dhjvRvbHCX0=', null, '1', 'b', '', '', '1', '1', '2018-12-23 17:50:24.326151', null, null, 'male', null, 'binlovep@qq.com');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for users_verifycode
-- ----------------------------
DROP TABLE IF EXISTS `users_verifycode`;
CREATE TABLE `users_verifycode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_verifycode
-- ----------------------------
INSERT INTO `users_verifycode` VALUES ('1', '0524', '18520734281', '2018-06-06 13:53:42.303210');
INSERT INTO `users_verifycode` VALUES ('2', '6666', '18520734281', '2018-06-07 13:44:00.000000');
INSERT INTO `users_verifycode` VALUES ('3', '8460', '18520734281', '2018-06-07 16:33:48.359604');
INSERT INTO `users_verifycode` VALUES ('4', '2576', '18520734281', '2018-06-07 17:04:53.335123');

-- ----------------------------
-- Table structure for user_operation_useraddress
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_useraddress`;
CREATE TABLE `user_operation_useraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `signer_name` varchar(100) NOT NULL,
  `signer_mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_usera_user_id_fe128593_fk_users_use` (`user_id`),
  CONSTRAINT `user_operation_usera_user_id_fe128593_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_operation_useraddress
-- ----------------------------
INSERT INTO `user_operation_useraddress` VALUES ('2', '北京市', '北京城区', '西城区', '11', '11', '11', '2018-06-18 16:47:26.314035', '1');

-- ----------------------------
-- Table structure for user_operation_userfav
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_userfav`;
CREATE TABLE `user_operation_userfav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_operation_userfav_user_id_goods_id_2dbadda7_uniq` (`user_id`,`goods_id`),
  KEY `user_operation_userfav_goods_id_57fc554f_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `user_operation_userfav_goods_id_57fc554f_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `user_operation_userfav_user_id_4e4de070_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_operation_userfav
-- ----------------------------

-- ----------------------------
-- Table structure for user_operation_userleavingmessage
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_userleavingmessage`;
CREATE TABLE `user_operation_userleavingmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_type` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `file` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_userl_user_id_70d909d6_fk_users_use` (`user_id`),
  CONSTRAINT `user_operation_userl_user_id_70d909d6_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_operation_userleavingmessage
-- ----------------------------
INSERT INTO `user_operation_userleavingmessage` VALUES ('2', '1', '11', '11', 'message/images/2018-03-06_130416.png', '2018-06-18 16:21:58.671619', '1');
INSERT INTO `user_operation_userleavingmessage` VALUES ('3', '1', '11', '11', 'message/images/2018-03-06_130416_L5Jx7PL.png', '2018-06-18 16:41:44.633189', '1');

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-06-03 10:43:43.378499', '127.0.0.1', '24', '酒水饮料', 'change', '修改 desc 和 is_tab', '9', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2018-06-03 10:44:06.018240', '127.0.0.1', '57', '蔬菜水果', 'change', '修改 desc 和 is_tab', '9', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2018-06-07 13:36:15.064028', '127.0.0.1', '2', 'zzz', 'create', '已添加', '5', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2018-06-07 13:44:35.762469', '127.0.0.1', '2', '6666', 'create', '已添加', '6', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2018-06-07 16:31:03.008077', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('6', '2018-06-07 17:04:31.313506', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('7', '2018-06-08 00:41:20.089296', '127.0.0.1', '51', '山西黑米农家黑米4斤', 'change', '修改 goods_sn，click_num，sold_num，fav_num，goods_num，market_price，shop_price 和 goods_brief', '8', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2018-06-24 20:04:51.318915', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'create', '已添加', '7', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2018-06-24 20:05:02.406931', '127.0.0.1', '2', '田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛', 'create', '已添加', '7', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2018-06-24 20:05:14.129852', '127.0.0.1', '3', '乌拉圭进口牛肉卷特级肥牛卷', 'create', '已添加', '7', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2018-06-24 20:16:30.466212', '127.0.0.1', '3', '乌拉圭进口牛肉卷特级肥牛卷', 'change', '修改 image', '7', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2018-06-24 20:16:52.041376', '127.0.0.1', '2', '田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛', 'change', '修改 image', '7', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2018-06-24 20:17:01.409149', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 image', '7', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2018-06-25 21:03:40.888093', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'create', '已添加', '23', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2018-06-25 21:03:49.289699', '127.0.0.1', '2', '新鲜水果甜蜜香脆单果约800克', 'create', '已添加', '23', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2018-06-25 21:15:36.260915', '127.0.0.1', '3', '新鲜水果甜蜜香脆单果约800克', 'create', '已添加', '23', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2018-06-25 21:15:54.595190', '127.0.0.1', '4', '日本蒜蓉粉丝扇贝270克6只装', 'create', '已添加', '23', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2018-06-25 21:16:41.150116', '127.0.0.1', '120', '绿茶', 'change', '修改 desc 和 is_tab', '9', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2018-06-25 21:18:42.349578', '127.0.0.1', '5', '酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐', 'create', '已添加', '23', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2018-06-25 23:30:55.744671', '127.0.0.1', null, '', 'delete', '批量删除 5 个 首页商品类别广告', null, '1');
INSERT INTO `xadmin_log` VALUES ('21', '2018-06-25 23:31:06.707566', '127.0.0.1', '6', '新鲜水果甜蜜香脆单果约800克', 'create', '已添加', '23', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2018-06-25 23:31:56.140574', '127.0.0.1', '7', '田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛', 'create', '已添加', '23', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2018-06-26 00:54:29.569690', '127.0.0.1', '1', 'nike', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2018-06-26 01:08:45.325312', '127.0.0.1', '2', '11111', 'create', '已添加', '10', '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
