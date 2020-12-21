/*
 Navicat Premium Data Transfer

 Source Server         : Qqq
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : vue

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 21/12/2020 15:10:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模块名称\n',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模块路径，路径不能重复，重复的话，\n父模块：可以是子模块的前缀url\n子模块：可以自己设定一个url,只要不重复即可。\n会导致warn:\nDuplicate keys detected: \'\'. This may cause an update error.',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `module_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模块类型：页面模块还是侧边栏模块：\n0：侧边栏模块\n1：页面模块',
  `order_no` int(0) NULL DEFAULT NULL COMMENT '模块的顺序',
  `parent_id` int(0) NULL DEFAULT NULL COMMENT '父类id，如果是侧边栏的主要模块，为父模块，值为空，表示侧边栏的几个大模块\n',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字符串格式的组件地址',
  `redirect` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '转发路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '模块表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES (2, '浏览记录', '/example', 'el-icon-notebook-2', '0', 2, NULL, 'Layout', '');
INSERT INTO `module` VALUES (4, '树状', '/example/table', 'el-icon-set-up', '0', 4, 2, 'table/index', NULL);
INSERT INTO `module` VALUES (5, '知乎热搜Top100', '/example/tree', 'el-icon-coin', '0', 5, 2, 'tree/index', NULL);
INSERT INTO `module` VALUES (6, '权限管理', '/auth', 'el-icon-s-operation', '0', 6, NULL, 'Layout', '');
INSERT INTO `module` VALUES (7, '用户权限', '/auth/index', 'el-icon-user', '0', 7, 6, 'auth/auth/index', NULL);
INSERT INTO `module` VALUES (8, '系统管理', '/system/index', 'el-icon-setting', NULL, NULL, 6, 'auth/system/index', NULL);
INSERT INTO `module` VALUES (9, '每日答题', '/table', 'el-icon-s-opportunity', NULL, NULL, NULL, 'Layout', '');
INSERT INTO `module` VALUES (10, 'Mayi', '/mayi/index', 'el-icon-finished', '0', 9, 9, 'tableEdit/index', NULL);
INSERT INTO `module` VALUES (11, 'Mock数据', '/mock', 'el-icon-sunrise', '0', 10, NULL, 'Layout', NULL);
INSERT INTO `module` VALUES (12, 'user', '/mock/user', 'el-icon-sunrise', NULL, NULL, 11, 'mock/user', NULL);
INSERT INTO `module` VALUES (13, 'home', '/mock/home', 'el-icon-sunrise', NULL, NULL, 11, 'mock/home', NULL);
INSERT INTO `module` VALUES (14, '文件管理', '/file', 'el-icon-s-order', NULL, 12, NULL, 'Layout', '');
INSERT INTO `module` VALUES (16, '添加路由', '/auth/path', 'el-icon-share', '', NULL, 6, 'auth/path/index', NULL);
INSERT INTO `module` VALUES (17, '单文件上传', '/file/upload', 'el-icon-upload2', NULL, 1, 14, 'file/upload/index', NULL);
INSERT INTO `module` VALUES (18, '文件下载', '/file/download', 'el-icon-download', NULL, 3, 14, 'file/download/index', NULL);
INSERT INTO `module` VALUES (19, '多文件上传', '/file/multiUpload', 'el-icon-upload', NULL, 2, 14, 'file/multiUpload/index', NULL);
INSERT INTO `module` VALUES (20, '添加页面', '/path', 'el-icon-edit', '', 10, NULL, 'Layout', '');
INSERT INTO `module` VALUES (21, '添加页面', '/path/addPath', 'el-icon-edit', '', 2, 20, 'path/index', '');
INSERT INTO `module` VALUES (22, '添加页面2', '/pathTwo', 'el-icon-edit', NULL, 11, NULL, 'Layout', NULL);
INSERT INTO `module` VALUES (23, '添加页面2', '/pathTwo/addPathTwo', 'el-icon-opportunity', NULL, 11, 22, 'path/addPathTwo', NULL);
INSERT INTO `module` VALUES (24, '自己定义-根据传过来的值', '/path/s9Iei', 'el-icon-edit', NULL, NULL, 22, 'path/addPathTwo', NULL);
INSERT INTO `module` VALUES (26, '添加权限', '/auth/roleModule', 'el-icon-share', NULL, NULL, 6, 'auth/auth/roleModule', NULL);
INSERT INTO `module` VALUES (27, '试试', '/path/xlLHg', NULL, NULL, NULL, 6, 'auth/auth/comPage', NULL);

-- ----------------------------
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `region` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '目录',
  `desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简要描述',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求url',
  `requestMethod` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方式',
  `returnRes` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '返回示例',
  `note` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '页面内容\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for params
-- ----------------------------
DROP TABLE IF EXISTS `params`;
CREATE TABLE `params`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `paramName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数名\n',
  `isRequired` int(0) NULL DEFAULT NULL COMMENT '是否必选：0：否，1：是',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型',
  `note` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `page_id` int(0) NULL DEFAULT NULL COMMENT '页面内容的id',
  `returnType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否是请求参数或返回参数列表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名\n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin');
INSERT INTO `role` VALUES (2, 'customer');
INSERT INTO `role` VALUES (3, 'user');
INSERT INTO `role` VALUES (4, 'superadmin');

-- ----------------------------
-- Table structure for role_module
-- ----------------------------
DROP TABLE IF EXISTS `role_module`;
CREATE TABLE `role_module`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `role_id` int(0) NULL DEFAULT NULL,
  `module_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和模块关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_module
-- ----------------------------
INSERT INTO `role_module` VALUES (1, 1, 1);
INSERT INTO `role_module` VALUES (2, 1, 2);
INSERT INTO `role_module` VALUES (3, 1, 3);
INSERT INTO `role_module` VALUES (4, 1, 4);
INSERT INTO `role_module` VALUES (5, 1, 5);
INSERT INTO `role_module` VALUES (6, 1, 6);
INSERT INTO `role_module` VALUES (7, 1, 7);
INSERT INTO `role_module` VALUES (8, 1, 8);
INSERT INTO `role_module` VALUES (9, 1, 9);
INSERT INTO `role_module` VALUES (10, 1, 10);
INSERT INTO `role_module` VALUES (11, 1, 11);
INSERT INTO `role_module` VALUES (12, 1, 12);
INSERT INTO `role_module` VALUES (13, 1, 13);
INSERT INTO `role_module` VALUES (14, 1, 14);
INSERT INTO `role_module` VALUES (15, 1, 16);
INSERT INTO `role_module` VALUES (16, 1, 17);
INSERT INTO `role_module` VALUES (17, 1, 18);
INSERT INTO `role_module` VALUES (18, 1, 19);
INSERT INTO `role_module` VALUES (19, 1, 20);
INSERT INTO `role_module` VALUES (20, 1, 21);
INSERT INTO `role_module` VALUES (21, 1, 22);
INSERT INTO `role_module` VALUES (22, 1, 23);
INSERT INTO `role_module` VALUES (23, 1, 24);
INSERT INTO `role_module` VALUES (24, 1, 26);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信头像',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `gender` int(0) NULL DEFAULT NULL COMMENT '性别：0：男，1：女',
  `open_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信openid',
  `union_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信union_id',
  `id_card_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `id_card_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证姓名',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '城市',
  `language` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '语言',
  `status` int(0) NULL DEFAULT 1 COMMENT '用户状态：1：存在 0:删除',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'tom', NULL, '15555173209', NULL, NULL, NULL, NULL, NULL, '2020-09-29 16:42:07', '2020-11-11 10:52:19', NULL, NULL, NULL, NULL, 1, '123456');
INSERT INTO `user` VALUES (2, 'jane', NULL, '15856715519', NULL, NULL, NULL, NULL, NULL, '2020-10-15 15:41:45', '2020-10-15 15:41:45', NULL, NULL, NULL, NULL, 1, '123456');
INSERT INTO `user` VALUES (3, 'anna', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-15 16:31:57', '2020-10-15 16:31:57', NULL, NULL, NULL, NULL, 1, '123456');
INSERT INTO `user` VALUES (4, 'lulu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-15 16:31:57', '2020-10-15 16:31:57', NULL, NULL, NULL, NULL, 1, '123456');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, '1', '1');

-- ----------------------------
-- Table structure for weather
-- ----------------------------
DROP TABLE IF EXISTS `weather`;
CREATE TABLE `weather`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '天气id',
  `day_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '每天的日期',
  `weather` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '天气：天气情况，还有温度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '天气信息表-每天的天气\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for web_log
-- ----------------------------
DROP TABLE IF EXISTS `web_log`;
CREATE TABLE `web_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'log_id',
  `content_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户访问的controller的路径\n',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '用户id',
  `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '用户访问的起始时间',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `insert_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 696 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_log
-- ----------------------------
INSERT INTO `web_log` VALUES (1, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 14:26:26', 'tom');
INSERT INTO `web_log` VALUES (2, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 14:32:30', 'tom');
INSERT INTO `web_log` VALUES (3, '/user/login', NULL, NULL, '用户登陆', '2020-11-02 14:32:33', NULL);
INSERT INTO `web_log` VALUES (4, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 14:32:34', 'tom');
INSERT INTO `web_log` VALUES (5, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 14:47:17', 'tom');
INSERT INTO `web_log` VALUES (6, '/user/login', NULL, NULL, '用户登陆', '2020-11-02 14:57:15', NULL);
INSERT INTO `web_log` VALUES (7, '/user/login', NULL, NULL, '用户登陆', '2020-11-02 14:57:15', 'tom');
INSERT INTO `web_log` VALUES (8, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 14:57:15', 'tom');
INSERT INTO `web_log` VALUES (9, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 14:57:15', 'tom');
INSERT INTO `web_log` VALUES (10, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 15:13:46', 'tom');
INSERT INTO `web_log` VALUES (11, '/user/login', NULL, NULL, '用户登陆', '2020-11-02 15:13:49', NULL);
INSERT INTO `web_log` VALUES (12, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 15:13:49', 'tom');
INSERT INTO `web_log` VALUES (13, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 15:19:12', 'tom');
INSERT INTO `web_log` VALUES (14, '/user/login', NULL, NULL, '用户登陆', '2020-11-02 15:41:39', NULL);
INSERT INTO `web_log` VALUES (15, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 15:41:39', 'tom');
INSERT INTO `web_log` VALUES (16, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 15:41:56', 'tom');
INSERT INTO `web_log` VALUES (17, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 15:42:36', 'tom');
INSERT INTO `web_log` VALUES (18, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 15:42:46', 'tom');
INSERT INTO `web_log` VALUES (19, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 15:43:07', 'tom');
INSERT INTO `web_log` VALUES (20, '/user/login', NULL, NULL, '用户登陆', '2020-11-02 15:44:43', NULL);
INSERT INTO `web_log` VALUES (21, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 15:44:44', 'tom');
INSERT INTO `web_log` VALUES (22, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 15:45:22', 'tom');
INSERT INTO `web_log` VALUES (23, '', NULL, NULL, '首页', '2020-11-02 15:45:22', NULL);
INSERT INTO `web_log` VALUES (24, '/log/addWebLog', NULL, NULL, '添加日志', '2020-11-02 15:45:22', 'tom');
INSERT INTO `web_log` VALUES (25, '', NULL, NULL, '表格demo', '2020-11-02 15:45:56', NULL);
INSERT INTO `web_log` VALUES (26, '/log/addWebLog', NULL, NULL, '添加日志', '2020-11-02 15:45:56', 'tom');
INSERT INTO `web_log` VALUES (27, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 15:46:49', 'tom');
INSERT INTO `web_log` VALUES (28, '/user/login', NULL, NULL, '用户登陆', '2020-11-02 15:46:56', NULL);
INSERT INTO `web_log` VALUES (29, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 15:46:56', 'tom');
INSERT INTO `web_log` VALUES (30, '/dashboard', NULL, NULL, '首页', '2020-11-02 15:46:56', NULL);
INSERT INTO `web_log` VALUES (31, '/log/addWebLog', NULL, NULL, '添加日志', '2020-11-02 15:46:56', 'tom');
INSERT INTO `web_log` VALUES (32, '/table/index', NULL, NULL, '编辑', '2020-11-02 15:46:59', NULL);
INSERT INTO `web_log` VALUES (33, '/log/addWebLog', NULL, NULL, '添加日志', '2020-11-02 15:46:59', 'tom');
INSERT INTO `web_log` VALUES (34, '/user/login', NULL, NULL, '用户登陆', '2020-11-02 16:13:30', NULL);
INSERT INTO `web_log` VALUES (35, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 16:13:30', 'tom');
INSERT INTO `web_log` VALUES (36, '/dashboard', NULL, NULL, '首页', '2020-11-02 16:13:30', NULL);
INSERT INTO `web_log` VALUES (37, '/log/addWebLog', NULL, NULL, '添加日志', '2020-11-02 16:13:30', 'tom');
INSERT INTO `web_log` VALUES (38, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 16:13:35', 'tom');
INSERT INTO `web_log` VALUES (39, '/dashboard', NULL, NULL, '首页', '2020-11-02 16:13:35', NULL);
INSERT INTO `web_log` VALUES (40, '/log/addWebLog', NULL, NULL, '添加日志', '2020-11-02 16:13:35', 'tom');
INSERT INTO `web_log` VALUES (41, '/user/loginOut', NULL, NULL, '退出登录', '2020-11-02 16:13:36', 'tom');
INSERT INTO `web_log` VALUES (42, '/user/login', NULL, NULL, '用户登陆', '2020-11-02 16:13:41', NULL);
INSERT INTO `web_log` VALUES (43, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 16:13:41', 'tom');
INSERT INTO `web_log` VALUES (44, '/dashboard', NULL, NULL, '首页', '2020-11-02 16:13:41', NULL);
INSERT INTO `web_log` VALUES (45, '/log/addWebLog', NULL, NULL, '添加日志', '2020-11-02 16:13:41', 'tom');
INSERT INTO `web_log` VALUES (46, '/user/userInfo', NULL, NULL, '用户信息', '2020-11-02 16:14:22', 'tom');
INSERT INTO `web_log` VALUES (47, '/dashboard', NULL, NULL, '首页', '2020-11-02 16:14:22', NULL);
INSERT INTO `web_log` VALUES (48, '/log/addWebLog', NULL, NULL, '添加日志', '2020-11-02 16:14:23', 'tom');
INSERT INTO `web_log` VALUES (49, '/dashboard', NULL, NULL, '首页', '2020-11-02 16:26:52', NULL);
INSERT INTO `web_log` VALUES (50, '/dashboard', NULL, NULL, '首页', '2020-11-02 16:42:56', NULL);
INSERT INTO `web_log` VALUES (51, '/dashboard', NULL, NULL, '首页', '2020-11-02 16:50:03', NULL);
INSERT INTO `web_log` VALUES (52, '/table/index', NULL, NULL, '编辑', '2020-11-02 16:50:20', NULL);
INSERT INTO `web_log` VALUES (53, '/example/table', NULL, NULL, '表格demo', '2020-11-02 16:50:22', NULL);
INSERT INTO `web_log` VALUES (54, '/table/index', NULL, NULL, '编辑', '2020-11-02 17:09:16', NULL);
INSERT INTO `web_log` VALUES (55, '/example/table', NULL, NULL, '表格demo', '2020-11-02 17:09:20', NULL);
INSERT INTO `web_log` VALUES (56, '/example/tree', NULL, NULL, '树形demo', '2020-11-02 17:09:21', NULL);
INSERT INTO `web_log` VALUES (57, '/system/index', NULL, NULL, '系统权限', '2020-11-02 17:09:23', NULL);
INSERT INTO `web_log` VALUES (58, '/auth/index', NULL, NULL, '用户权限', '2020-11-02 17:09:24', NULL);
INSERT INTO `web_log` VALUES (59, '/example/table', NULL, NULL, '表格demo', '2020-11-02 17:09:24', NULL);
INSERT INTO `web_log` VALUES (60, '/dashboard', NULL, NULL, '首页', '2020-11-02 17:09:27', NULL);
INSERT INTO `web_log` VALUES (61, '/table/index', NULL, NULL, '编辑', '2020-11-02 17:09:27', NULL);
INSERT INTO `web_log` VALUES (62, '/example/table', NULL, NULL, '表格demo', '2020-11-02 17:11:06', NULL);
INSERT INTO `web_log` VALUES (63, '/example/table', NULL, NULL, '表格demo', '2020-11-02 17:11:34', NULL);
INSERT INTO `web_log` VALUES (64, '/dashboard', NULL, NULL, '首页', '2020-11-02 17:28:03', NULL);
INSERT INTO `web_log` VALUES (65, '/example/table', NULL, NULL, '表格demo', '2020-11-02 17:28:07', NULL);
INSERT INTO `web_log` VALUES (66, '/example/table', NULL, NULL, '表格demo', '2020-11-02 17:32:18', NULL);
INSERT INTO `web_log` VALUES (67, '/table/index', NULL, NULL, '编辑', '2020-11-02 17:32:21', NULL);
INSERT INTO `web_log` VALUES (68, '/table/index', NULL, NULL, '编辑', '2020-11-02 17:32:39', NULL);
INSERT INTO `web_log` VALUES (69, '/example/table', NULL, NULL, '表格demo', '2020-11-02 17:32:41', NULL);
INSERT INTO `web_log` VALUES (70, '/table/index', NULL, NULL, '编辑', '2020-11-02 17:33:52', NULL);
INSERT INTO `web_log` VALUES (71, '/example/table', NULL, NULL, '表格demo', '2020-11-02 17:33:57', NULL);
INSERT INTO `web_log` VALUES (72, '/example/tree', NULL, NULL, '树形demo', '2020-11-02 17:41:16', NULL);
INSERT INTO `web_log` VALUES (73, '/example/table', NULL, NULL, '表格demo', '2020-11-02 17:41:41', NULL);
INSERT INTO `web_log` VALUES (74, '/dashboard', NULL, NULL, '首页', '2020-11-02 18:07:29', 'tom');
INSERT INTO `web_log` VALUES (75, '/table/index', NULL, NULL, '编辑', '2020-11-02 18:07:35', 'tom');
INSERT INTO `web_log` VALUES (76, '/example/table', NULL, NULL, '表格demo', '2020-11-02 18:07:37', 'tom');
INSERT INTO `web_log` VALUES (77, '/example/tree', NULL, NULL, '树形demo', '2020-11-02 18:07:52', 'tom');
INSERT INTO `web_log` VALUES (78, '/example/table', NULL, NULL, '表格demo', '2020-11-02 18:07:53', 'tom');
INSERT INTO `web_log` VALUES (79, '/example/table', NULL, NULL, '表格demo', '2020-11-02 18:23:49', 'tom');
INSERT INTO `web_log` VALUES (80, '/example/table', NULL, NULL, '表格demo', '2020-11-02 18:24:01', 'tom');
INSERT INTO `web_log` VALUES (81, '/dashboard', NULL, NULL, '首页', '2020-11-06 15:03:20', 'tom');
INSERT INTO `web_log` VALUES (82, '/dashboard', NULL, NULL, '首页', '2020-11-06 15:10:22', 'tom');
INSERT INTO `web_log` VALUES (83, '/dashboard', NULL, NULL, '首页', '2020-11-06 15:14:40', 'tom');
INSERT INTO `web_log` VALUES (84, '/dashboard', NULL, NULL, '首页', '2020-11-06 15:16:31', 'tom');
INSERT INTO `web_log` VALUES (85, '/dashboard', NULL, NULL, '首页', '2020-11-06 15:45:32', 'tom');
INSERT INTO `web_log` VALUES (86, '/dashboard', NULL, NULL, '首页', '2020-11-06 15:47:36', 'tom');
INSERT INTO `web_log` VALUES (87, '/dashboard', NULL, NULL, '首页', '2020-11-06 15:52:02', 'tom');
INSERT INTO `web_log` VALUES (88, '/dashboard', NULL, NULL, '首页', '2020-11-06 15:56:03', 'tom');
INSERT INTO `web_log` VALUES (89, '/dashboard', NULL, NULL, '首页', '2020-11-06 15:59:02', 'tom');
INSERT INTO `web_log` VALUES (90, '/dashboard', NULL, NULL, '首页', '2020-11-06 16:01:39', 'tom');
INSERT INTO `web_log` VALUES (91, '/dashboard', NULL, NULL, '首页', '2020-11-06 16:04:51', 'tom');
INSERT INTO `web_log` VALUES (92, '/dashboard', NULL, NULL, '首页', '2020-11-09 11:09:05', 'tom');
INSERT INTO `web_log` VALUES (93, '/table/index', NULL, NULL, '编辑', '2020-11-09 11:09:11', 'tom');
INSERT INTO `web_log` VALUES (94, '/example/table', NULL, NULL, '表格demo', '2020-11-09 11:09:13', 'tom');
INSERT INTO `web_log` VALUES (95, '/example/tree', NULL, NULL, '树形demo', '2020-11-09 11:09:15', 'tom');
INSERT INTO `web_log` VALUES (96, '/table/index', NULL, NULL, '编辑', '2020-11-09 11:09:16', 'tom');
INSERT INTO `web_log` VALUES (97, '/table/index', NULL, NULL, '编辑', '2020-11-09 11:11:43', 'tom');
INSERT INTO `web_log` VALUES (98, '/table/index', NULL, NULL, '编辑', '2020-11-09 11:32:14', 'tom');
INSERT INTO `web_log` VALUES (99, '/table/index', NULL, NULL, '编辑', '2020-11-09 11:35:42', 'tom');
INSERT INTO `web_log` VALUES (100, '/dashboard', NULL, NULL, '首页', '2020-11-09 11:43:35', 'tom');
INSERT INTO `web_log` VALUES (101, '/table/index', NULL, NULL, '编辑', '2020-11-09 11:43:41', 'tom');
INSERT INTO `web_log` VALUES (102, '/system/index', NULL, NULL, '系统权限', '2020-11-09 11:43:44', 'tom');
INSERT INTO `web_log` VALUES (103, '/auth/index', NULL, NULL, '用户权限', '2020-11-09 11:43:45', 'tom');
INSERT INTO `web_log` VALUES (104, '/auth/index', NULL, NULL, '用户权限', '2020-11-09 11:44:57', 'tom');
INSERT INTO `web_log` VALUES (105, '/system/index', NULL, NULL, '系统权限', '2020-11-09 11:46:41', 'tom');
INSERT INTO `web_log` VALUES (106, '/system/index', NULL, NULL, '系统权限', '2020-11-09 11:55:38', 'tom');
INSERT INTO `web_log` VALUES (107, '/dashboard', NULL, NULL, '首页', '2020-11-09 13:25:07', 'tom');
INSERT INTO `web_log` VALUES (108, '/system/index', NULL, NULL, '系统权限', '2020-11-09 13:27:00', 'tom');
INSERT INTO `web_log` VALUES (109, '/auth/index', NULL, NULL, '用户权限', '2020-11-09 13:27:02', 'tom');
INSERT INTO `web_log` VALUES (110, '/system/index', NULL, NULL, '系统权限', '2020-11-09 13:27:03', 'tom');
INSERT INTO `web_log` VALUES (111, '/system/index', NULL, NULL, '系统权限', '2020-11-09 13:28:37', 'tom');
INSERT INTO `web_log` VALUES (112, '/system/index', NULL, NULL, '系统权限', '2020-11-09 13:29:23', 'tom');
INSERT INTO `web_log` VALUES (113, '/system/index', NULL, NULL, '系统权限', '2020-11-09 13:29:46', 'tom');
INSERT INTO `web_log` VALUES (114, '/system/index', NULL, NULL, '系统权限', '2020-11-09 13:30:39', 'tom');
INSERT INTO `web_log` VALUES (115, '/system/index', NULL, NULL, '系统权限', '2020-11-09 13:33:13', 'tom');
INSERT INTO `web_log` VALUES (116, '/dashboard', NULL, NULL, '首页', '2020-11-10 13:40:18', 'tom');
INSERT INTO `web_log` VALUES (117, '/dashboard', NULL, NULL, '首页', '2020-11-10 13:40:18', 'tom');
INSERT INTO `web_log` VALUES (118, '/system/index', NULL, NULL, '系统权限', '2020-11-10 13:41:12', 'tom');
INSERT INTO `web_log` VALUES (119, '/system/index', NULL, NULL, '系统权限', '2020-11-10 13:44:59', 'tom');
INSERT INTO `web_log` VALUES (120, '/system/index', NULL, NULL, '系统权限', '2020-11-10 13:46:03', 'tom');
INSERT INTO `web_log` VALUES (121, '/system/index', NULL, NULL, '系统权限', '2020-11-10 13:46:41', 'tom');
INSERT INTO `web_log` VALUES (122, '/system/index', NULL, NULL, '系统权限', '2020-11-10 13:47:08', 'tom');
INSERT INTO `web_log` VALUES (123, '/system/index', NULL, NULL, '系统权限', '2020-11-10 13:52:13', 'tom');
INSERT INTO `web_log` VALUES (124, '/system/index', NULL, NULL, '系统权限', '2020-11-10 14:04:08', 'tom');
INSERT INTO `web_log` VALUES (125, '/system/index', NULL, NULL, '系统权限', '2020-11-10 14:04:24', 'tom');
INSERT INTO `web_log` VALUES (126, '/system/index', NULL, NULL, '系统权限', '2020-11-10 14:05:04', 'tom');
INSERT INTO `web_log` VALUES (127, '/system/index', NULL, NULL, '系统权限', '2020-11-10 14:10:27', 'tom');
INSERT INTO `web_log` VALUES (128, '/system/index', NULL, NULL, '系统权限', '2020-11-10 14:24:09', 'tom');
INSERT INTO `web_log` VALUES (129, '/system/index', NULL, NULL, '系统权限', '2020-11-10 14:28:39', 'tom');
INSERT INTO `web_log` VALUES (130, '/system/index', NULL, NULL, '系统权限', '2020-11-10 14:31:50', 'tom');
INSERT INTO `web_log` VALUES (131, '/system/index', NULL, NULL, '系统权限', '2020-11-10 14:33:48', 'tom');
INSERT INTO `web_log` VALUES (132, '/system/index', NULL, NULL, '系统权限', '2020-11-10 14:34:07', 'tom');
INSERT INTO `web_log` VALUES (133, '/system/index', NULL, NULL, '系统权限', '2020-11-10 14:37:31', 'tom');
INSERT INTO `web_log` VALUES (134, '/system/index', NULL, NULL, '系统权限', '2020-11-10 14:38:05', 'tom');
INSERT INTO `web_log` VALUES (135, '/system/index', NULL, NULL, '系统权限', '2020-11-10 14:38:25', 'tom');
INSERT INTO `web_log` VALUES (136, '/system/index', NULL, NULL, '系统权限', '2020-11-10 14:54:03', 'tom');
INSERT INTO `web_log` VALUES (137, '/dashboard', NULL, NULL, '首页', '2020-11-10 14:54:04', 'tom');
INSERT INTO `web_log` VALUES (138, '/dashboard', NULL, NULL, '首页', '2020-11-10 14:54:23', 'tom');
INSERT INTO `web_log` VALUES (139, '/system/index', NULL, NULL, '系统权限', '2020-11-10 14:54:23', 'tom');
INSERT INTO `web_log` VALUES (140, '/dashboard', NULL, NULL, '首页', '2020-11-10 14:57:44', 'tom');
INSERT INTO `web_log` VALUES (141, '/system/index', NULL, NULL, '系统权限', '2020-11-10 14:57:44', 'tom');
INSERT INTO `web_log` VALUES (142, '/dashboard', NULL, NULL, '首页', '2020-11-10 14:58:47', 'tom');
INSERT INTO `web_log` VALUES (143, '/system/index', NULL, NULL, '系统权限', '2020-11-10 14:58:47', 'tom');
INSERT INTO `web_log` VALUES (144, '/system/index', NULL, NULL, '系统权限', '2020-11-10 15:05:10', 'tom');
INSERT INTO `web_log` VALUES (145, '/dashboard', NULL, NULL, '首页', '2020-11-10 15:05:31', 'tom');
INSERT INTO `web_log` VALUES (146, '/system/index', NULL, NULL, '系统权限', '2020-11-10 15:05:32', 'tom');
INSERT INTO `web_log` VALUES (147, '/dashboard', NULL, NULL, '首页', '2020-11-10 15:05:42', 'tom');
INSERT INTO `web_log` VALUES (148, '/system/index', NULL, NULL, '系统权限', '2020-11-10 15:05:42', 'tom');
INSERT INTO `web_log` VALUES (149, '/dashboard', NULL, NULL, '首页', '2020-11-10 15:05:58', 'tom');
INSERT INTO `web_log` VALUES (150, '/system/index', NULL, NULL, '系统权限', '2020-11-10 15:05:58', 'tom');
INSERT INTO `web_log` VALUES (151, '/system/index', NULL, NULL, '系统权限', '2020-11-10 15:07:36', 'tom');
INSERT INTO `web_log` VALUES (152, '/dashboard', NULL, NULL, '首页', '2020-11-10 15:10:58', 'tom');
INSERT INTO `web_log` VALUES (153, '/system/index', NULL, NULL, '系统权限', '2020-11-10 15:10:58', 'tom');
INSERT INTO `web_log` VALUES (154, '/system/index', NULL, NULL, '系统权限', '2020-11-10 15:25:41', 'tom');
INSERT INTO `web_log` VALUES (155, '/system/index', NULL, NULL, '系统权限', '2020-11-10 15:37:15', 'tom');
INSERT INTO `web_log` VALUES (156, '/dashboard', NULL, NULL, '首页', '2020-11-10 15:47:09', 'tom');
INSERT INTO `web_log` VALUES (157, '/system/index', NULL, NULL, '系统权限', '2020-11-10 15:47:10', 'tom');
INSERT INTO `web_log` VALUES (158, '/dashboard', NULL, NULL, '首页', '2020-11-10 15:49:30', 'tom');
INSERT INTO `web_log` VALUES (159, '/system/index', NULL, NULL, '系统权限', '2020-11-10 15:49:30', 'tom');
INSERT INTO `web_log` VALUES (160, '/dashboard', NULL, NULL, '首页', '2020-11-10 15:51:50', 'tom');
INSERT INTO `web_log` VALUES (161, '/system/index', NULL, NULL, '系统权限', '2020-11-10 15:51:51', 'tom');
INSERT INTO `web_log` VALUES (162, '/dashboard', NULL, NULL, '首页', '2020-11-10 15:56:11', 'tom');
INSERT INTO `web_log` VALUES (163, '/system/index', NULL, NULL, '系统权限', '2020-11-10 15:56:12', 'tom');
INSERT INTO `web_log` VALUES (164, '/dashboard', NULL, NULL, '首页', '2020-11-10 15:58:01', 'tom');
INSERT INTO `web_log` VALUES (165, '/system/index', NULL, NULL, '系统权限', '2020-11-10 15:58:02', 'tom');
INSERT INTO `web_log` VALUES (166, '/system/index', NULL, NULL, '系统权限', '2020-11-10 15:58:04', 'tom');
INSERT INTO `web_log` VALUES (167, '/dashboard', NULL, NULL, '首页', '2020-11-10 16:05:27', 'tom');
INSERT INTO `web_log` VALUES (168, '/system/index', NULL, NULL, '系统权限', '2020-11-10 16:05:27', 'tom');
INSERT INTO `web_log` VALUES (169, '/dashboard', NULL, NULL, '首页', '2020-11-10 16:06:36', 'tom');
INSERT INTO `web_log` VALUES (170, '/system/index', NULL, NULL, '系统权限', '2020-11-10 16:06:36', 'tom');
INSERT INTO `web_log` VALUES (171, '/dashboard', NULL, NULL, '首页', '2020-11-10 16:08:21', 'tom');
INSERT INTO `web_log` VALUES (172, '/system/index', NULL, NULL, '系统权限', '2020-11-10 16:08:22', 'tom');
INSERT INTO `web_log` VALUES (173, '/dashboard', NULL, NULL, '首页', '2020-11-10 16:08:53', 'tom');
INSERT INTO `web_log` VALUES (174, '/system/index', NULL, NULL, '系统权限', '2020-11-10 16:08:53', 'tom');
INSERT INTO `web_log` VALUES (175, '/dashboard', NULL, NULL, '首页', '2020-11-10 16:10:09', 'tom');
INSERT INTO `web_log` VALUES (176, '/system/index', NULL, NULL, '系统权限', '2020-11-10 16:10:10', 'tom');
INSERT INTO `web_log` VALUES (177, '/example/table', NULL, NULL, '表格demo', '2020-11-10 16:22:56', 'tom');
INSERT INTO `web_log` VALUES (178, '/dashboard', NULL, NULL, '首页', '2020-11-10 16:51:18', 'tom');
INSERT INTO `web_log` VALUES (179, '/example/table', NULL, NULL, '表格demo', '2020-11-10 16:51:18', 'tom');
INSERT INTO `web_log` VALUES (180, '/example/tree', NULL, NULL, '树形demo', '2020-11-10 16:51:21', 'tom');
INSERT INTO `web_log` VALUES (181, '/table/index', NULL, NULL, '编辑', '2020-11-10 16:51:25', 'tom');
INSERT INTO `web_log` VALUES (182, '/system/index', NULL, NULL, '系统权限', '2020-11-10 16:51:27', 'tom');
INSERT INTO `web_log` VALUES (183, '/dashboard', NULL, NULL, '首页', '2020-11-10 16:52:25', 'tom');
INSERT INTO `web_log` VALUES (184, '/system/index', NULL, NULL, '系统权限', '2020-11-10 16:52:25', 'tom');
INSERT INTO `web_log` VALUES (185, '/dashboard', NULL, NULL, '首页', '2020-11-10 16:53:04', 'tom');
INSERT INTO `web_log` VALUES (186, '/system/index', NULL, NULL, '系统权限', '2020-11-10 16:53:04', 'tom');
INSERT INTO `web_log` VALUES (187, '/system/index', NULL, NULL, '系统权限', '2020-11-10 16:58:45', 'tom');
INSERT INTO `web_log` VALUES (188, '/system/index', NULL, NULL, '系统权限', '2020-11-10 16:59:27', 'tom');
INSERT INTO `web_log` VALUES (189, '/dashboard', NULL, NULL, '首页', '2020-11-10 17:00:58', 'tom');
INSERT INTO `web_log` VALUES (190, '/system/index', NULL, NULL, '系统权限', '2020-11-10 17:00:58', 'tom');
INSERT INTO `web_log` VALUES (191, '/system/index', NULL, NULL, '系统权限', '2020-11-10 17:25:32', 'tom');
INSERT INTO `web_log` VALUES (192, '/system/index', NULL, NULL, '系统权限', '2020-11-10 17:26:36', 'tom');
INSERT INTO `web_log` VALUES (193, '/dashboard', NULL, NULL, '首页', '2020-11-10 17:55:59', 'tom');
INSERT INTO `web_log` VALUES (194, '/system/index', NULL, NULL, '系统权限', '2020-11-10 17:55:59', 'tom');
INSERT INTO `web_log` VALUES (195, '/dashboard', NULL, NULL, '首页', '2020-11-10 18:06:58', 'tom');
INSERT INTO `web_log` VALUES (196, '/system/index', NULL, NULL, '系统权限', '2020-11-10 18:06:58', 'tom');
INSERT INTO `web_log` VALUES (197, '/dashboard', NULL, NULL, '首页', '2020-11-10 18:23:38', 'tom');
INSERT INTO `web_log` VALUES (198, '/system/index', NULL, NULL, '系统权限', '2020-11-10 18:23:38', 'tom');
INSERT INTO `web_log` VALUES (199, '/dashboard', NULL, NULL, '首页', '2020-11-11 10:21:15', 'tom');
INSERT INTO `web_log` VALUES (200, '/table/index', NULL, NULL, '编辑', '2020-11-11 10:21:20', 'tom');
INSERT INTO `web_log` VALUES (201, '/system/index', NULL, NULL, '系统权限', '2020-11-11 10:21:23', 'tom');
INSERT INTO `web_log` VALUES (202, '/system/index', NULL, NULL, '系统权限', '2020-11-11 10:22:25', 'tom');
INSERT INTO `web_log` VALUES (203, '/system/index', NULL, NULL, '系统权限', '2020-11-11 10:40:17', 'tom');
INSERT INTO `web_log` VALUES (204, '/system/index', NULL, NULL, '系统权限', '2020-11-11 10:53:21', 'tom');
INSERT INTO `web_log` VALUES (205, '/system/index', NULL, NULL, '系统权限', '2020-11-11 11:18:21', 'tom');
INSERT INTO `web_log` VALUES (206, '/system/index', NULL, NULL, '系统权限', '2020-11-11 11:35:56', 'tom');
INSERT INTO `web_log` VALUES (207, '/system/index', NULL, NULL, '系统权限', '2020-11-11 11:37:08', 'tom');
INSERT INTO `web_log` VALUES (208, '/system/index', NULL, NULL, '系统权限', '2020-11-11 11:50:01', 'tom');
INSERT INTO `web_log` VALUES (209, '/system/index', NULL, NULL, '系统权限', '2020-11-11 11:55:50', 'tom');
INSERT INTO `web_log` VALUES (210, '/system/index', NULL, NULL, '系统权限', '2020-11-11 13:32:50', 'tom');
INSERT INTO `web_log` VALUES (211, '/system/index', NULL, NULL, '系统权限', '2020-11-11 13:57:44', 'tom');
INSERT INTO `web_log` VALUES (212, '/system/index', NULL, NULL, '系统权限', '2020-11-11 13:59:37', 'tom');
INSERT INTO `web_log` VALUES (213, '/system/index', NULL, NULL, '系统权限', '2020-11-11 14:06:07', 'tom');
INSERT INTO `web_log` VALUES (214, '/auth/index', NULL, NULL, '用户权限', '2020-11-11 14:07:23', 'tom');
INSERT INTO `web_log` VALUES (215, '/dashboard', NULL, NULL, '首页', '2020-11-11 14:09:40', 'tom');
INSERT INTO `web_log` VALUES (216, '/table/index', NULL, NULL, '编辑', '2020-11-11 14:09:42', 'tom');
INSERT INTO `web_log` VALUES (217, '/auth/index', NULL, NULL, '用户权限', '2020-11-11 14:33:33', 'tom');
INSERT INTO `web_log` VALUES (218, '/auth/index', NULL, NULL, '用户权限', '2020-11-11 14:56:00', 'tom');
INSERT INTO `web_log` VALUES (219, '/auth/index', NULL, NULL, '用户权限', '2020-11-11 14:56:32', 'tom');
INSERT INTO `web_log` VALUES (220, '/example/table', NULL, NULL, '表格demo', '2020-11-11 14:57:27', 'tom');
INSERT INTO `web_log` VALUES (221, '/example/tree', NULL, NULL, '树形demo', '2020-11-11 14:57:32', 'tom');
INSERT INTO `web_log` VALUES (222, '/example/table', NULL, NULL, '表格demo', '2020-11-11 14:57:33', 'tom');
INSERT INTO `web_log` VALUES (223, '/table/index', NULL, NULL, '编辑', '2020-11-11 14:57:35', 'tom');
INSERT INTO `web_log` VALUES (224, '/system/index', NULL, NULL, '系统权限', '2020-11-11 14:57:38', 'tom');
INSERT INTO `web_log` VALUES (225, '/dashboard', NULL, NULL, '首页', '2020-11-11 14:57:40', 'tom');
INSERT INTO `web_log` VALUES (226, '/auth/index', NULL, NULL, '用户权限', '2020-11-11 14:57:42', 'tom');
INSERT INTO `web_log` VALUES (227, '/system/index', NULL, NULL, '系统权限', '2020-11-11 14:57:45', 'tom');
INSERT INTO `web_log` VALUES (228, '/dashboard', NULL, NULL, '首页', '2020-11-11 14:57:54', 'tom');
INSERT INTO `web_log` VALUES (229, '/dashboard', NULL, NULL, '首页', '2020-11-11 15:07:12', 'tom');
INSERT INTO `web_log` VALUES (230, '/dashboard', NULL, NULL, '首页', '2020-11-11 15:14:15', 'tom');
INSERT INTO `web_log` VALUES (231, '/dashboard', NULL, NULL, '首页', '2020-11-11 15:14:34', 'tom');
INSERT INTO `web_log` VALUES (232, '/dashboard', NULL, NULL, '首页', '2020-11-11 15:24:17', 'tom');
INSERT INTO `web_log` VALUES (233, '/dashboard', NULL, NULL, '首页', '2020-11-11 15:26:20', 'tom');
INSERT INTO `web_log` VALUES (234, '/dashboard', NULL, NULL, '首页', '2020-11-11 15:28:26', 'tom');
INSERT INTO `web_log` VALUES (235, '/dashboard', NULL, NULL, '首页', '2020-11-11 15:28:29', 'tom');
INSERT INTO `web_log` VALUES (236, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:02:35', 'tom');
INSERT INTO `web_log` VALUES (237, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:02:39', 'tom');
INSERT INTO `web_log` VALUES (238, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:06:05', 'tom');
INSERT INTO `web_log` VALUES (239, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:06:46', 'tom');
INSERT INTO `web_log` VALUES (240, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:07:18', 'tom');
INSERT INTO `web_log` VALUES (241, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:07:54', 'tom');
INSERT INTO `web_log` VALUES (242, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:08:10', 'tom');
INSERT INTO `web_log` VALUES (243, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:09:21', 'tom');
INSERT INTO `web_log` VALUES (244, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:10:28', 'tom');
INSERT INTO `web_log` VALUES (245, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:12:43', 'tom');
INSERT INTO `web_log` VALUES (246, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:16:05', 'tom');
INSERT INTO `web_log` VALUES (247, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:28:21', 'tom');
INSERT INTO `web_log` VALUES (248, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:41:08', 'tom');
INSERT INTO `web_log` VALUES (249, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:46:16', 'tom');
INSERT INTO `web_log` VALUES (250, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:47:25', 'tom');
INSERT INTO `web_log` VALUES (251, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:52:38', 'tom');
INSERT INTO `web_log` VALUES (252, '/mock/user', NULL, NULL, 'user', '2020-11-11 16:52:44', 'tom');
INSERT INTO `web_log` VALUES (253, '/mock/home', NULL, NULL, 'home', '2020-11-11 16:52:48', 'tom');
INSERT INTO `web_log` VALUES (254, '/mock/user', NULL, NULL, 'user', '2020-11-11 16:52:49', 'tom');
INSERT INTO `web_log` VALUES (255, '/mock/user', NULL, NULL, 'user', '2020-11-11 16:52:51', 'tom');
INSERT INTO `web_log` VALUES (256, '/mock/home', NULL, NULL, 'home', '2020-11-11 16:52:52', 'tom');
INSERT INTO `web_log` VALUES (257, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:54:04', 'tom');
INSERT INTO `web_log` VALUES (258, '/mock/user', NULL, NULL, 'user', '2020-11-11 16:54:07', 'tom');
INSERT INTO `web_log` VALUES (259, '/mock/home', NULL, NULL, 'home', '2020-11-11 16:54:08', 'tom');
INSERT INTO `web_log` VALUES (260, '/mock/user', NULL, NULL, 'user', '2020-11-11 16:54:09', 'tom');
INSERT INTO `web_log` VALUES (261, '/mock/home', NULL, NULL, 'home', '2020-11-11 16:54:12', 'tom');
INSERT INTO `web_log` VALUES (262, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:54:20', 'tom');
INSERT INTO `web_log` VALUES (263, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:55:11', 'tom');
INSERT INTO `web_log` VALUES (264, '/mock/home', NULL, NULL, 'home', '2020-11-11 16:55:13', 'tom');
INSERT INTO `web_log` VALUES (265, '/mock/user', NULL, NULL, 'user', '2020-11-11 16:55:21', 'tom');
INSERT INTO `web_log` VALUES (266, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:57:44', 'tom');
INSERT INTO `web_log` VALUES (267, '/system/index', NULL, NULL, '系统权限', '2020-11-11 16:58:00', 'tom');
INSERT INTO `web_log` VALUES (268, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:58:04', 'tom');
INSERT INTO `web_log` VALUES (269, '/system/index', NULL, NULL, '系统权限', '2020-11-11 16:58:26', 'tom');
INSERT INTO `web_log` VALUES (270, '/auth/index', NULL, NULL, '用户权限', '2020-11-11 16:58:30', 'tom');
INSERT INTO `web_log` VALUES (271, '/system/index', NULL, NULL, '系统权限', '2020-11-11 16:58:31', 'tom');
INSERT INTO `web_log` VALUES (272, '/dashboard', NULL, NULL, '首页', '2020-11-11 16:58:32', 'tom');
INSERT INTO `web_log` VALUES (273, '/system/index', NULL, NULL, '系统权限', '2020-11-11 16:58:33', 'tom');
INSERT INTO `web_log` VALUES (274, '/auth/index', NULL, NULL, '用户权限', '2020-11-11 16:58:34', 'tom');
INSERT INTO `web_log` VALUES (275, '/system/index', NULL, NULL, '系统权限', '2020-11-11 16:58:36', 'tom');
INSERT INTO `web_log` VALUES (276, '/table/index', NULL, NULL, '编辑', '2020-11-11 16:58:37', 'tom');
INSERT INTO `web_log` VALUES (277, '/example/table', NULL, NULL, '表格demo', '2020-11-11 16:58:39', 'tom');
INSERT INTO `web_log` VALUES (278, '/example/tree', NULL, NULL, '树形demo', '2020-11-11 16:58:41', 'tom');
INSERT INTO `web_log` VALUES (279, '/example/table', NULL, NULL, '表格demo', '2020-11-11 16:58:42', 'tom');
INSERT INTO `web_log` VALUES (280, '/example/tree', NULL, NULL, '树形demo', '2020-11-11 16:58:43', 'tom');
INSERT INTO `web_log` VALUES (281, '/example/table', NULL, NULL, '表格demo', '2020-11-11 16:58:47', 'tom');
INSERT INTO `web_log` VALUES (282, '/example/table', NULL, NULL, '表格demo', '2020-11-11 17:02:24', 'tom');
INSERT INTO `web_log` VALUES (283, '/example/table', NULL, NULL, '表格demo', '2020-11-11 17:08:57', 'tom');
INSERT INTO `web_log` VALUES (284, '/example/table', NULL, NULL, '表格demo', '2020-11-11 17:28:53', 'tom');
INSERT INTO `web_log` VALUES (285, '/example/table', NULL, NULL, '表格demo', '2020-11-11 17:43:33', 'tom');
INSERT INTO `web_log` VALUES (286, '/example/table', NULL, NULL, '表格demo', '2020-11-11 17:43:50', 'tom');
INSERT INTO `web_log` VALUES (287, '/example/table', NULL, NULL, '表格demo', '2020-11-11 17:44:02', 'tom');
INSERT INTO `web_log` VALUES (288, '/example/table', NULL, NULL, '表格demo', '2020-11-11 17:44:13', 'tom');
INSERT INTO `web_log` VALUES (289, '/example/table', NULL, NULL, '表格demo', '2020-11-11 17:49:31', 'tom');
INSERT INTO `web_log` VALUES (290, '/example/table', NULL, NULL, '表格demo', '2020-11-11 17:49:43', 'tom');
INSERT INTO `web_log` VALUES (291, '/mock/user', NULL, NULL, 'user', '2020-11-11 17:49:46', 'tom');
INSERT INTO `web_log` VALUES (292, '/mock/home', NULL, NULL, 'home', '2020-11-11 17:49:48', 'tom');
INSERT INTO `web_log` VALUES (293, '/mock/home', NULL, NULL, 'home', '2020-11-11 17:50:13', 'tom');
INSERT INTO `web_log` VALUES (294, '/mock/home', NULL, NULL, 'home', '2020-11-11 17:50:16', 'tom');
INSERT INTO `web_log` VALUES (295, '/mock/home', NULL, NULL, 'home', '2020-11-11 17:52:42', 'tom');
INSERT INTO `web_log` VALUES (296, '/mock/home', NULL, NULL, 'home', '2020-11-11 17:53:42', 'tom');
INSERT INTO `web_log` VALUES (297, '/mock/home', NULL, NULL, 'home', '2020-11-11 17:54:38', 'tom');
INSERT INTO `web_log` VALUES (298, '/mock/home', NULL, NULL, 'home', '2020-11-11 17:54:58', 'tom');
INSERT INTO `web_log` VALUES (299, '/mock/home', NULL, NULL, 'home', '2020-11-11 17:55:07', 'tom');
INSERT INTO `web_log` VALUES (300, '/mock/home', NULL, NULL, 'home', '2020-11-11 17:55:44', 'tom');
INSERT INTO `web_log` VALUES (301, '/mock/home', NULL, NULL, 'home', '2020-11-11 17:56:13', 'tom');
INSERT INTO `web_log` VALUES (302, '/mock/home', NULL, NULL, 'home', '2020-11-11 17:56:39', 'tom');
INSERT INTO `web_log` VALUES (303, '/mock/home', NULL, NULL, 'home', '2020-11-11 17:56:55', 'tom');
INSERT INTO `web_log` VALUES (304, '/mock/home', NULL, NULL, 'home', '2020-11-11 17:57:15', 'tom');
INSERT INTO `web_log` VALUES (305, '/mock/home', NULL, NULL, 'home', '2020-11-11 17:57:24', 'tom');
INSERT INTO `web_log` VALUES (306, '/mock/home', NULL, NULL, 'home', '2020-11-11 18:08:03', 'tom');
INSERT INTO `web_log` VALUES (307, '/mock/home', NULL, NULL, 'home', '2020-11-11 18:27:42', 'tom');
INSERT INTO `web_log` VALUES (308, '/mock/home', NULL, NULL, 'home', '2020-11-11 18:31:42', 'tom');
INSERT INTO `web_log` VALUES (309, '/dashboard', NULL, NULL, '首页', '2020-11-12 09:47:29', 'tom');
INSERT INTO `web_log` VALUES (310, '/mock/user', NULL, NULL, 'user', '2020-11-12 09:47:35', 'tom');
INSERT INTO `web_log` VALUES (311, '/mock/home', NULL, NULL, 'home', '2020-11-12 09:47:36', 'tom');
INSERT INTO `web_log` VALUES (312, '/mock/home', NULL, NULL, 'home', '2020-11-12 09:48:28', 'tom');
INSERT INTO `web_log` VALUES (313, '/mock/home', NULL, NULL, 'home', '2020-11-12 09:48:33', 'tom');
INSERT INTO `web_log` VALUES (314, '/mock/home', NULL, NULL, 'home', '2020-11-12 09:49:18', 'tom');
INSERT INTO `web_log` VALUES (315, '/mock/home', NULL, NULL, 'home', '2020-11-12 09:51:16', 'tom');
INSERT INTO `web_log` VALUES (316, '/mock/home', NULL, NULL, 'home', '2020-11-12 09:51:36', 'tom');
INSERT INTO `web_log` VALUES (317, '/mock/home', NULL, NULL, 'home', '2020-11-12 10:00:11', 'tom');
INSERT INTO `web_log` VALUES (318, '/mock/home', NULL, NULL, 'home', '2020-11-12 10:00:50', 'tom');
INSERT INTO `web_log` VALUES (319, '/mock/home', NULL, NULL, 'home', '2020-11-12 10:00:53', 'tom');
INSERT INTO `web_log` VALUES (320, '/mock/home', NULL, NULL, 'home', '2020-11-12 10:02:31', 'tom');
INSERT INTO `web_log` VALUES (321, '/mock/home', NULL, NULL, 'home', '2020-11-12 10:03:21', 'tom');
INSERT INTO `web_log` VALUES (322, '/mock/user', NULL, NULL, 'user', '2020-11-12 11:44:48', 'tom');
INSERT INTO `web_log` VALUES (323, '/example/table', NULL, NULL, '表格demo', '2020-11-12 11:44:49', 'tom');
INSERT INTO `web_log` VALUES (324, '/example/table', NULL, NULL, '表格demo', '2020-11-12 11:44:59', 'tom');
INSERT INTO `web_log` VALUES (325, '/example/tree', NULL, NULL, '树形demo', '2020-11-12 11:45:13', 'tom');
INSERT INTO `web_log` VALUES (326, '/table/index', NULL, NULL, '编辑', '2020-11-12 11:45:15', 'tom');
INSERT INTO `web_log` VALUES (327, '/dashboard', NULL, NULL, '首页', '2020-11-12 11:47:32', 'tom');
INSERT INTO `web_log` VALUES (328, '/table/index', NULL, NULL, '编辑', '2020-11-12 11:47:35', 'tom');
INSERT INTO `web_log` VALUES (329, '/example/table', NULL, NULL, '表格demo', '2020-11-12 11:47:37', 'tom');
INSERT INTO `web_log` VALUES (330, '/example/table', NULL, NULL, '表格demo', '2020-11-12 11:50:14', 'tom');
INSERT INTO `web_log` VALUES (331, '/example/table', NULL, NULL, '表格demo', '2020-11-12 11:58:06', 'tom');
INSERT INTO `web_log` VALUES (332, '/example/table', NULL, NULL, '表格demo', '2020-11-12 11:59:34', 'tom');
INSERT INTO `web_log` VALUES (333, '/example/table', NULL, NULL, '表格demo', '2020-11-12 12:04:05', 'tom');
INSERT INTO `web_log` VALUES (334, '/example/table', NULL, NULL, '表格demo', '2020-11-12 13:20:37', 'tom');
INSERT INTO `web_log` VALUES (335, '/example/table', NULL, NULL, '表格demo', '2020-11-12 13:23:16', 'tom');
INSERT INTO `web_log` VALUES (336, '/example/table', NULL, NULL, '表格demo', '2020-11-12 13:25:47', 'tom');
INSERT INTO `web_log` VALUES (337, '/example/table', NULL, NULL, '表格demo', '2020-11-12 13:26:54', 'tom');
INSERT INTO `web_log` VALUES (338, '/example/table', NULL, NULL, '表格demo', '2020-11-12 13:31:44', 'tom');
INSERT INTO `web_log` VALUES (339, '/example/tree', NULL, NULL, '树形demo', '2020-11-12 13:33:23', 'tom');
INSERT INTO `web_log` VALUES (340, '/example/table', NULL, NULL, '表格demo', '2020-11-12 13:33:25', 'tom');
INSERT INTO `web_log` VALUES (341, '/table/index', NULL, NULL, '编辑', '2020-11-12 13:33:30', 'tom');
INSERT INTO `web_log` VALUES (342, '/system/index', NULL, NULL, '系统权限', '2020-11-12 13:33:35', 'tom');
INSERT INTO `web_log` VALUES (343, '/auth/index', NULL, NULL, '用户权限', '2020-11-12 13:33:44', 'tom');
INSERT INTO `web_log` VALUES (344, '/mock/user', NULL, NULL, 'user', '2020-11-12 13:33:50', 'tom');
INSERT INTO `web_log` VALUES (345, '/mock/home', NULL, NULL, 'home', '2020-11-12 13:33:51', 'tom');
INSERT INTO `web_log` VALUES (346, '/dashboard', NULL, NULL, '首页', '2020-11-12 13:35:34', 'tom');
INSERT INTO `web_log` VALUES (347, '/table/index', NULL, NULL, '编辑', '2020-11-12 13:35:37', 'tom');
INSERT INTO `web_log` VALUES (348, '/example/table', NULL, NULL, '表格demo', '2020-11-12 13:35:52', 'tom');
INSERT INTO `web_log` VALUES (349, '/example/table', NULL, NULL, '表格demo', '2020-11-12 13:36:37', 'tom');
INSERT INTO `web_log` VALUES (350, '/example/table', NULL, NULL, '表格demo', '2020-11-12 13:37:20', 'tom');
INSERT INTO `web_log` VALUES (351, '/example/tree', NULL, NULL, '树形demo', '2020-11-12 13:37:50', 'tom');
INSERT INTO `web_log` VALUES (352, '/example/table', NULL, NULL, '表格demo', '2020-11-12 13:37:52', 'tom');
INSERT INTO `web_log` VALUES (353, '/example/tree', NULL, NULL, '树形demo', '2020-11-12 13:37:53', 'tom');
INSERT INTO `web_log` VALUES (354, '/dashboard', NULL, NULL, '首页', '2020-11-12 13:38:35', 'tom');
INSERT INTO `web_log` VALUES (355, '/dashboard', NULL, NULL, '首页', '2020-11-12 13:43:37', 'tom');
INSERT INTO `web_log` VALUES (356, '/dashboard', NULL, NULL, '首页', '2020-11-12 14:05:57', 'tom');
INSERT INTO `web_log` VALUES (357, '/dashboard', NULL, NULL, '首页', '2020-11-12 15:01:43', 'tom');
INSERT INTO `web_log` VALUES (358, '/table/index', NULL, NULL, '编辑', '2020-11-12 15:01:48', 'tom');
INSERT INTO `web_log` VALUES (359, '/dashboard', NULL, NULL, '首页', '2020-11-12 15:01:53', 'tom');
INSERT INTO `web_log` VALUES (360, '/dashboard', NULL, NULL, '首页', '2020-11-12 15:04:20', 'tom');
INSERT INTO `web_log` VALUES (361, '/table', NULL, NULL, '每日答案', '2020-11-12 15:04:24', 'tom');
INSERT INTO `web_log` VALUES (362, '/dashboard', NULL, NULL, '首页', '2020-11-12 15:04:35', 'tom');
INSERT INTO `web_log` VALUES (363, '/system/index', NULL, NULL, '系统权限', '2020-11-12 15:04:39', 'tom');
INSERT INTO `web_log` VALUES (364, '/system/index', NULL, NULL, '系统权限', '2020-11-12 15:05:24', 'tom');
INSERT INTO `web_log` VALUES (365, '/table/index', NULL, NULL, '蚂蚁森林', '2020-11-12 15:05:26', 'tom');
INSERT INTO `web_log` VALUES (366, '/table/index', NULL, NULL, '蚂蚁森林', '2020-11-12 15:07:04', 'tom');
INSERT INTO `web_log` VALUES (367, '/example/table', NULL, NULL, '表格demo', '2020-11-12 15:07:26', 'tom');
INSERT INTO `web_log` VALUES (368, '/example/tree', NULL, NULL, '树形demo', '2020-11-12 15:07:28', 'tom');
INSERT INTO `web_log` VALUES (369, '/table/index', NULL, NULL, '蚂蚁森林', '2020-11-12 15:07:28', 'tom');
INSERT INTO `web_log` VALUES (370, '/table/index', NULL, NULL, 'Mayi', '2020-11-12 15:10:28', 'tom');
INSERT INTO `web_log` VALUES (371, '/table/index', NULL, NULL, 'Mayi', '2020-11-12 15:11:27', 'tom');
INSERT INTO `web_log` VALUES (372, '/example/table', NULL, NULL, '表格demo', '2020-11-12 15:11:48', 'tom');
INSERT INTO `web_log` VALUES (373, '/example/table', NULL, NULL, '表格demo', '2020-11-12 15:16:20', 'tom');
INSERT INTO `web_log` VALUES (374, '/table/index', NULL, NULL, 'Mayi', '2020-11-12 15:16:27', 'tom');
INSERT INTO `web_log` VALUES (375, '/dashboard', NULL, NULL, '首页', '2020-11-12 15:16:29', 'tom');
INSERT INTO `web_log` VALUES (376, '/table/index', NULL, NULL, 'Mayi', '2020-11-12 15:16:35', 'tom');
INSERT INTO `web_log` VALUES (377, '/mayi/index', NULL, NULL, 'Mayi', '2020-11-12 15:17:51', 'tom');
INSERT INTO `web_log` VALUES (378, '/mayi/index', NULL, NULL, 'Mayi', '2020-11-12 15:17:59', 'tom');
INSERT INTO `web_log` VALUES (379, '/dashboard', NULL, NULL, '首页', '2020-11-12 15:18:03', 'tom');
INSERT INTO `web_log` VALUES (380, '/mayi/index', NULL, NULL, 'Mayi', '2020-11-12 15:18:07', 'tom');
INSERT INTO `web_log` VALUES (381, '/example/table', NULL, NULL, '表格demo', '2020-11-12 15:18:13', 'tom');
INSERT INTO `web_log` VALUES (382, '/example/table', NULL, NULL, '豆瓣电影Top100', '2020-11-12 15:19:45', 'tom');
INSERT INTO `web_log` VALUES (383, '/example/tree', NULL, NULL, '知乎热搜Top100', '2020-11-12 15:19:55', 'tom');
INSERT INTO `web_log` VALUES (384, '/example/table', NULL, NULL, '豆瓣电影Top100', '2020-11-12 15:19:56', 'tom');
INSERT INTO `web_log` VALUES (385, '/example/tree', NULL, NULL, '知乎热搜Top100', '2020-11-12 15:19:57', 'tom');
INSERT INTO `web_log` VALUES (386, '/example/table', NULL, NULL, '豆瓣电影Top100', '2020-11-12 15:20:00', 'tom');
INSERT INTO `web_log` VALUES (387, '/example/tree', NULL, NULL, '知乎热搜Top100', '2020-11-12 15:25:02', 'tom');
INSERT INTO `web_log` VALUES (388, '/example/tree', NULL, NULL, '知乎热搜Top100', '2020-11-12 15:27:00', 'tom');
INSERT INTO `web_log` VALUES (389, '/example/tree', NULL, NULL, '知乎热搜Top100', '2020-11-12 15:27:09', 'tom');
INSERT INTO `web_log` VALUES (390, '/mayi/index', NULL, NULL, 'Mayi', '2020-11-12 15:33:50', 'tom');
INSERT INTO `web_log` VALUES (391, '/example/table', NULL, NULL, '豆瓣电影Top100', '2020-11-12 15:33:56', 'tom');
INSERT INTO `web_log` VALUES (392, '/example/tree', NULL, NULL, '知乎热搜Top100', '2020-11-12 15:33:57', 'tom');
INSERT INTO `web_log` VALUES (393, '/example/tree', NULL, NULL, '知乎热搜Top100', '2020-11-12 15:36:23', 'tom');
INSERT INTO `web_log` VALUES (394, '/example/tree', NULL, NULL, '知乎热搜Top100', '2020-11-12 15:38:17', 'tom');
INSERT INTO `web_log` VALUES (395, '/example/tree', NULL, NULL, '知乎热搜Top100', '2020-11-12 15:41:49', 'tom');
INSERT INTO `web_log` VALUES (396, '/example/tree', NULL, NULL, '知乎热搜Top100', '2020-11-12 15:44:33', 'tom');
INSERT INTO `web_log` VALUES (397, '/mayi/index', NULL, NULL, 'Mayi', '2020-11-12 15:45:02', 'tom');
INSERT INTO `web_log` VALUES (398, '/example/tree', NULL, NULL, '知乎热搜Top100', '2020-11-12 15:45:25', 'tom');
INSERT INTO `web_log` VALUES (399, '/example/tree', NULL, NULL, '知乎热搜Top100', '2020-11-12 15:47:32', 'tom');
INSERT INTO `web_log` VALUES (400, '/example/table', NULL, NULL, '树状', '2020-11-12 15:47:41', 'tom');
INSERT INTO `web_log` VALUES (401, '/example/tree', NULL, NULL, '知乎热搜Top100', '2020-11-12 15:47:42', 'tom');
INSERT INTO `web_log` VALUES (402, '/dashboard', NULL, NULL, '首页', '2020-11-12 15:47:48', 'tom');
INSERT INTO `web_log` VALUES (403, '/example/table', NULL, NULL, '树状', '2020-11-12 16:00:32', 'tom');
INSERT INTO `web_log` VALUES (404, '/example/tree', NULL, NULL, '知乎热搜Top100', '2020-11-12 16:00:33', 'tom');
INSERT INTO `web_log` VALUES (405, '/example/table', NULL, NULL, '树状', '2020-11-12 16:00:34', 'tom');
INSERT INTO `web_log` VALUES (406, '/example/tree', NULL, NULL, '知乎热搜Top100', '2020-11-12 16:00:39', 'tom');
INSERT INTO `web_log` VALUES (407, '/system/index', NULL, NULL, '系统权限', '2020-11-12 16:00:49', 'tom');
INSERT INTO `web_log` VALUES (408, '/auth/index', NULL, NULL, '用户权限', '2020-11-12 16:00:52', 'tom');
INSERT INTO `web_log` VALUES (409, '/auth/index', NULL, NULL, '用户权限', '2020-11-12 16:02:48', 'tom');
INSERT INTO `web_log` VALUES (410, '/dashboard', NULL, NULL, '首页', '2020-11-12 16:03:41', 'tom');
INSERT INTO `web_log` VALUES (411, '/dashboard', NULL, NULL, '首页', '2020-11-12 16:04:18', 'tom');
INSERT INTO `web_log` VALUES (412, '/system/index', NULL, NULL, '系统权限', '2020-11-12 16:04:24', 'tom');
INSERT INTO `web_log` VALUES (413, '/system/index', NULL, NULL, '系统权限', '2020-11-12 16:04:33', 'tom');
INSERT INTO `web_log` VALUES (414, '/system/index', NULL, NULL, '系统权限', '2020-11-12 16:04:55', 'tom');
INSERT INTO `web_log` VALUES (415, '/system/index', NULL, NULL, '系统权限', '2020-11-12 16:05:35', 'tom');
INSERT INTO `web_log` VALUES (416, '/system/index', NULL, NULL, '系统权限', '2020-11-12 16:06:27', 'tom');
INSERT INTO `web_log` VALUES (417, '/auth/index', NULL, NULL, '用户权限', '2020-11-12 16:06:30', 'tom');
INSERT INTO `web_log` VALUES (418, '/auth/path', NULL, NULL, '路径管理', '2020-11-12 16:06:30', 'tom');
INSERT INTO `web_log` VALUES (419, '/auth/path', NULL, NULL, '路径管理', '2020-11-12 16:08:26', 'tom');
INSERT INTO `web_log` VALUES (420, '/dashboard', NULL, NULL, '首页', '2020-11-12 16:08:38', 'tom');
INSERT INTO `web_log` VALUES (421, '/file/upload', NULL, NULL, '文件上传', '2020-11-12 16:08:49', 'tom');
INSERT INTO `web_log` VALUES (422, '/dashboard', NULL, NULL, '首页', '2020-11-12 16:09:50', 'tom');
INSERT INTO `web_log` VALUES (423, '/file/upload', NULL, NULL, '文件上传', '2020-11-12 16:09:53', 'tom');
INSERT INTO `web_log` VALUES (424, '/file/upload', NULL, NULL, '文件上传', '2020-11-12 16:09:56', 'tom');
INSERT INTO `web_log` VALUES (425, '/mayi/index', NULL, NULL, 'Mayi', '2020-11-12 16:10:01', 'tom');
INSERT INTO `web_log` VALUES (426, '/dashboard', NULL, NULL, '首页', '2020-11-12 16:10:06', 'tom');
INSERT INTO `web_log` VALUES (427, '/dashboard', NULL, NULL, '首页', '2020-11-12 16:12:51', 'tom');
INSERT INTO `web_log` VALUES (428, '/file/upload', NULL, NULL, '文件上传', '2020-11-12 16:13:35', 'tom');
INSERT INTO `web_log` VALUES (429, '/file/upload', NULL, NULL, '文件上传', '2020-11-12 16:13:38', 'tom');
INSERT INTO `web_log` VALUES (430, '/dashboard', NULL, NULL, '首页', '2020-11-12 16:15:00', 'tom');
INSERT INTO `web_log` VALUES (431, '/file/upload', NULL, NULL, '文件上传', '2020-11-12 16:15:02', 'tom');
INSERT INTO `web_log` VALUES (432, '/file/upload', NULL, NULL, '文件上传', '2020-11-12 16:16:02', 'tom');
INSERT INTO `web_log` VALUES (433, '/file/upload', NULL, NULL, '文件上传', '2020-11-12 16:17:40', 'tom');
INSERT INTO `web_log` VALUES (434, '/dashboard', NULL, NULL, '首页', '2020-11-13 10:26:49', 'tom');
INSERT INTO `web_log` VALUES (435, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 10:26:56', 'tom');
INSERT INTO `web_log` VALUES (436, '/file/download', NULL, NULL, '文件下载', '2020-11-13 10:26:57', 'tom');
INSERT INTO `web_log` VALUES (437, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 10:26:58', 'tom');
INSERT INTO `web_log` VALUES (438, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 10:35:41', 'tom');
INSERT INTO `web_log` VALUES (439, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 11:24:40', 'tom');
INSERT INTO `web_log` VALUES (440, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 11:34:19', 'tom');
INSERT INTO `web_log` VALUES (441, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 11:57:48', 'tom');
INSERT INTO `web_log` VALUES (442, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 12:02:03', 'tom');
INSERT INTO `web_log` VALUES (443, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 13:31:22', 'tom');
INSERT INTO `web_log` VALUES (444, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 13:41:31', 'tom');
INSERT INTO `web_log` VALUES (445, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 13:51:29', 'tom');
INSERT INTO `web_log` VALUES (446, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 13:52:21', 'tom');
INSERT INTO `web_log` VALUES (447, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 13:56:10', 'tom');
INSERT INTO `web_log` VALUES (448, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 14:01:06', 'tom');
INSERT INTO `web_log` VALUES (449, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 14:02:17', 'tom');
INSERT INTO `web_log` VALUES (450, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 14:19:28', 'tom');
INSERT INTO `web_log` VALUES (451, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 14:33:38', 'tom');
INSERT INTO `web_log` VALUES (452, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 14:36:32', 'tom');
INSERT INTO `web_log` VALUES (453, '/dashboard', NULL, NULL, '首页', '2020-11-13 17:39:42', 'tom');
INSERT INTO `web_log` VALUES (454, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 17:39:46', 'tom');
INSERT INTO `web_log` VALUES (455, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 18:15:02', 'tom');
INSERT INTO `web_log` VALUES (456, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 18:15:32', 'tom');
INSERT INTO `web_log` VALUES (457, '/file/upload', NULL, NULL, '文件上传', '2020-11-13 18:15:49', 'tom');
INSERT INTO `web_log` VALUES (458, '/dashboard', NULL, NULL, '首页', '2020-11-16 09:42:11', 'tom');
INSERT INTO `web_log` VALUES (459, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 09:42:21', 'tom');
INSERT INTO `web_log` VALUES (460, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 10:02:51', 'tom');
INSERT INTO `web_log` VALUES (461, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 10:04:05', 'tom');
INSERT INTO `web_log` VALUES (462, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 10:04:50', 'tom');
INSERT INTO `web_log` VALUES (463, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 10:06:01', 'tom');
INSERT INTO `web_log` VALUES (464, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 10:15:27', 'tom');
INSERT INTO `web_log` VALUES (465, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 10:18:59', 'tom');
INSERT INTO `web_log` VALUES (466, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 11:00:02', 'tom');
INSERT INTO `web_log` VALUES (467, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 11:22:26', 'tom');
INSERT INTO `web_log` VALUES (468, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 11:26:10', 'tom');
INSERT INTO `web_log` VALUES (469, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 11:28:33', 'tom');
INSERT INTO `web_log` VALUES (470, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 11:29:20', 'tom');
INSERT INTO `web_log` VALUES (471, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 11:38:59', 'tom');
INSERT INTO `web_log` VALUES (472, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 11:39:49', 'tom');
INSERT INTO `web_log` VALUES (473, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 11:49:35', 'tom');
INSERT INTO `web_log` VALUES (474, '/dashboard', NULL, NULL, '首页', '2020-11-16 11:49:42', 'tom');
INSERT INTO `web_log` VALUES (475, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 11:49:45', 'tom');
INSERT INTO `web_log` VALUES (476, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 11:50:43', 'tom');
INSERT INTO `web_log` VALUES (477, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 11:51:20', 'tom');
INSERT INTO `web_log` VALUES (478, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 11:52:37', 'tom');
INSERT INTO `web_log` VALUES (479, '/file/upload', NULL, NULL, '文件上传', '2020-11-16 11:54:21', 'tom');
INSERT INTO `web_log` VALUES (480, '/file/upload', NULL, NULL, '单文件上传', '2020-11-16 14:49:46', 'tom');
INSERT INTO `web_log` VALUES (481, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-16 14:50:55', 'tom');
INSERT INTO `web_log` VALUES (482, '/file/upload', NULL, NULL, '单文件上传', '2020-11-16 14:51:04', 'tom');
INSERT INTO `web_log` VALUES (483, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-16 14:51:22', 'tom');
INSERT INTO `web_log` VALUES (484, '/file/upload', NULL, NULL, '单文件上传', '2020-11-16 14:52:21', 'tom');
INSERT INTO `web_log` VALUES (485, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-16 14:52:25', 'tom');
INSERT INTO `web_log` VALUES (486, '/file/upload', NULL, NULL, '单文件上传', '2020-11-16 14:52:26', 'tom');
INSERT INTO `web_log` VALUES (487, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-16 14:52:48', 'tom');
INSERT INTO `web_log` VALUES (488, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-16 14:54:48', 'tom');
INSERT INTO `web_log` VALUES (489, '/file/upload', NULL, NULL, '单文件上传', '2020-11-16 14:54:49', 'tom');
INSERT INTO `web_log` VALUES (490, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-16 14:54:50', 'tom');
INSERT INTO `web_log` VALUES (491, '/file/upload', NULL, NULL, '单文件上传', '2020-11-16 14:54:55', 'tom');
INSERT INTO `web_log` VALUES (492, '/file/upload', NULL, NULL, '单文件上传', '2020-11-16 14:57:55', 'tom');
INSERT INTO `web_log` VALUES (493, '/file/upload', NULL, NULL, '单文件上传', '2020-11-16 14:59:16', 'tom');
INSERT INTO `web_log` VALUES (494, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-16 15:02:41', 'tom');
INSERT INTO `web_log` VALUES (495, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-16 15:02:58', 'tom');
INSERT INTO `web_log` VALUES (496, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-16 15:03:24', 'tom');
INSERT INTO `web_log` VALUES (497, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-16 15:22:57', 'tom');
INSERT INTO `web_log` VALUES (498, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-16 15:46:07', 'tom');
INSERT INTO `web_log` VALUES (499, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-16 15:50:09', 'tom');
INSERT INTO `web_log` VALUES (500, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-16 15:51:49', 'tom');
INSERT INTO `web_log` VALUES (501, '/dashboard', NULL, NULL, '首页', '2020-11-16 16:01:13', 'tom');
INSERT INTO `web_log` VALUES (502, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-16 16:01:17', 'tom');
INSERT INTO `web_log` VALUES (503, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-16 18:00:22', 'tom');
INSERT INTO `web_log` VALUES (504, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-16 18:04:42', 'tom');
INSERT INTO `web_log` VALUES (505, '/dashboard', NULL, NULL, '首页', '2020-11-17 09:58:08', 'tom');
INSERT INTO `web_log` VALUES (506, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-17 09:58:12', 'tom');
INSERT INTO `web_log` VALUES (507, '/file/multiUpload', NULL, NULL, '多文件上传', '2020-11-17 14:00:06', 'tom');
INSERT INTO `web_log` VALUES (508, '/dashboard', NULL, NULL, '首页', '2020-12-01 14:17:31', 'tom');
INSERT INTO `web_log` VALUES (509, '/dashboard', NULL, NULL, '首页', '2020-12-01 14:26:42', 'tom');
INSERT INTO `web_log` VALUES (510, '/system/index', NULL, NULL, '系统权限', '2020-12-01 14:42:40', 'tom');
INSERT INTO `web_log` VALUES (511, '/dashboard', NULL, NULL, '首页', '2020-12-01 14:42:54', 'tom');
INSERT INTO `web_log` VALUES (512, '/system/index', NULL, NULL, '系统权限', '2020-12-01 14:42:56', 'tom');
INSERT INTO `web_log` VALUES (513, '/dashboard', NULL, NULL, '首页', '2020-12-01 14:43:01', 'tom');
INSERT INTO `web_log` VALUES (514, '/system/index', NULL, NULL, '系统权限', '2020-12-01 14:43:02', 'tom');
INSERT INTO `web_log` VALUES (515, '/dashboard', NULL, NULL, '首页', '2020-12-01 14:43:06', 'tom');
INSERT INTO `web_log` VALUES (516, '/dashboard', NULL, NULL, '首页', '2020-12-01 15:02:53', 'tom');
INSERT INTO `web_log` VALUES (517, '/dashboard', NULL, NULL, '首页', '2020-12-01 15:03:00', 'tom');
INSERT INTO `web_log` VALUES (518, '/system/index', NULL, NULL, '系统权限', '2020-12-01 15:03:07', 'tom');
INSERT INTO `web_log` VALUES (519, '/system/index', NULL, NULL, '系统权限', '2020-12-01 15:04:35', 'tom');
INSERT INTO `web_log` VALUES (520, '/system/index', NULL, NULL, '系统权限', '2020-12-01 15:04:42', 'tom');
INSERT INTO `web_log` VALUES (521, '/path/addPath', NULL, NULL, '添加页面', '2020-12-01 15:11:44', 'tom');
INSERT INTO `web_log` VALUES (522, '/path/addPath', NULL, NULL, '添加页面', '2020-12-01 15:12:32', 'tom');
INSERT INTO `web_log` VALUES (523, '/path/addPath', NULL, NULL, '添加页面', '2020-12-01 15:12:37', 'tom');
INSERT INTO `web_log` VALUES (524, '/path/addPath', NULL, NULL, '添加页面', '2020-12-01 15:13:40', 'tom');
INSERT INTO `web_log` VALUES (525, '/path/addPath', NULL, NULL, '添加页面', '2020-12-01 16:27:00', 'tom');
INSERT INTO `web_log` VALUES (526, '/path/addPath', NULL, NULL, '添加页面', '2020-12-01 16:44:18', 'tom');
INSERT INTO `web_log` VALUES (527, '/path/addPath', NULL, NULL, '添加页面', '2020-12-01 16:49:14', 'tom');
INSERT INTO `web_log` VALUES (528, '/path/addPath', NULL, NULL, '添加页面', '2020-12-01 16:49:23', 'tom');
INSERT INTO `web_log` VALUES (529, '/path/addPath', NULL, NULL, '添加页面', '2020-12-01 17:41:15', 'tom');
INSERT INTO `web_log` VALUES (530, '/path/addPath', NULL, NULL, '添加页面', '2020-12-01 17:41:45', 'tom');
INSERT INTO `web_log` VALUES (531, '/path/addPath', NULL, NULL, '添加页面', '2020-12-01 17:42:19', 'tom');
INSERT INTO `web_log` VALUES (532, '/path/addPath', NULL, NULL, '添加页面', '2020-12-01 17:43:25', 'tom');
INSERT INTO `web_log` VALUES (533, '/path/addPath', NULL, NULL, '添加页面', '2020-12-01 18:02:11', 'tom');
INSERT INTO `web_log` VALUES (534, '/path/addPath', NULL, NULL, '添加页面', '2020-12-01 18:07:07', 'tom');
INSERT INTO `web_log` VALUES (535, '/system/index', NULL, NULL, '系统权限', '2020-12-01 18:19:25', 'tom');
INSERT INTO `web_log` VALUES (536, '/system/index', NULL, NULL, '系统权限', '2020-12-01 18:20:50', 'tom');
INSERT INTO `web_log` VALUES (537, '/system/index', NULL, NULL, '系统权限', '2020-12-01 18:23:19', 'tom');
INSERT INTO `web_log` VALUES (538, '/system/index', NULL, NULL, '系统权限', '2020-12-01 18:29:07', 'tom');
INSERT INTO `web_log` VALUES (539, '/path/addPath', NULL, NULL, '添加页面', '2020-12-01 18:29:10', 'tom');
INSERT INTO `web_log` VALUES (540, '/dashboard', NULL, NULL, '首页', '2020-12-02 16:48:07', 'tom');
INSERT INTO `web_log` VALUES (541, '/system/index', NULL, NULL, '系统权限', '2020-12-02 16:48:10', 'tom');
INSERT INTO `web_log` VALUES (542, '/path/addPath', NULL, NULL, '添加页面', '2020-12-02 16:48:14', 'tom');
INSERT INTO `web_log` VALUES (543, '/path/addPath', NULL, NULL, '添加页面', '2020-12-02 16:48:20', 'tom');
INSERT INTO `web_log` VALUES (544, '/path/addPath', NULL, NULL, '添加页面', '2020-12-02 16:49:32', 'tom');
INSERT INTO `web_log` VALUES (545, '/path/addPath', NULL, NULL, '添加页面', '2020-12-02 16:50:32', 'tom');
INSERT INTO `web_log` VALUES (546, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-02 16:50:34', 'tom');
INSERT INTO `web_log` VALUES (547, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-02 16:51:06', 'tom');
INSERT INTO `web_log` VALUES (548, '/path/addPath', NULL, NULL, '添加页面', '2020-12-02 16:51:11', 'tom');
INSERT INTO `web_log` VALUES (549, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-02 16:51:15', 'tom');
INSERT INTO `web_log` VALUES (550, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-02 16:52:08', 'tom');
INSERT INTO `web_log` VALUES (551, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-02 17:05:41', 'tom');
INSERT INTO `web_log` VALUES (552, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-02 17:07:12', 'tom');
INSERT INTO `web_log` VALUES (553, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-02 17:25:38', 'tom');
INSERT INTO `web_log` VALUES (554, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-02 17:42:55', 'tom');
INSERT INTO `web_log` VALUES (555, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-02 18:01:22', 'tom');
INSERT INTO `web_log` VALUES (556, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-02 18:02:11', 'tom');
INSERT INTO `web_log` VALUES (557, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-02 18:02:32', 'tom');
INSERT INTO `web_log` VALUES (558, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-02 18:05:53', 'tom');
INSERT INTO `web_log` VALUES (559, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-02 18:06:34', 'tom');
INSERT INTO `web_log` VALUES (560, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-02 18:09:53', 'tom');
INSERT INTO `web_log` VALUES (561, '/dashboard', NULL, NULL, '首页', '2020-12-04 15:00:24', 'tom');
INSERT INTO `web_log` VALUES (562, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-04 15:00:27', 'tom');
INSERT INTO `web_log` VALUES (563, '/path/addPath', NULL, NULL, '添加页面', '2020-12-04 15:00:36', 'tom');
INSERT INTO `web_log` VALUES (564, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-04 15:00:38', 'tom');
INSERT INTO `web_log` VALUES (565, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-04 15:02:37', 'tom');
INSERT INTO `web_log` VALUES (566, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-04 17:07:25', 'tom');
INSERT INTO `web_log` VALUES (567, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-04 17:10:32', 'tom');
INSERT INTO `web_log` VALUES (568, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-04 17:11:14', 'tom');
INSERT INTO `web_log` VALUES (569, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-04 17:14:30', 'tom');
INSERT INTO `web_log` VALUES (570, '/dashboard', NULL, NULL, '首页', '2020-12-08 14:00:52', 'tom');
INSERT INTO `web_log` VALUES (571, '/dashboard', NULL, NULL, '首页', '2020-12-08 14:00:52', 'tom');
INSERT INTO `web_log` VALUES (572, '/dashboard', NULL, NULL, '首页', '2020-12-08 14:00:52', 'tom');
INSERT INTO `web_log` VALUES (573, '/system/index', NULL, NULL, '系统权限', '2020-12-08 14:00:57', 'tom');
INSERT INTO `web_log` VALUES (574, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 14:01:01', 'tom');
INSERT INTO `web_log` VALUES (575, '/dashboard', NULL, NULL, '首页', '2020-12-08 14:42:08', 'tom');
INSERT INTO `web_log` VALUES (576, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 14:42:14', 'tom');
INSERT INTO `web_log` VALUES (577, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 15:10:45', 'tom');
INSERT INTO `web_log` VALUES (578, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 15:14:29', 'tom');
INSERT INTO `web_log` VALUES (579, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 15:17:41', 'tom');
INSERT INTO `web_log` VALUES (580, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 15:19:30', 'tom');
INSERT INTO `web_log` VALUES (581, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 15:20:23', 'tom');
INSERT INTO `web_log` VALUES (582, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 15:21:19', 'tom');
INSERT INTO `web_log` VALUES (583, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 15:30:13', 'tom');
INSERT INTO `web_log` VALUES (584, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 15:31:30', 'tom');
INSERT INTO `web_log` VALUES (585, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 15:32:06', 'tom');
INSERT INTO `web_log` VALUES (586, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 15:39:11', 'tom');
INSERT INTO `web_log` VALUES (587, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 15:48:39', 'tom');
INSERT INTO `web_log` VALUES (588, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 15:50:19', 'tom');
INSERT INTO `web_log` VALUES (589, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 15:50:29', 'tom');
INSERT INTO `web_log` VALUES (590, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 15:53:26', 'tom');
INSERT INTO `web_log` VALUES (591, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 15:55:06', 'tom');
INSERT INTO `web_log` VALUES (592, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 16:16:52', 'tom');
INSERT INTO `web_log` VALUES (593, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 16:27:22', 'tom');
INSERT INTO `web_log` VALUES (594, '/path/s9Iei', NULL, NULL, '自己定义-根据传过来的值', '2020-12-08 16:27:27', 'tom');
INSERT INTO `web_log` VALUES (595, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 16:27:29', 'tom');
INSERT INTO `web_log` VALUES (596, '/path/s9Iei', NULL, NULL, '自己定义-根据传过来的值', '2020-12-08 16:27:30', 'tom');
INSERT INTO `web_log` VALUES (597, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 16:31:13', 'tom');
INSERT INTO `web_log` VALUES (598, '/path/s9Iei', NULL, NULL, '自己定义-根据传过来的值', '2020-12-08 16:31:15', 'tom');
INSERT INTO `web_log` VALUES (599, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-08 16:32:16', 'tom');
INSERT INTO `web_log` VALUES (600, '/path/s9Iei', NULL, NULL, '自己定义-根据传过来的值', '2020-12-08 16:32:18', 'tom');
INSERT INTO `web_log` VALUES (601, '/dashboard', NULL, NULL, '首页', '2020-12-08 16:35:04', 'tom');
INSERT INTO `web_log` VALUES (602, '/system/index', NULL, NULL, '系统权限', '2020-12-08 16:35:19', 'tom');
INSERT INTO `web_log` VALUES (603, '/system/index', NULL, NULL, '添加路由', '2020-12-08 16:36:10', 'tom');
INSERT INTO `web_log` VALUES (604, '/auth/path', NULL, NULL, '路径管理', '2020-12-08 16:36:16', 'tom');
INSERT INTO `web_log` VALUES (605, '/system/index', NULL, NULL, '添加路由', '2020-12-08 16:36:18', 'tom');
INSERT INTO `web_log` VALUES (606, '/auth/path', NULL, NULL, '路径管理', '2020-12-08 16:36:19', 'tom');
INSERT INTO `web_log` VALUES (607, '/system/index', NULL, NULL, '添加路由', '2020-12-08 16:36:57', 'tom');
INSERT INTO `web_log` VALUES (608, '/dashboard', NULL, NULL, '首页', '2020-12-08 16:36:58', 'tom');
INSERT INTO `web_log` VALUES (609, '/dashboard', NULL, NULL, '首页', '2020-12-08 16:37:47', 'tom');
INSERT INTO `web_log` VALUES (610, '/auth/path', NULL, NULL, '添加路由', '2020-12-08 16:37:48', 'tom');
INSERT INTO `web_log` VALUES (611, '/auth/index', NULL, NULL, '用户权限', '2020-12-08 16:43:16', 'tom');
INSERT INTO `web_log` VALUES (612, '/path/s9Iei', NULL, NULL, '自己定义-根据传过来的值', '2020-12-08 16:50:11', 'tom');
INSERT INTO `web_log` VALUES (613, '/auth/index', NULL, NULL, '用户权限', '2020-12-08 16:50:12', 'tom');
INSERT INTO `web_log` VALUES (614, '/auth/index', NULL, NULL, '用户权限', '2020-12-08 16:50:42', 'tom');
INSERT INTO `web_log` VALUES (615, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-08 16:50:45', 'tom');
INSERT INTO `web_log` VALUES (616, '/auth/path', NULL, NULL, '添加路由', '2020-12-08 16:51:18', 'tom');
INSERT INTO `web_log` VALUES (617, '/auth/path', NULL, NULL, '添加路由', '2020-12-08 16:52:03', 'tom');
INSERT INTO `web_log` VALUES (618, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-08 16:52:04', 'tom');
INSERT INTO `web_log` VALUES (619, '/dashboard', NULL, NULL, '首页', '2020-12-09 10:15:46', 'tom');
INSERT INTO `web_log` VALUES (620, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 10:15:49', 'tom');
INSERT INTO `web_log` VALUES (621, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 10:16:12', 'tom');
INSERT INTO `web_log` VALUES (622, '/auth/index', NULL, NULL, '用户权限', '2020-12-09 10:16:35', 'tom');
INSERT INTO `web_log` VALUES (623, '/auth/index', NULL, NULL, '用户权限', '2020-12-09 10:17:58', 'tom');
INSERT INTO `web_log` VALUES (624, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 10:18:01', 'tom');
INSERT INTO `web_log` VALUES (625, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 10:18:03', 'tom');
INSERT INTO `web_log` VALUES (626, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 10:22:48', 'tom');
INSERT INTO `web_log` VALUES (627, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 10:23:36', 'tom');
INSERT INTO `web_log` VALUES (628, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 10:26:37', 'tom');
INSERT INTO `web_log` VALUES (629, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 10:38:50', 'tom');
INSERT INTO `web_log` VALUES (630, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 10:49:55', 'tom');
INSERT INTO `web_log` VALUES (631, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 10:51:10', 'tom');
INSERT INTO `web_log` VALUES (632, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 11:30:11', 'tom');
INSERT INTO `web_log` VALUES (633, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 11:31:02', 'tom');
INSERT INTO `web_log` VALUES (634, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 11:31:05', 'tom');
INSERT INTO `web_log` VALUES (635, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 11:35:33', 'tom');
INSERT INTO `web_log` VALUES (636, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 11:46:47', 'tom');
INSERT INTO `web_log` VALUES (637, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 11:48:12', 'tom');
INSERT INTO `web_log` VALUES (638, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 11:50:36', 'tom');
INSERT INTO `web_log` VALUES (639, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 11:52:11', 'tom');
INSERT INTO `web_log` VALUES (640, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 11:53:07', 'tom');
INSERT INTO `web_log` VALUES (641, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 11:53:55', 'tom');
INSERT INTO `web_log` VALUES (642, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 11:55:41', 'tom');
INSERT INTO `web_log` VALUES (643, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 11:56:40', 'tom');
INSERT INTO `web_log` VALUES (644, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 11:58:45', 'tom');
INSERT INTO `web_log` VALUES (645, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 12:00:13', 'tom');
INSERT INTO `web_log` VALUES (646, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 12:01:16', 'tom');
INSERT INTO `web_log` VALUES (647, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 13:30:45', 'tom');
INSERT INTO `web_log` VALUES (648, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 13:47:36', 'tom');
INSERT INTO `web_log` VALUES (649, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 14:24:05', 'tom');
INSERT INTO `web_log` VALUES (650, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 14:35:08', 'tom');
INSERT INTO `web_log` VALUES (651, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 14:35:14', 'tom');
INSERT INTO `web_log` VALUES (652, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 14:44:18', 'tom');
INSERT INTO `web_log` VALUES (653, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 14:44:22', 'tom');
INSERT INTO `web_log` VALUES (654, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 14:45:20', 'tom');
INSERT INTO `web_log` VALUES (655, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 14:45:27', 'tom');
INSERT INTO `web_log` VALUES (656, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 14:54:21', 'tom');
INSERT INTO `web_log` VALUES (657, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 15:27:11', 'tom');
INSERT INTO `web_log` VALUES (658, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 15:29:26', 'tom');
INSERT INTO `web_log` VALUES (659, '/system/index', NULL, NULL, '系统管理', '2020-12-09 15:29:28', 'tom');
INSERT INTO `web_log` VALUES (660, '/auth/index', NULL, NULL, '用户权限', '2020-12-09 15:29:31', 'tom');
INSERT INTO `web_log` VALUES (661, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 15:29:32', 'tom');
INSERT INTO `web_log` VALUES (662, '/auth/index', NULL, NULL, '用户权限', '2020-12-09 15:29:33', 'tom');
INSERT INTO `web_log` VALUES (663, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 15:40:26', 'tom');
INSERT INTO `web_log` VALUES (664, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 15:40:27', 'tom');
INSERT INTO `web_log` VALUES (665, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 15:43:28', 'tom');
INSERT INTO `web_log` VALUES (666, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 15:49:49', 'tom');
INSERT INTO `web_log` VALUES (667, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 16:02:29', 'tom');
INSERT INTO `web_log` VALUES (668, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 16:03:37', 'tom');
INSERT INTO `web_log` VALUES (669, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 16:04:03', 'tom');
INSERT INTO `web_log` VALUES (670, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 16:05:36', 'tom');
INSERT INTO `web_log` VALUES (671, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 16:09:46', 'tom');
INSERT INTO `web_log` VALUES (672, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 16:11:17', 'tom');
INSERT INTO `web_log` VALUES (673, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 16:12:00', 'tom');
INSERT INTO `web_log` VALUES (674, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 16:24:30', 'tom');
INSERT INTO `web_log` VALUES (675, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 16:25:05', 'tom');
INSERT INTO `web_log` VALUES (676, '/auth/index', NULL, NULL, '用户权限', '2020-12-09 16:25:08', 'tom');
INSERT INTO `web_log` VALUES (677, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 16:25:09', 'tom');
INSERT INTO `web_log` VALUES (678, '/system/index', NULL, NULL, '系统管理', '2020-12-09 16:25:10', 'tom');
INSERT INTO `web_log` VALUES (679, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 16:25:12', 'tom');
INSERT INTO `web_log` VALUES (680, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 16:25:13', 'tom');
INSERT INTO `web_log` VALUES (681, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 16:25:15', 'tom');
INSERT INTO `web_log` VALUES (682, '/path/s9Iei', NULL, NULL, '自己定义-根据传过来的值', '2020-12-09 16:25:30', 'tom');
INSERT INTO `web_log` VALUES (683, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-09 16:25:31', 'tom');
INSERT INTO `web_log` VALUES (684, '/path/s9Iei', NULL, NULL, '自己定义-根据传过来的值', '2020-12-09 16:25:34', 'tom');
INSERT INTO `web_log` VALUES (685, '/pathTwo/addPathTwo', NULL, NULL, '添加页面2', '2020-12-09 16:25:35', 'tom');
INSERT INTO `web_log` VALUES (686, '/path/s9Iei', NULL, NULL, '自己定义-根据传过来的值', '2020-12-09 16:25:36', 'tom');
INSERT INTO `web_log` VALUES (687, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 16:26:15', 'tom');
INSERT INTO `web_log` VALUES (688, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 16:26:52', 'tom');
INSERT INTO `web_log` VALUES (689, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 16:45:16', 'tom');
INSERT INTO `web_log` VALUES (690, '/auth/roleModule', NULL, NULL, '添加权限', '2020-12-09 16:53:05', 'tom');
INSERT INTO `web_log` VALUES (691, '/dashboard', NULL, NULL, '首页', '2020-12-09 16:56:04', 'tom');
INSERT INTO `web_log` VALUES (692, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 16:56:07', 'tom');
INSERT INTO `web_log` VALUES (693, '/dashboard', NULL, NULL, '首页', '2020-12-09 18:19:33', 'tom');
INSERT INTO `web_log` VALUES (694, '/dashboard', NULL, NULL, '首页', '2020-12-09 18:21:30', 'tom');
INSERT INTO `web_log` VALUES (695, '/dashboard', NULL, NULL, '首页', '2020-12-09 18:26:46', 'tom');
INSERT INTO `web_log` VALUES (696, '/auth/path', NULL, NULL, '添加路由', '2020-12-09 18:27:31', 'tom');

SET FOREIGN_KEY_CHECKS = 1;
