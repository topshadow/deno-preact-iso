-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 8.152.216.126    Database: sql287102
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ai_image_find_error`
--

DROP TABLE IF EXISTS `ai_image_find_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_image_find_error` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `create_time` datetime DEFAULT NULL COMMENT 'Create Time',
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_fix` tinyint(1) DEFAULT NULL COMMENT '是否修复',
  `fix_time` datetime DEFAULT NULL COMMENT '修复时间',
  `fix_user` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修复人',
  `fix_remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修复备注',
  `product_id` int unsigned DEFAULT NULL,
  `is_error` tinyint DEFAULT NULL,
  `result_json` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25349 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_crawler`
--

DROP TABLE IF EXISTS `custom_crawler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_crawler` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `create_at` datetime DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` int DEFAULT NULL,
  `config` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_platform_user`
--

DROP TABLE IF EXISTS `data_platform_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_platform_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Create Time',
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shopfw_translation`
--

DROP TABLE IF EXISTS `shopfw_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopfw_translation` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IndexStr` varchar(250) DEFAULT '' COMMENT '用于索引的字符',
  `LanguageCode` varchar(20) DEFAULT '' COMMENT '源语言符号代码',
  `LanguageName` varchar(200) DEFAULT '' COMMENT '源语言名称',
  `SourceText` varchar(250) DEFAULT '' COMMENT '源语言文本',
  `TargetText` varchar(250) DEFAULT '' COMMENT '目标语言文本',
  `IsEnable` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `StateTitle` varchar(200) DEFAULT '' COMMENT '词条状态名称',
  `Memo` varchar(300) DEFAULT '' COMMENT '词条备注',
  `Version` varchar(20) DEFAULT '1' COMMENT '数据表的版本,用默认值标识',
  PRIMARY KEY (`Id`),
  KEY `IndexStr` (`IndexStr`),
  KEY `LanguageCode` (`LanguageCode`),
  KEY `LanguageName` (`LanguageName`),
  KEY `LanguageText` (`SourceText`),
  KEY `TargetText` (`TargetText`),
  KEY `IsEnable` (`IsEnable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_admin`
--

DROP TABLE IF EXISTS `sxo_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_admin` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `token` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'token',
  `username` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `login_pwd` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录密码',
  `login_salt` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录密码配合加密字符串',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `gender` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '性别（0保密，1女，2男）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0正常, 1无效）',
  `login_total` int unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `login_time` int unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `role_id` int unsigned NOT NULL DEFAULT '0' COMMENT '所属角色组',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `token` (`token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_app_center_nav`
--

DROP TABLE IF EXISTS `sxo_app_center_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_app_center_nav` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `event_type` tinyint NOT NULL DEFAULT '-1' COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '事件值',
  `images_url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `desc` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `is_need_login` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否需要登录（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='手机 - 用户中心导航';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_app_home_nav`
--

DROP TABLE IF EXISTS `sxo_app_home_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_app_home_nav` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `event_type` tinyint NOT NULL DEFAULT '-1' COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '事件值',
  `images_url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `is_need_login` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否需要登录（0否，1是）',
  `bg_color` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'css背景色值',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='手机 - 首页导航';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_app_tabbar`
--

DROP TABLE IF EXISTS `sxo_app_tabbar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_app_tabbar` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` char(200) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '配置信息',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='手机底部菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_article`
--

DROP TABLE IF EXISTS `sxo_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_article` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `describe` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `article_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '文章分类',
  `title_color` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题颜色',
  `jump_url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '跳转url地址',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容',
  `cover` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面图片',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '图片数据（一维数组json）',
  `images_count` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '图片数量',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `is_home_recommended` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否首页推荐（0否, 1是）',
  `share_images` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分享图片',
  `seo_title` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `title` (`title`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `access_count` (`access_count`) USING BTREE,
  KEY `image_count` (`images_count`) USING BTREE,
  KEY `article_category_id` (`article_category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文章';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_article_category`
--

DROP TABLE IF EXISTS `sxo_article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_article_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文章分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_attachment`
--

DROP TABLE IF EXISTS `sxo_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_attachment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '附件分类id',
  `title` char(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `original` char(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原始名称',
  `size` bigint unsigned NOT NULL DEFAULT '0' COMMENT '大小（单位b）',
  `ext` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型（后缀名）',
  `type` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型（file文件, image图片, scrawl涂鸦, video视频, remote远程抓取文件）',
  `url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'url路径',
  `hash` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'hash值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15070 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='附件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_attachment_category`
--

DROP TABLE IF EXISTS `sxo_attachment_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_attachment_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `path` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路径值',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `path` (`path`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1070 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='附件分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_brand`
--

DROP TABLE IF EXISTS `sxo_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_brand` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `logo` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'logo图标',
  `name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `describe` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `website_url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '官网地址',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `seo_title` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=771 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='品牌';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_brand_category`
--

DROP TABLE IF EXISTS `sxo_brand_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_brand_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `icon` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='品牌分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_brand_category_join`
--

DROP TABLE IF EXISTS `sxo_brand_category_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_brand_category_join` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `brand_id` int unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `brand_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `brand_id` (`brand_id`) USING BTREE,
  KEY `brand_category_id` (`brand_category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=483 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='品牌分类关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_cart`
--

DROP TABLE IF EXISTS `sxo_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned DEFAULT '0' COMMENT '用户id',
  `goods_id` int unsigned DEFAULT '0' COMMENT '商品id',
  `title` char(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面图片',
  `original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '原价',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '销售价格',
  `stock` int unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `spec` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '规格',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `title` (`title`) USING BTREE,
  KEY `stock` (`stock`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=830 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_config`
--

DROP TABLE IF EXISTS `sxo_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '基本设置id',
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '数据值',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `error_tips` char(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '错误提示',
  `type` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型（admin后台, home前台）',
  `only_tag` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '唯一的标记',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `only_tag` (`only_tag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='基本配置参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_custom_view`
--

DROP TABLE IF EXISTS `sxo_custom_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_custom_view` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `logo` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'logo',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `html_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'html代码',
  `css_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'css样式',
  `js_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'js代码',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `is_header` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否包含头部（0否, 1是）',
  `is_footer` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否包含尾部（0否, 1是）',
  `is_full_screen` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否满屏（0否, 1是）',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `seo_title` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `title` (`name`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `access_count` (`access_count`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='自定义页面';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_design`
--

DROP TABLE IF EXISTS `sxo_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_design` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `logo` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'logo',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '页面配置信息',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `is_header` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否含头部（0否，1是）',
  `is_footer` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否含尾部（0否，1是）',
  `seo_title` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `is_header` (`is_header`) USING BTREE,
  KEY `is_footer` (`is_footer`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='页面设计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_diy`
--

DROP TABLE IF EXISTS `sxo_diy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_diy` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `md5_key` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '唯一标识',
  `logo` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'logo',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '配置数据',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `md5_key` (`md5_key`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='DIY装修';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_email_log`
--

DROP TABLE IF EXISTS `sxo_email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_email_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `smtp_host` char(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SMTP服务器',
  `smtp_port` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SMTP端口',
  `smtp_name` char(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱用户名',
  `smtp_account` char(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发信人邮件',
  `smtp_send_name` char(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发件人姓名',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未发送，1已发送，2已失败）',
  `email` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收件邮箱',
  `title` char(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮件标题',
  `template_value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '邮件内容',
  `template_var` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '邮件变量（数组则json字符串存储）',
  `reason` text COLLATE utf8mb4_general_ci COMMENT '失败原因',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `smtp_host` (`smtp_host`) USING BTREE,
  KEY `smtp_name` (`smtp_name`) USING BTREE,
  KEY `smtp_account` (`smtp_account`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `email` (`email`) USING BTREE,
  KEY `tsc` (`tsc`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='邮件日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_error_log`
--

DROP TABLE IF EXISTS `sxo_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_error_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '错误信息',
  `file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '错误文件路径',
  `line` int unsigned NOT NULL DEFAULT '0' COMMENT '错误文件行号',
  `code` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '错误编码',
  `ip` char(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '请求ip',
  `uri` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'uri地址段',
  `request_params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '请求参数（数组则json字符串存储）',
  `memory_use` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '使用内存',
  `tsc` decimal(10,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `code` (`code`) USING BTREE,
  KEY `ip` (`ip`) USING BTREE,
  KEY `tsc` (`tsc`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10490 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='错误日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_express`
--

DROP TABLE IF EXISTS `sxo_express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_express` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `website_url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '官网地址',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='快递公司';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_form_input`
--

DROP TABLE IF EXISTS `sxo_form_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_form_input` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `md5_key` char(32) NOT NULL DEFAULT '' COMMENT '唯一key',
  `logo` char(255) NOT NULL DEFAULT '' COMMENT 'logo',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(230) NOT NULL DEFAULT '' COMMENT '描述',
  `config` longtext COMMENT '配置数据',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `md5_key` (`md5_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='form表单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_form_input_data`
--

DROP TABLE IF EXISTS `sxo_form_input_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_form_input_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `forminput_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'form表单id',
  `user_id` int unsigned DEFAULT '0' COMMENT '用户id',
  `form_data` longtext COMMENT '表单数据',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `forminput_id` (`forminput_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='form表单数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_form_table_user_fields`
--

DROP TABLE IF EXISTS `sxo_form_table_user_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_form_table_user_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '管理员id或用户id',
  `user_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '用户类型（0后台管理员, 1用户端）',
  `md5_key` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'form表格数据唯一key',
  `fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '字段数据（json格式存储）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `user_type` (`user_type`) USING BTREE,
  KEY `md5_key` (`md5_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='动态表格用户自定义字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods`
--

DROP TABLE IF EXISTS `sxo_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商id（0则表示为主系统）',
  `supplier_goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '供应商商品id',
  `supplier_belong_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '供应商所属类型（0系统, 1多商户, 更多...）',
  `company_id` int unsigned NOT NULL DEFAULT '0' COMMENT '对应公司ID',
  `company_cat_id` int unsigned NOT NULL DEFAULT '0' COMMENT '公司商品分类ID',
  `temp_product_id` int unsigned NOT NULL DEFAULT '0' COMMENT '添加商品临时表数据ID',
  `is_now_goods` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否现货0否1是',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `realstore_goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店系统商品id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `shop_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺商品分类id',
  `shop_standardgoods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺标品id',
  `shop_goods_status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '店铺商品状态（0待审核、1已审核、2已拒绝）',
  `shop_goods_refuse` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '店铺商品拒绝原因',
  `shop_settle_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '结算固定金额',
  `shop_settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值',
  `shop_is_lock` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定、锁定后商家不可更改（0否, 1是）',
  `brand_id` int unsigned DEFAULT '0' COMMENT '品牌id',
  `site_type` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '商品类型（跟随站点类型一致[0销售, 1展示, 2自提, 3虚拟销售, 4销售+自提]）',
  `title` char(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `title_color` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题颜色',
  `simple_desc` char(230) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品简述',
  `spec_desc` char(230) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规格描述',
  `approval_number` char(180) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '批准文号',
  `coding` char(180) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品编码',
  `model` char(180) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品型号',
  `produce_company` char(180) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '生产企业',
  `produce_region` int unsigned NOT NULL DEFAULT '0' COMMENT '产地（地区省id）',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '库存（所有规格库存总和）',
  `inventory_unit` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '库存单位',
  `images` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面图片',
  `original_price` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原价（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低原价',
  `max_original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最大原价',
  `price` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '销售价格（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低价格',
  `max_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最高价格',
  `give_integral` int unsigned NOT NULL DEFAULT '0' COMMENT '购买赠送积分比例',
  `buy_min_number` int unsigned NOT NULL DEFAULT '1' COMMENT '最低起购数量 （默认1）',
  `buy_max_number` int unsigned NOT NULL DEFAULT '0' COMMENT '最大购买数量（最大数值 100000000, 小于等于0或空则不限）',
  `is_deduction_inventory` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否扣减库存（0否, 1是）',
  `is_shelves` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否上架（下架后用户不可见, 0否, 1是）',
  `content_web` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '电脑端详情内容',
  `photo_count` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '相册图片数量',
  `sales_count` int unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `video` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '短视频',
  `is_exist_many_spec` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个规格（0否, 1是）',
  `spec_base` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '规格基础数据',
  `fictitious_goods_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '虚拟商品展示数据',
  `plugins_membershiplevelvip_price_extends` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '会员等级增强版价格扩展数据',
  `plugins_points_exchange_integral` int unsigned NOT NULL DEFAULT '0' COMMENT '积分商城可兑换的积分',
  `plugins_points_exchange_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '积分商城可兑换加金额',
  `plugins_goodsrebuild_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商品重组类型（0常规、1主商品、2副商品）',
  `sort_level` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值（数值越大排在前面）',
  `plugins_intellectstools_buy_btn_link_name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接按钮名称',
  `plugins_intellectstools_buy_btn_link_url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接按钮链接',
  `share_images` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分享图片',
  `seo_title` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '是否已删除（0 未删除, 大于0则是删除时间）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `zq_Id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `zq_Source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `zq_Url` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `zq_StockTag` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `zq_OtherInfo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `place_origin` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `title` (`title`) USING BTREE,
  KEY `access_count` (`access_count`) USING BTREE,
  KEY `photo_count` (`photo_count`) USING BTREE,
  KEY `is_shelves` (`is_shelves`) USING BTREE,
  KEY `brand_id` (`brand_id`) USING BTREE,
  KEY `sales_count` (`sales_count`) USING BTREE,
  KEY `is_delete_time` (`is_delete_time`) USING BTREE,
  KEY `sort_level` (`sort_level`) USING BTREE,
  KEY `access_sales_id_desc` (`access_count`,`sales_count`,`id`) USING BTREE,
  KEY `sort_level_id_desc` (`sort_level`,`id`) USING BTREE,
  KEY `zq_Id` (`zq_Id`),
  KEY `zq_Source` (`zq_Source`),
  KEY `zq_Url` (`zq_Url`),
  KEY `zq_StockTag` (`zq_StockTag`),
  KEY `zq_OtherInfo` (`zq_OtherInfo`),
  KEY `sxo_goods_index_17` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7006033 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods_1225`
--

DROP TABLE IF EXISTS `sxo_goods_1225`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods_1225` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商id（0则表示为主系统）',
  `supplier_goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '供应商商品id',
  `supplier_belong_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '供应商所属类型（0系统, 1多商户, 更多...）',
  `company_id` int unsigned NOT NULL DEFAULT '0' COMMENT '对应公司ID',
  `company_cat_id` int unsigned NOT NULL DEFAULT '0' COMMENT '公司商品分类ID',
  `temp_product_id` int unsigned NOT NULL DEFAULT '0' COMMENT '添加商品临时表数据ID',
  `is_now_goods` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否现货0否1是',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `realstore_goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店系统商品id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `shop_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺商品分类id',
  `shop_standardgoods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺标品id',
  `shop_goods_status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '店铺商品状态（0待审核、1已审核、2已拒绝）',
  `shop_goods_refuse` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '店铺商品拒绝原因',
  `shop_settle_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '结算固定金额',
  `shop_settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值',
  `shop_is_lock` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定、锁定后商家不可更改（0否, 1是）',
  `brand_id` int unsigned DEFAULT '0' COMMENT '品牌id',
  `site_type` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '商品类型（跟随站点类型一致[0销售, 1展示, 2自提, 3虚拟销售, 4销售+自提]）',
  `title` char(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `title_color` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题颜色',
  `simple_desc` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品简述',
  `spec_desc` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规格描述',
  `approval_number` char(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '批准文号',
  `coding` char(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品编码',
  `model` char(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品型号',
  `produce_company` char(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '生产企业',
  `produce_region` int unsigned NOT NULL DEFAULT '0' COMMENT '产地（地区省id）',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '库存（所有规格库存总和）',
  `inventory_unit` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '库存单位',
  `images` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面图片',
  `original_price` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原价（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低原价',
  `max_original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最大原价',
  `price` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '销售价格（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低价格',
  `max_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最高价格',
  `give_integral` int unsigned NOT NULL DEFAULT '0' COMMENT '购买赠送积分比例',
  `buy_min_number` int unsigned NOT NULL DEFAULT '1' COMMENT '最低起购数量 （默认1）',
  `buy_max_number` int unsigned NOT NULL DEFAULT '0' COMMENT '最大购买数量（最大数值 100000000, 小于等于0或空则不限）',
  `is_deduction_inventory` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否扣减库存（0否, 1是）',
  `is_shelves` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否上架（下架后用户不可见, 0否, 1是）',
  `content_web` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '电脑端详情内容',
  `photo_count` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '相册图片数量',
  `sales_count` int unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `video` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '短视频',
  `is_exist_many_spec` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个规格（0否, 1是）',
  `spec_base` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '规格基础数据',
  `fictitious_goods_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '虚拟商品展示数据',
  `plugins_membershiplevelvip_price_extends` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '会员等级增强版价格扩展数据',
  `plugins_points_exchange_integral` int unsigned NOT NULL DEFAULT '0' COMMENT '积分商城可兑换的积分',
  `plugins_points_exchange_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '积分商城可兑换加金额',
  `plugins_goodsrebuild_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商品重组类型（0常规、1主商品、2副商品）',
  `sort_level` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值（数值越大排在前面）',
  `plugins_intellectstools_buy_btn_link_name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接按钮名称',
  `plugins_intellectstools_buy_btn_link_url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接按钮链接',
  `share_images` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分享图片',
  `seo_title` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '是否已删除（0 未删除, 大于0则是删除时间）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `zq_Id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `zq_Source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `zq_Url` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `zq_StockTag` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `zq_OtherInfo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `place_origin` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `title` (`title`) USING BTREE,
  KEY `access_count` (`access_count`) USING BTREE,
  KEY `photo_count` (`photo_count`) USING BTREE,
  KEY `is_shelves` (`is_shelves`) USING BTREE,
  KEY `brand_id` (`brand_id`) USING BTREE,
  KEY `sales_count` (`sales_count`) USING BTREE,
  KEY `is_delete_time` (`is_delete_time`) USING BTREE,
  KEY `sort_level` (`sort_level`) USING BTREE,
  KEY `access_sales_id_desc` (`access_count`,`sales_count`,`id`) USING BTREE,
  KEY `sort_level_id_desc` (`sort_level`,`id`) USING BTREE,
  KEY `zq_Id` (`zq_Id`),
  KEY `zq_Source` (`zq_Source`),
  KEY `zq_Url` (`zq_Url`),
  KEY `zq_StockTag` (`zq_StockTag`),
  KEY `zq_OtherInfo` (`zq_OtherInfo`),
  KEY `sxo_goods_index_17` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7005424 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods_browse`
--

DROP TABLE IF EXISTS `sxo_goods_browse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods_browse` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `access_count` (`access_count`)
) ENGINE=InnoDB AUTO_INCREMENT=3986 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户商品浏览';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods_category`
--

DROP TABLE IF EXISTS `sxo_goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'icon图标',
  `icon_active` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '选中图标',
  `realistic_images` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '实景图',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `vice_name` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '副标题',
  `describe` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `bg_color` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'css背景色值',
  `big_images` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '大图片',
  `is_home_recommended` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否首页推荐（0否, 1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods_category_join`
--

DROP TABLE IF EXISTS `sxo_goods_category_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods_category_join` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=861569 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品分类关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods_category_join_1`
--

DROP TABLE IF EXISTS `sxo_goods_category_join_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods_category_join_1` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品分类关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods_comments`
--

DROP TABLE IF EXISTS `sxo_goods_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '业务订单id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `business_type` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '业务类型名称（如订单 order）',
  `content` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '评价内容',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '图片数据（一维数组json）',
  `reply` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '回复内容',
  `rating` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '评价级别（默认0 1~5）',
  `is_show` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否显示（0否, 1是）',
  `is_anonymous` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否匿名（0否，1是）',
  `is_reply` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否回复（0否，1是）',
  `reply_time` int unsigned NOT NULL DEFAULT '0' COMMENT '回复时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods_content_app`
--

DROP TABLE IF EXISTS `sxo_goods_content_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods_content_app` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `images` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容',
  `sort` tinyint unsigned DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品手机详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods_favor`
--

DROP TABLE IF EXISTS `sxo_goods_favor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods_favor` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户商品收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods_give_integral_log`
--

DROP TABLE IF EXISTS `sxo_goods_give_integral_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods_give_integral_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_detail_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单详情id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品详情id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待发放, 1已发放, 2已关闭）',
  `rate` int unsigned NOT NULL DEFAULT '0' COMMENT '赠送比例',
  `integral` int NOT NULL DEFAULT '0' COMMENT '积分',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `order_detail_id` (`order_detail_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `rate` (`rate`) USING BTREE,
  KEY `integral` (`integral`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品积分赠送日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods_params`
--

DROP TABLE IF EXISTS `sxo_goods_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods_params` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `scope` tinyint unsigned DEFAULT '1' COMMENT '展示范围（0全部, 1详情, 2基础）默认1详情',
  `data_type` tinyint unsigned DEFAULT '0' COMMENT '数据类型（0输入, 1单选, 2多选）',
  `name` char(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数名称',
  `value` char(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `value` (`value`) USING BTREE,
  KEY `scope` (`scope`)
) ENGINE=InnoDB AUTO_INCREMENT=2042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods_params_template`
--

DROP TABLE IF EXISTS `sxo_goods_params_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods_params_template` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品分类id（含子级）',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `config_count` int unsigned NOT NULL DEFAULT '0' COMMENT '参数配置数量',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `config_count` (`config_count`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品参数模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods_params_template_config`
--

DROP TABLE IF EXISTS `sxo_goods_params_template_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods_params_template_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `template_id` int unsigned NOT NULL DEFAULT '0' COMMENT '模板id',
  `scope` tinyint unsigned DEFAULT '1' COMMENT '展示范围（0全部, 1详情, 2基础）默认1详情',
  `name` char(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数名称',
  `required` tinyint unsigned DEFAULT '0' COMMENT '是否必选（0否, 1是）',
  `data_type` tinyint unsigned DEFAULT '0' COMMENT '数据类型（0输入, 1单选, 2多选）',
  `value` text COLLATE utf8mb4_general_ci COMMENT '参数值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `template_id` (`template_id`) USING BTREE,
  KEY `scope` (`scope`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品参数模板值';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods_photo`
--

DROP TABLE IF EXISTS `sxo_goods_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods_photo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `images` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `is_show` tinyint unsigned DEFAULT '1' COMMENT '是否显示（0否, 1是）',
  `sort` tinyint unsigned DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `is_show` (`is_show`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=494764 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品相册图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods_spec_base`
--

DROP TABLE IF EXISTS `sxo_goods_spec_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods_spec_base` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '销售价',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `buy_min_number` int unsigned NOT NULL DEFAULT '0' COMMENT '起购数',
  `buy_max_number` int unsigned NOT NULL DEFAULT '0' COMMENT '限购数',
  `weight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量（kg）',
  `volume` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '体积（m³）',
  `coding` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '编码',
  `barcode` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '条形码',
  `inventory_unit` char(80) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '库存单位',
  `extends` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '扩展数据(json格式存储)',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=536010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品规格基础';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods_spec_template`
--

DROP TABLE IF EXISTS `sxo_goods_spec_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods_spec_template` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品分类id（含子级）',
  `name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品规格模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods_spec_type`
--

DROP TABLE IF EXISTS `sxo_goods_spec_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods_spec_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型值（json字符串存储）',
  `name` char(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型名称',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=487296 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品规格类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_goods_spec_value`
--

DROP TABLE IF EXISTS `sxo_goods_spec_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_goods_spec_value` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_spec_base_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品规格基础id',
  `value` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规格值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `goods_spec_base_id` (`goods_spec_base_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=538191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品规格值';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_layout`
--

DROP TABLE IF EXISTS `sxo_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_layout` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '配置信息',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='布局配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_link`
--

DROP TABLE IF EXISTS `sxo_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_link` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '导航名称',
  `url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'url地址',
  `describe` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `is_new_window_open` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否新窗口打开（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='友情链接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_message`
--

DROP TABLE IF EXISTS `sxo_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_message` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `system_type` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '系统类型（默认 default, 其他按照SYSTEM_TYPE常量类型）',
  `title` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `detail` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详情',
  `business_id` int unsigned NOT NULL DEFAULT '0' COMMENT '业务id',
  `business_type` char(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '业务类型，字符串（如：订单、充值、提现、等...）',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '消息类型（0普通通知, ...）',
  `is_read` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否已读（0否, 1是）',
  `is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '是否已删除（0否, 大于0删除时间）',
  `user_is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '用户是否已删除（0否, 大于0删除时间）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `system_type` (`system_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11929 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_navigation`
--

DROP TABLE IF EXISTS `sxo_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_navigation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '导航名称',
  `url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '自定义url地址',
  `value` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '数据值',
  `data_type` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '数据类型（custom:自定义导航, article_class:文章分类, customview:自定义页面）',
  `nav_type` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '导航类型（header:顶部导航, footer:底部导航）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否显示（0否，1是）',
  `is_new_window_open` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否新窗口打开（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `is_show` (`is_show`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `nav_type` (`nav_type`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='导航';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_order`
--

DROP TABLE IF EXISTS `sxo_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_no` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `warehouse_id` int unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `payment_id` int unsigned NOT NULL DEFAULT '0' COMMENT '支付方式id',
  `system_type` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '系统类型（默认 default, 其他按照SYSTEM_TYPE常量类型）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态（0待确认, 1已确认/待支付, 2已支付/待发货, 3已发货/待收货, 4已完成, 5已取消, 6已关闭）',
  `pay_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '支付状态（0未支付, 1已支付, 2已退款, 3部分退款）',
  `extension_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '扩展展示数据',
  `buy_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '购买商品总数量',
  `increase_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '增加的金额',
  `preferential_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单单价',
  `total_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价(订单最终价格)',
  `pay_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已支付金额',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_quantity` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `client_type` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客户端类型（pc, h5, ios, android, alipay, weixin, baidu）取APPLICATION_CLIENT_TYPE常量值',
  `order_model` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单模式（0销售型, 1展示型, 2自提点, 3虚拟销售）',
  `is_under_line` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否线下支付（0否，1是）',
  `user_note` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户备注',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `confirm_time` int unsigned NOT NULL DEFAULT '0' COMMENT '确认时间',
  `delivery_time` int unsigned NOT NULL DEFAULT '0' COMMENT '发货时间',
  `cancel_time` int unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `collect_time` int unsigned NOT NULL DEFAULT '0' COMMENT '收货时间',
  `close_time` int unsigned NOT NULL DEFAULT '0' COMMENT '关闭时间',
  `comments_time` int unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `is_comments` int unsigned NOT NULL DEFAULT '0' COMMENT '是否已评论（0否, 大于0评论时间）',
  `user_is_comments` int unsigned NOT NULL DEFAULT '0' COMMENT '用户是否已评论（0否, 大于0评论时间）',
  `is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '是否已删除（0否, 大于0删除时间）',
  `user_is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '用户是否已删除（0否, 大于0删除时间）',
  `plugins_feieyun_print_number` int unsigned NOT NULL DEFAULT '0' COMMENT '订单打印次数',
  `shop_is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺是否已删除（0否, 大于0删除时间）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_no` (`order_no`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `pay_status` (`pay_status`) USING BTREE,
  KEY `warehouse_id` (`warehouse_id`) USING BTREE,
  KEY `system_type` (`system_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3492 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_order_address`
--

DROP TABLE IF EXISTS `sxo_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_order_address` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `address_id` int unsigned NOT NULL DEFAULT '0' COMMENT '收件地址id',
  `alias` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '别名',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收件人-姓名',
  `tel` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收件人-电话',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-县/区',
  `address` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收件人-详细地址',
  `province_name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收件人-省-名称',
  `city_name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收件人-市-名称',
  `county_name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收件人-县/区-名称',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-纬度',
  `appoint_time` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '指定时间',
  `extraction_contact_name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '自提-联系人',
  `extraction_contact_tel` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '自提-联系电话',
  `idcard_name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `idcard_number` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证号码',
  `idcard_front` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证人像面图片',
  `idcard_back` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证国微面图片',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=615 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_order_aftersale`
--

DROP TABLE IF EXISTS `sxo_order_aftersale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_order_aftersale` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_no` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `order_detail_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单详情id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `system_type` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '系统类型（默认 default, 其他按照SYSTEM_TYPE常量类型）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待确认, 1待退货, 2待审核, 3已完成, 4已拒绝, 5已取消）',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '业务类型（0仅退款, 1退货退款）',
  `refundment` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '退款类型（0原路退回, 1退至钱包, 2手动处理）',
  `reason` char(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '申请原因',
  `number` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '退款说明',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '凭证图片（一维数组json存储）',
  `refuse_reason` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '拒绝原因',
  `express_name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '快递名称',
  `express_number` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '快递单号',
  `apply_time` int unsigned NOT NULL DEFAULT '0' COMMENT '申请时间',
  `confirm_time` int unsigned NOT NULL DEFAULT '0' COMMENT '确认时间',
  `delivery_time` int unsigned NOT NULL DEFAULT '0' COMMENT '退货时间',
  `audit_time` int unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `cancel_time` int unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `system_type` (`system_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单售后';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_order_aftersale_status_history`
--

DROP TABLE IF EXISTS `sxo_order_aftersale_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_order_aftersale_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_aftersale_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单售后id',
  `original_status` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原始状态',
  `new_status` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最新状态',
  `msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '操作描述',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_aftersale_id` (`order_aftersale_id`) USING BTREE,
  KEY `original_status` (`original_status`) USING BTREE,
  KEY `new_status` (`new_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单售后状态历史纪录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_order_currency`
--

DROP TABLE IF EXISTS `sxo_order_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_order_currency` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `currency_name` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '货币名称',
  `currency_code` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '货币代码',
  `currency_symbol` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '货币符号',
  `currency_rate` decimal(12,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '货币汇率',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `currency_name` (`currency_name`) USING BTREE,
  KEY `currency_code` (`currency_code`) USING BTREE,
  KEY `currency_rate` (`currency_rate`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3492 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单货币';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_order_detail`
--

DROP TABLE IF EXISTS `sxo_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_order_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `title` char(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面图片',
  `original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '原价',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(单价*数量)',
  `spec` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '规格',
  `buy_number` int unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `inventory_unit` char(80) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '库存单位',
  `model` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '型号',
  `spec_weight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量（kg）',
  `spec_volume` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '体积（m³）',
  `spec_coding` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '编码',
  `spec_barcode` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '条形码',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_quantity` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6825 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_order_express`
--

DROP TABLE IF EXISTS `sxo_order_express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_order_express` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `express_id` int unsigned NOT NULL DEFAULT '0' COMMENT '快递id',
  `express_number` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '快递单号',
  `note` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单快递';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_order_extraction_code`
--

DROP TABLE IF EXISTS `sxo_order_extraction_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_order_extraction_code` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `code` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '取货码',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2799 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单自提取货码关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_order_fictitious_value`
--

DROP TABLE IF EXISTS `sxo_order_fictitious_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_order_fictitious_value` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_detail_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单详情id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '虚拟商品展示数据',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `order_detail_id` (`order_detail_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单虚拟销售数据关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_order_goods_inventory_log`
--

DROP TABLE IF EXISTS `sxo_order_goods_inventory_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_order_goods_inventory_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_detail_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单详情id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `order_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态（0待确认, 1已确认/待支付, 2已支付/待发货, 3已发货/待收货, 4已完成, 5已取消, 6已关闭）',
  `original_inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '原库存',
  `new_inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '最新库存',
  `is_rollback` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否回滚（0否, 1是）',
  `rollback_time` int unsigned NOT NULL DEFAULT '0' COMMENT '回滚时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `order_status` (`order_status`) USING BTREE,
  KEY `order_detail_id` (`order_detail_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5548 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单商品库存变更日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_order_service`
--

DROP TABLE IF EXISTS `sxo_order_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_order_service` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `service_name` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '服务人员姓名',
  `service_mobile` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '服务人员手机',
  `service_duration_minute` int unsigned NOT NULL DEFAULT '0' COMMENT '服务持续分钟',
  `service_start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '服务开始时间',
  `service_end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '服务结束时间',
  `note` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单服务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_order_status_history`
--

DROP TABLE IF EXISTS `sxo_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_order_status_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `original_status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原始状态',
  `new_status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最新状态',
  `msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '操作描述',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `original_status` (`original_status`) USING BTREE,
  KEY `new_status` (`new_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9903 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单状态历史纪录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_pay_log`
--

DROP TABLE IF EXISTS `sxo_pay_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_pay_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '支付日志id',
  `log_no` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付日志订单号',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `system_type` char(60) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '系统类型（默认 default, 其他按照SYSTEM_TYPE常量类型）',
  `client_type` char(30) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客户端类型（pc, h5, ios, android, alipay, weixin, baidu）取APPLICATION_CLIENT_TYPE常量值',
  `business_type` char(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '业务类型，字符串（如：订单 order、钱包充值 wallet、会员购买 member、等…）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待支付, 1已支付, 2已关闭）正常30分钟内未支付将关闭',
  `payment` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付方式标记',
  `payment_name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `subject` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单名称',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '业务订单金额',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `trade_no` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付平台交易号',
  `buyer_user` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付平台用户帐号',
  `request_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '请求参数（数组则json字符串存储）',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `close_time` int unsigned NOT NULL DEFAULT '0' COMMENT '关闭时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `payment` (`payment`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `business_type` (`business_type`) USING BTREE,
  KEY `total_price` (`total_price`) USING BTREE,
  KEY `pay_price` (`pay_price`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `pay_time` (`pay_time`) USING BTREE,
  KEY `close_time` (`close_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3716 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='支付日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_pay_log_value`
--

DROP TABLE IF EXISTS `sxo_pay_log_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_pay_log_value` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pay_log_id` int unsigned NOT NULL DEFAULT '0' COMMENT '支付日志id',
  `business_id` int unsigned NOT NULL DEFAULT '0' COMMENT '业务订单id',
  `business_no` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '业务订单号',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pay_log_id` (`pay_log_id`) USING BTREE,
  KEY `business_id` (`business_id`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3724 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='支付日志关联业务数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_pay_request_log`
--

DROP TABLE IF EXISTS `sxo_pay_request_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_pay_request_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `business_type` char(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '业务类型，字符串（如：订单、钱包充值、会员购买、等...）',
  `request_params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '请求参数（数组则json字符串存储）',
  `response_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '响应参数（数组则json字符串存储）',
  `business_handle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '业务处理结果（数组则json字符串存储）',
  `request_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '请求url地址',
  `server_port` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '端口号',
  `server_ip` char(60) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '服务器ip',
  `client_ip` char(60) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客户端ip',
  `os` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '浏览器',
  `method` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '请求类型',
  `scheme` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'http类型',
  `version` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'http版本',
  `client` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '客户端详情信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `business_type` (`business_type`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=369 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='支付请求日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_payment`
--

DROP TABLE IF EXISTS `sxo_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `payment` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '唯一标记',
  `logo` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'logo',
  `version` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '插件版本',
  `apply_version` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '适用系统版本',
  `desc` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '插件描述',
  `author` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者主页',
  `element` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '配置项规则',
  `config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '配置数据',
  `apply_terminal` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '适用终端 php一维数组json字符串存储（pc, h5, ios, android, alipay, weixin, baidu, toutiao, qq）',
  `apply_terminal_old` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '原始适用终端 php一维数组json字符串存储（pc, h5, ios, android, alipay, weixin, baidu, toutiao, qq）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `is_open_user` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否对用户开放',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `payment` (`payment`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='支付方式';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins`
--

DROP TABLE IF EXISTS `sxo_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `plugins` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '唯一标记',
  `plugins_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '插件分类',
  `plugins_menu_control` char(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '插件所属左侧菜单',
  `plugins_is_second_domain` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否二级域名（0否, 1是）',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '应用数据',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `plugins` (`plugins`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_activity`
--

DROP TABLE IF EXISTS `sxo_plugins_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_activity` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `activity_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '活动分类',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '标题',
  `vice_title` char(60) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(30) NOT NULL DEFAULT '' COMMENT 'css颜色值',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `cover` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `banner` char(255) NOT NULL DEFAULT '' COMMENT 'banner图片',
  `keywords` text COMMENT '推荐关键字（英文逗号分割）',
  `goods_count` int unsigned NOT NULL DEFAULT '0' COMMENT '关联商品数量',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `home_data_location` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '首页数据位置（0楼层数据上面，1楼层数据下面）',
  `style_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '样式类型（0图文，1九方格，2一行滚动）',
  `is_home` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否首页展示（0否，1是）',
  `is_goods_detail` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否商品详情页展示（0否，1是）',
  `time_start` int unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `time_end` int unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `share_images` char(255) NOT NULL DEFAULT '' COMMENT '分享图片',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `is_enable` (`is_enable`),
  KEY `is_home` (`is_home`),
  KEY `home_data_location` (`home_data_location`),
  KEY `style_type` (`style_type`),
  KEY `is_goods_detail` (`is_goods_detail`),
  KEY `access_count` (`access_count`),
  KEY `goods_count` (`goods_count`),
  KEY `activity_category_id` (`activity_category_id`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='活动配置 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_activity_category`
--

DROP TABLE IF EXISTS `sxo_plugins_activity_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_activity_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='活动配置分类 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_activity_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_activity_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_activity_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `activity_id` int unsigned NOT NULL DEFAULT '0' COMMENT '活动id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `discount_rate` decimal(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '折扣系数 0.00~0.99',
  `dec_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '减金额',
  `is_recommend` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `goods_id` (`goods_id`),
  KEY `is_recommend` (`is_recommend`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='活动配置关联商品 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_activity_slider`
--

DROP TABLE IF EXISTS `sxo_plugins_activity_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_activity_slider` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform` char(30) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序）',
  `event_type` tinyint NOT NULL DEFAULT '-1' COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` char(255) NOT NULL DEFAULT '' COMMENT '事件值',
  `images_url` char(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `bg_color` char(30) NOT NULL DEFAULT '' COMMENT 'css背景色值',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`),
  KEY `platform` (`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='活动配置轮播图片 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allinpay_back_notice_log`
--

DROP TABLE IF EXISTS `sxo_plugins_allinpay_back_notice_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allinpay_back_notice_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` char(120) NOT NULL DEFAULT '' COMMENT '类型（0实名认证，1签署协议，2余额提现）',
  `notice_params` mediumtext COMMENT '通知参数（数组则json字符串存储）',
  `response_data` mediumtext COMMENT '响应数据（数组则json字符串存储）',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `tsc` (`tsc`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='回调通知日志 - 通联支付分账';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allinpay_bank_data`
--

DROP TABLE IF EXISTS `sxo_plugins_allinpay_bank_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allinpay_bank_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `number` char(60) NOT NULL DEFAULT '' COMMENT '支行行号',
  `name` char(255) NOT NULL DEFAULT '' COMMENT '开户行支行名称',
  `province` char(80) NOT NULL DEFAULT '' COMMENT '开户行所在省',
  `city` char(80) NOT NULL DEFAULT '' COMMENT '开户行所在市',
  `code` char(60) NOT NULL DEFAULT '' COMMENT '云商通银行代码',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `name` (`name`),
  KEY `code` (`code`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='银行数据 - 通联支付分账';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allinpay_base_data`
--

DROP TABLE IF EXISTS `sxo_plugins_allinpay_base_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allinpay_base_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '名称',
  `unique_key` char(200) NOT NULL DEFAULT '' COMMENT '唯一标识key',
  `data` mediumtext COMMENT '数据（数组则json字符串存储）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `unique_key` (`unique_key`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='基础数据 - 通联支付分账';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allinpay_cashout_log`
--

DROP TABLE IF EXISTS `sxo_plugins_allinpay_cashout_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allinpay_cashout_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `order_no` char(60) NOT NULL DEFAULT '' COMMENT '提现单号',
  `out_order_no` char(60) NOT NULL DEFAULT '' COMMENT '通联单号',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '提现状态（0进行中，1提现成功，2提现失败）',
  `bank_accounts` char(60) NOT NULL DEFAULT '' COMMENT '提现账号',
  `cashout_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `fail_reason` char(255) NOT NULL DEFAULT '' COMMENT '失败原因',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `order_no` (`order_no`),
  KEY `out_order_no` (`out_order_no`),
  KEY `status` (`status`),
  KEY `bank_accounts` (`bank_accounts`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='提现日志 - 通联支付分账';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allinpay_merchant`
--

DROP TABLE IF EXISTS `sxo_plugins_allinpay_merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allinpay_merchant` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '开户用户id',
  `merchant_no` char(32) NOT NULL DEFAULT '' COMMENT '商户号',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '商户状态（0待提交，1审核中，2已审核，3拒绝/失败，4已关闭）',
  `member_status` tinyint NOT NULL DEFAULT '0' COMMENT '会员状态（0待生效，1有效，2审核失败，3风控黑名单，4黑名单，5注销，6银行审核中，7银行审核失败）',
  `mobile_bind_status` tinyint NOT NULL DEFAULT '0' COMMENT '手机绑定状态（0未绑定，1绑定成功，2绑定失败）',
  `agreement_sign_status` tinyint NOT NULL DEFAULT '0' COMMENT '协议签署状态（0未签约，1签约成功，2签约失败，3签约中）',
  `license_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '主体类型（0企业商户，1个体商户，2事业单位）',
  `license_name` char(120) NOT NULL DEFAULT '' COMMENT '主体名称',
  `license_number` char(120) NOT NULL DEFAULT '' COMMENT '执照统一社会信用代码',
  `province` char(60) NOT NULL DEFAULT '' COMMENT '营业省份id（接口查询返回）',
  `city` char(60) NOT NULL DEFAULT '' COMMENT '营业市id（接口查询返回）',
  `county` char(60) NOT NULL DEFAULT '' COMMENT '营业区id（接口查询返回）',
  `address_ext` char(80) NOT NULL DEFAULT '' COMMENT '营业详情地址',
  `license_annex` char(255) NOT NULL DEFAULT '' COMMENT '营业执照图片',
  `license_expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '执照过期时间，长期：9999-12-31',
  `license_expire_time_long_term` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '执照过期时间是否长期（0否，1是）',
  `legal_idcard_name` char(60) NOT NULL DEFAULT '' COMMENT '法人-身份证姓名',
  `legal_idcard_number` char(60) NOT NULL DEFAULT '' COMMENT '法人-身份证号码',
  `legal_idcard_front` char(255) NOT NULL DEFAULT '' COMMENT '法人-身份证人像面图片',
  `legal_idcard_back` char(255) NOT NULL DEFAULT '' COMMENT '法人-身份证国微面图片',
  `legal_idcard_start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '法人-身份证有效起始时间',
  `legal_idcard_expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '法人-身份证过期时间，长期：9999-12-31(需要满46岁)',
  `legal_idcard_expire_time_long_term` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '法人-身份证过期时间是否长期（0否，1是）',
  `legal_idcard_mobile` char(30) NOT NULL DEFAULT '' COMMENT '法人-手机号码',
  `bank_accounts_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '账户类型（0个人账户，1公司账户）',
  `bank_data` text COMMENT '开户行数据（json存储）',
  `bank_accounts` char(60) NOT NULL DEFAULT '' COMMENT '开户帐号',
  `bank_reserve_mobile` char(30) NOT NULL DEFAULT '' COMMENT '银行预留手机',
  `fail_reason` char(255) NOT NULL DEFAULT '' COMMENT '失败原因',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `merchant_no` (`merchant_no`),
  KEY `status` (`status`),
  KEY `member_status` (`member_status`),
  KEY `mobile_bind_status` (`mobile_bind_status`),
  KEY `license_type` (`license_type`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商户 - 通联支付分账';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allinpay_merchant_finance`
--

DROP TABLE IF EXISTS `sxo_plugins_allinpay_merchant_finance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allinpay_merchant_finance` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `progress_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '生效中金额',
  `settlement_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '待结算金额',
  `cashout_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '可提现金额',
  `transit_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '在途金额',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `progress_price` (`progress_price`),
  KEY `settlement_price` (`settlement_price`),
  KEY `cashout_price` (`cashout_price`),
  KEY `transit_price` (`transit_price`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商户资金 - 通联支付分账';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allinpay_request_log`
--

DROP TABLE IF EXISTS `sxo_plugins_allinpay_request_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allinpay_request_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(120) NOT NULL DEFAULT '' COMMENT '服务名称',
  `trans_code` char(120) NOT NULL DEFAULT '' COMMENT '接口代码',
  `url` char(230) NOT NULL DEFAULT '' COMMENT 'url地址',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待确认，1已回调，2已失败）',
  `reason` char(230) NOT NULL DEFAULT '' COMMENT '失败原因',
  `request_params` mediumtext COMMENT '请求参数（数组则json字符串存储）',
  `response_data` mediumtext COMMENT '响应数据（数组则json字符串存储）',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `trans_code` (`trans_code`),
  KEY `url` (`url`),
  KEY `status` (`status`),
  KEY `tsc` (`tsc`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='请求日志 - 通联支付分账';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allinpay_separate_log`
--

DROP TABLE IF EXISTS `sxo_plugins_allinpay_separate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allinpay_separate_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `log_no` char(60) NOT NULL DEFAULT '' COMMENT '支付单号',
  `order_no` char(60) NOT NULL DEFAULT '' COMMENT '订单号',
  `merchant_no` char(60) NOT NULL DEFAULT '' COMMENT '商户号',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '分账状态（0未分账，1已分账，2已失败）',
  `platform_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台分账金额',
  `merchant_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商户分账金额',
  `request_params` text COMMENT '请求参数（json存储）',
  `response_data` text COMMENT '响应参数（数组则json字符串存储）',
  `response_describe` char(255) NOT NULL DEFAULT '' COMMENT '响应描述',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `order_id` (`order_id`),
  KEY `log_no` (`log_no`),
  KEY `order_no` (`order_no`),
  KEY `merchant_no` (`merchant_no`),
  KEY `status` (`status`),
  KEY `tsc` (`tsc`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='分账日志 - 通联支付分账';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allocation_accounts_company_verify_log`
--

DROP TABLE IF EXISTS `sxo_plugins_allocation_accounts_company_verify_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allocation_accounts_company_verify_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `ums_reg_id` char(120) NOT NULL DEFAULT '' COMMENT '档案资料注册号',
  `bank_accounts` char(60) NOT NULL DEFAULT '' COMMENT '开户帐号',
  `amount_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '验证金额',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `ums_reg_id` (`ums_reg_id`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='对公验证日志 - 分账系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allocation_accounts_request_verify_log`
--

DROP TABLE IF EXISTS `sxo_plugins_allocation_accounts_request_verify_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allocation_accounts_request_verify_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `ums_reg_id` char(120) NOT NULL DEFAULT '' COMMENT '档案资料注册号',
  `bank_accounts` char(60) NOT NULL DEFAULT '' COMMENT '开户帐号',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `ums_reg_id` (`ums_reg_id`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='对公打款日志 - 分账系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allocation_apply_notice_log`
--

DROP TABLE IF EXISTS `sxo_plugins_allocation_apply_notice_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allocation_apply_notice_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `ums_reg_id` char(120) NOT NULL DEFAULT '' COMMENT '档案资料注册号',
  `notice_params` mediumtext COMMENT '通知参数（数组则json字符串存储）',
  `notice_data` mediumtext COMMENT '通知数据（数组则json字符串存储）',
  `response_data` mediumtext COMMENT '响应数据（数组则json字符串存储）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `ums_reg_id` (`ums_reg_id`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='开户申请通知日志 - 分账系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allocation_base_data`
--

DROP TABLE IF EXISTS `sxo_plugins_allocation_base_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allocation_base_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '服务名称',
  `service` char(200) NOT NULL DEFAULT '' COMMENT '服务接口',
  `params_key` char(200) NOT NULL DEFAULT '' COMMENT '请求参数标识key',
  `params_data` text COMMENT '请求参数（数组则json字符串存储）',
  `data` mediumtext COMMENT '数据（数组则json字符串存储）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `service` (`service`),
  KEY `params_key` (`params_key`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='基础数据 - 分账系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allocation_divide_log`
--

DROP TABLE IF EXISTS `sxo_plugins_allocation_divide_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allocation_divide_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `separate_log_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '分账日志id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `log_no` char(60) NOT NULL DEFAULT '' COMMENT '支付单号',
  `order_no` char(60) NOT NULL DEFAULT '' COMMENT '订单号',
  `merchant_no` char(60) NOT NULL DEFAULT '' COMMENT '企业商户号',
  `company_no` char(60) NOT NULL DEFAULT '' COMMENT '企业用户号',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '结算类型（0资金划付，1流水划付）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '结算状态（0未结算，1已结算，2已失败）',
  `platform_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台分账金额',
  `merchant_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商户分账金额',
  `request_params` text COMMENT '请求参数（json存储）',
  `response_data` text COMMENT '响应参数（数组则json字符串存储）',
  `response_describe` char(255) NOT NULL DEFAULT '' COMMENT '响应描述',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `separate_log_id` (`separate_log_id`),
  KEY `shop_id` (`shop_id`),
  KEY `order_id` (`order_id`),
  KEY `log_no` (`log_no`),
  KEY `order_no` (`order_no`),
  KEY `merchant_no` (`merchant_no`),
  KEY `company_no` (`company_no`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `tsc` (`tsc`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='划付日志 - 分账系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allocation_merchant`
--

DROP TABLE IF EXISTS `sxo_plugins_allocation_merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allocation_merchant` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '开户用户id',
  `unique_id` char(32) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `ums_reg_id` char(120) NOT NULL DEFAULT '' COMMENT '档案资料注册号',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '商户状态（0待提交，1开户进行中，2对公验证打款，3对公验证完成，4平台审核中，5开户成功，6已拒绝/失败，7已关闭）',
  `is_edit` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否可以编辑（0否，1是）',
  `is_base_modify` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '基础信息是否已修改（0否，1是）',
  `is_bank_modify` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '银行信息是否已修改（0否，1是）',
  `license_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '主体类型（0企业商户，1个体商户，2小微商户，3机关事业单位或社会团体，4民办非企业）',
  `license_name` char(120) NOT NULL DEFAULT '' COMMENT '主体名称',
  `license_number` char(120) NOT NULL DEFAULT '' COMMENT '执照统一社会信用代码',
  `province` char(60) NOT NULL DEFAULT '' COMMENT '营业省份id（接口查询返回）',
  `city` char(60) NOT NULL DEFAULT '' COMMENT '营业市id（接口查询返回）',
  `county` char(60) NOT NULL DEFAULT '' COMMENT '营业区id（接口查询返回）',
  `address_ext` char(80) NOT NULL DEFAULT '' COMMENT '营业详情地址',
  `license_annex` char(255) NOT NULL DEFAULT '' COMMENT '营业执照图片',
  `drug_sales_license` char(255) NOT NULL DEFAULT '' COMMENT '药品销售许可证',
  `medical_equipment_sales_license` char(255) NOT NULL DEFAULT '' COMMENT '医疗器械销售许可证',
  `store_entrance_images` char(255) NOT NULL DEFAULT '' COMMENT '门头照片',
  `place_of_business_images` char(255) NOT NULL DEFAULT '' COMMENT '经营场所照片',
  `assist_license_annex` char(255) NOT NULL DEFAULT '' COMMENT '辅助证明材料',
  `merchant_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商户类型（0实体商户，1网络商户，2实体兼线上）',
  `legal_idcard_name` char(60) NOT NULL DEFAULT '' COMMENT '法人-身份证姓名',
  `legal_idcard_number` char(60) NOT NULL DEFAULT '' COMMENT '法人-身份证号码',
  `legal_idcard_hand_held` char(255) NOT NULL DEFAULT '' COMMENT '法人-手持身份证拍照图片',
  `legal_idcard_front` char(255) NOT NULL DEFAULT '' COMMENT '法人-身份证人像面图片',
  `legal_idcard_back` char(255) NOT NULL DEFAULT '' COMMENT '法人-身份证国微面图片',
  `legal_idcard_start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '法人-身份证有效起始时间',
  `legal_idcard_expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '法人-身份证过期时间，长期：9999-12-31(需要满46岁)',
  `legal_idcard_expire_time_long_term` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '法人-身份证过期时间是否长期（0否，1是）',
  `legal_idcard_sex` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '法人-性别（0保密，1男性，2女性）',
  `legal_idcard_vocation` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '法人-职业（0各类专业、技术人员，1国家机关、党群组织、企事业单位的负责人，2办事人员和有关人员，3商业工作人员，4服务性工作人员，5农林牧渔劳动者，6生产工作、运输工作和部分体力劳动者，7不便分类的其他劳动者）',
  `legal_idcard_vocation_other_desc` char(120) NOT NULL DEFAULT '' COMMENT '法人-职业（7不便分类的其他劳动者）描述',
  `legal_idcard_mobile` char(30) NOT NULL DEFAULT '' COMMENT '法人-手机号码',
  `legal_idcard_email` char(30) NOT NULL DEFAULT '' COMMENT '法人-电子邮箱',
  `legal_home_address` char(255) NOT NULL DEFAULT '' COMMENT '法人家庭地址（主体类型为非小微，且受益人非法人时必填）',
  `is_sharehold_not_legal` tinyint(1) NOT NULL DEFAULT '0' COMMENT '控股股东是否为法人（0法人、1非法人）',
  `sharehold_idcard_name` char(60) NOT NULL DEFAULT '' COMMENT '控股股东名称（主体类型为非小微，且控股股东非法人时必填）',
  `sharehold_idcard_number` char(60) NOT NULL DEFAULT '' COMMENT '控股股东证件号码（主体类型为非小微，且控股股东非法人时必填）',
  `sharehold_idcard_start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '控股股东证件有效起始时间（主体类型为非小微，且控股股东非法人时必填）',
  `sharehold_idcard_expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '控股股东证件过期时间，长期：9999-12-31（主体类型为非小微，且控股股东非法人时必填）',
  `sharehold_idcard_expire_time_long_term` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '股股东证件过期时间是否长期（0否，1是）',
  `sharehold_idcard_cert_type` int unsigned NOT NULL DEFAULT '0' COMMENT '控股股东证件证件类型（1身份证、2护照、3军官证、4警官证、5士兵证、6台湾居民来往大陆通行证、7回乡证、8港澳居民来往内地通行证、10港澳台居民居住证、11营业执照、12组织机构代码证、13税务登记证、14商业登记证、15民办非企业登记证书、16批文证明），默认为1身份证',
  `sharehold_idcard_home_address` char(255) NOT NULL DEFAULT '' COMMENT '控股股东家庭地址（主体类型为非小微，且控股股东非法人时必填）',
  `benefit_more_data` text COMMENT '更多受益人（json存储）',
  `bank_accounts_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '账户类型（0个人账户，1公司账户）',
  `bank_data` text COMMENT '开户行数据（json存储）',
  `bank_accounts` char(60) NOT NULL DEFAULT '' COMMENT '开户帐号',
  `bank_accounts_name` char(60) NOT NULL DEFAULT '' COMMENT '开户帐号名称（对公账户填写公司名称，需与营业执照名称保持一致，个人账户填写法人姓名）',
  `bank_accounts_license` char(255) NOT NULL DEFAULT '' COMMENT '开户许可证图片',
  `bank_accounts_front` char(255) NOT NULL DEFAULT '' COMMENT '银行卡正面照',
  `bank_accounts_back` char(255) NOT NULL DEFAULT '' COMMENT '银行卡背面照',
  `mcc_code` char(60) NOT NULL DEFAULT '' COMMENT '行业类别编码（自助签约提供字典）',
  `fax` char(60) NOT NULL DEFAULT '' COMMENT '商户传真',
  `remark` char(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_chain` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否连锁商户（0否，1是）',
  `fail_reason` char(255) NOT NULL DEFAULT '' COMMENT '失败原因',
  `annex_data` text COMMENT '所有附件上传的记录数据（json存储）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `unique_id` (`unique_id`),
  KEY `ums_reg_id` (`ums_reg_id`),
  KEY `status` (`status`),
  KEY `license_type` (`license_type`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商户 - 分账系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allocation_merchant_accounts`
--

DROP TABLE IF EXISTS `sxo_plugins_allocation_merchant_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allocation_merchant_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `apply_status` char(8) NOT NULL DEFAULT '00' COMMENT '账户状态（00：签约中，01：签约成功（中间状态），02：入网审核中（人工审核流程），03：入网成功（最终成功状态），04：入网失败，05：对公账户待验证或异常（对公账户状态），06：风控审核中（系统审核状态），11：短信签生成合同成功（短信签约流程），18：资料填写中（前端流程状态），28：资料验证失败，31：冻结账户，32：客服视频核验中（可再次调用签约接口），33：客服视频核验失败（可再次调用签约接口），34：待客户经理补充材料（等待客户经理处理工单），35：DM已冻结，99：其它错误）',
  `apply_status_msg` char(255) NOT NULL DEFAULT '' COMMENT '账户状态描述',
  `merchant_name` char(120) NOT NULL DEFAULT '' COMMENT '商户名称',
  `merchant_no` char(60) NOT NULL DEFAULT '' COMMENT '商户号',
  `company_no` char(60) NOT NULL DEFAULT '' COMMENT '用户号',
  `fail_reason` char(255) NOT NULL DEFAULT '' COMMENT '失败原因',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `apply_status` (`apply_status`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商户账户 - 分账系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allocation_merchant_finance`
--

DROP TABLE IF EXISTS `sxo_plugins_allocation_merchant_finance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allocation_merchant_finance` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `progress_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '生效中金额',
  `settlement_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '待结算金额',
  `cashout_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '可提现金额',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `progress_price` (`progress_price`),
  KEY `settlement_price` (`settlement_price`),
  KEY `cashout_price` (`cashout_price`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商户资金 - 分账系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allocation_request_log`
--

DROP TABLE IF EXISTS `sxo_plugins_allocation_request_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allocation_request_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '服务名称',
  `service` char(120) NOT NULL DEFAULT '' COMMENT '服务接口',
  `url` char(230) NOT NULL DEFAULT '' COMMENT 'url地址',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待确认，1已回调，2已失败）',
  `reason` char(230) NOT NULL DEFAULT '' COMMENT '失败原因',
  `request_data` mediumtext COMMENT '请求数据（数组则json字符串存储）',
  `request_params` mediumtext COMMENT '请求参数（数组则json字符串存储）',
  `response_data` mediumtext COMMENT '响应数据（数组则json字符串存储）',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `service` (`service`),
  KEY `url` (`url`),
  KEY `status` (`status`),
  KEY `tsc` (`tsc`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='请求日志 - 分账系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_allocation_separate_log`
--

DROP TABLE IF EXISTS `sxo_plugins_allocation_separate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_allocation_separate_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `log_no` char(60) NOT NULL DEFAULT '' COMMENT '支付单号',
  `order_no` char(60) NOT NULL DEFAULT '' COMMENT '订单号',
  `merchant_no` char(60) NOT NULL DEFAULT '' COMMENT '企业商户号',
  `company_no` char(60) NOT NULL DEFAULT '' COMMENT '企业用户号',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '分账类型（0异步分账，1资金分账，2流水分账）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '分账状态（0未分账，1已分账，2已失败）',
  `platform_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台分账金额',
  `merchant_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商户分账金额',
  `request_params` text COMMENT '请求参数（json存储）',
  `response_data` text COMMENT '响应参数（数组则json字符串存储）',
  `response_describe` char(255) NOT NULL DEFAULT '' COMMENT '响应描述',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `order_id` (`order_id`),
  KEY `log_no` (`log_no`),
  KEY `order_no` (`order_no`),
  KEY `merchant_no` (`merchant_no`),
  KEY `company_no` (`company_no`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `tsc` (`tsc`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='分账日志 - 分账系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_antifakecode_scan`
--

DROP TABLE IF EXISTS `sxo_plugins_antifakecode_scan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_antifakecode_scan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `platform` char(30) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `generate_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '生成类型（0纯数字, 1数字加字母）',
  `prefix` char(60) NOT NULL DEFAULT '' COMMENT '防伪码前缀',
  `qrcode_count` int unsigned NOT NULL DEFAULT '0' COMMENT '二维码总数',
  `qrcode_scan_count` int unsigned NOT NULL DEFAULT '0' COMMENT '二维码扫码总数',
  `batch_data` text COMMENT '批次数据（json存储）',
  `scan_first_tips` char(255) NOT NULL DEFAULT '' COMMENT '首次扫码提示',
  `scan_last_tips` char(255) NOT NULL DEFAULT '' COMMENT '2+扫码提示',
  `scan_first_images` char(255) NOT NULL DEFAULT '' COMMENT '首次扫码提示图片',
  `scan_last_images` char(255) NOT NULL DEFAULT '' COMMENT '2+扫码提示图片',
  `scan_top_banner` char(255) NOT NULL DEFAULT '' COMMENT '提示页面顶部banner',
  `scan_bottom_images` char(255) NOT NULL DEFAULT '' COMMENT '提示页面底部图片',
  `note` char(255) NOT NULL DEFAULT '' COMMENT '备注信息',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否, 1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `category_id` (`category_id`),
  KEY `platform` (`platform`),
  KEY `qrcode_count` (`qrcode_count`),
  KEY `qrcode_scan_count` (`qrcode_scan_count`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='防伪码 - 防伪码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_antifakecode_scan_category`
--

DROP TABLE IF EXISTS `sxo_plugins_antifakecode_scan_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_antifakecode_scan_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='防伪码分类 - 防伪码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_antifakecode_scan_qrcode`
--

DROP TABLE IF EXISTS `sxo_plugins_antifakecode_scan_qrcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_antifakecode_scan_qrcode` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `scan_id` int unsigned NOT NULL DEFAULT '0' COMMENT '防伪码id',
  `batch_id` char(60) NOT NULL DEFAULT '' COMMENT '生成批次id',
  `qrcode` char(200) NOT NULL DEFAULT '' COMMENT '二维码标识',
  `scan_count` int unsigned NOT NULL DEFAULT '0' COMMENT '二维码扫码总数',
  `is_scan` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否扫码（0否, 1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `scan_id` (`scan_id`),
  KEY `batch_id` (`batch_id`),
  KEY `qrcode` (`qrcode`),
  KEY `is_scan` (`is_scan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='防伪码二维码列表 - 防伪码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_antifakecode_scan_qrcode_log`
--

DROP TABLE IF EXISTS `sxo_plugins_antifakecode_scan_qrcode_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_antifakecode_scan_qrcode_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `scan_id` int unsigned NOT NULL DEFAULT '0' COMMENT '防伪码id',
  `scan_qrcode_id` int unsigned NOT NULL DEFAULT '0' COMMENT '防伪码二维码id',
  `client_ip` char(200) NOT NULL DEFAULT '' COMMENT '客户端ip',
  `os` char(20) NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` char(20) NOT NULL DEFAULT '' COMMENT '浏览器',
  `client` text COMMENT '客户端详情信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `scan_id` (`scan_id`),
  KEY `scan_qrcode_id` (`scan_qrcode_id`),
  KEY `client_ip` (`client_ip`),
  KEY `os` (`os`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='防伪码二维码日志 - 防伪码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_appadmin_version`
--

DROP TABLE IF EXISTS `sxo_plugins_appadmin_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_appadmin_version` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `platform` char(30) NOT NULL DEFAULT '' COMMENT '所属平台（ios 苹果APP, android 安卓APP）',
  `version_old` char(30) NOT NULL DEFAULT '' COMMENT '老版本号',
  `version_new` char(30) NOT NULL DEFAULT '' COMMENT '新版本号',
  `update_url` char(255) NOT NULL DEFAULT '' COMMENT '更新地址',
  `content` longtext COMMENT '更新日志',
  `note` char(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_force_update` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否强制更新（0否，1是）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `platform` (`platform`),
  KEY `version_old` (`version_old`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='版本管理 - APP管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_ask`
--

DROP TABLE IF EXISTS `sxo_plugins_ask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_ask` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '联系人',
  `tel` char(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `title` char(230) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COMMENT '详细内容',
  `reply` text COMMENT '回复内容',
  `is_reply` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否已回复（0否, 1是）',
  `reply_time` int unsigned NOT NULL DEFAULT '0' COMMENT '回复时间',
  `is_show` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否显示（0不显示, 1显示）',
  `images` text COMMENT '图片数据（一维数组json）',
  `images_count` int unsigned NOT NULL DEFAULT '0' COMMENT '图片数量',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `comments_count` int unsigned NOT NULL DEFAULT '0' COMMENT '评论总数',
  `give_thumbs_count` int unsigned NOT NULL DEFAULT '0' COMMENT '点赞总数',
  `email_notice` char(60) NOT NULL DEFAULT '' COMMENT '回复邮箱通知',
  `mobile_notice` char(60) NOT NULL DEFAULT '' COMMENT '回复手机通知',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`name`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE,
  KEY `is_show` (`is_show`) USING BTREE,
  KEY `images_count` (`images_count`) USING BTREE,
  KEY `access_count` (`access_count`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户问答 - 问答';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_ask_category`
--

DROP TABLE IF EXISTS `sxo_plugins_ask_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_ask_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='问答分类 - 问答';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_ask_comments`
--

DROP TABLE IF EXISTS `sxo_plugins_ask_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_ask_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `ask_id` int unsigned NOT NULL DEFAULT '0' COMMENT '问答id',
  `ask_comments_id` int unsigned NOT NULL DEFAULT '0' COMMENT '问答评论id',
  `reply_comments_id` int unsigned NOT NULL DEFAULT '0' COMMENT '一级回复评论id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待审核、1已审核、2已隐藏）',
  `md5_key` char(32) NOT NULL DEFAULT '' COMMENT '数据唯一md5key',
  `content` text COMMENT '评论内容',
  `comments_count` int unsigned NOT NULL DEFAULT '0' COMMENT '评论总数',
  `give_thumbs_count` int unsigned NOT NULL DEFAULT '0' COMMENT '点赞总数',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ask_id` (`ask_id`),
  KEY `ask_comments_id` (`ask_comments_id`),
  KEY `reply_comments_id` (`reply_comments_id`),
  KEY `status` (`status`),
  KEY `md5_key` (`md5_key`),
  KEY `comments_count` (`comments_count`),
  KEY `give_thumbs_count` (`give_thumbs_count`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='问答评论 - 问答';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_ask_comments_give_integral_log`
--

DROP TABLE IF EXISTS `sxo_plugins_ask_comments_give_integral_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_ask_comments_give_integral_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ask_id` int unsigned NOT NULL DEFAULT '0' COMMENT '问答id',
  `comments_id` int unsigned NOT NULL DEFAULT '0' COMMENT '评论id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `integral` int unsigned NOT NULL DEFAULT '0' COMMENT '奖励积分',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `ask_id` (`ask_id`),
  KEY `comments_id` (`comments_id`),
  KEY `user_id` (`user_id`),
  KEY `integral` (`integral`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='问答评论奖励积分日志 - 问答';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_ask_give_integral_log`
--

DROP TABLE IF EXISTS `sxo_plugins_ask_give_integral_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_ask_give_integral_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ask_id` int unsigned NOT NULL DEFAULT '0' COMMENT '问答id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `integral` int unsigned NOT NULL DEFAULT '0' COMMENT '奖励积分',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `ask_id` (`ask_id`),
  KEY `user_id` (`user_id`),
  KEY `integral` (`integral`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='问答发布奖励积分日志 - 问答';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_ask_give_thumbs`
--

DROP TABLE IF EXISTS `sxo_plugins_ask_give_thumbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_ask_give_thumbs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `ask_id` int unsigned NOT NULL DEFAULT '0' COMMENT '问答id',
  `ask_comments_id` int unsigned NOT NULL DEFAULT '0' COMMENT '问答评论id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ask_id` (`ask_id`),
  KEY `ask_comments_id` (`ask_comments_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='问答点赞 - 问答';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_ask_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_ask_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_ask_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='问答推荐商品 - 问答';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_ask_slider`
--

DROP TABLE IF EXISTS `sxo_plugins_ask_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_ask_slider` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform` char(255) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `event_type` tinyint NOT NULL DEFAULT '-1' COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` char(255) NOT NULL DEFAULT '' COMMENT '事件值',
  `images_url` char(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `bg_color` char(30) NOT NULL DEFAULT '' COMMENT 'css背景色值',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='问答系统轮播图 - 问答';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_ask_thumbs_give_integral_log`
--

DROP TABLE IF EXISTS `sxo_plugins_ask_thumbs_give_integral_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_ask_thumbs_give_integral_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ask_id` int unsigned NOT NULL DEFAULT '0' COMMENT '问答id',
  `comments_id` int unsigned NOT NULL DEFAULT '0' COMMENT '问答id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `integral` int unsigned NOT NULL DEFAULT '0' COMMENT '奖励积分',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `ask_id` (`ask_id`),
  KEY `comments_id` (`comments_id`),
  KEY `user_id` (`user_id`),
  KEY `integral` (`integral`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='问答点赞奖励积分日志 - 问答';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_binding`
--

DROP TABLE IF EXISTS `sxo_plugins_binding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_binding` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `title` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '简介',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '类型（0组合，1搭配）',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '组合价',
  `rate` decimal(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '折扣率（0~0.99）',
  `start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `buy_min_number` int unsigned NOT NULL DEFAULT '0' COMMENT '搭配最低起购数',
  `is_home_show` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否首页展示（0否，1是）',
  `is_home_show_goods` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '首页默认展示商品（0否，1是）',
  `is_goods_detail_show` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否商品页展示（0否，1是）',
  `is_freightfee` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否包邮（0否，1是）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `share_images` char(255) NOT NULL DEFAULT '' COMMENT '分享图片',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `title` (`title`),
  KEY `type` (`type`),
  KEY `is_home_show` (`is_home_show`),
  KEY `is_goods_detail_show` (`is_goods_detail_show`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='组合 - 组合搭配';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_binding_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_binding_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_binding_goods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `binding_id` int unsigned NOT NULL DEFAULT '0' COMMENT '组合id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `discount_rate` decimal(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '折扣系数 0.00~0.99',
  `dec_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '减金额',
  `is_required` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否必须选择（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `binding_id` (`binding_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1540 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='组合商品 - 组合搭配';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_binding_relevant_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_binding_relevant_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_binding_relevant_goods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `main_goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '主商品id',
  `vice_goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '关联商品id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `main_goods_id` (`main_goods_id`),
  KEY `vice_goods_id` (`vice_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品关联 - 组合搭配';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_blog`
--

DROP TABLE IF EXISTS `sxo_plugins_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_blog` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `title` char(230) NOT NULL DEFAULT '' COMMENT '标题',
  `blog_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '文章分类',
  `title_color` char(200) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待审核、1已审核、2已拒绝）',
  `jump_url` char(255) NOT NULL DEFAULT '' COMMENT '跳转url地址',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `content` longtext COMMENT '内容',
  `cover` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `goods_count` int unsigned NOT NULL DEFAULT '0' COMMENT '推荐商品数量',
  `images` text COMMENT '图片数据（一维数组json）',
  `images_count` int unsigned NOT NULL DEFAULT '0' COMMENT '图片数量',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `comments_count` int unsigned NOT NULL DEFAULT '0' COMMENT '评论总数',
  `give_thumbs_count` int unsigned NOT NULL DEFAULT '0' COMMENT '点赞总数',
  `is_recommended` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐（0否, 1是）',
  `is_hot` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否热门（0否, 1是）',
  `is_live_play` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否直播（0否, 1是）',
  `sort_level` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值（数值越大排在前面）',
  `video_url` char(255) NOT NULL DEFAULT '' COMMENT '视频地址',
  `reason` char(230) NOT NULL DEFAULT '' COMMENT '审核失败原因',
  `share_images` char(255) NOT NULL DEFAULT '' COMMENT '分享图片',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `title` (`title`),
  KEY `blog_category_id` (`blog_category_id`),
  KEY `status` (`status`),
  KEY `is_enable` (`is_enable`),
  KEY `images_count` (`images_count`),
  KEY `access_count` (`access_count`),
  KEY `comments_count` (`comments_count`),
  KEY `give_thumbs_count` (`give_thumbs_count`),
  KEY `sort_level` (`sort_level`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='博客博文 - 博客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_blog_auth_icon`
--

DROP TABLE IF EXISTS `sxo_plugins_blog_auth_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_blog_auth_icon` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT '图标',
  `use_count` int unsigned NOT NULL DEFAULT '0' COMMENT '使用总数',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `use_count` (`use_count`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='认证图标 - 博客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_blog_auth_icon_user`
--

DROP TABLE IF EXISTS `sxo_plugins_blog_auth_icon_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_blog_auth_icon_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `auth_icon_id` int unsigned NOT NULL DEFAULT '0' COMMENT '认证id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `auth_icon_id` (`auth_icon_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户认证图标 - 博客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_blog_category`
--

DROP TABLE IF EXISTS `sxo_plugins_blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_blog_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='博客分类 - 博客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_blog_comments`
--

DROP TABLE IF EXISTS `sxo_plugins_blog_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_blog_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `blog_id` int unsigned NOT NULL DEFAULT '0' COMMENT '博客id',
  `blog_comments_id` int unsigned NOT NULL DEFAULT '0' COMMENT '博客评论id',
  `reply_comments_id` int unsigned NOT NULL DEFAULT '0' COMMENT '一级回复评论id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待审核、1已审核、2已隐藏）',
  `md5_key` char(32) NOT NULL DEFAULT '' COMMENT '数据唯一md5key',
  `content` text COMMENT '评论内容',
  `comments_count` int unsigned NOT NULL DEFAULT '0' COMMENT '评论总数',
  `give_thumbs_count` int unsigned NOT NULL DEFAULT '0' COMMENT '点赞总数',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `blog_id` (`blog_id`),
  KEY `blog_comments_id` (`blog_comments_id`),
  KEY `reply_comments_id` (`reply_comments_id`),
  KEY `status` (`status`),
  KEY `md5_key` (`md5_key`),
  KEY `comments_count` (`comments_count`),
  KEY `give_thumbs_count` (`give_thumbs_count`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='博客评论 - 博客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_blog_comments_give_integral_log`
--

DROP TABLE IF EXISTS `sxo_plugins_blog_comments_give_integral_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_blog_comments_give_integral_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `blog_id` int unsigned NOT NULL DEFAULT '0' COMMENT '博文id',
  `comments_id` int unsigned NOT NULL DEFAULT '0' COMMENT '问答id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `integral` int unsigned NOT NULL DEFAULT '0' COMMENT '奖励积分',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  KEY `comments_id` (`comments_id`),
  KEY `user_id` (`user_id`),
  KEY `integral` (`integral`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='博文评论奖励积分日志 - 博客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_blog_give_integral_log`
--

DROP TABLE IF EXISTS `sxo_plugins_blog_give_integral_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_blog_give_integral_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `blog_id` int unsigned NOT NULL DEFAULT '0' COMMENT '博文id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `integral` int unsigned NOT NULL DEFAULT '0' COMMENT '奖励积分',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  KEY `user_id` (`user_id`),
  KEY `integral` (`integral`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='博文发布奖励积分日志 - 博客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_blog_give_thumbs`
--

DROP TABLE IF EXISTS `sxo_plugins_blog_give_thumbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_blog_give_thumbs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `blog_id` int unsigned NOT NULL DEFAULT '0' COMMENT '博客id',
  `blog_comments_id` int unsigned NOT NULL DEFAULT '0' COMMENT '博客评论id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `blog_id` (`blog_id`),
  KEY `blog_comments_id` (`blog_comments_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1316 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='博客点赞 - 博客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_blog_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_blog_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_blog_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `blog_id` int unsigned NOT NULL DEFAULT '0' COMMENT '博文id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='博客推荐关联商品 - 博客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_blog_recommend`
--

DROP TABLE IF EXISTS `sxo_plugins_blog_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_blog_recommend` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '标题',
  `vice_title` char(60) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(30) NOT NULL DEFAULT '' COMMENT 'css颜色值',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `cover` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `more_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '更多分类指向地址',
  `keywords` text COMMENT '推荐关键字（英文逗号分割）',
  `blog_count` int unsigned NOT NULL DEFAULT '0' COMMENT '关联博客数量',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `is_goods_detail` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否商品详情页展示（0否，1是）',
  `is_home` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否首页展示（0否，1是）',
  `home_data_location` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '首页数据位置（0楼层数据上面，1楼层数据下面）',
  `style_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '样式类型（0图文，1九方格，2一行滚动）',
  `data_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '数据类型（0自动模式，1手动模式）',
  `order_by_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '自动数据-排序类型（0最新，1热度，2更新）',
  `order_by_rule` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '自动数据-排序规则（0降序(desc)，1升序(asc)）',
  `data_auto_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '自动数据-指定分类条件',
  `data_auto_number` int unsigned NOT NULL DEFAULT '0' COMMENT '自动数据-展示数量',
  `time_start` int unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `time_end` int unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `is_enable` (`is_enable`),
  KEY `is_home` (`is_home`),
  KEY `is_goods_detail` (`is_goods_detail`),
  KEY `blog_count` (`blog_count`),
  KEY `access_count` (`access_count`),
  KEY `style_type` (`style_type`),
  KEY `data_type` (`data_type`),
  KEY `order_by_type` (`order_by_type`),
  KEY `order_by_rule` (`order_by_rule`),
  KEY `upd_time` (`upd_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='博客推荐 - 博客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_blog_recommend_join`
--

DROP TABLE IF EXISTS `sxo_plugins_blog_recommend_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_blog_recommend_join` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `recommend_id` int unsigned NOT NULL DEFAULT '0' COMMENT '推荐id',
  `blog_id` int unsigned NOT NULL DEFAULT '0' COMMENT '博客id',
  `is_recommend` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `recommend_id` (`recommend_id`),
  KEY `blog_id` (`blog_id`),
  KEY `is_recommend` (`is_recommend`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='博客推荐关联 - 博客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_blog_slide`
--

DROP TABLE IF EXISTS `sxo_plugins_blog_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_blog_slide` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform` char(255) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `event_type` tinyint NOT NULL DEFAULT '-1' COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` char(255) NOT NULL DEFAULT '' COMMENT '事件值',
  `images_url` char(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `bg_color` char(30) NOT NULL DEFAULT '' COMMENT 'css背景色值',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='博客轮播图片 - 博客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_blog_thumbs_give_integral_log`
--

DROP TABLE IF EXISTS `sxo_plugins_blog_thumbs_give_integral_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_blog_thumbs_give_integral_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `blog_id` int unsigned NOT NULL DEFAULT '0' COMMENT '博文id',
  `comments_id` int unsigned NOT NULL DEFAULT '0' COMMENT '问答id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `integral` int unsigned NOT NULL DEFAULT '0' COMMENT '奖励积分',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  KEY `comments_id` (`comments_id`),
  KEY `user_id` (`user_id`),
  KEY `integral` (`integral`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='博文点赞奖励积分日志 - 博客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_category`
--

DROP TABLE IF EXISTS `sxo_plugins_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='应用分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_certificate_shop_region`
--

DROP TABLE IF EXISTS `sxo_plugins_certificate_shop_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_certificate_shop_region` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '多商户id',
  `region_ids` text COMMENT '地区id（一维数组json）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户可售地区 - 资质认证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_certificate_user_auth`
--

DROP TABLE IF EXISTS `sxo_plugins_certificate_user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_certificate_user_auth` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `unique_key` char(32) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `title` char(120) NOT NULL DEFAULT '' COMMENT '标题',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待审核, 1已审核, 2已拒绝, 3已过期）',
  `licence_name` char(160) NOT NULL DEFAULT '' COMMENT '证件名称',
  `licence_number` char(160) NOT NULL DEFAULT '' COMMENT '证件号码',
  `licence_images` char(255) NOT NULL DEFAULT '' COMMENT '证件图片地址',
  `licence_expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `reason` char(255) NOT NULL DEFAULT '' COMMENT '拒绝、失败原因',
  `audit_time` int unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `unique_key` (`unique_key`),
  KEY `status` (`status`),
  KEY `licence_name` (`licence_name`),
  KEY `licence_number` (`licence_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户资质认证 - 资质认证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_certificate_user_region`
--

DROP TABLE IF EXISTS `sxo_plugins_certificate_user_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_certificate_user_region` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `region_ids` text COMMENT '地区id（一维数组json）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户可购地区 - 资质认证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_chat_connect_log`
--

DROP TABLE IF EXISTS `sxo_plugins_chat_connect_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_chat_connect_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cuid` int unsigned NOT NULL DEFAULT '0' COMMENT '消息用户id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id（无用户id则为游客）',
  `uuid` char(60) NOT NULL DEFAULT '' COMMENT '用户uuid（游客以uuid为准）',
  `fd` int unsigned NOT NULL DEFAULT '0' COMMENT 'socket消息id',
  `platform` char(30) NOT NULL DEFAULT 'pc' COMMENT '来源平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序）',
  `ip` char(30) NOT NULL DEFAULT '' COMMENT '用户ip',
  `params` text COMMENT '请求参数',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `cuid` (`cuid`),
  KEY `user_id` (`user_id`),
  KEY `uuid` (`uuid`),
  KEY `fd` (`fd`),
  KEY `platform` (`platform`),
  KEY `ip` (`ip`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=711 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户连接日志 - 客服';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_chat_friend`
--

DROP TABLE IF EXISTS `sxo_plugins_chat_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_chat_friend` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `send_cuid` int unsigned NOT NULL DEFAULT '0' COMMENT '发送用户基础id',
  `receive_cuid` int unsigned NOT NULL DEFAULT '0' COMMENT '接收用户基础id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常, 1其他异常）',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '备注名称',
  `label` char(230) NOT NULL DEFAULT '' COMMENT '标签（多个以英文逗号分隔[,]）',
  `remark` char(230) NOT NULL DEFAULT '' COMMENT '备注',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `send_cuid` (`send_cuid`),
  KEY `receive_cuid` (`receive_cuid`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `add_time` (`add_time`),
  KEY `upd_time` (`upd_time`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='好友关系 - 客服';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_chat_ip_query_log`
--

DROP TABLE IF EXISTS `sxo_plugins_chat_ip_query_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_chat_ip_query_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ip` char(30) NOT NULL DEFAULT '' COMMENT 'ip',
  `country` char(60) NOT NULL DEFAULT '' COMMENT '国家',
  `province` char(60) NOT NULL DEFAULT '' COMMENT '省份/自治区/直辖市',
  `city` char(60) NOT NULL DEFAULT '' COMMENT '地级市',
  `district` char(60) NOT NULL DEFAULT '' COMMENT '区/县',
  `isp` char(60) NOT NULL DEFAULT '' COMMENT '运营商',
  `zip` char(60) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `zone` char(60) NOT NULL DEFAULT '' COMMENT '地区区号',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`),
  KEY `country` (`country`),
  KEY `province` (`province`),
  KEY `city` (`city`),
  KEY `district` (`district`),
  KEY `isp` (`isp`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='ip查询日志 - 客服';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_chat_notice_log`
--

DROP TABLE IF EXISTS `sxo_plugins_chat_notice_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_chat_notice_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `record_id` int unsigned NOT NULL DEFAULT '0' COMMENT '消息记录id',
  `value` char(60) NOT NULL DEFAULT '' COMMENT '手机或邮箱',
  `type` char(16) NOT NULL DEFAULT '' COMMENT '类型（sms 手机, email 邮箱）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `record_id` (`record_id`),
  KEY `value` (`value`),
  KEY `type` (`type`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='通知日志 - 客服';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_chat_quick_message`
--

DROP TABLE IF EXISTS `sxo_plugins_chat_quick_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_chat_quick_message` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cuid` int unsigned NOT NULL DEFAULT '0' COMMENT '消息用户id',
  `content` text COMMENT '消息内容',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `cuid` (`cuid`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='快捷消息 - 客服';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_chat_record`
--

DROP TABLE IF EXISTS `sxo_plugins_chat_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_chat_record` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `send_cuid` int unsigned NOT NULL DEFAULT '0' COMMENT '发送用户基础id',
  `receive_cuid` int unsigned NOT NULL DEFAULT '0' COMMENT '接收用户基础id',
  `platform` char(30) NOT NULL DEFAULT 'pc' COMMENT '来源平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序）',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0未发送, 1已发送）',
  `content` text COMMENT '消息内容',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读（0否, 1是）',
  `ip` char(30) NOT NULL DEFAULT '' COMMENT '用户ip',
  `read_time` int unsigned NOT NULL DEFAULT '0' COMMENT '已读时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `send_cuid` (`send_cuid`),
  KEY `receive_cuid` (`receive_cuid`),
  KEY `platform` (`platform`),
  KEY `status` (`status`),
  KEY `is_read` (`is_read`),
  KEY `ip` (`ip`),
  KEY `read_time` (`read_time`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='消息记录 - 客服';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_chat_user`
--

DROP TABLE IF EXISTS `sxo_plugins_chat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_chat_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id（无用户id则为游客）',
  `uuid` char(60) NOT NULL DEFAULT '' COMMENT '用户uuid（游客以uuid为准）',
  `fd` int unsigned NOT NULL DEFAULT '0' COMMENT 'socket消息id',
  `platform` char(30) NOT NULL DEFAULT 'pc' COMMENT '来源平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序）',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0离线, 1在线）',
  `ip` char(30) NOT NULL DEFAULT '' COMMENT '用户ip',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `uuid` (`uuid`),
  KEY `fd` (`fd`),
  KEY `platform` (`platform`),
  KEY `status` (`status`),
  KEY `ip` (`ip`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户基础 - 客服';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `title` varchar(260) NOT NULL DEFAULT '' COMMENT '标题',
  `gid` int unsigned NOT NULL DEFAULT '0' COMMENT '所属类型',
  `title_color` char(200) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待审核、1已审核、2已拒绝）',
  `jump_url` char(255) NOT NULL DEFAULT '' COMMENT '跳转url地址',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `content` longtext COMMENT '内容',
  `cover` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `goods_count` int unsigned NOT NULL DEFAULT '0' COMMENT '推荐商品数量',
  `images` text COMMENT '图片数据（一维数组json）',
  `images_count` int unsigned NOT NULL DEFAULT '0' COMMENT '图片数量',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `comments_count` int unsigned NOT NULL DEFAULT '0' COMMENT '点赞总数',
  `give_thumbs_count` int unsigned NOT NULL DEFAULT '0' COMMENT '点赞总数',
  `is_recommended` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐（0否, 1是）',
  `is_hot` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否热门（0否, 1是）',
  `is_live_play` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否直播（0否, 1是）',
  `video_url` char(255) NOT NULL DEFAULT '' COMMENT '视频地址',
  `reason` char(230) NOT NULL DEFAULT '' COMMENT '审核失败原因',
  `label` text COMMENT '标签',
  `goods` text COMMENT '提交信息时候对应商品信息留存，防止日后商品改动',
  `contact_name` varchar(100) NOT NULL DEFAULT '' COMMENT '联系人',
  `contact_tel` varchar(100) NOT NULL DEFAULT '' COMMENT '联系方式',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '信息所在地-省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '信息所在地-市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '信息所在地-县/区',
  `address` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '信息所在地-详细地址',
  `province_name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '信息所在地-省-名称',
  `city_name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '信息所在地-市-名称',
  `county_name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '信息所在地-县/区-名称',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '信息所在地-经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '信息所在地-纬度',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_top` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `topendtime` int unsigned NOT NULL DEFAULT '0' COMMENT '置顶到期时间',
  `fee_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '信息到期方式，0是普通计费，大于0则为按天，同时用于存储按天计算的序号（逻辑处理时要减1）',
  `infoendtime` int unsigned NOT NULL DEFAULT '0' COMMENT '信息到期时间',
  `over_time` int unsigned NOT NULL DEFAULT '0' COMMENT '完成截止时间',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '发布价格',
  `dayarr` varchar(255) NOT NULL DEFAULT '' COMMENT '按天计费模式下选择的有效期存储',
  `toparr` varchar(255) NOT NULL DEFAULT '' COMMENT '阶梯置顶当前被选中的置顶阶梯存储',
  `info_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '当前信息状态，0在有效期内，1已下架',
  `is_over` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '当前信息所述内容是否已完成，0未完成，1已完成',
  `pay_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '发布信息支付状态（0未支付, 1已支付, 2已退款, 3部分退款）',
  `is_wait` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '当前信息是否处于待过期状态，0否，1是',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `title` (`title`),
  KEY `gid` (`gid`),
  KEY `status` (`status`),
  KEY `is_enable` (`is_enable`),
  KEY `images_count` (`images_count`),
  KEY `access_count` (`access_count`),
  KEY `comments_count` (`comments_count`),
  KEY `give_thumbs_count` (`give_thumbs_count`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='风车分类信息分类信息 - 风车分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_auth_icon`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_auth_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_auth_icon` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT '图标',
  `use_count` int unsigned NOT NULL DEFAULT '0' COMMENT '使用总数',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `use_count` (`use_count`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='认证图标 - 风车分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_auth_icon_user`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_auth_icon_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_auth_icon_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `auth_icon_id` int unsigned NOT NULL DEFAULT '0' COMMENT '认证id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `auth_icon_id` (`auth_icon_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户认证图标 - 风车分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_base`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_base` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `num` int unsigned NOT NULL DEFAULT '0',
  `add_time` int unsigned NOT NULL DEFAULT '0',
  `upd_time` int unsigned NOT NULL DEFAULT '0',
  `authtoken` varchar(60) NOT NULL DEFAULT '' COMMENT '授权码',
  `end_time` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='基础配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_category`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `is_area_chose` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否选择区域',
  `is_need_audit` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否需要审核',
  `is_title` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '发布是否填写标题',
  `is_only_platform` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否仅平台发布',
  `is_close_user_write` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否关闭发布入口',
  `is_only_subsite` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否仅子站调用',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='风车分类信息分类 - 风车分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_comments`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `info_id` int unsigned NOT NULL DEFAULT '0' COMMENT '风车分类信息id',
  `info_comments_id` int unsigned NOT NULL DEFAULT '0' COMMENT '风车分类信息评论id',
  `reply_comments_id` int unsigned NOT NULL DEFAULT '0' COMMENT '一级回复评论id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待审核、1已审核、2已隐藏）',
  `md5_key` char(32) NOT NULL DEFAULT '' COMMENT '数据唯一md5key',
  `content` text COMMENT '评论内容',
  `comments_count` int unsigned NOT NULL DEFAULT '0' COMMENT '评论总数',
  `give_thumbs_count` int unsigned NOT NULL DEFAULT '0' COMMENT '点赞总数',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `info_id` (`info_id`),
  KEY `info_comments_id` (`info_comments_id`),
  KEY `reply_comments_id` (`reply_comments_id`),
  KEY `status` (`status`),
  KEY `md5_key` (`md5_key`),
  KEY `comments_count` (`comments_count`),
  KEY `give_thumbs_count` (`give_thumbs_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='风车分类信息评论 - 风车分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_comments_give_integral_log`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_comments_give_integral_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_comments_give_integral_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `info_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类信息id',
  `comments_id` int unsigned NOT NULL DEFAULT '0' COMMENT '问答id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `integral` int unsigned NOT NULL DEFAULT '0' COMMENT '奖励积分',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `info_id` (`info_id`),
  KEY `comments_id` (`comments_id`),
  KEY `user_id` (`user_id`),
  KEY `integral` (`integral`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='分类信息评论奖励积分日志 - 风车分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_company`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_company` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公司名字',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `com_describe` text COLLATE utf8mb4_general_ci COMMENT '描述',
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `region` text COLLATE utf8mb4_general_ci COMMENT '名片展示范围',
  `region_name` text COLLATE utf8mb4_general_ci COMMENT '名片展示范围文字显示',
  `com_images` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '执照图片',
  `jing_images` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '实拍图片门头照',
  `contact_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系人',
  `contact_tel` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系电话，一般是老板电话，需要验证',
  `contact_wx` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信号',
  `idcard_number` char(30) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '法人身份证号码',
  `idcard_front` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '法人身份证正面',
  `idcard_back` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '法人身份证反面',
  `wx_ma` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '微信二维码',
  `faren` varchar(30) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '法人',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '绑定老板会员ID',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '身份0机构，1个人',
  `province` int unsigned NOT NULL DEFAULT '0',
  `city` int unsigned NOT NULL DEFAULT '0',
  `county` int unsigned NOT NULL DEFAULT '0',
  `address` varchar(200) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '纬度',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '公司信息状态',
  `admin_note` text COLLATE utf8mb4_general_ci COMMENT '审核备注',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '到期时间',
  `edit_num` int unsigned NOT NULL DEFAULT '0',
  `cut_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '扣点金额',
  `topid` int unsigned NOT NULL DEFAULT '0' COMMENT '推荐者所属公司ID',
  `topid_old` int unsigned NOT NULL DEFAULT '0',
  `info_renzheng` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '个人身份认证',
  `truename` varchar(30) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `renzheng_time` int unsigned NOT NULL DEFAULT '0' COMMENT '通过认证的时候',
  `is_qudao` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否渠道',
  `qudao_time` int unsigned NOT NULL DEFAULT '0',
  `jinpai_time` int unsigned NOT NULL DEFAULT '0',
  `is_qudao_true` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '当前是否真正生效的渠道合伙人了',
  `is_jinpai_true` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '金牌身份是否当前正当时',
  `top_qudao_id` int unsigned NOT NULL DEFAULT '0' COMMENT '所属渠道对应的公司ID',
  `qudao_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '渠道客服姓名',
  `qudao_tel` varchar(11) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '渠道客服电话',
  `qudao_img` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '渠道微信二维码',
  `logo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'logo 头像',
  `com_pic1` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片1',
  `com_pic2` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片2',
  `com_pic3` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片3',
  `com_label` text COLLATE utf8mb4_general_ci COMMENT '标签',
  `com_zhengshu` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关联的证书',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问热度',
  `xu` int unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `zan` int unsigned NOT NULL DEFAULT '0' COMMENT '点赞数量',
  `is_powerful` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否实力企业',
  `is_top` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `seo_title` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `company_level` int unsigned NOT NULL DEFAULT '0' COMMENT '公司等级',
  `level_end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '公司等级到期时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='公司信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_company_book`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_company_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_company_book` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `pic` char(255) NOT NULL DEFAULT '' COMMENT '证书大图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='公司证书';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_company_cat`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_company_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_company_cat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'icon图标',
  `icon_active` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '选中图标',
  `realistic_images` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '实景图',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `vice_name` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '副标题',
  `describe` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `bg_color` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'css背景色值',
  `big_images` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '大图片',
  `is_home_recommended` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否首页推荐（0否, 1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商家分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_company_cat_join`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_company_cat_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_company_cat_join` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `classshop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商家id',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `classshop_id` (`classshop_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商家分类关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_company_favor`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_company_favor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_company_favor` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `company_id` int unsigned NOT NULL DEFAULT '0' COMMENT '公司id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='店铺收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_company_label`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_company_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_company_label` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `pic` char(255) NOT NULL DEFAULT '' COMMENT '证书大图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='公司标签';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_company_level`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_company_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_company_level` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `icon` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `vice_name` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '副标题',
  `describe` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `content` text COLLATE utf8mb4_general_ci COMMENT '权限内容',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '发布价格',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `how_long` int unsigned NOT NULL DEFAULT '0' COMMENT '有效天数',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='公司等级';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_field`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_field` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '字段名字',
  `type` int unsigned NOT NULL DEFAULT '0' COMMENT '字段类型，大于1',
  `sid` int unsigned NOT NULL DEFAULT '0' COMMENT '所属类型goods_id',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '字段描述',
  `unit` varchar(30) NOT NULL DEFAULT '' COMMENT '单位名称',
  `is_must` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否必填',
  `tishi_text` varchar(255) NOT NULL DEFAULT '' COMMENT '输入框内提示文字',
  `moren` varchar(255) NOT NULL DEFAULT '' COMMENT '默认值',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用',
  `is_allow` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否允许下单后编辑此字段',
  `content` longtext NOT NULL COMMENT '配置',
  `scene` varchar(255) NOT NULL DEFAULT '',
  `add_time` int unsigned NOT NULL DEFAULT '0',
  `upd_time` int unsigned NOT NULL DEFAULT '0',
  `xu` int unsigned NOT NULL DEFAULT '0' COMMENT '排序，越大越靠前',
  `minlength` int unsigned NOT NULL DEFAULT '0',
  `maxlength` int unsigned NOT NULL DEFAULT '0',
  `rows` int unsigned NOT NULL DEFAULT '0',
  `max_num` int unsigned NOT NULL DEFAULT '0',
  `file_type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='类型的属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_give_integral_log`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_give_integral_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_give_integral_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `info_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类信息id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `integral` int unsigned NOT NULL DEFAULT '0' COMMENT '奖励积分',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `info_id` (`info_id`),
  KEY `user_id` (`user_id`),
  KEY `integral` (`integral`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='分类信息发布奖励积分日志 - 风车分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_give_thumbs`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_give_thumbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_give_thumbs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `info_id` int unsigned NOT NULL DEFAULT '0' COMMENT '风车分类信息id',
  `info_comments_id` int unsigned NOT NULL DEFAULT '0' COMMENT '风车分类信息评论id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `info_id` (`info_id`),
  KEY `info_comments_id` (`info_comments_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='风车分类信息点赞 - 风车分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cid` int unsigned NOT NULL DEFAULT '0' COMMENT '所属模型id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `is_price` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '发布是否收费',
  `is_need_audit` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否需要审核',
  `is_home_show` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐到同城首页',
  `fee_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '发布计费方式',
  `end_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '信息过期处理方法',
  `is_see_phone` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '查看电话是否收费',
  `is_open_location` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否开启定位',
  `is_video_allow` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否开启视频上传',
  `is_close_contact` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '关闭联系方式',
  `is_allow_see_tel` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否允许查看联系方式',
  `is_allow_see_tel_detail` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否详情页允许查看联系方式',
  `is_open_address` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否开启发布信息填写信息所属地',
  `is_open_address_strong` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否强制必填信息所属地',
  `is_title_strong` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否需要强制填写信息标题',
  `is_open_address_location` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否开启信息所属地位置选择',
  `is_show_info_endtime` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否在详情页显示信息有效期',
  `is_show_long_time` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否在发布信息时候显示信息的有效期',
  `special_label` varchar(255) NOT NULL DEFAULT '' COMMENT '特殊标签',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '发布价格',
  `app_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'app发布价格',
  `reset_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '刷新价格',
  `see_phone_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '查看电话价格',
  `day_price` text COMMENT '发布按天计费价格',
  `app_day_price` text COMMENT 'app发布按天计费价格',
  `top_price` text COMMENT '阶梯置顶价格',
  `endtime_day` int unsigned NOT NULL DEFAULT '0' COMMENT '普通计费下信息有效期天数',
  `label` text COMMENT '标签',
  `ms_title` varchar(255) NOT NULL DEFAULT '',
  `ms_desc` text COMMENT '描述说明',
  `jg_desc` text COMMENT '警告说明',
  `zp_desc` text COMMENT '防诈骗提示',
  `see_tel_desc` text COMMENT '查看电话弹窗文字',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='风车分类信息类型 - 风车分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_order`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_no` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `info_id` int unsigned NOT NULL DEFAULT '0' COMMENT '关联信息id',
  `warehouse_id` int unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `payment_id` int unsigned NOT NULL DEFAULT '0' COMMENT '支付方式id',
  `system_type` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '系统类型（默认 default, 其他按照SYSTEM_TYPE常量类型）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态（0待确认, 1已确认/待支付, 2已支付/待发货, 3已发货/待收货, 4已完成, 5已取消, 6已关闭）',
  `pay_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '支付状态（0未支付, 1已支付, 2已退款, 3部分退款）',
  `extension_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '扩展展示数据',
  `buy_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '购买商品总数量',
  `increase_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '增加的金额',
  `preferential_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单单价',
  `total_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价(订单最终价格)',
  `pay_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已支付金额',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_quantity` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `client_type` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客户端类型（pc, h5, ios, android, alipay, weixin, baidu）取APPLICATION_CLIENT_TYPE常量值',
  `order_model` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单模式（0发布, 1刷新, 2置顶, 3商户入驻）',
  `is_under_line` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否线下支付（0否，1是）',
  `user_note` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户备注',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `confirm_time` int unsigned NOT NULL DEFAULT '0' COMMENT '确认时间',
  `delivery_time` int unsigned NOT NULL DEFAULT '0' COMMENT '发货时间',
  `cancel_time` int unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `collect_time` int unsigned NOT NULL DEFAULT '0' COMMENT '收货时间',
  `close_time` int unsigned NOT NULL DEFAULT '0' COMMENT '关闭时间',
  `comments_time` int unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `is_comments` int unsigned NOT NULL DEFAULT '0' COMMENT '是否已评论（0否, 大于0评论时间）',
  `user_is_comments` int unsigned NOT NULL DEFAULT '0' COMMENT '用户是否已评论（0否, 大于0评论时间）',
  `is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '是否已删除（0否, 大于0删除时间）',
  `user_is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '用户是否已删除（0否, 大于0删除时间）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_no` (`order_no`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `pay_status` (`pay_status`) USING BTREE,
  KEY `warehouse_id` (`warehouse_id`) USING BTREE,
  KEY `system_type` (`system_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='信息订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_order_currency`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_order_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_order_currency` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `currency_name` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '货币名称',
  `currency_code` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '货币代码',
  `currency_symbol` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '货币符号',
  `currency_rate` decimal(12,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '货币汇率',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `currency_name` (`currency_name`) USING BTREE,
  KEY `currency_code` (`currency_code`) USING BTREE,
  KEY `currency_rate` (`currency_rate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='风车分类信息订单货币';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_product`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `info_id` int unsigned NOT NULL DEFAULT '0' COMMENT '信息id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `info_id` (`info_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='信息推荐关联商品 - 分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_product_add`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_product_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_product_add` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `company_id` int unsigned NOT NULL DEFAULT '0' COMMENT '公司id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '系统商品ID',
  `goods_cid` int unsigned NOT NULL DEFAULT '0' COMMENT '系统商品分类',
  `product_cid` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺商品分类',
  `stock` int unsigned NOT NULL DEFAULT '0' COMMENT '基础单规格库存值',
  `content_basic` longtext COMMENT '基础内容',
  `content_specs` longtext COMMENT '多规格内容',
  `content_params` longtext COMMENT '商品参数',
  `content_gallery` longtext COMMENT '相册',
  `content_video` char(255) NOT NULL DEFAULT '' COMMENT '视频',
  `content_mobile` longtext COMMENT '手机详情',
  `content_desktop` longtext COMMENT '电脑详情',
  `content_seo` longtext COMMENT 'SEO信息',
  `content_virtual` longtext COMMENT '虚拟信息',
  `content_ext` longtext COMMENT '扩展',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `goods_cid` (`goods_cid`),
  KEY `user_id` (`user_id`),
  KEY `company_id` (`company_id`),
  KEY `product_cid` (`product_cid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品添加临时表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_product_category`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_product_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `company_id` int unsigned NOT NULL DEFAULT '0' COMMENT '公司id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `is_show` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否展示在店铺首页（0否，1是）',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `user_id` (`user_id`),
  KEY `company_id` (`company_id`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `is_show` (`is_show`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_recommend`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_recommend` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '标题',
  `vice_title` char(60) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(30) NOT NULL DEFAULT '' COMMENT 'css颜色值',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `cover` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `more_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '更多分类指向地址',
  `keywords` text COMMENT '推荐关键字（英文逗号分割）',
  `classinfo_count` int unsigned NOT NULL DEFAULT '0' COMMENT '关联风车分类信息数量',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `is_goods_detail` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否商品详情页展示（0否，1是）',
  `is_home` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否首页展示（0否，1是）',
  `home_data_location` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '首页数据位置（0楼层数据上面，1楼层数据下面）',
  `style_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '样式类型（0图文，1九方格，2一行滚动）',
  `data_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '数据类型（0自动模式，1手动模式）',
  `order_by_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '自动数据-排序类型（0最新，1热度，2更新）',
  `order_by_rule` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '自动数据-排序规则（0降序(desc)，1升序(asc)）',
  `data_auto_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '自动数据-指定分类条件',
  `data_auto_number` int unsigned NOT NULL DEFAULT '0' COMMENT '自动数据-展示数量',
  `time_start` int unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `time_end` int unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `is_enable` (`is_enable`),
  KEY `is_home` (`is_home`),
  KEY `is_goods_detail` (`is_goods_detail`),
  KEY `classinfo_count` (`classinfo_count`),
  KEY `access_count` (`access_count`),
  KEY `style_type` (`style_type`),
  KEY `data_type` (`data_type`),
  KEY `order_by_type` (`order_by_type`),
  KEY `order_by_rule` (`order_by_rule`),
  KEY `upd_time` (`upd_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='风车分类信息推荐 - 风车分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_recommend_join`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_recommend_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_recommend_join` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `recommend_id` int unsigned NOT NULL DEFAULT '0' COMMENT '推荐id',
  `info_id` int unsigned NOT NULL DEFAULT '0' COMMENT '风车分类信息id',
  `is_recommend` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `recommend_id` (`recommend_id`),
  KEY `info_id` (`info_id`),
  KEY `is_recommend` (`is_recommend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='风车分类信息推荐关联 - 风车分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_report`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_report` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '原因',
  `content` text COMMENT '备注说明',
  `report_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '举报类型',
  `about_id` int unsigned NOT NULL DEFAULT '0' COMMENT '关联ID',
  `contact_name` char(50) NOT NULL DEFAULT '' COMMENT '举报人姓名',
  `contact_tel` char(30) NOT NULL DEFAULT '' COMMENT '举报人电话',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态（0初提交，1已查收，2已回复，3已完结）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='举报中心 - 风车分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_single_data`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_single_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_single_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `form_id` int unsigned NOT NULL DEFAULT '0' COMMENT '表单id',
  `xu_id` int unsigned NOT NULL DEFAULT '0' COMMENT '计数器，也是某次提交的统一标识，当前用户当前表单提交几次数据了',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `field_id` int unsigned NOT NULL DEFAULT '0',
  `type_id` int unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL DEFAULT '' COMMENT '标题',
  `content` longtext COMMENT '数据值',
  `content_value` text NOT NULL COMMENT '有些content存储后需要翻译下，直接存储于此，免得字段预设发生改变',
  `file_type` varchar(200) NOT NULL DEFAULT '' COMMENT '若为附件，则记录附件类型',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `edit_num` int unsigned NOT NULL DEFAULT '0' COMMENT '该条数据编辑次数',
  `field_base` text COMMENT '字段基础数据，保存下来，以免后期对应字段发生变化，或改或删',
  `is_head` tinyint unsigned NOT NULL DEFAULT '0',
  `temp_user_id` varchar(100) NOT NULL DEFAULT '' COMMENT '临时用户ID',
  PRIMARY KEY (`id`),
  KEY `is_head` (`is_head`),
  KEY `form_id` (`form_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='信息关联的属性存储正式表 - 分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_single_temp`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_single_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_single_temp` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `form_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品表单id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `spec` text,
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `title` char(60) NOT NULL DEFAULT '' COMMENT '标题',
  `field_id` int unsigned NOT NULL DEFAULT '0' COMMENT '字段ID',
  `type_id` int unsigned NOT NULL DEFAULT '0',
  `content` longtext COMMENT '数据值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `temp_user_id` varchar(100) NOT NULL DEFAULT '' COMMENT '未登录前的临时会员ID，一般由IP转化为数字而来',
  `about_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='信息关联的属性存储临时表 - 分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_slide`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_slide` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `classid` int unsigned NOT NULL DEFAULT '0' COMMENT '类型ID',
  `platform` char(255) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序）',
  `event_type` tinyint NOT NULL DEFAULT '-1' COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` char(255) NOT NULL DEFAULT '' COMMENT '事件值',
  `images_url` char(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `bg_color` char(30) NOT NULL DEFAULT '' COMMENT 'css背景色值',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`),
  KEY `platform` (`platform`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='风车分类信息轮播图片 - 风车分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_thumbs_give_integral_log`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_thumbs_give_integral_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_thumbs_give_integral_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `info_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类信息id',
  `comments_id` int unsigned NOT NULL DEFAULT '0' COMMENT '问答id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `integral` int unsigned NOT NULL DEFAULT '0' COMMENT '奖励积分',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `info_id` (`info_id`),
  KEY `comments_id` (`comments_id`),
  KEY `user_id` (`user_id`),
  KEY `integral` (`integral`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='分类信息点赞奖励积分日志 - 风车分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_usercard`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_usercard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_usercard` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `company_id` int unsigned NOT NULL DEFAULT '0' COMMENT '所属公司ID',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名片名字',
  `position_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '职务',
  `position_name` varchar(50) NOT NULL DEFAULT '' COMMENT '职务内容',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '名片状态',
  `is_top` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `province` int unsigned NOT NULL DEFAULT '0',
  `city` int unsigned NOT NULL DEFAULT '0',
  `county` int unsigned NOT NULL DEFAULT '0',
  `address` varchar(200) NOT NULL DEFAULT '',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '信息所在地-经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '信息所在地-纬度',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT 'logo 头像',
  `com_describe` text COMMENT '描述',
  `content` longtext COMMENT '内容',
  `zan` int unsigned NOT NULL DEFAULT '0' COMMENT '点赞量',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `wx_ma` varchar(255) NOT NULL DEFAULT '微信二维码',
  `contact_tel` varchar(100) NOT NULL DEFAULT '' COMMENT '联系方式',
  `wechat` varchar(255) NOT NULL DEFAULT '' COMMENT '微信号',
  `com_label` text COMMENT '标签',
  `com_zhengshu` varchar(255) NOT NULL DEFAULT '' COMMENT '关联的证书',
  `region` text COMMENT '名片展示范围',
  `region_name` text COMMENT '名片展示范围文字显示',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `is_enable` (`is_enable`),
  KEY `company_id` (`company_id`),
  KEY `is_top` (`is_top`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='个人名片 - 风车同城';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_usercard_favor`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_usercard_favor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_usercard_favor` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `card_id` int unsigned NOT NULL DEFAULT '0' COMMENT '名片id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `card_id` (`card_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='名片收藏 - 风车同城';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_classinfo_warehouse_category_join`
--

DROP TABLE IF EXISTS `sxo_plugins_classinfo_warehouse_category_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_classinfo_warehouse_category_join` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '网点/仓库id',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `shop_id` (`shop_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='网点跟商品分类的关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_coin_accounts`
--

DROP TABLE IF EXISTS `sxo_plugins_coin_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_coin_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform_id` int unsigned NOT NULL DEFAULT '0' COMMENT '币种id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `accounts_key` char(130) NOT NULL DEFAULT '' COMMENT '账户key',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0正常、1异常、2注销）',
  `normal_coin` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '有效币（包含赠送币）',
  `frozen_coin` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '冻结币',
  `give_coin` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '赠送币（所有赠送币总计）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `platform_id` (`platform_id`),
  KEY `user_id` (`user_id`),
  KEY `accounts_key` (`accounts_key`),
  KEY `status` (`status`),
  KEY `normal_coin` (`normal_coin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='账户 - 虚拟币';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_coin_accounts_log`
--

DROP TABLE IF EXISTS `sxo_plugins_coin_accounts_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_coin_accounts_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform_id` int unsigned NOT NULL DEFAULT '0' COMMENT '币种id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `accounts_id` int unsigned NOT NULL DEFAULT '0' COMMENT '账户id',
  `business_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '业务类型（0系统、1充值、2提现、3消费、4转账、5转换）',
  `coin_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '币类型（0正常、1冻结、2赠送）',
  `operate_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '操作类型（0减少、1增加）',
  `operate_coin` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '操作币',
  `original_coin` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '原始币',
  `latest_coin` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '最新币',
  `msg` char(230) NOT NULL DEFAULT '' COMMENT '变更说明',
  `operate_id` int unsigned NOT NULL DEFAULT '0' COMMENT '操作人id',
  `operate_name` char(30) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `platform_id` (`platform_id`),
  KEY `user_id` (`user_id`),
  KEY `accounts_id` (`accounts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='账户日志 - 虚拟币';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_coin_cash`
--

DROP TABLE IF EXISTS `sxo_plugins_coin_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_coin_cash` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform_id` int unsigned NOT NULL DEFAULT '0' COMMENT '币种id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `accounts_id` int unsigned NOT NULL DEFAULT '0' COMMENT '账户id',
  `network_id` int unsigned NOT NULL DEFAULT '0' COMMENT '网络id',
  `cash_no` char(60) NOT NULL DEFAULT '' COMMENT '提现单号',
  `address` char(60) NOT NULL DEFAULT '' COMMENT '提现地址',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待支付、1已支付、2支付失败）',
  `coin` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '提现币',
  `pay_coin` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '支付币',
  `commission` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '手续费',
  `user_note` char(200) NOT NULL DEFAULT '' COMMENT '用户备注',
  `pay_note` char(200) NOT NULL DEFAULT '' COMMENT '支付备注',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `operate_id` int unsigned NOT NULL DEFAULT '0' COMMENT '操作人id',
  `operate_name` char(30) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cash_no` (`cash_no`),
  KEY `status` (`status`),
  KEY `platform_id` (`platform_id`),
  KEY `user_id` (`user_id`),
  KEY `accounts_id` (`accounts_id`),
  KEY `network_id` (`network_id`),
  KEY `address` (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='提现 - 虚拟币';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_coin_convert`
--

DROP TABLE IF EXISTS `sxo_plugins_coin_convert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_coin_convert` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `convert_no` char(60) NOT NULL DEFAULT '' COMMENT '转账单号',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `send_accounts_id` int unsigned NOT NULL DEFAULT '0' COMMENT '转出账户id',
  `receive_accounts_id` int unsigned NOT NULL DEFAULT '0' COMMENT '接收账户id',
  `rate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '汇率',
  `coin` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '转换币',
  `convert_value` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '转换后的币',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注',
  `operate_id` int unsigned NOT NULL DEFAULT '0' COMMENT '操作人id',
  `operate_name` char(30) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `convert_no` (`convert_no`),
  KEY `user_id` (`user_id`),
  KEY `send_accounts_id` (`send_accounts_id`),
  KEY `receive_accounts_id` (`receive_accounts_id`),
  KEY `coin` (`coin`),
  KEY `convert_value` (`convert_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='转换 - 虚拟币';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_coin_network`
--

DROP TABLE IF EXISTS `sxo_plugins_coin_network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_coin_network` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `name` (`name`),
  KEY `sort` (`sort`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='网络 - 虚拟币';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_coin_platform`
--

DROP TABLE IF EXISTS `sxo_plugins_coin_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_coin_platform` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `symbol` char(30) NOT NULL DEFAULT '' COMMENT '符号',
  `rate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '汇率',
  `is_enable_transfer` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '开启转账（0否, 1是）',
  `is_enable_convert` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '开启转换（0否, 1是）',
  `is_enable_cash` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '开启提现（0否, 1是）',
  `is_cash_retain_give` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '提现保留赠送币',
  `cash_minimum_amount` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '提现最低币',
  `cash_choice_network_ids` char(255) NOT NULL DEFAULT '' COMMENT '提现可选网络',
  `is_enable_recharge` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '开启充值（0否, 1是）',
  `recharge_address` char(255) NOT NULL DEFAULT '' COMMENT '充值地址',
  `recharge_qrcode` char(255) NOT NULL DEFAULT '' COMMENT '充值二维码',
  `recharge_give_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '充值赠送币类型（0固定币, 1固定币）',
  `recharge_give_value` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '充值赠送固定币值',
  `recharge_choice_network_ids` char(255) NOT NULL DEFAULT '' COMMENT '充值可选网络',
  `custom_recharge_give` text COMMENT '充值赠送自定义预设',
  `recharge_desc` text COMMENT '充值规则说明',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否默认（0否，1是）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `sort` (`sort`),
  KEY `is_default` (`is_default`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='币种 - 虚拟币';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_coin_recharge`
--

DROP TABLE IF EXISTS `sxo_plugins_coin_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_coin_recharge` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform_id` int unsigned NOT NULL DEFAULT '0' COMMENT '币种id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `accounts_id` int unsigned NOT NULL DEFAULT '0' COMMENT '账户id',
  `network_id` int unsigned NOT NULL DEFAULT '0' COMMENT '网络id',
  `recharge_no` char(60) NOT NULL DEFAULT '' COMMENT '充值单号',
  `address` char(60) NOT NULL DEFAULT '' COMMENT '充值地址',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待支付、1待确认、2已支付、3已失败）',
  `coin` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '币',
  `pay_coin` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '支付币',
  `pay_voucher` text COMMENT '支付凭证json存储',
  `pay_note` char(255) NOT NULL DEFAULT '' COMMENT '支付备注',
  `confirm_note` char(255) NOT NULL DEFAULT '' COMMENT '确认备注',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `confirm_time` int unsigned NOT NULL DEFAULT '0' COMMENT '确认时间',
  `operate_id` int unsigned NOT NULL DEFAULT '0' COMMENT '操作人id',
  `operate_name` char(30) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `recharge_no` (`recharge_no`),
  KEY `status` (`status`),
  KEY `platform_id` (`platform_id`),
  KEY `user_id` (`user_id`),
  KEY `accounts_id` (`accounts_id`),
  KEY `network_id` (`network_id`),
  KEY `address` (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='充值 - 虚拟币';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_coin_transfer`
--

DROP TABLE IF EXISTS `sxo_plugins_coin_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_coin_transfer` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `transfer_no` char(60) NOT NULL DEFAULT '' COMMENT '转账单号',
  `send_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '发起用户id',
  `send_accounts_id` int unsigned NOT NULL DEFAULT '0' COMMENT '发起账户id',
  `receive_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '接收用户id',
  `receive_accounts_id` int unsigned NOT NULL DEFAULT '0' COMMENT '接收账户id',
  `coin` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '转账币',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注',
  `operate_id` int unsigned NOT NULL DEFAULT '0' COMMENT '操作人id',
  `operate_name` char(30) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `transfer_no` (`transfer_no`),
  KEY `send_user_id` (`send_user_id`),
  KEY `send_accounts_id` (`send_accounts_id`),
  KEY `receive_user_id` (`receive_user_id`),
  KEY `receive_accounts_id` (`receive_accounts_id`),
  KEY `coin` (`coin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='转账 - 虚拟币';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_coupon`
--

DROP TABLE IF EXISTS `sxo_plugins_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_coupon` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '名称',
  `desc` char(60) NOT NULL DEFAULT '' COMMENT '描述',
  `bg_color` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '优惠券颜色（0红色, 1紫色, 2黄色, 3蓝色, 4橙色, 5绿色, 6咖啡色）',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '优惠券类型（0满减劵, 1折扣劵）',
  `discount_value` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '减免金额 | 折扣系数 0-10，9.5代表9.5折，0或空代表无折扣',
  `expire_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '到期类型（0领取生效, 1固定日期）',
  `expire_hour` int unsigned NOT NULL DEFAULT '0' COMMENT '有效小时（单位 时）',
  `fixed_time_start` int unsigned NOT NULL DEFAULT '0' COMMENT '限时开始时间',
  `fixed_time_end` int unsigned NOT NULL DEFAULT '0' COMMENT '限时结束时间',
  `where_order_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单最低金额',
  `use_limit_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '使用限制（0不限, 1商品分类, 2商品）',
  `use_value_ids` text COMMENT '关联商品分类id 或 关联商品id（以json存储）',
  `limit_send_count` int unsigned NOT NULL DEFAULT '0' COMMENT '限制发放总数量（0则不限）',
  `already_send_count` int unsigned NOT NULL DEFAULT '0' COMMENT '已发放总数量',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `is_show` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否公共显示（0否, 1是）',
  `is_user_receive` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否开放用户领取（0否, 1是）',
  `is_repeat_receive` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否允许重复领取（0否, 1是）',
  `is_regster_send` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否注册即发放（0否, 1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `type` (`type`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`),
  KEY `is_show` (`is_show`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='优惠券 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_coupon_user`
--

DROP TABLE IF EXISTS `sxo_plugins_coupon_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_coupon_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `coupon_id` int unsigned NOT NULL DEFAULT '0' COMMENT '优惠券id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `time_start` int unsigned NOT NULL DEFAULT '0' COMMENT '有效开始时间',
  `time_end` int unsigned NOT NULL DEFAULT '0' COMMENT '有效结束时间',
  `is_valid` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否有效（0否，1是）',
  `is_expire` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否已过期（0否，1是）',
  `is_use` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否已使用（0否，1是）',
  `use_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '使用关联的订单id',
  `use_time` int unsigned NOT NULL DEFAULT '0' COMMENT '使用时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `user_id` (`user_id`),
  KEY `is_valid` (`is_valid`)
) ENGINE=InnoDB AUTO_INCREMENT=4458 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户优惠券 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_base`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_base` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `num` int unsigned NOT NULL DEFAULT '0',
  `add_time` int unsigned NOT NULL DEFAULT '0',
  `upd_time` int unsigned NOT NULL DEFAULT '0',
  `authtoken` varchar(60) NOT NULL DEFAULT '' COMMENT '授权码',
  `end_time` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='基础配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_canyu`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_canyu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_canyu` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `cart_id` int unsigned NOT NULL DEFAULT '0' COMMENT '砍的是谁发起的',
  `price` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '砍掉的价钱',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户帮砍表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_cart`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned DEFAULT '0' COMMENT '用户id',
  `low_price` decimal(11,2) unsigned DEFAULT '0.00' COMMENT '底价',
  `goods_id` int unsigned DEFAULT '0' COMMENT '砍价活动ID',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '购物车状态，0正常，1失效',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '原价',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当前价格',
  `stock` int unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `spec` text COMMENT '规格',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`),
  KEY `title` (`title`),
  KEY `stock` (`stock`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户加入的砍价';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cut_title` varchar(255) NOT NULL DEFAULT '' COMMENT '活动标题',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '对应商品ID',
  `goods_title` varchar(255) DEFAULT '' COMMENT '存起来的商品标题',
  `picurl` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `buy_url` varchar(255) NOT NULL DEFAULT '' COMMENT '砍价到位后下单商品链接',
  `original_price` varchar(80) DEFAULT '' COMMENT '原价（单值:10, 区间:10.00-20.00）一般用于展示使用 ',
  `min_original_price` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `max_original_price` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `max_price` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `price` varchar(60) DEFAULT '' COMMENT '销售价格（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_price` decimal(11,2) unsigned DEFAULT '0.00' COMMENT '底价',
  `canyu` int unsigned NOT NULL DEFAULT '0' COMMENT '参与人数',
  `sales_num` int unsigned NOT NULL DEFAULT '0' COMMENT '砍成数，等于订单数',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '砍价商品库存',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '活动状态，0：未开始，1：进行中，2：已结束，3：已关闭',
  `time_start` int unsigned NOT NULL DEFAULT '0' COMMENT '活动开启时间',
  `time_end` int unsigned NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `buy_max_limit` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '活动可以参与次数',
  `buy_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0：任意金额可购买，1：砍到指定价才行',
  `bang_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '帮砍金额：0：随机；1：固定金额',
  `self_can` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否允许自己砍价，0：不允许；1：允许',
  `bang_num` int unsigned NOT NULL DEFAULT '0' COMMENT '帮砍人数',
  `how_long` int unsigned NOT NULL DEFAULT '0' COMMENT '砍价有效期，单位小时',
  `content` text COMMENT '商品信息',
  `guize` text COMMENT '规则说明',
  `fan_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '返现方式，0按成交金额比例1固定金额',
  `fan_fee` varchar(20) NOT NULL DEFAULT '0' COMMENT '比例或者固定金额是多少',
  `add_time` int unsigned NOT NULL DEFAULT '0',
  `upd_time` int unsigned NOT NULL DEFAULT '0',
  `is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '大于0就是软删除',
  `share_title` varchar(255) DEFAULT '' COMMENT '分享标题',
  `share_ftitle` varchar(255) DEFAULT '' COMMENT '砍价助力语',
  `base_sale` int unsigned NOT NULL DEFAULT '0' COMMENT '基础销量',
  `is_home` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐在首页',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='活动列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_goods_comments`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_goods_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_goods_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '业务订单id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `business_type` char(30) NOT NULL DEFAULT '' COMMENT '业务类型名称（如订单 order）',
  `content` char(255) NOT NULL DEFAULT '' COMMENT '评价内容',
  `images` text COMMENT '图片数据（一维数组json）',
  `reply` char(255) NOT NULL DEFAULT '' COMMENT '回复内容',
  `rating` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '评价级别（默认0 1~5）',
  `is_show` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否显示（0否, 1是）',
  `is_anonymous` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否匿名（0否，1是）',
  `is_reply` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否回复（0否，1是）',
  `reply_time` int unsigned NOT NULL DEFAULT '0' COMMENT '回复时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_goods_favor`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_goods_favor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_goods_favor` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户商品收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_goods_spec_base`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_goods_spec_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_goods_spec_base` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '砍价活动id',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '销售价格',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `weight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量（kg） ',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '条形码',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `extends` longtext COMMENT '扩展数据(json格式存储)',
  `xu` int unsigned NOT NULL DEFAULT '0' COMMENT '规格序号',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品规格基础';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_goods_spec_type`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_goods_spec_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_goods_spec_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `value` text NOT NULL COMMENT '类型值（json字符串存储）',
  `name` char(230) NOT NULL DEFAULT '' COMMENT '类型名称',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品规格类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_goods_spec_value`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_goods_spec_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_goods_spec_value` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_spec_base_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品规格基础id',
  `value` char(230) NOT NULL DEFAULT '' COMMENT '规格值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `goods_spec_base_id` (`goods_spec_base_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品规格值';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_order`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_no` char(60) NOT NULL DEFAULT '' COMMENT '订单号',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `warehouse_id` int unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `cut_id` int unsigned DEFAULT '0' COMMENT '活动ID',
  `cart_id` int unsigned NOT NULL DEFAULT '0' COMMENT '关联发起砍价时的购物车ID，虽然购物车删除了，但此时用来关联参与帮砍的',
  `user_note` char(255) NOT NULL DEFAULT '' COMMENT '用户备注',
  `express_id` int unsigned NOT NULL DEFAULT '0' COMMENT '快递id',
  `express_number` char(60) NOT NULL DEFAULT '' COMMENT '快递单号',
  `payment_id` int unsigned NOT NULL DEFAULT '0' COMMENT '支付方式id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态（0待确认, 1已确认/待支付, 2已支付/待发货, 3已发货/待收货, 4已完成, 5已取消, 6已关闭）',
  `pay_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '支付状态（0未支付, 1已支付, 2已退款, 3部分退款）',
  `extension_data` longtext COMMENT '扩展展示数据',
  `buy_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '购买商品总数量',
  `increase_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '增加的金额',
  `preferential_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单单价',
  `total_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价(订单最终价格)',
  `pay_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已支付金额',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_quantity` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `client_type` char(30) NOT NULL DEFAULT '' COMMENT '客户端类型（pc, h5, ios, android, alipay, weixin, baidu）取APPLICATION_CLIENT_TYPE常量值',
  `order_model` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单模式（0销售型, 1展示型, 2自提点, 3虚拟销售）',
  `is_under_line` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否线下支付（0否，1是）',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `confirm_time` int unsigned NOT NULL DEFAULT '0' COMMENT '确认时间',
  `delivery_time` int unsigned NOT NULL DEFAULT '0' COMMENT '发货时间',
  `cancel_time` int unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `collect_time` int unsigned NOT NULL DEFAULT '0' COMMENT '收货时间',
  `close_time` int unsigned NOT NULL DEFAULT '0' COMMENT '关闭时间',
  `comments_time` int unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `is_comments` int unsigned NOT NULL DEFAULT '0' COMMENT '商家是否已评论（0否, 大于0评论时间）',
  `user_is_comments` int unsigned NOT NULL DEFAULT '0' COMMENT '用户是否已评论（0否, 大于0评论时间）',
  `is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '商家是否已删除（0否, 大于0删除时间）',
  `user_is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '用户是否已删除（0否, 大于0删除时间）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `bank_id` int unsigned NOT NULL DEFAULT '0' COMMENT '银行卡ID',
  `order_type` int unsigned NOT NULL DEFAULT '0' COMMENT '0表示主系统订单',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  KEY `pay_status` (`pay_status`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_order_address`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_order_address` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `address_id` int unsigned NOT NULL DEFAULT '0' COMMENT '收件地址id',
  `alias` char(60) NOT NULL DEFAULT '' COMMENT '别名',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '收件人-姓名',
  `tel` char(15) NOT NULL DEFAULT '' COMMENT '收件人-电话',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-县/区',
  `address` char(200) NOT NULL DEFAULT '' COMMENT '收件人-详细地址',
  `province_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-省-名称',
  `city_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-市-名称',
  `county_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-县/区-名称',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-纬度',
  `idcard_name` char(60) NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `idcard_number` char(30) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `idcard_front` char(255) NOT NULL DEFAULT '' COMMENT '身份证人像面图片',
  `idcard_back` char(255) NOT NULL DEFAULT '' COMMENT '身份证国微面图片',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_order_currency`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_order_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_order_currency` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `currency_name` char(80) NOT NULL DEFAULT '' COMMENT '货币名称',
  `currency_code` char(60) NOT NULL DEFAULT '' COMMENT '货币代码',
  `currency_symbol` char(60) NOT NULL DEFAULT '' COMMENT '货币符号',
  `currency_rate` decimal(7,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '货币汇率',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `currency_name` (`currency_name`) USING BTREE,
  KEY `currency_code` (`currency_code`) USING BTREE,
  KEY `currency_rate` (`currency_rate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单货币';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_order_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_order_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `title` char(60) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '原价',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(单价*数量)',
  `spec` text COMMENT '规格',
  `buy_number` int unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `model` char(30) NOT NULL DEFAULT '' COMMENT '型号',
  `spec_weight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量（kg）',
  `spec_coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `spec_barcode` char(80) NOT NULL DEFAULT '' COMMENT '条形码',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_quantity` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_order_extraction_code`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_order_extraction_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_order_extraction_code` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '取货码',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单自提取货码关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_order_fictitious_value`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_order_fictitious_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_order_fictitious_value` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_detail_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单详情id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `value` text COMMENT '虚拟商品展示数据',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `order_detail_id` (`order_detail_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单虚拟销售数据关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_order_goods_inventory_log`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_order_goods_inventory_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_order_goods_inventory_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_detail_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单详情id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `order_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态（0待确认, 1已确认/待支付, 2已支付/待发货, 3已发货/待收货, 4已完成, 5已取消, 6已关闭）',
  `original_inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '原库存',
  `new_inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '最新库存',
  `is_rollback` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否回滚（0否, 1是）',
  `rollback_time` int unsigned NOT NULL DEFAULT '0' COMMENT '回滚时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`),
  KEY `order_status` (`order_status`),
  KEY `order_detail_id` (`order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单商品库存变更日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_order_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_order_status_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `original_status` varchar(60) NOT NULL DEFAULT '' COMMENT '原始状态',
  `new_status` varchar(60) NOT NULL DEFAULT '' COMMENT '最新状态',
  `msg` varchar(255) NOT NULL DEFAULT '' COMMENT '操作描述',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` varchar(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单状态历史纪录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_cutprice_slide`
--

DROP TABLE IF EXISTS `sxo_plugins_cutprice_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_cutprice_slide` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform` char(30) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序）',
  `event_type` tinyint NOT NULL DEFAULT '-1' COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` char(255) NOT NULL DEFAULT '' COMMENT '事件值',
  `images_url` char(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '别名',
  `bg_color` char(30) NOT NULL DEFAULT '' COMMENT 'css背景色值',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `shopid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`),
  KEY `platform` (`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='轮播图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_data_config`
--

DROP TABLE IF EXISTS `sxo_plugins_data_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_data_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `plugins` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '插件标识',
  `only_tag` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '唯一的标记',
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '数据值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `plugins` (`plugins`) USING BTREE,
  KEY `only_tag` (`only_tag`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='插件数据配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_delivery_config`
--

DROP TABLE IF EXISTS `sxo_plugins_delivery_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_delivery_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `business_id` int unsigned NOT NULL DEFAULT '0' COMMENT '业务id',
  `business_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '业务类型（0系统、1多门店、2多商户）',
  `only_tag` char(255) NOT NULL DEFAULT '' COMMENT '唯一的标记',
  `value` mediumtext COMMENT '数据值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `business_type` (`business_type`),
  KEY `business_id` (`business_id`),
  KEY `only_tag` (`only_tag`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='配置信息 - 配送员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_delivery_order`
--

DROP TABLE IF EXISTS `sxo_plugins_delivery_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_delivery_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `team_id` int unsigned NOT NULL DEFAULT '0' COMMENT '骑手id',
  `plugins_shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '多商户店铺id',
  `plugins_realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '多门店店铺id',
  `main_order_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '主订单用户id',
  `system_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '主系统订单id',
  `system_order_no` char(60) NOT NULL DEFAULT '' COMMENT '主系统订单号',
  `realstore_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店订单id',
  `realstore_order_no` char(60) NOT NULL DEFAULT '' COMMENT '门店订单号',
  `merchant_name` char(60) NOT NULL DEFAULT '' COMMENT '商户名称（系统订单为仓库名称、商家或门店则对应店铺名称）',
  `source_order` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '来源订单（0系统订单、1门店订单）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待接单、1待配送、2配送中、3已配送、4异常）',
  `total_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `buy_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '购买商品总数量',
  `is_valid` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否有效（0否、1是）',
  `user_note` char(255) NOT NULL DEFAULT '' COMMENT '用户备注',
  `receive_time` int unsigned NOT NULL DEFAULT '0' COMMENT '接收时间',
  `start_delivery_time` int unsigned NOT NULL DEFAULT '0' COMMENT '配送时间',
  `success_delivery_time` int unsigned NOT NULL DEFAULT '0' COMMENT '完成时间',
  `success_delivery_msg` char(255) NOT NULL DEFAULT '' COMMENT '配送完成说明',
  `success_delivery_images` text COMMENT '配送完成图片',
  `abnormal_delivery_time` int unsigned NOT NULL DEFAULT '0' COMMENT '异常配送时间',
  `abnormal_reason` char(255) NOT NULL DEFAULT '' COMMENT '异常原因',
  `print_number` int unsigned NOT NULL DEFAULT '0' COMMENT '订单打印次数',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `plugins_shop_id` (`plugins_shop_id`),
  KEY `plugins_realstore_id` (`plugins_realstore_id`),
  KEY `main_order_user_id` (`main_order_user_id`),
  KEY `system_order_id` (`system_order_id`),
  KEY `realstore_order_id` (`realstore_order_id`),
  KEY `source_order` (`source_order`),
  KEY `status` (`status`),
  KEY `is_valid` (`is_valid`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='配送订单 - 配送员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_delivery_order_currency`
--

DROP TABLE IF EXISTS `sxo_plugins_delivery_order_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_delivery_order_currency` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `delivery_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '配送订单id',
  `main_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `currency_name` char(80) NOT NULL DEFAULT '' COMMENT '货币名称',
  `currency_code` char(60) NOT NULL DEFAULT '' COMMENT '货币代码',
  `currency_symbol` char(60) NOT NULL DEFAULT '' COMMENT '货币符号',
  `currency_rate` decimal(12,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '货币汇率',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `delivery_order_id` (`delivery_order_id`),
  KEY `main_order_id` (`main_order_id`),
  KEY `currency_name` (`currency_name`),
  KEY `currency_code` (`currency_code`),
  KEY `currency_rate` (`currency_rate`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='配送订单货币 - 配送员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_delivery_order_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_delivery_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_delivery_order_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `delivery_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '配送订单id',
  `main_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `main_order_detail_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单详情id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `spec` text COMMENT '规格',
  `buy_number` int unsigned NOT NULL DEFAULT '0' COMMENT '购买数量（分配的数量）',
  `inventory_unit` char(80) NOT NULL DEFAULT '' COMMENT '库存单位',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(单价*数量)',
  `model` char(30) NOT NULL DEFAULT '' COMMENT '型号',
  `spec_weight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量（kg）',
  `spec_volume` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '体积（m³）',
  `spec_coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `spec_barcode` char(80) NOT NULL DEFAULT '' COMMENT '条形码',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `delivery_order_id` (`delivery_order_id`),
  KEY `main_order_id` (`main_order_id`),
  KEY `main_order_detail_id` (`main_order_detail_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='配送订单详情 - 配送员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_delivery_order_printer_log`
--

DROP TABLE IF EXISTS `sxo_plugins_delivery_order_printer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_delivery_order_printer_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `delivery_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '配送订单id',
  `main_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '主系统订单id',
  `main_order_no` char(60) NOT NULL DEFAULT '' COMMENT '主系统订单号',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待打印, 1已打印, 2打印失败）',
  `printer_sn` char(200) NOT NULL DEFAULT '' COMMENT '打印机编号',
  `request_params` mediumtext COMMENT '请求参数（数组则json字符串存储）',
  `response_data` mediumtext COMMENT '响应参数（数组则json字符串存储）',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `delivery_order_id` (`delivery_order_id`) USING BTREE,
  KEY `main_order_id` (`main_order_id`) USING BTREE,
  KEY `main_order_no` (`main_order_no`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `printer_sn` (`printer_sn`) USING BTREE,
  KEY `tsc` (`tsc`),
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单打印日志记录 - 配送员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_delivery_order_sms_log`
--

DROP TABLE IF EXISTS `sxo_plugins_delivery_order_sms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_delivery_order_sms_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `delivery_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '配送订单id',
  `main_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '主系统订单id',
  `main_order_no` char(60) NOT NULL DEFAULT '' COMMENT '主系统订单号',
  `mobile` char(30) NOT NULL DEFAULT '' COMMENT '手机',
  `template` char(230) NOT NULL DEFAULT '' COMMENT '短信模板ID',
  `sms_sign` char(60) NOT NULL DEFAULT '' COMMENT '短信签名',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未发送，1已发送，2已失败）',
  `reason` char(255) NOT NULL DEFAULT '' COMMENT '失败原因',
  `codes` mediumtext COMMENT '变量参数（数组则json字符串存储）',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `delivery_order_id` (`delivery_order_id`) USING BTREE,
  KEY `main_order_id` (`main_order_id`) USING BTREE,
  KEY `main_order_no` (`main_order_no`) USING BTREE,
  KEY `mobile` (`mobile`),
  KEY `template` (`template`),
  KEY `sms_sign` (`sms_sign`),
  KEY `status` (`status`),
  KEY `tsc` (`tsc`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单短信发送日志 - 配送员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_delivery_order_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_delivery_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_delivery_order_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `main_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '主系统订单id',
  `delivery_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '配送订单id',
  `original_status` varchar(60) NOT NULL DEFAULT '' COMMENT '原始状态',
  `new_status` varchar(60) NOT NULL DEFAULT '' COMMENT '最新状态',
  `msg` text COMMENT '操作描述',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` varchar(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `main_order_id` (`main_order_id`),
  KEY `delivery_order_id` (`delivery_order_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='配送订单状态日志 - 配送员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_delivery_order_team_location`
--

DROP TABLE IF EXISTS `sxo_plugins_delivery_order_team_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_delivery_order_team_location` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `delivery_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '配送订单id',
  `main_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `location` mediumtext COMMENT '经纬度坐标（json二维数组）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `delivery_order_id` (`delivery_order_id`),
  KEY `main_order_id` (`main_order_id`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='配送订单骑手位置 - 配送员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_delivery_order_user_address`
--

DROP TABLE IF EXISTS `sxo_plugins_delivery_order_user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_delivery_order_user_address` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `delivery_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '配送订单id',
  `main_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `alias` char(60) NOT NULL DEFAULT '' COMMENT '别名',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '收件人-姓名',
  `tel` char(15) NOT NULL DEFAULT '' COMMENT '收件人-电话',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-县/区',
  `address` char(200) NOT NULL DEFAULT '' COMMENT '收件人-详细地址',
  `province_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-省-名称',
  `city_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-市-名称',
  `county_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-县/区-名称',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-纬度',
  `appoint_time` char(60) NOT NULL DEFAULT '' COMMENT '指定时间',
  `extraction_contact_name` char(60) NOT NULL DEFAULT '' COMMENT '自提-联系人',
  `extraction_contact_tel` char(15) NOT NULL DEFAULT '' COMMENT '自提-联系电话',
  `idcard_name` char(60) NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `idcard_number` char(30) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `idcard_front` char(255) NOT NULL DEFAULT '' COMMENT '身份证人像面图片',
  `idcard_back` char(255) NOT NULL DEFAULT '' COMMENT '身份证国微面图片',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `delivery_order_id` (`delivery_order_id`),
  KEY `main_order_id` (`main_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='配送订单用户地址 - 配送员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_delivery_order_warehouse_address`
--

DROP TABLE IF EXISTS `sxo_plugins_delivery_order_warehouse_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_delivery_order_warehouse_address` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `delivery_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '配送订单id',
  `main_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `alias` char(60) NOT NULL DEFAULT '' COMMENT '别名',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '联系人-姓名',
  `tel` char(15) NOT NULL DEFAULT '' COMMENT '联系人-电话',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '联系人-省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '联系人-市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '联系人-县/区',
  `address` char(200) NOT NULL DEFAULT '' COMMENT '联系人-详细地址',
  `province_name` char(30) NOT NULL DEFAULT '' COMMENT '联系人-省-名称',
  `city_name` char(30) NOT NULL DEFAULT '' COMMENT '联系人-市-名称',
  `county_name` char(30) NOT NULL DEFAULT '' COMMENT '联系人-县/区-名称',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '发货地址-经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '发货地址-纬度',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `delivery_order_id` (`delivery_order_id`),
  KEY `main_order_id` (`main_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='配送订单仓库地址 - 配送员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_delivery_team`
--

DROP TABLE IF EXISTS `sxo_plugins_delivery_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_delivery_team` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待审核、1已审核、2已拒绝、3休息中、4已离职）',
  `region_ids` char(255) NOT NULL DEFAULT '' COMMENT '负责区域地区id',
  `work_photo` char(255) NOT NULL DEFAULT '' COMMENT '工作照片',
  `idcard_name` char(60) NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `idcard_number` char(30) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `idcard_front` char(255) NOT NULL DEFAULT '' COMMENT '身份证人像面图片',
  `idcard_back` char(255) NOT NULL DEFAULT '' COMMENT '身份证国微面图片',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '简介',
  `reason` char(255) NOT NULL DEFAULT '' COMMENT '审核失败原因',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  KEY `idcard_name` (`idcard_name`),
  KEY `idcard_number` (`idcard_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='骑手 - 配送员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_delivery_team_location`
--

DROP TABLE IF EXISTS `sxo_plugins_delivery_team_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_delivery_team_location` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `team_id` int unsigned NOT NULL DEFAULT '0' COMMENT '骑手id',
  `main_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '主系统订单id（配送订单过程中存储）',
  `delivery_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '配送订单id（配送订单过程中存储）',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '纬度',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `main_order_id` (`main_order_id`),
  KEY `delivery_order_id` (`delivery_order_id`),
  KEY `lng` (`lng`),
  KEY `lat` (`lat`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=516 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='骑手位置 - 配送员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_distribution_appoint_ladder_log`
--

DROP TABLE IF EXISTS `sxo_plugins_distribution_appoint_ladder_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_distribution_appoint_ladder_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int unsigned NOT NULL COMMENT '订单id',
  `level` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '级别记录',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='分销阶梯返佣记录 - 分销';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_distribution_appoint_ladder_log_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_distribution_appoint_ladder_log_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_distribution_appoint_ladder_log_goods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `log_id` int unsigned NOT NULL DEFAULT '0' COMMENT '日志id',
  `goods_id` int unsigned NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`),
  KEY `log_id` (`log_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='分销阶梯返佣记录商品 - 分销';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_distribution_custom_extraction_address`
--

DROP TABLE IF EXISTS `sxo_plugins_distribution_custom_extraction_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_distribution_custom_extraction_address` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `address_key` int unsigned NOT NULL DEFAULT '0' COMMENT '地址key',
  `address_oldid` int unsigned NOT NULL COMMENT '原始id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `address_key` (`address_key`),
  KEY `address_oldid` (`address_oldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='分销自定义取货地址 - 分销';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_distribution_integral_log`
--

DROP TABLE IF EXISTS `sxo_plugins_distribution_integral_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_distribution_integral_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `integral` int unsigned NOT NULL COMMENT '积分',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待发放, 1已发放, 2已退回）',
  `msg` text COMMENT '描述（一般用于退回描述）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='分销积分明细 - 分销';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_distribution_level`
--

DROP TABLE IF EXISTS `sxo_plugins_distribution_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_distribution_level` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '名称',
  `images_url` char(255) NOT NULL DEFAULT '' COMMENT '图标',
  `auto_level_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '条件类型（0满足以下任意条件、1满足以下全部条件）',
  `auto_level_type_where` char(255) NOT NULL DEFAULT '' COMMENT '条件类型（json存储）',
  `auto_level_self_consume_price_rules_min` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '自消费最小总额',
  `auto_level_self_consume_price_rules_max` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '自消费最大总额',
  `auto_level_self_consume_number_rules_min` int unsigned NOT NULL DEFAULT '0' COMMENT '自消费单最小数',
  `auto_level_self_consume_number_rules_max` int unsigned NOT NULL DEFAULT '0' COMMENT '自消费单最大数',
  `auto_level_promotion_income_order_price_rules_min` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '推广收益最小总额',
  `auto_level_promotion_income_order_price_rules_max` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '推广收益最大总额',
  `auto_level_promotion_income_order_number_rules_min` int unsigned NOT NULL DEFAULT '0' COMMENT '推广收益单最小数',
  `auto_level_promotion_income_order_number_rules_max` int unsigned NOT NULL DEFAULT '0' COMMENT '推广收益单最大数',
  `auto_level_promotion_income_team_number_rules_min` int unsigned NOT NULL DEFAULT '0' COMMENT '推广人数最小数',
  `auto_level_promotion_income_team_number_rules_max` int unsigned NOT NULL DEFAULT '0' COMMENT '推广人数最大数',
  `auto_level_promotion_income_team_consume_rules_min` int unsigned NOT NULL DEFAULT '0' COMMENT '推广消费人数最小总额',
  `auto_level_promotion_income_team_consume_rules_max` int unsigned NOT NULL DEFAULT '0' COMMENT '推广消费人数最大总额',
  `auto_level_user_points_number_rules_min` int unsigned NOT NULL DEFAULT '0' COMMENT '有效积分最小数',
  `auto_level_user_points_number_rules_max` int unsigned NOT NULL DEFAULT '0' COMMENT '有效积分最大数',
  `level_rate_one` decimal(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '一级返佣比例',
  `level_rate_two` decimal(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '二级返佣比例',
  `level_rate_three` decimal(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '三级返佣比例',
  `down_return_rate` decimal(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '向下返佣比例',
  `self_buy_rate` decimal(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '内购返佣比例',
  `force_current_user_rate_one` decimal(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '强制返佣至取货点返佣比例（一级）',
  `force_current_user_rate_two` decimal(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '强制返佣至取货点返佣比例（二级）',
  `force_current_user_rate_three` decimal(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '强制返佣至取货点返佣比例（三级）',
  `is_level_auto` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否自动分配等级（0否, 1是）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否, 1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='分销等级 - 分销';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_distribution_level_shop`
--

DROP TABLE IF EXISTS `sxo_plugins_distribution_level_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_distribution_level_shop` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `config` text COMMENT '返佣配置（json存储）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否, 1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `shop_id` (`shop_id`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='分销等级多商户 - 分销';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_distribution_poster`
--

DROP TABLE IF EXISTS `sxo_plugins_distribution_poster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_distribution_poster` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `system_type` char(60) NOT NULL DEFAULT 'default' COMMENT '系统类型（默认 default, 其他按照SYSTEM_TYPE常量类型）',
  `platform` char(255) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `images_url` char(255) NOT NULL DEFAULT '' COMMENT '海报地址',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `system_type` (`system_type`),
  KEY `platform` (`platform`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='海报地址 - 分销';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_distribution_profit_log`
--

DROP TABLE IF EXISTS `sxo_plugins_distribution_profit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_distribution_profit_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int unsigned NOT NULL COMMENT '订单id',
  `order_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单用户id',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `profit_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '收益类型（0金额, 1积分）',
  `profit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收益金额',
  `rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '等级返佣比例 0~100 的数字（创建时写入，防止发生退款重新计算时用户等级变更）',
  `spec_extends` mediumtext COMMENT '订单中所购买的商品对应规格的扩展数据（用于重新计算时候使用）',
  `level` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '当前级别（1~3）0则是向下返佣',
  `user_level_id` text COMMENT '用户等级id（扩展数据id）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '结算状态（0待生效, 1待结算, 2已结算, 3已失效）',
  `msg` text COMMENT '描述（一般用于退款描述）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2449 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='分销佣金明细 - 分销';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_distribution_recommend`
--

DROP TABLE IF EXISTS `sxo_plugins_distribution_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_distribution_recommend` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT '图标',
  `title` char(60) NOT NULL DEFAULT '' COMMENT '标题',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '简介',
  `goods_count` int unsigned NOT NULL DEFAULT '0' COMMENT '商品数量',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `title` (`title`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='分销商推荐宝 - 分销';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_distribution_recommend_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_distribution_recommend_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_distribution_recommend_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `recommend_id` int unsigned NOT NULL DEFAULT '0' COMMENT '推荐id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `spec` char(255) NOT NULL DEFAULT '' COMMENT '规格',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `recommend_id` (`recommend_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='分销商推荐宝商品 - 分销';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_distribution_superior_modify`
--

DROP TABLE IF EXISTS `sxo_plugins_distribution_superior_modify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_distribution_superior_modify` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `modify_number` int unsigned NOT NULL DEFAULT '0' COMMENT '已修改次数',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='上级用户修改 - 分销';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_distribution_user_self_extraction`
--

DROP TABLE IF EXISTS `sxo_plugins_distribution_user_self_extraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_distribution_user_self_extraction` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '站点id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '站点所属用户id',
  `logo` char(255) NOT NULL DEFAULT '' COMMENT 'logo图片',
  `alias` char(60) NOT NULL DEFAULT '' COMMENT '别名',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '姓名',
  `tel` char(15) NOT NULL DEFAULT '' COMMENT '电话',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '所在省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '所在市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '所在县/区',
  `address` char(80) NOT NULL DEFAULT '' COMMENT '详细地址',
  `lng` decimal(13,10) unsigned NOT NULL DEFAULT '0.0000000000' COMMENT '经度',
  `lat` decimal(13,10) unsigned NOT NULL DEFAULT '0.0000000000' COMMENT '纬度',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待审核, 1已通过, 2已拒绝, 3已解约）',
  `fail_reason` char(200) NOT NULL DEFAULT '' COMMENT '审核拒绝原因',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='分销商取货点 - 分销';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_distribution_user_self_extraction_order`
--

DROP TABLE IF EXISTS `sxo_plugins_distribution_user_self_extraction_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_distribution_user_self_extraction_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '站点id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '站点所属用户id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `self_extraction_id` int unsigned NOT NULL DEFAULT '0' COMMENT '取货点地址id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待处理, 1已处理）',
  `notes` char(200) NOT NULL DEFAULT '' COMMENT '备注',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `self_extraction_id` (`self_extraction_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='分销商取货点关联订单 - 分销';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_distribution_visit`
--

DROP TABLE IF EXISTS `sxo_plugins_distribution_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_distribution_visit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `team_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '团队用户id',
  `custom_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '客户用户id',
  `content` longtext COMMENT '拜访内容',
  `images` text COMMENT '图片数据（一维数组json）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `team_user_id` (`team_user_id`),
  KEY `custom_user_id` (`custom_user_id`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='客户拜访 - 分销';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_doc`
--

DROP TABLE IF EXISTS `sxo_plugins_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_doc` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cover` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `code_info` text COMMENT '代码信息',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='文档 - 文档';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_doc_content`
--

DROP TABLE IF EXISTS `sxo_plugins_doc_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_doc_content` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `doc_id` int unsigned NOT NULL DEFAULT '0' COMMENT '文档id',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `title` char(230) NOT NULL DEFAULT '' COMMENT '标题',
  `title_color` char(200) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `jump_url` char(255) NOT NULL DEFAULT '' COMMENT '跳转url地址',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `content` longtext COMMENT '内容',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `doc_id` (`doc_id`),
  KEY `category_id` (`category_id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`),
  KEY `access_count` (`access_count`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='文档内容 - 文档';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_doc_content_access`
--

DROP TABLE IF EXISTS `sxo_plugins_doc_content_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_doc_content_access` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `doc_content_id` int unsigned NOT NULL DEFAULT '0' COMMENT '文档内容id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `doc_content_id` (`doc_content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='文档内容访问日志 - 文档';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_doc_content_category`
--

DROP TABLE IF EXISTS `sxo_plugins_doc_content_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_doc_content_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `doc_id` int unsigned NOT NULL DEFAULT '0' COMMENT '文档id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `doc_id` (`doc_id`),
  KEY `sort` (`sort`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='文档内容分类 - 文档';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_doc_content_navigation`
--

DROP TABLE IF EXISTS `sxo_plugins_doc_content_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_doc_content_navigation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `doc_id` int unsigned NOT NULL DEFAULT '0' COMMENT '文档id',
  `platform` char(255) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `event_type` tinyint NOT NULL DEFAULT '-1' COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` char(255) NOT NULL DEFAULT '' COMMENT '事件值',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `doc_id` (`doc_id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='文档内容导航 - 文档';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_doc_navigation`
--

DROP TABLE IF EXISTS `sxo_plugins_doc_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_doc_navigation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform` char(255) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `event_type` tinyint NOT NULL DEFAULT '-1' COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` char(255) NOT NULL DEFAULT '' COMMENT '事件值',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='首页导航管理 - 文档';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_admin`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_admin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '管理用户id',
  `group_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '管理员组id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '用户名称',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` char(60) NOT NULL DEFAULT '' COMMENT '邮箱',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否、1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `user_id` (`user_id`),
  KEY `is_enable` (`is_enable`),
  KEY `name` (`name`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='管理员 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_admin_group`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_admin_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_admin_group` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `power` mediumtext COMMENT '权限数据（json存储）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否、1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `is_enable` (`is_enable`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='管理员组 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_brand`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_brand` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `logo` char(255) NOT NULL DEFAULT '' COMMENT 'logo图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `letter` char(120) NOT NULL DEFAULT '' COMMENT '拼音首字母',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `website_url` char(255) NOT NULL DEFAULT '' COMMENT '官网地址',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `name` (`name`),
  KEY `letter` (`letter`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=3949 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='品牌 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_brand_category`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_brand_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_brand_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `merchant_id` (`merchant_id`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='品牌分类 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_brand_category_join`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_brand_category_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_brand_category_join` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `brand_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `brand_category_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `brand_id` (`brand_id`) USING BTREE,
  KEY `brand_category_id` (`brand_category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='品牌分类关联 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_company`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_company` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `member_level_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '会员等级id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '简称',
  `letter` char(120) NOT NULL DEFAULT '' COMMENT '拼音首字母',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '编码',
  `logo` char(255) NOT NULL DEFAULT '' COMMENT 'loog',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `shop_user` char(255) NOT NULL DEFAULT '' COMMENT '商城对应用户（用户名、手机、邮箱）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `is_customer` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否客户（0否，1是）',
  `is_supplier` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否供应商（0否，1是）',
  `company_name` char(60) NOT NULL DEFAULT '' COMMENT '企业名称',
  `company_number` char(60) NOT NULL DEFAULT '' COMMENT '企业统一社会信用代码',
  `company_expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '执照有效日期',
  `company_is_time_forever` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '执照是否永久（0否，1是）',
  `company_license` char(255) NOT NULL DEFAULT '' COMMENT '企业执照图片',
  `more_prove` text COMMENT '更多材料附件证明、json存储',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '所在省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '所在市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '所在县/区',
  `address` char(160) NOT NULL DEFAULT '' COMMENT '详细地址',
  `contacts_name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `contacts_mobile` char(60) NOT NULL DEFAULT '' COMMENT '联系手机',
  `contacts_tel` char(60) NOT NULL DEFAULT '' COMMENT '联系座机',
  `contacts_email` char(60) NOT NULL DEFAULT '' COMMENT '联系邮箱',
  `bank_name` char(80) NOT NULL DEFAULT '' COMMENT '开户银行',
  `bank_address` char(80) NOT NULL DEFAULT '' COMMENT '开户地址',
  `bank_account` char(80) NOT NULL DEFAULT '' COMMENT '开户户名',
  `bank_number` char(60) NOT NULL DEFAULT '' COMMENT '开户户号',
  `is_invoice` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否开具发票（0否，1是）',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `member_level_id` (`member_level_id`),
  KEY `name` (`name`),
  KEY `letter` (`letter`),
  KEY `code` (`code`),
  KEY `is_enable` (`is_enable`),
  KEY `is_customer` (`is_customer`),
  KEY `is_supplier` (`is_supplier`),
  KEY `company_name` (`company_name`),
  KEY `company_number` (`company_number`),
  KEY `company_expire_time` (`company_expire_time`),
  KEY `company_is_time_forever` (`company_is_time_forever`),
  KEY `sort` (`sort`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='企业信息 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_company_category`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_company_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_company_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `merchant_id` (`merchant_id`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='企业分类 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_company_category_join`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_company_category_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_company_category_join` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `company_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '企业id',
  `company_category_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `company_id` (`company_id`) USING BTREE,
  KEY `company_category_id` (`company_category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='企业分类关联 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_config`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `only_tag` char(255) NOT NULL DEFAULT '' COMMENT '唯一的标记',
  `value` mediumtext COMMENT '数据值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `only_tag` (`only_tag`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1099 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='配置信息 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_inventory_check`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_inventory_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_inventory_check` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `inventory_check_no` char(60) NOT NULL DEFAULT '' COMMENT '库存盘点号（以IC开头）',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '盘点状态（0待提交、1待审核、2待盘点、3已盘点、4已拒绝、5已取消）',
  `check_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '盘点产品总数量',
  `check_user` char(30) NOT NULL DEFAULT '' COMMENT '盘点人员',
  `check_time` int unsigned DEFAULT '0' COMMENT '盘点时间',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `submit_time` int unsigned DEFAULT '0' COMMENT '提审时间',
  `audit_time` int unsigned DEFAULT '0' COMMENT '审核时间',
  `success_time` int unsigned DEFAULT '0' COMMENT '完成时间',
  `cancel_time` int unsigned DEFAULT '0' COMMENT '取消时间',
  `close_time` int unsigned DEFAULT '0' COMMENT '关闭时间',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `inventory_check_no` (`inventory_check_no`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='库存盘点 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_inventory_check_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_inventory_check_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_inventory_check_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `inventory_check_no` char(60) NOT NULL DEFAULT '' COMMENT '库存盘点号（以IC开头）',
  `inventory_check_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '库存盘点id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '计量单位数量（默认1）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '单位编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '单位条码',
  `weight` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位重量（kg）',
  `volume` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位体积（m³）',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `check_number` int unsigned NOT NULL DEFAULT '0' COMMENT '盘点数量',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `inventory_check_no` (`inventory_check_no`),
  KEY `inventory_check_id` (`inventory_check_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `title` (`title`),
  KEY `coding` (`coding`),
  KEY `barcode` (`barcode`),
  KEY `price` (`price`),
  KEY `check_number` (`check_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5667 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='库存盘点详情 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_inventory_check_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_inventory_check_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_inventory_check_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `inventory_check_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '库存盘点id',
  `original_status` char(10) NOT NULL DEFAULT '' COMMENT '原始状态-值',
  `original_name` char(60) NOT NULL DEFAULT '' COMMENT '原始状态-名称',
  `new_status` char(10) NOT NULL DEFAULT '' COMMENT '最新状态-值',
  `new_name` char(60) NOT NULL DEFAULT '' COMMENT '最新状态-名称',
  `msg` text COMMENT '操作描述',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `inventory_check_id` (`inventory_check_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='库存盘点状态历史记录 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_inventory_transfer`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_inventory_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_inventory_transfer` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `inventory_transfer_no` char(60) NOT NULL DEFAULT '' COMMENT '库存调拨号（以IT开头）',
  `out_warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '调出仓库id',
  `enter_warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '调入仓库id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '调拨状态（0待提交、1待审核、2待调拨、3已调拨、4已拒绝、5已取消）',
  `transfer_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '调拨产品总数量',
  `transfer_user` char(30) NOT NULL DEFAULT '' COMMENT '调拨人',
  `transfer_time` int unsigned DEFAULT '0' COMMENT '调拨时间',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `submit_time` int unsigned DEFAULT '0' COMMENT '提审时间',
  `audit_time` int unsigned DEFAULT '0' COMMENT '审核时间',
  `success_time` int unsigned DEFAULT '0' COMMENT '完成时间',
  `cancel_time` int unsigned DEFAULT '0' COMMENT '取消时间',
  `close_time` int unsigned DEFAULT '0' COMMENT '关闭时间',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `inventory_transfer_no` (`inventory_transfer_no`),
  KEY `out_warehouse_id` (`out_warehouse_id`),
  KEY `enter_warehouse_id` (`enter_warehouse_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='库存调拨 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_inventory_transfer_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_inventory_transfer_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_inventory_transfer_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `inventory_transfer_no` char(60) NOT NULL DEFAULT '' COMMENT '库存调拨号（以IT开头）',
  `inventory_transfer_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '库存调拨id',
  `out_warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '调出仓库id',
  `enter_warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '调入仓库id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '计量单位数量（默认1）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '单位编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '单位条码',
  `weight` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位重量（kg）',
  `volume` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位体积（m³）',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `transfer_number` int unsigned NOT NULL DEFAULT '0' COMMENT '调拨数量',
  `out_position_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '调出仓位id',
  `enter_position_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '调入仓位id',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `inventory_transfer_no` (`inventory_transfer_no`),
  KEY `inventory_transfer_id` (`inventory_transfer_id`),
  KEY `out_warehouse_id` (`out_warehouse_id`),
  KEY `enter_warehouse_id` (`enter_warehouse_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `title` (`title`),
  KEY `coding` (`coding`),
  KEY `barcode` (`barcode`),
  KEY `price` (`price`),
  KEY `transfer_number` (`transfer_number`)
) ENGINE=InnoDB AUTO_INCREMENT=374 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='库存调拨详情 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_inventory_transfer_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_inventory_transfer_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_inventory_transfer_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `inventory_transfer_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '库存调拨id',
  `original_status` char(10) NOT NULL DEFAULT '' COMMENT '原始状态-值',
  `original_name` char(60) NOT NULL DEFAULT '' COMMENT '原始状态-名称',
  `new_status` char(10) NOT NULL DEFAULT '' COMMENT '最新状态-值',
  `new_name` char(60) NOT NULL DEFAULT '' COMMENT '最新状态-名称',
  `msg` text COMMENT '操作描述',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `inventory_transfer_id` (`inventory_transfer_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='库存调拨状态历史记录 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_label_print_log`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_label_print_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_label_print_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `business_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '业务订单id',
  `business_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '业务类型（0产品标签、1销售运单、2商城运单）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待打印, 1已打印, 2打印失败）',
  `printer_sn` char(200) NOT NULL DEFAULT '' COMMENT '打印机编号',
  `request_params` mediumtext COMMENT '请求参数（数组则json字符串存储）',
  `response_data` mediumtext COMMENT '响应参数（数组则json字符串存储）',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `business_id` (`business_id`) USING BTREE,
  KEY `business_type` (`business_type`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `printer_sn` (`printer_sn`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2897 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='标签打印日志 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_member_level`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_member_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_member_level` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT '图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='会员等级 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_merchant`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_merchant` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待提交、1待审核，2已审核、3已拒绝、4已关闭）',
  `logo` char(255) NOT NULL DEFAULT '' COMMENT '正方形loog',
  `logo_long` char(255) NOT NULL DEFAULT '' COMMENT '长方形loog',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '简介',
  `category_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `is_system` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否主系统（0否，1是）',
  `is_shop` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否多商户（0否，1是）',
  `is_realstore` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否门店（0否，1是）',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '到期时间（0则永久）',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '所在省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '所在市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '所在县/区',
  `address` char(160) NOT NULL DEFAULT '' COMMENT '详细地址',
  `contacts_name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `contacts_mobile` char(60) NOT NULL DEFAULT '' COMMENT '联系手机',
  `contacts_tel` char(60) NOT NULL DEFAULT '' COMMENT '联系座机',
  `contacts_email` char(60) NOT NULL DEFAULT '' COMMENT '联系邮箱',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `warn_email` varchar(255) DEFAULT NULL,
  `warn_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `category_id` (`category_id`),
  KEY `is_system` (`is_system`),
  KEY `is_shop` (`is_shop`),
  KEY `is_realstore` (`is_realstore`),
  KEY `expire_time` (`expire_time`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商户 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_merchant_category`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_merchant_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_merchant_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商户分类 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_operate_log`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_operate_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` char(255) NOT NULL DEFAULT '' COMMENT '名称',
  `url` text COMMENT 'url地址',
  `is_get` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否GET（0否、1是）',
  `is_post` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否POST（0否、1是）',
  `is_ajax` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否AJAX（0否、1是）',
  `ip` char(60) NOT NULL DEFAULT '' COMMENT 'IP',
  `client` text COMMENT '客户端详情信息',
  `request_params` mediumtext COMMENT '请求参数（数组则json字符串存储）',
  `response_data` mediumtext COMMENT '响应数据（数组则json字符串存储）',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `user_id` (`user_id`),
  KEY `name` (`name`),
  KEY `tsc` (`tsc`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=128738 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='操作日志 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_other_enter`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_other_enter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_other_enter` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `other_enter_no` char(60) NOT NULL DEFAULT '' COMMENT '其他入库单号（以OE开头）',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商企业id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '入库状态（0待提交、1待审核、2待入库、3已入库、4已拒绝、5已取消）',
  `price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单价',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '税金总额',
  `total_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总价（单价+税金）',
  `enter_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '入库产品总数量',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `admin_note` char(230) NOT NULL DEFAULT '' COMMENT '管理员备注信息（仅后台可见）',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息（用户可见）',
  `submit_time` int unsigned DEFAULT '0' COMMENT '提审时间',
  `audit_time` int unsigned DEFAULT '0' COMMENT '审核时间',
  `success_time` int unsigned DEFAULT '0' COMMENT '完成时间',
  `cancel_time` int unsigned DEFAULT '0' COMMENT '取消时间',
  `close_time` int unsigned DEFAULT '0' COMMENT '关闭时间',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `other_enter_no` (`other_enter_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `status` (`status`),
  KEY `price` (`price`),
  KEY `total_price` (`total_price`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='其他入库单 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_other_enter_0917`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_other_enter_0917`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_other_enter_0917` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `other_enter_no` char(60) NOT NULL DEFAULT '' COMMENT '其他入库单号（以OE开头）',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商企业id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '入库状态（0待提交、1待审核、2待入库、3已入库、4已拒绝、5已取消）',
  `price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单价',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '税金总额',
  `total_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总价（单价+税金）',
  `enter_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '入库产品总数量',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `admin_note` char(230) NOT NULL DEFAULT '' COMMENT '管理员备注信息（仅后台可见）',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息（用户可见）',
  `submit_time` int unsigned DEFAULT '0' COMMENT '提审时间',
  `audit_time` int unsigned DEFAULT '0' COMMENT '审核时间',
  `success_time` int unsigned DEFAULT '0' COMMENT '完成时间',
  `cancel_time` int unsigned DEFAULT '0' COMMENT '取消时间',
  `close_time` int unsigned DEFAULT '0' COMMENT '关闭时间',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `other_enter_no` (`other_enter_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `status` (`status`),
  KEY `price` (`price`),
  KEY `total_price` (`total_price`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='其他入库单 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_other_enter_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_other_enter_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_other_enter_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `other_enter_no` char(60) NOT NULL DEFAULT '' COMMENT '其他入库单号（以OE开头）',
  `other_enter_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '其他入库单id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商企业id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '计量单位数量（默认1）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '单位编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '单位条码',
  `weight` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位重量（kg）',
  `volume` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位体积（m³）',
  `retail_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '入库价',
  `enter_number` int unsigned NOT NULL DEFAULT '0' COMMENT '入库数量',
  `total_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(入库价*入库数量+税金、录单可调整总额)',
  `tax` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '税金',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当前税金总额',
  `position_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓位id',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `other_enter_no` (`other_enter_no`),
  KEY `other_enter_id` (`other_enter_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `title` (`title`),
  KEY `coding` (`coding`),
  KEY `barcode` (`barcode`),
  KEY `price` (`price`),
  KEY `enter_number` (`enter_number`),
  KEY `total_price` (`total_price`)
) ENGINE=InnoDB AUTO_INCREMENT=13284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='其他入库单详情 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_other_enter_detail_0917`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_other_enter_detail_0917`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_other_enter_detail_0917` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `other_enter_no` char(60) NOT NULL DEFAULT '' COMMENT '其他入库单号（以OE开头）',
  `other_enter_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '其他入库单id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商企业id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '计量单位数量（默认1）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '单位编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '单位条码',
  `weight` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位重量（kg）',
  `volume` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位体积（m³）',
  `retail_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '入库价',
  `enter_number` int unsigned NOT NULL DEFAULT '0' COMMENT '入库数量',
  `total_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(入库价*入库数量+税金、录单可调整总额)',
  `tax` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '税金',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当前税金总额',
  `position_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓位id',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `other_enter_no` (`other_enter_no`),
  KEY `other_enter_id` (`other_enter_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `title` (`title`),
  KEY `coding` (`coding`),
  KEY `barcode` (`barcode`),
  KEY `price` (`price`),
  KEY `enter_number` (`enter_number`),
  KEY `total_price` (`total_price`)
) ENGINE=InnoDB AUTO_INCREMENT=8238 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='其他入库单详情 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_other_enter_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_other_enter_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_other_enter_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `other_enter_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '其他入库单id',
  `original_status` char(10) NOT NULL DEFAULT '' COMMENT '原始状态-值',
  `original_name` char(60) NOT NULL DEFAULT '' COMMENT '原始状态-名称',
  `new_status` char(10) NOT NULL DEFAULT '' COMMENT '最新状态-值',
  `new_name` char(60) NOT NULL DEFAULT '' COMMENT '最新状态-名称',
  `msg` text COMMENT '操作描述',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `other_enter_id` (`other_enter_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB AUTO_INCREMENT=504 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='其他入库单状态历史记录 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_other_out`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_other_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_other_out` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `other_out_no` char(60) NOT NULL DEFAULT '' COMMENT '其他出库单号（以OT开头）',
  `customer_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '客户企业id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '出库状态（0待提交、1待审核、2待出库、3已出库、4已拒绝、5已取消）',
  `price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单价',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '出库税金总额',
  `total_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '出库总价（单价+税金）',
  `out_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '出库产品总数量',
  `contacts_name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `contacts_tel` char(60) NOT NULL DEFAULT '' COMMENT '联系电话',
  `address` char(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `express_name` char(60) NOT NULL DEFAULT '' COMMENT '快递名称',
  `express_number` char(60) NOT NULL DEFAULT '' COMMENT '快递单号',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `admin_note` char(230) NOT NULL DEFAULT '' COMMENT '管理员备注信息（仅后台可见）',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息（用户可见）',
  `submit_time` int unsigned DEFAULT '0' COMMENT '提审时间',
  `audit_time` int unsigned DEFAULT '0' COMMENT '审核时间',
  `success_time` int unsigned DEFAULT '0' COMMENT '完成时间',
  `cancel_time` int unsigned DEFAULT '0' COMMENT '取消时间',
  `close_time` int unsigned DEFAULT '0' COMMENT '关闭时间',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `other_out_no` (`other_out_no`),
  KEY `customer_id` (`customer_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `status` (`status`),
  KEY `price` (`price`),
  KEY `total_price` (`total_price`),
  KEY `express_number` (`express_number`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='其他出库单 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_other_out_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_other_out_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_other_out_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `other_out_no` char(60) NOT NULL DEFAULT '' COMMENT '其他出库单号（以OT开头）',
  `other_out_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '其他出库单id',
  `customer_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '客户企业id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '计量单位数量（默认1）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '单位编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '单位条码',
  `weight` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位重量（kg）',
  `volume` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位体积（m³）',
  `retail_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '出库价',
  `out_number` int unsigned NOT NULL DEFAULT '0' COMMENT '出库数量',
  `total_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(出库价*出库数量)',
  `tax` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '税金',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当前税金总额',
  `position_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓位id',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `other_out_no` (`other_out_no`),
  KEY `other_out_id` (`other_out_id`),
  KEY `customer_id` (`customer_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `unit_number` (`unit_number`),
  KEY `title` (`title`),
  KEY `coding` (`coding`),
  KEY `barcode` (`barcode`),
  KEY `price` (`price`),
  KEY `out_number` (`out_number`),
  KEY `total_price` (`total_price`),
  KEY `position_id` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='其他出库单详情 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_other_out_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_other_out_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_other_out_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `other_out_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '其他出库单id',
  `original_status` char(10) NOT NULL DEFAULT '' COMMENT '原始状态-值',
  `original_name` char(60) NOT NULL DEFAULT '' COMMENT '原始状态-名称',
  `new_status` char(10) NOT NULL DEFAULT '' COMMENT '最新状态-值',
  `new_name` char(60) NOT NULL DEFAULT '' COMMENT '最新状态-名称',
  `msg` text COMMENT '操作描述',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `other_out_id` (`other_out_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='其他出库单状态历史记录 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_print_template`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_print_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_print_template` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '类型（0采购单、1销售单）',
  `config` mediumtext COMMENT '模板数据',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `name` (`name`),
  KEY `type` (`type`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='打印模板 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_product`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `brand_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `group_key` char(60) NOT NULL DEFAULT '' COMMENT '组标识',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0正常、1下架、2停售、3停产）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `letter` char(120) NOT NULL DEFAULT '' COMMENT '拼音首字母',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `simple_desc` char(230) NOT NULL DEFAULT '' COMMENT '简述',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `price` char(60) NOT NULL DEFAULT '' COMMENT '销售价格（单值如:10, 区间如:10.00-20.00）一般用于展示使用',
  `min_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低价格',
  `max_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最高价格',
  `cost_price` char(60) NOT NULL DEFAULT '' COMMENT '成本价（单值如:10, 区间如:10.00-20.00）一般用于展示使用',
  `min_cost_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低成本价',
  `max_cost_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最大成本价',
  `inventory` bigint unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `content` mediumtext COMMENT '详情内容',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注',
  `default_supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '默认供应商企业id',
  `default_warehouse_position` text COMMENT '默认仓库仓位（json存储）',
  `is_exist_many_spec` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个规格（0否, 1是）',
  `is_exist_many_unit` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个单位（0否, 1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `brand_id` (`brand_id`),
  KEY `group_key` (`group_key`),
  KEY `status` (`status`),
  KEY `title` (`title`),
  KEY `letter` (`letter`),
  KEY `coding` (`coding`),
  KEY `inventory` (`inventory`)
) ENGINE=InnoDB AUTO_INCREMENT=74703 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='产品 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_product_0914`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_product_0914`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_product_0914` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `brand_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `group_key` char(60) NOT NULL DEFAULT '' COMMENT '组标识',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0正常、1下架、2停售、3停产）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `letter` char(120) NOT NULL DEFAULT '' COMMENT '拼音首字母',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `simple_desc` char(230) NOT NULL DEFAULT '' COMMENT '简述',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `price` char(60) NOT NULL DEFAULT '' COMMENT '销售价格（单值如:10, 区间如:10.00-20.00）一般用于展示使用',
  `min_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低价格',
  `max_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最高价格',
  `cost_price` char(60) NOT NULL DEFAULT '' COMMENT '成本价（单值如:10, 区间如:10.00-20.00）一般用于展示使用',
  `min_cost_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低成本价',
  `max_cost_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最大成本价',
  `inventory` bigint unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `content` mediumtext COMMENT '详情内容',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注',
  `default_supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '默认供应商企业id',
  `default_warehouse_position` text COMMENT '默认仓库仓位（json存储）',
  `is_exist_many_spec` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个规格（0否, 1是）',
  `is_exist_many_unit` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个单位（0否, 1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `brand_id` (`brand_id`),
  KEY `group_key` (`group_key`),
  KEY `status` (`status`),
  KEY `title` (`title`),
  KEY `letter` (`letter`),
  KEY `coding` (`coding`),
  KEY `inventory` (`inventory`)
) ENGINE=InnoDB AUTO_INCREMENT=62975 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='产品 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_product_0917`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_product_0917`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_product_0917` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `brand_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `group_key` char(60) NOT NULL DEFAULT '' COMMENT '组标识',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0正常、1下架、2停售、3停产）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `letter` char(120) NOT NULL DEFAULT '' COMMENT '拼音首字母',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `simple_desc` char(230) NOT NULL DEFAULT '' COMMENT '简述',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `price` char(60) NOT NULL DEFAULT '' COMMENT '销售价格（单值如:10, 区间如:10.00-20.00）一般用于展示使用',
  `min_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低价格',
  `max_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最高价格',
  `cost_price` char(60) NOT NULL DEFAULT '' COMMENT '成本价（单值如:10, 区间如:10.00-20.00）一般用于展示使用',
  `min_cost_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低成本价',
  `max_cost_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最大成本价',
  `inventory` bigint unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `content` mediumtext COMMENT '详情内容',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注',
  `default_supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '默认供应商企业id',
  `default_warehouse_position` text COMMENT '默认仓库仓位（json存储）',
  `is_exist_many_spec` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个规格（0否, 1是）',
  `is_exist_many_unit` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个单位（0否, 1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `brand_id` (`brand_id`),
  KEY `group_key` (`group_key`),
  KEY `status` (`status`),
  KEY `title` (`title`),
  KEY `letter` (`letter`),
  KEY `coding` (`coding`),
  KEY `inventory` (`inventory`)
) ENGINE=InnoDB AUTO_INCREMENT=63037 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='产品 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_product_1207`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_product_1207`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_product_1207` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `brand_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `group_key` char(60) NOT NULL DEFAULT '' COMMENT '组标识',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0正常、1下架、2停售、3停产）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `letter` char(120) NOT NULL DEFAULT '' COMMENT '拼音首字母',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `simple_desc` char(230) NOT NULL DEFAULT '' COMMENT '简述',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `price` char(60) NOT NULL DEFAULT '' COMMENT '销售价格（单值如:10, 区间如:10.00-20.00）一般用于展示使用',
  `min_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低价格',
  `max_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最高价格',
  `cost_price` char(60) NOT NULL DEFAULT '' COMMENT '成本价（单值如:10, 区间如:10.00-20.00）一般用于展示使用',
  `min_cost_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低成本价',
  `max_cost_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最大成本价',
  `inventory` bigint unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `content` mediumtext COMMENT '详情内容',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注',
  `default_supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '默认供应商企业id',
  `default_warehouse_position` text COMMENT '默认仓库仓位（json存储）',
  `is_exist_many_spec` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个规格（0否, 1是）',
  `is_exist_many_unit` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个单位（0否, 1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `brand_id` (`brand_id`),
  KEY `group_key` (`group_key`),
  KEY `status` (`status`),
  KEY `title` (`title`),
  KEY `letter` (`letter`),
  KEY `coding` (`coding`),
  KEY `inventory` (`inventory`)
) ENGINE=InnoDB AUTO_INCREMENT=69884 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='产品 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_product_1219`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_product_1219`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_product_1219` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `brand_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `group_key` char(60) NOT NULL DEFAULT '' COMMENT '组标识',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0正常、1下架、2停售、3停产）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `letter` char(120) NOT NULL DEFAULT '' COMMENT '拼音首字母',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `simple_desc` char(230) NOT NULL DEFAULT '' COMMENT '简述',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `price` char(60) NOT NULL DEFAULT '' COMMENT '销售价格（单值如:10, 区间如:10.00-20.00）一般用于展示使用',
  `min_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低价格',
  `max_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最高价格',
  `cost_price` char(60) NOT NULL DEFAULT '' COMMENT '成本价（单值如:10, 区间如:10.00-20.00）一般用于展示使用',
  `min_cost_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低成本价',
  `max_cost_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最大成本价',
  `inventory` bigint unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `content` mediumtext COMMENT '详情内容',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注',
  `default_supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '默认供应商企业id',
  `default_warehouse_position` text COMMENT '默认仓库仓位（json存储）',
  `is_exist_many_spec` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个规格（0否, 1是）',
  `is_exist_many_unit` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个单位（0否, 1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `brand_id` (`brand_id`),
  KEY `group_key` (`group_key`),
  KEY `status` (`status`),
  KEY `title` (`title`),
  KEY `letter` (`letter`),
  KEY `coding` (`coding`),
  KEY `inventory` (`inventory`)
) ENGINE=InnoDB AUTO_INCREMENT=73216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='产品 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_product_base`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_product_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_product_base` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '1' COMMENT '计量单位数量（默认1）',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '条码',
  `weight` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量（kg）',
  `volume` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '体积（m³）',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `cost_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `is_sync_shop` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '同步商城（0否, 1是）',
  `extends` longtext COMMENT '扩展数据(json格式存储)',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `images` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `unit_number` (`unit_number`),
  KEY `coding` (`coding`),
  KEY `barcode` (`barcode`),
  KEY `price` (`price`),
  KEY `cost_price` (`cost_price`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=73455 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='产品基础 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_product_base_1207`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_product_base_1207`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_product_base_1207` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '1' COMMENT '计量单位数量（默认1）',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '条码',
  `weight` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量（kg）',
  `volume` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '体积（m³）',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `cost_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `is_sync_shop` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '同步商城（0否, 1是）',
  `extends` longtext COMMENT '扩展数据(json格式存储)',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `images` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `unit_number` (`unit_number`),
  KEY `coding` (`coding`),
  KEY `barcode` (`barcode`),
  KEY `price` (`price`),
  KEY `cost_price` (`cost_price`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=68721 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='产品基础 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_product_base_1219`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_product_base_1219`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_product_base_1219` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '1' COMMENT '计量单位数量（默认1）',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '条码',
  `weight` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量（kg）',
  `volume` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '体积（m³）',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `cost_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `is_sync_shop` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '同步商城（0否, 1是）',
  `extends` longtext COMMENT '扩展数据(json格式存储)',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `images` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `unit_number` (`unit_number`),
  KEY `coding` (`coding`),
  KEY `barcode` (`barcode`),
  KEY `price` (`price`),
  KEY `cost_price` (`cost_price`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=72033 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='产品基础 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_product_category`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_product_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `merchant_id` (`merchant_id`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=13574 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='产品分类 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_product_category_join`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_product_category_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_product_category_join` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `product_category_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `product_category_id` (`product_category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84040 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='产品分类关联 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_product_inventory_sync_system_goods_log`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_product_inventory_sync_system_goods_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_product_inventory_sync_system_goods_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `inventory_log_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '库存日志id',
  `system_warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商城-仓库id',
  `system_goods_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商城-商品id',
  `system_goods_spec` char(60) NOT NULL DEFAULT '' COMMENT '商城-商品规格',
  `opt_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '操作类型（0扣减、1增加、2盘点）',
  `inventory` bigint unsigned NOT NULL DEFAULT '0' COMMENT '操作库存',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `product_id` (`product_id`),
  KEY `inventory_log_id` (`inventory_log_id`),
  KEY `system_warehouse_id` (`system_warehouse_id`),
  KEY `system_goods_id` (`system_goods_id`),
  KEY `opt_type` (`opt_type`),
  KEY `inventory` (`inventory`)
) ENGINE=InnoDB AUTO_INCREMENT=18983 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='产品库存同步到商城日志 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_product_price_sync_system_goods_price_log`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_product_price_sync_system_goods_price_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_product_price_sync_system_goods_price_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `product_base_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品基础id',
  `goods_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `spec` char(200) NOT NULL DEFAULT '' COMMENT '规格',
  `where_field` char(80) NOT NULL DEFAULT '' COMMENT '条件类型（coding编码、barcode条码）',
  `where_value` char(80) NOT NULL DEFAULT '' COMMENT '条件值',
  `price_field` char(80) NOT NULL DEFAULT '' COMMENT '更新数据字段（price销售价、original_price原价）',
  `price_value` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '售价值',
  `original_value` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '商城原始售价',
  `operate` int unsigned NOT NULL DEFAULT '0' COMMENT '操作-用户id',
  `operate_name` char(60) NOT NULL DEFAULT '' COMMENT '操作人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `product_id` (`product_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7795 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='产品售价同步到商城商品售价日志 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_purchase`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_purchase` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `purchase_no` char(60) NOT NULL DEFAULT '' COMMENT '采购单号（以P开头）',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商企业id',
  `pay_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '付款方式（0未确定、1账期结算、2预付款、3银行转账、4现金支付、5在线支付、6其他方式）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '采购状态（0待提交、1待审核、2已审核、3采购中、4已采购、5入库中、6已入库、7已拒绝、8已取消、9已关闭）',
  `pay_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '付款状态（0未付款、1付款中、2已付款、3已中断）',
  `returned_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '退货状态（0无退货、1部分退、2已退货）',
  `price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单价',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '税金总额',
  `total_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总价（单价+税金）',
  `pay_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已支付金额',
  `buy_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '采购产品总数量',
  `final_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最终单价',
  `final_total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最终税金总额',
  `final_total_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最终总价（单价+税金）',
  `final_buy_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最终产品总数量',
  `returned_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '退款总额',
  `returned_number` int unsigned NOT NULL DEFAULT '0' COMMENT '退货总数',
  `contacts_name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `contacts_tel` char(60) NOT NULL DEFAULT '' COMMENT '联系电话',
  `bank_name` char(80) NOT NULL DEFAULT '' COMMENT '开户银行',
  `bank_address` char(80) NOT NULL DEFAULT '' COMMENT '开户地址',
  `bank_account` char(80) NOT NULL DEFAULT '' COMMENT '开户户名',
  `bank_number` char(60) NOT NULL DEFAULT '' COMMENT '开户户号',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `admin_note` char(230) NOT NULL DEFAULT '' COMMENT '管理员备注信息（仅后台可见）',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息（用户可见）',
  `submit_time` int unsigned DEFAULT '0' COMMENT '提审时间',
  `audit_time` int unsigned DEFAULT '0' COMMENT '审核时间',
  `purchase_start_time` int unsigned DEFAULT '0' COMMENT '采购开始时间',
  `purchase_success_time` int unsigned DEFAULT '0' COMMENT '采购完成时间',
  `enter_start_time` int unsigned DEFAULT '0' COMMENT '入库开始时间',
  `success_time` int unsigned DEFAULT '0' COMMENT '完成时间',
  `cancel_time` int unsigned DEFAULT '0' COMMENT '取消时间',
  `close_time` int unsigned DEFAULT '0' COMMENT '关闭时间',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `expire_time` bigint DEFAULT NULL COMMENT '过保质期时间',
  `warn_email` varchar(255) DEFAULT NULL,
  `warn_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `purchase_no` (`purchase_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `pay_type` (`pay_type`),
  KEY `status` (`status`),
  KEY `pay_status` (`pay_status`),
  KEY `returned_status` (`returned_status`),
  KEY `price` (`price`),
  KEY `total_price` (`total_price`),
  KEY `final_price` (`final_price`),
  KEY `final_total_price` (`final_total_price`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='采购单 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_purchase_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_purchase_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_purchase_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `purchase_no` char(60) NOT NULL DEFAULT '' COMMENT '采购单号（以P开头）',
  `purchase_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '采购单id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商企业id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '计量单位数量（默认1）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '单位编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '单位条码',
  `weight` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位重量（kg）',
  `volume` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位体积（m³）',
  `retail_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '采购价',
  `buy_number` int unsigned NOT NULL DEFAULT '0' COMMENT '采购数量',
  `total_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(采购价*采购数量+税金、录单可调整总额)',
  `tax` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '税金',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当前税金总额',
  `returned_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_number` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `final_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '最终采购价',
  `final_buy_number` int unsigned NOT NULL DEFAULT '0' COMMENT '最终采购数量',
  `final_total_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '最终当前总价(采购价*采购数量+税金、录单可调整总额)',
  `final_tax` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '最终税金',
  `final_total_tax` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '最终当前税金总额',
  `formal_enter_number` int unsigned NOT NULL DEFAULT '0' COMMENT '已正式入库数量',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `expire_at` datetime DEFAULT NULL COMMENT '过保质期时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `purchase_no` (`purchase_no`),
  KEY `purchase_id` (`purchase_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `title` (`title`),
  KEY `coding` (`coding`),
  KEY `barcode` (`barcode`),
  KEY `price` (`price`),
  KEY `buy_number` (`buy_number`),
  KEY `total_price` (`total_price`),
  KEY `final_price` (`final_price`),
  KEY `final_buy_number` (`final_buy_number`),
  KEY `final_total_price` (`final_total_price`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='采购单详情 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_purchase_enter`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_purchase_enter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_purchase_enter` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `purchase_enter_no` char(60) NOT NULL DEFAULT '' COMMENT '采购入库单号（以W开头）',
  `purchase_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '采购单id',
  `purchase_no` char(60) NOT NULL DEFAULT '' COMMENT '采购单号',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商企业id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '入库状态（0待入库、1已入库、2已取消）',
  `price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '采购价',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '采购税金总额',
  `total_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '采购总价（单价+税金）',
  `enter_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '入库产品总数量',
  `contacts_name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `contacts_tel` char(60) NOT NULL DEFAULT '' COMMENT '联系电话',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `success_time` int unsigned DEFAULT '0' COMMENT '完成时间',
  `cancel_time` int unsigned DEFAULT '0' COMMENT '取消时间',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `purchase_enter_no` (`purchase_enter_no`),
  KEY `purchase_id` (`purchase_id`),
  KEY `purchase_no` (`purchase_no`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `status` (`status`),
  KEY `price` (`price`),
  KEY `total_price` (`total_price`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='采购入库单 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_purchase_enter_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_purchase_enter_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_purchase_enter_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `purchase_enter_no` char(60) NOT NULL DEFAULT '' COMMENT '采购入库单号（以W开头）',
  `purchase_enter_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '采购入库单id',
  `purchase_detail_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '采购单详情id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商企业id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '计量单位数量（默认1）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '单位编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '单位条码',
  `weight` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位重量（kg）',
  `volume` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位体积（m³）',
  `retail_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '采购价',
  `buy_number` int unsigned NOT NULL DEFAULT '0' COMMENT '采购数量',
  `total_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(采购价*采购数量+税金)',
  `tax` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '税金',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当前税金总额',
  `enter_number` int unsigned NOT NULL DEFAULT '0' COMMENT '入库数量',
  `position_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓位id',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `purchase_enter_no` (`purchase_enter_no`),
  KEY `purchase_enter_id` (`purchase_enter_id`),
  KEY `purchase_detail_id` (`purchase_detail_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `title` (`title`),
  KEY `coding` (`coding`),
  KEY `barcode` (`barcode`),
  KEY `price` (`price`),
  KEY `buy_number` (`buy_number`),
  KEY `total_price` (`total_price`),
  KEY `enter_number` (`enter_number`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='采购入库单详情 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_purchase_enter_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_purchase_enter_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_purchase_enter_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `purchase_enter_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '采购入库单id',
  `original_status` char(10) NOT NULL DEFAULT '' COMMENT '原始状态-值',
  `original_name` char(60) NOT NULL DEFAULT '' COMMENT '原始状态-名称',
  `new_status` char(10) NOT NULL DEFAULT '' COMMENT '最新状态-值',
  `new_name` char(60) NOT NULL DEFAULT '' COMMENT '最新状态-名称',
  `msg` text COMMENT '操作描述',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `purchase_enter_id` (`purchase_enter_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='采购入库单状态历史记录 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_purchase_payment`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_purchase_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_purchase_payment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `purchase_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '采购单id',
  `purchase_no` char(60) NOT NULL DEFAULT '' COMMENT '采购单号',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商企业id',
  `pay_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '付款方式（0未确定、1账期结算、2预付款、3银行转账、4现金支付、5在线支付、6其他方式）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '付款状态（0待付款、1付款中、2已付款、3已关闭）',
  `payment_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '应付总额（采购总额-采购退款金额）',
  `not_expend_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '未付总额',
  `expend_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已付总额',
  `invoice_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '开票状态（0未开票、1开票中、2已开票、3无需开票）',
  `invoice_time` int unsigned DEFAULT '0' COMMENT '开票时间',
  `invoice_annex` text COMMENT '开票附件（附件信息json存储）',
  `purchase_total_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '采购总额（单价+税金）',
  `purchase_buy_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '采购产品总数量',
  `purchase_returned_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '采购退款金额',
  `purchase_returned_number` int unsigned NOT NULL DEFAULT '0' COMMENT '采购退货数量',
  `contacts_name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `contacts_tel` char(60) NOT NULL DEFAULT '' COMMENT '联系电话',
  `address` char(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `bank_name` char(80) NOT NULL DEFAULT '' COMMENT '开户银行',
  `bank_address` char(80) NOT NULL DEFAULT '' COMMENT '开户地址',
  `bank_account` char(80) NOT NULL DEFAULT '' COMMENT '开户户名',
  `bank_number` char(60) NOT NULL DEFAULT '' COMMENT '开户户号',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `expend_start_time` int unsigned DEFAULT '0' COMMENT '付款开始时间',
  `expend_success_time` int unsigned DEFAULT '0' COMMENT '付款完成时间',
  `close_time` int unsigned DEFAULT '0' COMMENT '关闭时间',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `purchase_no` (`purchase_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `pay_type` (`pay_type`),
  KEY `status` (`status`),
  KEY `invoice_status` (`invoice_status`),
  KEY `payment_price` (`payment_price`),
  KEY `not_expend_price` (`not_expend_price`),
  KEY `expend_price` (`expend_price`),
  KEY `purchase_total_price` (`purchase_total_price`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='采购付款单 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_purchase_payment_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_purchase_payment_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_purchase_payment_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `purchase_no` char(60) NOT NULL DEFAULT '' COMMENT '采购单号',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商企业id',
  `purchase_payment_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '采购付款单id',
  `pay_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '付款方式（0未确定、1账期结算、2预付款、3银行转账、4现金支付、5在线支付、6其他方式）',
  `expend_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '付款金额',
  `expend_name` char(60) NOT NULL DEFAULT '' COMMENT '付款人',
  `expend_time` int unsigned NOT NULL DEFAULT '0' COMMENT '付款时间',
  `expend_evidence` text COMMENT '付款凭证（附件信息json存储）',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `purchase_no` (`purchase_no`),
  KEY `merchant_id` (`merchant_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `purchase_payment_id` (`purchase_payment_id`),
  KEY `expend_price` (`expend_price`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='采购付款单详情 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_purchase_payment_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_purchase_payment_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_purchase_payment_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `purchase_payment_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '采购付款单id',
  `original_status` char(10) NOT NULL DEFAULT '' COMMENT '原始状态-值',
  `original_name` char(60) NOT NULL DEFAULT '' COMMENT '原始状态-名称',
  `new_status` char(10) NOT NULL DEFAULT '' COMMENT '最新状态-值',
  `new_name` char(60) NOT NULL DEFAULT '' COMMENT '最新状态-名称',
  `msg` text COMMENT '操作描述',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `purchase_payment_id` (`purchase_payment_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='采购付款单状态历史记录 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_purchase_returned`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_purchase_returned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_purchase_returned` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `purchase_returned_no` char(60) NOT NULL DEFAULT '' COMMENT '采购退货单号（以PR开头）',
  `purchase_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '采购单id',
  `purchase_no` char(60) NOT NULL DEFAULT '' COMMENT '采购单号',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商企业id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '退货状态（0待退货、1已退货、2已取消）',
  `price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '采购价',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '采购税金总额',
  `total_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '采购总价（单价+税金）',
  `returned_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '退款总额',
  `returned_number` int unsigned NOT NULL DEFAULT '0' COMMENT '退货总数',
  `contacts_name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `contacts_tel` char(60) NOT NULL DEFAULT '' COMMENT '联系电话',
  `address` char(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `express_name` char(60) NOT NULL DEFAULT '' COMMENT '快递名称',
  `express_number` char(60) NOT NULL DEFAULT '' COMMENT '快递单号',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `success_time` int unsigned DEFAULT '0' COMMENT '完成时间',
  `cancel_time` int unsigned DEFAULT '0' COMMENT '取消时间',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `purchase_returned_no` (`purchase_returned_no`),
  KEY `purchase_id` (`purchase_id`),
  KEY `purchase_no` (`purchase_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `status` (`status`),
  KEY `price` (`price`),
  KEY `total_price` (`total_price`),
  KEY `express_number` (`express_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='采购退货单 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_purchase_returned_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_purchase_returned_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_purchase_returned_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `purchase_returned_no` char(60) NOT NULL DEFAULT '' COMMENT '采购退货单号（以PR开头）',
  `purchase_returned_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '采购退货单id',
  `purchase_detail_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '采购单详情id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商企业id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '计量单位数量（默认1）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '单位编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '单位条码',
  `weight` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位重量（kg）',
  `volume` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位体积（m³）',
  `retail_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '采购价',
  `buy_number` int unsigned NOT NULL DEFAULT '0' COMMENT '采购数量',
  `total_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(采购价*采购数量+税金)',
  `tax` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '税金',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当前税金总额',
  `returned_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_number` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `purchase_returned_no` (`purchase_returned_no`),
  KEY `purchase_returned_id` (`purchase_returned_id`),
  KEY `purchase_detail_id` (`purchase_detail_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `title` (`title`),
  KEY `coding` (`coding`),
  KEY `barcode` (`barcode`),
  KEY `price` (`price`),
  KEY `buy_number` (`buy_number`),
  KEY `total_price` (`total_price`),
  KEY `returned_price` (`returned_price`),
  KEY `returned_number` (`returned_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='采购退货单详情 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_purchase_returned_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_purchase_returned_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_purchase_returned_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `purchase_returned_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '采购退货单id',
  `original_status` char(10) NOT NULL DEFAULT '' COMMENT '原始状态-值',
  `original_name` char(60) NOT NULL DEFAULT '' COMMENT '原始状态-名称',
  `new_status` char(10) NOT NULL DEFAULT '' COMMENT '最新状态-值',
  `new_name` char(60) NOT NULL DEFAULT '' COMMENT '最新状态-名称',
  `msg` text COMMENT '操作描述',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `purchase_returned_id` (`purchase_returned_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='采购退货单状态历史记录 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_purchase_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_purchase_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_purchase_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `purchase_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '采购单id',
  `original_status` char(10) NOT NULL DEFAULT '' COMMENT '原始状态-值',
  `original_name` char(60) NOT NULL DEFAULT '' COMMENT '原始状态-名称',
  `new_status` char(10) NOT NULL DEFAULT '' COMMENT '最新状态-值',
  `new_name` char(60) NOT NULL DEFAULT '' COMMENT '最新状态-名称',
  `msg` text COMMENT '操作描述',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='采购单状态历史记录 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_purchase_warn`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_purchase_warn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_purchase_warn` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint DEFAULT NULL,
  `day` int NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `expire_at` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `is_warn` tinyint(1) NOT NULL,
  `purchase_detail_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_realstore_order_allot`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_realstore_order_allot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_realstore_order_allot` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `customer_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '客户企业id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_allot_no` char(60) NOT NULL DEFAULT '' COMMENT '订单分配单号',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店用户id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `order_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单用户id',
  `created_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单来源（0系统指派, 1门店收银, 2用户扫码）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态（0待接收、1已接收、2服务中、3待签收、4已完成、5转单中、6已取消、7已关闭）',
  `order_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单模式（0快递配送, 1客户自提, 2上门服务, 3虚拟产品）',
  `total_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `special_remarks` char(200) NOT NULL DEFAULT '' COMMENT '特别说明（管理员填写）',
  `transfer_reason` char(200) NOT NULL DEFAULT '' COMMENT '转单原因（门店申请转单填写）',
  `service_msg` char(200) NOT NULL DEFAULT '' COMMENT '服务描述（门店填写）',
  `receive_time` int unsigned NOT NULL DEFAULT '0' COMMENT '接收时间',
  `service_time` int unsigned NOT NULL DEFAULT '0' COMMENT '服务时间',
  `success_time` int unsigned NOT NULL DEFAULT '0' COMMENT '完成时间',
  `transfer_time` int unsigned NOT NULL DEFAULT '0' COMMENT '转单时间',
  `cancel_time` int unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '门店是否已删除（0否, 大于0删除时间）',
  `creator_id` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-名称',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `customer_id` (`customer_id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `order_allot_no` (`order_allot_no`),
  KEY `realstore_id` (`realstore_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `order_user_id` (`order_user_id`),
  KEY `status` (`status`),
  KEY `order_type` (`order_type`),
  KEY `creator_id` (`creator_id`),
  KEY `is_delete_time` (`is_delete_time`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店订单分配 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_realstore_order_allot_address`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_realstore_order_allot_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_realstore_order_allot_address` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `alias` char(60) NOT NULL DEFAULT '' COMMENT '别名',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '收件人-姓名',
  `tel` char(15) NOT NULL DEFAULT '' COMMENT '收件人-电话',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-县/区',
  `address` char(200) NOT NULL DEFAULT '' COMMENT '收件人-详细地址',
  `province_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-省-名称',
  `city_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-市-名称',
  `county_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-县/区-名称',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-纬度',
  `appoint_time` char(60) NOT NULL DEFAULT '' COMMENT '指定时间',
  `extraction_contact_name` char(60) NOT NULL DEFAULT '' COMMENT '自提-联系人',
  `extraction_contact_tel` char(15) NOT NULL DEFAULT '' COMMENT '自提-联系电话',
  `idcard_name` char(60) NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `idcard_number` char(30) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `idcard_front` char(255) NOT NULL DEFAULT '' COMMENT '身份证人像面图片',
  `idcard_back` char(255) NOT NULL DEFAULT '' COMMENT '身份证国微面图片',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店订单分配地址 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_realstore_order_allot_currency`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_realstore_order_allot_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_realstore_order_allot_currency` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `currency_name` char(80) NOT NULL DEFAULT '' COMMENT '货币名称',
  `currency_code` char(60) NOT NULL DEFAULT '' COMMENT '货币代码',
  `currency_symbol` char(60) NOT NULL DEFAULT '' COMMENT '货币符号',
  `currency_rate` decimal(7,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '货币汇率',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `order_id` (`order_id`),
  KEY `currency_name` (`currency_name`),
  KEY `currency_code` (`currency_code`),
  KEY `currency_rate` (`currency_rate`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店订单分配货币 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_realstore_order_allot_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_realstore_order_allot_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_realstore_order_allot_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `order_detail_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单详情id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '对应产品id',
  `product_base_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '对应产品基础id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `spec` text COMMENT '规格',
  `buy_number` int unsigned NOT NULL DEFAULT '0' COMMENT '购买数量（分配的数量）',
  `inventory_unit` char(80) NOT NULL DEFAULT '' COMMENT '库存单位',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(单价*数量)',
  `model` char(30) NOT NULL DEFAULT '' COMMENT '型号',
  `spec_weight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量（kg）',
  `spec_volume` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '体积（m³）',
  `spec_coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `spec_barcode` char(80) NOT NULL DEFAULT '' COMMENT '条形码',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `order_id` (`order_id`),
  KEY `order_detail_id` (`order_detail_id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店订单分配详情 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_realstore_order_allot_express`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_realstore_order_allot_express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_realstore_order_allot_express` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `express_id` int unsigned NOT NULL DEFAULT '0' COMMENT '快递id',
  `express_name` char(80) NOT NULL DEFAULT '' COMMENT '快递名称',
  `express_number` char(60) NOT NULL DEFAULT '' COMMENT '快递单号',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `order_id` (`order_id`),
  KEY `express_id` (`express_id`),
  KEY `express_name` (`express_name`),
  KEY `express_number` (`express_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店订单分配快递 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_realstore_order_allot_extraction_code`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_realstore_order_allot_extraction_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_realstore_order_allot_extraction_code` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '取货码',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店订单分配自提取货码 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_realstore_order_allot_fictitious_value`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_realstore_order_allot_fictitious_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_realstore_order_allot_fictitious_value` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_allot_detail_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单详情id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `order_detail_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单详情id',
  `value` text COMMENT '虚拟商品展示数据',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `order_allot_detail_id` (`order_allot_detail_id`),
  KEY `order_id` (`order_id`),
  KEY `order_detail_id` (`order_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店订单分配虚拟销售数据 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_realstore_order_allot_staff`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_realstore_order_allot_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_realstore_order_allot_staff` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `staff_id` int unsigned NOT NULL DEFAULT '0' COMMENT '员工id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '员工编号',
  `alias` char(30) NOT NULL DEFAULT '' COMMENT '员工别名',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` char(60) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `avatar` char(255) NOT NULL DEFAULT '' COMMENT '员工头像地址',
  `settle_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算固定金额',
  `settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `staff_id` (`staff_id`),
  KEY `user_id` (`user_id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `mobile` (`mobile`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店订单分配服务的员工 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_realstore_order_allot_table_code`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_realstore_order_allot_table_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_realstore_order_allot_table_code` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `tablecode_id` int unsigned NOT NULL DEFAULT '0' COMMENT '桌码id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '编号',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `order_id` (`order_id`),
  KEY `tablecode_id` (`tablecode_id`),
  KEY `name` (`name`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店订单分配桌码 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_sales`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `sales_no` char(60) NOT NULL DEFAULT '' COMMENT '销售单号（以S开头）',
  `customer_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '客户企业id',
  `staff_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '职员id',
  `pay_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '付款方式（0未确定、1账期结算、2预付款、3银行转账、4现金支付、5在线支付、6其他方式）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '销售状态（0待提交、1待审核、2已审核、3发货中、4已发货、5已收货、6已拒绝、7已取消、8已关闭）',
  `pay_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '付款状态（0未付款、1付款中、2已付款、3已中断）',
  `returned_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '退货状态（0无退货、1部分退、2已退货）',
  `price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单价',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '销售税金总额',
  `total_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '销售总价（单价+税金）',
  `pay_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已支付金额',
  `buy_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '销售产品总数量',
  `returned_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_number` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `contacts_name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `contacts_tel` char(60) NOT NULL DEFAULT '' COMMENT '联系电话',
  `address` char(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `bank_name` char(80) NOT NULL DEFAULT '' COMMENT '开户银行',
  `bank_address` char(80) NOT NULL DEFAULT '' COMMENT '开户地址',
  `bank_account` char(80) NOT NULL DEFAULT '' COMMENT '开户户名',
  `bank_number` char(60) NOT NULL DEFAULT '' COMMENT '开户户号',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `admin_note` char(230) NOT NULL DEFAULT '' COMMENT '管理员备注信息（仅后台可见）',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息（用户可见）',
  `submit_time` int unsigned DEFAULT '0' COMMENT '提审时间',
  `audit_time` int unsigned DEFAULT '0' COMMENT '审核时间',
  `deliver_start_time` int unsigned DEFAULT '0' COMMENT '发货开始时间',
  `deliver_success_time` int unsigned DEFAULT '0' COMMENT '发货完成时间',
  `success_time` int unsigned DEFAULT '0' COMMENT '完成时间',
  `cancel_time` int unsigned DEFAULT '0' COMMENT '取消时间',
  `close_time` int unsigned DEFAULT '0' COMMENT '关闭时间',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `sales_no` (`sales_no`),
  KEY `customer_id` (`customer_id`),
  KEY `staff_id` (`staff_id`),
  KEY `pay_type` (`pay_type`),
  KEY `status` (`status`),
  KEY `pay_status` (`pay_status`),
  KEY `returned_status` (`returned_status`),
  KEY `price` (`price`),
  KEY `total_price` (`total_price`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='销售单 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_sales_deliver`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_sales_deliver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_sales_deliver` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `sales_deliver_no` char(60) NOT NULL DEFAULT '' COMMENT '销售发货单号（以SD开头）',
  `sales_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '销售单id',
  `sales_no` char(60) NOT NULL DEFAULT '' COMMENT '销售单号',
  `customer_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '客户企业id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `staff_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '职员id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '发货状态（0待发货、1已发货、2已收货、3已取消、4已关闭）',
  `returned_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '退货状态（0无退货、1部分退、2已退货）',
  `price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单价',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '销售税金总额',
  `total_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '销售总价（单价+税金）',
  `deliver_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '发货产品总数量',
  `returned_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_number` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `contacts_name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `contacts_tel` char(60) NOT NULL DEFAULT '' COMMENT '联系电话',
  `address` char(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `express_name` char(60) NOT NULL DEFAULT '' COMMENT '快递名称',
  `express_number` char(60) NOT NULL DEFAULT '' COMMENT '快递单号',
  `bank_name` char(80) NOT NULL DEFAULT '' COMMENT '开户银行',
  `bank_address` char(80) NOT NULL DEFAULT '' COMMENT '开户地址',
  `bank_account` char(80) NOT NULL DEFAULT '' COMMENT '开户户名',
  `bank_number` char(60) NOT NULL DEFAULT '' COMMENT '开户户号',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `admin_note` char(230) NOT NULL DEFAULT '' COMMENT '管理员备注信息（仅后台可见）',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息（用户可见）',
  `deliver_time` int unsigned DEFAULT '0' COMMENT '发货时间',
  `success_time` int unsigned DEFAULT '0' COMMENT '完成时间',
  `cancel_time` int unsigned DEFAULT '0' COMMENT '取消时间',
  `close_time` int unsigned DEFAULT '0' COMMENT '关闭时间',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `sales_deliver_no` (`sales_deliver_no`),
  KEY `sales_id` (`sales_id`),
  KEY `sales_no` (`sales_no`),
  KEY `customer_id` (`customer_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `staff_id` (`staff_id`),
  KEY `status` (`status`),
  KEY `returned_status` (`returned_status`),
  KEY `price` (`price`),
  KEY `total_price` (`total_price`),
  KEY `express_number` (`express_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='销售发货单 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_sales_deliver_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_sales_deliver_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_sales_deliver_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `sales_deliver_no` char(60) NOT NULL DEFAULT '' COMMENT '销售发货单号（以SD开头）',
  `sales_deliver_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '销售发货单id',
  `sales_detail_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '销售单详情id',
  `customer_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '客户企业id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '计量单位数量（默认1）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '单位编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '单位条码',
  `weight` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位重量（kg）',
  `volume` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位体积（m³）',
  `retail_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '销售价',
  `buy_number` int unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `total_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(销售价*采购数量)',
  `tax` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '税金',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当前税金总额',
  `deliver_number` int unsigned NOT NULL DEFAULT '0' COMMENT '发货数量',
  `returned_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_number` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `position_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓位id',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `sales_deliver_no` (`sales_deliver_no`),
  KEY `sales_deliver_id` (`sales_deliver_id`),
  KEY `sales_detail_id` (`sales_detail_id`),
  KEY `customer_id` (`customer_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `unit_number` (`unit_number`),
  KEY `title` (`title`),
  KEY `coding` (`coding`),
  KEY `barcode` (`barcode`),
  KEY `price` (`price`),
  KEY `buy_number` (`buy_number`),
  KEY `total_price` (`total_price`),
  KEY `deliver_number` (`deliver_number`),
  KEY `position_id` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='销售发货单详情 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_sales_deliver_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_sales_deliver_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_sales_deliver_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `sales_deliver_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '销售发货单id',
  `original_status` char(10) NOT NULL DEFAULT '' COMMENT '原始状态-值',
  `original_name` char(60) NOT NULL DEFAULT '' COMMENT '原始状态-名称',
  `new_status` char(10) NOT NULL DEFAULT '' COMMENT '最新状态-值',
  `new_name` char(60) NOT NULL DEFAULT '' COMMENT '最新状态-名称',
  `msg` text COMMENT '操作描述',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `sales_deliver_id` (`sales_deliver_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='销售发货单状态历史记录 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_sales_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_sales_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_sales_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `sales_no` char(60) NOT NULL DEFAULT '' COMMENT '销售单号（以S开头）',
  `sales_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '销售单id',
  `customer_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '客户企业id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '计量单位数量（默认1）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '单位编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '单位条码',
  `weight` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位重量（kg）',
  `volume` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位体积（m³）',
  `retail_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '销售价',
  `buy_number` int unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `total_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(销售价*采购数量)',
  `tax` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '税金',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当前税金总额',
  `returned_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_number` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `formal_deliver_number` int unsigned NOT NULL DEFAULT '0' COMMENT '已正式发货数量',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `sales_no` (`sales_no`),
  KEY `sales_id` (`sales_id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `unit_number` (`unit_number`),
  KEY `title` (`title`),
  KEY `coding` (`coding`),
  KEY `barcode` (`barcode`),
  KEY `price` (`price`),
  KEY `buy_number` (`buy_number`),
  KEY `total_price` (`total_price`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='销售单详情 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_sales_receivable`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_sales_receivable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_sales_receivable` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `sales_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '销售单id',
  `sales_no` char(60) NOT NULL DEFAULT '' COMMENT '销售单号',
  `customer_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '客户企业id',
  `staff_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '职员id',
  `pay_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '付款方式（0未确定、1账期结算、2预付款、3银行转账、4现金支付、5在线支付、6其他方式）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '收款状态（0待收款、1收款中、2已收款、3已关闭）',
  `receivable_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '应收总额（销售总额-销售退款金额）',
  `not_received_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '未收总额',
  `received_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已收总额',
  `invoice_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '开票状态（0未开票、1开票中、2已开票、3无需开票）',
  `invoice_time` int unsigned DEFAULT '0' COMMENT '开票时间',
  `invoice_annex` text COMMENT '开票附件（附件信息json存储）',
  `sales_total_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '销售总额（单价+税金）',
  `sales_buy_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '销售产品总数量',
  `sales_returned_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '销售退款金额',
  `sales_returned_number` int unsigned NOT NULL DEFAULT '0' COMMENT '销售退货数量',
  `contacts_name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `contacts_tel` char(60) NOT NULL DEFAULT '' COMMENT '联系电话',
  `address` char(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `bank_name` char(80) NOT NULL DEFAULT '' COMMENT '开户银行',
  `bank_address` char(80) NOT NULL DEFAULT '' COMMENT '开户地址',
  `bank_account` char(80) NOT NULL DEFAULT '' COMMENT '开户户名',
  `bank_number` char(60) NOT NULL DEFAULT '' COMMENT '开户户号',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `received_start_time` int unsigned DEFAULT '0' COMMENT '收款开始时间',
  `received_success_time` int unsigned DEFAULT '0' COMMENT '收款完成时间',
  `close_time` int unsigned DEFAULT '0' COMMENT '关闭时间',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `sales_no` (`sales_no`),
  KEY `customer_id` (`customer_id`),
  KEY `staff_id` (`staff_id`),
  KEY `pay_type` (`pay_type`),
  KEY `status` (`status`),
  KEY `invoice_status` (`invoice_status`),
  KEY `receivable_price` (`receivable_price`),
  KEY `not_received_price` (`not_received_price`),
  KEY `received_price` (`received_price`),
  KEY `sales_total_price` (`sales_total_price`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='销售收款单 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_sales_receivable_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_sales_receivable_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_sales_receivable_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `sales_no` char(60) NOT NULL DEFAULT '' COMMENT '销售单号',
  `customer_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '客户企业id',
  `sales_receivable_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '销售收款单id',
  `pay_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '付款方式（0未确定、1账期结算、2预付款、3银行转账、4现金支付、5在线支付、6其他方式）',
  `received_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已收金额',
  `received_name` char(60) NOT NULL DEFAULT '' COMMENT '收款人',
  `received_time` int unsigned NOT NULL DEFAULT '0' COMMENT '收款时间',
  `received_evidence` text COMMENT '收款凭证（附件信息json存储）',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `sales_no` (`sales_no`),
  KEY `customer_id` (`customer_id`),
  KEY `sales_receivable_id` (`sales_receivable_id`),
  KEY `received_price` (`received_price`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='销售收款单详情 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_sales_receivable_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_sales_receivable_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_sales_receivable_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `sales_receivable_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '销售收款单id',
  `original_status` char(10) NOT NULL DEFAULT '' COMMENT '原始状态-值',
  `original_name` char(60) NOT NULL DEFAULT '' COMMENT '原始状态-名称',
  `new_status` char(10) NOT NULL DEFAULT '' COMMENT '最新状态-值',
  `new_name` char(60) NOT NULL DEFAULT '' COMMENT '最新状态-名称',
  `msg` text COMMENT '操作描述',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `sales_receivable_id` (`sales_receivable_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='销售收款单状态历史记录 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_sales_returned`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_sales_returned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_sales_returned` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `sales_returned_no` char(60) NOT NULL DEFAULT '' COMMENT '销售退货单号（以SR开头）',
  `sales_deliver_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '销售发货单id',
  `sales_deliver_no` char(60) NOT NULL DEFAULT '' COMMENT '销售发货单号',
  `sales_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '销售单id',
  `sales_no` char(60) NOT NULL DEFAULT '' COMMENT '销售单号',
  `customer_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '客户企业id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `staff_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '职员id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '退货状态（0待退货、1已退货、2已取消）',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '类型（0发货退货单、1独立退货单）',
  `price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '销售价',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '销售税金总额',
  `total_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '销售总价（单价+税金）',
  `returned_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '退款总额',
  `returned_number` int unsigned NOT NULL DEFAULT '0' COMMENT '退货总数',
  `contacts_name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `contacts_tel` char(60) NOT NULL DEFAULT '' COMMENT '联系电话',
  `address` char(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `express_name` char(60) NOT NULL DEFAULT '' COMMENT '快递名称',
  `express_number` char(60) NOT NULL DEFAULT '' COMMENT '快递单号',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `success_time` int unsigned DEFAULT '0' COMMENT '完成时间',
  `cancel_time` int unsigned DEFAULT '0' COMMENT '取消时间',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `sales_returned_no` (`sales_returned_no`),
  KEY `sales_deliver_id` (`sales_deliver_id`),
  KEY `sales_deliver_no` (`sales_deliver_no`),
  KEY `sales_id` (`sales_id`),
  KEY `sales_no` (`sales_no`),
  KEY `customer_id` (`customer_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `staff_id` (`staff_id`),
  KEY `status` (`status`),
  KEY `type` (`type`),
  KEY `price` (`price`),
  KEY `total_price` (`total_price`),
  KEY `express_number` (`express_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='销售退货单 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_sales_returned_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_sales_returned_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_sales_returned_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `sales_returned_no` char(60) NOT NULL DEFAULT '' COMMENT '销售退货单号（以SR开头）',
  `sales_returned_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '销售发货退货单id',
  `sales_deliver_detail_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '销售发货单详情id',
  `sales_detail_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '销售单详情id',
  `customer_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '客户企业id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '计量单位数量（默认1）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '单位编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '单位条码',
  `weight` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位重量（kg）',
  `volume` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位体积（m³）',
  `retail_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '销售价',
  `deliver_number` int unsigned NOT NULL DEFAULT '0' COMMENT '销售发货数量',
  `total_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(销售价*销售发货数量+税金)',
  `tax` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '税金',
  `total_tax` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当前税金总额',
  `returned_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_number` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `position_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓位id',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `sales_returned_no` (`sales_returned_no`),
  KEY `sales_returned_id` (`sales_returned_id`),
  KEY `sales_deliver_detail_id` (`sales_deliver_detail_id`),
  KEY `sales_detail_id` (`sales_detail_id`),
  KEY `customer_id` (`customer_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `title` (`title`),
  KEY `coding` (`coding`),
  KEY `barcode` (`barcode`),
  KEY `price` (`price`),
  KEY `deliver_number` (`deliver_number`),
  KEY `total_price` (`total_price`),
  KEY `returned_price` (`returned_price`),
  KEY `returned_number` (`returned_number`),
  KEY `position_id` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='销售退货单详情 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_sales_returned_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_sales_returned_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_sales_returned_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `sales_returned_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '销售退货单id',
  `original_status` char(10) NOT NULL DEFAULT '' COMMENT '原始状态-值',
  `original_name` char(60) NOT NULL DEFAULT '' COMMENT '原始状态-名称',
  `new_status` char(10) NOT NULL DEFAULT '' COMMENT '最新状态-值',
  `new_name` char(60) NOT NULL DEFAULT '' COMMENT '最新状态-名称',
  `msg` text COMMENT '操作描述',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `sales_returned_id` (`sales_returned_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='销售退货单状态历史记录 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_sales_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_sales_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_sales_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `sales_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '销售单id',
  `original_status` char(10) NOT NULL DEFAULT '' COMMENT '原始状态-值',
  `original_name` char(60) NOT NULL DEFAULT '' COMMENT '原始状态-名称',
  `new_status` char(10) NOT NULL DEFAULT '' COMMENT '最新状态-值',
  `new_name` char(60) NOT NULL DEFAULT '' COMMENT '最新状态-名称',
  `msg` text COMMENT '操作描述',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `sales_id` (`sales_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='销售单状态历史记录 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_staff`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_staff` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '编号',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '手机',
  `email` char(60) NOT NULL DEFAULT '' COMMENT '邮箱',
  `family_tel` char(15) NOT NULL DEFAULT '' COMMENT '家庭电话',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `name` (`name`),
  KEY `code` (`code`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='职员 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_system_goods_excel_update_goods_log`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_system_goods_excel_update_goods_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_system_goods_excel_update_goods_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `goods_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商城商品id',
  `spec_base_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商城商品规格id',
  `operate_data` text COMMENT '操作数据',
  `original_data` text COMMENT '原始数据',
  `operate` int unsigned NOT NULL DEFAULT '0' COMMENT '操作-用户id',
  `operate_name` char(60) NOT NULL DEFAULT '' COMMENT '操作人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='excel更新商城商品日志 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_system_goods_excel_update_product_log`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_system_goods_excel_update_product_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_system_goods_excel_update_product_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `product_base_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品基础id',
  `operate_data` text COMMENT '操作数据',
  `original_data` text COMMENT '原始数据',
  `operate` int unsigned NOT NULL DEFAULT '0' COMMENT '操作-用户id',
  `operate_name` char(60) NOT NULL DEFAULT '' COMMENT '操作人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='excel更新产品日志 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_system_goods_price_sync_product_price_log`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_system_goods_price_sync_product_price_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_system_goods_price_sync_product_price_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `product_base_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品基础id',
  `goods_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `where_field` char(80) NOT NULL DEFAULT '' COMMENT '条件类型（coding编码、barcode条码）',
  `where_value` char(80) NOT NULL DEFAULT '' COMMENT '条件值',
  `price_field` char(80) NOT NULL DEFAULT '' COMMENT '更新数据字段（price销售价、original_price原价）',
  `price_value` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '售价值',
  `original_value` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '商城原始售价',
  `operate` int unsigned NOT NULL DEFAULT '0' COMMENT '操作-用户id',
  `operate_name` char(60) NOT NULL DEFAULT '' COMMENT '操作人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `product_id` (`product_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4412 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商城商品售价同步到产品售价日志 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_system_goods_sync_product_log`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_system_goods_sync_product_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_system_goods_sync_product_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `goods_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '1' COMMENT '计量单位数量（默认1）',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '条码',
  `weight` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量（kg）',
  `volume` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '体积（m³）',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `cost_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `operate` int unsigned NOT NULL DEFAULT '0' COMMENT '操作-用户id',
  `operate_name` char(60) NOT NULL DEFAULT '' COMMENT '操作人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `product_id` (`product_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39412 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统商品同步到产品日志 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_system_order`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_system_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_system_order` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `customer_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '客户企业id',
  `order_no` char(60) NOT NULL DEFAULT '' COMMENT '系统订单号',
  `order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '系统订单id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单用户id',
  `shop_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `express_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '快递id',
  `express_number` char(60) NOT NULL DEFAULT '' COMMENT '快递单号',
  `payment_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '支付方式id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态（0待确认, 1已确认/待支付, 2已支付/待发货, 3已发货/待收货, 4已完成, 5已取消, 6已关闭）',
  `pay_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '支付状态（0未支付, 1已支付, 2已退款, 3部分退款）',
  `extension_data` longtext COMMENT '扩展展示数据',
  `buy_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '购买商品总数量',
  `increase_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '增加的金额',
  `preferential_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单单价',
  `total_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价(订单最终价格)',
  `pay_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已支付金额',
  `refund_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_quantity` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `client_type` char(30) NOT NULL DEFAULT '' COMMENT '客户端类型（pc, h5, ios, android, alipay, weixin, baidu）取APPLICATION_CLIENT_TYPE常量值',
  `order_model` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单模式（0销售型, 1展示型, 2自提点, 3虚拟销售）',
  `is_under_line` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否线下支付（0否，1是）',
  `user_note` char(255) NOT NULL DEFAULT '' COMMENT '用户备注',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `confirm_time` int unsigned NOT NULL DEFAULT '0' COMMENT '确认时间',
  `delivery_time` int unsigned NOT NULL DEFAULT '0' COMMENT '发货时间',
  `cancel_time` int unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `collect_time` int unsigned NOT NULL DEFAULT '0' COMMENT '收货时间',
  `close_time` int unsigned NOT NULL DEFAULT '0' COMMENT '关闭时间',
  `comments_time` int unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `is_comments` int unsigned NOT NULL DEFAULT '0' COMMENT '是否已评论（0否, 大于0评论时间）',
  `user_is_comments` int unsigned NOT NULL DEFAULT '0' COMMENT '用户是否已评论（0否, 大于0评论时间）',
  `is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '是否已删除（0否, 大于0删除时间）',
  `user_is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '用户是否已删除（0否, 大于0删除时间）',
  `shop_is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺是否已删除（0否, 大于0删除时间）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `customer_id` (`customer_id`),
  KEY `order_no` (`order_no`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `shop_id` (`shop_id`) USING BTREE,
  KEY `warehouse_id` (`warehouse_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `pay_status` (`pay_status`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3280 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统订单 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_system_order_address`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_system_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_system_order_address` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `address_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '收件地址id',
  `alias` char(60) NOT NULL DEFAULT '' COMMENT '别名',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '收件人-姓名',
  `tel` char(15) NOT NULL DEFAULT '' COMMENT '收件人-电话',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-县/区',
  `address` char(200) NOT NULL DEFAULT '' COMMENT '收件人-详细地址',
  `province_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-省-名称',
  `city_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-市-名称',
  `county_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-县/区-名称',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-纬度',
  `appoint_time` char(60) NOT NULL DEFAULT '' COMMENT '指定时间',
  `extraction_contact_name` char(60) NOT NULL DEFAULT '' COMMENT '自提-联系人',
  `extraction_contact_tel` char(15) NOT NULL DEFAULT '' COMMENT '自提-联系电话',
  `idcard_name` char(60) NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `idcard_number` char(30) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `idcard_front` char(255) NOT NULL DEFAULT '' COMMENT '身份证人像面图片',
  `idcard_back` char(255) NOT NULL DEFAULT '' COMMENT '身份证国微面图片',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=516 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统订单地址 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_system_order_currency`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_system_order_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_system_order_currency` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `currency_name` char(80) NOT NULL DEFAULT '' COMMENT '货币名称',
  `currency_code` char(60) NOT NULL DEFAULT '' COMMENT '货币代码',
  `currency_symbol` char(60) NOT NULL DEFAULT '' COMMENT '货币符号',
  `currency_rate` decimal(12,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '货币汇率',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `currency_name` (`currency_name`),
  KEY `currency_code` (`currency_code`),
  KEY `currency_rate` (`currency_rate`)
) ENGINE=InnoDB AUTO_INCREMENT=3280 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统订单货币 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_system_order_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_system_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_system_order_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_detail_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单详情id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '对应产品id',
  `product_base_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '对应产品基础id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `original_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '原价',
  `price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `total_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(单价*数量)',
  `spec` text COMMENT '规格',
  `buy_number` int unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `inventory_unit` char(30) NOT NULL DEFAULT '' COMMENT '库存单位',
  `model` char(30) NOT NULL DEFAULT '' COMMENT '型号',
  `spec_weight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量（kg）',
  `spec_volume` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '体积（m³）',
  `spec_coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `spec_barcode` char(80) NOT NULL DEFAULT '' COMMENT '条形码',
  `refund_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_quantity` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `order_id` (`order_id`),
  KEY `order_detail_id` (`order_detail_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6594 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统订单详情 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_system_order_express`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_system_order_express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_system_order_express` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_express_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单快递id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `express_id` int unsigned NOT NULL DEFAULT '0' COMMENT '快递id',
  `express_number` char(60) NOT NULL DEFAULT '' COMMENT '快递单号',
  `note` char(255) NOT NULL DEFAULT '' COMMENT '备注',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `order_express_id` (`order_express_id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统订单快递 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_system_order_extraction_code`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_system_order_extraction_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_system_order_extraction_code` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '取货码',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2726 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单自提取货码关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_system_order_fictitious_value`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_system_order_fictitious_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_system_order_fictitious_value` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_detail_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单详情id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `value` text COMMENT '虚拟商品展示数据',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `order_id` (`order_id`),
  KEY `order_detail_id` (`order_detail_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统订单虚拟销售数据关联 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_system_order_service`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_system_order_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_system_order_service` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `service_name` char(80) NOT NULL DEFAULT '' COMMENT '服务人员姓名',
  `service_mobile` char(30) NOT NULL DEFAULT '' COMMENT '服务人员手机',
  `service_duration_minute` int unsigned NOT NULL DEFAULT '0' COMMENT '服务持续分钟',
  `service_start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '服务开始时间',
  `service_end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '服务结束时间',
  `note` char(255) NOT NULL DEFAULT '' COMMENT '备注',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统订单服务 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_unit`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_unit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `merchant_id` (`merchant_id`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='计量单位 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_unit_inventory_swap`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_unit_inventory_swap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_unit_inventory_swap` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `unit_inventory_swap_no` char(60) NOT NULL DEFAULT '' COMMENT '库存互换号（以IC开头）',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '互换状态（0待提交、1待审核、2待互换、3已互换、4已拒绝、5已取消）',
  `swap_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '互换产品总数量',
  `swap_user` char(30) NOT NULL DEFAULT '' COMMENT '互换人员',
  `swap_time` int unsigned DEFAULT '0' COMMENT '互换时间',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `submit_time` int unsigned DEFAULT '0' COMMENT '提审时间',
  `audit_time` int unsigned DEFAULT '0' COMMENT '审核时间',
  `success_time` int unsigned DEFAULT '0' COMMENT '完成时间',
  `cancel_time` int unsigned DEFAULT '0' COMMENT '取消时间',
  `close_time` int unsigned DEFAULT '0' COMMENT '关闭时间',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `unit_inventory_swap_no` (`unit_inventory_swap_no`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='库存互换 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_unit_inventory_swap_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_unit_inventory_swap_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_unit_inventory_swap_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `unit_inventory_swap_no` char(60) NOT NULL DEFAULT '' COMMENT '库存互换号（以IC开头）',
  `unit_inventory_swap_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '库存互换id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `out_unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '调出计量单位id',
  `enter_unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '调入计量单位id',
  `out_unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '调出计量单位数量（默认1）',
  `enter_unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '调入计量单位数量（默认1）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `spec` char(80) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '单位编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '单位条码',
  `weight` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位重量（kg）',
  `volume` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位体积（m³）',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `swap_number` int unsigned NOT NULL DEFAULT '0' COMMENT '互换数量',
  `out_position_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '调出仓位id',
  `enter_position_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '调入仓位id',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `unit_inventory_swap_no` (`unit_inventory_swap_no`),
  KEY `unit_inventory_swap_id` (`unit_inventory_swap_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `product_id` (`product_id`),
  KEY `out_unit_id` (`out_unit_id`),
  KEY `enter_unit_id` (`enter_unit_id`),
  KEY `title` (`title`),
  KEY `coding` (`coding`),
  KEY `barcode` (`barcode`),
  KEY `price` (`price`),
  KEY `swap_number` (`swap_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='库存互换详情 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_unit_inventory_swap_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_unit_inventory_swap_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_unit_inventory_swap_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `unit_inventory_swap_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '库存互换id',
  `original_status` char(10) NOT NULL DEFAULT '' COMMENT '原始状态-值',
  `original_name` char(60) NOT NULL DEFAULT '' COMMENT '原始状态-名称',
  `new_status` char(10) NOT NULL DEFAULT '' COMMENT '最新状态-值',
  `new_name` char(60) NOT NULL DEFAULT '' COMMENT '最新状态-名称',
  `msg` text COMMENT '操作描述',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `unit_inventory_swap_id` (`unit_inventory_swap_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='库存互换状态历史记录 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_warehouse`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_warehouse` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `letter` char(120) NOT NULL DEFAULT '' COMMENT '拼音首字母',
  `alias` char(30) NOT NULL DEFAULT '' COMMENT '别名',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `position_count` int unsigned NOT NULL DEFAULT '0' COMMENT '仓位总数',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '所在省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '所在市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '所在县/区',
  `address` char(160) NOT NULL DEFAULT '' COMMENT '详细地址',
  `contacts_name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `contacts_mobile` char(60) NOT NULL DEFAULT '' COMMENT '联系手机',
  `contacts_tel` char(60) NOT NULL DEFAULT '' COMMENT '联系座机',
  `contacts_email` char(60) NOT NULL DEFAULT '' COMMENT '联系邮箱',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `name` (`name`),
  KEY `letter` (`letter`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='仓库 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_warehouse_position`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_warehouse_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_warehouse_position` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=2552 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='仓库仓位 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_warehouse_product`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_warehouse_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_warehouse_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16461 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='仓库产品 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_warehouse_product_0917`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_warehouse_product_0917`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_warehouse_product_0917` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10329 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='仓库产品 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_warehouse_product_inventory`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_warehouse_product_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_warehouse_product_inventory` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `warehouse_product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库产品id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '计量单位数量（默认1）',
  `inventory` bigint unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `warehouse_product_id` (`warehouse_product_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `inventory` (`inventory`)
) ENGINE=InnoDB AUTO_INCREMENT=16602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='仓库产品库存 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_warehouse_product_inventory_0102`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_warehouse_product_inventory_0102`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_warehouse_product_inventory_0102` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `warehouse_product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库产品id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '计量单位数量（默认1）',
  `inventory` bigint unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `warehouse_product_id` (`warehouse_product_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `inventory` (`inventory`)
) ENGINE=InnoDB AUTO_INCREMENT=16536 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='仓库产品库存 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_warehouse_product_inventory_0917`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_warehouse_product_inventory_0917`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_warehouse_product_inventory_0917` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `warehouse_product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库产品id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '计量单位数量（默认1）',
  `inventory` bigint unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `warehouse_product_id` (`warehouse_product_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `inventory` (`inventory`)
) ENGINE=InnoDB AUTO_INCREMENT=10396 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='仓库产品库存 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_warehouse_product_inventory_0917最终备份`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_warehouse_product_inventory_0917最终备份`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_warehouse_product_inventory_0917最终备份` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `warehouse_product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库产品id',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '计量单位数量（默认1）',
  `inventory` bigint unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `warehouse_product_id` (`warehouse_product_id`),
  KEY `product_id` (`product_id`),
  KEY `unit_id` (`unit_id`),
  KEY `inventory` (`inventory`)
) ENGINE=InnoDB AUTO_INCREMENT=10396 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='仓库产品库存 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_erp_warehouse_product_inventory_log`
--

DROP TABLE IF EXISTS `sxo_plugins_erp_warehouse_product_inventory_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_erp_warehouse_product_inventory_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `merchant_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `opt_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '操作类型（0扣减、1增加、2盘点、3同步）',
  `business_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '业务订单id',
  `business_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '业务类型（0系统、1采购单、2销售单、3仓库其他入库单、4仓库其他出库单、5仓库库存盘点、6仓库库存调拨、7销售发货单退货、8商城同步到进销存、9进销存同步到商城）',
  `product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `warehouse_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `position_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓位id',
  `warehouse_product_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库产品id',
  `warehouse_product_inventory_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '仓库产品库存id',
  `unit_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '计量单位id',
  `unit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '计量单位数量（默认1）',
  `inventory` bigint unsigned NOT NULL DEFAULT '0' COMMENT '操作库存',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `merchant_id` (`merchant_id`),
  KEY `opt_type` (`opt_type`),
  KEY `business_id` (`business_id`),
  KEY `business_type` (`business_type`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `position_id` (`position_id`),
  KEY `warehouse_product_id` (`warehouse_product_id`),
  KEY `warehouse_product_inventory_id` (`warehouse_product_inventory_id`),
  KEY `unit_id` (`unit_id`),
  KEY `inventory` (`inventory`)
) ENGINE=InnoDB AUTO_INCREMENT=47930 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='仓库产品库存日志 - 进销存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_excellentbuyreturntocash_coupon_log`
--

DROP TABLE IF EXISTS `sxo_plugins_excellentbuyreturntocash_coupon_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_excellentbuyreturntocash_coupon_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_coupon_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户优惠券id',
  `coupon_id` int unsigned NOT NULL DEFAULT '0' COMMENT '优惠券id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int unsigned NOT NULL COMMENT '订单id',
  `order_detail_id` int unsigned NOT NULL COMMENT '订单详情id',
  `goods_id` int unsigned NOT NULL COMMENT '商品id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0已发放, 1已退回）',
  `return_time` int unsigned NOT NULL DEFAULT '0' COMMENT '退回时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `order_detail_id` (`order_detail_id`),
  KEY `goods_id` (`goods_id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `user_coupon_id` (`user_coupon_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='优购返现优惠券发放记录 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_excellentbuyreturntocash_return_cash_order`
--

DROP TABLE IF EXISTS `sxo_plugins_excellentbuyreturntocash_return_cash_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_excellentbuyreturntocash_return_cash_order` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int unsigned NOT NULL COMMENT '订单id',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `valid_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '有效金额',
  `profit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '返现金额',
  `rate` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '返现比例 0~100 的数字（创建时写入，防止发生退款重新计算）',
  `category_ids` longtext COMMENT '分类id（json 存储）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '结算状态（0待生效, 1生效中, 2待结算, 3已结算, 4已失效）',
  `log` longtext COMMENT '日志',
  `success_time` int unsigned NOT NULL DEFAULT '0' COMMENT '完成结算时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='优购返现返现订单 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_exchangerate_currency`
--

DROP TABLE IF EXISTS `sxo_plugins_exchangerate_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_exchangerate_currency` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '名称',
  `code` char(60) NOT NULL DEFAULT '' COMMENT '代码',
  `symbol` char(60) NOT NULL DEFAULT '' COMMENT '符号',
  `rate` decimal(12,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '汇率',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `is_default` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否默认（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `code` (`code`),
  KEY `rate` (`rate`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='汇率货币配置 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_express_log`
--

DROP TABLE IF EXISTS `sxo_plugins_express_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_express_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `express_type` char(60) NOT NULL DEFAULT '' COMMENT '快递类型',
  `express_name` char(60) NOT NULL DEFAULT '' COMMENT '快递名称',
  `express_number` char(60) NOT NULL DEFAULT '' COMMENT '快递单号',
  `express_code` char(30) NOT NULL DEFAULT '' COMMENT '快递编码',
  `request_params` mediumtext COMMENT '请求参数（数组则json字符串存储）',
  `response_data` mediumtext COMMENT '响应参数（数组则json字符串存储）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `express_type` (`express_type`),
  KEY `express_name` (`express_name`),
  KEY `number_code` (`express_number`,`express_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='物流请求日志 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_expressfacial_accounts`
--

DROP TABLE IF EXISTS `sxo_plugins_expressfacial_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_expressfacial_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `account` char(60) NOT NULL DEFAULT '' COMMENT '账户',
  `password` char(60) NOT NULL DEFAULT '' COMMENT '默认密码',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='账户信息 - 快递电子面单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_expressfacial_connect`
--

DROP TABLE IF EXISTS `sxo_plugins_expressfacial_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_expressfacial_connect` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `platform` char(60) NOT NULL DEFAULT '' COMMENT '平台类型（快递100:kuaidi10, 更多）',
  `access_token` char(255) NOT NULL DEFAULT '' COMMENT '授权秘钥',
  `refresh_token` char(255) NOT NULL DEFAULT '' COMMENT '刷新秘钥',
  `expires_time` int unsigned NOT NULL DEFAULT '0' COMMENT '有效时间',
  `openid` char(80) NOT NULL DEFAULT '' COMMENT '授权用户openid',
  `refresh_count` int unsigned NOT NULL DEFAULT '0' COMMENT '刷新次数',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `platform` (`platform`),
  KEY `access_token` (`access_token`),
  KEY `expires_time` (`expires_time`),
  KEY `openid` (`openid`),
  KEY `refresh_count` (`refresh_count`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='连接信息 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_expressfacial_order_push`
--

DROP TABLE IF EXISTS `sxo_plugins_expressfacial_order_push`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_expressfacial_order_push` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_no` char(60) NOT NULL DEFAULT '' COMMENT '订单号',
  `platform` char(60) NOT NULL DEFAULT '' COMMENT '平台类型（快递100:kuaidi10, 更多）',
  `push_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '推送状态（0未推送, 1已推送, 2推送失败, 3修改失败, 4已关闭）',
  `receive_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '打单状态（0未打单, 1已打单, 2打单失败）',
  `request_reason` char(230) NOT NULL DEFAULT '' COMMENT '请求失败原因',
  `receive_reason` char(230) NOT NULL DEFAULT '' COMMENT '打单失败原因',
  `push_count` int unsigned NOT NULL DEFAULT '0' COMMENT '推送次数',
  `express_id` int unsigned NOT NULL DEFAULT '0' COMMENT '快递id',
  `express_name` char(60) NOT NULL DEFAULT '' COMMENT '快递名称',
  `express_number` char(60) NOT NULL DEFAULT '' COMMENT '快递单号',
  `request_params` mediumtext COMMENT '请求参数（数组则json字符串存储）',
  `response_data` mediumtext COMMENT '响应参数（数组则json字符串存储）',
  `receive_data` mediumtext COMMENT '打单参数（数组则json字符串存储）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `order_no` (`order_no`),
  KEY `platform` (`platform`),
  KEY `push_status` (`push_status`),
  KEY `receive_status` (`receive_status`),
  KEY `push_count` (`push_count`),
  KEY `express_id` (`express_id`),
  KEY `express_name` (`express_name`),
  KEY `express_number` (`express_number`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单推送 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_fccprouniapp_ad`
--

DROP TABLE IF EXISTS `sxo_plugins_fccprouniapp_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_fccprouniapp_ad` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` int unsigned NOT NULL DEFAULT '0' COMMENT '魔方类型',
  `apply_terminal` varchar(255) NOT NULL DEFAULT '' COMMENT '适配终端',
  `multilingual` varchar(255) NOT NULL DEFAULT '' COMMENT '对应多语言',
  `content` text COMMENT '魔方图片及链接集合',
  `position` int unsigned NOT NULL DEFAULT '0' COMMENT '魔方位置',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `is_ad_flag` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否展示广告字样',
  `left_and_right` int unsigned NOT NULL DEFAULT '0' COMMENT '魔方距离两边的距离，单位750宽度稿下的像素',
  `top` int unsigned NOT NULL DEFAULT '0' COMMENT '上边距',
  `bottom` int unsigned NOT NULL DEFAULT '0' COMMENT '下边距',
  `xu` int unsigned NOT NULL DEFAULT '0',
  `banner_type` varchar(100) NOT NULL DEFAULT 'default' COMMENT '幻灯组有效，设置幻灯大小的',
  `start_time` int unsigned NOT NULL DEFAULT '0',
  `end_time` int unsigned NOT NULL DEFAULT '0',
  `add_time` int unsigned NOT NULL DEFAULT '0',
  `upd_time` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='活动配置轮播图片 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_fccprouniapp_base`
--

DROP TABLE IF EXISTS `sxo_plugins_fccprouniapp_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_fccprouniapp_base` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `num` int unsigned NOT NULL DEFAULT '0',
  `shop_id` int unsigned NOT NULL DEFAULT '0',
  `add_time` int unsigned NOT NULL DEFAULT '0',
  `upd_time` int unsigned NOT NULL DEFAULT '0',
  `authtoken` varchar(60) NOT NULL DEFAULT '' COMMENT '授权码',
  `end_time` int unsigned NOT NULL DEFAULT '0',
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='基础配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_fccprouniapp_slider`
--

DROP TABLE IF EXISTS `sxo_plugins_fccprouniapp_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_fccprouniapp_slider` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `classid` int unsigned NOT NULL DEFAULT '0' COMMENT '类型ID',
  `platform` char(255) NOT NULL DEFAULT '' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序）',
  `event_type` tinyint NOT NULL DEFAULT '-1' COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` char(255) NOT NULL DEFAULT '' COMMENT '事件值',
  `images_url` char(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `bg_color` char(30) NOT NULL DEFAULT '' COMMENT 'css背景色值',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`),
  KEY `platform` (`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='活动配置轮播图片 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_fccprouniapp_userlevel`
--

DROP TABLE IF EXISTS `sxo_plugins_fccprouniapp_userlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_fccprouniapp_userlevel` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` int NOT NULL DEFAULT '0' COMMENT '对应会员等级ID',
  `vip_images_url` varchar(255) NOT NULL DEFAULT '' COMMENT '会员卡片背景图片',
  `vip_bg_color` varchar(10) NOT NULL DEFAULT '' COMMENT '会员卡片背景颜色',
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `size_bg_color` varchar(10) NOT NULL DEFAULT '' COMMENT '等级字体颜色',
  `add_time` int unsigned NOT NULL DEFAULT '0',
  `upd_time` int unsigned NOT NULL DEFAULT '0',
  `vipbtn_bg_color` varchar(10) NOT NULL DEFAULT '' COMMENT '开通会员按钮背景颜色',
  `vipbtn_font_color` varchar(10) NOT NULL DEFAULT '' COMMENT '开通会员按钮文字颜色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='会员等级增强配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_fccprouniapp_zhibao`
--

DROP TABLE IF EXISTS `sxo_plugins_fccprouniapp_zhibao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_fccprouniapp_zhibao` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `images_url` varchar(255) NOT NULL DEFAULT '',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0',
  `sertype` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '服务类型',
  `sort` int unsigned NOT NULL DEFAULT '0',
  `add_time` int unsigned NOT NULL DEFAULT '0',
  `upd_time` int unsigned NOT NULL DEFAULT '0',
  `operation_time` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='质保列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_fccprouniapp_zhibao_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_fccprouniapp_zhibao_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_fccprouniapp_zhibao_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` int unsigned NOT NULL DEFAULT '0' COMMENT '质保id',
  `goods_id` int unsigned NOT NULL DEFAULT '0',
  `add_time` int unsigned NOT NULL DEFAULT '0',
  `upd_time` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='基础配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_feieyun_printer_log`
--

DROP TABLE IF EXISTS `sxo_plugins_feieyun_printer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_feieyun_printer_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_no` char(60) NOT NULL DEFAULT '' COMMENT '订单号',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待打印, 1已打印, 2打印失败）',
  `printer_sn` char(200) NOT NULL DEFAULT '' COMMENT '打印机编号',
  `request_params` mediumtext COMMENT '请求参数（数组则json字符串存储）',
  `response_data` mediumtext COMMENT '响应参数（数组则json字符串存储）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `order_no` (`order_no`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `printer_sn` (`printer_sn`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='飞鹅打印 - 打印机日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_fictitioussecretkey_api_log`
--

DROP TABLE IF EXISTS `sxo_plugins_fictitioussecretkey_api_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_fictitioussecretkey_api_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_no` char(60) NOT NULL DEFAULT '' COMMENT '订单号',
  `data_count` int unsigned NOT NULL DEFAULT '0' COMMENT '数据总数',
  `success_count` int unsigned NOT NULL DEFAULT '0' COMMENT '处理成功总数',
  `request_params` mediumtext COMMENT '请求参数（数组则json字符串存储）',
  `response_data` mediumtext COMMENT '响应参数（数组则json字符串存储）',
  `handle_data` text COMMENT '处理数据（json存储）',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `order_no` (`order_no`),
  KEY `tsc` (`tsc`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='api日志 - 虚拟密钥自动化';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_fictitioussecretkey_goods_secretkey`
--

DROP TABLE IF EXISTS `sxo_plugins_fictitioussecretkey_goods_secretkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_fictitioussecretkey_goods_secretkey` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '所属商品id',
  `md5_key` char(32) NOT NULL DEFAULT '' COMMENT 'md5key值（空则无规格）',
  `spec` text COMMENT '规格值',
  `secretkey_data` text COMMENT '密钥数据',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未使用, 1已使用）',
  `use_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '使用订单id',
  `use_order_no` char(60) NOT NULL DEFAULT '' COMMENT '使用订单号',
  `use_time` int unsigned NOT NULL DEFAULT '0' COMMENT '使用时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `md5_key` (`md5_key`),
  KEY `status` (`status`),
  KEY `use_order_id` (`use_order_id`),
  KEY `use_order_no` (`use_order_no`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品密钥 - 虚拟密钥自动化';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_freightfee_template`
--

DROP TABLE IF EXISTS `sxo_plugins_freightfee_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_freightfee_template` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `warehouse_id` int unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `show_name` char(60) NOT NULL DEFAULT '' COMMENT '展示名称',
  `order_model` char(30) NOT NULL DEFAULT '' COMMENT '支持的订单模式（json存储）',
  `payment` text COMMENT '免运费支付方式（英文逗号分割存储）',
  `goods_ids` text COMMENT '免运费商品（英文逗号分割存储）',
  `goods_category_append` text COMMENT '商品分类额外追加的运费（json存储）',
  `valuation` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '计价方式（0按件数, 1按重量）',
  `is_insufficient_first_price` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '首(件/重)不满足按首费计算(默认0, 0否, 1是)',
  `is_continue_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '续费计算方式(默认0, 0四舍五入取整, 1向上取整（有小数就加1）, 2向下取整（有小数就忽略、直接取整）)',
  `data` text COMMENT '运费模板规则(json存储)',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='运费设置 - 仓库运费模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_giftcard_card`
--

DROP TABLE IF EXISTS `sxo_plugins_giftcard_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_giftcard_card` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `data_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '数据类型（0钱包充值, 1优惠券兑换）',
  `generate_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '生成类型（0纯数字, 1数字加字母）',
  `prefix` char(60) NOT NULL DEFAULT '' COMMENT '礼品卡前缀',
  `secret_value` char(230) NOT NULL DEFAULT '' COMMENT '卡密数据',
  `card_count` int unsigned NOT NULL DEFAULT '0' COMMENT '卡总数',
  `card_exchange_count` int unsigned NOT NULL DEFAULT '0' COMMENT '卡兑换总数',
  `batch_data` text COMMENT '批次数据（json存储）',
  `note` char(255) NOT NULL DEFAULT '' COMMENT '备注信息',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否, 1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `category_id` (`category_id`),
  KEY `data_type` (`data_type`),
  KEY `secret_value` (`secret_value`),
  KEY `card_count` (`card_count`),
  KEY `card_exchange_count` (`card_exchange_count`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='礼品卡 - 礼品卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_giftcard_card_category`
--

DROP TABLE IF EXISTS `sxo_plugins_giftcard_card_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_giftcard_card_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='礼品卡分类 - 礼品卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_giftcard_card_secret`
--

DROP TABLE IF EXISTS `sxo_plugins_giftcard_card_secret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_giftcard_card_secret` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `card_id` int unsigned NOT NULL DEFAULT '0' COMMENT '礼品卡id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `batch_id` char(60) NOT NULL DEFAULT '' COMMENT '生成批次id',
  `data_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '数据类型（0钱包充值, 1优惠券兑换）',
  `secret_key` char(60) NOT NULL DEFAULT '' COMMENT '卡密key',
  `secret_value` char(255) NOT NULL DEFAULT '' COMMENT '卡密数据',
  `use_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '使用状态（0未使用, 1已使用）',
  `use_data` text COMMENT '使用数据（json存储）',
  `is_exchange` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否兑换（0否, 1是）',
  `exchange_time` int unsigned NOT NULL DEFAULT '0' COMMENT '兑换时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `card_id` (`card_id`),
  KEY `user_id` (`user_id`),
  KEY `data_type` (`data_type`),
  KEY `secret_key` (`secret_key`),
  KEY `secret_value` (`secret_value`),
  KEY `is_exchange` (`is_exchange`),
  KEY `exchange_time` (`exchange_time`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='礼品卡密 - 礼品卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_giftcard_card_secret_log`
--

DROP TABLE IF EXISTS `sxo_plugins_giftcard_card_secret_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_giftcard_card_secret_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `card_id` int unsigned NOT NULL DEFAULT '0' COMMENT '礼品卡id',
  `card_secret_id` int unsigned NOT NULL DEFAULT '0' COMMENT '礼品卡密id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `client_ip` char(200) NOT NULL DEFAULT '' COMMENT '客户端ip',
  `os` char(20) NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` char(20) NOT NULL DEFAULT '' COMMENT '浏览器',
  `client` text COMMENT '客户端详情信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `card_id` (`card_id`),
  KEY `card_secret_id` (`card_secret_id`),
  KEY `user_id` (`user_id`),
  KEY `client_ip` (`client_ip`),
  KEY `os` (`os`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='礼品卡日志 - 礼品卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_givegift_order`
--

DROP TABLE IF EXISTS `sxo_plugins_givegift_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_givegift_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_no` char(60) NOT NULL DEFAULT '' COMMENT '订单号',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待支付, 1已支付, 2已取消）',
  `data_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '数据类型（0全部商品, 1指定商品分类, 2指定品牌, 3指定商品）',
  `key` char(32) NOT NULL DEFAULT '' COMMENT '唯一key',
  `is_no_limit_receive` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '不限制领取（0否, 1是）',
  `message_tips` char(255) NOT NULL DEFAULT '' COMMENT '留言提示',
  `data_ids` char(255) NOT NULL DEFAULT '' COMMENT '数据id（json存储）',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '购买商品id',
  `buy_number` int unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '购买单价（单位 元）',
  `total_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '购买总额（单位 元）',
  `use_number` int unsigned NOT NULL DEFAULT '0' COMMENT '使用数量',
  `pay_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `payment_id` int unsigned NOT NULL DEFAULT '0' COMMENT '支付方式id',
  `payment` char(60) NOT NULL DEFAULT '' COMMENT '支付方式标记',
  `payment_name` char(60) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `cancel_time` int unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_no` (`order_no`),
  KEY `status` (`status`),
  KEY `key` (`key`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='送礼订单 - 送礼';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_givegift_order_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_givegift_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_givegift_order_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `gift_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '赠送订单id',
  `gift_order_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '赠送订单用户id',
  `use_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '使用订单id',
  `use_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '使用用户id',
  `code` char(32) NOT NULL DEFAULT '' COMMENT '密钥code',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待使用, 1已使用, 2已取消）',
  `user_message` char(255) NOT NULL DEFAULT '' COMMENT '用户留言',
  `use_time` int unsigned NOT NULL DEFAULT '0' COMMENT '使用时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `gift_order_id` (`gift_order_id`),
  KEY `gift_order_user_id` (`gift_order_user_id`),
  KEY `use_order_id` (`use_order_id`),
  KEY `use_user_id` (`use_user_id`),
  KEY `code` (`code`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='送礼订单详情 - 送礼';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_goodscompare_record`
--

DROP TABLE IF EXISTS `sxo_plugins_goodscompare_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_goodscompare_record` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` char(60) NOT NULL DEFAULT '' COMMENT 'uid',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_ids` text COMMENT '对比商品id（json存储）',
  `ip` char(200) NOT NULL DEFAULT '' COMMENT 'ip',
  `count` int unsigned NOT NULL DEFAULT '0' COMMENT '对比次数',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `user_id` (`user_id`),
  KEY `ip` (`ip`),
  KEY `count` (`count`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='对比记录 - 商品对比';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_goodsrebuild_data`
--

DROP TABLE IF EXISTS `sxo_plugins_goodsrebuild_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_goodsrebuild_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `main_goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '主商品id',
  `vice_goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '关联商品id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `main_goods_id` (`main_goods_id`),
  KEY `vice_goods_id` (`vice_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品重组 - 关联数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_goodsservice_service_config`
--

DROP TABLE IF EXISTS `sxo_plugins_goodsservice_service_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_goodsservice_service_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '简介',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `sort` int unsigned NOT NULL DEFAULT '0' COMMENT '顺序（从小到大）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `sort` (`sort`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='服务配置 - 商品服务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_goodsservice_service_config_category`
--

DROP TABLE IF EXISTS `sxo_plugins_goodsservice_service_config_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_goodsservice_service_config_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `service_config_id` int unsigned NOT NULL DEFAULT '0' COMMENT '服务配置',
  `goods_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `service_config_id` (`service_config_id`),
  KEY `goods_category_id` (`goods_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='服务配置关联商品分类 - 商品服务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_goodsservice_service_config_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_goodsservice_service_config_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_goodsservice_service_config_goods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `service_config_id` int unsigned NOT NULL DEFAULT '0' COMMENT '服务配置',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `service_config_id` (`service_config_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='服务配置商品 - 商品服务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_base`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_base` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `num` int unsigned NOT NULL DEFAULT '0',
  `shop_id` int unsigned NOT NULL DEFAULT '0',
  `add_time` int unsigned NOT NULL DEFAULT '0',
  `upd_time` int unsigned NOT NULL DEFAULT '0',
  `authtoken` varchar(60) NOT NULL DEFAULT '' COMMENT '授权码',
  `end_time` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='基础配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_give_integral_log`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_give_integral_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_give_integral_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_detail_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单详情id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品详情id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待处理, 1待释放, 2已释放）',
  `rate` int unsigned NOT NULL DEFAULT '0' COMMENT '赠送比例',
  `integral` int NOT NULL DEFAULT '0' COMMENT '积分',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `order_detail_id` (`order_detail_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `rate` (`rate`) USING BTREE,
  KEY `integral` (`integral`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品积分赠送日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `grouptitle` varchar(255) NOT NULL COMMENT '拼团标题，可能与主商品不一样，因为获取后可修改',
  `groups_simple_desc` text NOT NULL,
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `category_id` int unsigned NOT NULL DEFAULT '0',
  `images` char(255) NOT NULL,
  `groups_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `original_price` char(60) NOT NULL COMMENT '原价，展示用',
  `min_original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低原价',
  `max_original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最大原价',
  `price` char(60) NOT NULL COMMENT '销售价，用于展示',
  `min_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低价格',
  `max_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最高价格',
  `buy_min_number` int unsigned NOT NULL DEFAULT '1' COMMENT '最低起购数量 （默认1）',
  `buy_max_number` int unsigned NOT NULL DEFAULT '0' COMMENT '一次最大购买数量',
  `buy_max_limit` int unsigned NOT NULL DEFAULT '0' COMMENT '最大购买次数0为不限',
  `is_shelves` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否上架（下架后用户不可见, 0否, 1是）',
  `is_home_recommended` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否首页推荐（0否, 1是）',
  `sales_count` int unsigned NOT NULL DEFAULT '0' COMMENT '销量，拼团单独计数，如果单独购买则计数到原商品中',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `is_ladder` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否阶梯团',
  `ladder` text NOT NULL COMMENT '阶梯团具体数据',
  `is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '主商品删除，这里也删除，是否已删除（0 未删除, 大于0则是删除时间）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_single_buy` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否单独购买，1为是，0为否',
  `num` int unsigned NOT NULL DEFAULT '0' COMMENT '几人团',
  `groupsnum` int unsigned NOT NULL DEFAULT '0' COMMENT '已成团数',
  `sort` int unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `groupshour` int unsigned NOT NULL DEFAULT '0' COMMENT '组团限时',
  `yunfee` decimal(10,2) NOT NULL COMMENT '运费',
  `scorecut` decimal(10,2) NOT NULL COMMENT '积分抵扣，0为不抵扣',
  `leadercut_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '团长优惠，0为不优惠金额',
  `leadercut_per` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '优惠折扣，百分比',
  `is_leadercut` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否显示团长优惠，0无折扣不显示，1有折扣不显示，2显示，有直减优惠，3显示，有百分比折扣有',
  `is_sku` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否多规格',
  `fictitious_goods_value` text,
  `is_deduction_inventory` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否扣减库存，0不减1减',
  `allow_num` int unsigned NOT NULL DEFAULT '0' COMMENT '最大开团数',
  `wanfa` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '玩法1传统2拼中',
  `isauto` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否机器人成团',
  `get_goods_num` int unsigned NOT NULL DEFAULT '0' COMMENT '几人拼中商品',
  `get_style` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '拼中方式',
  `buchang_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '补偿方式',
  `buchang_value` varchar(255) NOT NULL DEFAULT '0' COMMENT '补偿对应的物品ID值',
  `buchang_text` varchar(255) NOT NULL DEFAULT '' COMMENT '补偿的东西对应的文字说明',
  `is_handget` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '红包是否手动领取0否1是',
  `hongbao_long` int unsigned NOT NULL DEFAULT '0' COMMENT '红包领取时效',
  `is_waitchose` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否等待指定',
  `is_backmoney` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '未拼中者是否退款',
  `guize` text,
  `shop_id` int unsigned NOT NULL DEFAULT '0',
  `back_score` int unsigned NOT NULL DEFAULT '0' COMMENT '拼团成功者赠送积分',
  PRIMARY KEY (`id`),
  KEY `access_count` (`access_count`),
  KEY `is_shelves` (`is_shelves`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_goods_browse`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_goods_browse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_goods_browse` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户商品浏览';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_goods_category`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_goods_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `shop_id` int unsigned NOT NULL DEFAULT '0',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `vice_name` char(80) NOT NULL DEFAULT '' COMMENT '副标题',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `big_images` char(255) NOT NULL DEFAULT '' COMMENT '大图片',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='商品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_goods_category_join`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_goods_category_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_goods_category_join` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品分类关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_goods_comments`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_goods_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_goods_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '业务订单id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `business_type` char(30) NOT NULL DEFAULT '' COMMENT '业务类型名称（如订单 order）',
  `content` char(255) NOT NULL DEFAULT '' COMMENT '评价内容',
  `images` text COMMENT '图片数据（一维数组json）',
  `reply` char(255) NOT NULL DEFAULT '' COMMENT '回复内容',
  `rating` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '评价级别（默认0 1~5）',
  `is_show` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否显示（0否, 1是）',
  `is_anonymous` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否匿名（0否，1是）',
  `is_reply` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否回复（0否，1是）',
  `reply_time` int unsigned NOT NULL DEFAULT '0' COMMENT '回复时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_goods_content_app`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_goods_content_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_goods_content_app` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '图片',
  `content` text COMMENT '内容',
  `sort` tinyint unsigned DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品手机详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_goods_favor`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_goods_favor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_goods_favor` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户商品收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_goods_photo`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_goods_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_goods_photo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '图片',
  `is_show` tinyint unsigned DEFAULT '1' COMMENT '是否显示（0否, 1是）',
  `sort` tinyint unsigned DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `is_show` (`is_show`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品相册图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_goods_spec_base`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_goods_spec_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_goods_spec_base` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '销售价格',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `weight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量（kg） ',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '条形码',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `extends` longtext COMMENT '扩展数据(json格式存储)',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `attribute_type_id` (`price`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='商品规格基础';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_goods_spec_type`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_goods_spec_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_goods_spec_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `value` text NOT NULL COMMENT '类型值（json字符串存储）',
  `name` char(230) NOT NULL DEFAULT '' COMMENT '类型名称',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='商品规格类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_goods_spec_value`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_goods_spec_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_goods_spec_value` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_spec_base_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品规格基础id',
  `value` char(230) NOT NULL DEFAULT '' COMMENT '规格值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `goods_spec_base_id` (`goods_spec_base_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='商品规格值';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_order`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_no` char(60) NOT NULL DEFAULT '' COMMENT '订单号',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `shop_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺用户id',
  `warehouse_id` int unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `user_note` char(255) NOT NULL DEFAULT '' COMMENT '用户备注',
  `express_id` int unsigned NOT NULL DEFAULT '0' COMMENT '快递id',
  `express_number` char(60) NOT NULL DEFAULT '' COMMENT '快递单号',
  `payment_id` int unsigned NOT NULL DEFAULT '0' COMMENT '支付方式id',
  `system_type` varchar(60) NOT NULL DEFAULT 'default' COMMENT '系统类型（默认 default, 其他按照SYSTEM_TYPE常量类型）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态（0待确认, 1已确认/待支付, 2已支付/待发货, 3已发货/待收货, 4已完成, 5已取消, 6已关闭）',
  `pay_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '支付状态（0未支付, 1已支付, 2已退款, 3部分退款）',
  `extension_data` longtext COMMENT '扩展展示数据',
  `buy_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '购买商品总数量',
  `increase_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '增加的金额',
  `preferential_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单单价',
  `total_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价(订单最终价格)',
  `pay_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已支付金额',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_quantity` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `client_type` char(30) NOT NULL DEFAULT '' COMMENT '客户端类型（pc, h5, ios, android, alipay, weixin, baidu）取APPLICATION_CLIENT_TYPE常量值',
  `order_model` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单模式（0销售型, 1展示型, 2自提点, 3虚拟销售）',
  `is_under_line` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否线下支付（0否，1是）',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `confirm_time` int unsigned NOT NULL DEFAULT '0' COMMENT '确认时间',
  `delivery_time` int unsigned NOT NULL DEFAULT '0' COMMENT '发货时间',
  `cancel_time` int unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `collect_time` int unsigned NOT NULL DEFAULT '0' COMMENT '收货时间',
  `close_time` int unsigned NOT NULL DEFAULT '0' COMMENT '关闭时间',
  `comments_time` int unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `is_comments` int unsigned NOT NULL DEFAULT '0' COMMENT '商家是否已评论（0否, 大于0评论时间）',
  `user_is_comments` int unsigned NOT NULL DEFAULT '0' COMMENT '用户是否已评论（0否, 大于0评论时间）',
  `is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '商家是否已删除（0否, 大于0删除时间）',
  `user_is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '用户是否已删除（0否, 大于0删除时间）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `buy_style` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0：拼团价，1：单购',
  `teamid` int unsigned NOT NULL DEFAULT '0' COMMENT '团ID',
  `is_team` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否成团，0进行中1：成团；2：失败；',
  `is_head` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否团长1是0不是',
  `is_auto` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否是机器人1是0不是',
  `auto_name` varchar(255) DEFAULT '' COMMENT '机器人名称',
  `auto_avatar` varchar(255) DEFAULT '' COMMENT '机器人头像地址',
  `bank_id` int unsigned NOT NULL DEFAULT '0' COMMENT '银行卡ID',
  `whoget` text COMMENT '拼中人员id集合',
  `hongbao` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应领取的红包金额',
  `hongbao_long` int unsigned NOT NULL DEFAULT '0' COMMENT '领取红包金额失效，小时',
  `hongbao_add` int unsigned NOT NULL DEFAULT '0' COMMENT '红包领取开始计时时间',
  `buchang_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '补偿类型',
  `buchang_time` int NOT NULL DEFAULT '0' COMMENT '领取时间，大于0为领过，-1表示失效',
  `buchang_get` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否已进行补偿0未到位，1补偿已到位',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `goods_info` text COMMENT '拼团商品信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  KEY `pay_status` (`pay_status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_order_address`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_order_address` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `address_id` int unsigned NOT NULL DEFAULT '0' COMMENT '收件地址id',
  `alias` char(60) NOT NULL DEFAULT '' COMMENT '别名',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '收件人-姓名',
  `tel` char(15) NOT NULL DEFAULT '' COMMENT '收件人-电话',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-县/区',
  `address` char(200) NOT NULL DEFAULT '' COMMENT '收件人-详细地址',
  `province_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-省-名称',
  `city_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-市-名称',
  `county_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-县/区-名称',
  `lng` decimal(13,10) unsigned NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-经度',
  `lat` decimal(13,10) unsigned NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-维度',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='订单地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_order_aftersale`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_order_aftersale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_order_aftersale` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_no` char(60) NOT NULL DEFAULT '' COMMENT '订单号',
  `order_detail_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单详情id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `system_type` varchar(60) NOT NULL DEFAULT 'default' COMMENT '系统类型',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待确认, 1待退货, 2待审核, 3已完成, 4已拒绝, 5已取消）',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '业务类型（0仅退款, 1退货退款）',
  `refundment` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '退款类型（0原路退回, 1退至钱包, 2手动处理）',
  `reason` char(180) NOT NULL DEFAULT '' COMMENT '申请原因',
  `number` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `msg` char(230) NOT NULL DEFAULT '' COMMENT '退款说明',
  `images` text COMMENT '凭证图片（一维数组json存储）',
  `refuse_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝原因',
  `express_name` char(60) NOT NULL DEFAULT '' COMMENT '快递名称',
  `express_number` char(60) NOT NULL DEFAULT '' COMMENT '快递单号',
  `apply_time` int unsigned NOT NULL DEFAULT '0' COMMENT '申请时间',
  `confirm_time` int unsigned NOT NULL DEFAULT '0' COMMENT '确认时间',
  `delivery_time` int unsigned NOT NULL DEFAULT '0' COMMENT '退货时间',
  `audit_time` int unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `cancel_time` int unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='订单售后';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_order_currency`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_order_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_order_currency` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `currency_name` char(80) NOT NULL DEFAULT '' COMMENT '货币名称',
  `currency_code` char(60) NOT NULL DEFAULT '' COMMENT '货币代码',
  `currency_symbol` char(60) NOT NULL DEFAULT '' COMMENT '货币符号',
  `currency_rate` decimal(7,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '货币汇率',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `currency_name` (`currency_name`) USING BTREE,
  KEY `currency_code` (`currency_code`) USING BTREE,
  KEY `currency_rate` (`currency_rate`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单货币';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_order_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_order_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `title` char(255) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '原价',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单价格',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(单价*数量)',
  `spec` text NOT NULL COMMENT '规格',
  `buy_number` int unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `model` char(30) NOT NULL DEFAULT '' COMMENT '型号',
  `spec_weight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量（kg）',
  `spec_coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `spec_barcode` char(80) NOT NULL DEFAULT '' COMMENT '条形码',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_quantity` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `groupsnum` int unsigned NOT NULL DEFAULT '0' COMMENT '几人团',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='订单详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_order_extraction_code`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_order_extraction_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_order_extraction_code` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '取货码',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='订单自提取货码关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_order_fictitious_value`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_order_fictitious_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_order_fictitious_value` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_detail_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单详情id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `value` text COMMENT '虚拟商品展示数据',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `order_detail_id` (`order_detail_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单虚拟销售数据关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_order_goods_inventory_log`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_order_goods_inventory_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_order_goods_inventory_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_detail_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单详情id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `order_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态（0待确认, 1已确认/待支付, 2已支付/待发货, 3已发货/待收货, 4已完成, 5已取消, 6已关闭）',
  `original_inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '原库存',
  `new_inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '最新库存',
  `is_rollback` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否回滚（0否, 1是）',
  `rollback_time` int unsigned NOT NULL DEFAULT '0' COMMENT '回滚时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`),
  KEY `order_status` (`order_status`),
  KEY `order_detail_id` (`order_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='订单商品库存变更日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_order_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_order_status_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `original_status` varchar(60) NOT NULL DEFAULT '' COMMENT '原始状态',
  `new_status` varchar(60) NOT NULL DEFAULT '' COMMENT '最新状态',
  `msg` varchar(255) NOT NULL DEFAULT '' COMMENT '操作描述',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` varchar(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='订单状态历史纪录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_groups_slide`
--

DROP TABLE IF EXISTS `sxo_plugins_groups_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_groups_slide` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform` char(255) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序）',
  `event_type` tinyint NOT NULL DEFAULT '-1' COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` char(255) NOT NULL DEFAULT '' COMMENT '事件值',
  `images_url` char(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '别名',
  `describe` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `bg_color` char(30) NOT NULL DEFAULT '' COMMENT 'css背景色值',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `shop_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='轮播图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_intellectstools_comments`
--

DROP TABLE IF EXISTS `sxo_plugins_intellectstools_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_intellectstools_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `content` char(230) NOT NULL DEFAULT '' COMMENT '评价信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_category_id` (`goods_category_id`),
  KEY `content` (`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='智能工具箱 - 批量评价';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_intellectstools_comments_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_intellectstools_comments_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_intellectstools_comments_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `inc_count` int unsigned NOT NULL DEFAULT '1' COMMENT '增加次数',
  `data_count` int unsigned NOT NULL DEFAULT '1' COMMENT '数据条数',
  `last_time` int unsigned NOT NULL DEFAULT '0' COMMENT '最后时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `inc_count` (`inc_count`),
  KEY `data_count` (`data_count`),
  KEY `last_time` (`last_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='智能工具箱 - 批量评价商品增加记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_intellectstools_comments_goods_config`
--

DROP TABLE IF EXISTS `sxo_plugins_intellectstools_comments_goods_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_intellectstools_comments_goods_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `first_number_min` int unsigned NOT NULL DEFAULT '0' COMMENT '首次随机范围最小值',
  `first_number_max` int unsigned NOT NULL DEFAULT '0' COMMENT '首次随机范围最大值',
  `last_number_min` int unsigned NOT NULL DEFAULT '0' COMMENT '续增随机范围最小值',
  `last_number_max` int unsigned NOT NULL DEFAULT '0' COMMENT '续增随机范围最大值',
  `last_interval_time` int unsigned NOT NULL DEFAULT '0' COMMENT '续增间隔时间',
  `time_interval_min` int unsigned NOT NULL DEFAULT '0' COMMENT '每条时间间隔最小值',
  `time_interval_max` int unsigned NOT NULL DEFAULT '0' COMMENT '每条时间间隔最大值',
  `rating_rand_min` int unsigned NOT NULL DEFAULT '0' COMMENT '数据评分随机最小值',
  `auto_control_number` int unsigned NOT NULL DEFAULT '0' COMMENT '自动控制',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='智能工具箱 - 批量评价商品独立配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_intellectstools_goods_modify_price`
--

DROP TABLE IF EXISTS `sxo_plugins_intellectstools_goods_modify_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_intellectstools_goods_modify_price` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_ids` char(255) NOT NULL DEFAULT '' COMMENT '商品id（json存储）',
  `category_ids` char(255) NOT NULL DEFAULT '' COMMENT '商品分类id（json存储）',
  `brand_ids` char(255) NOT NULL DEFAULT '' COMMENT '品牌id（json存储）',
  `modify_price_type` char(120) NOT NULL DEFAULT '' COMMENT '价格类型（json存储）',
  `modify_rules` char(30) NOT NULL DEFAULT '' COMMENT '调价规则',
  `modify_value` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '调价值',
  `crontab_restore_rules` char(30) NOT NULL DEFAULT '' COMMENT '复原规则',
  `crontab_restore_value` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '复原值',
  `crontab_password` char(30) NOT NULL DEFAULT '' COMMENT '脚本密码',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='智能工具箱 - 商品调价配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_intellectstools_goods_note`
--

DROP TABLE IF EXISTS `sxo_plugins_intellectstools_goods_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_intellectstools_goods_note` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `content` text COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='智能工具箱 - 商品备注';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_intellectstools_order_note`
--

DROP TABLE IF EXISTS `sxo_plugins_intellectstools_order_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_intellectstools_order_note` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `content` text COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='智能工具箱 - 订单备注';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_intellectstools_toutiaosettlement`
--

DROP TABLE IF EXISTS `sxo_plugins_intellectstools_toutiaosettlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_intellectstools_toutiaosettlement` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '支付日志id',
  `pay_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '支付日志id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '分账状态（0待分账, 1已分账, 2已失败）',
  `is_push` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否推送（0否, 1是）',
  `reason` char(230) NOT NULL DEFAULT '' COMMENT '失败原因',
  `response_data` mediumtext COMMENT '响应参数（数组则json字符串存储）',
  `push_time` int unsigned NOT NULL DEFAULT '0' COMMENT '推送时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pay_id` (`pay_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `upd_time` (`upd_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='智能工具箱 - 头条支付分账';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_intellectstools_user_note`
--

DROP TABLE IF EXISTS `sxo_plugins_intellectstools_user_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_intellectstools_user_note` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `content` text COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='智能工具箱 - 用户备注';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_invoice`
--

DROP TABLE IF EXISTS `sxo_plugins_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_invoice` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `business_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '业务类型（0订单、充值、...更多）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待审核、1待开票、2已开票、3已拒绝, 4已关闭）',
  `total_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '发票金额',
  `apply_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '申请类型（0个人、1企业）',
  `invoice_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '发票类型（0增值税普通电子发票、1增值税普通纸质发票、2增值税专业纸质发票、3增值税专用电子发票）',
  `invoice_content` char(230) NOT NULL DEFAULT '' COMMENT '发票内容',
  `invoice_title` char(120) NOT NULL DEFAULT '' COMMENT '个人姓名或企业名称',
  `invoice_code` char(120) NOT NULL DEFAULT '' COMMENT '企业统一社会信用代码或纳税识别号',
  `invoice_bank` char(120) NOT NULL DEFAULT '' COMMENT '企业开户行名称',
  `invoice_account` char(120) NOT NULL DEFAULT '' COMMENT '企业开户帐号',
  `invoice_tel` char(15) NOT NULL DEFAULT '' COMMENT '企业联系电话',
  `invoice_address` char(230) NOT NULL DEFAULT '' COMMENT '企业注册地址',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '收件人姓名',
  `tel` char(15) NOT NULL DEFAULT '' COMMENT '收件人电话',
  `email` char(60) NOT NULL DEFAULT '' COMMENT '电子邮箱（接收电子发票）',
  `address` char(230) NOT NULL DEFAULT '' COMMENT '收件人详细地址',
  `electronic_invoice` text COMMENT '附件地址（电子发票json存储[title,url]）',
  `express_name` char(60) NOT NULL DEFAULT '' COMMENT '快递名称（纸质）',
  `express_number` char(60) NOT NULL DEFAULT '' COMMENT '快递单号（纸质）',
  `refuse_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝原因',
  `user_note` char(255) NOT NULL DEFAULT '' COMMENT '用户备注',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `business_type` (`business_type`),
  KEY `apply_type` (`apply_type`),
  KEY `invoice_type` (`invoice_type`),
  KEY `invoice_title` (`invoice_title`),
  KEY `invoice_bank` (`invoice_bank`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `tel` (`tel`),
  KEY `email` (`email`),
  KEY `express_number` (`express_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='发票数据 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_invoice_value`
--

DROP TABLE IF EXISTS `sxo_plugins_invoice_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_invoice_value` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `invoice_id` int unsigned NOT NULL DEFAULT '0' COMMENT '开票id',
  `business_id` int unsigned NOT NULL DEFAULT '0' COMMENT '业务订单id',
  `business_no` char(60) NOT NULL DEFAULT '' COMMENT '业务单号',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `business_id` (`business_id`),
  KEY `business_no` (`business_no`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='发票数据业务id - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_label`
--

DROP TABLE IF EXISTS `sxo_plugins_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_label` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '名称',
  `text_color` char(60) NOT NULL DEFAULT '' COMMENT '文字颜色值',
  `bg_color` char(60) NOT NULL DEFAULT '' COMMENT '背景颜色值',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT '图标',
  `use_count` int unsigned NOT NULL DEFAULT '0' COMMENT '使用总数',
  `is_show` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否显示（0否，1是）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `use_count` (`use_count`),
  KEY `is_show` (`is_show`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='标签 - 标签管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_label_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_label_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_label_goods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `label_id` int unsigned NOT NULL DEFAULT '0' COMMENT '标签id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `label_id` (`label_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='标签 - 商品标签';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_label_user`
--

DROP TABLE IF EXISTS `sxo_plugins_label_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_label_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `label_id` int unsigned NOT NULL DEFAULT '0' COMMENT '标签id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `label_id` (`label_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2691 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='标签 - 用户标签';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_loginlog_admin_log`
--

DROP TABLE IF EXISTS `sxo_plugins_loginlog_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_loginlog_admin_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `admin_id` int unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `platform` char(30) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `ip` char(200) NOT NULL DEFAULT '' COMMENT 'ip',
  `ip_address` char(230) NOT NULL DEFAULT '' COMMENT 'ip所在地',
  `os` char(20) NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` char(20) NOT NULL DEFAULT '' COMMENT '浏览器',
  `client` text COMMENT '客户端',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `platform` (`platform`),
  KEY `ip` (`ip`),
  KEY `os` (`os`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='管理员登录日志 - 登录日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_loginlog_ip_query_log`
--

DROP TABLE IF EXISTS `sxo_plugins_loginlog_ip_query_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_loginlog_ip_query_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ip` char(30) NOT NULL DEFAULT '' COMMENT 'ip',
  `country` char(60) NOT NULL DEFAULT '' COMMENT '国家',
  `province` char(60) NOT NULL DEFAULT '' COMMENT '省份/自治区/直辖市',
  `city` char(60) NOT NULL DEFAULT '' COMMENT '地级市',
  `district` char(60) NOT NULL DEFAULT '' COMMENT '区/县',
  `isp` char(60) NOT NULL DEFAULT '' COMMENT '运营商',
  `zip` char(60) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `zone` char(60) NOT NULL DEFAULT '' COMMENT '地区区号',
  `response` text COMMENT '响应参数（json字符串存储）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`),
  KEY `country` (`country`),
  KEY `province` (`province`),
  KEY `city` (`city`),
  KEY `district` (`district`),
  KEY `isp` (`isp`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='ip查询日志 - 登录日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_loginlog_user_log`
--

DROP TABLE IF EXISTS `sxo_plugins_loginlog_user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_loginlog_user_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `platform` char(30) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `ip` char(200) NOT NULL DEFAULT '' COMMENT 'ip',
  `ip_address` char(230) NOT NULL DEFAULT '' COMMENT 'ip所在地',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '纬度',
  `os` char(20) NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` char(20) NOT NULL DEFAULT '' COMMENT '浏览器',
  `client` text COMMENT '客户端',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `platform` (`platform`),
  KEY `ip` (`ip`),
  KEY `os` (`os`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户登录日志 - 登录日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_magic_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_magic_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_magic_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '名称',
  `show_style` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '展示样式',
  `bg_images` char(255) NOT NULL DEFAULT '' COMMENT '背景图片',
  `is_text_white` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '文字白色（0否, 1是）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否, 1是）',
  `data` text COMMENT '商品组数据（json字符串）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品魔方 - 魔方';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_membershiplevelvip_introduce`
--

DROP TABLE IF EXISTS `sxo_plugins_membershiplevelvip_introduce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_membershiplevelvip_introduce` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '名称',
  `desc` char(60) NOT NULL DEFAULT '' COMMENT '描述',
  `images_url` char(255) NOT NULL DEFAULT '' COMMENT '图标',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否, 1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='会员等级增强版插件 - 会员等级介绍';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_membershiplevelvip_level`
--

DROP TABLE IF EXISTS `sxo_plugins_membershiplevelvip_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_membershiplevelvip_level` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '名称',
  `images_url` char(255) NOT NULL DEFAULT '' COMMENT '图标',
  `rules_min` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '自动计算会员（规则最小值）',
  `rules_max` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '自动计算会员（规则最大值）',
  `order_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '满减优惠（订单满额条件）',
  `full_reduction_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '满减优惠（优惠金额）',
  `discount_rate` decimal(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '折扣率（0~0.99）',
  `free_shipping_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '满额免运费',
  `is_span_free_shipping_price` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否, 1是）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否, 1是）',
  `is_supported_pay_buy` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否支持付费购买（0否, 1是）',
  `is_supported_renew` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否支持会员续费（0否, 1是）',
  `pay_period_rules` text COMMENT '周期费用规则（json存储）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `is_enable` (`is_enable`),
  KEY `is_supported_pay_buy` (`is_supported_pay_buy`),
  KEY `is_supported_renew` (`is_supported_renew`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='会员等级增强版插件 - 会员等级';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_membershiplevelvip_payment_user`
--

DROP TABLE IF EXISTS `sxo_plugins_membershiplevelvip_payment_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_membershiplevelvip_payment_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `level_id` char(60) NOT NULL DEFAULT '' COMMENT '会员等级id',
  `level_name` char(60) NOT NULL DEFAULT '' COMMENT '等级名称',
  `is_permanent` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否永久/终生（0否, 1是）',
  `is_supported_renew` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否支持续费（0否, 1是）',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '到期时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `level_id` (`level_id`),
  KEY `is_supported_renew` (`is_supported_renew`),
  KEY `expire_time` (`expire_time`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='会员等级增强版插件 - 付费用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_membershiplevelvip_payment_user_order`
--

DROP TABLE IF EXISTS `sxo_plugins_membershiplevelvip_payment_user_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_membershiplevelvip_payment_user_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `payment_user_order_no` char(60) NOT NULL DEFAULT '' COMMENT '购买单号',
  `payment_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `number` int unsigned NOT NULL DEFAULT '0' COMMENT '购买周期（单位 天）',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '购买价格（单位 元）',
  `level_id` char(60) NOT NULL DEFAULT '' COMMENT '会员等级id',
  `level_data` text COMMENT '等级数据（json存储）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待支付, 1已支付, 2已取消, 3已关闭）',
  `settlement_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '结算状态（0待结算, 1结算中, 2已结算）',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '类型（0正常购买, 1续费）',
  `pay_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `payment_id` int unsigned NOT NULL DEFAULT '0' COMMENT '支付方式id',
  `payment` char(60) NOT NULL DEFAULT '' COMMENT '支付方式标记',
  `payment_name` char(60) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `payment_user_order_no` (`payment_user_order_no`),
  KEY `payment_user_id` (`payment_user_id`),
  KEY `user_id` (`user_id`),
  KEY `level_id` (`level_id`),
  KEY `status` (`status`),
  KEY `settlement_status` (`settlement_status`),
  KEY `pay_price` (`pay_price`)
) ENGINE=InnoDB AUTO_INCREMENT=891 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='会员等级增强版插件 - 付费订单纪录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_membershiplevelvip_user_profit`
--

DROP TABLE IF EXISTS `sxo_plugins_membershiplevelvip_user_profit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_membershiplevelvip_user_profit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `payment_user_order_id` int unsigned NOT NULL COMMENT '会员付费订单id',
  `payment_user_order_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '会员付费订单用户id',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `profit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收益金额',
  `commission_rules` char(60) NOT NULL DEFAULT '' COMMENT '佣金规则',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '结算状态（0待结算, 1已结算, 2已失效）',
  `level` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '当前级别（1~3）',
  `user_level_id` int unsigned NOT NULL DEFAULT '0' COMMENT '插件会员等级id',
  `msg` char(255) NOT NULL DEFAULT '' COMMENT '描述（一般用于失效后的描述）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `payment_user_order_id` (`payment_user_order_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='会员等级增强版插件 - 会员佣金明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_messagenotice_email_log`
--

DROP TABLE IF EXISTS `sxo_plugins_messagenotice_email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_messagenotice_email_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `email` char(60) NOT NULL DEFAULT '' COMMENT '邮箱',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未发送，1已发送，2已失败）',
  `reason` char(255) NOT NULL DEFAULT '' COMMENT '失败原因',
  `content` mediumtext COMMENT '邮件模板内容',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `status` (`status`),
  KEY `tsc` (`tsc`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='邮件发送日志 - 消息通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_messagenotice_sms_log`
--

DROP TABLE IF EXISTS `sxo_plugins_messagenotice_sms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_messagenotice_sms_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `mobile` char(30) NOT NULL DEFAULT '' COMMENT '手机',
  `template` char(230) NOT NULL DEFAULT '' COMMENT '短信模板ID',
  `sms_sign` char(60) NOT NULL DEFAULT '' COMMENT '短信签名',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未发送，1已发送，2已失败）',
  `reason` char(255) NOT NULL DEFAULT '' COMMENT '失败原因',
  `codes` mediumtext COMMENT '变量参数（数组则json字符串存储）',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`),
  KEY `template` (`template`),
  KEY `sms_sign` (`sms_sign`),
  KEY `status` (`status`),
  KEY `tsc` (`tsc`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='短信发送日志 - 消息通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_messagenotice_voice_log`
--

DROP TABLE IF EXISTS `sxo_plugins_messagenotice_voice_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_messagenotice_voice_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `device_id` char(60) NOT NULL DEFAULT '' COMMENT '设备ID',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '类型（0订单通知，1用户审核，2扫码收款）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未发送，1已发送，2已失败）',
  `reason` char(255) NOT NULL DEFAULT '' COMMENT '失败原因',
  `content` mediumtext COMMENT '语音模板内容',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `tsc` (`tsc`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='语音发送日志 - 消息通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_mobileplace_log`
--

DROP TABLE IF EXISTS `sxo_plugins_mobileplace_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_mobileplace_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `mobile` char(30) NOT NULL DEFAULT '' COMMENT '手机',
  `province` char(60) NOT NULL DEFAULT '' COMMENT '省份/自治区/直辖市',
  `city` char(60) NOT NULL DEFAULT '' COMMENT '地级市',
  `card` char(60) NOT NULL DEFAULT '' COMMENT '卡类型',
  `zone` char(60) NOT NULL DEFAULT '' COMMENT '城市区号',
  `city_code` char(60) NOT NULL DEFAULT '' COMMENT '行政区划代码',
  `response` text COMMENT '响应数据（json字符串存储）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`),
  KEY `province` (`province`),
  KEY `city` (`city`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='手机归属地查询日志 - 手机归属地';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_multilingual_tr_data`
--

DROP TABLE IF EXISTS `sxo_plugins_multilingual_tr_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_multilingual_tr_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `translate_type` char(30) NOT NULL DEFAULT 'baidu' COMMENT '翻译平台（baidu 百度，youdao 有道）',
  `md5_key` char(32) NOT NULL DEFAULT '' COMMENT 'md5key值',
  `from_type` char(30) NOT NULL DEFAULT '' COMMENT '原始类型',
  `to_type` char(30) NOT NULL DEFAULT '' COMMENT '翻译类型',
  `from_value` text COMMENT '原始的值',
  `to_value` text COMMENT '翻译的值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `md5_key` (`md5_key`),
  KEY `from_type` (`from_type`),
  KEY `to_type` (`to_type`),
  KEY `translate_type` (`translate_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多语言 - 翻译数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_operatelog`
--

DROP TABLE IF EXISTS `sxo_plugins_operatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_operatelog` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `admin_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `role_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `name` char(200) NOT NULL DEFAULT '' COMMENT '名称',
  `url` text COMMENT 'url地址',
  `is_get` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否GET（0否、1是）',
  `is_post` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否POST（0否、1是）',
  `is_ajax` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否AJAX（0否、1是）',
  `ip` char(60) NOT NULL DEFAULT '' COMMENT 'IP',
  `client` text COMMENT '客户端详情信息',
  `request_params` mediumtext COMMENT '请求参数（数组则json字符串存储）',
  `response_data` mediumtext COMMENT '响应数据（数组则json字符串存储）',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `role_id` (`role_id`),
  KEY `name` (`name`),
  KEY `tsc` (`tsc`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='操作日志 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_ordergoodsform`
--

DROP TABLE IF EXISTS `sxo_plugins_ordergoodsform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_ordergoodsform` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '标题',
  `config` longtext COMMENT '配置表单数据',
  `goods_count` int unsigned NOT NULL DEFAULT '0' COMMENT '关联商品数量',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `goods_count` (`goods_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='表单 - 下单商品表单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_ordergoodsform_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_ordergoodsform_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_ordergoodsform_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `form_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品表单id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='表单关联商品 - 下单商品表单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_ordergoodsform_goods_data`
--

DROP TABLE IF EXISTS `sxo_plugins_ordergoodsform_goods_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_ordergoodsform_goods_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `form_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品表单id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `data` longtext COMMENT '数据值（json存储）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `goods_id` (`goods_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='表单关联商品数据 - 下单商品表单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_ordergoodsform_order_data`
--

DROP TABLE IF EXISTS `sxo_plugins_ordergoodsform_order_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_ordergoodsform_order_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `form_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品表单id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `data` longtext COMMENT '数据值（json存储）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `goods_id` (`goods_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='表单关联订单数据 - 下单商品表单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_orderresources`
--

DROP TABLE IF EXISTS `sxo_plugins_orderresources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_orderresources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `images_data` text COMMENT '图片（json存储）',
  `video_data` text COMMENT '视频（json存储）',
  `file_data` text COMMENT '文件（json存储）',
  `note` char(255) NOT NULL DEFAULT '' COMMENT '备注',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单资源 - 订单附件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_points_scan`
--

DROP TABLE IF EXISTS `sxo_plugins_points_scan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_points_scan` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '名称',
  `platform` char(30) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `brand_id` int unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `brand_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '品牌分类id',
  `integral` int unsigned NOT NULL DEFAULT '0' COMMENT '赠送积分',
  `qrcode_count` int unsigned NOT NULL DEFAULT '0' COMMENT '二维码总数',
  `qrcode_use_count` int unsigned NOT NULL DEFAULT '0' COMMENT '二维码使用总数',
  `batch_data` text COMMENT '批次数据（json存储）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否, 1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `platform` (`platform`),
  KEY `integral` (`integral`),
  KEY `qrcode_count` (`qrcode_count`),
  KEY `qrcode_use_count` (`qrcode_use_count`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='扫码 - 积分商城';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_points_scan_qrcode`
--

DROP TABLE IF EXISTS `sxo_plugins_points_scan_qrcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_points_scan_qrcode` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '扫码用户id',
  `scan_id` int unsigned NOT NULL DEFAULT '0' COMMENT '扫码id',
  `batch_id` char(60) NOT NULL DEFAULT '' COMMENT '生成批次id',
  `qrcode` char(160) NOT NULL DEFAULT '' COMMENT '二维码标识',
  `is_use` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否使用（0否, 1是）',
  `integral` int unsigned NOT NULL DEFAULT '0' COMMENT '赠送积分',
  `use_time` int unsigned NOT NULL DEFAULT '0' COMMENT '使用时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `scan_id` (`scan_id`),
  KEY `batch_id` (`batch_id`),
  KEY `qrcode` (`qrcode`),
  KEY `is_use` (`is_use`),
  KEY `integral` (`integral`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='扫码二维码列表 - 积分商城';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_purchase_company`
--

DROP TABLE IF EXISTS `sxo_plugins_purchase_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_purchase_company` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待提交、1待审核，2已审核、3已拒绝、4已关闭）',
  `logo` char(255) NOT NULL DEFAULT '' COMMENT '正方形loog',
  `logo_long` char(255) NOT NULL DEFAULT '' COMMENT '长方形loog',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '简称',
  `company_name` char(60) NOT NULL DEFAULT '' COMMENT '企业名称',
  `company_number` char(60) NOT NULL DEFAULT '' COMMENT '企业统一社会信用代码',
  `company_license` char(255) NOT NULL DEFAULT '' COMMENT '企业执照图片',
  `more_prove` text COMMENT '更多材料附件、json存储',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '简介',
  `category_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '到期时间（0则永久）',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '所在省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '所在市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '所在县/区',
  `address` char(160) NOT NULL DEFAULT '' COMMENT '详细地址',
  `contacts_name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `contacts_mobile` char(60) NOT NULL DEFAULT '' COMMENT '联系手机',
  `contacts_tel` char(60) NOT NULL DEFAULT '' COMMENT '联系座机',
  `contacts_email` char(60) NOT NULL DEFAULT '' COMMENT '联系邮箱',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `company_name` (`company_name`),
  KEY `company_number` (`company_number`),
  KEY `category_id` (`category_id`),
  KEY `expire_time` (`expire_time`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='企业 - 企业采购';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_purchase_company_category`
--

DROP TABLE IF EXISTS `sxo_plugins_purchase_company_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_purchase_company_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='企业分类 - 企业采购';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_purchase_order`
--

DROP TABLE IF EXISTS `sxo_plugins_purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_purchase_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `company_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '企业id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '采购状态（0待提交、1待审核、2已审核、3已拒绝、4已关闭）',
  `title` char(60) NOT NULL DEFAULT '' COMMENT '标题',
  `buy_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '商品总数量',
  `total_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总价',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝/关闭原因',
  `submit_time` int unsigned DEFAULT '0' COMMENT '提审时间',
  `audit_time` int unsigned DEFAULT '0' COMMENT '审核时间',
  `refuse_time` int unsigned DEFAULT '0' COMMENT '拒绝时间',
  `close_time` int unsigned DEFAULT '0' COMMENT '关闭时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='采购单 - 企业采购';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_purchase_order_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_purchase_order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_purchase_order_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `company_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '企业id',
  `purchase_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '采购单id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面主图',
  `spec` char(255) NOT NULL DEFAULT '' COMMENT '规格',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '单位编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '单位条码',
  `weight` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位重量（kg）',
  `volume` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位体积（m³）',
  `buy_number` int unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `total_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(售价*数量)',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `purchase_order_id` (`purchase_order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='采购单商品 - 企业采购';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_purchase_order_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_purchase_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_purchase_order_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `purchase_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '采购单id',
  `original_status` char(60) NOT NULL DEFAULT '' COMMENT '原始状态',
  `new_status` char(60) NOT NULL DEFAULT '' COMMENT '最新状态',
  `msg` text COMMENT '操作描述',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '操作-用户id',
  `creator_name` varchar(60) NOT NULL DEFAULT '' COMMENT '操作人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `purchase_order_id` (`purchase_order_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='采购单状态历史纪录 - 企业采购';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_purchase_order_system_order`
--

DROP TABLE IF EXISTS `sxo_plugins_purchase_order_system_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_purchase_order_system_order` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `purchase_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '采购单id',
  `system_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '系统订单id',
  `system_order_no` char(60) NOT NULL DEFAULT '' COMMENT '系统订单号',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '操作-用户id',
  `creator_name` varchar(60) NOT NULL DEFAULT '' COMMENT '操作人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `purchase_order_id` (`purchase_order_id`),
  KEY `system_order_id` (`system_order_id`),
  KEY `system_order_no` (`system_order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='采购单关联系统订单 - 企业采购';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_purchase_staff`
--

DROP TABLE IF EXISTS `sxo_plugins_purchase_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_purchase_staff` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `company_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '企业id',
  `department_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0在职中，1暂休中，2已解聘）',
  `position` char(60) NOT NULL DEFAULT '' COMMENT '职位',
  `code` char(60) NOT NULL DEFAULT '' COMMENT '工号',
  `avatar` char(255) NOT NULL DEFAULT '' COMMENT '头像',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '手机',
  `email` char(60) NOT NULL DEFAULT '' COMMENT '邮箱',
  `family_tel` char(15) NOT NULL DEFAULT '' COMMENT '家庭电话',
  `is_purchase` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否可采购（0否，1是）',
  `is_audit` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否可审核（0否，1是）仅可审核所属部门下的单子',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `company_id` (`company_id`),
  KEY `department_id` (`department_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  KEY `code` (`code`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='员工 - 企业采购';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_purchase_staff_department`
--

DROP TABLE IF EXISTS `sxo_plugins_purchase_staff_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_purchase_staff_department` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `company_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '企业id',
  `pid` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `pid` (`pid`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='员工部门 - 企业采购';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `system_type` char(60) NOT NULL DEFAULT 'default' COMMENT '系统类型（默认 default, 其他按照SYSTEM_TYPE常量类型）',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店用户id',
  `region_manage_id` int unsigned NOT NULL DEFAULT '0' COMMENT '所属区管id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待提交，1待审核，2已审核，3已拒绝，4已关闭）',
  `logo` char(255) NOT NULL DEFAULT '' COMMENT '正方形门店loog',
  `logo_long` char(255) NOT NULL DEFAULT '' COMMENT '长方形门店loog',
  `banner` char(255) NOT NULL DEFAULT '' COMMENT '门店banner',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '名称',
  `alias` char(30) NOT NULL DEFAULT '' COMMENT '别名',
  `describe` text COMMENT '简介',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店分类id',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '到期时间（0则永久）',
  `is_cash_collect` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否有现金收款权限（0否，1是）',
  `contacts_name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `contacts_tel` char(15) NOT NULL DEFAULT '' COMMENT '联系电话',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '所在省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '所在市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '所在县/区',
  `address` char(80) NOT NULL DEFAULT '' COMMENT '详细地址',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '纬度',
  `auth_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '认证类型（0个人，1企业）',
  `company_name` char(60) NOT NULL DEFAULT '' COMMENT '企业名称',
  `company_number` char(60) NOT NULL DEFAULT '' COMMENT '企业统一社会信用代码',
  `idcard_name` char(60) NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `idcard_number` char(30) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '失败原因',
  `share_images` char(255) NOT NULL DEFAULT '' COMMENT '分享图片',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `audit_time` int unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `system_type` (`system_type`),
  KEY `user_id` (`user_id`),
  KEY `region_manage_id` (`region_manage_id`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `province` (`province`),
  KEY `city` (`city`),
  KEY `contacts_name` (`contacts_name`),
  KEY `contacts_tel` (`contacts_tel`),
  KEY `lng` (`lng`),
  KEY `lat` (`lat`),
  KEY `idcard_name` (`idcard_name`),
  KEY `idcard_number` (`idcard_number`),
  KEY `expire_time` (`expire_time`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_batch`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_batch` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '简介',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未启用，1已启用，2已关闭）关闭后不可再启用',
  `config_data` longtext COMMENT '配置数据（json存储）',
  `goods_count` int unsigned NOT NULL DEFAULT '0' COMMENT '已关联商品总数',
  `order_count` int unsigned NOT NULL DEFAULT '0' COMMENT '已关联批次订单总数',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `status` (`status`),
  KEY `goods_count` (`goods_count`),
  KEY `order_count` (`order_count`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='批次配置 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_batch_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_batch_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_batch_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `batch_id` int unsigned NOT NULL DEFAULT '0' COMMENT '批次id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `batch_id` (`batch_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='批次配置关联商品 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_batch_order`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_batch_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_batch_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `batch_id` int unsigned NOT NULL DEFAULT '0' COMMENT '批次id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '简介',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待生效，1进行中，2已完成，3已关闭）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `batch_id` (`batch_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`),
  KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=806 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='批次订单数据 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_batch_order_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_batch_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_batch_order_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `batch_order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '批次订单id',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待处理，1已处理，2已关闭）',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `batch_order_id` (`batch_order_id`),
  KEY `describe` (`describe`),
  KEY `status` (`status`),
  KEY `note` (`note`)
) ENGINE=InnoDB AUTO_INCREMENT=2416 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='批次订单详情数据 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_cash_collect`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_cash_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_cash_collect` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `business_id` int unsigned NOT NULL DEFAULT '0' COMMENT '业务id',
  `business_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '业务类型（0服务订单, 1钱包充值）',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '金额',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待收款, 1已收款, 2已核算, 3已退款）',
  `operate_id` int unsigned NOT NULL DEFAULT '0' COMMENT '操作人id',
  `operate_name` char(30) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `settlement_time` int unsigned NOT NULL DEFAULT '0' COMMENT '核算时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `business_id` (`business_id`),
  KEY `business_type` (`business_type`),
  KEY `price` (`price`),
  KEY `status` (`status`),
  KEY `settlement_time` (`settlement_time`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=749 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='现金收款记录 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_cashier_hanging`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_cashier_hanging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_cashier_hanging` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '客户用户id',
  `order_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单模式（0快递配送, 1客户自提, 2上门服务, 3虚拟产品）',
  `buy_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '购买总数',
  `total_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `user_note` char(200) NOT NULL DEFAULT '' COMMENT '特别说明（管理员填写）',
  `realstore_card_value` text COMMENT '门店次卡（json存储）',
  `address_data` text COMMENT '地址数据（json存储）',
  `detail_data` longtext COMMENT '详情数据（json存储）',
  `tablecode_id` int unsigned NOT NULL DEFAULT '0' COMMENT '桌码id',
  `appoint_time` char(60) NOT NULL DEFAULT '' COMMENT '指定时间',
  `extraction_contact_name` char(60) NOT NULL DEFAULT '' COMMENT '自提-联系人',
  `extraction_contact_tel` char(15) NOT NULL DEFAULT '' COMMENT '自提-联系电话',
  `order_ext_price_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单改价类型（0减少、1增加）',
  `order_ext_price_value` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单改价值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `user_id` (`user_id`),
  KEY `order_type` (`order_type`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='收银挂单 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_category`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店分类 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_cert`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_cert` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `unique_key` char(160) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `name` char(120) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待审核，1已通过，2已拒绝）',
  `annex` text COMMENT '附件数据（二维数组）',
  `start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '有效起始时间',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `expire_time_long_term` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '过期时间是否长期（0否，1是）',
  `audit_time` int unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `unique_key` (`unique_key`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店资质 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_charge`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_charge` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待合作, 1合作中, 2已终止）',
  `subject` char(160) NOT NULL DEFAULT '' COMMENT '主体名称（企业名称或个人姓名）',
  `number` char(60) NOT NULL DEFAULT '' COMMENT '主体号码（企业统一社会信用代码或个人身份证号）',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `tel` char(15) NOT NULL DEFAULT '' COMMENT '联系电话',
  `limit_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '限制额度',
  `used_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已用额度',
  `note` char(200) NOT NULL DEFAULT '' COMMENT '备注信息',
  `images` text COMMENT '图片/附件、json存储',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `status` (`status`),
  KEY `subject` (`subject`),
  KEY `number` (`number`),
  KEY `name` (`name`),
  KEY `tel` (`tel`),
  KEY `limit_amount` (`limit_amount`),
  KEY `used_amount` (`used_amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='挂账主体 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_charge_order`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_charge_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_charge_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `charge_id` int unsigned NOT NULL DEFAULT '0' COMMENT '挂账主体id',
  `business_id` int unsigned NOT NULL DEFAULT '0' COMMENT '业务id',
  `business_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '业务类型（0服务订单, 1钱包充值）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待收款, 1已收款, 2已失效）',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `note` char(200) NOT NULL DEFAULT '' COMMENT '备注信息',
  `operate_id` int unsigned NOT NULL DEFAULT '0' COMMENT '操作人id',
  `operate_name` char(30) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `collection_time` int unsigned NOT NULL DEFAULT '0' COMMENT '收款时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `charge_id` (`charge_id`),
  KEY `business_id` (`business_id`),
  KEY `business_type` (`business_type`),
  KEY `status` (`status`),
  KEY `price` (`price`),
  KEY `collection_time` (`collection_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='挂账订单 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_config`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `realstore_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `only_tag` char(255) NOT NULL DEFAULT '' COMMENT '唯一的标记',
  `value` mediumtext COMMENT '数据值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `only_tag` (`only_tag`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=637 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='配置信息 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_dada_base_data`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_dada_base_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_dada_base_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `type_key` char(200) NOT NULL DEFAULT '' COMMENT '类型标识key',
  `data` mediumtext COMMENT '数据（数组则json字符串存储）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `type_key` (`type_key`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='达达基础数据 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_dada_order`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_dada_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_dada_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `status` int NOT NULL DEFAULT '0' COMMENT '状态（0未推单、1待接单、2待取货、3配送中、4已完成、5已取消、8指派单、9妥投异常之物品返回中、10妥投异常之物品返回完成、100骑士到店、1000创建达达运单失败）',
  `city_code` char(15) NOT NULL DEFAULT '' COMMENT '城市code',
  `business_type` char(15) NOT NULL DEFAULT '' COMMENT '业务品类id',
  `reward` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '打赏小费',
  `delay_publish_time` int unsigned NOT NULL DEFAULT '0' COMMENT '预约发单时间（时间戳）',
  `is_prepay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要垫付（0否、1是）垫付订单金额，非运费',
  `is_use_insurance` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否使用保价费（0否、1是）',
  `is_direct_delivery` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否选择直拿直送（0否、1是）',
  `origin_mark` char(10) NOT NULL DEFAULT '' COMMENT '订单来源标示（只支持字母、最大长度为10）',
  `origin_mark_no` char(30) NOT NULL DEFAULT '' COMMENT '订单来源编号、最大长度为30、该字段可以显示在骑士APP订单详情页面',
  `pick_up_pos` char(60) NOT NULL DEFAULT '' COMMENT '货架信息',
  `user_note` char(60) NOT NULL DEFAULT '' COMMENT '用户备注',
  `receiver_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人',
  `receiver_tel` char(30) NOT NULL DEFAULT '' COMMENT '收件电话',
  `receiver_address` char(160) NOT NULL DEFAULT '' COMMENT '收货地址',
  `weight_total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '重量总计（kg）',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-纬度',
  `cancel_from` tinyint NOT NULL DEFAULT '0' COMMENT '订单取消原因来源（0默认空、1达达配送员取消、2商家主动取消、3系统或客服取消）',
  `cancel_reason` char(255) NOT NULL DEFAULT '' COMMENT '取消原因',
  `fail_reason` char(255) NOT NULL DEFAULT '' COMMENT '失败原因',
  `is_complaint` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已投诉（0否、1是）',
  `complaint_info` char(255) NOT NULL DEFAULT '' COMMENT '投诉信息（json字符串存储）',
  `dispatch_time` int unsigned NOT NULL DEFAULT '0' COMMENT '派单时间',
  `take_time` int unsigned NOT NULL DEFAULT '0' COMMENT '取货时间',
  `delivery_time` int unsigned NOT NULL DEFAULT '0' COMMENT '配送时间',
  `beback_time` int unsigned NOT NULL DEFAULT '0' COMMENT '退回时间',
  `success_time` int unsigned NOT NULL DEFAULT '0' COMMENT '完成时间',
  `cancel_time` int unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `order_id` (`order_id`),
  KEY `status` (`status`),
  KEY `city_code` (`city_code`),
  KEY `business_type` (`business_type`),
  KEY `receiver_name` (`receiver_name`),
  KEY `receiver_tel` (`receiver_tel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='达达配送订单 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_dada_order_out`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_dada_order_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_dada_order_out` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `out_order_no` char(60) NOT NULL DEFAULT '' COMMENT '达达配送单号',
  `out_distance` decimal(13,2) NOT NULL DEFAULT '0.00' COMMENT '配送距离（单位：米）',
  `out_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际运费、减去优惠券的费用（单位：元）',
  `out_deliver_fee` decimal(13,2) NOT NULL DEFAULT '0.00' COMMENT '运费（单位：元）',
  `out_coupon_fee` decimal(13,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券费用（单位：元）',
  `out_insurance_fee` decimal(13,2) NOT NULL DEFAULT '0.00' COMMENT '保价费（单位：元）',
  `out_deduct_fee` decimal(13,2) NOT NULL DEFAULT '0.00' COMMENT '扣除违约金（单位：元）',
  `out_dm_info` mediumtext COMMENT '配送员信息（数组则json字符串存储）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `out_order_no` (`out_order_no`),
  KEY `out_distance` (`out_distance`),
  KEY `out_fee` (`out_fee`),
  KEY `out_insurance_fee` (`out_insurance_fee`),
  KEY `out_deduct_fee` (`out_deduct_fee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='达达配送订单外部订单信息 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_dada_order_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_dada_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_dada_order_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `original_status` char(60) NOT NULL DEFAULT '' COMMENT '原始状态',
  `new_status` char(60) NOT NULL DEFAULT '' COMMENT '最新状态',
  `msg` text COMMENT '操作描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='达达配送订单状态历史纪录 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_dada_receive_request_log`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_dada_receive_request_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_dada_receive_request_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `url` char(230) NOT NULL DEFAULT '' COMMENT 'url地址',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待响应，1已响应）',
  `request_params` mediumtext COMMENT '请求参数（数组则json字符串存储）',
  `response_data` mediumtext COMMENT '响应参数（数组则json字符串存储）',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `url` (`url`),
  KEY `status` (`status`),
  KEY `tsc` (`tsc`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='接收达达请求日志 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_dada_request_log`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_dada_request_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_dada_request_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `url` char(230) NOT NULL DEFAULT '' COMMENT 'url地址',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待确认，1已回调，2已失败）',
  `reason` char(230) NOT NULL DEFAULT '' COMMENT '请求失败原因',
  `request_params` mediumtext COMMENT '请求参数（数组则json字符串存储）',
  `response_data` mediumtext COMMENT '响应参数（数组则json字符串存储）',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `url` (`url`),
  KEY `status` (`status`),
  KEY `tsc` (`tsc`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='达达配送请求日志 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_dada_shop`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_dada_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_dada_shop` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `is_sync` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已同步（0否、1是）',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态（0未同步、1已同步、2已失败）',
  `reason` char(200) NOT NULL DEFAULT '' COMMENT '失败原因',
  `business_type` char(15) NOT NULL DEFAULT '' COMMENT '业务品类id',
  `city_code` char(15) NOT NULL DEFAULT '' COMMENT '城市code',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `username` char(30) NOT NULL DEFAULT '' COMMENT 'APP账号',
  `password` char(255) NOT NULL DEFAULT '' COMMENT 'APP密码',
  `idcard_number` char(30) NOT NULL DEFAULT '' COMMENT '联系人身份证号',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `is_sync` (`is_sync`),
  KEY `status` (`status`),
  KEY `is_enable` (`is_enable`),
  KEY `business_type` (`business_type`),
  KEY `city_code` (`city_code`),
  KEY `idcard_number` (`idcard_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='达达配送门店 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_deposit`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_deposit` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待取货, 1已取货, 2异常）',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `tel` char(15) NOT NULL DEFAULT '' COMMENT '联系电话',
  `number` char(30) NOT NULL DEFAULT '' COMMENT '号牌',
  `note` char(200) NOT NULL DEFAULT '' COMMENT '备注信息',
  `images` text COMMENT '图片/附件、json存储',
  `take_time` int unsigned NOT NULL DEFAULT '0' COMMENT '取货时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `tel` (`tel`),
  KEY `number` (`number`),
  KEY `take_time` (`take_time`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='货物存放 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_favor`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_favor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_favor` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店收藏 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_frequency_card`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_frequency_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_frequency_card` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '简介',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未启用，1已启用，2已关闭）关闭后不可再启用',
  `card_number` int unsigned NOT NULL DEFAULT '0' COMMENT '卡次数',
  `day_number` int unsigned NOT NULL DEFAULT '0' COMMENT '有效天数（发卡开始计算起始时间）',
  `start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '固定起始时间（优先级高于有效天数、空则当前时间）',
  `end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '固定结束时间（优先级高于有效天数）',
  `goods_config_count` int unsigned NOT NULL DEFAULT '0' COMMENT '已关联配置商品总数',
  `goods_consume_count` int unsigned NOT NULL DEFAULT '0' COMMENT '已关联消费商品总数',
  `user_card_count` int unsigned NOT NULL DEFAULT '0' COMMENT '用户已发卡总数',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `status` (`status`),
  KEY `card_number` (`card_number`),
  KEY `day_number` (`day_number`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `goods_config_count` (`goods_config_count`),
  KEY `goods_consume_count` (`goods_consume_count`),
  KEY `user_card_count` (`user_card_count`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='次卡配置 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_frequency_card_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_frequency_card_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_frequency_card_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `frequency_card_id` int unsigned NOT NULL DEFAULT '0' COMMENT '次卡id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '类型（0配置，1消费）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `frequency_card_id` (`frequency_card_id`),
  KEY `goods_id` (`goods_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='次卡配置关联商品 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_frequency_card_user`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_frequency_card_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_frequency_card_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `frequency_card_id` int unsigned NOT NULL DEFAULT '0' COMMENT '次卡id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '简介',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0有效，1暂停，2结束，3关闭）',
  `start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '起始时间',
  `end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `valid_number` int unsigned NOT NULL DEFAULT '0' COMMENT '未使用有效次数',
  `use_number` int unsigned NOT NULL DEFAULT '0' COMMENT '已使用次数',
  `note` char(200) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `frequency_card_id` (`frequency_card_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `name` (`name`),
  KEY `status` (`status`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `valid_number` (`valid_number`),
  KEY `use_number` (`use_number`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户次卡 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_frequency_card_user_used`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_frequency_card_user_used`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_frequency_card_user_used` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `frequency_card_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户次卡id',
  `dec_number` int unsigned NOT NULL DEFAULT '1' COMMENT '扣除次数',
  `msg` text COMMENT '描述信息',
  `use_time` int unsigned NOT NULL DEFAULT '0' COMMENT '使用时间',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0有效，1无效）',
  `operate_id` int unsigned NOT NULL DEFAULT '0' COMMENT '操作人id',
  `operate_name` char(30) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `frequency_card_user_id` (`frequency_card_user_id`),
  KEY `dec_number` (`dec_number`),
  KEY `use_time` (`use_time`),
  KEY `status` (`status`),
  KEY `operate_id` (`operate_id`),
  KEY `operate_name` (`operate_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户次卡使用记录 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_goods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `settle_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算固定金额（权重高于比例）',
  `settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值（权重高于店铺统一比例）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `printer_sn` text COMMENT '打印机配置、json存储（编号-ID）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `category_id` (`category_id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=25348 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店商品 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_goods_1225`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_goods_1225`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_goods_1225` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `settle_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算固定金额（权重高于比例）',
  `settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值（权重高于店铺统一比例）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `printer_sn` text COMMENT '打印机配置、json存储（编号-ID）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `category_id` (`category_id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=23983 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店商品 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_goods_category`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_goods_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `user_id` (`user_id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=73679 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品分类 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_goods_price`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_goods_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_goods_price` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '销售价格',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `md5_key` char(32) NOT NULL DEFAULT '' COMMENT 'md5key值',
  `spec` text COMMENT '规格值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `md5_key` (`md5_key`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店商品价格 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_home_icon`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_home_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_home_icon` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform` char(255) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `event_type` tinyint NOT NULL DEFAULT '-1' COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` char(255) NOT NULL DEFAULT '' COMMENT '事件值',
  `images_url` char(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `bg_color` char(30) NOT NULL DEFAULT '' COMMENT 'css背景色值',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='首页图标 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_label`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_label` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `label_id` int unsigned NOT NULL DEFAULT '0' COMMENT '标签id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `label_id` (`label_id`),
  KEY `realstore_id` (`realstore_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店标签 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_order_allot`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_order_allot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_order_allot` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_allot_no` char(60) NOT NULL DEFAULT '' COMMENT '订单分配单号',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店用户id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `order_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单用户id',
  `created_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单来源（0系统指派, 1门店收银, 2用户扫码）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态（0待接收、1已接收、2服务中、3待签收、4已完成、5转单中、6已取消、7已关闭）',
  `order_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单模式（0快递配送, 1客户自提, 2上门服务, 3虚拟产品, 4门店散客）',
  `total_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `buy_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '购买商品总数量',
  `refund_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_quantity` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `special_remarks` char(200) NOT NULL DEFAULT '' COMMENT '特别说明（管理员填写）',
  `transfer_reason` char(200) NOT NULL DEFAULT '' COMMENT '转单原因（门店申请转单填写）',
  `service_msg` char(200) NOT NULL DEFAULT '' COMMENT '服务描述（门店填写）',
  `receive_time` int unsigned NOT NULL DEFAULT '0' COMMENT '接收时间',
  `service_time` int unsigned NOT NULL DEFAULT '0' COMMENT '服务时间',
  `success_time` int unsigned NOT NULL DEFAULT '0' COMMENT '完成时间',
  `transfer_time` int unsigned NOT NULL DEFAULT '0' COMMENT '转单时间',
  `cancel_time` int unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '门店是否已删除（0否, 大于0删除时间）',
  `creator_id` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-名称',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_allot_no` (`order_allot_no`),
  KEY `realstore_id` (`realstore_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `order_user_id` (`order_user_id`),
  KEY `status` (`status`),
  KEY `order_type` (`order_type`),
  KEY `creator_id` (`creator_id`),
  KEY `is_delete_time` (`is_delete_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2981 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单分配 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_order_allot_address`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_order_allot_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_order_allot_address` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `alias` char(60) NOT NULL DEFAULT '' COMMENT '别名',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '收件人-姓名',
  `tel` char(15) NOT NULL DEFAULT '' COMMENT '收件人-电话',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-县/区',
  `address` char(200) NOT NULL DEFAULT '' COMMENT '收件人-详细地址',
  `province_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-省-名称',
  `city_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-市-名称',
  `county_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-县/区-名称',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-纬度',
  `appoint_time` char(60) NOT NULL DEFAULT '' COMMENT '指定时间',
  `extraction_contact_name` char(60) NOT NULL DEFAULT '' COMMENT '自提-联系人',
  `extraction_contact_tel` char(15) NOT NULL DEFAULT '' COMMENT '自提-联系电话',
  `idcard_name` char(60) NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `idcard_number` char(30) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `idcard_front` char(255) NOT NULL DEFAULT '' COMMENT '身份证人像面图片',
  `idcard_back` char(255) NOT NULL DEFAULT '' COMMENT '身份证国微面图片',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单分配地址 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_order_allot_aftersale`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_order_allot_aftersale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_order_allot_aftersale` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未退款, 1已退款）',
  `refundment` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '退款类型（0原路退回, 1退至钱包, 2手动处理）',
  `refund_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_quantity` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `order_id` (`order_id`),
  KEY `status` (`status`),
  KEY `refundment` (`refundment`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单分配售后 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_order_allot_currency`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_order_allot_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_order_allot_currency` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `currency_name` char(80) NOT NULL DEFAULT '' COMMENT '货币名称',
  `currency_code` char(60) NOT NULL DEFAULT '' COMMENT '货币代码',
  `currency_symbol` char(60) NOT NULL DEFAULT '' COMMENT '货币符号',
  `currency_rate` decimal(12,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '货币汇率',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `order_id` (`order_id`),
  KEY `currency_name` (`currency_name`),
  KEY `currency_code` (`currency_code`),
  KEY `currency_rate` (`currency_rate`)
) ENGINE=InnoDB AUTO_INCREMENT=2981 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单分配货币 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_order_allot_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_order_allot_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_order_allot_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `order_detail_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单详情id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `spec` text COMMENT '规格',
  `buy_number` int unsigned NOT NULL DEFAULT '0' COMMENT '购买数量（分配的数量）',
  `inventory_unit` char(80) NOT NULL DEFAULT '' COMMENT '库存单位',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(单价*数量)',
  `model` char(30) NOT NULL DEFAULT '' COMMENT '型号',
  `spec_weight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量（kg）',
  `spec_volume` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '体积（m³）',
  `spec_coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `spec_barcode` char(80) NOT NULL DEFAULT '' COMMENT '条形码',
  `refund_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_quantity` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `order_id` (`order_id`),
  KEY `order_detail_id` (`order_detail_id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5568 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单分配详情 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_order_allot_express`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_order_allot_express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_order_allot_express` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `express_id` int unsigned NOT NULL DEFAULT '0' COMMENT '快递id',
  `express_name` char(80) NOT NULL DEFAULT '' COMMENT '快递名称',
  `express_number` char(60) NOT NULL DEFAULT '' COMMENT '快递单号',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `order_id` (`order_id`),
  KEY `express_id` (`express_id`),
  KEY `express_name` (`express_name`),
  KEY `express_number` (`express_number`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单分配快递 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_order_allot_extraction_code`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_order_allot_extraction_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_order_allot_extraction_code` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '取货码',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单分配自提取货码 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_order_allot_fictitious_value`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_order_allot_fictitious_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_order_allot_fictitious_value` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_allot_detail_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单详情id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `order_detail_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单详情id',
  `value` text COMMENT '虚拟商品展示数据',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `order_allot_detail_id` (`order_allot_detail_id`),
  KEY `order_id` (`order_id`),
  KEY `order_detail_id` (`order_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单分配虚拟销售数据 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_order_allot_staff`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_order_allot_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_order_allot_staff` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `staff_id` int unsigned NOT NULL DEFAULT '0' COMMENT '员工id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '员工编号',
  `alias` char(30) NOT NULL DEFAULT '' COMMENT '员工别名',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` char(60) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `avatar` char(255) NOT NULL DEFAULT '' COMMENT '员工头像地址',
  `settle_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算固定金额',
  `settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `staff_id` (`staff_id`),
  KEY `user_id` (`user_id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `mobile` (`mobile`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单分配服务的员工 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_order_allot_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_order_allot_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_order_allot_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `original_status` char(60) NOT NULL DEFAULT '' COMMENT '原始状态',
  `new_status` char(60) NOT NULL DEFAULT '' COMMENT '最新状态',
  `msg` text COMMENT '操作描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB AUTO_INCREMENT=6084 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单分配状态历史纪录 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_order_allot_table_code`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_order_allot_table_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_order_allot_table_code` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `tablecode_id` int unsigned NOT NULL DEFAULT '0' COMMENT '桌码id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '编号',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `order_id` (`order_id`),
  KEY `tablecode_id` (`tablecode_id`),
  KEY `name` (`name`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单分配桌码 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_order_profit`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_order_profit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_order_profit` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单用户id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `profit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收益金额',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '结算状态（0待结算, 1已结算, 2已失效）',
  `msg` char(255) NOT NULL DEFAULT '' COMMENT '描述（一般用于订单发生改变描述）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `order_user_id` (`order_user_id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `order_allot_id` (`order_allot_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店订单收益明细 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_printer_log`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_printer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_printer_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_allot_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分配订单id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待打印, 1已打印, 2打印失败）',
  `printer_sn` char(200) NOT NULL DEFAULT '' COMMENT '打印机编号',
  `request_params` mediumtext COMMENT '请求参数（数组则json字符串存储）',
  `response_data` mediumtext COMMENT '响应参数（数组则json字符串存储）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_allot_id` (`order_allot_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `realstore_id` (`realstore_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `printer_sn` (`printer_sn`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2812 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='打印机日志记录 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_region_manage`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_region_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_region_manage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '简介',
  `contacts_name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `contacts_tel` char(15) NOT NULL DEFAULT '' COMMENT '联系电话',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '所在省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '所在市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '所在县/区',
  `address` char(80) NOT NULL DEFAULT '' COMMENT '详细地址',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '纬度',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `contacts_name` (`contacts_name`),
  KEY `contacts_tel` (`contacts_tel`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店区管 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_slider`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_slider` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform` char(255) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `event_type` tinyint NOT NULL DEFAULT '-1' COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` char(255) NOT NULL DEFAULT '' COMMENT '事件值',
  `images_url` char(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `bg_color` char(30) NOT NULL DEFAULT '' COMMENT 'css背景色值',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='轮播图片 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_staff`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_staff` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `position_id` int unsigned NOT NULL DEFAULT '0' COMMENT '职位id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待确认，1在职中，2暂休中，3已解聘）',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '员工编号',
  `alias` char(30) NOT NULL DEFAULT '' COMMENT '员工别名',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` char(60) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `avatar` char(255) NOT NULL DEFAULT '' COMMENT '员工头像地址',
  `idcard_name` char(60) NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `idcard_number` char(30) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `idcard_front` char(255) NOT NULL DEFAULT '' COMMENT '身份证人像面图片',
  `idcard_back` char(255) NOT NULL DEFAULT '' COMMENT '身份证国微面图片',
  `base_salary` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '底薪',
  `settle_rate` decimal(5,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值',
  `bank_name` char(180) NOT NULL DEFAULT '' COMMENT '结算银行开户行',
  `bank_username` char(60) NOT NULL DEFAULT '' COMMENT '结算银行姓名',
  `bank_account` char(180) NOT NULL DEFAULT '' COMMENT '结算银行账户',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `status` (`status`),
  KEY `code` (`code`),
  KEY `alias` (`alias`),
  KEY `mobile` (`mobile`),
  KEY `email` (`email`),
  KEY `sort` (`sort`),
  KEY `position_id` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店员工 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_staff_onduty`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_staff_onduty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_staff_onduty` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `staff_id` int unsigned NOT NULL DEFAULT '0' COMMENT '员工id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `note` char(200) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `user_id` (`user_id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店员工值班 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_staff_position`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_staff_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_staff_position` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `realstore_id` (`realstore_id`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='员工职位 - 多门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_staff_salary`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_staff_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_staff_salary` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `staff_id` int unsigned NOT NULL DEFAULT '0' COMMENT '员工id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总额',
  `base_salary` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '底薪',
  `order_profit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单收益金额',
  `recharge_profit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '充值收益金额',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '结算状态（0待结算, 1已结算）',
  `ym` int unsigned NOT NULL DEFAULT '0' COMMENT '年月(Ym)',
  `msg` char(255) NOT NULL DEFAULT '' COMMENT '描述（一般用于订单发生改变描述）',
  `settlement_time` int unsigned NOT NULL DEFAULT '0' COMMENT '结算时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `staff_id` (`staff_id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `total_price` (`total_price`),
  KEY `base_salary` (`base_salary`),
  KEY `order_profit_price` (`order_profit_price`),
  KEY `recharge_profit_price` (`recharge_profit_price`),
  KEY `status` (`status`),
  KEY `ym` (`ym`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='员工薪水和收益 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_staff_salary_business`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_staff_salary_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_staff_salary_business` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `salary_id` int unsigned NOT NULL DEFAULT '0' COMMENT '员工薪水id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `staff_id` int unsigned NOT NULL DEFAULT '0' COMMENT '员工id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `business_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '业务类型（0服务订单，1钱包充值）',
  `business_id` int unsigned NOT NULL DEFAULT '0' COMMENT '业务id',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '业务金额',
  `business_time` int unsigned NOT NULL DEFAULT '0' COMMENT '业务时间',
  `settle_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算固定金额',
  `settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值',
  `profit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收益金额',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `salary_id` (`salary_id`),
  KEY `user_id` (`user_id`),
  KEY `staff_id` (`staff_id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `business_type` (`business_type`),
  KEY `business_id` (`business_id`),
  KEY `business_time` (`business_time`),
  KEY `profit_price` (`profit_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='员工薪水和收益关联业务 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_system_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_system_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_system_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `main_goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '系统商品id',
  `brand_id` int unsigned DEFAULT '0' COMMENT '品牌id（品牌商对应的品牌id）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待提交，1待审核，2已审核，3已拒绝）',
  `is_lock` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定、锁定后门店不可更改（0否, 1是）',
  `is_shelves` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否上架（下架后用户不可见, 0否, 1是）',
  `site_type` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '商品类型（跟随站点类型一致[0销售, 1展示, 2自提, 3虚拟销售, 4销售+自提]）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `simple_desc` char(230) NOT NULL DEFAULT '' COMMENT '简述',
  `spec_desc` char(230) NOT NULL DEFAULT '' COMMENT '规格描述',
  `approval_number` char(180) NOT NULL DEFAULT '' COMMENT '批准文号',
  `coding` char(180) NOT NULL DEFAULT '' COMMENT '商品编码',
  `model` char(180) NOT NULL DEFAULT '' COMMENT '商品型号',
  `produce_company` char(180) NOT NULL DEFAULT '' COMMENT '生产企业',
  `produce_region` int unsigned NOT NULL DEFAULT '0' COMMENT '产地（地区省id）',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '库存（所有规格库存总和）',
  `inventory_unit` char(15) NOT NULL DEFAULT '' COMMENT '库存单位（默认件）',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `original_price` char(60) NOT NULL DEFAULT '' COMMENT '原价（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低原价',
  `max_original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最大原价',
  `price` char(60) NOT NULL DEFAULT '' COMMENT '销售价格（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低价格',
  `max_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最高价格',
  `buy_min_number` int unsigned NOT NULL DEFAULT '1' COMMENT '最低起购数量 （默认1）',
  `buy_max_number` int unsigned NOT NULL DEFAULT '0' COMMENT '最大购买数量（最大数值 100000000, 小于等于0或空则不限）',
  `is_deduction_inventory` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否扣减库存（0否, 1是）',
  `content_web` mediumtext COMMENT '电脑端详情内容',
  `photo_count` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '相册图片数量',
  `video` char(255) NOT NULL DEFAULT '' COMMENT '短视频',
  `is_exist_many_spec` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个规格（0否, 1是）',
  `spec_base` text COMMENT '规格基础数据',
  `fictitious_goods_value` text COMMENT '虚拟商品展示数据',
  `refuse_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝原因',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `title` (`title`),
  KEY `realstore_id` (`realstore_id`),
  KEY `main_goods_id` (`main_goods_id`),
  KEY `is_lock` (`is_lock`),
  KEY `brand_id` (`brand_id`),
  KEY `photo_count` (`photo_count`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店系统商品 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_system_goods_category_join`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_system_goods_category_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_system_goods_category_join` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店系统商品分类关联 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_system_goods_params`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_system_goods_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_system_goods_params` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `scope` tinyint unsigned DEFAULT '1' COMMENT '展示范围（0全部, 1详情, 2基础）默认1详情',
  `data_type` tinyint unsigned DEFAULT '0' COMMENT '数据类型（0输入, 1单选, 2多选）',
  `name` char(180) NOT NULL DEFAULT '' COMMENT '参数名称',
  `value` char(230) NOT NULL DEFAULT '' COMMENT '参数值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `name` (`name`),
  KEY `value` (`value`),
  KEY `scope` (`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店系统商品参数 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_system_goods_photo`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_system_goods_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_system_goods_photo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '图片',
  `is_show` tinyint unsigned DEFAULT '1' COMMENT '是否显示（0否, 1是）',
  `sort` tinyint unsigned DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `is_show` (`is_show`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店系统商品相册图片 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_system_goods_spec_base`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_system_goods_spec_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_system_goods_spec_base` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '销售价格',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `buy_min_number` int unsigned NOT NULL DEFAULT '0' COMMENT '起购数',
  `buy_max_number` int unsigned NOT NULL DEFAULT '0' COMMENT '限购数',
  `weight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量（kg） ',
  `volume` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '体积（m³）',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '条形码',
  `inventory_unit` char(80) NOT NULL DEFAULT '' COMMENT '库存单位',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `extends` longtext COMMENT '扩展数据(json格式存储)',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店系统商品规格基础 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_system_goods_spec_type`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_system_goods_spec_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_system_goods_spec_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `value` text NOT NULL COMMENT '类型值（json字符串存储）',
  `name` char(230) NOT NULL DEFAULT '' COMMENT '类型名称',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店系统商品规格类型 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_system_goods_spec_value`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_system_goods_spec_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_system_goods_spec_value` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_spec_base_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品规格基础id',
  `value` char(230) NOT NULL DEFAULT '' COMMENT '规格值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `goods_spec_base_id` (`goods_spec_base_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='门店系统商品规格值 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_table_code`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_table_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_table_code` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `platform` char(30) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '编号',
  `qrcode` char(255) NOT NULL DEFAULT '' COMMENT '二维码地址',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `order_count` int unsigned NOT NULL DEFAULT '0' COMMENT '下单总数',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `platform` (`platform`),
  KEY `name` (`name`),
  KEY `code` (`code`),
  KEY `order_count` (`order_count`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='桌码 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_wallet_recharge_log`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_wallet_recharge_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_wallet_recharge_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '钱包用户id',
  `wallet_id` int unsigned NOT NULL DEFAULT '0' COMMENT '钱包id',
  `recharge_id` int unsigned NOT NULL DEFAULT '0' COMMENT '充值id',
  `recharge_no` char(60) NOT NULL DEFAULT '' COMMENT '充值单号',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待确认, 1已确认, 2已退款）',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `service_msg` char(200) NOT NULL DEFAULT '' COMMENT '服务描述（门店填写）',
  `operate_id` int unsigned NOT NULL DEFAULT '0' COMMENT '操作人id',
  `operate_name` char(30) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `user_id` (`user_id`),
  KEY `wallet_id` (`wallet_id`),
  KEY `recharge_id` (`recharge_id`),
  KEY `recharge_no` (`recharge_no`),
  KEY `status` (`status`),
  KEY `total_price` (`total_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='钱包充值记录 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_realstore_wallet_recharge_log_staff`
--

DROP TABLE IF EXISTS `sxo_plugins_realstore_wallet_recharge_log_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_realstore_wallet_recharge_log_staff` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `log_id` int unsigned NOT NULL DEFAULT '0' COMMENT '充值记录订单id',
  `staff_id` int unsigned NOT NULL DEFAULT '0' COMMENT '员工id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '员工编号',
  `alias` char(30) NOT NULL DEFAULT '' COMMENT '员工别名',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` char(60) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `avatar` char(255) NOT NULL DEFAULT '' COMMENT '员工头像地址',
  `settle_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算固定金额',
  `settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `realstore_id` (`realstore_id`),
  KEY `log_id` (`log_id`),
  KEY `staff_id` (`staff_id`),
  KEY `user_id` (`user_id`),
  KEY `mobile` (`mobile`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='钱包充值服务员工 - 门店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_requestlog`
--

DROP TABLE IF EXISTS `sxo_plugins_requestlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_requestlog` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `uid` char(60) NOT NULL DEFAULT '' COMMENT 'uid',
  `client_type` char(30) NOT NULL DEFAULT '' COMMENT '客户端类型（pc, h5, ios, android, alipay, weixin, baidu）取APPLICATION_CLIENT_TYPE常量值',
  `url` text COMMENT 'url地址',
  `group` char(120) NOT NULL DEFAULT '' COMMENT '模块类型（admin后端, index前端, api接口端）',
  `control` char(120) NOT NULL DEFAULT '' COMMENT '模块控制器',
  `action` char(120) NOT NULL DEFAULT '' COMMENT '模块方法',
  `is_get` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否GET（0否、1是）',
  `is_post` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否POST（0否、1是）',
  `is_ajax` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否AJAX（0否、1是）',
  `ip` char(60) NOT NULL DEFAULT '' COMMENT 'IP',
  `client` text COMMENT '客户端详情信息',
  `request_params` mediumtext COMMENT '请求参数（数组则json字符串存储）',
  `response_data` mediumtext COMMENT '响应数据（数组则json字符串存储）',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `uid` (`uid`),
  KEY `client_type` (`client_type`),
  KEY `group` (`group`),
  KEY `control` (`control`),
  KEY `action` (`action`),
  KEY `ip` (`ip`),
  KEY `tsc` (`tsc`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='请求日志 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_scanpay_config`
--

DROP TABLE IF EXISTS `sxo_plugins_scanpay_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_scanpay_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `business_id` int unsigned NOT NULL DEFAULT '0' COMMENT '业务id',
  `business_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '业务类型（0系统、1多门店、2多商户）',
  `only_tag` char(255) NOT NULL DEFAULT '' COMMENT '唯一的标记',
  `value` mediumtext COMMENT '数据值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `business_type` (`business_type`),
  KEY `business_id` (`business_id`),
  KEY `only_tag` (`only_tag`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='配置信息 - 扫码收款';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_scanpay_log`
--

DROP TABLE IF EXISTS `sxo_plugins_scanpay_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_scanpay_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_no` char(60) NOT NULL DEFAULT '' COMMENT '订单号',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `business_id` int unsigned NOT NULL DEFAULT '0' COMMENT '业务id',
  `business_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '业务类型（0系统、1多门店、2多商户）',
  `platform` char(30) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, alipay 支付宝, weixin 微信, baidu 百度, toutiao 头条, qq QQ）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待支付、1已支付、2已退款、3已关闭）',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `pay_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `payment_id` int unsigned NOT NULL DEFAULT '0' COMMENT '支付方式id',
  `payment` char(60) NOT NULL DEFAULT '' COMMENT '支付方式标记',
  `payment_name` char(60) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `openid` char(60) NOT NULL DEFAULT '' COMMENT 'openid（微信或支付宝openid）',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_no` (`order_no`),
  KEY `business_type` (`business_type`),
  KEY `business_id` (`business_id`),
  KEY `user_id` (`user_id`),
  KEY `platform` (`platform`),
  KEY `status` (`status`),
  KEY `pay_time` (`pay_time`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='收款记录 - 扫码收款';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_seckill_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_seckill_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_seckill_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `periods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '时段id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待审核，1已审核，2已拒绝）',
  `refuse_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝原因',
  `discount_rate` decimal(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '折扣系数 0.00~0.99',
  `dec_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '减金额',
  `time_start` int unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `time_end` int unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `is_recommend` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `periods_id` (`periods_id`),
  KEY `goods_id` (`goods_id`),
  KEY `shop_id` (`shop_id`),
  KEY `status` (`status`),
  KEY `time_start` (`time_start`),
  KEY `time_end` (`time_end`),
  KEY `is_recommend` (`is_recommend`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='限时秒杀 - 商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_seckill_periods`
--

DROP TABLE IF EXISTS `sxo_plugins_seckill_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_seckill_periods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `start_hour` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '开始时间(整点)',
  `continue_hour` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '持续时间(时)',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='限时秒杀 - 时段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_separation_business_pay_log`
--

DROP TABLE IF EXISTS `sxo_plugins_separation_business_pay_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_separation_business_pay_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `business_id` int unsigned NOT NULL DEFAULT '0' COMMENT '业务id',
  `business_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '业务类型（0订单, ...更多）',
  `system_type_value` char(60) NOT NULL DEFAULT '' COMMENT '系统类型标识',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `business_id` (`business_id`),
  KEY `business_type` (`business_type`),
  KEY `system_type_value` (`system_type_value`)
) ENGINE=InnoDB AUTO_INCREMENT=2848 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='程序分身 - 支付数据系统类型记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_separation_config_data`
--

DROP TABLE IF EXISTS `sxo_plugins_separation_config_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_separation_config_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `logo` char(255) NOT NULL DEFAULT '' COMMENT 'logo',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '名称',
  `system_type_value` char(60) NOT NULL DEFAULT '' COMMENT '系统类型标识',
  `diy_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'DIYID',
  `app_mini` mediumtext COMMENT '小程序配置（json存储）',
  `payment` mediumtext COMMENT '支付配置（json存储）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `system_type_value` (`system_type_value`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='程序分身 - 配置数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_separation_limit_data`
--

DROP TABLE IF EXISTS `sxo_plugins_separation_limit_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_separation_limit_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '名称',
  `system_type_value` char(60) NOT NULL DEFAULT '' COMMENT '系统类型标识',
  `limit_goods_ids` mediumtext COMMENT '限制商品id（json存储）',
  `limit_category_ids` mediumtext COMMENT '限制分类（json存储）',
  `limit_brand_ids` mediumtext COMMENT '限制品牌（json存储）',
  `is_limit_category` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否限制分类（0否，1是）',
  `is_limit_brand` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否限制品牌（0否，1是）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `system_type_value` (`system_type_value`),
  KEY `is_limit_category` (`is_limit_category`),
  KEY `is_limit_brand` (`is_limit_brand`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='程序分身 - 限制数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop`
--

DROP TABLE IF EXISTS `sxo_plugins_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `system_type` char(60) NOT NULL DEFAULT 'default' COMMENT '系统类型（默认 default, 其他按照SYSTEM_TYPE常量类型）',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待提交，1待审核，2已审核，3已拒绝，4已关闭）',
  `bond_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '保证金状态（0待缴纳，1已缴纳，2已退保）',
  `serfee_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '服务费状态（0未使用，1结算比例，2服务费，3已退费）',
  `logo` char(255) NOT NULL DEFAULT '' COMMENT '正方形店铺loog',
  `logo_long` char(255) NOT NULL DEFAULT '' COMMENT '长方形店铺loog',
  `banner` char(255) NOT NULL DEFAULT '' COMMENT '店铺banner',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '简介',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺分类id',
  `data_model` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '数据模式（0自动模式，1标准模式，2拖拽设计）',
  `domain` char(60) NOT NULL DEFAULT '' COMMENT '店铺二级域名',
  `domain_edit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '域名修改次数',
  `layout_config` longtext COMMENT '页面配置信息',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '到期时间（0则永久）',
  `service_weixin_qrcode` char(255) NOT NULL DEFAULT '' COMMENT '客服微信二维码',
  `service_line_qrcode` char(255) NOT NULL DEFAULT '' COMMENT '客服line二维码',
  `service_qq` char(30) NOT NULL DEFAULT '' COMMENT '客服QQ',
  `service_tel` char(20) NOT NULL DEFAULT '' COMMENT '客服电话',
  `notice_mobile` char(11) NOT NULL DEFAULT '' COMMENT '接收通知手机号码',
  `notice_email` char(60) NOT NULL DEFAULT '' COMMENT '接收通知电子邮箱',
  `open_week` tinyint(1) NOT NULL DEFAULT '-1' COMMENT ' 工作日起始',
  `close_week` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '工作日结束',
  `open_time` time NOT NULL DEFAULT '00:00:00' COMMENT '在线时间起始',
  `close_time` time NOT NULL DEFAULT '00:00:00' COMMENT '在线时间结束',
  `is_extraction` tinyint unsigned NOT NULL DEFAULT '0' COMMENT ' 是否支持自提（0否，1是）',
  `contacts_name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `contacts_tel` char(15) NOT NULL DEFAULT '' COMMENT '联系电话',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '所在省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '所在市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '所在县/区',
  `address` char(80) NOT NULL DEFAULT '' COMMENT '详细地址',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '纬度',
  `auth_type` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '认证类型（-1未认证，0个人，1企业）',
  `company_name` char(60) NOT NULL DEFAULT '' COMMENT '企业名称',
  `company_number` char(60) NOT NULL DEFAULT '' COMMENT '企业统一社会信用代码',
  `company_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '企业类型（0有限责任公司，1股份有限公司，2合伙企业，3个人独资企业，4个体工商户）',
  `company_register_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '企业登记状态（0存续/在业，1注销，2吊销，3停业）',
  `company_business_scope` text COMMENT '企业经营范围',
  `company_register_address` char(255) NOT NULL DEFAULT '' COMMENT '企业注册地址',
  `company_business_address` char(255) NOT NULL DEFAULT '' COMMENT '企业经营地址',
  `legal_idcard_name` char(60) NOT NULL DEFAULT '' COMMENT '法人-身份证姓名',
  `legal_idcard_number` char(60) NOT NULL DEFAULT '' COMMENT '法人-身份证号码',
  `legal_idcard_sex` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '法人-性别（0保密，1男性，2女性）',
  `legal_idcard_mobile` char(30) NOT NULL DEFAULT '' COMMENT '法人-手机号码',
  `legal_idcard_email` char(30) NOT NULL DEFAULT '' COMMENT '法人-电子邮箱',
  `idcard_name` char(60) NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `idcard_number` char(30) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `settle_type` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '结算类型（-1默认不结算，0统一比例，1商品配置）',
  `settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值',
  `is_user_settle` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '用户是否可以配置结算信息（针对商品中）',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '失败原因',
  `share_images` char(255) NOT NULL DEFAULT '' COMMENT '分享图片',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `audit_time` int unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `system_type` (`system_type`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `domain` (`domain`),
  KEY `province` (`province`),
  KEY `city` (`city`),
  KEY `contacts_name` (`contacts_name`),
  KEY `contacts_tel` (`contacts_tel`),
  KEY `lng` (`lng`),
  KEY `lat` (`lat`),
  KEY `idcard_name` (`idcard_name`),
  KEY `idcard_number` (`idcard_number`),
  KEY `expire_time` (`expire_time`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 店铺';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_bond`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_bond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_bond` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未缴，1已缴，2已退）',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '缴纳金额',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 店铺保证金';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_buscategory`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_buscategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_buscategory` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `unique_key` char(160) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `category_ids` text COMMENT '关联分类id（json存储）',
  `name` char(120) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待审核, 1已通过, 2已拒绝, 3已过期）',
  `retrial_period_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '周期复审状态（0正常，1待审核，2已审核，3已拒绝）',
  `retrial_expire_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '过期复审状态（0正常，1待审核，2已审核，3已拒绝）',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `reason` char(255) NOT NULL DEFAULT '' COMMENT '拒绝/失败原因',
  `start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '有效起始时间',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `expire_time_long_term` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '过期时间是否长期（0否，1是）',
  `audit_time` int unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `retrial_period_audit_time` int unsigned NOT NULL DEFAULT '0' COMMENT '周期复审核时间',
  `retrial_expire_audit_time` int unsigned NOT NULL DEFAULT '0' COMMENT '过期复审核时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `unique_key` (`unique_key`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 店铺经营类目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_category`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `icon_active` char(255) NOT NULL DEFAULT '' COMMENT 'icon选中图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 店铺分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_cert`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_cert` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `unique_key` char(160) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `name` char(120) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待审核，1已通过，2已拒绝）',
  `retrial_period_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '周期复审状态（0正常，1临期待更新，2周期待更新，3临期待审核，4周期待审核，5已审核，6临期拒绝，7周期拒绝）',
  `retrial_expire_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '过期复审状态（0正常，1临期待更新，2过期待更新，3临期待审核，4过期待审核，5已审核，，6临期拒绝，7过期拒绝）',
  `annex` text COMMENT '附件数据（二维数组）',
  `reason` char(255) NOT NULL DEFAULT '' COMMENT '拒绝/失败原因',
  `start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '有效起始时间',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `expire_time_long_term` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '过期时间是否长期（0否，1是）',
  `audit_time` int unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `retrial_period_audit_time` int unsigned NOT NULL DEFAULT '0' COMMENT '周期复审核时间',
  `retrial_expire_audit_time` int unsigned NOT NULL DEFAULT '0' COMMENT '过期复审核时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `unique_key` (`unique_key`),
  KEY `status` (`status`),
  KEY `retrial_period_status` (`retrial_period_status`),
  KEY `retrial_expire_status` (`retrial_expire_status`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='店铺资质 - 多商户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_contract`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_contract` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `unique_key` char(160) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `name` char(120) NOT NULL DEFAULT '' COMMENT '合约名称',
  `number` char(80) NOT NULL DEFAULT '' COMMENT '合约编号',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待签署, 1已签署, 2已过期）',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '类型（0文本内容, 1附件文件）',
  `content` longtext COMMENT '合约内容（内容或者文件地址）',
  `lift_time` int unsigned NOT NULL DEFAULT '0' COMMENT '解约时间',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `sign_time` int unsigned NOT NULL DEFAULT '0' COMMENT '签署时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `unique_key` (`unique_key`),
  KEY `number` (`number`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 店铺合约管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_design`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_design` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `logo` char(255) NOT NULL DEFAULT '' COMMENT 'logo',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `config` longtext COMMENT '页面配置信息',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `is_header` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否含头部（0否，1是）',
  `is_footer` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否含尾部（0否，1是）',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `is_header` (`is_header`),
  KEY `is_footer` (`is_footer`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 页面设计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_diy`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_diy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_diy` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `md5_key` char(32) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `logo` char(255) NOT NULL DEFAULT '' COMMENT 'logo',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(230) NOT NULL DEFAULT '' COMMENT '描述',
  `config` longtext COMMENT '配置数据',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `shop_id` (`shop_id`),
  KEY `md5_key` (`md5_key`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='DIY装修 - 多商户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_favor`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_favor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_favor` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 店铺收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_goods_category`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_goods_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `shop_id` (`shop_id`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 商品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_goods_copy_log`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_goods_copy_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_goods_copy_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `main_goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '主商品id',
  `shop_goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺商品id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `main_goods_id` (`main_goods_id`),
  KEY `shop_goods_id` (`shop_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1710 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 平台商品添加关联日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_home_diy`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_home_diy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_home_diy` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `shop_name` char(60) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `data` longtext COMMENT 'diy数据',
  `is_header` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '包含店铺头部（0否，1是）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `shop_id` (`shop_id`),
  KEY `shop_name` (`shop_name`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='店铺首页DIY - 多商户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_level`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_level` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(230) NOT NULL DEFAULT '' COMMENT '描述',
  `icon` char(250) NOT NULL DEFAULT '' COMMENT '图标',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `gain_data` text COMMENT '获得功能（json存储）',
  `duration_number` int unsigned NOT NULL DEFAULT '0' COMMENT '有效时长（单位分钟）',
  `goods_limit_number` int unsigned NOT NULL DEFAULT '0' COMMENT '商品发布限制数量',
  `is_buy` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否可购买（0否，1是）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `price` (`price`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 店铺等级';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_level_buy`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_level_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_level_buy` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `level_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺等级id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未支付、1已支付、2已取消）',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '等级售价',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `level_data` text COMMENT '店铺等级数据（json存储）',
  `buy_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '购买类型（0购买，1升级，2降级）',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `cancel_time` int unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `level_id` (`level_id`),
  KEY `shop_id` (`shop_id`),
  KEY `status` (`status`),
  KEY `price` (`price`),
  KEY `pay_price` (`pay_price`),
  KEY `buy_type` (`buy_type`),
  KEY `expire_time` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 店铺等级购买记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_navigation`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_navigation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '导航名称',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '自定义url地址',
  `value` int unsigned NOT NULL DEFAULT '0' COMMENT '数据 id',
  `data_type` char(30) NOT NULL DEFAULT '' COMMENT '数据类型（custom:自定义导航, design:页面设计, category:店铺商品分类）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否显示（0否，1是）',
  `is_new_window_open` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否新窗口打开（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `shop_id` (`shop_id`),
  KEY `is_show` (`is_show`),
  KEY `sort` (`sort`),
  KEY `data_type` (`data_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 导航管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_notice_record`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_notice_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_notice_record` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '类型（0保证金, 1服务费）',
  `count` int unsigned NOT NULL DEFAULT '0' COMMENT '次数',
  `send_time` int unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `type` (`type`),
  KEY `count` (`count`),
  KEY `send_time` (`send_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 店铺通知临时记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_order_confirm`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_order_confirm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_order_confirm` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待确认，1已确认，2已拒绝）',
  `pay_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '扣款状态（0待扣款，1已扣款，2已退回）',
  `order_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单支付金额',
  `frozen_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '冻结金额',
  `reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝原因',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `order_id` (`order_id`),
  KEY `status` (`status`),
  KEY `pay_status` (`pay_status`),
  KEY `order_price` (`order_price`),
  KEY `frozen_price` (`frozen_price`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 店铺订单确认接收';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_order_profit`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_order_profit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_order_profit` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_no` char(60) NOT NULL DEFAULT '' COMMENT '订单号',
  `order_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单用户id',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `freightfee_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费金额',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `profit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收益金额',
  `platform_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台扣除金额',
  `currency_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '汇率税率',
  `settle_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '结算类型（0统一比例，1商品配置）',
  `settle_rate` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '结算比例 0~100 的数字（创建时写入，防止发生退款重新计算时收益比例配置变更）',
  `settle_rules` longtext COMMENT '订单商品、json存储（结算计算规则、防止发生退款重新计算时收益比例配置变更）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '结算状态（0待生效, 1生效中, 2待结算, 3已结算, 4已失效）',
  `msg` text COMMENT '描述（一般用于订单发生改变描述）',
  `settlement_time` int unsigned NOT NULL DEFAULT '0' COMMENT '结算时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `order_no` (`order_no`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 收益明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_recommend`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_recommend` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '标题',
  `vice_title` char(60) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(30) NOT NULL DEFAULT '' COMMENT 'css颜色值',
  `more_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '更多分类指向地址',
  `keywords` text COMMENT '推荐关键字（英文逗号分割）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `is_home` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否首页展示（0否，1是）',
  `style_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '样式类型（0图文，1九方格，2一行滚动）',
  `data_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '数据类型（0自动模式，1手动模式）',
  `order_by_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '自动数据-排序类型（0最新，1热度，2更新）',
  `order_by_rule` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '自动数据-排序规则（0降序(desc)，1升序(asc)）',
  `data_appoint_goods_ids` char(255) NOT NULL DEFAULT '' COMMENT '手动数据（商品id英文逗号分隔）',
  `data_auto_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '自动数据-指定分类条件',
  `data_auto_number` int unsigned NOT NULL DEFAULT '0' COMMENT '自动数据-展示数量',
  `time_start` int unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `time_end` int unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `title` (`title`),
  KEY `is_enable` (`is_enable`),
  KEY `is_home` (`is_home`),
  KEY `style_type` (`style_type`),
  KEY `data_type` (`data_type`),
  KEY `order_by_type` (`order_by_type`),
  KEY `order_by_rule` (`order_by_rule`),
  KEY `add_time` (`add_time`),
  KEY `upd_time` (`upd_time`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 首页推荐';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_serfee`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_serfee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_serfee` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '类型（0服务费用，1订单抽成）',
  `fee_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '服务费用状态（0未缴，1已缴，2过期，3已退）',
  `fee_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '服务费用缴纳金额',
  `fee_expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '服务费用过期时间',
  `fee_pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '服务费用支付时间',
  `settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '订单抽成结算比例0~100的值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `type` (`type`),
  KEY `fee_status` (`fee_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 店铺服务费';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_slider`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_slider` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `platform` char(255) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `event_type` tinyint NOT NULL DEFAULT '-1' COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` char(255) NOT NULL DEFAULT '' COMMENT '事件值',
  `images_url` char(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 店铺轮播图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_staff`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_staff` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `position_id` int unsigned NOT NULL DEFAULT '0' COMMENT '职位id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待确认，1在职中，2暂休中，3已解聘）',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '员工编号',
  `alias` char(30) NOT NULL DEFAULT '' COMMENT '员工别名',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` char(60) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `avatar` char(255) NOT NULL DEFAULT '' COMMENT '员工头像地址',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  KEY `code` (`code`),
  KEY `sort` (`sort`),
  KEY `position_id` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 店铺员工';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_staff_position`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_staff_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_staff_position` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `shop_id` (`shop_id`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='多商户 - 员工职位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_shop_standard_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_shop_standard_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_shop_standard_goods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `category_id` int unsigned DEFAULT '0' COMMENT '商品分类id',
  `brand_id` int unsigned DEFAULT '0' COMMENT '品牌id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待提交，1待审核，2已审核，3已拒绝）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `simple_desc` char(230) NOT NULL DEFAULT '' COMMENT '商品简述',
  `spec_desc` char(255) NOT NULL DEFAULT '' COMMENT '规格描述',
  `produce_company` char(180) NOT NULL DEFAULT '' COMMENT '生产企业',
  `approval_number` char(180) NOT NULL DEFAULT '' COMMENT '批准文号',
  `inventory_unit` char(15) NOT NULL DEFAULT '' COMMENT '库存单位',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `photo_data` mediumtext COMMENT '相册图片（json存储）',
  `params_data` mediumtext COMMENT '参数数据（json存储）',
  `refuse_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝原因',
  `audit_time` int unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `brand_id` (`brand_id`),
  KEY `status` (`status`),
  KEY `category_id` (`category_id`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='标品库 - 多商户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_signin_qrcode`
--

DROP TABLE IF EXISTS `sxo_plugins_signin_qrcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_signin_qrcode` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `request_id` int unsigned NOT NULL DEFAULT '0' COMMENT '来源签到码id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `reward_master` int unsigned NOT NULL DEFAULT '0' COMMENT '邀请人奖励积分',
  `reward_invitee` int unsigned NOT NULL DEFAULT '0' COMMENT '受邀人奖励积分',
  `continuous_rules` text COMMENT '连续签到翻倍奖励配置数据',
  `specified_time_reward` char(255) NOT NULL DEFAULT '' COMMENT '指定时段额外奖励',
  `max_number_limit` int unsigned NOT NULL DEFAULT '0' COMMENT '最大奖励数量限制（0则不限制）',
  `day_number_limit` int unsigned NOT NULL DEFAULT '0' COMMENT '一天奖励数量限制（0则不限制）',
  `bg_images` char(255) NOT NULL DEFAULT '' COMMENT '背景图片',
  `logo` char(255) NOT NULL DEFAULT '' COMMENT 'logo',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `tel` char(15) NOT NULL DEFAULT '' COMMENT '联系人电话',
  `address` char(230) NOT NULL DEFAULT '' COMMENT '联系地址',
  `goods_count` int unsigned NOT NULL DEFAULT '0' COMMENT '关联商品数量',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
  `note` char(255) NOT NULL DEFAULT '' COMMENT '备注',
  `footer_code` text COMMENT '底部代码',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `request_id` (`request_id`),
  KEY `user_id` (`user_id`),
  KEY `reward_master` (`reward_master`),
  KEY `reward_invitee` (`reward_invitee`),
  KEY `goods_count` (`goods_count`),
  KEY `access_count` (`access_count`),
  KEY `name` (`name`),
  KEY `tel` (`tel`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='签到码 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_signin_qrcode_data`
--

DROP TABLE IF EXISTS `sxo_plugins_signin_qrcode_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_signin_qrcode_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `qrcode_id` int unsigned NOT NULL DEFAULT '0' COMMENT '签到码id',
  `integral` int unsigned NOT NULL DEFAULT '0' COMMENT '奖励积分',
  `ymd` int unsigned NOT NULL DEFAULT '0' COMMENT '年月日',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `qrcode_id` (`qrcode_id`),
  KEY `integral` (`integral`),
  KEY `ymd` (`ymd`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='签到码数据 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_signin_qrcode_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_signin_qrcode_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_signin_qrcode_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `qrcode_id` int unsigned NOT NULL DEFAULT '0' COMMENT '活动id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `qrcode_id` (`qrcode_id`),
  KEY `goods_id` (`goods_id`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='签到码关联商品 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_speedplaceorder_cart`
--

DROP TABLE IF EXISTS `sxo_plugins_speedplaceorder_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_speedplaceorder_cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned DEFAULT '0' COMMENT '用户id',
  `goods_id` int unsigned DEFAULT '0' COMMENT '商品id',
  `title` char(200) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '原价',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '销售价格',
  `stock` int unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `spec` text COMMENT '规格',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`),
  KEY `title` (`title`),
  KEY `stock` (`stock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='快速下单购物车 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `code` char(60) NOT NULL DEFAULT '' COMMENT '编码',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待提交，1待审核，2已审核，3已拒绝，4已关闭）',
  `bond_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '保证金状态（0待缴纳，1已缴纳，2已退保）',
  `serfee_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '服务费状态（0未使用，1结算比例，2服务费，3已退费）',
  `logo` char(255) NOT NULL DEFAULT '' COMMENT '正方形店铺loog',
  `logo_long` char(255) NOT NULL DEFAULT '' COMMENT '长方形店铺loog',
  `banner` char(255) NOT NULL DEFAULT '' COMMENT '店铺banner',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) NOT NULL DEFAULT '' COMMENT '简介',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺分类id',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '到期时间（0则永久）',
  `service_weixin_qrcode` char(255) NOT NULL DEFAULT '' COMMENT '客服微信二维码',
  `service_line_qrcode` char(255) NOT NULL DEFAULT '' COMMENT '客服line二维码',
  `service_qq` char(30) NOT NULL DEFAULT '' COMMENT '客服QQ',
  `service_tel` char(20) NOT NULL DEFAULT '' COMMENT '客服电话',
  `notice_mobile` char(11) NOT NULL DEFAULT '' COMMENT '接收通知手机号码',
  `notice_email` char(60) NOT NULL DEFAULT '' COMMENT '接收通知电子邮箱',
  `open_week` tinyint(1) NOT NULL DEFAULT '-1' COMMENT ' 工作日起始',
  `close_week` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '工作日结束',
  `open_time` time NOT NULL DEFAULT '00:00:00' COMMENT '在线时间起始',
  `close_time` time NOT NULL DEFAULT '00:00:00' COMMENT '在线时间结束',
  `contacts_name` char(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `contacts_tel` char(15) NOT NULL DEFAULT '' COMMENT '联系电话',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '所在省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '所在市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '所在县/区',
  `address` char(80) NOT NULL DEFAULT '' COMMENT '详细地址',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '纬度',
  `auth_type` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '认证类型（-1未认证，0个人，1企业）',
  `company_name` char(60) NOT NULL DEFAULT '' COMMENT '企业名称',
  `company_number` char(60) NOT NULL DEFAULT '' COMMENT '企业统一社会信用代码',
  `idcard_name` char(60) NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `idcard_number` char(30) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值',
  `is_user_settle` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '用户是否可以配置结算信息（针对商品中）',
  `fail_reason` char(230) NOT NULL DEFAULT '' COMMENT '失败原因',
  `share_images` char(255) NOT NULL DEFAULT '' COMMENT '分享图片',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `code` (`code`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `lng` (`lng`),
  KEY `lat` (`lat`),
  KEY `expire_time` (`expire_time`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='店铺 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_bond`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_bond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_bond` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未缴，1已缴，2已退）',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '缴纳金额',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='店铺保证金 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_buscategory`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_buscategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_buscategory` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商id',
  `unique_key` char(160) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `category_ids` text COMMENT '关联分类id（json存储）',
  `name` char(120) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待审核, 1已通过, 2已拒绝）',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `reason` char(255) NOT NULL DEFAULT '' COMMENT '拒绝/失败原因',
  `start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '有效起始时间',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `expire_time_long_term` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '过期时间是否长期（0否，1是）',
  `audit_time` int unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `unique_key` (`unique_key`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='店铺经营类目 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_category`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `icon_active` char(255) NOT NULL DEFAULT '' COMMENT 'icon选中图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='供应商分类 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_cert`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_cert` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `unique_key` char(160) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `name` char(120) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待审核，1已通过，2已拒绝）',
  `annex` text COMMENT '附件数据（二维数组）',
  `start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '有效起始时间',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `expire_time_long_term` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '过期时间是否长期（0否，1是）',
  `audit_time` int unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `unique_key` (`unique_key`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='供应商资质 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_contract`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_contract` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商id',
  `unique_key` char(160) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `name` char(120) NOT NULL DEFAULT '' COMMENT '合约名称',
  `number` char(80) NOT NULL DEFAULT '' COMMENT '合约编号',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待签署, 1已签署, 2已过期）',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '类型（0文本内容, 1附件文件）',
  `content` longtext COMMENT '合约内容（内容或者文件地址）',
  `lift_time` int unsigned NOT NULL DEFAULT '0' COMMENT '解约时间',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `sign_time` int unsigned NOT NULL DEFAULT '0' COMMENT '签署时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `unique_key` (`unique_key`),
  KEY `number` (`number`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='店铺合约管理 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `supplier_category_id` int unsigned DEFAULT '0' COMMENT '供应商商品分类id',
  `brand_id` int unsigned DEFAULT '0' COMMENT '品牌id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待提交，1待审核，2已审核，3已拒绝）',
  `is_lock` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定、锁定后门店不可更改（0否, 1是）',
  `is_shelves` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否上架（下架后用户不可见, 0否, 1是）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `title_color` char(200) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `simple_desc` char(230) NOT NULL DEFAULT '' COMMENT '商品简述',
  `spec_desc` char(230) NOT NULL DEFAULT '' COMMENT '规格描述',
  `approval_number` char(180) NOT NULL DEFAULT '' COMMENT '批准文号',
  `approval_number_expire` int unsigned NOT NULL DEFAULT '0' COMMENT '批准文号有效期',
  `coding` char(180) NOT NULL DEFAULT '' COMMENT '商品编码',
  `model` char(180) NOT NULL DEFAULT '' COMMENT '商品型号',
  `produce_company` char(180) NOT NULL DEFAULT '' COMMENT '生产企业',
  `produce_region` int unsigned NOT NULL DEFAULT '0' COMMENT '产地（地区省id）',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '库存（所有规格库存总和）',
  `inventory_unit` char(15) NOT NULL DEFAULT '' COMMENT '计量单位（默认件）',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `cost_price` char(60) NOT NULL DEFAULT '' COMMENT '成本价（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低成本价',
  `max_cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最大成本价',
  `price` char(60) NOT NULL DEFAULT '' COMMENT '建议售价（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低价格',
  `max_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最高价格',
  `buy_min_number` int unsigned NOT NULL DEFAULT '1' COMMENT '最低起购数量 （默认1）',
  `buy_max_number` int unsigned NOT NULL DEFAULT '0' COMMENT '最大购买数量（最大数值 100000000, 小于等于0或空则不限）',
  `is_deduction_inventory` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否扣减库存（0否, 1是）',
  `content_web` mediumtext COMMENT '端详情内容',
  `photo_count` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '相册图片数量',
  `sales_count` int unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `video` char(255) NOT NULL DEFAULT '' COMMENT '短视频',
  `is_exist_many_spec` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个规格（0否, 1是）',
  `spec_base` text COMMENT '规格基础数据',
  `fictitious_goods_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '虚拟商品展示数据',
  `sort_level` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值（数值越大排在前面）',
  `refuse_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝原因',
  `settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值',
  `settle_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '结算固定金额',
  `use_count` int unsigned NOT NULL DEFAULT '0' COMMENT '使用总数',
  `share_images` char(255) NOT NULL DEFAULT '' COMMENT '分享图片',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `supplier_category_id` (`supplier_category_id`),
  KEY `brand_id` (`brand_id`),
  KEY `status` (`status`),
  KEY `title` (`title`),
  KEY `is_lock` (`is_lock`)
) ENGINE=InnoDB AUTO_INCREMENT=1208 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='供应商商品 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_goods_12_22`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_goods_12_22`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_goods_12_22` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `supplier_category_id` int unsigned DEFAULT '0' COMMENT '供应商商品分类id',
  `brand_id` int unsigned DEFAULT '0' COMMENT '品牌id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待提交，1待审核，2已审核，3已拒绝）',
  `is_lock` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定、锁定后门店不可更改（0否, 1是）',
  `is_shelves` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否上架（下架后用户不可见, 0否, 1是）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `title_color` char(200) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `simple_desc` char(230) NOT NULL DEFAULT '' COMMENT '商品简述',
  `spec_desc` char(230) NOT NULL DEFAULT '' COMMENT '规格描述',
  `approval_number` char(180) NOT NULL DEFAULT '' COMMENT '批准文号',
  `approval_number_expire` int unsigned NOT NULL DEFAULT '0' COMMENT '批准文号有效期',
  `coding` char(180) NOT NULL DEFAULT '' COMMENT '商品编码',
  `model` char(180) NOT NULL DEFAULT '' COMMENT '商品型号',
  `produce_company` char(180) NOT NULL DEFAULT '' COMMENT '生产企业',
  `produce_region` int unsigned NOT NULL DEFAULT '0' COMMENT '产地（地区省id）',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '库存（所有规格库存总和）',
  `inventory_unit` char(15) NOT NULL DEFAULT '' COMMENT '计量单位（默认件）',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `cost_price` char(60) NOT NULL DEFAULT '' COMMENT '成本价（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低成本价',
  `max_cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最大成本价',
  `price` char(60) NOT NULL DEFAULT '' COMMENT '建议售价（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低价格',
  `max_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最高价格',
  `buy_min_number` int unsigned NOT NULL DEFAULT '1' COMMENT '最低起购数量 （默认1）',
  `buy_max_number` int unsigned NOT NULL DEFAULT '0' COMMENT '最大购买数量（最大数值 100000000, 小于等于0或空则不限）',
  `is_deduction_inventory` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否扣减库存（0否, 1是）',
  `content_web` mediumtext COMMENT '端详情内容',
  `photo_count` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '相册图片数量',
  `sales_count` int unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `video` char(255) NOT NULL DEFAULT '' COMMENT '短视频',
  `is_exist_many_spec` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个规格（0否, 1是）',
  `spec_base` text COMMENT '规格基础数据',
  `fictitious_goods_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '虚拟商品展示数据',
  `sort_level` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值（数值越大排在前面）',
  `refuse_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝原因',
  `settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值',
  `settle_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '结算固定金额',
  `use_count` int unsigned NOT NULL DEFAULT '0' COMMENT '使用总数',
  `share_images` char(255) NOT NULL DEFAULT '' COMMENT '分享图片',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `supplier_category_id` (`supplier_category_id`),
  KEY `brand_id` (`brand_id`),
  KEY `status` (`status`),
  KEY `title` (`title`),
  KEY `is_lock` (`is_lock`)
) ENGINE=InnoDB AUTO_INCREMENT=960 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='供应商商品 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_goods_12_26`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_goods_12_26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_goods_12_26` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `supplier_category_id` int unsigned DEFAULT '0' COMMENT '供应商商品分类id',
  `brand_id` int unsigned DEFAULT '0' COMMENT '品牌id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待提交，1待审核，2已审核，3已拒绝）',
  `is_lock` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定、锁定后门店不可更改（0否, 1是）',
  `is_shelves` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否上架（下架后用户不可见, 0否, 1是）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `title_color` char(200) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `simple_desc` char(230) NOT NULL DEFAULT '' COMMENT '商品简述',
  `spec_desc` char(230) NOT NULL DEFAULT '' COMMENT '规格描述',
  `approval_number` char(180) NOT NULL DEFAULT '' COMMENT '批准文号',
  `approval_number_expire` int unsigned NOT NULL DEFAULT '0' COMMENT '批准文号有效期',
  `coding` char(180) NOT NULL DEFAULT '' COMMENT '商品编码',
  `model` char(180) NOT NULL DEFAULT '' COMMENT '商品型号',
  `produce_company` char(180) NOT NULL DEFAULT '' COMMENT '生产企业',
  `produce_region` int unsigned NOT NULL DEFAULT '0' COMMENT '产地（地区省id）',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '库存（所有规格库存总和）',
  `inventory_unit` char(15) NOT NULL DEFAULT '' COMMENT '计量单位（默认件）',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `cost_price` char(60) NOT NULL DEFAULT '' COMMENT '成本价（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低成本价',
  `max_cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最大成本价',
  `price` char(60) NOT NULL DEFAULT '' COMMENT '建议售价（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低价格',
  `max_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最高价格',
  `buy_min_number` int unsigned NOT NULL DEFAULT '1' COMMENT '最低起购数量 （默认1）',
  `buy_max_number` int unsigned NOT NULL DEFAULT '0' COMMENT '最大购买数量（最大数值 100000000, 小于等于0或空则不限）',
  `is_deduction_inventory` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否扣减库存（0否, 1是）',
  `content_web` mediumtext COMMENT '端详情内容',
  `photo_count` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '相册图片数量',
  `sales_count` int unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `video` char(255) NOT NULL DEFAULT '' COMMENT '短视频',
  `is_exist_many_spec` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个规格（0否, 1是）',
  `spec_base` text COMMENT '规格基础数据',
  `fictitious_goods_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '虚拟商品展示数据',
  `sort_level` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值（数值越大排在前面）',
  `refuse_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝原因',
  `settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值',
  `settle_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '结算固定金额',
  `use_count` int unsigned NOT NULL DEFAULT '0' COMMENT '使用总数',
  `share_images` char(255) NOT NULL DEFAULT '' COMMENT '分享图片',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `supplier_category_id` (`supplier_category_id`),
  KEY `brand_id` (`brand_id`),
  KEY `status` (`status`),
  KEY `title` (`title`),
  KEY `is_lock` (`is_lock`)
) ENGINE=InnoDB AUTO_INCREMENT=1200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='供应商商品 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_goods_12_29`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_goods_12_29`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_goods_12_29` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `supplier_category_id` int unsigned DEFAULT '0' COMMENT '供应商商品分类id',
  `brand_id` int unsigned DEFAULT '0' COMMENT '品牌id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待提交，1待审核，2已审核，3已拒绝）',
  `is_lock` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定、锁定后门店不可更改（0否, 1是）',
  `is_shelves` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否上架（下架后用户不可见, 0否, 1是）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `title_color` char(200) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `simple_desc` char(230) NOT NULL DEFAULT '' COMMENT '商品简述',
  `spec_desc` char(230) NOT NULL DEFAULT '' COMMENT '规格描述',
  `approval_number` char(180) NOT NULL DEFAULT '' COMMENT '批准文号',
  `approval_number_expire` int unsigned NOT NULL DEFAULT '0' COMMENT '批准文号有效期',
  `coding` char(180) NOT NULL DEFAULT '' COMMENT '商品编码',
  `model` char(180) NOT NULL DEFAULT '' COMMENT '商品型号',
  `produce_company` char(180) NOT NULL DEFAULT '' COMMENT '生产企业',
  `produce_region` int unsigned NOT NULL DEFAULT '0' COMMENT '产地（地区省id）',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '库存（所有规格库存总和）',
  `inventory_unit` char(15) NOT NULL DEFAULT '' COMMENT '计量单位（默认件）',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `cost_price` char(60) NOT NULL DEFAULT '' COMMENT '成本价（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低成本价',
  `max_cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最大成本价',
  `price` char(60) NOT NULL DEFAULT '' COMMENT '建议售价（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低价格',
  `max_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最高价格',
  `buy_min_number` int unsigned NOT NULL DEFAULT '1' COMMENT '最低起购数量 （默认1）',
  `buy_max_number` int unsigned NOT NULL DEFAULT '0' COMMENT '最大购买数量（最大数值 100000000, 小于等于0或空则不限）',
  `is_deduction_inventory` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否扣减库存（0否, 1是）',
  `content_web` mediumtext COMMENT '端详情内容',
  `photo_count` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '相册图片数量',
  `sales_count` int unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `video` char(255) NOT NULL DEFAULT '' COMMENT '短视频',
  `is_exist_many_spec` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个规格（0否, 1是）',
  `spec_base` text COMMENT '规格基础数据',
  `fictitious_goods_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '虚拟商品展示数据',
  `sort_level` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值（数值越大排在前面）',
  `refuse_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝原因',
  `settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值',
  `settle_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '结算固定金额',
  `use_count` int unsigned NOT NULL DEFAULT '0' COMMENT '使用总数',
  `share_images` char(255) NOT NULL DEFAULT '' COMMENT '分享图片',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `supplier_category_id` (`supplier_category_id`),
  KEY `brand_id` (`brand_id`),
  KEY `status` (`status`),
  KEY `title` (`title`),
  KEY `is_lock` (`is_lock`)
) ENGINE=InnoDB AUTO_INCREMENT=1200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='供应商商品 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_goods_26_1_6`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_goods_26_1_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_goods_26_1_6` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `supplier_category_id` int unsigned DEFAULT '0' COMMENT '供应商商品分类id',
  `brand_id` int unsigned DEFAULT '0' COMMENT '品牌id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待提交，1待审核，2已审核，3已拒绝）',
  `is_lock` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定、锁定后门店不可更改（0否, 1是）',
  `is_shelves` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否上架（下架后用户不可见, 0否, 1是）',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `title_color` char(200) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `simple_desc` char(230) NOT NULL DEFAULT '' COMMENT '商品简述',
  `spec_desc` char(230) NOT NULL DEFAULT '' COMMENT '规格描述',
  `approval_number` char(180) NOT NULL DEFAULT '' COMMENT '批准文号',
  `approval_number_expire` int unsigned NOT NULL DEFAULT '0' COMMENT '批准文号有效期',
  `coding` char(180) NOT NULL DEFAULT '' COMMENT '商品编码',
  `model` char(180) NOT NULL DEFAULT '' COMMENT '商品型号',
  `produce_company` char(180) NOT NULL DEFAULT '' COMMENT '生产企业',
  `produce_region` int unsigned NOT NULL DEFAULT '0' COMMENT '产地（地区省id）',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '库存（所有规格库存总和）',
  `inventory_unit` char(15) NOT NULL DEFAULT '' COMMENT '计量单位（默认件）',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `cost_price` char(60) NOT NULL DEFAULT '' COMMENT '成本价（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低成本价',
  `max_cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最大成本价',
  `price` char(60) NOT NULL DEFAULT '' COMMENT '建议售价（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低价格',
  `max_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最高价格',
  `buy_min_number` int unsigned NOT NULL DEFAULT '1' COMMENT '最低起购数量 （默认1）',
  `buy_max_number` int unsigned NOT NULL DEFAULT '0' COMMENT '最大购买数量（最大数值 100000000, 小于等于0或空则不限）',
  `is_deduction_inventory` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否扣减库存（0否, 1是）',
  `content_web` mediumtext COMMENT '端详情内容',
  `photo_count` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '相册图片数量',
  `sales_count` int unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `access_count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `video` char(255) NOT NULL DEFAULT '' COMMENT '短视频',
  `is_exist_many_spec` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否存在多个规格（0否, 1是）',
  `spec_base` text COMMENT '规格基础数据',
  `fictitious_goods_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '虚拟商品展示数据',
  `sort_level` int unsigned NOT NULL DEFAULT '0' COMMENT '排序值（数值越大排在前面）',
  `refuse_reason` char(230) NOT NULL DEFAULT '' COMMENT '拒绝原因',
  `settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值',
  `settle_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '结算固定金额',
  `use_count` int unsigned NOT NULL DEFAULT '0' COMMENT '使用总数',
  `share_images` char(255) NOT NULL DEFAULT '' COMMENT '分享图片',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `supplier_category_id` (`supplier_category_id`),
  KEY `brand_id` (`brand_id`),
  KEY `status` (`status`),
  KEY `title` (`title`),
  KEY `is_lock` (`is_lock`)
) ENGINE=InnoDB AUTO_INCREMENT=1203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='供应商商品 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_goods_category`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_goods_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `supplier_id` (`supplier_id`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品分类 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_goods_category_join`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_goods_category_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_goods_category_join` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='供应商商品分类关联 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_goods_params`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_goods_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_goods_params` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `scope` tinyint unsigned DEFAULT '1' COMMENT '展示范围（0全部, 1详情, 2基础）默认1详情',
  `data_type` tinyint unsigned DEFAULT '0' COMMENT '数据类型（0输入, 1单选, 2多选）',
  `name` char(180) NOT NULL DEFAULT '' COMMENT '参数名称',
  `value` char(230) NOT NULL DEFAULT '' COMMENT '参数值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `scope` (`scope`),
  KEY `name` (`name`),
  KEY `value` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='供应商商品参数 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_goods_photo`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_goods_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_goods_photo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '图片',
  `is_show` tinyint unsigned DEFAULT '1' COMMENT '是否显示（0否, 1是）',
  `sort` tinyint unsigned DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `is_show` (`is_show`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=2711 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='供应商商品相册图片 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_goods_spec_base`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_goods_spec_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_goods_spec_base` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '建议售价',
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `buy_min_number` int unsigned NOT NULL DEFAULT '0' COMMENT '起购数',
  `buy_max_number` int unsigned NOT NULL DEFAULT '0' COMMENT '限购数',
  `weight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量（kg） ',
  `volume` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '体积（m³）',
  `coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `barcode` char(80) NOT NULL DEFAULT '' COMMENT '条形码',
  `inventory_unit` char(80) NOT NULL DEFAULT '' COMMENT '库存单位',
  `extends` longtext COMMENT '扩展数据(json格式存储)',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='供应商商品规格基础 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_goods_spec_type`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_goods_spec_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_goods_spec_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `value` text NOT NULL COMMENT '类型值（json字符串存储）',
  `name` char(230) NOT NULL DEFAULT '' COMMENT '类型名称',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2414 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='供应商商品规格类型 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_goods_spec_value`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_goods_spec_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_goods_spec_value` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_spec_base_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品规格基础id',
  `value` char(230) NOT NULL DEFAULT '' COMMENT '规格值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `goods_spec_base_id` (`goods_spec_base_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3050 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='供应商商品规格值 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_order`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_order` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `system_order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '系统订单id',
  `system_order_no` char(60) NOT NULL DEFAULT '' COMMENT '系统订单号',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单用户id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态（0待确认, 1已确认/待支付, 2已支付/待发货, 3已发货/待收货, 4已完成, 5已取消, 6已关闭）',
  `pay_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '支付状态（0未支付, 1已支付, 2已退款, 3部分退款）',
  `supplier_mode` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '供应商模式（0一件代发, 1集中发货）',
  `buy_number_count` int unsigned NOT NULL DEFAULT '0' COMMENT '购买商品总数量',
  `profit_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '收益金额',
  `total_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `refund_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_quantity` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `client_type` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客户端类型（pc, h5, ios, android, alipay, weixin, baidu）取APPLICATION_CLIENT_TYPE常量值',
  `order_model` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单模式（0销售型, 1同城, 2自提点, 3虚拟销售）',
  `user_note` char(255) NOT NULL DEFAULT '' COMMENT '用户备注',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `confirm_time` int unsigned NOT NULL DEFAULT '0' COMMENT '确认时间',
  `delivery_time` int unsigned NOT NULL DEFAULT '0' COMMENT '发货时间',
  `collect_time` int unsigned NOT NULL DEFAULT '0' COMMENT '收货时间',
  `cancel_time` int unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `close_time` int unsigned NOT NULL DEFAULT '0' COMMENT '关闭时间',
  `supplier_is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `system_order_id` (`system_order_id`),
  KEY `system_order_no` (`system_order_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`) USING BTREE,
  KEY `pay_status` (`pay_status`) USING BTREE,
  KEY `supplier_mode` (`supplier_mode`) USING BTREE,
  KEY `supplier_is_delete_time` (`supplier_is_delete_time`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_order_address`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_order_address` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商id',
  `order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单用户id',
  `address_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '收件地址id',
  `alias` char(60) NOT NULL DEFAULT '' COMMENT '别名',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '收件人-姓名',
  `tel` char(15) NOT NULL DEFAULT '' COMMENT '收件人-电话',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '收件人-县/区',
  `address` char(200) NOT NULL DEFAULT '' COMMENT '收件人-详细地址',
  `province_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-省-名称',
  `city_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-市-名称',
  `county_name` char(30) NOT NULL DEFAULT '' COMMENT '收件人-县/区-名称',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '收货地址-纬度',
  `appoint_time` char(60) NOT NULL DEFAULT '' COMMENT '指定时间',
  `extraction_contact_name` char(60) NOT NULL DEFAULT '' COMMENT '自提-联系人',
  `extraction_contact_tel` char(15) NOT NULL DEFAULT '' COMMENT '自提-联系电话',
  `idcard_name` char(60) NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `idcard_number` char(30) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `idcard_front` char(255) NOT NULL DEFAULT '' COMMENT '身份证人像面图片',
  `idcard_back` char(255) NOT NULL DEFAULT '' COMMENT '身份证国微面图片',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单地址 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_order_currency`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_order_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_order_currency` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商id',
  `order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单用户id',
  `currency_name` char(80) NOT NULL DEFAULT '' COMMENT '货币名称',
  `currency_code` char(60) NOT NULL DEFAULT '' COMMENT '货币代码',
  `currency_symbol` char(60) NOT NULL DEFAULT '' COMMENT '货币符号',
  `currency_rate` decimal(12,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '货币汇率',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `currency_name` (`currency_name`),
  KEY `currency_code` (`currency_code`),
  KEY `currency_rate` (`currency_rate`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单货币 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_order_detail`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_order_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `system_order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '系统订单id',
  `system_order_detail_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '系统订单详情id',
  `system_goods_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '系统商品id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商id',
  `order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `title` char(160) NOT NULL DEFAULT '' COMMENT '标题',
  `images` char(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `is_serfee_settle` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否经营类目服务（0否, 1是）',
  `settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '结算比例0~100的值',
  `settle_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '结算固定金额',
  `platform_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台扣除金额',
  `profit_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '收益金额',
  `cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `original_price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '原价',
  `price` decimal(30,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `total_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '当前总价(单价*数量)',
  `spec` text COMMENT '规格',
  `buy_number` int unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `inventory_unit` char(30) NOT NULL DEFAULT '' COMMENT '计量单位',
  `model` char(30) NOT NULL DEFAULT '' COMMENT '型号',
  `spec_weight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量（kg）',
  `spec_volume` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '体积（m³）',
  `spec_coding` char(80) NOT NULL DEFAULT '' COMMENT '编码',
  `spec_barcode` char(80) NOT NULL DEFAULT '' COMMENT '条形码',
  `refund_price` decimal(30,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `returned_quantity` int unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `system_order_id` (`system_order_id`),
  KEY `system_order_detail_id` (`system_order_detail_id`),
  KEY `system_goods_id` (`system_goods_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6787 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单详情 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_order_express`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_order_express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_order_express` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商id',
  `order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单用户id',
  `express_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '快递id',
  `express_number` char(60) NOT NULL DEFAULT '' COMMENT '快递单号',
  `note` char(255) NOT NULL DEFAULT '' COMMENT '备注',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `supplier_id` (`supplier_id`),
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单快递 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_order_extraction_code`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_order_extraction_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_order_extraction_code` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商id',
  `order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单用户id',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '取货码',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单自提取货码关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_order_fictitious_value`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_order_fictitious_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_order_fictitious_value` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商id',
  `order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_detail_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单详情id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单用户id',
  `value` text COMMENT '虚拟商品展示数据',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `order_id` (`order_id`),
  KEY `order_detail_id` (`order_detail_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单虚拟销售数据关联 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_order_profit`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_order_profit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_order_profit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `system_order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '系统订单id',
  `system_order_no` char(60) NOT NULL DEFAULT '' COMMENT '系统订单号',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商id',
  `order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单用户id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '结算状态（0待生效, 1生效中, 2待结算, 3已结算, 4已失效）',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `platform_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台扣除金额',
  `profit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收益金额',
  `settlement_time` int unsigned NOT NULL DEFAULT '0' COMMENT '结算时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `system_order_id` (`system_order_id`),
  KEY `system_order_no` (`system_order_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='收益明细 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_order_service`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_order_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_order_service` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单用户id',
  `service_name` char(80) NOT NULL DEFAULT '' COMMENT '服务人员姓名',
  `service_mobile` char(30) NOT NULL DEFAULT '' COMMENT '服务人员手机',
  `service_duration_minute` int unsigned NOT NULL DEFAULT '0' COMMENT '服务持续分钟',
  `service_start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '服务开始时间',
  `service_end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '服务结束时间',
  `note` char(255) NOT NULL DEFAULT '' COMMENT '备注',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单服务 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_order_status_history`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_order_status_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商id',
  `order_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `original_status` char(10) NOT NULL DEFAULT '' COMMENT '原始状态-值',
  `original_name` char(60) NOT NULL DEFAULT '' COMMENT '原始状态-名称',
  `new_status` char(10) NOT NULL DEFAULT '' COMMENT '最新状态-值',
  `new_name` char(60) NOT NULL DEFAULT '' COMMENT '最新状态-名称',
  `msg` text COMMENT '操作描述',
  `creator` int unsigned NOT NULL DEFAULT '0' COMMENT '创建-用户id',
  `creator_name` char(60) NOT NULL DEFAULT '' COMMENT '创建人-姓名',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `supplier_id` (`supplier_id`),
  KEY `order_id` (`order_id`),
  KEY `original_status` (`original_status`),
  KEY `new_status` (`new_status`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单状态历史记录 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_serfee`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_serfee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_serfee` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商id',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '类型（0服务费用，1订单抽成）',
  `fee_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '服务费用状态（0未缴，1已缴，2过期，3已退）',
  `fee_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '服务费用缴纳金额',
  `fee_expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '服务费用过期时间',
  `fee_pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '服务费用支付时间',
  `settle_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '订单抽成结算比例0~100的值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `type` (`type`),
  KEY `fee_status` (`fee_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='店铺服务费 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_staff`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_staff` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `position_id` int unsigned NOT NULL DEFAULT '0' COMMENT '职位id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待确认，1在职中，2暂休中，3已解聘）',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '员工编号',
  `alias` char(30) NOT NULL DEFAULT '' COMMENT '员工别名',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` char(60) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `avatar` char(255) NOT NULL DEFAULT '' COMMENT '员工头像地址',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `user_id` (`user_id`),
  KEY `position_id` (`position_id`),
  KEY `status` (`status`),
  KEY `code` (`code`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='供应商员工 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_staff_position`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_staff_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_staff_position` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `supplier_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `supplier_id` (`supplier_id`),
  KEY `name` (`name`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='员工职位 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_warehouse`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_warehouse` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '供应商店铺id',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='供应商仓库 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_warehouse_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_warehouse_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_warehouse_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `warehouse_id` int unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '总库存',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `goods_id` (`goods_id`),
  KEY `inventory` (`inventory`)
) ENGINE=InnoDB AUTO_INCREMENT=592 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='供应商仓库商品 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_supplier_warehouse_goods_spec`
--

DROP TABLE IF EXISTS `sxo_plugins_supplier_warehouse_goods_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_supplier_warehouse_goods_spec` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `warehouse_goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '仓库商品id',
  `warehouse_id` int unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `md5_key` char(32) NOT NULL DEFAULT '' COMMENT 'md5key值',
  `spec` text COMMENT '规格值',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `warehouse_goods_id` (`warehouse_goods_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `goods_id` (`goods_id`),
  KEY `md5_key` (`md5_key`),
  KEY `inventory` (`inventory`)
) ENGINE=InnoDB AUTO_INCREMENT=764 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='供应商仓库商品规格 - 供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_themestyle_config`
--

DROP TABLE IF EXISTS `sxo_plugins_themestyle_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_themestyle_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `config` longtext COMMENT '配置信息',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `is_default` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否默认（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='默认主题样式 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_thirdpartylogin_user`
--

DROP TABLE IF EXISTS `sxo_plugins_thirdpartylogin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_thirdpartylogin_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未绑定, 1已绑定, 2已解绑）',
  `platform` char(30) NOT NULL DEFAULT '' COMMENT '平台类型（ dingding 钉钉 、 weixin 微信 、 qq QQ  alipay 支付宝 、 sina 新浪 ）',
  `openid` char(60) NOT NULL DEFAULT '' COMMENT 'openid',
  `unionid` char(60) NOT NULL DEFAULT '' COMMENT 'unionid',
  `nickname` char(60) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` char(255) NOT NULL DEFAULT '' COMMENT '用户头像地址',
  `mobile` char(30) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` char(60) NOT NULL DEFAULT '' COMMENT '电子邮箱（最大长度60个字符）',
  `gender` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '性别（0保密，1女，2男）',
  `province` char(60) NOT NULL DEFAULT '' COMMENT '所在省',
  `city` char(60) NOT NULL DEFAULT '' COMMENT '所在市',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  KEY `platform` (`platform`),
  KEY `openid` (`openid`),
  KEY `unionid` (`unionid`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='关联用户 - 第三方登录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_usergoodslimit_label`
--

DROP TABLE IF EXISTS `sxo_plugins_usergoodslimit_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_usergoodslimit_label` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_label_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户标签id',
  `category_ids` text COMMENT '分类id',
  `brand_ids` text COMMENT '品牌id',
  `goods_label_ids` text COMMENT '商品标签id',
  `goods_ids` text COMMENT '商品id',
  `limit_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '限制类型（0仅可见，1不可见）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_label_id` (`user_label_id`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户商品限制 - 用户标签商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_usergoodslimit_level`
--

DROP TABLE IF EXISTS `sxo_plugins_usergoodslimit_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_usergoodslimit_level` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_level_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户等级id',
  `category_ids` text COMMENT '分类id',
  `brand_ids` text COMMENT '品牌id',
  `goods_label_ids` text COMMENT '商品标签id',
  `goods_ids` text COMMENT '商品id',
  `limit_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '限制类型（0仅可见，1不可见）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_level_id` (`user_level_id`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户商品限制 - 用户等级商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_usergoodslimit_user`
--

DROP TABLE IF EXISTS `sxo_plugins_usergoodslimit_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_usergoodslimit_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `category_ids` text COMMENT '分类id',
  `brand_ids` text COMMENT '品牌id',
  `goods_label_ids` text COMMENT '商品标签id',
  `goods_ids` text COMMENT '商品id',
  `limit_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '限制类型（0仅可见，1不可见）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户商品限制 - 用户商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_wallet`
--

DROP TABLE IF EXISTS `sxo_plugins_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_wallet` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0正常, 1异常, 2已注销）',
  `normal_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '有效金额（包含赠送金额）',
  `frozen_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '冻结金额',
  `give_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '赠送金额（所有赠送金额总计）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`) USING BTREE,
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4796 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='钱包 - 钱包';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_wallet_cash`
--

DROP TABLE IF EXISTS `sxo_plugins_wallet_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_wallet_cash` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `wallet_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '钱包id',
  `cash_no` char(60) NOT NULL DEFAULT '' COMMENT '提现单号',
  `cash_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '提现方式（0其他方式, 1微信, 2支付宝）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未打款, 1已打款, 2打款失败）',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `commission` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `pay_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '打款金额',
  `bank_name` char(60) NOT NULL DEFAULT '' COMMENT '收款平台',
  `bank_accounts` char(60) NOT NULL DEFAULT '' COMMENT '收款账号',
  `bank_username` char(60) NOT NULL DEFAULT '' COMMENT '开户人姓名',
  `accounts_other_type` char(60) NOT NULL DEFAULT '' COMMENT '账号其他类型（比如 web，mini）',
  `msg` char(200) NOT NULL DEFAULT '' COMMENT '描述（用户可见）',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '打款时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cash_no` (`cash_no`),
  KEY `cash_type` (`cash_type`),
  KEY `status` (`status`),
  KEY `user_id` (`user_id`),
  KEY `wallet_id` (`wallet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='钱包提现 - 钱包';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_wallet_cash_payment`
--

DROP TABLE IF EXISTS `sxo_plugins_wallet_cash_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_wallet_cash_payment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `wallet_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '钱包id',
  `cash_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '提现id',
  `cash_no` char(60) NOT NULL DEFAULT '' COMMENT '提现单号',
  `pay_no` char(60) NOT NULL DEFAULT '' COMMENT '支付单号',
  `pay_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '付款方式（0微信, 1支付宝）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待处理, 1已支付, 2已失败, 3已关闭）',
  `reason` text COMMENT '请求失败原因',
  `out_order_no` char(160) NOT NULL DEFAULT '' COMMENT '外部订单号',
  `request_params` mediumtext COMMENT '请求参数（数组则json字符串存储）',
  `response_data` mediumtext COMMENT '响应参数（数组则json字符串存储）',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `wallet_id` (`wallet_id`),
  KEY `cash_id` (`cash_id`),
  KEY `cash_no` (`cash_no`),
  KEY `pay_type` (`pay_type`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='钱包提现支付 - 钱包';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_wallet_log`
--

DROP TABLE IF EXISTS `sxo_plugins_wallet_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_wallet_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `wallet_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '钱包id',
  `business_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '业务类型（0系统, 1充值, 2提现, 3消费, 4转账）',
  `money_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '金额类型（0正常, 1冻结, 2赠送）',
  `operation_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '操作类型（ 0减少, 1增加）',
  `operation_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '操作金额',
  `original_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原始金额',
  `latest_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最新金额',
  `msg` char(200) NOT NULL DEFAULT '' COMMENT '变更说明',
  `operate_id` int unsigned NOT NULL DEFAULT '0' COMMENT '操作人id',
  `operate_name` char(30) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `wallet_id` (`wallet_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='钱包日志 - 钱包';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_wallet_payment_code`
--

DROP TABLE IF EXISTS `sxo_plugins_wallet_payment_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_wallet_payment_code` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `wallet_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '钱包id',
  `code` char(30) NOT NULL DEFAULT '' COMMENT '付款码',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `wallet_id` (`wallet_id`),
  KEY `user_id` (`user_id`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=1086 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='付款码 - 钱包';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_wallet_recharge`
--

DROP TABLE IF EXISTS `sxo_plugins_wallet_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_wallet_recharge` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `wallet_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '钱包id',
  `recharge_no` char(60) NOT NULL DEFAULT '' COMMENT '充值单号',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未支付, 1已支付）',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '金额',
  `pay_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `payment_id` int unsigned NOT NULL DEFAULT '0' COMMENT '支付方式id',
  `payment` char(60) NOT NULL DEFAULT '' COMMENT '支付方式标记',
  `payment_name` char(60) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `operate_id` int unsigned NOT NULL DEFAULT '0' COMMENT '操作人id',
  `operate_name` char(30) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `recharge_no` (`recharge_no`),
  KEY `status` (`status`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='钱包充值 - 钱包';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_wallet_transfer`
--

DROP TABLE IF EXISTS `sxo_plugins_wallet_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_wallet_transfer` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `transfer_no` char(60) NOT NULL DEFAULT '' COMMENT '转账单号',
  `send_user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '发起用户id',
  `send_wallet_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '发起钱包id',
  `receive_user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '接收用户id',
  `receive_wallet_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '接收钱包id',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '金额',
  `note` char(230) NOT NULL DEFAULT '' COMMENT '备注',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `transfer_no` (`transfer_no`),
  KEY `send_user_id` (`send_user_id`),
  KEY `send_wallet_id` (`send_wallet_id`),
  KEY `receive_user_id` (`receive_user_id`),
  KEY `receive_wallet_id` (`receive_wallet_id`),
  KEY `money` (`money`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='转账记录 - 钱包';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_weixinliveplayer_list`
--

DROP TABLE IF EXISTS `sxo_plugins_weixinliveplayer_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_weixinliveplayer_list` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `system_type` char(60) NOT NULL DEFAULT 'default' COMMENT '系统类型（默认 default, 其他按照SYSTEM_TYPE常量类型）',
  `name` char(230) NOT NULL DEFAULT '' COMMENT '房间名',
  `roomid` int unsigned NOT NULL DEFAULT '0' COMMENT '房间id',
  `cover_img_old` char(250) NOT NULL DEFAULT '' COMMENT '封面图片url-微信',
  `cover_img` char(250) NOT NULL DEFAULT '' COMMENT '封面图片url',
  `share_img_old` char(250) NOT NULL DEFAULT '' COMMENT '分享图片url-微信',
  `share_img` char(250) NOT NULL DEFAULT '' COMMENT '分享图片url',
  `start_time` int unsigned NOT NULL COMMENT '直播计划开始时间',
  `end_time` int unsigned NOT NULL COMMENT '直播计划结束时间',
  `anchor_img_old` char(250) NOT NULL DEFAULT '' COMMENT '主播头像url-微信',
  `anchor_img` char(250) NOT NULL DEFAULT '' COMMENT '主播头像url',
  `anchor_name` char(130) NOT NULL DEFAULT '' COMMENT '主播名',
  `live_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '直播状态 101: 直播中, 102: 未开始, 103: 已结束, 104: 禁播, 105: 暂停中, 106: 异常, 107: 已过期（直播状态解释可参考【获取直播状态】接口）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '直播状态（0未开始、1直播中、2暂停中、3已结束、4已过期、5禁播、6异常）',
  `qrcode_images` char(250) NOT NULL DEFAULT '' COMMENT '小程序码',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `system_type` (`system_type`),
  KEY `roomid` (`roomid`),
  KEY `live_status` (`live_status`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='直播列表 - 微信小程序直播';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_weixinliveplayer_list_goods`
--

DROP TABLE IF EXISTS `sxo_plugins_weixinliveplayer_list_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_weixinliveplayer_list_goods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `list_id` int unsigned NOT NULL DEFAULT '0' COMMENT '直播列表id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `name` char(230) NOT NULL DEFAULT '' COMMENT '商品名称',
  `cover_img_old` char(250) NOT NULL DEFAULT '' COMMENT '商品图片url-微信',
  `cover_img` char(250) NOT NULL DEFAULT '' COMMENT '商品图片url',
  `url` char(255) NOT NULL DEFAULT '' COMMENT 'url地址',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `price2` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格2',
  `price_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '价格类型（1一口价，2价格区间，3显示折扣价）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `list_id` (`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='直播列表商品 - 微信小程序直播';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_weixinliveplayer_list_log`
--

DROP TABLE IF EXISTS `sxo_plugins_weixinliveplayer_list_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_weixinliveplayer_list_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `system_type` char(60) NOT NULL DEFAULT 'default' COMMENT '系统类型（默认 default, 其他按照SYSTEM_TYPE常量类型）',
  `ymd` int unsigned NOT NULL DEFAULT '0' COMMENT '当天日期',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待请求, 1成功, 2失败）',
  `msg` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `params` text COMMENT '请求参数',
  `response` mediumtext COMMENT '返回内容',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `system_type` (`system_type`),
  KEY `ymd` (`ymd`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='直播列表日志 - 微信小程序直播';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_weixinliveplayer_list_replay`
--

DROP TABLE IF EXISTS `sxo_plugins_weixinliveplayer_list_replay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_weixinliveplayer_list_replay` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `list_id` int unsigned NOT NULL DEFAULT '0' COMMENT '直播列表id',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '过期时间-微信',
  `create_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间-微信',
  `media_url` char(250) NOT NULL DEFAULT '' COMMENT '视频url-微信',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `list_id` (`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='直播列表回放视频 - 微信小程序直播';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_weixinliveplayer_slide`
--

DROP TABLE IF EXISTS `sxo_plugins_weixinliveplayer_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_weixinliveplayer_slide` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `system_type` char(60) NOT NULL DEFAULT 'default' COMMENT '系统类型（默认 default, 其他按照SYSTEM_TYPE常量类型）',
  `platform` char(30) NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序）',
  `event_type` tinyint NOT NULL DEFAULT '-1' COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` char(255) NOT NULL DEFAULT '' COMMENT '事件值',
  `images_url` char(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '别名',
  `bg_color` char(30) NOT NULL DEFAULT '' COMMENT 'css背景色值',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `system_type` (`system_type`),
  KEY `is_enable` (`is_enable`),
  KEY `sort` (`sort`),
  KEY `platform` (`platform`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='轮播图片 - 微信小程序直播';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_wholesale_goods_rules`
--

DROP TABLE IF EXISTS `sxo_plugins_wholesale_goods_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_wholesale_goods_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `alone_newbuy` text COMMENT '新购独立配置（原始内容换行存储）',
  `alone_repurchase` text COMMENT '复购独立配置（原始内容换行存储）',
  `template_newbuy` text COMMENT '模板新购配置（json存储）',
  `template_repurchase` text COMMENT '模板复购配置（json存储）',
  `is_not_participate` int unsigned NOT NULL DEFAULT '0' COMMENT '是否参与批发（0是、1否）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1343 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='批发 - 商品规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_yxformplus_field`
--

DROP TABLE IF EXISTS `sxo_plugins_yxformplus_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_yxformplus_field` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '字段名字',
  `type` int unsigned NOT NULL DEFAULT '0' COMMENT '字段类型，大于1',
  `sid` int unsigned NOT NULL DEFAULT '0' COMMENT '所属表单',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '字段描述',
  `is_must` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否必填',
  `tishi_text` varchar(255) NOT NULL DEFAULT '' COMMENT '输入框内提示文字',
  `moren` varchar(255) NOT NULL DEFAULT '' COMMENT '默认值',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用',
  `is_allow` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否允许下单后编辑此字段',
  `content` longtext NOT NULL COMMENT '配置',
  `scene` varchar(255) NOT NULL DEFAULT '',
  `add_time` int unsigned NOT NULL DEFAULT '0',
  `upd_time` int unsigned NOT NULL DEFAULT '0',
  `xu` int unsigned NOT NULL DEFAULT '0' COMMENT '排序，越大越靠前',
  `minlength` int unsigned NOT NULL DEFAULT '0',
  `maxlength` int unsigned NOT NULL DEFAULT '0',
  `rows` int unsigned NOT NULL DEFAULT '0',
  `max_num` int unsigned NOT NULL DEFAULT '0',
  `file_type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='表格自定义字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_yxformplus_goods_data`
--

DROP TABLE IF EXISTS `sxo_plugins_yxformplus_goods_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_yxformplus_goods_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `form_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品表单id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `spec` text,
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `title` char(60) NOT NULL DEFAULT '' COMMENT '标题',
  `field_id` int unsigned NOT NULL DEFAULT '0' COMMENT '字段ID',
  `type_id` int unsigned NOT NULL DEFAULT '0',
  `content` longtext COMMENT '数据值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `temp_user_id` varchar(100) NOT NULL DEFAULT '' COMMENT '未登录前的临时会员ID，一般由IP转化为数字而来',
  `about_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='下单商品表单关联商品数据 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_yxformplus_jilian`
--

DROP TABLE IF EXISTS `sxo_plugins_yxformplus_jilian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_yxformplus_jilian` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `level` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '级别类型（1:一级[所有省], 2：二级[所有市], 3:三级[所有区县], 4:街道[所有街道]）',
  `letters` char(3) NOT NULL DEFAULT '' COMMENT '城市首字母',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `form_id` int unsigned NOT NULL DEFAULT '0' COMMENT '所属表单ID',
  `field_id` int unsigned NOT NULL DEFAULT '0' COMMENT '所属字段ID',
  `code` varchar(30) NOT NULL DEFAULT '' COMMENT '编码',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `sort` (`sort`),
  KEY `form_id` (`form_id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='表单级联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_yxformplus_list`
--

DROP TABLE IF EXISTS `sxo_plugins_yxformplus_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_yxformplus_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '表单名字',
  `scene` varchar(255) NOT NULL DEFAULT '' COMMENT '适用场景值',
  `icon` char(255) NOT NULL DEFAULT '' COMMENT 'icon图标',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `is_single_login` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否强制登录才能提交（0否，1是）',
  `field_num` int unsigned NOT NULL DEFAULT '0' COMMENT '字段数量',
  `is_all_goods` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否默认关联所有商品',
  `is_single_uni_order` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '独立表单是否关联订单',
  `goods_ids` longtext,
  `description` text COMMENT '表单介绍',
  `num` int unsigned NOT NULL DEFAULT '0' COMMENT '表单可提交次数',
  `goods_count` int unsigned NOT NULL DEFAULT '0',
  `seo_title` char(100) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` char(130) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `seo_desc` char(230) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `add_time` int unsigned NOT NULL DEFAULT '0',
  `upd_time` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='表单列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_yxformplus_order_data`
--

DROP TABLE IF EXISTS `sxo_plugins_yxformplus_order_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_yxformplus_order_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `form_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品表单id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `field_id` int unsigned NOT NULL DEFAULT '0',
  `type_id` int unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL DEFAULT '' COMMENT '标题',
  `content` longtext COMMENT '数据值',
  `content_value` text NOT NULL COMMENT '有些content存储后需要翻译下，直接存储于此，免得字段预设发生改变',
  `file_type` varchar(200) NOT NULL DEFAULT '' COMMENT '若为附件，则记录附件类型',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `edit_num` int unsigned NOT NULL DEFAULT '0' COMMENT '该条数据编辑次数',
  `field_base` text COMMENT '字段基础数据，保存下来，以免后期对应字段发生变化，或改或删',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='下单商品表单关联订单数据 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_yxformplus_single_data`
--

DROP TABLE IF EXISTS `sxo_plugins_yxformplus_single_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_yxformplus_single_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `form_id` int unsigned NOT NULL DEFAULT '0' COMMENT '表单id',
  `xu_id` int unsigned NOT NULL DEFAULT '0' COMMENT '计数器，也是某次提交的统一标识，当前用户当前表单提交几次数据了',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `field_id` int unsigned NOT NULL DEFAULT '0',
  `type_id` int unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL DEFAULT '' COMMENT '标题',
  `content` longtext COMMENT '数据值',
  `content_value` text NOT NULL COMMENT '有些content存储后需要翻译下，直接存储于此，免得字段预设发生改变',
  `file_type` varchar(200) NOT NULL DEFAULT '' COMMENT '若为附件，则记录附件类型',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `edit_num` int unsigned NOT NULL DEFAULT '0' COMMENT '该条数据编辑次数',
  `field_base` text COMMENT '字段基础数据，保存下来，以免后期对应字段发生变化，或改或删',
  `is_head` tinyint unsigned NOT NULL DEFAULT '0',
  `temp_user_id` varchar(100) NOT NULL DEFAULT '' COMMENT '临时用户ID',
  PRIMARY KEY (`id`),
  KEY `is_head` (`is_head`),
  KEY `form_id` (`form_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='下单商品表单关联订单数据 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_plugins_yxformplus_single_temp`
--

DROP TABLE IF EXISTS `sxo_plugins_yxformplus_single_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_plugins_yxformplus_single_temp` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `form_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品表单id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `spec` text,
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `title` char(60) NOT NULL DEFAULT '' COMMENT '标题',
  `field_id` int unsigned NOT NULL DEFAULT '0' COMMENT '字段ID',
  `type_id` int unsigned NOT NULL DEFAULT '0',
  `content` longtext COMMENT '数据值',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `temp_user_id` varchar(100) NOT NULL DEFAULT '' COMMENT '未登录前的临时会员ID，一般由IP转化为数字而来',
  `about_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='下单商品表单关联商品数据 - 应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_power`
--

DROP TABLE IF EXISTS `sxo_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_power` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '权限父级id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '权限名称',
  `control` char(30) NOT NULL DEFAULT '' COMMENT '控制器名称',
  `action` char(30) NOT NULL DEFAULT '' COMMENT '方法名称',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '自定义url地址',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否显示（0否，1是）',
  `icon` char(60) NOT NULL DEFAULT '' COMMENT '图标class',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=665 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_quick_nav`
--

DROP TABLE IF EXISTS `sxo_quick_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_quick_nav` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `event_type` tinyint NOT NULL DEFAULT '-1' COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '事件值',
  `images_url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `bg_color` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'css背景色值',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='快捷导航';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_refund_log`
--

DROP TABLE IF EXISTS `sxo_refund_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_refund_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '退款日志id',
  `pay_id` int unsigned NOT NULL DEFAULT '0' COMMENT '支付id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `business_id` int unsigned NOT NULL DEFAULT '0' COMMENT '业务订单id',
  `business_type` char(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '业务类型，字符串（如：订单、钱包充值、会员购买、等...）',
  `trade_no` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付平台交易号',
  `buyer_user` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付平台用户帐号',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单实际支付金额',
  `msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '描述',
  `payment` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付方式标记',
  `payment_name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `refundment` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '退款类型（0原路退回, 1退至钱包, 2手动处理）',
  `request_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '请求参数（数组则json字符串存储）',
  `return_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '支付平台返回参数（以json存储）',
  `add_time` int unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `payment` (`payment`) USING BTREE,
  KEY `business_id` (`business_id`) USING BTREE,
  KEY `business_type` (`business_type`) USING BTREE,
  KEY `pay_id` (`pay_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='退款日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_region`
--

DROP TABLE IF EXISTS `sxo_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_region` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `level` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '级别类型（1:一级[所有省], 2：二级[所有市], 3:三级[所有区县], 4:街道[所有街道]）',
  `letters` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市首字母',
  `code` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '编码',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '纬度',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `level` (`level`) USING BTREE,
  KEY `letters` (`letters`) USING BTREE,
  KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3448 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='地区';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_role`
--

DROP TABLE IF EXISTS `sxo_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '角色组id',
  `name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_role_plugins`
--

DROP TABLE IF EXISTS `sxo_role_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_role_plugins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '关联id',
  `role_id` int unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `plugins` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '唯一标记',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `plugins` (`plugins`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=863 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色与权限插件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_role_power`
--

DROP TABLE IF EXISTS `sxo_role_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_role_power` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '关联id',
  `role_id` int unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `power_id` int unsigned NOT NULL DEFAULT '0' COMMENT '权限id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `power_id` (`power_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6548 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色与权限管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_screening_price`
--

DROP TABLE IF EXISTS `sxo_screening_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_screening_price` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `min_price` int unsigned NOT NULL DEFAULT '0' COMMENT '最小价格',
  `max_price` int unsigned NOT NULL DEFAULT '0' COMMENT '最大价格',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='筛选价格';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_search_history`
--

DROP TABLE IF EXISTS `sxo_search_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_search_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `brand_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '品牌id（json存储）',
  `category_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '商品分类id（json存储）',
  `keywords` char(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '搜索关键字',
  `screening_price_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '价格区间（json存储）',
  `goods_params_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '商品参数/属性（json存储）',
  `goods_spec_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '商品规格（json存储）',
  `order_by_field` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '排序类型（字段名称）',
  `order_by_type` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '排序方式（asc, desc）',
  `search_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '搜索结果（json存储）',
  `ymd` int unsigned NOT NULL DEFAULT '0' COMMENT '日期 ymd',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='搜索日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_shortcut_menu`
--

DROP TABLE IF EXISTS `sxo_shortcut_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_shortcut_menu` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `icon` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'icon图标',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `menu` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限菜单',
  `url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `menu` (`menu`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='常用功能菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_slide`
--

DROP TABLE IF EXISTS `sxo_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_slide` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `event_type` tinyint NOT NULL DEFAULT '-1' COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '事件值',
  `images_url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `describe` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `bg_color` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'css背景色值',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='轮播图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_sms_log`
--

DROP TABLE IF EXISTS `sxo_sms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_sms_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '短信平台（aliyun 阿里云、等等...）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未发送，1已发送，2已失败）',
  `mobile` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `sign_name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '短信签名',
  `template_value` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '短信模板',
  `template_var` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '短信模板变量（数组则json字符串存储）',
  `request_url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '请求接口地址',
  `request_params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '请求参数（数组则json字符串存储）',
  `response_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '响应参数（数组则json字符串存储）',
  `reason` text COLLATE utf8mb4_general_ci COMMENT '失败原因',
  `tsc` int unsigned NOT NULL DEFAULT '0' COMMENT '耗时时间（单位秒）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `platform` (`platform`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE,
  KEY `tsc` (`tsc`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1487 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='短信日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_theme_data`
--

DROP TABLE IF EXISTS `sxo_theme_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_theme_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `unique` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '唯一标识',
  `theme` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '主题',
  `view` tinyint NOT NULL DEFAULT '-1' COMMENT '页面（0首页、1商品搜索、2商品分类、3商品详情、4文章分类、5文章详情、6确认订单、7用户登录、8用户注册、9用户密码找回、10用户中心）',
  `name` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '数据类型（0单图文、1多图文、2视频、3商品、4文章、5商品组、6文章组）',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '数据内容',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `unique` (`unique`) USING BTREE,
  KEY `theme` (`theme`) USING BTREE,
  KEY `view` (`view`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='主题数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_user`
--

DROP TABLE IF EXISTS `sxo_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `number_code` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员码',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0正常, 1禁止发言, 2禁止登录）',
  `salt` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配合密码加密串',
  `pwd` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录密码',
  `username` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `mobile` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '电子邮箱（最大长度60个字符）',
  `gender` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '性别（0保密，1女，2男）',
  `avatar` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像地址',
  `province` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所在省',
  `city` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所在市',
  `county` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所在市',
  `birthday` int NOT NULL DEFAULT '0' COMMENT '生日',
  `address` char(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `integral` int NOT NULL DEFAULT '0' COMMENT '有效积分',
  `locking_integral` int NOT NULL DEFAULT '0' COMMENT '锁定积分',
  `referrer` int unsigned NOT NULL DEFAULT '0' COMMENT '推荐人用户id',
  `plugins_distribution_level` int unsigned NOT NULL DEFAULT '0' COMMENT '用户分销等级（手动指定）',
  `plugins_distribution_auto_level` int unsigned NOT NULL DEFAULT '0' COMMENT '用户分销等级（自动匹配）',
  `plugins_user_level` int unsigned NOT NULL DEFAULT '0' COMMENT '会员等级增强版（手动指定）',
  `plugins_user_auto_level` int unsigned NOT NULL DEFAULT '0' COMMENT '会员等级增强版（自动匹配）',
  `is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '是否已删除（0否, 大于0删除时间）',
  `is_logout_time` int unsigned NOT NULL DEFAULT '0' COMMENT '是否已注销（0否, 大于0删除时间）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `truename` varchar(30) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `idcard_front` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证正面',
  `idcard_back` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证反面',
  `is_renzheng` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '是否实名认证,-1未提交，0待审核，1拒绝，2通过',
  `idcard_number` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证号',
  `admin_note` text COLLATE utf8mb4_general_ci COMMENT '审核拒绝理由',
  `rzadd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '认证提交时间',
  `rzudp_time` int unsigned NOT NULL DEFAULT '0' COMMENT '认证审核时间',
  `com_images` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手持身份证照片',
  `rz_level` int unsigned NOT NULL DEFAULT '0' COMMENT '欲认证的分销等级',
  `rz_referrer` int unsigned NOT NULL DEFAULT '0' COMMENT '填写的推荐人',
  `company_id` int unsigned NOT NULL DEFAULT '0',
  `classinfo_shop_id` int unsigned NOT NULL DEFAULT '0',
  `webstore_id` int unsigned NOT NULL DEFAULT '0',
  `free_num` char(230) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '当前月已发布的免费条数',
  `is_baozhengjin` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_delete_time` (`is_delete_time`) USING BTREE,
  KEY `is_logout_time` (`is_logout_time`) USING BTREE,
  KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4797 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_user_address`
--

DROP TABLE IF EXISTS `sxo_user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_user_address` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '站点id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `alias` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '别名',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `tel` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '电话',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '所在省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '所在市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '所在县/区',
  `address` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `address_last_code` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址最后一级编码',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '纬度',
  `idcard_name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `idcard_number` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证号码',
  `idcard_front` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证人像面图片',
  `idcard_back` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证国微面图片',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否默认地址（0否, 1是）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_user_integral_log`
--

DROP TABLE IF EXISTS `sxo_user_integral_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_user_integral_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '操作类型（0减少, 1增加）',
  `original_integral` int NOT NULL DEFAULT '0' COMMENT '原始积分',
  `new_integral` int NOT NULL DEFAULT '0' COMMENT '最新积分',
  `operation_integral` int unsigned NOT NULL DEFAULT '0' COMMENT '操作积分',
  `msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '操作原因',
  `operation_id` int unsigned NOT NULL DEFAULT '0' COMMENT '操作人员id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户积分日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_user_platform`
--

DROP TABLE IF EXISTS `sxo_user_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_user_platform` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `system_type` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '系统类型（默认 default, 其他按照SYSTEM_TYPE常量类型）',
  `platform` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pc' COMMENT '所属平台（pc PC网站, h5 H5手机网站, ios 苹果APP, android 安卓APP, alipay 支付宝小程序, weixin 微信小程序, baidu 百度小程序, toutiao 头条小程序, qq QQ小程序, kuaishou 快手小程序）',
  `token` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'token',
  `alipay_openid` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付宝openid',
  `weixin_openid` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信openid',
  `weixin_unionid` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信unionid',
  `weixin_web_openid` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信web用户openid',
  `baidu_openid` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '百度openid',
  `toutiao_openid` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '百度openid',
  `toutiao_unionid` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头条unionid',
  `qq_openid` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'QQopenid',
  `qq_unionid` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'QQunionid',
  `kuaishou_openid` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '快手openid',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `system_type` (`system_type`) USING BTREE,
  KEY `platform` (`platform`) USING BTREE,
  KEY `token` (`token`) USING BTREE,
  KEY `alipay_openid` (`alipay_openid`) USING BTREE,
  KEY `weixin_openid` (`weixin_openid`) USING BTREE,
  KEY `weixin_unionid` (`weixin_unionid`) USING BTREE,
  KEY `weixin_web_openid` (`weixin_web_openid`) USING BTREE,
  KEY `baidu_openid` (`baidu_openid`) USING BTREE,
  KEY `toutiao_openid` (`toutiao_openid`) USING BTREE,
  KEY `toutiao_unionid` (`toutiao_unionid`) USING BTREE,
  KEY `qq_openid` (`qq_openid`) USING BTREE,
  KEY `qq_unionid` (`qq_unionid`) USING BTREE,
  KEY `kuaishou_openid` (`kuaishou_openid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4907 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户平台';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_warehouse`
--

DROP TABLE IF EXISTS `sxo_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_warehouse` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `realstore_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `alias` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '别名',
  `level` int unsigned NOT NULL DEFAULT '0' COMMENT '权重（数字越大权重越高）',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `contacts_name` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `contacts_tel` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '所在省',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '所在市',
  `county` int unsigned NOT NULL DEFAULT '0' COMMENT '所在县/区',
  `address` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `lng` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '经度',
  `lat` decimal(13,10) NOT NULL DEFAULT '0.0000000000' COMMENT '纬度',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否默认（0否, 1是）',
  `is_delete_time` int unsigned NOT NULL DEFAULT '0' COMMENT '是否删除（0否，大于0删除时间戳）',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `company_id` int unsigned NOT NULL DEFAULT '0' COMMENT '对应公司ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `level` (`level`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `is_default` (`is_default`) USING BTREE,
  KEY `is_delete_time` (`is_delete_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='仓库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_warehouse_goods`
--

DROP TABLE IF EXISTS `sxo_warehouse_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_warehouse_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `warehouse_id` int unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `is_enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '总库存',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `upd_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `warehouse_id` (`warehouse_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `inventory` (`inventory`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=466378 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='仓库商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sxo_warehouse_goods_spec`
--

DROP TABLE IF EXISTS `sxo_warehouse_goods_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sxo_warehouse_goods_spec` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `warehouse_goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '仓库商品id',
  `warehouse_id` int unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `md5_key` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'md5key值',
  `spec` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '规格值',
  `inventory` int unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `zq_Attribute` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `zq_OtherInfo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `warehouse_goods_id` (`warehouse_goods_id`) USING BTREE,
  KEY `warehouse_id` (`warehouse_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `md5_key` (`md5_key`) USING BTREE,
  KEY `inventory` (`inventory`) USING BTREE,
  KEY `zq_Attribute` (`zq_Attribute`),
  KEY `zq_OtherInfo` (`zq_OtherInfo`)
) ENGINE=InnoDB AUTO_INCREMENT=503627 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='仓库商品规格';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'sql287102'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-19 16:46:51
