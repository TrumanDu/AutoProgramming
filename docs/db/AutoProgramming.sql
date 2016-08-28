/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : AutoProgramming

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-08-07 16:12:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cg_column_config
-- ----------------------------
DROP TABLE IF EXISTS `cg_column_config`;
CREATE TABLE `cg_column_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `table_id` bigint(20) NOT NULL COMMENT '表ID',
  `column_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列名',
  `column_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列类型',
  `column_length` int(11) DEFAULT NULL COMMENT '列长度',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `field_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '字段名',
  `field_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '字段类型',
  `nullable` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relation_table` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联表名',
  `relation_column_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联表关联ID',
  `relation_column_text` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联表显示字段',
  `sort` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '排序',
  `is_key` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否主键',
  `show_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '页面显示类型',
  `is_query` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否查询',
  `query_model` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '查询模式',
  `query_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '查询类型',
  `is_show_list` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列表是否显示',
  `is_show_form` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表单是否显示',
  `form_valid_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表单验证类型',
  `order_num` int(11) DEFAULT NULL COMMENT '字段顺序',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人员',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人员',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cg_column_config
-- ----------------------------
INSERT INTO `cg_column_config` VALUES ('19', '4', 'id', 'bigint', '19', 'ID', 'id', 'Long', 'N', null, null, null, 'N', 'Y', 'text', 'N', 'single', '=', 'Y', 'Y', '', '1', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('20', '4', 'username', 'varchar', '50', '用户名', 'username', 'String', 'Y', null, null, null, 'N', 'N', 'text', 'Y', 'single', '=', 'Y', 'Y', '', '2', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('21', '4', 'password', 'varchar', '50', '密码', 'password', 'String', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'Y', 'Y', '', '3', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('22', '4', 'name', 'varchar', '50', '姓名', 'name', 'String', 'Y', null, null, null, 'N', 'N', 'text', 'Y', 'single', '=', 'Y', 'Y', '', '4', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('23', '4', 'org_id', 'bigint', '19', '组织ID', 'orgId', 'Long', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'Y', 'Y', '', '5', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('24', '4', 'phone', 'varchar', '11', '电话', 'phone', 'String', 'Y', null, null, null, 'N', 'N', 'text', 'Y', 'single', '=', 'Y', 'Y', '', '6', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('25', '4', 'email', 'varchar', '50', '邮箱', 'email', 'String', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'Y', 'Y', '', '7', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('26', '4', 'description', 'varchar', '255', '备注', 'description', 'String', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'Y', 'Y', '', '8', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('27', '4', 'user_photo', 'blob', '65535', '用户头像', 'userPhoto', 'String', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'Y', 'Y', '', '9', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('28', '4', 'del_flag', 'char', '1', '删除标识', 'delFlag', 'String', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'Y', 'Y', '', '10', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('29', '4', 'create_user', 'bigint', '19', '创建人', 'createUser', 'Long', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'N', 'N', '', '11', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('30', '4', 'create_date', 'datetime', null, '创建时间', 'createDate', 'Date', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'N', 'N', '', '12', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('31', '4', 'update_user', 'bigint', '19', '修改人', 'updateUser', 'Long', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'N', 'N', '', '13', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('32', '4', 'update_date', 'datetime', null, '修改时间', 'updateDate', 'Date', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'N', 'N', '', '14', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('33', '5', 'id', 'bigint', '19', 'ID', 'id', 'Long', 'N', null, null, null, 'N', 'Y', 'text', 'N', 'single', '=', 'Y', 'Y', '', '1', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('34', '5', 'role_code', 'varchar', '50', '角色编码', 'roleCode', 'String', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'Y', 'Y', '', '2', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('35', '5', 'role_name', 'varchar', '50', '角色名称', 'roleName', 'String', 'Y', null, null, null, 'N', 'N', 'text', 'Y', 'single', 'like', 'Y', 'Y', '', '3', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('36', '5', 'description', 'varchar', '255', '备注', 'description', 'String', 'Y', null, null, null, 'N', 'N', 'textarea', 'N', 'single', '=', 'Y', 'Y', '', '4', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('37', '5', 'create_user', 'bigint', '19', 'createUser', 'createUser', 'Long', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'N', 'N', '', '5', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('38', '5', 'create_date', 'datetime', null, 'createDate', 'createDate', 'Date', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'N', 'N', '', '6', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('39', '5', 'update_user', 'bigint', '19', 'updateUser', 'updateUser', 'Long', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'N', 'N', '', '7', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('40', '5', 'update_date', 'datetime', null, 'updateDate', 'updateDate', 'Date', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'N', 'N', '', '8', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('41', '6', 'id', 'bigint', '19', 'id', 'id', 'Long', 'N', null, null, null, 'N', 'Y', 'text', 'N', 'single', '=', 'Y', 'Y', '', '1', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('42', '6', 'role_id', 'bigint', '19', 'roleId', 'roleId', 'Long', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'Y', 'Y', '', '2', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('43', '6', 'menu_id', 'bigint', '19', 'menuId', 'menuId', 'Long', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'Y', 'Y', '', '3', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('44', '7', 'id', 'bigint', '19', 'id', 'id', 'Long', 'N', null, null, null, 'N', 'Y', 'text', 'N', 'single', '=', 'Y', 'Y', '', '1', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('45', '7', 'user_id', 'bigint', '19', 'userId', 'userId', 'Long', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'Y', 'Y', '', '2', null, null, null, null);
INSERT INTO `cg_column_config` VALUES ('46', '7', 'role_id', 'bigint', '19', 'roleId', 'roleId', 'Long', 'Y', null, null, null, 'N', 'N', 'text', 'N', 'single', '=', 'Y', 'Y', '', '3', null, null, null, null);

-- ----------------------------
-- Table structure for cg_data_source
-- ----------------------------
DROP TABLE IF EXISTS `cg_data_source`;
CREATE TABLE `cg_data_source` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `database_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '数据库类型',
  `database_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '数据库名称',
  `server` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务器IP',
  `port` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '端口号',
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人员',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人员',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cg_data_source
-- ----------------------------
INSERT INTO `cg_data_source` VALUES ('1', '当前数据库', 'mysql', 'cg', 'localhost', '3306', 'root', '123456', null, null, null, null);
INSERT INTO `cg_data_source` VALUES ('6', '22222', 'mysql', '111111', '111111111', '1111111111', '1111111111', '222222', null, null, null, null);
INSERT INTO `cg_data_source` VALUES ('8', '33333', 'mysql', '222299', '2222', '2222', '2222', '22222', null, null, null, null);

-- ----------------------------
-- Table structure for cg_table_config
-- ----------------------------
DROP TABLE IF EXISTS `cg_table_config`;
CREATE TABLE `cg_table_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `table_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表名',
  `class_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类名',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `is_checkbox` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否多选框',
  `is_page` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否分页',
  `is_tree` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否树',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人员',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人员',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cg_table_config
-- ----------------------------
INSERT INTO `cg_table_config` VALUES ('4', 'sys_user', 'SysUser', '用户管理', 'N', 'Y', null, '1', '2016-07-17 21:09:52', '1', '2016-07-17 21:14:49');
INSERT INTO `cg_table_config` VALUES ('5', 'sys_role', 'SysRole', '角色管理', 'N', 'Y', null, '1', '2016-07-21 23:43:20', '1', '2016-07-21 23:46:03');
INSERT INTO `cg_table_config` VALUES ('6', 'sys_role_menu', 'SysRoleMenu', '角色菜单', 'N', 'Y', null, '1', '2016-07-21 23:43:32', '1', '2016-07-22 00:00:53');
INSERT INTO `cg_table_config` VALUES ('7', 'sys_user_role', 'SysUserRole', '用户角色', 'N', 'Y', null, '1', '2016-07-21 23:43:40', '1', '2016-07-22 00:01:14');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单名称',
  `menu_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单路径',
  `menu_icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单图标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级菜单ID',
  `sort` int(8) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('11', '系统管理', '', 'icon-settings', '0', '2');
INSERT INTO `sys_menu` VALUES ('12', '用户管理', '/user/init', 'icon-users', '11', '1');
INSERT INTO `sys_menu` VALUES ('13', '角色管理', '/sysRole/init', 'icon-user', '11', '2');
INSERT INTO `sys_menu` VALUES ('14', '菜单管理', '/menu/init', 'icon-notebook', '11', '3');
INSERT INTO `sys_menu` VALUES ('15', '代码生成器', '', 'icon-printer', '0', '3');
INSERT INTO `sys_menu` VALUES ('16', '数据库连接', '/dataSource/init', 'icon-link', '15', '1');
INSERT INTO `sys_menu` VALUES ('17', '表单配置', '/tableConfig/init', 'icon-film', '15', '2');
INSERT INTO `sys_menu` VALUES ('19', '组织管理', '/org/init', 'icon-vector', '11', '4');
INSERT INTO `sys_menu` VALUES ('20', '图标管理', '/index/icon', 'icon-support', '11', '5');

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `org_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '组织名称',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级菜单ID',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES ('1', '001', '济南分公司', '济南', '0', null, null, null, null);
INSERT INTO `sys_org` VALUES ('2', '002', '北京分公司', '北京', '0', null, null, null, null);
INSERT INTO `sys_org` VALUES ('3', '003', '上海分公司', '上海', '0', null, null, null, null);
INSERT INTO `sys_org` VALUES ('4', '001001', '行政部', '行政', '1', null, null, null, null);
INSERT INTO `sys_org` VALUES ('5', '001002', '技术部', '技术', '1', null, null, null, null);
INSERT INTO `sys_org` VALUES ('6', '003002', '人事部', '人事', '3', null, null, null, null);
INSERT INTO `sys_org` VALUES ('7', '003001', '行政部', '行政', '3', null, null, null, null);
INSERT INTO `sys_org` VALUES ('8', '004', '杭州分公司', '杭州', '0', null, null, null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色编码',
  `role_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '001', '系统管理员', '所有权限', null, null, null, null);
INSERT INTO `sys_role` VALUES ('2', '002', '测试角色2', '002', null, null, null, null);
INSERT INTO `sys_role` VALUES ('3', '003', '测试角色3', '003', null, null, null, null);
INSERT INTO `sys_role` VALUES ('4', '004', '测试角色4', '004', null, null, null, null);
INSERT INTO `sys_role` VALUES ('5', '005', '测试角色5', '005', null, null, null, null);
INSERT INTO `sys_role` VALUES ('6', '006', '测试角色6', '006', null, null, null, null);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('21', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('22', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('23', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('24', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('25', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('26', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('27', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('28', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('29', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('75', '2', '11');
INSERT INTO `sys_role_menu` VALUES ('76', '2', '12');
INSERT INTO `sys_role_menu` VALUES ('77', '2', '15');
INSERT INTO `sys_role_menu` VALUES ('78', '2', '16');
INSERT INTO `sys_role_menu` VALUES ('79', '3', '15');
INSERT INTO `sys_role_menu` VALUES ('80', '3', '16');
INSERT INTO `sys_role_menu` VALUES ('81', '3', '17');
INSERT INTO `sys_role_menu` VALUES ('82', '4', '11');
INSERT INTO `sys_role_menu` VALUES ('83', '4', '12');
INSERT INTO `sys_role_menu` VALUES ('84', '4', '13');
INSERT INTO `sys_role_menu` VALUES ('85', '4', '14');
INSERT INTO `sys_role_menu` VALUES ('86', '4', '19');
INSERT INTO `sys_role_menu` VALUES ('87', '4', '20');
INSERT INTO `sys_role_menu` VALUES ('101', '6', '11');
INSERT INTO `sys_role_menu` VALUES ('102', '6', '12');
INSERT INTO `sys_role_menu` VALUES ('103', '5', '11');
INSERT INTO `sys_role_menu` VALUES ('104', '5', '13');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名',
  `org_id` bigint(20) DEFAULT NULL COMMENT '组织',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `user_photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `del_flag` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '删除标识',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'admin', '管理员', '5', '2016-08-07', '15912341234', 'test@test.com', '系统管理员', '20160807/20160807001237253e0729415245869bc90e7e4d239f7c.jpg', '0', null, null, null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('31', '1', '1');
