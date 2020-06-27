/*
Navicat MySQL Data Transfer

Source Server         : Homestead
Source Server Version : 50727
Source Host           : 192.168.10.10:3306
Source Database       : tea

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2020-06-27 18:57:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tea_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `tea_admin_menu`;
CREATE TABLE `tea_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tea_admin_menu
-- ----------------------------
INSERT INTO `tea_admin_menu` VALUES ('1', '0', '1', '控制台', 'fa-bar-chart', '/', null, null, '2020-06-27 07:23:24');
INSERT INTO `tea_admin_menu` VALUES ('2', '0', '2', '系统设置', 'fa-tasks', null, null, null, '2020-06-27 07:20:21');
INSERT INTO `tea_admin_menu` VALUES ('3', '2', '3', '管理员', 'fa-users', 'auth/users', null, null, '2020-06-27 07:19:15');
INSERT INTO `tea_admin_menu` VALUES ('4', '2', '4', '角色', 'fa-user', 'auth/roles', null, null, '2020-06-27 07:19:26');
INSERT INTO `tea_admin_menu` VALUES ('5', '2', '5', '权限', 'fa-ban', 'auth/permissions', null, null, '2020-06-27 07:20:33');
INSERT INTO `tea_admin_menu` VALUES ('6', '2', '6', '菜单', 'fa-bars', 'auth/menu', null, null, '2020-06-27 07:20:42');
INSERT INTO `tea_admin_menu` VALUES ('7', '2', '7', '操作日志', 'fa-history', 'auth/logs', null, null, '2020-06-27 07:20:53');
INSERT INTO `tea_admin_menu` VALUES ('8', '0', '0', '用户管理', 'fa-user', null, null, '2020-06-27 07:29:46', '2020-06-27 09:20:00');
INSERT INTO `tea_admin_menu` VALUES ('9', '0', '0', '商品管理', 'fa-product-hunt', 'products', null, '2020-06-27 07:40:12', '2020-06-27 07:40:31');
INSERT INTO `tea_admin_menu` VALUES ('10', '8', '0', '用户列表', 'fa-list', 'users', null, '2020-06-27 09:20:22', '2020-06-27 09:20:22');
INSERT INTO `tea_admin_menu` VALUES ('11', '8', '0', '商品数据', 'fa-product-hunt', 'users-products', null, '2020-06-27 09:23:05', '2020-06-27 09:23:05');
INSERT INTO `tea_admin_menu` VALUES ('12', '8', '0', '资金明细', 'fa-money', 'users-capitals', null, '2020-06-27 09:23:30', '2020-06-27 09:23:49');

-- ----------------------------
-- Table structure for tea_admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `tea_admin_operation_log`;
CREATE TABLE `tea_admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tea_admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tea_admin_operation_log
-- ----------------------------
INSERT INTO `tea_admin_operation_log` VALUES ('1', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-06-27 07:17:11', '2020-06-27 07:17:11');
INSERT INTO `tea_admin_operation_log` VALUES ('2', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-06-27 07:17:43', '2020-06-27 07:17:43');
INSERT INTO `tea_admin_operation_log` VALUES ('3', '1', 'admin/auth/logout', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:18:30', '2020-06-27 07:18:30');
INSERT INTO `tea_admin_operation_log` VALUES ('4', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-06-27 07:18:40', '2020-06-27 07:18:40');
INSERT INTO `tea_admin_operation_log` VALUES ('5', '1', 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:18:46', '2020-06-27 07:18:46');
INSERT INTO `tea_admin_operation_log` VALUES ('6', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:18:55', '2020-06-27 07:18:55');
INSERT INTO `tea_admin_operation_log` VALUES ('7', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:18:58', '2020-06-27 07:18:58');
INSERT INTO `tea_admin_operation_log` VALUES ('8', '1', 'admin/auth/menu/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:19:05', '2020-06-27 07:19:05');
INSERT INTO `tea_admin_operation_log` VALUES ('9', '1', 'admin/auth/menu/3', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tea.com\\/admin\\/auth\\/menu\"}', '2020-06-27 07:19:15', '2020-06-27 07:19:15');
INSERT INTO `tea_admin_operation_log` VALUES ('10', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:19:16', '2020-06-27 07:19:16');
INSERT INTO `tea_admin_operation_log` VALUES ('11', '1', 'admin/auth/menu/4/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:19:20', '2020-06-27 07:19:20');
INSERT INTO `tea_admin_operation_log` VALUES ('12', '1', 'admin/auth/menu/4', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tea.com\\/admin\\/auth\\/menu\"}', '2020-06-27 07:19:26', '2020-06-27 07:19:26');
INSERT INTO `tea_admin_operation_log` VALUES ('13', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:19:27', '2020-06-27 07:19:27');
INSERT INTO `tea_admin_operation_log` VALUES ('14', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:20:03', '2020-06-27 07:20:03');
INSERT INTO `tea_admin_operation_log` VALUES ('15', '1', 'admin/auth/menu/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:20:15', '2020-06-27 07:20:15');
INSERT INTO `tea_admin_operation_log` VALUES ('16', '1', 'admin/auth/menu/2', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tea.com\\/admin\\/auth\\/menu\"}', '2020-06-27 07:20:21', '2020-06-27 07:20:21');
INSERT INTO `tea_admin_operation_log` VALUES ('17', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:20:22', '2020-06-27 07:20:22');
INSERT INTO `tea_admin_operation_log` VALUES ('18', '1', 'admin/auth/menu/5/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:20:25', '2020-06-27 07:20:25');
INSERT INTO `tea_admin_operation_log` VALUES ('19', '1', 'admin/auth/menu/5', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tea.com\\/admin\\/auth\\/menu\"}', '2020-06-27 07:20:33', '2020-06-27 07:20:33');
INSERT INTO `tea_admin_operation_log` VALUES ('20', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:20:34', '2020-06-27 07:20:34');
INSERT INTO `tea_admin_operation_log` VALUES ('21', '1', 'admin/auth/menu/6/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:20:37', '2020-06-27 07:20:37');
INSERT INTO `tea_admin_operation_log` VALUES ('22', '1', 'admin/auth/menu/6', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tea.com\\/admin\\/auth\\/menu\"}', '2020-06-27 07:20:42', '2020-06-27 07:20:42');
INSERT INTO `tea_admin_operation_log` VALUES ('23', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:20:43', '2020-06-27 07:20:43');
INSERT INTO `tea_admin_operation_log` VALUES ('24', '1', 'admin/auth/menu/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:20:45', '2020-06-27 07:20:45');
INSERT INTO `tea_admin_operation_log` VALUES ('25', '1', 'admin/auth/menu/7', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tea.com\\/admin\\/auth\\/menu\"}', '2020-06-27 07:20:52', '2020-06-27 07:20:52');
INSERT INTO `tea_admin_operation_log` VALUES ('26', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:20:53', '2020-06-27 07:20:53');
INSERT INTO `tea_admin_operation_log` VALUES ('27', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:20:55', '2020-06-27 07:20:55');
INSERT INTO `tea_admin_operation_log` VALUES ('28', '1', 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:21:00', '2020-06-27 07:21:00');
INSERT INTO `tea_admin_operation_log` VALUES ('29', '1', 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:21:04', '2020-06-27 07:21:04');
INSERT INTO `tea_admin_operation_log` VALUES ('30', '1', 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '[]', '2020-06-27 07:22:29', '2020-06-27 07:22:29');
INSERT INTO `tea_admin_operation_log` VALUES ('31', '1', 'admin/auth/users/1', 'PUT', '192.168.10.1', '{\"username\":\"admin\",\"name\":\"\\u7ba1\\u7406\\u5458\",\"password\":\"$2y$10$t6G1Q1TgmVzYNM89mtck1uZt6pzq888tfWoT8P8fGRphYF1iH9rLm\",\"password_confirmation\":\"$2y$10$t6G1Q1TgmVzYNM89mtck1uZt6pzq888tfWoT8P8fGRphYF1iH9rLm\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\",\"_method\":\"PUT\"}', '2020-06-27 07:22:38', '2020-06-27 07:22:38');
INSERT INTO `tea_admin_operation_log` VALUES ('32', '1', 'admin/auth/users', 'GET', '192.168.10.1', '[]', '2020-06-27 07:22:39', '2020-06-27 07:22:39');
INSERT INTO `tea_admin_operation_log` VALUES ('33', '1', 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:22:43', '2020-06-27 07:22:43');
INSERT INTO `tea_admin_operation_log` VALUES ('34', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:22:49', '2020-06-27 07:22:49');
INSERT INTO `tea_admin_operation_log` VALUES ('35', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:23:08', '2020-06-27 07:23:08');
INSERT INTO `tea_admin_operation_log` VALUES ('36', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:23:12', '2020-06-27 07:23:12');
INSERT INTO `tea_admin_operation_log` VALUES ('37', '1', 'admin/auth/menu/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:23:18', '2020-06-27 07:23:18');
INSERT INTO `tea_admin_operation_log` VALUES ('38', '1', 'admin/auth/menu/1', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u63a7\\u5236\\u53f0\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tea.com\\/admin\\/auth\\/menu\"}', '2020-06-27 07:23:24', '2020-06-27 07:23:24');
INSERT INTO `tea_admin_operation_log` VALUES ('39', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:23:24', '2020-06-27 07:23:24');
INSERT INTO `tea_admin_operation_log` VALUES ('40', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:23:30', '2020-06-27 07:23:30');
INSERT INTO `tea_admin_operation_log` VALUES ('41', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:24:09', '2020-06-27 07:24:09');
INSERT INTO `tea_admin_operation_log` VALUES ('42', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:24:24', '2020-06-27 07:24:24');
INSERT INTO `tea_admin_operation_log` VALUES ('43', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:24:30', '2020-06-27 07:24:30');
INSERT INTO `tea_admin_operation_log` VALUES ('44', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-06-27 07:25:01', '2020-06-27 07:25:01');
INSERT INTO `tea_admin_operation_log` VALUES ('45', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-06-27 07:25:16', '2020-06-27 07:25:16');
INSERT INTO `tea_admin_operation_log` VALUES ('46', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-06-27 07:25:27', '2020-06-27 07:25:27');
INSERT INTO `tea_admin_operation_log` VALUES ('47', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-06-27 07:25:35', '2020-06-27 07:25:35');
INSERT INTO `tea_admin_operation_log` VALUES ('48', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-06-27 07:25:43', '2020-06-27 07:25:43');
INSERT INTO `tea_admin_operation_log` VALUES ('49', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-06-27 07:25:49', '2020-06-27 07:25:49');
INSERT INTO `tea_admin_operation_log` VALUES ('50', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-06-27 07:25:54', '2020-06-27 07:25:54');
INSERT INTO `tea_admin_operation_log` VALUES ('51', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-06-27 07:25:59', '2020-06-27 07:25:59');
INSERT INTO `tea_admin_operation_log` VALUES ('52', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-06-27 07:27:37', '2020-06-27 07:27:37');
INSERT INTO `tea_admin_operation_log` VALUES ('53', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-06-27 07:27:59', '2020-06-27 07:27:59');
INSERT INTO `tea_admin_operation_log` VALUES ('54', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-06-27 07:28:17', '2020-06-27 07:28:17');
INSERT INTO `tea_admin_operation_log` VALUES ('55', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:28:21', '2020-06-27 07:28:21');
INSERT INTO `tea_admin_operation_log` VALUES ('56', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:28:29', '2020-06-27 07:28:29');
INSERT INTO `tea_admin_operation_log` VALUES ('57', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:28:49', '2020-06-27 07:28:49');
INSERT INTO `tea_admin_operation_log` VALUES ('58', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-user\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\"}', '2020-06-27 07:29:46', '2020-06-27 07:29:46');
INSERT INTO `tea_admin_operation_log` VALUES ('59', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:29:47', '2020-06-27 07:29:47');
INSERT INTO `tea_admin_operation_log` VALUES ('60', '1', 'admin/auth/menu/4/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:29:53', '2020-06-27 07:29:53');
INSERT INTO `tea_admin_operation_log` VALUES ('61', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:30:04', '2020-06-27 07:30:04');
INSERT INTO `tea_admin_operation_log` VALUES ('62', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:30:25', '2020-06-27 07:30:25');
INSERT INTO `tea_admin_operation_log` VALUES ('63', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:30:29', '2020-06-27 07:30:29');
INSERT INTO `tea_admin_operation_log` VALUES ('64', '1', 'admin/auth/menu/8/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:30:32', '2020-06-27 07:30:32');
INSERT INTO `tea_admin_operation_log` VALUES ('65', '1', 'admin/auth/menu/8', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-user\",\"uri\":\"users\\/index\",\"roles\":[null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tea.com\\/admin\\/auth\\/menu\"}', '2020-06-27 07:30:47', '2020-06-27 07:30:47');
INSERT INTO `tea_admin_operation_log` VALUES ('66', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:30:47', '2020-06-27 07:30:47');
INSERT INTO `tea_admin_operation_log` VALUES ('67', '1', 'admin/auth/menu/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:30:51', '2020-06-27 07:30:51');
INSERT INTO `tea_admin_operation_log` VALUES ('68', '1', 'admin/auth/menu/3/edit', 'GET', '192.168.10.1', '[]', '2020-06-27 07:30:57', '2020-06-27 07:30:57');
INSERT INTO `tea_admin_operation_log` VALUES ('69', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:31:03', '2020-06-27 07:31:03');
INSERT INTO `tea_admin_operation_log` VALUES ('70', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:31:05', '2020-06-27 07:31:05');
INSERT INTO `tea_admin_operation_log` VALUES ('71', '1', 'admin/auth/menu/8/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:31:28', '2020-06-27 07:31:28');
INSERT INTO `tea_admin_operation_log` VALUES ('72', '1', 'admin/auth/menu/8/edit', 'GET', '192.168.10.1', '[]', '2020-06-27 07:31:33', '2020-06-27 07:31:33');
INSERT INTO `tea_admin_operation_log` VALUES ('73', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:31:41', '2020-06-27 07:31:41');
INSERT INTO `tea_admin_operation_log` VALUES ('74', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:31:52', '2020-06-27 07:31:52');
INSERT INTO `tea_admin_operation_log` VALUES ('75', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:34:52', '2020-06-27 07:34:52');
INSERT INTO `tea_admin_operation_log` VALUES ('76', '1', 'admin/users/index', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:34:59', '2020-06-27 07:34:59');
INSERT INTO `tea_admin_operation_log` VALUES ('77', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:35:00', '2020-06-27 07:35:00');
INSERT INTO `tea_admin_operation_log` VALUES ('78', '1', 'admin/auth/menu/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:35:18', '2020-06-27 07:35:18');
INSERT INTO `tea_admin_operation_log` VALUES ('79', '1', 'admin/users/index', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:35:22', '2020-06-27 07:35:22');
INSERT INTO `tea_admin_operation_log` VALUES ('80', '1', 'admin/auth/menu/1/edit', 'GET', '192.168.10.1', '[]', '2020-06-27 07:35:23', '2020-06-27 07:35:23');
INSERT INTO `tea_admin_operation_log` VALUES ('81', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:35:26', '2020-06-27 07:35:26');
INSERT INTO `tea_admin_operation_log` VALUES ('82', '1', 'admin/auth/menu/8/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:35:32', '2020-06-27 07:35:32');
INSERT INTO `tea_admin_operation_log` VALUES ('83', '1', 'admin/auth/menu/8', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-user\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tea.com\\/admin\\/auth\\/menu\"}', '2020-06-27 07:35:39', '2020-06-27 07:35:39');
INSERT INTO `tea_admin_operation_log` VALUES ('84', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:35:40', '2020-06-27 07:35:40');
INSERT INTO `tea_admin_operation_log` VALUES ('85', '1', 'admin/auth/menu/8/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:35:46', '2020-06-27 07:35:46');
INSERT INTO `tea_admin_operation_log` VALUES ('86', '1', 'admin/auth/menu/8', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-user\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tea.com\\/admin\\/auth\\/menu\"}', '2020-06-27 07:35:53', '2020-06-27 07:35:53');
INSERT INTO `tea_admin_operation_log` VALUES ('87', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:35:53', '2020-06-27 07:35:53');
INSERT INTO `tea_admin_operation_log` VALUES ('88', '1', 'admin/users/index', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:35:56', '2020-06-27 07:35:56');
INSERT INTO `tea_admin_operation_log` VALUES ('89', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:35:57', '2020-06-27 07:35:57');
INSERT INTO `tea_admin_operation_log` VALUES ('90', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:37:44', '2020-06-27 07:37:44');
INSERT INTO `tea_admin_operation_log` VALUES ('91', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-06-27 07:38:15', '2020-06-27 07:38:15');
INSERT INTO `tea_admin_operation_log` VALUES ('92', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-06-27 07:39:21', '2020-06-27 07:39:21');
INSERT INTO `tea_admin_operation_log` VALUES ('93', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-06-27 07:39:26', '2020-06-27 07:39:26');
INSERT INTO `tea_admin_operation_log` VALUES ('94', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:39:54', '2020-06-27 07:39:54');
INSERT INTO `tea_admin_operation_log` VALUES ('95', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"products\",\"roles\":[null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\"}', '2020-06-27 07:40:12', '2020-06-27 07:40:12');
INSERT INTO `tea_admin_operation_log` VALUES ('96', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:40:13', '2020-06-27 07:40:13');
INSERT INTO `tea_admin_operation_log` VALUES ('97', '1', 'admin/auth/menu/9/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:40:18', '2020-06-27 07:40:18');
INSERT INTO `tea_admin_operation_log` VALUES ('98', '1', 'admin/auth/menu/9', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-product-hunt\",\"uri\":\"products\",\"roles\":[null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tea.com\\/admin\\/auth\\/menu\"}', '2020-06-27 07:40:31', '2020-06-27 07:40:31');
INSERT INTO `tea_admin_operation_log` VALUES ('99', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:40:31', '2020-06-27 07:40:31');
INSERT INTO `tea_admin_operation_log` VALUES ('100', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 07:48:52', '2020-06-27 07:48:52');
INSERT INTO `tea_admin_operation_log` VALUES ('101', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:48:58', '2020-06-27 07:48:58');
INSERT INTO `tea_admin_operation_log` VALUES ('102', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-06-27 07:49:39', '2020-06-27 07:49:39');
INSERT INTO `tea_admin_operation_log` VALUES ('103', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 07:49:43', '2020-06-27 07:49:43');
INSERT INTO `tea_admin_operation_log` VALUES ('104', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-06-27 07:49:56', '2020-06-27 07:49:56');
INSERT INTO `tea_admin_operation_log` VALUES ('105', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-06-27 07:50:47', '2020-06-27 07:50:47');
INSERT INTO `tea_admin_operation_log` VALUES ('106', '1', 'admin/products/1', 'GET', '192.168.10.1', '[]', '2020-06-27 07:51:20', '2020-06-27 07:51:20');
INSERT INTO `tea_admin_operation_log` VALUES ('107', '1', 'admin/products/1', 'GET', '192.168.10.1', '[]', '2020-06-27 07:58:21', '2020-06-27 07:58:21');
INSERT INTO `tea_admin_operation_log` VALUES ('108', '1', 'admin/products/1', 'GET', '192.168.10.1', '[]', '2020-06-27 08:07:30', '2020-06-27 08:07:30');
INSERT INTO `tea_admin_operation_log` VALUES ('109', '1', 'admin/products/1', 'GET', '192.168.10.1', '[]', '2020-06-27 08:07:41', '2020-06-27 08:07:41');
INSERT INTO `tea_admin_operation_log` VALUES ('110', '1', 'admin/products/1', 'GET', '192.168.10.1', '[]', '2020-06-27 08:11:48', '2020-06-27 08:11:48');
INSERT INTO `tea_admin_operation_log` VALUES ('111', '1', 'admin/products/1', 'GET', '192.168.10.1', '[]', '2020-06-27 08:12:03', '2020-06-27 08:12:03');
INSERT INTO `tea_admin_operation_log` VALUES ('112', '1', 'admin/products/1', 'GET', '192.168.10.1', '[]', '2020-06-27 08:14:21', '2020-06-27 08:14:21');
INSERT INTO `tea_admin_operation_log` VALUES ('113', '1', 'admin/products/1', 'GET', '192.168.10.1', '[]', '2020-06-27 08:14:55', '2020-06-27 08:14:55');
INSERT INTO `tea_admin_operation_log` VALUES ('114', '1', 'admin/products/1', 'GET', '192.168.10.1', '[]', '2020-06-27 08:15:17', '2020-06-27 08:15:17');
INSERT INTO `tea_admin_operation_log` VALUES ('115', '1', 'admin/products/1', 'GET', '192.168.10.1', '[]', '2020-06-27 08:15:45', '2020-06-27 08:15:45');
INSERT INTO `tea_admin_operation_log` VALUES ('116', '1', 'admin/products/1', 'GET', '192.168.10.1', '[]', '2020-06-27 08:15:59', '2020-06-27 08:15:59');
INSERT INTO `tea_admin_operation_log` VALUES ('117', '1', 'admin/products/1', 'GET', '192.168.10.1', '[]', '2020-06-27 08:16:50', '2020-06-27 08:16:50');
INSERT INTO `tea_admin_operation_log` VALUES ('118', '1', 'admin/products/1', 'GET', '192.168.10.1', '[]', '2020-06-27 08:18:35', '2020-06-27 08:18:35');
INSERT INTO `tea_admin_operation_log` VALUES ('119', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-06-27 08:22:31', '2020-06-27 08:22:31');
INSERT INTO `tea_admin_operation_log` VALUES ('120', '1', 'admin/products/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 08:30:09', '2020-06-27 08:30:09');
INSERT INTO `tea_admin_operation_log` VALUES ('121', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-06-27 08:30:15', '2020-06-27 08:30:15');
INSERT INTO `tea_admin_operation_log` VALUES ('122', '1', 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 08:30:21', '2020-06-27 08:30:21');
INSERT INTO `tea_admin_operation_log` VALUES ('123', '1', 'admin/auth/users/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 08:30:25', '2020-06-27 08:30:25');
INSERT INTO `tea_admin_operation_log` VALUES ('124', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 08:30:45', '2020-06-27 08:30:45');
INSERT INTO `tea_admin_operation_log` VALUES ('125', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 08:34:21', '2020-06-27 08:34:21');
INSERT INTO `tea_admin_operation_log` VALUES ('126', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 08:39:01', '2020-06-27 08:39:01');
INSERT INTO `tea_admin_operation_log` VALUES ('127', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 08:40:48', '2020-06-27 08:40:48');
INSERT INTO `tea_admin_operation_log` VALUES ('128', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:08:22', '2020-06-27 09:08:22');
INSERT INTO `tea_admin_operation_log` VALUES ('129', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:08:22', '2020-06-27 09:08:22');
INSERT INTO `tea_admin_operation_log` VALUES ('130', '1', 'admin/products/1', 'GET', '192.168.10.1', '[]', '2020-06-27 09:10:00', '2020-06-27 09:10:00');
INSERT INTO `tea_admin_operation_log` VALUES ('131', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:13:46', '2020-06-27 09:13:46');
INSERT INTO `tea_admin_operation_log` VALUES ('132', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-06-27 09:14:42', '2020-06-27 09:14:42');
INSERT INTO `tea_admin_operation_log` VALUES ('133', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-06-27 09:15:14', '2020-06-27 09:15:14');
INSERT INTO `tea_admin_operation_log` VALUES ('134', '1', 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:15:26', '2020-06-27 09:15:26');
INSERT INTO `tea_admin_operation_log` VALUES ('135', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-06-27 09:15:27', '2020-06-27 09:15:27');
INSERT INTO `tea_admin_operation_log` VALUES ('136', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-06-27 09:17:45', '2020-06-27 09:17:45');
INSERT INTO `tea_admin_operation_log` VALUES ('137', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_export_\":\"page:1\"}', '2020-06-27 09:17:51', '2020-06-27 09:17:51');
INSERT INTO `tea_admin_operation_log` VALUES ('138', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:18:50', '2020-06-27 09:18:50');
INSERT INTO `tea_admin_operation_log` VALUES ('139', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:19:02', '2020-06-27 09:19:02');
INSERT INTO `tea_admin_operation_log` VALUES ('140', '1', 'admin/auth/menu/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:19:05', '2020-06-27 09:19:05');
INSERT INTO `tea_admin_operation_log` VALUES ('141', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:19:30', '2020-06-27 09:19:30');
INSERT INTO `tea_admin_operation_log` VALUES ('142', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:19:34', '2020-06-27 09:19:34');
INSERT INTO `tea_admin_operation_log` VALUES ('143', '1', 'admin/auth/menu/8/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:19:42', '2020-06-27 09:19:42');
INSERT INTO `tea_admin_operation_log` VALUES ('144', '1', 'admin/auth/menu/8', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-user\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tea.com\\/admin\\/auth\\/menu\"}', '2020-06-27 09:20:00', '2020-06-27 09:20:00');
INSERT INTO `tea_admin_operation_log` VALUES ('145', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 09:20:01', '2020-06-27 09:20:01');
INSERT INTO `tea_admin_operation_log` VALUES ('146', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"8\",\"title\":\"\\u7528\\u6237\\u5217\\u8868\",\"icon\":\"fa-list\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\"}', '2020-06-27 09:20:22', '2020-06-27 09:20:22');
INSERT INTO `tea_admin_operation_log` VALUES ('147', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 09:20:23', '2020-06-27 09:20:23');
INSERT INTO `tea_admin_operation_log` VALUES ('148', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 09:20:25', '2020-06-27 09:20:25');
INSERT INTO `tea_admin_operation_log` VALUES ('149', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:20:31', '2020-06-27 09:20:31');
INSERT INTO `tea_admin_operation_log` VALUES ('150', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:20:45', '2020-06-27 09:20:45');
INSERT INTO `tea_admin_operation_log` VALUES ('151', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"8\",\"title\":\"\\u5546\\u54c1\\u6570\\u636e\",\"icon\":\"fa-product-hunt\",\"uri\":\"users-products\",\"roles\":[null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\"}', '2020-06-27 09:23:04', '2020-06-27 09:23:04');
INSERT INTO `tea_admin_operation_log` VALUES ('152', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 09:23:06', '2020-06-27 09:23:06');
INSERT INTO `tea_admin_operation_log` VALUES ('153', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u8d44\\u91d1\\u660e\\u7ec6\",\"icon\":\"fa-money\",\"uri\":\"users-capitals\",\"roles\":[null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\"}', '2020-06-27 09:23:29', '2020-06-27 09:23:29');
INSERT INTO `tea_admin_operation_log` VALUES ('154', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 09:23:30', '2020-06-27 09:23:30');
INSERT INTO `tea_admin_operation_log` VALUES ('155', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 09:23:33', '2020-06-27 09:23:33');
INSERT INTO `tea_admin_operation_log` VALUES ('156', '1', 'admin/auth/menu/12/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:23:44', '2020-06-27 09:23:44');
INSERT INTO `tea_admin_operation_log` VALUES ('157', '1', 'admin/auth/menu/12', 'PUT', '192.168.10.1', '{\"parent_id\":\"8\",\"title\":\"\\u8d44\\u91d1\\u660e\\u7ec6\",\"icon\":\"fa-money\",\"uri\":\"users-capitals\",\"roles\":[null],\"permission\":null,\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tea.com\\/admin\\/auth\\/menu\"}', '2020-06-27 09:23:49', '2020-06-27 09:23:49');
INSERT INTO `tea_admin_operation_log` VALUES ('158', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 09:23:50', '2020-06-27 09:23:50');
INSERT INTO `tea_admin_operation_log` VALUES ('159', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-06-27 09:23:52', '2020-06-27 09:23:52');
INSERT INTO `tea_admin_operation_log` VALUES ('160', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:23:58', '2020-06-27 09:23:58');
INSERT INTO `tea_admin_operation_log` VALUES ('161', '1', 'admin/users-products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:23:59', '2020-06-27 09:23:59');
INSERT INTO `tea_admin_operation_log` VALUES ('162', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:24:01', '2020-06-27 09:24:01');
INSERT INTO `tea_admin_operation_log` VALUES ('163', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-06-27 09:26:40', '2020-06-27 09:26:40');
INSERT INTO `tea_admin_operation_log` VALUES ('164', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:26:51', '2020-06-27 09:26:51');
INSERT INTO `tea_admin_operation_log` VALUES ('165', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:27:21', '2020-06-27 09:27:21');
INSERT INTO `tea_admin_operation_log` VALUES ('166', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:27:25', '2020-06-27 09:27:25');
INSERT INTO `tea_admin_operation_log` VALUES ('167', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:27:30', '2020-06-27 09:27:30');
INSERT INTO `tea_admin_operation_log` VALUES ('168', '1', 'admin/users-products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:27:58', '2020-06-27 09:27:58');
INSERT INTO `tea_admin_operation_log` VALUES ('169', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:28:01', '2020-06-27 09:28:01');
INSERT INTO `tea_admin_operation_log` VALUES ('170', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:28:20', '2020-06-27 09:28:20');
INSERT INTO `tea_admin_operation_log` VALUES ('171', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:28:37', '2020-06-27 09:28:37');
INSERT INTO `tea_admin_operation_log` VALUES ('172', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:34:55', '2020-06-27 09:34:55');
INSERT INTO `tea_admin_operation_log` VALUES ('173', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:35:05', '2020-06-27 09:35:05');
INSERT INTO `tea_admin_operation_log` VALUES ('174', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:36:22', '2020-06-27 09:36:22');
INSERT INTO `tea_admin_operation_log` VALUES ('175', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:36:37', '2020-06-27 09:36:37');
INSERT INTO `tea_admin_operation_log` VALUES ('176', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:37:50', '2020-06-27 09:37:50');
INSERT INTO `tea_admin_operation_log` VALUES ('177', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:40:49', '2020-06-27 09:40:49');
INSERT INTO `tea_admin_operation_log` VALUES ('178', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:41:18', '2020-06-27 09:41:18');
INSERT INTO `tea_admin_operation_log` VALUES ('179', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:41:35', '2020-06-27 09:41:35');
INSERT INTO `tea_admin_operation_log` VALUES ('180', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:41:40', '2020-06-27 09:41:40');
INSERT INTO `tea_admin_operation_log` VALUES ('181', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:41:47', '2020-06-27 09:41:47');
INSERT INTO `tea_admin_operation_log` VALUES ('182', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:42:04', '2020-06-27 09:42:04');
INSERT INTO `tea_admin_operation_log` VALUES ('183', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:42:21', '2020-06-27 09:42:21');
INSERT INTO `tea_admin_operation_log` VALUES ('184', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:42:23', '2020-06-27 09:42:23');
INSERT INTO `tea_admin_operation_log` VALUES ('185', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:42:34', '2020-06-27 09:42:34');
INSERT INTO `tea_admin_operation_log` VALUES ('186', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:42:44', '2020-06-27 09:42:44');
INSERT INTO `tea_admin_operation_log` VALUES ('187', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:42:52', '2020-06-27 09:42:52');
INSERT INTO `tea_admin_operation_log` VALUES ('188', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:43:08', '2020-06-27 09:43:08');
INSERT INTO `tea_admin_operation_log` VALUES ('189', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:44:21', '2020-06-27 09:44:21');
INSERT INTO `tea_admin_operation_log` VALUES ('190', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:44:30', '2020-06-27 09:44:30');
INSERT INTO `tea_admin_operation_log` VALUES ('191', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:44:35', '2020-06-27 09:44:35');
INSERT INTO `tea_admin_operation_log` VALUES ('192', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:44:55', '2020-06-27 09:44:55');
INSERT INTO `tea_admin_operation_log` VALUES ('193', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:45:05', '2020-06-27 09:45:05');
INSERT INTO `tea_admin_operation_log` VALUES ('194', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:45:11', '2020-06-27 09:45:11');
INSERT INTO `tea_admin_operation_log` VALUES ('195', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:45:18', '2020-06-27 09:45:18');
INSERT INTO `tea_admin_operation_log` VALUES ('196', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:46:26', '2020-06-27 09:46:26');
INSERT INTO `tea_admin_operation_log` VALUES ('197', '1', 'admin/users-capitals/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:46:29', '2020-06-27 09:46:29');
INSERT INTO `tea_admin_operation_log` VALUES ('198', '1', 'admin/users-capitals/1', 'GET', '192.168.10.1', '[]', '2020-06-27 09:47:11', '2020-06-27 09:47:11');
INSERT INTO `tea_admin_operation_log` VALUES ('199', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:47:16', '2020-06-27 09:47:16');
INSERT INTO `tea_admin_operation_log` VALUES ('200', '1', 'admin/users-capitals/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:47:21', '2020-06-27 09:47:21');
INSERT INTO `tea_admin_operation_log` VALUES ('201', '1', 'admin/users-capitals/1/edit', 'GET', '192.168.10.1', '[]', '2020-06-27 09:49:41', '2020-06-27 09:49:41');
INSERT INTO `tea_admin_operation_log` VALUES ('202', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:49:49', '2020-06-27 09:49:49');
INSERT INTO `tea_admin_operation_log` VALUES ('203', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:49:53', '2020-06-27 09:49:53');
INSERT INTO `tea_admin_operation_log` VALUES ('204', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:49:54', '2020-06-27 09:49:54');
INSERT INTO `tea_admin_operation_log` VALUES ('205', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 09:50:06', '2020-06-27 09:50:06');
INSERT INTO `tea_admin_operation_log` VALUES ('206', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:50:09', '2020-06-27 09:50:09');
INSERT INTO `tea_admin_operation_log` VALUES ('207', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 09:51:14', '2020-06-27 09:51:14');
INSERT INTO `tea_admin_operation_log` VALUES ('208', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 09:51:51', '2020-06-27 09:51:51');
INSERT INTO `tea_admin_operation_log` VALUES ('209', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:52:03', '2020-06-27 09:52:03');
INSERT INTO `tea_admin_operation_log` VALUES ('210', '1', 'admin/users-capitals/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:52:07', '2020-06-27 09:52:07');
INSERT INTO `tea_admin_operation_log` VALUES ('211', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:52:12', '2020-06-27 09:52:12');
INSERT INTO `tea_admin_operation_log` VALUES ('212', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 09:52:14', '2020-06-27 09:52:14');
INSERT INTO `tea_admin_operation_log` VALUES ('213', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 09:54:38', '2020-06-27 09:54:38');
INSERT INTO `tea_admin_operation_log` VALUES ('214', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 09:55:47', '2020-06-27 09:55:47');
INSERT INTO `tea_admin_operation_log` VALUES ('215', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:03:56', '2020-06-27 10:03:56');
INSERT INTO `tea_admin_operation_log` VALUES ('216', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:04:08', '2020-06-27 10:04:08');
INSERT INTO `tea_admin_operation_log` VALUES ('217', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 10:05:19', '2020-06-27 10:05:19');
INSERT INTO `tea_admin_operation_log` VALUES ('218', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 10:05:58', '2020-06-27 10:05:58');
INSERT INTO `tea_admin_operation_log` VALUES ('219', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 10:06:03', '2020-06-27 10:06:03');
INSERT INTO `tea_admin_operation_log` VALUES ('220', '1', 'admin/users-capitals/users', 'GET', '192.168.10.1', '[]', '2020-06-27 10:07:13', '2020-06-27 10:07:13');
INSERT INTO `tea_admin_operation_log` VALUES ('221', '1', 'admin/users-capitals/users', 'GET', '192.168.10.1', '[]', '2020-06-27 10:07:41', '2020-06-27 10:07:41');
INSERT INTO `tea_admin_operation_log` VALUES ('222', '1', 'admin/users-capitals/users', 'GET', '192.168.10.1', '[]', '2020-06-27 10:07:43', '2020-06-27 10:07:43');
INSERT INTO `tea_admin_operation_log` VALUES ('223', '1', 'admin/abc', 'GET', '192.168.10.1', '[]', '2020-06-27 10:08:07', '2020-06-27 10:08:07');
INSERT INTO `tea_admin_operation_log` VALUES ('224', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:09:01', '2020-06-27 10:09:01');
INSERT INTO `tea_admin_operation_log` VALUES ('225', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:13:30', '2020-06-27 10:13:30');
INSERT INTO `tea_admin_operation_log` VALUES ('226', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:14:07', '2020-06-27 10:14:07');
INSERT INTO `tea_admin_operation_log` VALUES ('227', '1', 'admin/userAccount', 'GET', '192.168.10.1', '[]', '2020-06-27 10:16:14', '2020-06-27 10:16:14');
INSERT INTO `tea_admin_operation_log` VALUES ('228', '1', 'admin/userAccount', 'GET', '192.168.10.1', '[]', '2020-06-27 10:16:43', '2020-06-27 10:16:43');
INSERT INTO `tea_admin_operation_log` VALUES ('229', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:17:11', '2020-06-27 10:17:11');
INSERT INTO `tea_admin_operation_log` VALUES ('230', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:24:08', '2020-06-27 10:24:08');
INSERT INTO `tea_admin_operation_log` VALUES ('231', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:24:58', '2020-06-27 10:24:58');
INSERT INTO `tea_admin_operation_log` VALUES ('232', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:31:33', '2020-06-27 10:31:33');
INSERT INTO `tea_admin_operation_log` VALUES ('233', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:31:36', '2020-06-27 10:31:36');
INSERT INTO `tea_admin_operation_log` VALUES ('234', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:31:41', '2020-06-27 10:31:41');
INSERT INTO `tea_admin_operation_log` VALUES ('235', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:31:47', '2020-06-27 10:31:47');
INSERT INTO `tea_admin_operation_log` VALUES ('236', '1', 'admin/userAccount', 'GET', '192.168.10.1', '[]', '2020-06-27 10:32:23', '2020-06-27 10:32:23');
INSERT INTO `tea_admin_operation_log` VALUES ('237', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:32:34', '2020-06-27 10:32:34');
INSERT INTO `tea_admin_operation_log` VALUES ('238', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:33:17', '2020-06-27 10:33:17');
INSERT INTO `tea_admin_operation_log` VALUES ('239', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:33:20', '2020-06-27 10:33:20');
INSERT INTO `tea_admin_operation_log` VALUES ('240', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:33:31', '2020-06-27 10:33:31');
INSERT INTO `tea_admin_operation_log` VALUES ('241', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:34:40', '2020-06-27 10:34:40');
INSERT INTO `tea_admin_operation_log` VALUES ('242', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:34:47', '2020-06-27 10:34:47');
INSERT INTO `tea_admin_operation_log` VALUES ('243', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:34:50', '2020-06-27 10:34:50');
INSERT INTO `tea_admin_operation_log` VALUES ('244', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:35:26', '2020-06-27 10:35:26');
INSERT INTO `tea_admin_operation_log` VALUES ('245', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:35:47', '2020-06-27 10:35:47');
INSERT INTO `tea_admin_operation_log` VALUES ('246', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:36:37', '2020-06-27 10:36:37');
INSERT INTO `tea_admin_operation_log` VALUES ('247', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:37:32', '2020-06-27 10:37:32');
INSERT INTO `tea_admin_operation_log` VALUES ('248', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:37:49', '2020-06-27 10:37:49');
INSERT INTO `tea_admin_operation_log` VALUES ('249', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:37:58', '2020-06-27 10:37:58');
INSERT INTO `tea_admin_operation_log` VALUES ('250', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:38:02', '2020-06-27 10:38:02');
INSERT INTO `tea_admin_operation_log` VALUES ('251', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:39:15', '2020-06-27 10:39:15');
INSERT INTO `tea_admin_operation_log` VALUES ('252', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:39:45', '2020-06-27 10:39:45');
INSERT INTO `tea_admin_operation_log` VALUES ('253', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:39:48', '2020-06-27 10:39:48');
INSERT INTO `tea_admin_operation_log` VALUES ('254', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:39:57', '2020-06-27 10:39:57');
INSERT INTO `tea_admin_operation_log` VALUES ('255', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:40:01', '2020-06-27 10:40:01');
INSERT INTO `tea_admin_operation_log` VALUES ('256', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:40:17', '2020-06-27 10:40:17');
INSERT INTO `tea_admin_operation_log` VALUES ('257', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:40:20', '2020-06-27 10:40:20');
INSERT INTO `tea_admin_operation_log` VALUES ('258', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:40:38', '2020-06-27 10:40:38');
INSERT INTO `tea_admin_operation_log` VALUES ('259', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:40:41', '2020-06-27 10:40:41');
INSERT INTO `tea_admin_operation_log` VALUES ('260', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:41:13', '2020-06-27 10:41:13');
INSERT INTO `tea_admin_operation_log` VALUES ('261', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:42:24', '2020-06-27 10:42:24');
INSERT INTO `tea_admin_operation_log` VALUES ('262', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:42:27', '2020-06-27 10:42:27');
INSERT INTO `tea_admin_operation_log` VALUES ('263', '1', 'admin/users-capitals', 'POST', '192.168.10.1', '{\"uid\":\"1\",\"account\":\"1\",\"price\":null,\"type\":\"0\",\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\"}', '2020-06-27 10:42:53', '2020-06-27 10:42:53');
INSERT INTO `tea_admin_operation_log` VALUES ('264', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:42:54', '2020-06-27 10:42:54');
INSERT INTO `tea_admin_operation_log` VALUES ('265', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:43:29', '2020-06-27 10:43:29');
INSERT INTO `tea_admin_operation_log` VALUES ('266', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:43:32', '2020-06-27 10:43:32');
INSERT INTO `tea_admin_operation_log` VALUES ('267', '1', 'admin/users-capitals', 'POST', '192.168.10.1', '{\"uid\":\"1\",\"account\":\"1\",\"price\":null,\"type\":\"0\",\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\"}', '2020-06-27 10:43:36', '2020-06-27 10:43:36');
INSERT INTO `tea_admin_operation_log` VALUES ('268', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:43:37', '2020-06-27 10:43:37');
INSERT INTO `tea_admin_operation_log` VALUES ('269', '1', 'admin/users-capitals', 'POST', '192.168.10.1', '{\"uid\":\"1\",\"account\":null,\"price\":\"1\",\"type\":\"0\",\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\"}', '2020-06-27 10:44:19', '2020-06-27 10:44:19');
INSERT INTO `tea_admin_operation_log` VALUES ('270', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:44:20', '2020-06-27 10:44:20');
INSERT INTO `tea_admin_operation_log` VALUES ('271', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:44:37', '2020-06-27 10:44:37');
INSERT INTO `tea_admin_operation_log` VALUES ('272', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:44:40', '2020-06-27 10:44:40');
INSERT INTO `tea_admin_operation_log` VALUES ('273', '1', 'admin/users-capitals', 'POST', '192.168.10.1', '{\"uid\":\"1\",\"account\":\"1\",\"price\":\"111\",\"type\":\"0\",\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\"}', '2020-06-27 10:44:45', '2020-06-27 10:44:45');
INSERT INTO `tea_admin_operation_log` VALUES ('274', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 10:44:45', '2020-06-27 10:44:45');
INSERT INTO `tea_admin_operation_log` VALUES ('275', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 10:48:34', '2020-06-27 10:48:34');
INSERT INTO `tea_admin_operation_log` VALUES ('276', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:48:38', '2020-06-27 10:48:38');
INSERT INTO `tea_admin_operation_log` VALUES ('277', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:48:56', '2020-06-27 10:48:56');
INSERT INTO `tea_admin_operation_log` VALUES ('278', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:48:59', '2020-06-27 10:48:59');
INSERT INTO `tea_admin_operation_log` VALUES ('279', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '[]', '2020-06-27 10:49:31', '2020-06-27 10:49:31');
INSERT INTO `tea_admin_operation_log` VALUES ('280', '1', 'admin/userAccount', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2020-06-27 10:49:35', '2020-06-27 10:49:35');
INSERT INTO `tea_admin_operation_log` VALUES ('281', '1', 'admin/users-capitals', 'POST', '192.168.10.1', '{\"uid\":\"1\",\"account\":\"10098\",\"price\":\"100\",\"type\":\"1\",\"_token\":\"N3CSp0t04VfVT9Nh7e1ct9cfAR9A4RLaAyfnOd3J\"}', '2020-06-27 10:49:46', '2020-06-27 10:49:46');
INSERT INTO `tea_admin_operation_log` VALUES ('282', '1', 'admin/users-capitals', 'GET', '192.168.10.1', '[]', '2020-06-27 10:49:47', '2020-06-27 10:49:47');
INSERT INTO `tea_admin_operation_log` VALUES ('283', '1', 'admin/users-capitals/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-06-27 10:50:24', '2020-06-27 10:50:24');

-- ----------------------------
-- Table structure for tea_admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `tea_admin_permissions`;
CREATE TABLE `tea_admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tea_admin_permissions_name_unique` (`name`),
  UNIQUE KEY `tea_admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tea_admin_permissions
-- ----------------------------
INSERT INTO `tea_admin_permissions` VALUES ('1', 'All permission', '*', '', '*', null, null);
INSERT INTO `tea_admin_permissions` VALUES ('2', 'Dashboard', 'dashboard', 'GET', '/', null, null);
INSERT INTO `tea_admin_permissions` VALUES ('3', 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', null, null);
INSERT INTO `tea_admin_permissions` VALUES ('4', 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', null, null);
INSERT INTO `tea_admin_permissions` VALUES ('5', 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', null, null);

-- ----------------------------
-- Table structure for tea_admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tea_admin_role_menu`;
CREATE TABLE `tea_admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `tea_admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tea_admin_role_menu
-- ----------------------------
INSERT INTO `tea_admin_role_menu` VALUES ('1', '2', null, null);

-- ----------------------------
-- Table structure for tea_admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `tea_admin_role_permissions`;
CREATE TABLE `tea_admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `tea_admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tea_admin_role_permissions
-- ----------------------------
INSERT INTO `tea_admin_role_permissions` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for tea_admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `tea_admin_role_users`;
CREATE TABLE `tea_admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `tea_admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tea_admin_role_users
-- ----------------------------
INSERT INTO `tea_admin_role_users` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for tea_admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `tea_admin_roles`;
CREATE TABLE `tea_admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tea_admin_roles_name_unique` (`name`),
  UNIQUE KEY `tea_admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tea_admin_roles
-- ----------------------------
INSERT INTO `tea_admin_roles` VALUES ('1', 'Administrator', 'administrator', '2020-06-27 07:16:07', '2020-06-27 07:16:07');

-- ----------------------------
-- Table structure for tea_admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `tea_admin_user_permissions`;
CREATE TABLE `tea_admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `tea_admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tea_admin_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for tea_admin_users
-- ----------------------------
DROP TABLE IF EXISTS `tea_admin_users`;
CREATE TABLE `tea_admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tea_admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tea_admin_users
-- ----------------------------
INSERT INTO `tea_admin_users` VALUES ('1', 'admin', '$2y$10$t6G1Q1TgmVzYNM89mtck1uZt6pzq888tfWoT8P8fGRphYF1iH9rLm', '管理员', null, 'cFTwAAYxYClsmMyweDWP0M1Plpu6hswGMQXw1OwZi9EzoY7TIonHuY1z75h7', '2020-06-27 07:16:07', '2020-06-27 07:22:38');

-- ----------------------------
-- Table structure for tea_failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `tea_failed_jobs`;
CREATE TABLE `tea_failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tea_failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for tea_migrations
-- ----------------------------
DROP TABLE IF EXISTS `tea_migrations`;
CREATE TABLE `tea_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tea_migrations
-- ----------------------------
INSERT INTO `tea_migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `tea_migrations` VALUES ('3', '2016_01_04_173148_create_admin_tables', '1');
INSERT INTO `tea_migrations` VALUES ('4', '2019_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `tea_migrations` VALUES ('7', '2020_06_27_074103_create_products_table', '2');
INSERT INTO `tea_migrations` VALUES ('8', '2014_10_12_000000_create_users_table', '3');
INSERT INTO `tea_migrations` VALUES ('9', '2020_06_27_085856_create_users_products_table', '3');
INSERT INTO `tea_migrations` VALUES ('11', '2020_06_27_090504_create_users_capitals_table', '4');

-- ----------------------------
-- Table structure for tea_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `tea_password_resets`;
CREATE TABLE `tea_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `tea_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tea_password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for tea_products
-- ----------------------------
DROP TABLE IF EXISTS `tea_products`;
CREATE TABLE `tea_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '序号名称',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_id` smallint(6) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `ref_price` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参考价',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1075 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tea_products
-- ----------------------------
INSERT INTO `tea_products` VALUES ('1', '1901', '8542', '2385', '￥25500', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('2', '2001', '招财进宝', '2384', '￥16.2万', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('3', '1701', '凰后归来800克', '2388', '￥16.8万', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('4', '1801', '汉宫月', '2387', '￥34000', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('5', '2001', '春秋大义', '2370', '￥10.9万', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('6', '2001', '7542', '2354', '￥13.4万', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('7', '2001', '7572', '2324', '￥14000', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('8', '801', '0532', '2305', '￥7600', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('9', '1901', '高山韵象(熟)', '2267', '￥4000', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('10', '2001', '洞天福地(散提)', '2251', '￥31000', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('11', '2001', '洞天福地', '2250', '￥19.8万', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('12', '1901', '7592', '2241', '￥2050', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('13', '1901', '老茶砖(生熟套装)', '2208', '￥23000', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('14', '201', '佛缘', '2207', '￥19000', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('15', '1901', '沧海(散片)', '2197', '￥10000', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('16', '1901', '烟霞', '2196', '￥10500', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('17', '1901', '内家功夫', '2186', '￥37500', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('18', '901', '云鼎', '2185', '￥8600', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('19', '1901', '益原素', '2184', '￥7400', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('20', '1901', '紫金贡饼', '2182', '￥8200', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('21', '1901', '沧海', '2181', '￥83000', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('22', '1801', '巴黎妙韵', '2177', '￥35000', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('23', '2006年', '州政府老班章', '2173', '￥270万', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('24', '2003年', '七星班章四印饼', '2172', '￥1130万', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('25', '1601', '锦绣红', '2169', '￥14000', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('26', '1601', '春秋套装', '2168', '￥26000', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('27', '1701', '7592', '2163', '￥2200', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('28', '001', '勐海印象', '2162', '￥20000', '2020-06-27 09:12:44', '2020-06-27 09:12:44');
INSERT INTO `tea_products` VALUES ('29', '1601', '芙蓉圆茶(熟)', '2161', '￥7500', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('30', '1601', '芙蓉圆茶(生)', '2160', '￥12000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('31', '201', '岩韵', '2152', '￥27.5万', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('32', '1602', '8582', '2145', '￥4200', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('33', '1801', '8592', '2132', '￥2300', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('34', '1801', 'V93熟沱', '2131', '￥1550', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('35', '1901', '8582', '2130', '￥16000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('36', '801', '7262', '2114', '￥7200', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('37', '1901', '8592', '2112', '￥2050', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('38', '2006年', '南糯大树圆茶(特制)', '2106', '￥22万', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('39', '1701', '五子登科', '2084', '￥23000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('40', '912', '中茶绿印7542', '2078', '￥27.5万', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('41', '1901', '7452', '2077', '￥2600', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('42', '1901', '千山一叶', '2076', '￥6800', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('43', '501', 'v93十年磨一剑250克(生)', '2074', '￥50000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('44', '1901', '传心', '2070', '￥28000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('45', '2008年', '801', '2056', '￥17万', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('46', '702', '7542', '2054', '￥10000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('47', '1901', '7572', '2051', '￥6700', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('48', '901', '69周年厂庆纪念饼', '2041', '￥23500', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('49', '2003年', '301', '2036', '￥23.5万', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('50', '1901', '蜜韵', '2034', '￥46000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('51', '1801', '老茶头', '2020', '￥5000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('52', '1901', '7542', '2018', '￥67000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('53', '1901', '拱金耙银（散提）', '2016', '￥17000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('54', '1901', '拱金耙银', '2015', '￥75000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('55', '1801', '7592', '2014', '￥1850', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('56', '1401', '铂金方砖', '2013', '￥6500', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('57', '101', '荷花艺术节纪念茶', '2012', '￥8800', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('58', '1601', '布朗山大益庄园生熟套装', '2011', '￥65000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('59', '1801', '大师时代', '2010', '￥60000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('60', '1301', '七彩孔雀', '2008', '￥70000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('61', '1601', '神山圣水', '2007', '￥50000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('62', '201', '孔雀', '2006', '￥20.5万', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('63', '901', '奔牛青饼', '2005', '￥16.5万', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('64', '501', '7542', '2003', '￥25万', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('65', '101', '相知永恒', '2002', '￥22500', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('66', '1801', '千山一叶', '2000', '￥62500', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('67', '1801', '盛世长安+长安印象（生熟套装）', '1999', '￥23万', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('68', '1801', '益品功夫', '1998', '￥37500', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('69', '201', '孔雀方茶', '1997', '￥32000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('70', '1801', '早春乔木', '1993', '￥17000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('71', '806', '8582', '1992', '￥19000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('72', '1701', '8562', '1991', '￥1600', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('73', '2003年', '003', '1990', '￥56500', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('74', '1801', '七星千羽孔雀', '1986', '￥50万', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('75', '1801', '7262', '1985', '￥3200', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('76', '1601', '相得益彰', '1916', '￥4300', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('77', '1801', '7692', '1915', '￥1950', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('78', '1701', '甲级沱茶', '1914', '￥1450', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('79', '1801', '益原素', '1909', '￥5800', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('80', '1801', '吾心光明', '1907', '￥40000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('81', '1801', '红韵圆茶', '1906', '￥850', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('82', '1702', '8592', '1905', '￥2000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('83', '1701', '星耀亚洲（熟）', '1893', '￥4500', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('84', '1801', '黄金甲', '1892', '￥23000', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('85', '1801', '0562', '1891', '￥2280', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('86', '1801', '7572', '1890', '￥4150', '2020-06-27 09:12:45', '2020-06-27 09:12:45');
INSERT INTO `tea_products` VALUES ('87', '1801', '云起', '1846', '￥43000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('88', '1801', '7542', '1826', '￥18000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('89', '1501', '云起', '1807', '￥13万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('90', '1801', '旺世(357克)', '1804', '￥23500', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('91', '1701', '龙柱圆茶', '1792', '￥4350', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('92', '701', '味最酽普饼', '1791', '￥7200', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('93', '2001年', '甲级青沱', '1790', '￥13.8万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('94', '1601', '长安套装(生:盛世长安', '1789', '￥32000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('95', '1602', '八级普饼', '1786', '￥2150', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('96', '1702', '7572', '1785', '￥5000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('97', '1701', '轩辕号', '1784', '￥97万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('98', '1701', '紫袍金带', '1783', '￥10000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('99', '2002年', '普洱方茶生茶100克', '1781', '￥26万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('100', '1401', '马中和韵', '1770', '￥62000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('101', '1701', 'V93', '1769', '￥2020', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('102', '1701', '柔侠', '1768', '￥16000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('103', '602/603', '8582', '1761', '￥34000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('104', '1701', '金大益', '1760', '￥19万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('105', '801', '勐宋孔雀', '1759', '￥10.5万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('106', '1701', '7452', '1758', '￥2600', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('107', '1701', '一团春意', '1755', '￥9500', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('108', '1701', '味最酽普饼', '1754', '￥1800', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('109', '1601', '陈香厚韵', '1753', '￥2000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('110', '1701', '味最酽青饼', '1752', '￥6400', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('111', '1601', '甲级沱', '1751', '￥1500', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('112', '1701', '8592', '1750', '￥2100', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('113', '1701', '天地一流', '1749', '￥27500', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('114', '801', '布朗孔雀', '1746', '￥31万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('115', '1601', '山韵', '1721', '￥10.2万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('116', '1601', '7532', '1713', '￥5800', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('117', '1701', '7572', '1711', '￥6000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('118', '1601', '楚韵', '1710', '￥3400', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('119', '1701', '7542', '1709', '￥25000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('120', '1601', '7592', '1708', '￥1650', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('121', '2016年', '厚德', '1707', '￥2350', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('122', '1701', '凤凰格格', '1706', '￥3300', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('123', '1601', '星耀亚洲', '1703', '￥23500', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('124', '2003年', '班章生态孔雀青沱', '1702', '￥280万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('125', '1601', '8592', '1701', '￥2250', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('126', '1701', '凰后归来', '1676', '￥63000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('127', '1601', '老茶头', '1675', '￥4800', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('128', '2000年', '易武正山典藏一首诗', '1674', '￥61万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('129', '2000年', '千禧红高档青饼', '1673', '￥50万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('130', '2000年', '云南高级普洱散茶100克', '1671', '￥43000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('131', '2000年', '中茶绿印7572', '1669', '￥14万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('132', '2000年', '无R红大益7542', '1668', '￥82.5万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('133', '2001年', '中茶红印易武正山普饼', '1667', '￥12万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('134', '2001年', '班章贡饼', '1666', '￥97万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('135', '2001年', '宫廷普洱散茶', '1665', '暂无报价', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('136', '2001年', '云南勐海高级普洱散茶200克', '1664', '￥42500', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('137', '2001年', '甲级云南普洱散茶200克', '1663', '￥43500', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('138', '2001年', '甲级普洱熟沱', '1662', '￥45000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('139', '2001年', '易武正山野生茶特级品熟沱', '1661', '￥19.6万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('140', '2001年', '103易武正山野生茶特级品', '1660', '￥66万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('141', '2001年', '中茶老树圆茶普饼', '1659', '￥14.8万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('142', '2001年', '中茶绿印简体云7592', '1658', '￥79000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('143', '2001年', '红大益7262', '1657', '￥90000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('144', '2001年', '中茶绿印繁体云7572(勐海茶厂版)', '1656', '￥85000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('145', '2001年', '中茶绿印繁体云7572(土产畜产进出口公司版)', '1655', '￥84000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('146', '2001年', '红大益繁体云7572', '1654', '￥83000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('147', '2002年', '940', '1653', '￥25.5万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('148', '2002年', '905', '1652', '￥23.2万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('149', '2002年', '班章生态大叶青饼', '1651', '￥620万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('150', '2002年', '210', '1650', '￥26万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('151', '2002年', '班章二号青饼', '1649', '￥420万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('152', '2002年', '红大益7572', '1648', '￥70000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('153', '2002年', '204', '1647', '￥90500', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('154', '2002年', '中茶绿印7582', '1646', '￥21万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('155', '2002年', '中茶黄印7582', '1645', '￥21万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('156', '2002年', '红大益云南野生大叶青饼', '1644', '￥285万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('157', '2002年', '936', '1643', '￥34万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('158', '2002年', '215', '1642', '￥26.8万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('159', '2002年', '208', '1641', '￥27.5万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('160', '2002年', '普洱方茶熟茶250克', '1640', '￥55000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('161', '2002年', '普洱方茶生茶250克', '1639', '￥14.2万', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('162', '2002年', '勐海红丝带青沱250克（竹壳包装版）', '1638', '￥80000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('163', '2002年', '勐海红丝带青沱250克', '1637', '￥85000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('164', '2002年', '甲级云南普洱散茶100克', '1636', '￥35500', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('165', '2002年', '中茶勐海青沱', '1635', '￥96000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('166', '2002年', '勐海红丝带青沱100克', '1634', '￥96000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('167', '2003年', '107', '1633', '￥24000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('168', '2003年', '世纪饼', '1632', '￥30000', '2020-06-27 09:12:46', '2020-06-27 09:12:46');
INSERT INTO `tea_products` VALUES ('169', '201', '红大益易武正山野生茶特级品357克', '1631', '￥35万', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('170', '2003年', '神舟五号普饼500克', '1628', '￥38500', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('171', '2003年', '云南银毫饼3000克', '1627', '暂无报价', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('172', '2003年', '孔雀之乡青饼', '1626', '￥28万', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('173', '2003', '精品易武山', '1625', '￥10万', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('174', '302', '甲级红大益普饼', '1624', '￥60000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('175', '302', '甲级红大益青饼', '1623', '￥18万', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('176', '2003年', '912', '1622', '￥30万', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('177', '2003年', '301', '1621', '￥53000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('178', '2003年', '912', '1620', '￥13万', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('179', '2003年', '203', '1619', '￥25万', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('180', '2003年', '易武正山野生茶珍藏品一斤装(清明前茶)', '1618', '￥18.5万', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('181', '2003年', '中茶绿印7572', '1617', '暂无报价', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('182', '2003年', '孔雀青沱', '1616', '￥42.5万', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('183', '2003年', '甲级云南普洱散茶200克', '1615', '￥33500', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('184', '2003年', '甲级云南普洱散茶100克', '1614', '￥34000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('185', '2003年', '云南勐海高级普洱散茶200克', '1613', '￥34000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('186', '2003年', '云南高级普洱散茶100克', '1612', '￥33000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('187', '2003年', '大金瓜熟茶', '1611', '￥26万', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('188', '2003年', '大金瓜生茶', '1610', '￥45万', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('189', '2003年', '普洱青砖250克', '1609', '￥61000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('190', '2003年', '勐海熟沱100克', '1608', '￥28500', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('191', '2003年', '勐海青沱100克', '1607', '￥63000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('192', '2003年', '甲级熟沱100克', '1606', '￥28000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('193', '2003年', '101', '1604', '￥34万', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('194', '2003年', '918', '1603', '￥52000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('195', '2003年', '002', '1602', '￥66000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('196', '1601', '翡翠', '1598', '￥5550', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('197', '1601', '越陈越香', '1597', '￥2400', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('198', '2004年', '大大益一公斤砖', '1596', '￥47000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('199', '2004年', '普洱饼', '1595', '￥72000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('200', '2004年', '乔木圆茶', '1591', '￥16万', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('201', '2004年', '绿色有机方茶熟茶250克', '1590', '￥44500', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('202', '2004年', '绿色有机方茶生茶250克', '1589', '￥12万', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('203', '2004年', '易武正山野生茶珍藏品一斤装(清明前茶)', '1587', '￥15.2万', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('204', '2004年', '紫大益7572一片叶', '1586', '￥77000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('205', '2004年', '甲级云南普洱散茶100克', '1585', '￥17000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('206', '2004年', '云南高级普洱散茶100克', '1584', '￥17800', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('207', '2004年', '甲级青沱250克', '1583', '￥55000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('208', '2004年', '勐海茶厂开张纪念普洱贡茶', '1580', '￥18500', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('209', '2004年', '勐海茶厂大事件见证饼(熟)', '1579', '￥12500', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('210', '2004年', '首届中国国际茶业博览会纪念饼', '1578', '暂无报价', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('211', '1601', '黄金岁月（生）', '1577', '￥20000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('212', '1601', '兰韵', '1576', '￥34000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('213', '901', '7562砖', '1575', '￥5500', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('214', '1601', '7572', '1573', '￥4300', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('215', '1601', '春秋（生熟一套）', '1571', '￥48000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('216', '1601', '7562砖', '1569', '￥3000', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('217', '2003年', '云梅8582', '1568', '￥15.5万', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('218', '1601', '珍藏孔雀', '1566', '￥30万', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('219', '1601', 'V93', '1565', '￥2250', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('220', '1601', '得福', '1563', '￥1550', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('221', '1601', '8582', '1559', '￥5200', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('222', '1601', '陈香雅韵', '1558', '￥2200', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('223', '1601', '玫瑰大益', '1551', '￥9500', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('224', '2016年', '徽之韵', '1548', '￥1650', '2020-06-27 09:12:47', '2020-06-27 09:12:47');
INSERT INTO `tea_products` VALUES ('225', '1601', '群峰之上', '1546', '￥15万', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('226', '1601', '八级普饼', '1541', '￥2200', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('227', '1601', '0532', '1540', '￥2900', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('228', '1601', '老树圆茶', '1538', '￥82000', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('229', '2016年', '金玉', '1536', '￥2300', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('230', '2003年', '云梅春茶青饼', '1535', '￥14.3万', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('231', '1601', '7752', '1532', '￥2080', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('232', '1601', '高山韵象（生）', '1530', '￥54000', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('233', '1601', '金果', '1526', '￥1750', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('234', '2003年', '红大益7262', '1525', '￥56000', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('235', '1601', '莲韵', '1524', '￥2100', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('236', '1601', '7542', '1523', '￥14000', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('237', '801', '08青沱250克', '1521', '￥5000', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('238', '801', '7692', '1520', '￥4900', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('239', '2001年', '红大益简体云7542', '1519', '￥38万', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('240', '2007年', '701', '1518', '￥68万', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('241', '1601', '7452', '1517', '￥2800', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('242', '1601', '六六大顺熟砖', '1516', '￥2700', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('243', '1501', '7572', '1515', '￥3250', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('244', '2007年', '701', '1514', '￥13.5万', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('245', '1501', '7672', '1513', '￥2500', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('246', '1501', '大益普洱熟砖', '1512', '￥2700', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('247', '1601', '云水臻', '1511', '￥18000', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('248', '1601', '龙生甘露', '1510', '￥15000', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('249', '1601', '美猴乾坤【“悟空”饼】', '1500', '￥2450', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('250', '1601', '美猴乾坤【“猴王”特藏版】', '1499', '￥9500', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('251', '1601', '美猴乾坤【经典珍藏版】', '1498', '￥38500', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('252', '1501', '8592', '1496', '￥2600', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('253', '501', '7592', '1495', '￥22600', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('254', '301', '甲级红大益青饼', '1493', '￥18万', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('255', '1501', '象山普饼', '1492', '￥2500', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('256', '1501', '7542', '1491', '￥4500', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('257', '2004年', '7592', '1474', '￥46000', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('258', '2003年', '301', '1473', '￥32万', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('259', '2003年', '301', '1472', '￥56500', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('260', '2003年', '316', '1470', '￥89000', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('261', '201', '红大益易武正山野生茶特级品400克(手写大票)', '1467', '￥42万', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('262', '1501', '高山韵象(熟)', '1463', '￥4500', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('263', '1501', '7742', '1462', '￥34000', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('264', '1501', '南糯生态青饼', '1459', '￥32000', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('265', '1501', '茶缘', '1458', '￥2350', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('266', '1501', '普洱·源（生）', '1455', '￥3850', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('267', '401', '红大益8052', '1450', '￥45万', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('268', '301', '7532', '1449', '￥21.5万', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('269', '1501', '飞虎传奇', '1448', '￥3000', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('270', '902', '泡益泡', '1447', '￥2100', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('271', '1501', '勐海沱茶生', '1446', '￥3100', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('272', '1501', '大益传奇', '1421', '￥21500', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('273', '1501', '御贡圆茶', '1370', '￥2400', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('274', '1501', '陈香雅韵', '1369', '￥2200', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('275', '2001年', '中茶黄印7502', '1368', '￥15.6万', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('276', '2001年', '红大益简体云7502', '1367', '￥16.3万', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('277', '2001年', '中茶绿印简体云7502', '1366', '￥41.5万', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('278', '1501', '7552', '1365', '￥2900', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('279', '1501', '勐海沱茶熟', '1364', '￥1400', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('280', '501', '8582', '1363', '￥13.5万', '2020-06-27 09:12:48', '2020-06-27 09:12:48');
INSERT INTO `tea_products` VALUES ('281', '1401', '经典7542', '1362', '￥1850', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('282', '2003年', '巴达大白毫200克', '1358', '￥56000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('283', '1501', '陈韵青饼', '1357', '￥11000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('284', '1501', '古韵传芳', '1355', '￥35000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('285', '1501', '普洱·源（熟）', '1351', '￥1850', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('286', '1501', '春圆', '1350', '￥14000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('287', '604', '7542', '1347', '￥36000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('288', '103', '甲级沱', '1346', '￥2250', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('289', '1401', '红玉', '1345', '￥3300', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('290', '2004年', '401', '1340', '￥26万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('291', '2004年', '红大益7262', '1338', '￥47000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('292', '401', '7532', '1336', '￥19万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('293', '2004年', '班章贡青饼', '1334', '￥110万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('294', '401', '三级普饼', '1332', '￥45500', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('295', '401', '红大益青饼357克', '1331', '￥22万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('296', '401', '红大益青饼400克', '1330', '￥24.5万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('297', '2004年', '甲级青沱100克', '1329', '￥48300', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('298', '2004年', '甲级熟沱100克', '1327', '￥19500', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('299', '2004年', '抗日战争胜利六十周年纪念普饼', '1322', '￥50000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('300', '2004年', '抗日战争胜利六十周年纪念青饼', '1321', '暂无报价', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('301', '504', '8582', '1320', '￥14.5万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('302', '2001年', '红大益简体云7572', '1318', '￥98000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('303', '2000年', '建厂六十周年纪念版', '1317', '￥24万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('304', '2001年', '销台六号青饼', '1316', '￥72万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('305', '2000年', '班章特2号普饼', '1315', '￥320万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('306', '2000年', '无R红大益7262', '1314', '￥17.8万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('307', '2000年', '无R红大益7062红丝带', '1313', '￥125万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('308', '2001年', '中茶绿印简体云7572', '1312', '￥13.3万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('309', '2002年', '春尖饼', '1311', '￥10.2万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('310', '2003年', '神舟五号青饼1000克', '1310', '￥43500', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('311', '2003年', '咖啡孔雀饼茶400克', '1309', '￥28万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('312', '2003年', '粉红孔雀2号熟饼357克', '1308', '￥25.2万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('313', '918', '桃红大益7572', '1307', '￥10.5万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('314', '2003年', '班章生态青砖1000克', '1306', '￥100万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('315', '2003年', '普洱方茶生茶100克', '1304', '￥13.8万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('316', '2003年', '中茶绿印7542', '1303', '￥25.5万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('317', '2003年', '紫大益7542', '1301', '￥32.5万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('318', '301', '中茶黄印7572', '1299', '￥53000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('319', '2003年', '301', '1297', '￥56000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('320', '301', '乔木老树易武500克', '1294', '￥180万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('321', '801', '08青沱100克', '1293', '￥4900', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('322', '', '熊猫沱（白标）', '1289', '￥87000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('323', '1501', '紫大益', '1287', '￥45000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('324', '1501', '甲级沱', '1285', '￥1600', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('325', '1501', '福禄双喜', '1284', '￥1300', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('326', '2013年', '醇香四季花草茗茶叶礼盒', '1283', '暂无报价', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('327', '', '熊猫沱（花沱）', '1282', '￥42000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('328', '', '小2易武正山野生茶特级品', '1281', '￥120万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('329', '201', '易武正山野生茶特级品（灰绳）', '1280', '￥145万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('330', '2003年', '8112谷花茶', '1279', '￥19.5万', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('331', '101', 'V93', '1278', '￥3550', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('332', '1501', '7692', '1275', '￥2100', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('333', '1401', '正品小金沱', '1274', '￥1050', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('334', '1401', '福禄双喜', '1273', '￥1150', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('335', '1401', '普知味三年陈', '1272', '￥1900', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('336', '901', '一品高', '1271', '￥3000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('337', '1301', '8592', '1270', '￥3700', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('338', '801', '大益春早·超级早春女儿茶', '1269', '￥5000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('339', '1501', 'V93', '1265', '￥1950', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('340', '101', '7562', '1264', '￥4100', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('341', '1501', '大吉象山', '1262', '￥5800', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('342', '1401', '老茶头', '1261', '￥4600', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('343', '2003年', '301', '1260', '￥79000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('344', '1401', '五子登科熟', '1259', '￥2950', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('345', '2004年', '博字7572', '1258', '￥49500', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('346', '1401', '勐海之星', '1257', '￥3000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('347', '1401', '甲级沱茶', '1256', '￥1600', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('348', '1401', '金针白莲', '1255', '￥8800', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('349', '1401', '7592', '1254', '￥2600', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('350', '1401', '7572', '1253', '￥2900', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('351', '1501', '善美祥羊', '1250', '￥20500', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('352', '201', '金刚-广州大佛寺复建特制茶', '1246', '暂无报价', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('353', '1401', '大益传世', '1237', '￥57000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('354', '1301', '宫廷散茶礼盒', '1219', '￥2700', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('355', '1401', '大叶醇', '1217', '￥2650', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('356', '2014年', '山水韵', '1215', '￥46000', '2020-06-27 09:12:49', '2020-06-27 09:12:49');
INSERT INTO `tea_products` VALUES ('357', '1401', '勐海孔雀', '1211', '￥13.5万', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('358', '003', '8592', '1210', '￥3800', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('359', '002', '8592', '1209', '￥3700', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('360', '2014年', '藏心', '1206', '￥1800', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('361', '2014年', '藏心8年陈琥珀珍普洱茶', '1205', '￥2000', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('362', '1401', 'V93', '1204', '￥1950', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('363', '801', '8562', '1179', '￥6200', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('364', '802', '8562', '1178', '￥5200', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('365', '1401', '经典红丝带7432', '1174', '￥10500', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('366', '1401', '金色乔木', '1163', '￥43000', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('367', '1401', '普知味青饼', '1162', '￥3000', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('368', '1301', '五子登科生茶', '1161', '￥3200', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('369', '1301', '五子登科熟饼', '1160', '￥3250', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('370', '802', '7542', '1159', '￥9000', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('371', '701', '8542', '1158', '￥15000', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('372', '1301', '小龙柱', '1152', '￥6500', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('373', '1401', '7262', '1151', '￥2700', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('374', '201', '巴达高山有机茶', '1149', '￥3500', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('375', '201', '怡品', '1148', '￥6000', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('376', '201', '大团圆', '1147', '￥3200', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('377', '203', '7572', '1146', '￥5650', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('378', '201', '7592', '1145', '￥3200', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('379', '203', '8592', '1144', '￥3400', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('380', '201', '醇品', '1143', '￥3100', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('381', '201', '如意沱', '1142', '￥1450', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('382', '1401', '易武正山', '1141', '￥22500', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('383', '801', '大益红熟茶', '1140', '￥7800', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('384', '801', '大经典熟茶', '1139', '￥7800', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('385', '801', '大经典生茶', '1138', '￥15000', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('386', '701', '8582', '1133', '￥21200', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('387', '1401', '7542', '1128', '￥4300', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('388', '1401', '玉润天香', '1123', '￥10500', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('389', '801', '大益红生茶', '1114', '￥11800', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('390', '901', '大益红', '1113', '￥24000', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('391', '2002年', '211', '1107', '￥25.5万', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('392', '1401', '7582', '1105', '￥3800', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('393', '901', '印象', '1104', '￥18000', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('394', '801', '7572', '1099', '￥9000', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('395', '1401', '英雄骏马', '1098', '￥9000', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('396', '2001年', '中茶绿印繁体云7542', '1096', '￥38万', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('397', '1301', '勐海之星', '1095', '￥3700', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('398', '1301', '7572', '1094', '￥5500', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('399', '1301', '味最酽熟', '1093', '￥3000', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('400', '1301', '金针白莲(散茶)', '1092', '￥4600', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('401', '1301', '经典7572', '1090', '￥1900', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('402', '1401', '英雄骏马', '1088', '￥19000', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('403', '1301', '菁华厚砖', '923', '￥5500', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('404', '901', '大龙饼', '922', '￥10500', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('405', '1301', '金色韵象', '921', '￥30000', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('406', '002', '7562砖', '920', '￥3900', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('407', '101', '珍藏方砖', '919', '￥15000', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('408', '101', '金色年华', '918', '￥14500', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('409', '1301', '新版7572', '917', '￥2800', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('410', '1301', '陈韵方砖', '916', '￥6000', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('411', '201', '小龙柱', '914', '￥6800', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('412', '1301', '新版7542', '912', '￥4200', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('413', '201', '经典7572', '911', '￥2400', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('414', '201', '普知味三年陈', '909', '￥2300', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('415', '2003年', '孔雀青饼357克', '908', '￥115万', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('416', '1301', '品茗特色集礼盒', '907', '￥1450', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('417', '1301', '品茗经典集礼盒', '906', '￥1350', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('418', '201', '经典7542', '905', '￥2400', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('419', '801', '7672', '904', '￥5400', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('420', '1301', '经典7542', '903', '￥2000', '2020-06-27 09:12:50', '2020-06-27 09:12:50');
INSERT INTO `tea_products` VALUES ('421', '1301', '金针白莲', '902', '￥9000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('422', '1301', '高山韵象', '901', '￥27000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('423', '2013年', '醇香四季花草茗茶叶礼盒', '899', '￥1450', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('424', '2013年', '七星印月高山悦享版', '898', '￥1750', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('425', '2013年', '七星印月龙印尊享版', '897', '￥2150', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('426', '2013年', '七星印月丹青荣享版', '896', '￥2000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('427', '901', '7572', '895', '￥8600', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('428', '2006年', '五只孔雀青饼', '894', '￥215万', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('429', '1301', '7742', '893', '￥13000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('430', '201', '老茶头', '892', '￥6200', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('431', '602', '布朗孔雀', '891', '￥150万', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('432', '2003年', '301', '890', '￥15.5万', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('433', '1301', '8582', '889', '￥6500', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('434', '2003年', '302', '888', '￥155万', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('435', '2003年', '303', '887', '￥23.5万', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('436', '2002年', '红大益7542', '885', '￥26.7万', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('437', '201', '五子登科熟', '884', '￥4800', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('438', '1301', '7562', '883', '￥4800', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('439', '1301', '早春乔木圆茶', '882', '￥80000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('440', '2001年', '野生大叶青饼', '881', '￥27万', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('441', '201', '甲级沱', '880', '￥2450', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('442', '1301', '8542', '879', '￥7500', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('443', '1301', '丹青', '878', '￥7000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('444', '1301', '7542', '877', '￥6700', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('445', '701', '红妆青饼', '875', '￥50000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('446', '502', '7542', '873', '￥12万', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('447', '503', '7542', '872', '￥10万', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('448', '2003年', '301', '870', '￥51500', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('449', '203', '7542', '864', '￥18000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('450', '201', '银孔雀', '863', '￥16000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('451', '201', '宫廷', '862', '￥3000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('452', '1301', '灵蛇献宝', '837', '￥19000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('453', '201', '大益之恋·美好时光', '828', '￥2300', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('454', '201', '笋壳青砖', '818', '￥3300', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('455', '201', '红韵圆茶', '817', '￥5500', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('456', '201', '7632', '816', '￥4300', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('457', '201', '金色韵象', '814', '￥27万', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('458', '201', '熊猫沱', '789', '￥9000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('459', '202', '7572', '780', '￥5650', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('460', '', '熊猫沱（红标）', '779', '￥88000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('461', '205', '7542', '777', '￥11800', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('462', '201', '巴达高山熟砖', '776', '￥3850', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('463', '202', '8592', '775', '￥3350', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('464', '201', '布朗孔雀', '774', '￥40.5万', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('465', '201', '龙印', '773', '￥18万', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('466', '201', '大龙柱', '772', '￥6800', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('467', '', '70周年厂庆纪念金瓜', '771', '￥40000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('468', '201', '高山韵象', '769', '￥77000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('469', '201', '天地人和套装', '768', '￥3750', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('470', '201', '易武正山', '767', '￥35000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('471', '201', '一级散茶', '766', '￥3750', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('472', '202', '8582', '764', '￥4300', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('473', '202', '7542', '763', '￥5300', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('474', '2004年', '357克金丝带紫大益青饼', '762', '￥42万', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('475', '2001年', '天福', '761', '￥90000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('476', '201', '勐海之春', '760', '￥3650', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('477', '201', '银大益', '759', '￥10.5万', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('478', '401', '玫瑰大益金丝带普饼', '758', '￥80000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('479', '702', '7452', '757', '￥6500', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('480', '901', '银孔雀', '756', '￥78000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('481', '201', '0532', '755', '￥3950', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('482', '201', '普知味普饼', '754', '￥3550', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('483', '201', '春尖青沱', '753', '￥3500', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('484', '201', '五子登科青饼', '752', '￥50000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('485', '101', '宫廷普饼200克', '751', '￥4300', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('486', '201', '翡翠大益', '750', '￥48000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('487', '2003年', '101', '748', '￥22万', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('488', '101', '7572', '747', '￥6000', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('489', '102', '甲级青沱', '746', '￥2300', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('490', '201', '7262', '745', '￥4550', '2020-06-27 09:12:51', '2020-06-27 09:12:51');
INSERT INTO `tea_products` VALUES ('491', '201', '春早青饼', '744', '￥4300', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('492', '201', '8582', '743', '￥5500', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('493', '2010年', '7542', '742', '￥6400', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('494', '002', '7542', '741', '￥6800', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('495', '001', 'v93沱', '740', '￥4500', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('496', '001', '天人八部', '739', '暂无报价', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('497', '001', '大益醇', '738', '￥4700', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('498', '001', '金针白莲', '737', '￥13500', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('499', '101', '女儿贡饼', '736', '￥2850', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('500', '003', '7262', '735', '￥4900', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('501', '101', '辛亥革命大套', '734', '￥14000', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('502', '002', '7262', '733', '￥4900', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('503', '001', '7262', '732', '￥5200', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('504', '101', '春早', '731', '￥4800', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('505', '001', '银孔雀', '730', '￥14000', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('506', '101', '勐宋沱', '729', '￥4000', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('507', '101', '普知味熟饼', '727', '￥3400', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('508', '002', '8582', '726', '￥4600', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('509', '001', '巴达高山有机茶', '725', '￥4550', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('510', '001', '龙柱圆茶(大)', '723', '￥6000', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('511', '001', '瑞虎呈祥(2、3号)', '722', '￥70000', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('512', '002', 'V93', '721', '￥4000', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('513', '001', '布朗青饼', '720', '￥45000', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('514', '001', '勐海之星', '719', '￥7200', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('515', '901', '甲级沱', '716', '￥3900', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('516', '', '88青饼', '715', '￥1050万', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('517', '101', '勐海之春', '714', '￥4200', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('518', '2010年', '7572', '713', '￥5950', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('519', '001', '7572', '709', '￥6600', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('520', '901', '宫廷普洱-特供', '708', '￥5550', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('521', '003', '甲级沱茶', '707', '￥2500', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('522', '002', '甲级沱茶', '706', '￥2500', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('523', '001', '甲级沱茶', '705', '￥2800', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('524', '901', '7592', '704', '￥5100', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('525', '901', '普知味普饼', '703', '￥4900', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('526', '901', '宫廷普洱普饼', '702', '￥4900', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('527', '901', '大益金瓜', '701', '￥8500', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('528', '901', '布朗山青饼', '700', '￥90000', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('529', '901', '巴达高山有机茶', '699', '￥12600', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('530', '901', '味最酽', '698', '￥13600', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('531', '901', '大益醇熟茶', '697', '￥6300', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('532', '901', '大益醇生茶', '696', '￥10300', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('533', '801', '7552', '695', '￥5600', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('534', '801', '甲级早春圆茶', '694', '￥7500', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('535', '001', '7552', '693', '￥4100', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('536', '001', '7452', '692', '￥4350', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('537', '801', '陈年谷花(秋香)', '691', '￥95000', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('538', '801', '味最酽青饼', '690', '￥9600', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('539', '801', '勐海之春', '689', '￥5600', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('540', '101', '高山揽月', '688', '￥50000', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('541', '201', '普知味青饼', '687', '￥3800', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('542', '201', '勐海之星', '686', '￥3900', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('543', '201', '7572', '685', '￥5850', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('544', '101', '雪韵方砖', '684', '￥5000', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('545', '101', '勐海之星', '683', '￥3850', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('546', '101', '味最酽普饼', '682', '￥3600', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('547', '101', '味最酽青饼', '681', '￥4900', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('548', '102', '普知味青饼', '680', '￥3600', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('549', '2008年', '五只孔雀', '679', '￥86万', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('550', '001', '黄金岁月(生)', '677', '￥18500', '2020-06-27 09:12:52', '2020-06-27 09:12:52');
INSERT INTO `tea_products` VALUES ('551', '001', '7542', '676', '￥8400', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('552', '101', '紫云圆茶', '675', '￥6000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('553', '702', '8542', '674', '￥8000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('554', '2004年', '7542', '666', '￥23万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('555', '2004年', '7572', '665', '￥50000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('556', '2004年', '阿诗玛女儿贡饼', '664', '￥40000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('557', '2003年', '301', '663', '￥42万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('558', '2003年', '301', '662', '￥20万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('559', '301', '蓝大益7572', '661', '￥57000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('560', '2003年', '301', '660', '￥65万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('561', '801', '甲级沱茶', '658', '￥4100', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('562', '801', '勐海孔雀', '657', '￥36.5万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('563', '801', '南糯孔雀', '655', '￥83000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('564', '801', '巴达孔雀', '653', '￥48000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('565', '805', '7542', '652', '￥19000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('566', '803', '7542', '651', '￥19000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('567', '1999年', '陆羽班章3号', '650', '￥62万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('568', '601', '品味66', '649', '￥18000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('569', '501', '勐海春尖沱250克', '647', '￥20000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('570', '502', '金银孔雀套装', '644', '￥22000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('571', '2003年', '301', '643', '￥175万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('572', '2003年', '301', '640', '￥45万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('573', '2003年', '早春乔木贡饼', '639', '￥45万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('574', '2003年', '大2易武正山野生茶特级品', '638', '￥218万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('575', '501', '7742', '637', '￥48万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('576', '201', '8592', '636', '￥3500', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('577', '201', '7542', '635', '￥6500', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('578', '101', '醇香四季', '634', '￥2250', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('579', '502', '8582', '632', '￥13万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('580', '501', '大益普洱方茶', '630', '￥57000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('581', '501', '大益普洱砖1000克', '629', '￥35500', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('582', '601', '经典66熟沱', '628', '￥12500', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('583', '2003年', '301', '626', '￥30.5万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('584', '2003年', '易武正山野生茶特级品青沱500克', '625', '￥30万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('585', '2003年', '三星班章', '624', '￥720万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('586', '2002年', '201', '623', '￥68万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('587', '2003年', '班章六星孔雀青饼', '622', '￥4200万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('588', '2003年', '勐海青沱红丝带', '618', '￥63000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('589', '2004年', '彩大益500克', '617', '￥63万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('590', '401', '博字7752', '616', '￥47000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('591', '2000年', '9号青', '614', '￥400万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('592', '2000年', '001', '613', '￥195万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('593', '309', '紫大益7572', '612', '￥82000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('594', '', '97水蓝印7572', '608', '￥38万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('595', '97', '水蓝印7542', '607', '￥336万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('596', '601', '巴达山孔雀青饼', '605', '￥10万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('597', '2003年', '白针金莲', '604', '￥55000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('598', '501', '南糯贡饼', '603', '￥75000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('599', '501', '金色韵象', '602', '￥175万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('600', '501', '佛缘茶生熟套装', '596', '￥18万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('601', '504', '7262', '594', '￥25800', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('602', '503', '勐海之春', '593', '￥33000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('603', '901', '国韵60生熟套装', '592', '￥4100', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('604', '503', 'v93', '590', '￥29000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('605', '901', '泡益泡', '589', '￥2200', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('606', '502', '7672', '588', '￥22000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('607', '502', '7572', '587', '￥33500', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('608', '502', 'V93熟沱250克', '585', '￥23500', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('609', '901', '勐海之星', '584', '￥15000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('610', '501', '原生态乔木熟饼茶', '583', '￥43500', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('611', '501', '原生态乔木青饼茶', '582', '￥47万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('612', '501', '易武正山乔木古树茶', '581', '￥42万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('613', '501', '小金毫熟沱', '580', '￥13000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('614', '901', '勐海之春', '579', '￥5800', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('615', '501', '五级普洱青砖', '578', '￥16000', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('616', '501', '南糯山孔雀饼茶', '577', '￥22万', '2020-06-27 09:12:53', '2020-06-27 09:12:53');
INSERT INTO `tea_products` VALUES ('617', '901', '孔雀沱茶', '576', '￥58000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('618', '501', '勐宋古茶山孔雀饼茶', '575', '￥70万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('619', '501', '勐海女儿贡茶', '574', '￥27500', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('620', '901', '九九方茶', '573', '￥9500', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('621', '501', '勐海孔雀饼茶', '572', '￥360万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('622', '501', '巴达茶山孔雀饼茶', '571', '￥18万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('623', '501', 'v93', '570', '￥32000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('624', '502', '8592', '569', '￥27000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('625', '704', '7572', '568', '￥8000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('626', '501', '7672', '567', '￥27200', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('627', '703', '7542', '566', '￥7700', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('628', '703', '7262', '565', '￥13300', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('629', '501', '7532', '564', '￥53000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('630', '702', '8582', '563', '￥7500', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('631', '501', '金色韵象200克', '562', '￥20万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('632', '702', '7572', '561', '￥8800', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('633', '702', '7432', '560', '￥7400', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('634', '501', '0562', '559', '￥29500', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('635', '702', '0772', '558', '￥5300', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('636', '806/810', '7572', '557', '￥7500', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('637', '501', '0532', '556', '￥12800', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('638', '501', '五级普砖250克', '555', '￥19000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('639', '701', '韵象', '554', '￥8000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('640', '501', '勐海早春沱茶250克', '553', '￥23000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('641', '701', '玉润女儿茶青饼', '552', '￥8300', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('642', '804/805', '8582', '551', '￥8800', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('643', '701', '玉润', '550', '￥6500', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('644', '501', '勐海沱茶250克', '549', '￥33500', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('645', '701', '银色大益', '548', '￥20000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('646', '801', '金刚五星', '544', '￥38000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('647', '701', '笋壳砖熟茶', '543', '￥5100', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('648', '701', '勐海之星', '542', '￥30000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('649', '501', '大益沱茶100克', '541', '￥15000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('650', '701', '勐海之春', '539', '￥6500', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('651', '801', '女儿贡饼', '538', '￥4100', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('652', '701', '龙柱圆茶', '537', '￥12500', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('653', '701', '老茶头砖', '536', '￥18000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('654', '701', '老茶头饼', '534', '￥15500', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('655', '501', '八级普饼', '533', '￥20000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('656', '801', '老茶头饼', '532', '￥15100', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('657', '801', '金针白莲', '531', '￥23500', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('658', '701', '金针白莲砖', '530', '￥19000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('659', '701', '金针白莲', '529', '￥26000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('660', '801', '金色大益开元饼生熟套装', '526', '￥12500', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('661', '701', '厚普饼', '525', '￥5300', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('662', '801', '高山韵象(熟)', '524', '￥16000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('663', '701', '红妆熟茶（礼盒）', '523', '￥4600', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('664', '801', '高山韵象(生)', '519', '￥36.5万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('665', '302', '7532', '517', '￥21万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('666', '701', '红妆生茶（礼盒）', '516', '￥10000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('667', '2002年', '201', '515', '￥152万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('668', '801', '大团茶', '514', '￥14800', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('669', '401', '7642', '513', '￥11.8万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('670', '701', '广州国际茶博会纪念茶', '512', '￥32200', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('671', '2002年', '班章生态青砖250克', '510', '暂无报价', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('672', '801', '0622', '509', '￥7400', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('673', '2000年', '班章贡饼200克', '508', '￥153万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('674', '2000年', '班章大2号熟饼', '507', '￥150万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('675', '2008年', '五彩孔雀', '506', '￥80000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('676', '2000年', '班章珍藏青饼', '505', '￥2350万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('677', '2003年', '912咖啡大大益7592', '504', '￥53000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('678', '436', '海字7542', '502', '￥19.5万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('679', '401', '南糯生态青饼', '501', '￥27万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('680', '401', '红印高级沱200克', '499', '￥95000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('681', '2004年', '301绿色有机小方砖100克', '498', '￥12.5万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('682', '437', '海字7542（85个海）', '497', '￥50万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('683', '2003年', '302', '496', '￥76000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('684', '302', '红印高级沱200克', '495', '￥38万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('685', '701', '宫廷青饼', '494', '￥5400', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('686', '2003年', '301', '493', '￥76000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('687', '701', '宫廷普饼', '492', '￥5800', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('688', '2003年', '301', '491', '￥36万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('689', '701', '厚普砖1000克', '490', '￥7800', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('690', '701', '大叶陈茶青饼', '489', '￥11000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('691', '701', '陈韵青饼', '488', '￥47000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('692', '701', '白针贡青饼', '487', '￥7700', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('693', '701', '八一之星生熟套装', '486', '￥6800', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('694', '701', '暗香熟茶', '484', '￥25000', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('695', '701', '暗香生茶', '483', '￥16.5万', '2020-06-27 09:12:54', '2020-06-27 09:12:54');
INSERT INTO `tea_products` VALUES ('696', '701', 'v93沱', '482', '￥5500', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('697', '701', 'v4', '481', '￥6200', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('698', '701', 'v2', '480', '￥6700', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('699', '701', '8592', '479', '￥5100', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('700', '701', '7752', '477', '￥12300', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('701', '701', '7672', '476', '￥5400', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('702', '701', '7532', '475', '￥16300', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('703', '701', '7432', '474', '￥15200', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('704', '701', '0772', '473', '￥5500', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('705', '701', '0752', '472', '￥6500', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('706', '701', '0732', '471', '￥6100', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('707', '701', '0712', '470', '￥5500', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('708', '701', '0562', '469', '￥7000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('709', '701', '0532', '468', '￥6200', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('710', '2006年', '7572', '467', '￥21500', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('711', '2006年', '7542', '466', '￥30500', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('712', '602', '经典66普饼', '465', '￥29000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('713', '602', '7692', '464', '￥14000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('714', '602', '7452', '462', '￥15000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('715', '602', '0562', '461', '￥16000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('716', '601', '勐宋古茶山孔雀饼茶', '460', '￥32万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('717', '601', '勐海孔雀饼茶', '459', '￥115万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('718', '601', '遵义会议纪念茶', '458', '￥4300', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('719', '601', '岩韵普洱青饼', '455', '￥90万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('720', '601', '象山普饼', '454', '￥20500', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('721', '601', '越陈越香五级普砖', '453', '￥10500', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('722', '601', '四渡赤水纪念茶', '452', '￥4100', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('723', '601', '圣茶之旅熟饼', '450', '￥67000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('724', '601', '胜利大会师纪念茶', '448', '￥4100', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('725', '301', '甲级红大益普饼', '446', '￥60000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('726', '2003年', '301', '445', '￥180万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('727', '301', '红印高级沱200克', '444', '￥14万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('728', '601', '高山韵象', '443', '￥85万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('729', '2003年', '301', '442', '￥11.8万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('730', '601', '三级普饼', '440', '￥22500', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('731', '2003年', '301', '439', '￥145万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('732', '2003年', '301', '438', '￥14.8万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('733', '2003', '301', '436', '￥93000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('734', '2003年', '301', '434', '￥10.5万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('735', '2003年', '301', '433', '￥10万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('736', '2002年', '212', '432', '￥26万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('737', '2002年', '201', '431', '￥10万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('738', '2003年', '101', '430', '￥63万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('739', '601', '南糯山孔雀饼茶', '429', '￥20万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('740', '2000年', '无R红大益7542', '427', '￥103万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('741', '2003年', '班章五星孔雀青饼', '425', '￥2400万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('742', '2002年', '201', '424', '￥890万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('743', '2003年', '班章四星孔雀青饼', '423', '￥1450万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('744', '601', '勐海之春', '422', '￥24000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('745', '601', '老茶头普砖', '421', '￥36000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('746', '2004年', '紫大益7542', '420', '￥35万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('747', '601', '跨越雪山草地纪念茶', '419', '￥4500', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('748', '2004年', '易武山明前春尖饼', '418', '￥88000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('749', '2004年', '桃红大益', '415', '￥90000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('750', '2004年', '顶级珍藏青饼', '414', '￥950万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('751', '2004年', '401', '412', '￥75000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('752', '2004年', '红印普饼', '411', '￥63000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('753', '601', '经典66青沱', '409', '￥11500', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('754', '401', '8582', '408', '￥50万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('755', '2004年', '班章生态茶', '407', '￥370万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('756', '2004年', '孔雀班章贡青饼', '406', '￥115万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('757', '2004年', '班章珍藏青沱', '405', '￥220万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('758', '2004年', '班章野生青砖', '404', '￥130万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('759', '2004年', '贡沱', '403', '暂无报价', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('760', '2004年', '易武正山野生茶珍藏品一斤装（明前茶）', '402', '￥14.8万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('761', '401', '7522', '401', '￥125万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('762', '2003年', '201', '399', '￥76000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('763', '2003年', '神舟五号青饼500克', '397', '￥20万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('764', '2003年', '陈香七子饼', '394', '￥58500', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('765', '2003年', '8112巴达高山茶', '393', '￥78000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('766', '2003年', '8112中茶红印', '392', '￥20.8万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('767', '2003年', '320', '391', '￥58000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('768', '2003年', '中茶黄印7262', '390', '￥59000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('769', '002', '早春茶', '389', '￥24万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('770', '2003年', '孔雀贡饼熟(粉红色)200克', '387', '￥11.8万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('771', '2003年', '孔雀贡饼熟(咖啡色)200克', '386', '￥11.8万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('772', '2003年', '8112中茶早春黄印', '385', '￥10万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('773', '2003年', '8112巴达高山特级饼', '384', '￥84000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('774', '2003年', '班章乔木生态沱茶200克', '383', '￥270万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('775', '2003年', '易武正山野生茶珍藏品一斤装(明前茶)', '382', '￥16.5万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('776', '2003年', '二星班章青饼', '381', '￥550万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('777', '601', '经典66普砖', '380', '￥33000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('778', '601', '经典66普饼', '379', '￥49000', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('779', '2002年', '易武正山野生茶精品(春茶)', '378', '￥20.5万', '2020-06-27 09:12:55', '2020-06-27 09:12:55');
INSERT INTO `tea_products` VALUES ('780', '2002年', '红大益易武正山400克(竹篾绑)', '376', '￥39万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('781', '601', '金针白莲普砖', '375', '￥30000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('782', '601', '金针白莲普饼', '374', '￥85000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('783', '2002年', '201', '373', '￥90000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('784', '601', '飞夺泸定桥纪念茶', '371', '￥4500', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('785', '601', '大益菩提缘', '369', '￥20万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('786', '601', '大益春早', '368', '￥11800', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('787', '601', '长征英雄纪念茶', '365', '￥18000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('788', '601', '布朗孔雀饼茶', '363', '￥65万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('789', '601', '班章大叶陈茶', '361', '￥65万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('790', '601', 'v93熟沱', '358', '￥15800', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('791', '601', 'v93青沱', '357', '￥16200', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('792', '601', '8542', '356', '￥32000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('793', '601', '7752', '355', '￥17000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('794', '601', '7692', '354', '￥13600', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('795', '601', '7672', '353', '￥15500', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('796', '601', '7592', '351', '￥15000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('797', '601', '7582', '350', '￥18000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('798', '601', '7572', '348', '￥25000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('799', '2000年', '班章大1号熟饼', '347', '￥110万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('800', '2002年', '中茶绿印7572', '346', '￥70000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('801', '601', '7562普砖', '345', '￥7000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('802', '2002年', '中茶绿印春茶7542', '344', '￥14.5万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('803', '2002年', '201', '343', '￥135万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('804', '2002年', '易武正山野生茶珍藏品一斤装(明前茶)', '340', '￥28.5万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('805', '601', '7542', '339', '￥68000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('806', '2002年', '易武红中红青饼', '338', '￥20万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('807', '601', '7532', '336', '￥25000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('808', '2002年', '中茶红印红丝带青饼', '335', '￥19.6万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('809', '601', '7452', '334', '￥18800', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('810', '2002年', '红印青饼', '333', '￥22.5万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('811', '601', '7262', '332', '￥18800', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('812', '2000年', '班章一级青饼', '331', '￥330万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('813', '2001年', '易武正山野生茶典藏品普饼', '330', '￥16.8万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('814', '601', '厚普砖2000克', '329', '￥18000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('815', '2001年', '140', '328', '￥80000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('816', '2001年', '红大益老树圆茶', '327', '￥187万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('817', '2001年', '紫大益4号', '324', '￥61万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('818', '2001年', '中茶黄印简体云7262', '323', '￥72000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('819', '2000年', '越陈越香世纪饼普饼', '322', '￥17万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('820', '601', '7532', '320', '￥21500', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('821', '601', '0622', '318', '￥28000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('822', '601', '0562', '317', '￥20500', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('823', '601', '0622', '316', '￥43500', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('824', '601', '味最酽普饼400克', '315', '￥22000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('825', '601', '笋壳青砖250克', '314', '￥14000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('826', '601', '笋壳普砖250克', '313', '￥14000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('827', '601', '金孔雀普饼250克', '312', '￥27000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('828', '601', '宫廷青饼250克', '311', '￥13000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('829', '601', '白针贡饼250克', '310', '￥9200', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('830', '601', '味最酽普饼200克', '309', '￥9800', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('831', '601', '味最酽青饼200克', '308', '￥15800', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('832', '601', '勐海之星200克', '307', '￥18000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('833', '601', '粒粒香普饼200克', '306', '￥17000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('834', '601', '布朗孔雀饼茶200克', '305', '￥22万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('835', '601', '班章有机贡饼200克', '304', '￥23.5万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('836', '601', '0622', '303', '￥15500', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('837', '2003年', '极品白针银毫', '299', '暂无报价', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('838', '2006年', '邮票饼', '298', '￥16000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('839', '001', '宫廷散茶', '297', '￥4800', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('840', '001', '宫廷饼', '296', '￥6000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('841', '101', '五子登科熟', '295', '￥4300', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('842', '001', '春早·超级早春女儿茶', '294', '￥5000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('843', '101', '巴达高山有机茶', '293', '￥9200', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('844', '101', '宝兔迎财', '292', '￥35000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('845', '208', '7572紫大益', '291', '￥16.8万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('846', '2002年', '易武正山一棵树', '290', '￥63万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('847', '401', '孔雀班章饼', '289', '￥390万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('848', '429', '7542', '288', '￥23.5万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('849', '440', '7542', '287', '￥19.5万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('850', '401', '黄大益普饼', '286', '￥17.5万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('851', '303', '7222', '285', '￥41万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('852', '401', '紫大益8052', '284', '￥78万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('853', '2004年', '班章珍藏青饼', '282', '￥870万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('854', '302', '银大益', '281', '￥88万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('855', '2001年', '105', '280', '￥81万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('856', '2001年', '中茶绿印简体云7542', '278', '￥87万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('857', '2003年', '301', '277', '￥85000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('858', '403', '博字7592', '276', '￥43500', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('859', '2002年', '208', '275', '￥40万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('860', '2002年', '201', '274', '￥660万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('861', '2002年', '201', '272', '￥420万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('862', '401', '7432', '271', '￥28万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('863', '2003年', '301', '270', '￥55万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('864', '2003年', '301', '269', '￥180万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('865', '2003年', '301', '268', '￥34万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('866', '2003年', '建州50周年纪念饼青饼', '267', '￥56000', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('867', '2003年', '302', '266', '￥11.5万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('868', '303', '紫云号圆茶青饼', '265', '￥18万', '2020-06-27 09:12:56', '2020-06-27 09:12:56');
INSERT INTO `tea_products` VALUES ('869', '2003年', '301', '264', '￥87万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('870', '301', '7222', '263', '￥35.5万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('871', '302', '7222', '262', '￥73万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('872', '2003年', '302', '261', '￥125万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('873', '2002年', '202', '260', '￥39.5万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('874', '201', '红印高级沱250克', '259', '￥26.5万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('875', '402', '500克大叶青', '258', '￥53万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('876', '401', '彩大益青饼8852', '255', '￥48万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('877', '402', '7532', '254', '￥18万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('878', '401', '红大益7032', '253', '￥11万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('879', '2004年', '402', '252', '￥32万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('880', '2004年', '301红大益7212一片叶', '251', '￥14.6万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('881', '2002年', '201', '250', '￥600万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('882', '2002年', '201', '249', '￥480万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('883', '2003年', '班章二号青饼', '248', '￥430万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('884', '2003年', '班章四星青饼', '247', '￥950万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('885', '2004年', '班章精品青饼', '246', '￥490万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('886', '2004年', '班章茶王青饼', '245', '￥1200万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('887', '2001年', '班章有机生态茶公章饼', '244', '￥31万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('888', '2004年', '黄大益班章野生茶', '243', '￥265万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('889', '2004年', '老班章生态沱', '242', '￥55万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('890', '702', '7262', '240', '￥6600', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('891', '601', '班章有机青饼', '239', '￥530万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('892', '502', '勐海早春沱茶500克', '238', '￥22000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('893', '504', '7572', '237', '￥32000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('894', '502/503', '紧砖茶', '236', '￥12000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('895', '501', '7572', '235', '￥45000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('896', '503', '8542', '234', '￥42000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('897', '501', '布朗孔雀青饼', '233', '￥60万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('898', '504', '7542', '232', '￥56000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('899', '502', '勐海之星', '231', '￥95000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('900', '501', '宫廷普洱200克', '230', '￥17000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('901', '501', '象山普洱二号', '229', '￥38000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('902', '501', '甲级早春青饼', '228', '￥70000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('903', '501', '7542白布条', '227', '￥66万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('904', '503', '早春青沱', '226', '￥17500', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('905', '501', '陈年象山青饼', '225', '￥52000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('906', '501', '8562', '224', '￥29500', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('907', '501', '勐海之星', '223', '￥16.5万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('908', '501', '7632', '222', '￥33500', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('909', '501', '7262', '221', '￥38500', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('910', '501', '金针白莲散茶', '220', '￥23000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('911', '501', '7692', '219', '￥23000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('912', '501', '勐海之春', '218', '￥38500', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('913', '501', '乌金号圆茶', '217', '￥240万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('914', '201', '金针白莲', '216', '￥8700', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('915', '501', '白针贡饼', '215', '￥14000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('916', '501', '7552', '214', '￥43000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('917', '201', '7532', '213', '￥4200', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('918', '501', 'V93十年磨一剑250克(熟)', '212', '￥33800', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('919', '106', '7572', '211', '￥5650', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('920', '101', '一源青饼', '210', '￥19.5万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('921', '701', '7572', '209', '￥16800', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('922', '601', '7432', '208', '￥11.5万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('923', '101', '大益醇', '207', '￥6500', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('924', '101', '金枝玉叶', '206', '￥4500', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('925', '701', '红妆普饼', '205', '￥7500', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('926', '701', '玉润天香青饼', '204', '￥21000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('927', '701', '7452', '203', '￥11700', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('928', '701', '7262', '202', '￥13800', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('929', '701', '7562砖', '201', '￥5800', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('930', '701', '厚青饼', '200', '￥5700', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('931', '601', '8582', '199', '￥46000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('932', '001', '高枕无忧厚砖', '198', '￥8000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('933', '701', '甲级早春圆茶', '197', '￥7500', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('934', '701', '笋壳青砖', '196', '￥5200', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('935', '001', '黄金岁月(熟)', '195', '￥9800', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('936', '603', '8542', '194', '￥22000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('937', '103', '8582', '193', '￥4200', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('938', '601', '勐海之星400克', '192', '￥44000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('939', '602', '圣茶之旅青饼', '191', '￥16万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('940', '001', '五子登科', '190', '￥6300', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('941', '601', '银孔雀', '189', '￥32000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('942', '001', '7562普砖', '188', '￥4250', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('943', '602', '厚普砖', '187', '￥16500', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('944', '601', '班章有机普饼', '186', '￥115万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('945', '101', '大益之恋', '185', '￥3600', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('946', '601', '厚青砖', '184', '￥16500', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('947', '101', '大益之恋', '183', '￥13000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('948', '601', '经典66青饼', '182', '￥80000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('949', '601', '圣茶之旅青饼', '181', '￥12万', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('950', '601', '巴达高山普饼', '180', '￥20000', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('951', '601', '0562', '178', '￥14800', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('952', '101', '宫廷精装散茶50克', '177', '￥3200', '2020-06-27 09:12:57', '2020-06-27 09:12:57');
INSERT INTO `tea_products` VALUES ('953', '601', '经典66青砖', '176', '￥24000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('954', '601', '金色韵象366克', '175', '￥23.5万', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('955', '601', '经典66沱茶套装', '174', '￥21200', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('956', '106', '7542', '173', '￥5500', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('957', '06年', '大益韵象礼茶(五韵)', '172', '￥18.5万', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('958', '601', '易武正山', '171', '￥50万', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('959', '201', '7552', '170', '￥4050', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('960', '601', '7742越陈越香', '169', '￥21万', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('961', '701', '7542', '168', '￥29000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('962', '001', '亚运珍藏饼', '167', '￥19500', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('963', '601', '金色韵象666克', '166', '￥70000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('964', '003', 'V93沱茶', '165', '￥4000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('965', '701', '7742', '164', '￥80000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('966', '101', '7592', '163', '￥3800', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('967', '602/603', '勐海之春', '162', '￥18500', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('968', '701', '银孔雀青饼', '161', '￥20000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('969', '701', '0782', '159', '￥4900', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('970', '601', '味最酽青饼400克', '158', '￥70000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('971', '001', '龙柱圆茶(小)', '157', '￥7500', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('972', '501', '7562砖', '156', '￥20500', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('973', '001', '', '155', '￥2600', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('974', '701', '越陈越香', '154', '￥7400', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('975', '001', '女儿贡饼', '153', '￥3150', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('976', '2006年', '7262（后面批次）', '151', '￥16500', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('977', '001', '五羊颂福礼盒装', '150', '￥2650', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('978', '001', '红韵圆茶100克', '149', '￥5650', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('979', '603', '0622', '148', '￥33000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('980', '901', '7452', '147', '￥6200', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('981', '501', '金针白莲荷香茶', '146', '￥65000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('982', '001', '7592', '145', '￥4200', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('983', '701', '7592', '144', '￥4800', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('984', '503', '7262', '143', '￥28000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('985', '001', '8582', '141', '￥6200', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('986', '001', '高山韵象', '140', '￥3800', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('987', '001', '勐海之春', '139', '￥3950', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('988', '601', '象山青饼', '138', '￥40000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('989', '501', '8592A', '137', '￥40000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('990', '001', '老茶头', '136', '￥9200', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('991', '001', '孔雀沱茶', '135', '￥30500', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('992', '602', '7532', '134', '￥20000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('993', '501', '象山普洱一号', '133', '￥35000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('994', '001', '冠军滋味', '132', '￥2850', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('995', '001', '普知味', '131', '￥4500', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('996', '501', '8542', '130', '￥60000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('997', '001', '云鼎', '129', '￥4000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('998', '801', '7542', '128', '￥13000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('999', '001', '印象', '127', '￥16800', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('1000', '001', '易武正山', '126', '￥18000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('1001', '901', '0622', '125', '￥8200', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('1002', '001', '大龙饼', '124', '￥7500', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('1003', '902', '7542', '123', '￥10800', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('1004', '001', '九九方茶', '122', '￥3750', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('1005', '906', '7572', '121', '￥7000', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('1006', '001', '瑞虎呈祥(1号)', '120', '￥11万', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('1007', '001', '大益金砖', '119', '￥5500', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('1008', '903', '7542', '118', '￥8500', '2020-06-27 09:12:58', '2020-06-27 09:12:58');
INSERT INTO `tea_products` VALUES ('1009', '001', '大益贡沱生茶', '117', '￥2000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1010', '901', '红韵圆茶', '116', '￥7000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1011', '001', '越陈越香', '115', '￥12600', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1012', '901', '大益团茶', '114', '￥3700', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1013', '101', '九二方砖100克生茶', '113', '￥36000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1014', '101', '越陈越香', '112', '￥32000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1015', '901', '大益金砖', '111', '￥5900', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1016', '901', '7542', '110', '￥59000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1017', '201', '龙腾盛世', '109', '￥42000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1018', '901', '高枕无忧厚砖', '108', '￥11000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1019', '901', '老茶头砖', '107', '￥15300', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1020', '901', '金孔雀', '106', '￥5600', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1021', '101', '龙柱圆茶', '105', '￥6400', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1022', '901', '越陈越香', '104', '￥9000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1023', '901', '紫韵圆茶', '103', '￥5300', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1024', '901', '奔牛（简装）', '102', '￥22万', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1025', '101', '大益之恋生茶礼盒', '101', '￥1900', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1026', '901', '龙柱圆茶', '100', '￥7500', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1027', '101', '大益之恋熟茶礼盒', '99', '￥1900', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1028', '902', '7262', '98', '￥5600', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1029', '101', '8592', '97', '￥3700', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1030', '902', '甲级沱茶', '96', '￥3500', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1031', '905', '7572', '95', '￥6900', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1032', '901', '8592', '94', '￥5200', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1033', '102', '8592', '93', '￥3450', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1034', '101', '金大益青饼', '92', '￥32.5万', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1035', '901', '易武正山', '91', '￥18万', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1036', '101', '凤柱圆茶', '90', '￥10.5万', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1037', '902', 'v93沱', '89', '￥4500', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1038', '101', '7542', '88', '￥7000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1039', '901', '贡沱熟', '87', '￥2950', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1040', '101', '老茶头普砖', '86', '￥6400', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1041', '901', '贡沱生', '85', '￥2550', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1042', '901', '8582', '84', '￥18000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1043', '101', '7262', '83', '￥4800', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1044', '901', '7262', '82', '￥6400', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1045', '2008年', '7542', '81', '￥8700', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1046', '801', '8582', '80', '￥9300', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1047', '801', '7632', '79', '￥6100', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1048', '801', '7452', '78', '￥5600', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1049', '103', '7572', '77', '￥5650', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1050', '801', '7562砖', '76', '￥6300', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1051', '103', '7542', '75', '￥5550', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1052', '801', '七子之歌', '74', '￥6100', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1053', '101', 'V93', '73', '￥3650', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1054', '802', '7532', '72', '￥5900', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1055', '101', '金凤贡饼', '71', '￥41000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1056', '801', '红韵', '70', '￥13000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1057', '101', '普知味青饼', '69', '￥4200', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1058', '101', '辛亥革命百年纪念青饼', '68', '￥35000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1059', '101', '辛亥革命百年纪念普饼', '67', '￥5500', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1060', '501', '金色韵象', '66', '￥103万', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1061', '801', '象山普饼', '65', '￥7600', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1062', '101', '8582', '64', '￥5800', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1063', '801', '8542', '63', '￥8000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1064', '101', '7742', '62', '￥13000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1065', '801', '阳春三月（春水）', '61', '￥21000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1066', '101', '玉润普饼', '60', '￥2700', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1067', '801', '老茶头砖', '59', '￥17000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1068', '101', '银孔雀青饼', '57', '￥11000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1069', '801', '7532', '56', '￥7400', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1070', '101', '易武正山青饼', '55', '￥53000', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1071', '801', '7582', '54', '￥5600', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1072', '101', '甲级青沱', '53', '￥2550', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1073', '801', '陈韵方砖', '52', '￥12500', '2020-06-27 09:12:59', '2020-06-27 09:12:59');
INSERT INTO `tea_products` VALUES ('1074', '101', '0532', '51', '￥4100', '2020-06-27 09:12:59', '2020-06-27 09:12:59');

-- ----------------------------
-- Table structure for tea_users
-- ----------------------------
DROP TABLE IF EXISTS `tea_users`;
CREATE TABLE `tea_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `assets` int(11) NOT NULL DEFAULT '0' COMMENT '总资产',
  `profit_loss` int(11) NOT NULL DEFAULT '0' COMMENT '总盈亏',
  `market_value` int(11) NOT NULL DEFAULT '0' COMMENT '总市值',
  `account` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '账号 多个逗号',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tea_users
-- ----------------------------
INSERT INTO `tea_users` VALUES ('1', 'zhuwene', '123asdwe', '0', '0', '0', '10086,10098,10098', null, null);

-- ----------------------------
-- Table structure for tea_users_capitals
-- ----------------------------
DROP TABLE IF EXISTS `tea_users_capitals`;
CREATE TABLE `tea_users_capitals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `account` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '账号',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '金额',
  `balance` int(11) NOT NULL DEFAULT '0' COMMENT '余额',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型 0-转入 1-转出',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tea_users_capitals
-- ----------------------------
INSERT INTO `tea_users_capitals` VALUES ('1', '1', '100862323', '10000', '20000', '0', null, null);
INSERT INTO `tea_users_capitals` VALUES ('2', '1', '1', '111', '0', '0', '2020-06-27 10:44:45', '2020-06-27 10:44:45');
INSERT INTO `tea_users_capitals` VALUES ('3', '1', '10098', '100', '0', '1', '2020-06-27 10:49:46', '2020-06-27 10:49:46');

-- ----------------------------
-- Table structure for tea_users_products
-- ----------------------------
DROP TABLE IF EXISTS `tea_users_products`;
CREATE TABLE `tea_users_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `products_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '价格',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型 0-买入 1-卖出',
  `num` smallint(6) NOT NULL DEFAULT '0' COMMENT '数量',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tea_users_products
-- ----------------------------
