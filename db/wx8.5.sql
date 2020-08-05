/*
Navicat MySQL Data Transfer

Source Server         : 18
Source Server Version : 50729
Source Host           : 192.168.89.18:3306
Source Database       : wx

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2020-08-05 16:39:52
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
-- Table structure for cms_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `category_id` bigint(32) NOT NULL,
  `category_name` varchar(200) NOT NULL,
  `parent_id` bigint(32) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_category
-- ----------------------------
INSERT INTO `cms_category` VALUES ('1', '白菜', '0', '1', '白菜信息');

-- ----------------------------
-- Table structure for cms_channel
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel`;
CREATE TABLE `cms_channel` (
  `channel_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `channel_name` varchar(100) NOT NULL COMMENT '栏目名称',
  `model_id` bigint(32) NOT NULL COMMENT '模型ID',
  `parent_id` bigint(32) DEFAULT NULL COMMENT '父栏目ID',
  `channel_path` varchar(50) DEFAULT NULL COMMENT '访问路径',
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `status` int(11) DEFAULT '1' COMMENT '栏目状态(-1:永久删除，0:已删除，1:正常，默认1)',
  `is_display` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示(0：否，1：是)',
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_channel
-- ----------------------------
INSERT INTO `cms_channel` VALUES ('1', '关于冠中', '1', '0', null, '1', null, '1');
INSERT INTO `cms_channel` VALUES ('2', '主营业务', '1', '0', null, '2', null, '1');
INSERT INTO `cms_channel` VALUES ('3', '服务中心', '1', '0', null, '3', null, '1');
INSERT INTO `cms_channel` VALUES ('4', '政策咨询', '1', '0', null, '4', null, '1');
INSERT INTO `cms_channel` VALUES ('5', '人才中心', '1', '0', null, '5', null, '1');
INSERT INTO `cms_channel` VALUES ('6', '联系贯中', '1', '0', null, '6', null, '1');
INSERT INTO `cms_channel` VALUES ('11', '公司介绍', '1', '1', null, '1', null, '1');
INSERT INTO `cms_channel` VALUES ('12', '企业文化', '1', '1', null, '2', null, '1');
INSERT INTO `cms_channel` VALUES ('21', '人力派遣', '1', '2', null, '1', null, '1');
INSERT INTO `cms_channel` VALUES ('22', '人事代理', '1', '2', null, '2', null, '1');
INSERT INTO `cms_channel` VALUES ('23', '招聘求职', '1', '2', null, '3', null, '1');
INSERT INTO `cms_channel` VALUES ('24', '劳务咨询', '1', '2', null, '4', null, '1');
INSERT INTO `cms_channel` VALUES ('31', '社保查询', '1', '3', null, '1', null, '1');
INSERT INTO `cms_channel` VALUES ('32', '公积金查询', '1', '3', null, '2', null, '1');
INSERT INTO `cms_channel` VALUES ('41', '办事流程', '1', '4', null, '1', null, '1');
INSERT INTO `cms_channel` VALUES ('42', '法律法规', '1', '4', null, '2', null, '1');
INSERT INTO `cms_channel` VALUES ('51', '人才招聘', '1', '5', null, '1', null, '1');
INSERT INTO `cms_channel` VALUES ('52', '人才储备', '1', '5', null, '2', null, '1');
INSERT INTO `cms_channel` VALUES ('421', '法律法规', '1', '42', null, '1', null, '1');
INSERT INTO `cms_channel` VALUES ('422', '规章制度', '1', '42', null, '2', null, '1');
INSERT INTO `cms_channel` VALUES ('427', '测试栏目1', '1', '0', 'http://www.baidu.com', '10', '3', '1');
INSERT INTO `cms_channel` VALUES ('428', '测试栏目1', '1', '0', 'http://www.baidu.com', '10', '3', '1');
INSERT INTO `cms_channel` VALUES ('429', '测试栏目1', '1', '0', 'http://www.baidu.com', '10', '3', '1');
INSERT INTO `cms_channel` VALUES ('430', '测试栏目1', '1', '0', 'http://www.baidu.com', '10', '3', '1');
INSERT INTO `cms_channel` VALUES ('431', '测试栏目1', '1', '0', 'http://www.baidu.com', '10', '3', '1');

-- ----------------------------
-- Table structure for cms_channel_banner
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel_banner`;
CREATE TABLE `cms_channel_banner` (
  `channel_id` bigint(32) NOT NULL,
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
  `channel_id` bigint(32) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT 'TITLE',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'KEYWORDS',
  `description` varchar(255) DEFAULT NULL COMMENT 'DESCRIPTION',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `channel_pc_path` varchar(255) DEFAULT NULL COMMENT '栏目页(页面)',
  `channel_pc_content_path` varchar(255) DEFAULT NULL COMMENT '内容页(页面)',
  `channel_mobile_path` varchar(255) DEFAULT NULL COMMENT '手机栏目页(页面)',
  `channel_mobile_content_path` varchar(255) DEFAULT NULL COMMENT '手机内容页(页面)',
  `is_blank` varchar(255) DEFAULT NULL COMMENT '是否新窗口打开',
  `allow_share` int(11) DEFAULT '0' COMMENT '评分(1:开放;0:关闭,默认0)',
  `allow_score` int(11) DEFAULT '0' COMMENT '评分(1:开放;0:关闭,默认0)',
  UNIQUE KEY `index_channel_id` (`channel_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_channel_ext
-- ----------------------------
INSERT INTO `cms_channel_ext` VALUES ('1', null, null, null, null, null, null, null, null, null, '0', '0');
INSERT INTO `cms_channel_ext` VALUES ('430', '栏目标题', '页面关键字', '页面描述', 'http://www.baidu.com', '/pcpath', '/pcpath/detail', '/mpath', '/mpath/detail', '1', '0', '0');
INSERT INTO `cms_channel_ext` VALUES ('431', null, null, null, null, null, null, null, null, null, '0', '0');

-- ----------------------------
-- Table structure for cms_channel_txt
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel_txt`;
CREATE TABLE `cms_channel_txt` (
  `channel_id` bigint(32) NOT NULL,
  `txt` longtext,
  `txt1` longtext,
  `txt2` longtext,
  `txt3` longtext,
  `txt4` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_channel_txt
-- ----------------------------
INSERT INTO `cms_channel_txt` VALUES ('1', null, null, null, null, null);
INSERT INTO `cms_channel_txt` VALUES ('430', null, null, null, null, null);
INSERT INTO `cms_channel_txt` VALUES ('431', null, null, null, null, null);

-- ----------------------------
-- Table structure for cms_content
-- ----------------------------
DROP TABLE IF EXISTS `cms_content`;
CREATE TABLE `cms_content` (
  `content_id` bigint(32) NOT NULL,
  `channel_id` bigint(32) NOT NULL,
  `category_id` bigint(32) DEFAULT NULL COMMENT '文章类别(除栏目以外的另一种类别)',
  `top_level` int(11) DEFAULT NULL COMMENT '置顶级别',
  `has_title_img` int(11) DEFAULT NULL COMMENT '是否有标题图片（0:否，1:是,默认0）',
  `is_recommend` int(11) DEFAULT '0' COMMENT '是否推荐(0:不推荐，1：推荐，默认0)',
  `priority` int(11) DEFAULT NULL COMMENT '排列顺序',
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
INSERT INTO `cms_content` VALUES ('1', '1', '1', '1', '0', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cms_content` VALUES ('2', '1', '1', '1', '0', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cms_content` VALUES ('3', '1', '1', '1', '0', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cms_content` VALUES ('4', '1', '1', '1', '0', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cms_content` VALUES ('5', '1', '1', '1', '0', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cms_content` VALUES ('6', '1', '1', '1', '0', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cms_content` VALUES ('7', '1', '1', '1', '0', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cms_content` VALUES ('8', '1', '1', '1', '0', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cms_content` VALUES ('9', '1', '1', '1', '0', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cms_content` VALUES ('10', '1', '1', '1', '0', '0', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for cms_content_attachment
-- ----------------------------
DROP TABLE IF EXISTS `cms_content_attachment`;
CREATE TABLE `cms_content_attachment` (
  `content_id` bigint(32) DEFAULT NULL,
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
  `content_id` bigint(32) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL COMMENT '标题',
  `short_title` varchar(150) DEFAULT NULL COMMENT '短标题(副标题)',
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
INSERT INTO `cms_content_ext` VALUES ('1', '测试文章12', '测试1', '罗中学', null, null, null, null, null, null, null, null, null, '2020-08-05 15:50:07');
INSERT INTO `cms_content_ext` VALUES ('2', '测试文章1332', '测试2', '罗中学', '', '', '', '', '', '', '', '', '', '2020-08-05 15:50:07');
INSERT INTO `cms_content_ext` VALUES ('3', '测试文章142', '测试3', '罗中学', '', '', '', '', '', '', '', '', '', '2020-08-05 15:50:07');
INSERT INTO `cms_content_ext` VALUES ('4', '测试文章15', '测试3', '罗中学', '', '', '', '', '', '', '', '', '', '2020-08-05 15:50:07');
INSERT INTO `cms_content_ext` VALUES ('5', '测试文章16', '测试4', '罗中学', '', '', '', '', '', '', '', '', '', '2020-08-05 15:50:07');
INSERT INTO `cms_content_ext` VALUES ('6', '测试文章17', '测试55', '罗中学', '', '', '', '', '', '', '', '', '', '2020-08-05 15:50:07');
INSERT INTO `cms_content_ext` VALUES ('7', '测试文章18', '测试55', '罗中学', '', '', '', '', '', '', '', '', '', '2020-08-05 15:50:07');
INSERT INTO `cms_content_ext` VALUES ('8', '测试文章19', '测试6', '罗中学', '', '', '', '', '', '', '', '', '', '2020-08-05 15:50:07');
INSERT INTO `cms_content_ext` VALUES ('9', '测试文章10', '测试56', '罗中学', '', '', '', '', '', '', '', '', '', '2020-08-05 15:50:07');
INSERT INTO `cms_content_ext` VALUES ('10', '测试文章122', '测试78', '罗中学', '', '', '', '', '', '', '', '', '', '2020-08-05 15:50:07');

-- ----------------------------
-- Table structure for cms_content_picture
-- ----------------------------
DROP TABLE IF EXISTS `cms_content_picture`;
CREATE TABLE `cms_content_picture` (
  `content_id` bigint(32) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL COMMENT '显示顺序',
  `img_path` varchar(200) DEFAULT NULL COMMENT '图片地址',
  `description` varchar(255) DEFAULT NULL COMMENT '图片描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_content_picture
-- ----------------------------

-- ----------------------------
-- Table structure for cms_content_txt
-- ----------------------------
DROP TABLE IF EXISTS `cms_content_txt`;
CREATE TABLE `cms_content_txt` (
  `content_id` bigint(32) NOT NULL,
  `txt` longtext,
  `txt1` longtext,
  `txt2` longtext,
  `txt3` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_content_txt
-- ----------------------------
INSERT INTO `cms_content_txt` VALUES ('1', '查询查询自出心裁1111', null, null, null);
INSERT INTO `cms_content_txt` VALUES ('2', '查询查询自出心裁2222', '', '', '');
INSERT INTO `cms_content_txt` VALUES ('3', '查询查询自出心裁3333', '', '', '');
INSERT INTO `cms_content_txt` VALUES ('4', '查询查询自出心裁444', '', '', '');
INSERT INTO `cms_content_txt` VALUES ('5', '查询查询自出心裁555', '', '', '');
INSERT INTO `cms_content_txt` VALUES ('6', '查询查询自出心裁666', '', '', '');
INSERT INTO `cms_content_txt` VALUES ('7', '查询查询自出心裁777', '', '', '');
INSERT INTO `cms_content_txt` VALUES ('8', '查询查询自出心裁888', '', '', '');
INSERT INTO `cms_content_txt` VALUES ('9', '查询查询自出心裁999', '', '', '');
INSERT INTO `cms_content_txt` VALUES ('10', '查询查询自出心裁101010', '', '', '');

-- ----------------------------
-- Table structure for cms_model
-- ----------------------------
DROP TABLE IF EXISTS `cms_model`;
CREATE TABLE `cms_model` (
  `model_id` bigint(32) NOT NULL COMMENT '模型ID',
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
INSERT INTO `sys_captcha` VALUES ('3ae50a73-7a3b-4808-8462-95d9396e7c11', 'w4xam', '2020-06-20 14:31:27');
INSERT INTO `sys_captcha` VALUES ('4c37d750-e094-4231-8e19-d5a0654e2942', 'abbxp', '2020-06-28 09:10:42');
INSERT INTO `sys_captcha` VALUES ('66dfe7ea-9220-45e2-894f-cd68fc9f7544', 'nfbw6', '2020-08-03 12:46:23');
INSERT INTO `sys_captcha` VALUES ('b9036e92-079f-4e8b-8609-ee119be26045', 'ep55b', '2020-08-03 12:46:38');

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
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"type\":1,\"qiniuDomain\":\"oss.maingoo.com.cn\",\"qiniuPrefix\":\"\",\"qiniuAccessKey\":\"xyYPytw4k1fpVu-DkkuW8z6MgZev3nD6w9Qa_yv0\",\"qiniuSecretKey\":\"96CtNrXM0esThh4gAKBfqyGFbM9SfIpJYkrzJWlV\",\"qiniuBucketName\":\"maingoo\",\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudAppId\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"\",\"qcloudRegion\":\"ap-guangzhou\"}', '0', '云存储配置信息');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '保存菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.save()', '[{\"icon\":\"的的\",\"menuId\":1113,\"name\":\"网站管理\",\"orderNum\":0,\"parentId\":0,\"perms\":\"\",\"type\":1,\"url\":\"/sitemenu\"}]', '44', '127.0.0.1', '2020-06-24 14:57:21');
INSERT INTO `sys_log` VALUES ('2', 'admin', '修改菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.update()', '[{\"icon\":\"的的\",\"menuId\":1113,\"name\":\"网站管理\",\"orderNum\":0,\"parentId\":0,\"perms\":\"\",\"type\":1,\"url\":\"/sitemenu\"}]', '8', '127.0.0.1', '2020-06-24 14:58:16');
INSERT INTO `sys_log` VALUES ('3', 'admin', '修改菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.update()', '[{\"icon\":\"的的\",\"menuId\":1113,\"name\":\"网站管理\",\"orderNum\":0,\"parentId\":0,\"perms\":\"\",\"type\":0,\"url\":\"/sitemenu\"}]', '5', '127.0.0.1', '2020-06-24 14:59:16');
INSERT INTO `sys_log` VALUES ('4', 'admin', '保存菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.save()', '[{\"icon\":\"\",\"menuId\":1114,\"name\":\"栏目管理\",\"orderNum\":0,\"parentId\":1113,\"perms\":\"\",\"type\":1,\"url\":\"/sitemenu\"}]', '5', '127.0.0.1', '2020-06-24 14:59:54');
INSERT INTO `sys_log` VALUES ('5', 'admin', '保存菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.save()', '[{\"icon\":\"\",\"menuId\":1115,\"name\":\"内容管理\",\"orderNum\":0,\"parentId\":1113,\"perms\":\"\",\"type\":1,\"url\":\"/sitemenu\"}]', '4', '127.0.0.1', '2020-06-24 15:00:10');
INSERT INTO `sys_log` VALUES ('6', 'admin', '修改菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.update()', '[{\"icon\":\"el-icon-eleme\",\"menuId\":1113,\"name\":\"网站管理\",\"orderNum\":0,\"parentId\":0,\"perms\":\"\",\"type\":0,\"url\":\"\"}]', '13', '127.0.0.1', '2020-06-24 15:03:54');
INSERT INTO `sys_log` VALUES ('7', 'admin', '保存菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.save()', '[{\"icon\":\"\",\"menuId\":1116,\"name\":\"栏目模型\",\"orderNum\":0,\"parentId\":1113,\"perms\":\"\",\"type\":1,\"url\":\"/model\"}]', '10', '127.0.0.1', '2020-06-24 16:48:02');
INSERT INTO `sys_log` VALUES ('8', 'admin', '修改菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.update()', '[{\"icon\":\"\",\"menuId\":1116,\"name\":\"栏目模型\",\"orderNum\":1,\"parentId\":1113,\"perms\":\"\",\"type\":1,\"url\":\"/model\"}]', '2', '127.0.0.1', '2020-06-24 16:48:47');
INSERT INTO `sys_log` VALUES ('9', 'admin', '修改菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.update()', '[{\"icon\":\"\",\"menuId\":1114,\"name\":\"栏目管理\",\"orderNum\":2,\"parentId\":1113,\"perms\":\"\",\"type\":1,\"url\":\"/sitemenu\"}]', '3', '127.0.0.1', '2020-06-24 16:48:53');
INSERT INTO `sys_log` VALUES ('10', 'admin', '修改菜单', 'com.github.niefy.modules.sys.controller.SysMenuController.update()', '[{\"icon\":\"\",\"menuId\":1115,\"name\":\"内容管理\",\"orderNum\":3,\"parentId\":1113,\"perms\":\"\",\"type\":1,\"url\":\"/sitemenu\"}]', '3', '127.0.0.1', '2020-06-24 16:48:58');
INSERT INTO `sys_log` VALUES ('11', 'admin', '保存角色', 'com.github.niefy.modules.sys.controller.SysRoleController.save()', '[{\"createTime\":1592990173271,\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,27,30,6,32,99,34,35,102,1112,66,67,68,69,70,71,72,73,74,75,103,104,105,107,108,109,110,1111,113,114,115,117,7,41,42,43,44,45,9,29,81,85,1113,1114,1115,1116,-666666],\"remark\":\"\",\"roleId\":1,\"roleName\":\"系统管理员\"}]', '663', '127.0.0.1', '2020-06-24 17:16:13');
INSERT INTO `sys_log` VALUES ('12', 'admin', '修改用户', 'com.github.niefy.modules.sys.controller.SysUserController.update()', '[{\"createUserId\":1,\"email\":\"niefy@qq.com\",\"mobile\":\"16666666666\",\"roleIdList\":[1],\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"status\":1,\"userId\":1,\"username\":\"admin\"}]', '74', '127.0.0.1', '2020-06-24 17:16:27');

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
) ENGINE=InnoDB AUTO_INCREMENT=1117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'el-icon-s-tools', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user', null, '1', 'admin', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role', null, '1', 'role', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu', null, '1', 'menu', '3');
INSERT INTO `sys_menu` VALUES ('6', '0', '微信管理', null, null, '0', 'el-icon-s-promotion', '1');
INSERT INTO `sys_menu` VALUES ('7', '0', '内容管理', '', '', '0', 'el-icon-document-copy', '2');
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
INSERT INTO `sys_menu` VALUES ('1113', '0', '网站管理', '', '', '0', 'el-icon-eleme', '0');
INSERT INTO `sys_menu` VALUES ('1114', '1113', '栏目管理', '/sitemenu', '', '1', '', '2');
INSERT INTO `sys_menu` VALUES ('1115', '1113', '内容管理', '/sitemenu', '', '1', '', '3');
INSERT INTO `sys_menu` VALUES ('1116', '1113', '栏目模型', '/model', '', '1', '', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '', '1', '2020-06-24 17:16:13');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('4', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('5', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('6', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('7', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('8', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('9', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('10', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('11', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('12', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('13', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('14', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('15', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('16', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('17', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('18', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('19', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('20', '1', '32');
INSERT INTO `sys_role_menu` VALUES ('21', '1', '99');
INSERT INTO `sys_role_menu` VALUES ('22', '1', '34');
INSERT INTO `sys_role_menu` VALUES ('23', '1', '35');
INSERT INTO `sys_role_menu` VALUES ('24', '1', '102');
INSERT INTO `sys_role_menu` VALUES ('25', '1', '1112');
INSERT INTO `sys_role_menu` VALUES ('26', '1', '66');
INSERT INTO `sys_role_menu` VALUES ('27', '1', '67');
INSERT INTO `sys_role_menu` VALUES ('28', '1', '68');
INSERT INTO `sys_role_menu` VALUES ('29', '1', '69');
INSERT INTO `sys_role_menu` VALUES ('30', '1', '70');
INSERT INTO `sys_role_menu` VALUES ('31', '1', '71');
INSERT INTO `sys_role_menu` VALUES ('32', '1', '72');
INSERT INTO `sys_role_menu` VALUES ('33', '1', '73');
INSERT INTO `sys_role_menu` VALUES ('34', '1', '74');
INSERT INTO `sys_role_menu` VALUES ('35', '1', '75');
INSERT INTO `sys_role_menu` VALUES ('36', '1', '103');
INSERT INTO `sys_role_menu` VALUES ('37', '1', '104');
INSERT INTO `sys_role_menu` VALUES ('38', '1', '105');
INSERT INTO `sys_role_menu` VALUES ('39', '1', '107');
INSERT INTO `sys_role_menu` VALUES ('40', '1', '108');
INSERT INTO `sys_role_menu` VALUES ('41', '1', '109');
INSERT INTO `sys_role_menu` VALUES ('42', '1', '110');
INSERT INTO `sys_role_menu` VALUES ('43', '1', '1111');
INSERT INTO `sys_role_menu` VALUES ('44', '1', '113');
INSERT INTO `sys_role_menu` VALUES ('45', '1', '114');
INSERT INTO `sys_role_menu` VALUES ('46', '1', '115');
INSERT INTO `sys_role_menu` VALUES ('47', '1', '117');
INSERT INTO `sys_role_menu` VALUES ('48', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('49', '1', '41');
INSERT INTO `sys_role_menu` VALUES ('50', '1', '42');
INSERT INTO `sys_role_menu` VALUES ('51', '1', '43');
INSERT INTO `sys_role_menu` VALUES ('52', '1', '44');
INSERT INTO `sys_role_menu` VALUES ('53', '1', '45');
INSERT INTO `sys_role_menu` VALUES ('54', '1', '9');
INSERT INTO `sys_role_menu` VALUES ('55', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('56', '1', '81');
INSERT INTO `sys_role_menu` VALUES ('57', '1', '85');
INSERT INTO `sys_role_menu` VALUES ('58', '1', '1113');
INSERT INTO `sys_role_menu` VALUES ('59', '1', '1114');
INSERT INTO `sys_role_menu` VALUES ('60', '1', '1115');
INSERT INTO `sys_role_menu` VALUES ('61', '1', '1116');
INSERT INTO `sys_role_menu` VALUES ('62', '1', '-666666');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1');

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
INSERT INTO `sys_user_token` VALUES ('1', 'a01811f5e18e4d54d7420c2e928a386f', '2020-08-04 01:20:40', '2020-08-03 13:20:40');

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
  `in_out` tinyint(1) unsigned DEFAULT NULL COMMENT '消息方向',
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
