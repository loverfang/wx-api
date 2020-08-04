/*
Navicat MySQL Data Transfer

Source Server         : 虚拟机18
Source Server Version : 50729
Source Host           : 192.168.133.18:3306
Source Database       : wx

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2020-08-04 08:16:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '1' COMMENT '文章类型',
  `title` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `summary` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章摘要',
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章标签',
  `content` longtext COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `category` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分类',
  `sub_category` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '二级目录',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `open_count` int(11) DEFAULT '0' COMMENT '点击次数',
  `target_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '指向外链',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文章首图',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_title` (`title`) USING BTREE COMMENT '标题不得重复'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CMS文章中心';

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for cms_channel
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel`;
CREATE TABLE `cms_channel` (
  `channel_id` bigint(64) NOT NULL,
  `channel_name` varchar(100) NOT NULL COMMENT '栏目名称',
  `model_id` bigint(11) NOT NULL COMMENT '模型ID',
  `parent_id` bigint(11) DEFAULT NULL COMMENT '父栏目ID',
  `channel_path` varchar(50) DEFAULT NULL COMMENT '访问路径',
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `status` int(11) DEFAULT NULL,
  `is_display` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示(0：否，1：是)',
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_channel
-- ----------------------------
INSERT INTO `cms_channel` VALUES ('1', '网站跟栏目', '2', '-1', null, '0', '1', '1');
INSERT INTO `cms_channel` VALUES ('740110090014556200', '关于贯中', '2', '1', '/baidu.com', '1', '1', '1');

-- ----------------------------
-- Table structure for cms_channel_banner
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel_banner`;
CREATE TABLE `cms_channel_banner` (
  `channel_id` bigint(64) NOT NULL,
  `path` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `priority` int(11) DEFAULT NULL COMMENT '展示顺序',
  `link` varchar(255) DEFAULT NULL COMMENT '跳转路径'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_channel_banner
-- ----------------------------

-- ----------------------------
-- Table structure for cms_channel_ext
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel_ext`;
CREATE TABLE `cms_channel_ext` (
  `channel_id` bigint(64) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT 'TITLE',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'KEYWORDS',
  `description` varchar(255) DEFAULT NULL COMMENT 'DESCRIPTION',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `channel_pc_path` varchar(255) DEFAULT NULL COMMENT '栏目页(页面)',
  `channel_pc_content_path` varchar(255) DEFAULT NULL COMMENT '内容页(页面)',
  `channel_mobile_path` varchar(255) DEFAULT NULL COMMENT '手机栏目页(页面)',
  `channel_mobile_content_path` varchar(255) DEFAULT NULL COMMENT '手机内容页(页面)',
  `is_blank` varchar(255) DEFAULT NULL COMMENT '是否新窗口打开',
  `allow_share` int(11) DEFAULT NULL,
  `allow_score` int(11) DEFAULT '0' COMMENT '评分(1:开放;0:关闭,默认0)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_channel_ext
-- ----------------------------
INSERT INTO `cms_channel_ext` VALUES ('740108797636247552', null, null, null, null, null, null, null, null, null, '0', '0');
INSERT INTO `cms_channel_ext` VALUES ('740110090014556160', null, null, null, null, null, null, null, null, null, '0', '0');

-- ----------------------------
-- Table structure for cms_channel_txt
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel_txt`;
CREATE TABLE `cms_channel_txt` (
  `channel_id` bigint(64) NOT NULL,
  `txt` longtext,
  `txt1` longtext,
  `txt2` longtext,
  `txt3` longtext,
  `txt4` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_channel_txt
-- ----------------------------
INSERT INTO `cms_channel_txt` VALUES ('740108797636247552', null, null, null, null, null);
INSERT INTO `cms_channel_txt` VALUES ('740110090014556200', '惺惺惜惺惺', null, null, null, null);

-- ----------------------------
-- Table structure for cms_content
-- ----------------------------
DROP TABLE IF EXISTS `cms_content`;
CREATE TABLE `cms_content` (
  `content_id` varchar(64) NOT NULL,
  `channel_id` varchar(64) NOT NULL,
  `type_id` int(11) DEFAULT NULL COMMENT '文章类别(除栏目以外的另一种类别)',
  `top_level` int(11) DEFAULT NULL COMMENT '置顶级别',
  `has_title_img` int(11) DEFAULT NULL COMMENT '是否有标题图片（0:否，1:是,默认0）',
  `is_recommend` int(11) DEFAULT '0' COMMENT '是否推荐(0:不推荐，1：推荐，默认0)',
  `status` int(11) DEFAULT '2' COMMENT '状态(0:草稿;1:审核中;2:审核通过;3:回收站；4:投稿，默认2)',
  `views_day` int(11) DEFAULT NULL COMMENT '日观看量',
  `comments_day` int(11) DEFAULT NULL COMMENT '日评论量',
  `downloads_day` int(11) DEFAULT NULL COMMENT '日下载量',
  `ups_day` int(11) DEFAULT NULL COMMENT '日顶量',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_content
-- ----------------------------

-- ----------------------------
-- Table structure for cms_content_attachment
-- ----------------------------
DROP TABLE IF EXISTS `cms_content_attachment`;
CREATE TABLE `cms_content_attachment` (
  `content_id` varchar(64) DEFAULT NULL,
  `priority` int(255) DEFAULT NULL COMMENT '显示顺序',
  `attach_path` varchar(200) DEFAULT NULL COMMENT '附件地址',
  `attach_name` varchar(200) DEFAULT NULL COMMENT '附件名称',
  `attach_size` double DEFAULT NULL COMMENT '附件大小(单位kb)',
  `download_count` int(11) DEFAULT NULL COMMENT '下载次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_content_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_content_ext
-- ----------------------------
DROP TABLE IF EXISTS `cms_content_ext`;
CREATE TABLE `cms_content_ext` (
  `content_id` varchar(64) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL COMMENT '标题',
  `short_ttitle` varchar(150) DEFAULT NULL COMMENT '短标题(副标题)',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `origin` varchar(100) DEFAULT NULL COMMENT '来源',
  `origin_url` varchar(255) DEFAULT NULL COMMENT '来源链接',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `media_type` varchar(255) DEFAULT NULL COMMENT '媒体类型',
  `media_path` varchar(255) DEFAULT NULL COMMENT '媒体路径',
  `title_img` varchar(255) DEFAULT NULL COMMENT '标题图片',
  `content_img` varchar(255) DEFAULT NULL COMMENT '内容图片',
  `link` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `tpl_content` varchar(255) DEFAULT NULL COMMENT '模板路径',
  `release_date` datetime DEFAULT NULL COMMENT '发布时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_content_ext
-- ----------------------------

-- ----------------------------
-- Table structure for cms_content_picture
-- ----------------------------
DROP TABLE IF EXISTS `cms_content_picture`;
CREATE TABLE `cms_content_picture` (
  `content_id` varchar(64) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL COMMENT '显示顺序',
  `img_path` varchar(200) DEFAULT NULL COMMENT '图片地址',
  `description` varchar(255) DEFAULT NULL COMMENT '图片描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_content_picture
-- ----------------------------

-- ----------------------------
-- Table structure for cms_model
-- ----------------------------
DROP TABLE IF EXISTS `cms_model`;
CREATE TABLE `cms_model` (
  `model_id` varchar(64) NOT NULL COMMENT '模型ID',
  `model_name` varchar(50) NOT NULL COMMENT '模型名称,如新闻，视频，图片，单页等',
  `model_path` varchar(200) DEFAULT NULL COMMENT '模型路径',
  `model_content_path` varchar(200) DEFAULT NULL COMMENT '栏目内容对应的路径',
  `title_img_width` int(11) DEFAULT '139' COMMENT '栏目标题图宽度',
  `title_img_height` int(11) DEFAULT '139' COMMENT '栏目标题图高度',
  `content_img_width` int(11) DEFAULT '310' COMMENT '栏目内容图宽度',
  `content_img_height` int(11) DEFAULT '310' COMMENT '栏目内容图高度',
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `view_style` int(11) NOT NULL DEFAULT '1' COMMENT '页面呈现方式:1新闻列表，2产品图片列表，3案例图片列表，4单篇展示',
  `is_disabled` int(11) NOT NULL DEFAULT '1' COMMENT '是否禁用(0:是，1否)',
  `is_def` int(11) NOT NULL DEFAULT '0' COMMENT '是否是默认的模型（0否，1是，默认0）',
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_model
-- ----------------------------
INSERT INTO `cms_model` VALUES ('1', '单页', null, null, '139', '139', '310', '310', '1', '1', '1', '0');
INSERT INTO `cms_model` VALUES ('2', '新闻列表', null, null, '139', '139', '310', '310', '2', '1', '1', '0');
INSERT INTO `cms_model` VALUES ('3', '图片列表', null, null, '139', '139', '310', '310', '3', '1', '1', '0');
INSERT INTO `cms_model` VALUES ('4', '视频列表', null, null, '139', '139', '310', '310', '4', '1', '1', '0');
INSERT INTO `cms_model` VALUES ('5', '招聘', null, null, '139', '139', '310', '310', '5', '1', '1', '0');

-- ----------------------------
-- Table structure for msg_reply_rule
-- ----------------------------
DROP TABLE IF EXISTS `msg_reply_rule`;
CREATE TABLE `msg_reply_rule` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '规则名称',
  `match_value` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '匹配的关键词、事件等',
  `exact_match` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否精确匹配',
  `reply_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text' COMMENT '回复消息类型',
  `reply_content` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '回复消息内容',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '规则是否有效',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注说明',
  `effect_time_start` time DEFAULT '00:00:00' COMMENT '生效起始时间',
  `effect_time_end` time DEFAULT '23:59:59' COMMENT '生效结束时间',
  `priority` int(10) unsigned DEFAULT '0' COMMENT '规则优先级',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自动回复规则';

-- ----------------------------
-- Records of msg_reply_rule
-- ----------------------------
INSERT INTO `msg_reply_rule` VALUES ('1', '关注公众号', 'subscribe', '1', 'text', '你好，欢迎关注！\n<a href=\"https://github.com/niefy\">点击链接查看我的主页</a>', '1', '关注回复', '00:00:00', '23:59:59', '0', '2020-05-20 11:52:16');
INSERT INTO `msg_reply_rule` VALUES ('9', '人工-9点前', '人工,客服', '0', 'text', '您好，人工在线时间为工作日9:00-17:30。现在是非人工时段，您的咨询，我们将于下一工作日回复。', '1', '人工客服', '00:00:00', '09:00:00', '0', '2020-05-20 11:52:16');
INSERT INTO `msg_reply_rule` VALUES ('10', '人工-五点半后', '人工,客服', '0', 'text', '您好，人工在线时间为工作日9:00-17:30。现在是非人工时段，您的咨询，我们将于下一工作日回复。', '1', '人工客服', '17:30:00', '23:59:59', '0', '2020-05-20 11:52:16');
INSERT INTO `msg_reply_rule` VALUES ('11', '人工-工作时间', '人工', '0', 'text', '人工在线时间为工作日9:00-17:30。如您于工作时间咨询，我们将于工作时间内回复您！', '1', '人工客服', '09:00:00', '17:30:00', '0', '2020-05-20 11:52:16');

-- ----------------------------
-- Table structure for msg_template
-- ----------------------------
DROP TABLE IF EXISTS `msg_template`;
CREATE TABLE `msg_template` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `template_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公众号模板ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '模版名称',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '模板内容',
  `data` json DEFAULT NULL COMMENT '消息内容',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接',
  `miniprogram` json DEFAULT NULL COMMENT '小程序信息',
  `status` tinyint(3) unsigned NOT NULL COMMENT '是否有效',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_name` (`name`) USING BTREE COMMENT '模板名称',
  KEY `idx_status` (`status`) USING BTREE COMMENT '模板状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息模板';

-- ----------------------------
-- Records of msg_template
-- ----------------------------

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) COLLATE utf8_unicode_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('01169834-363a-489a-8f60-28d516885949', '58a6y', '2020-07-03 00:32:59');
INSERT INTO `sys_captcha` VALUES ('123d251e-e8de-483c-8d77-3192b7c2f153', 'y3exp', '2020-07-28 23:34:49');
INSERT INTO `sys_captcha` VALUES ('1f2da9e5-1d62-407d-8430-01929ddaf26d', 'y6nmp', '2020-08-01 06:23:31');
INSERT INTO `sys_captcha` VALUES ('24bbdb5f-90a8-4dba-8458-e617bf4d0225', '2ccnp', '2020-08-02 06:38:08');
INSERT INTO `sys_captcha` VALUES ('2656e9b0-1fd2-44e1-8e28-5026c382f679', '23xwy', '2020-07-03 23:21:59');
INSERT INTO `sys_captcha` VALUES ('27dc2536-821b-4007-863f-06cf4e437f7e', 'x7pnn', '2020-07-07 23:48:02');
INSERT INTO `sys_captcha` VALUES ('404ead1e-3c35-4dc3-822a-09be9c15dbac', 'mwn6e', '2020-08-02 22:49:02');
INSERT INTO `sys_captcha` VALUES ('47369fd2-95b6-4aa0-8517-e513e603b85a', '6d3cn', '2020-07-08 22:31:51');
INSERT INTO `sys_captcha` VALUES ('5305c5e4-101f-42cd-8d1b-d34597b1153b', '62mf6', '2020-06-25 23:55:55');
INSERT INTO `sys_captcha` VALUES ('6fe5e077-89da-494d-8416-2391b23a5d3f', '67p35', '2020-07-28 23:34:27');
INSERT INTO `sys_captcha` VALUES ('721186e7-3aee-4998-8d49-7eaea81faa3c', '4pbdm', '2020-06-26 16:31:37');
INSERT INTO `sys_captcha` VALUES ('751e9a8e-89d4-43cc-8deb-2695d3e04b37', 'f8n64', '2020-08-02 06:38:16');
INSERT INTO `sys_captcha` VALUES ('7dac600f-d401-4a76-8825-a97c8b49935d', 'c7mb4', '2020-06-26 00:01:17');
INSERT INTO `sys_captcha` VALUES ('867b4690-0345-41b7-83d1-f80ede81055c', 'f7gen', '2020-07-03 23:21:41');
INSERT INTO `sys_captcha` VALUES ('90df0d26-3990-4a83-8fb1-bf378662356e', 'x27c7', '2020-06-25 23:55:50');
INSERT INTO `sys_captcha` VALUES ('937f4de9-3c88-4765-8d95-b010ea505364', '3gwmc', '2020-07-25 21:23:31');
INSERT INTO `sys_captcha` VALUES ('b5685edf-8cf0-4923-84a7-10db9ed6440d', '7bym5', '2020-07-08 22:20:45');
INSERT INTO `sys_captcha` VALUES ('c37a41f8-7670-4a86-880b-c30fe7066ac2', '2fenp', '2020-08-01 06:23:53');
INSERT INTO `sys_captcha` VALUES ('c631390b-93d9-4ba7-8bf3-9157f952a5fe', 'c7dde', '2020-07-03 00:32:59');
INSERT INTO `sys_captcha` VALUES ('d80aae8a-0a2f-452e-8166-38006b4e53b9', 'nmwxw', '2020-07-03 00:33:15');
INSERT INTO `sys_captcha` VALUES ('e12ae113-6fa8-41cb-8f74-04fc89af4751', 'y8ane', '2020-06-25 23:55:54');
INSERT INTO `sys_captcha` VALUES ('e4aa947b-044c-40db-8f0e-82821c840762', 'ppxw4', '2020-07-03 00:33:20');
INSERT INTO `sys_captcha` VALUES ('f872a8ca-c92a-44cb-8e4b-75c10e527cfd', 'fn26e', '2020-06-25 23:51:04');
INSERT INTO `sys_captcha` VALUES ('fccf76a8-274c-404c-8653-7dcb8d720b0b', '44a6a', '2020-08-02 22:49:07');
INSERT INTO `sys_captcha` VALUES ('ffdf3b32-cab0-4bf5-8dbf-255b183c5734', '6e7n3', '2020-07-09 21:50:29');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `param_key` (`param_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"type\":3,\"qiniuDomain\":\"\",\"qiniuPrefix\":\"\",\"qiniuAccessKey\":\"\",\"qiniuSecretKey\":\"\",\"qiniuBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudAppId\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"\",\"qcloudRegion\":\"ap-guangzhou\"}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) DEFAULT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '保存菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.save()', '[{\"icon\":\"el-icon-eleme\",\"menuId\":1113,\"name\":\"网站管理\",\"orderNum\":3,\"parentId\":0,\"perms\":\"\",\"type\":0,\"url\":\"\"}]', '26', '127.0.0.1', '2020-06-26 00:00:25');
INSERT INTO `sys_log` VALUES ('2', 'admin', '保存菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.save()', '[{\"icon\":\"\",\"menuId\":1114,\"name\":\"模型管理\",\"orderNum\":1,\"parentId\":1113,\"perms\":\"/cms:model:list\",\"type\":1,\"url\":\"/modelManage\"}]', '13', '127.0.0.1', '2020-06-26 00:02:37');
INSERT INTO `sys_log` VALUES ('3', 'admin', '保存菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.save()', '[{\"icon\":\"\",\"menuId\":1115,\"name\":\"栏目管理\",\"orderNum\":0,\"parentId\":1113,\"perms\":\"cms:channel:list\",\"type\":1,\"url\":\"/cms/channelManage\"}]', '7', '127.0.0.1', '2020-06-26 00:03:30');
INSERT INTO `sys_log` VALUES ('4', 'admin', '保存菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.save()', '[{\"icon\":\"\",\"menuId\":1116,\"name\":\"内容管理\",\"orderNum\":0,\"parentId\":1113,\"perms\":\"cms:content:list\",\"type\":1,\"url\":\"/contentManage\"}]', '4', '127.0.0.1', '2020-06-26 00:04:25');
INSERT INTO `sys_log` VALUES ('5', 'admin', '修改菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.update()', '[{\"icon\":\"el-icon-document-copy\",\"menuId\":7,\"name\":\"内容管理\",\"orderNum\":5,\"parentId\":0,\"perms\":\"\",\"type\":0,\"url\":\"\"}]', '9', '127.0.0.1', '2020-06-26 00:05:00');
INSERT INTO `sys_log` VALUES ('6', 'admin', '修改菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.update()', '[{\"icon\":\"el-icon-eleme\",\"menuId\":1113,\"name\":\"网站管理\",\"orderNum\":2,\"parentId\":0,\"perms\":\"\",\"type\":0,\"url\":\"\"}]', '7', '127.0.0.1', '2020-06-26 00:05:19');
INSERT INTO `sys_log` VALUES ('7', 'admin', '保存菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.save()', '[{\"icon\":\"\",\"menuId\":1117,\"name\":\"文章类别管理\",\"orderNum\":0,\"parentId\":1113,\"perms\":\"\",\"type\":1,\"url\":\"/cms/cartergeray\"}]', '8', '127.0.0.1', '2020-06-26 00:07:43');
INSERT INTO `sys_log` VALUES ('8', 'admin', '修改菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.update()', '[{\"icon\":\"\",\"menuId\":1114,\"name\":\"模型管理\",\"orderNum\":1,\"parentId\":1113,\"perms\":\"cms:model:list\",\"type\":1,\"url\":\"wx/cms/model\"}]', '48', '127.0.0.1', '2020-06-27 11:13:22');
INSERT INTO `sys_log` VALUES ('9', 'admin', '修改菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.update()', '[{\"icon\":\"\",\"menuId\":1115,\"name\":\"栏目管理\",\"orderNum\":0,\"parentId\":1113,\"perms\":\"cms:channel:list\",\"type\":1,\"url\":\"wx/cms/channel\"}]', '78', '127.0.0.1', '2020-06-27 11:13:49');
INSERT INTO `sys_log` VALUES ('10', 'admin', '修改菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.update()', '[{\"icon\":\"\",\"menuId\":1116,\"name\":\"内容管理\",\"orderNum\":0,\"parentId\":1113,\"perms\":\"cms:content:list\",\"type\":1,\"url\":\"wx/cms/content\"}]', '139', '127.0.0.1', '2020-06-27 11:14:03');
INSERT INTO `sys_log` VALUES ('11', 'admin', '修改菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.update()', '[{\"icon\":\"\",\"menuId\":1117,\"name\":\"文章类别管理\",\"orderNum\":0,\"parentId\":1113,\"perms\":\"\",\"type\":1,\"url\":\"wx/cms/category\"}]', '21', '127.0.0.1', '2020-06-27 11:14:48');
INSERT INTO `sys_log` VALUES ('12', 'admin', '修改菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.update()', '[{\"icon\":\"\",\"menuId\":1117,\"name\":\"文章类别管理\",\"orderNum\":0,\"parentId\":1113,\"perms\":\"cms:category:list\",\"type\":1,\"url\":\"wx/cms/category\"}]', '20', '127.0.0.1', '2020-06-27 11:15:06');
INSERT INTO `sys_log` VALUES ('13', 'admin', '修改菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.update()', '[{\"icon\":\"\",\"menuId\":1114,\"name\":\"模型管理\",\"orderNum\":1,\"parentId\":1113,\"perms\":\"cms:model:list\",\"type\":1,\"url\":\"cms/model\"}]', '36', '127.0.0.1', '2020-06-27 11:29:09');
INSERT INTO `sys_log` VALUES ('14', 'admin', '修改菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.update()', '[{\"icon\":\"\",\"menuId\":1115,\"name\":\"栏目管理\",\"orderNum\":0,\"parentId\":1113,\"perms\":\"cms:channel:list\",\"type\":1,\"url\":\"cms/channel\"}]', '33', '127.0.0.1', '2020-06-27 11:29:40');
INSERT INTO `sys_log` VALUES ('15', 'admin', '修改菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.update()', '[{\"icon\":\"\",\"menuId\":1116,\"name\":\"内容管理\",\"orderNum\":0,\"parentId\":1113,\"perms\":\"cms:content:list\",\"type\":1,\"url\":\"cms/content\"}]', '39', '127.0.0.1', '2020-06-27 11:29:47');
INSERT INTO `sys_log` VALUES ('16', 'admin', '修改菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.update()', '[{\"icon\":\"\",\"menuId\":1117,\"name\":\"文章类别管理\",\"orderNum\":0,\"parentId\":1113,\"perms\":\"cms:category:list\",\"type\":1,\"url\":\"cms/category\"}]', '22', '127.0.0.1', '2020-06-27 11:29:54');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'el-icon-s-tools', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user', null, '1', 'admin', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role', null, '1', 'role', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu', null, '1', 'menu', '3');
INSERT INTO `sys_menu` VALUES ('6', '0', '微信管理', null, null, '0', 'el-icon-s-promotion', '1');
INSERT INTO `sys_menu` VALUES ('7', '0', '内容管理', '', '', '0', 'el-icon-document-copy', '5');
INSERT INTO `sys_menu` VALUES ('9', '0', '日志报表', '', '', '0', 'el-icon-s-order', '4');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('29', '9', '系统日志', 'sys/log', 'sys:log:list', '1', 'log', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'oss/oss', 'sys:oss:all', '1', 'oss', '6');
INSERT INTO `sys_menu` VALUES ('32', '6', '公众号菜单', 'wx/wx-menu', '', '1', 'log', '0');
INSERT INTO `sys_menu` VALUES ('34', '6', '素材管理', 'wx/wx-assets', null, '1', 'log', '0');
INSERT INTO `sys_menu` VALUES ('35', '34', '新增', '', 'wx:wxassets:save', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('41', '7', '文章公告', 'wx/article', null, '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('42', '41', '查看', null, 'wx:article:list,wx:article:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('43', '41', '新增', null, 'wx:article:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('44', '41', '修改', null, 'wx:article:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('45', '41', '删除', null, 'wx:article:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('66', '6', '自动回复规则', 'wx/msg-reply-rule', null, '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('67', '66', '查看', null, 'wx:msgreplyrule:list,wx:msgreplyrule:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('68', '66', '新增', null, 'wx:msgreplyrule:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('69', '66', '修改', null, 'wx:msgreplyrule:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('70', '66', '删除', null, 'wx:msgreplyrule:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('71', '6', '模板消息', 'wx/msg-template', null, '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('72', '71', '查看', null, 'wx:msgtemplate:list,wx:msgtemplate:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('73', '71', '新增', null, 'wx:msgtemplate:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('74', '71', '修改', null, 'wx:msgtemplate:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('75', '71', '删除', null, 'wx:msgtemplate:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('81', '9', '模版消息发送记录', 'wx/template-msg-log', null, '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('85', '81', '删除', null, 'wx:templatemsglog:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('99', '32', '更新公众号菜单', '', 'wx:menu:save', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('102', '34', '查看', '', 'wx:wxassets:list', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('103', '6', '带参二维码', 'wx/wx-qrcode', null, '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('104', '103', '查看', null, 'wx:wxqrcode:list,wx:wxqrcode:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('105', '103', '新增', null, 'wx:wxqrcode:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('107', '103', '删除', null, 'wx:wxqrcode:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('108', '6', '粉丝管理', 'wx/wx-user', null, '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('109', '108', '查看', null, 'wx:wxuser:list,wx:wxuser:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('110', '108', '删除', null, 'wx:wxuser:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('113', '6', '公众号消息', 'wx/wx-msg', null, '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('114', '113', '查看', null, 'wx:wxmsg:list,wx:wxmsg:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('115', '113', '新增', null, 'wx:wxmsg:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('117', '113', '删除', null, 'wx:wxmsg:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('1111', '108', '同步', null, 'wx:wxuser:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('1112', '34', '删除', '', 'wx:wxassets:delete', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('1113', '0', '网站管理', '', '', '0', 'el-icon-eleme', '2');
INSERT INTO `sys_menu` VALUES ('1114', '1113', '模型管理', 'cms/model', 'cms:model:list', '1', '', '1');
INSERT INTO `sys_menu` VALUES ('1115', '1113', '栏目管理', 'cms/channel', 'cms:channel:list', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('1116', '1113', '内容管理', 'cms/content', 'cms:content:list', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('1117', '1113', '文章类别管理', 'cms/category', 'cms:category:list', '1', '', '0');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '盐',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'cdac762d0ba79875489f6a8b430fa8b5dfe0cdd81da38b80f02f33328af7fd4a', 'YzcmCZNvbXocrsz9dm8e', 'niefy@qq.com', '16666666666', '1', '1', '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `token` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', '96dbf2dbbd171573df4fae20635d1bd3', '2020-08-04 09:03:46', '2020-08-03 21:03:46');

-- ----------------------------
-- Table structure for template_msg_log
-- ----------------------------
DROP TABLE IF EXISTS `template_msg_log`;
CREATE TABLE `template_msg_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `touser` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户openid',
  `template_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'templateid',
  `data` json DEFAULT NULL COMMENT '消息数据',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '消息链接',
  `miniprogram` json DEFAULT NULL COMMENT '小程序信息',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `send_result` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发送结果',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='微信模版消息发送记录';

-- ----------------------------
-- Records of template_msg_log
-- ----------------------------

-- ----------------------------
-- Table structure for wx_msg
-- ----------------------------
DROP TABLE IF EXISTS `wx_msg`;
CREATE TABLE `wx_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '微信用户ID',
  `in_out` tinyint(3) unsigned DEFAULT NULL COMMENT '消息方向',
  `msg_type` char(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '消息类型',
  `detail` json DEFAULT NULL COMMENT '消息详情',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='微信消息';

-- ----------------------------
-- Records of wx_msg
-- ----------------------------

-- ----------------------------
-- Table structure for wx_qr_code
-- ----------------------------
DROP TABLE IF EXISTS `wx_qr_code`;
CREATE TABLE `wx_qr_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `is_temp` tinyint(1) DEFAULT NULL COMMENT '是否为临时二维码',
  `scene_str` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '场景值ID',
  `ticket` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '二维码ticket',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '二维码图片解析后的地址',
  `expire_time` datetime DEFAULT NULL COMMENT '该二维码失效时间',
  `create_time` datetime DEFAULT NULL COMMENT '该二维码创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='公众号带参二维码';

-- ----------------------------
-- Records of wx_qr_code
-- ----------------------------

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user` (
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信openid',
  `phone` char(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别(0-未知、1-男、2-女)',
  `city` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '城市',
  `province` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省份',
  `headimgurl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `subscribe_time` datetime DEFAULT NULL COMMENT '订阅时间',
  `subscribe` tinyint(3) unsigned DEFAULT '1' COMMENT '是否关注',
  `unionid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'unionid',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tagid_list` json DEFAULT NULL COMMENT '标签ID列表',
  `subscribe_scene` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关注场景',
  `qr_scene_str` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扫码场景值',
  PRIMARY KEY (`openid`) USING BTREE,
  KEY `idx_unionid` (`unionid`) USING BTREE COMMENT 'unionid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

-- ----------------------------
-- Records of wx_user
-- ----------------------------
