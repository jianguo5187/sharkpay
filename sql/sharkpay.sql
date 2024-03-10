/*
 Navicat Premium Data Transfer

 Source Server         : localhost(sharkpay)
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26)
 Source Host           : localhost:3306
 Source Schema         : sharkpay

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26)
 File Encoding         : 65001

 Date: 10/03/2024 23:22:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (2, 'sys_bet_item', '游戏投注项表', NULL, NULL, 'SysBetItem', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'betItem', '游戏投注项', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-06 21:19:29', '', '2024-03-06 21:38:45', NULL);
INSERT INTO `gen_table` VALUES (5, 'sys_game', '游戏表', NULL, NULL, 'SysGame', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'game', '游戏', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26', NULL);
INSERT INTO `gen_table` VALUES (6, 'sys_bet_type', '游戏玩法表', NULL, NULL, 'SysBetType', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'betType', '游戏玩法', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-10 21:13:57', '', '2024-03-10 21:14:44', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (24, 2, 'bet_item_id', '游戏投注项ID', 'int(11)', 'Long', 'betItemId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-06 21:19:29', '', '2024-03-06 21:38:45');
INSERT INTO `gen_table_column` VALUES (25, 2, 'game_id', '游戏ID', 'int(11)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-03-06 21:19:29', '', '2024-03-06 21:38:45');
INSERT INTO `gen_table_column` VALUES (26, 2, 'bet_item_type', '投注项类别', 'varchar(2)', 'String', 'betItemType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2024-03-06 21:19:29', '', '2024-03-06 21:38:45');
INSERT INTO `gen_table_column` VALUES (27, 2, 'bet_item_name', '投注项名', 'varchar(25)', 'String', 'betItemName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-03-06 21:19:29', '', '2024-03-06 21:38:45');
INSERT INTO `gen_table_column` VALUES (28, 2, 'bet_item_describe', '特色定义内容', 'longblob', 'String', 'betItemDescribe', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2024-03-06 21:19:29', '', '2024-03-06 21:38:45');
INSERT INTO `gen_table_column` VALUES (29, 2, 'odd', '赔率', 'int(3)', 'Integer', 'odd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-03-06 21:19:29', '', '2024-03-06 21:38:45');
INSERT INTO `gen_table_column` VALUES (30, 2, 'min_bet_amount', '最小投注金额', 'float(5,2)', 'BigDecimal', 'minBetAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-03-06 21:19:29', '', '2024-03-06 21:38:45');
INSERT INTO `gen_table_column` VALUES (31, 2, 'max_bet_amount', '最大投注金额', 'float(5,2)', 'BigDecimal', 'maxBetAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-03-06 21:19:29', '', '2024-03-06 21:38:45');
INSERT INTO `gen_table_column` VALUES (32, 2, 'sort', '排序', 'int(4)', 'Integer', 'sort', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-03-06 21:19:29', '', '2024-03-06 21:38:45');
INSERT INTO `gen_table_column` VALUES (33, 2, 'status', '投注项状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_bet_item_status', 10, 'admin', '2024-03-06 21:19:29', '', '2024-03-06 21:38:45');
INSERT INTO `gen_table_column` VALUES (34, 2, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2024-03-06 21:19:29', '', '2024-03-06 21:38:45');
INSERT INTO `gen_table_column` VALUES (35, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2024-03-06 21:19:29', '', '2024-03-06 21:38:45');
INSERT INTO `gen_table_column` VALUES (36, 2, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2024-03-06 21:19:29', '', '2024-03-06 21:38:45');
INSERT INTO `gen_table_column` VALUES (37, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2024-03-06 21:19:29', '', '2024-03-06 21:38:45');
INSERT INTO `gen_table_column` VALUES (38, 2, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 15, 'admin', '2024-03-06 21:19:29', '', '2024-03-06 21:38:45');
INSERT INTO `gen_table_column` VALUES (85, 5, 'game_id', '游戏ID', 'int(11)', 'Long', 'gameId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (86, 5, 'game_img', '游戏图片', 'varchar(20)', 'String', 'gameImg', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'imageUpload', '', 2, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (87, 5, 'game_type', '游戏类别', 'int(11)', 'Long', 'gameType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'sys_game_type', 3, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (88, 5, 'game_mark_id', '游戏标识ID', 'varchar(25)', 'String', 'gameMarkId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (89, 5, 'game_name', '游戏名', 'varchar(25)', 'String', 'gameName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (90, 5, 'game_alias_name', '游戏别名', 'varchar(25)', 'String', 'gameAliasName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (91, 5, 'game_describe', '描述', 'longblob', 'String', 'gameDescribe', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', 7, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (92, 5, 'profit_loss_name', '盈亏名', 'varchar(25)', 'String', 'profitLossName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 8, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (93, 5, 'game_record', '记录表', 'varchar(50)', 'String', 'gameRecord', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (94, 5, 'game_kj', '开奖表', 'varchar(50)', 'String', 'gameKj', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (95, 5, 'game_commission', '佣金', 'float(5,2)', 'BigDecimal', 'gameCommission', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (96, 5, 'game_commission_two', '2级佣金', 'float(5,2)', 'BigDecimal', 'gameCommissionTwo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (97, 5, 'game_cate', '回水彩种', 'varchar(50)', 'String', 'gameCate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (98, 5, 'game_cashback', '回水', 'float(5,2)', 'BigDecimal', 'gameCashback', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (99, 5, 'min_bet_amount', '最小投注金额', 'float(5,2)', 'BigDecimal', 'minBetAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (100, 5, 'max_bet_amount', '最大投注金额', 'float(5,2)', 'BigDecimal', 'maxBetAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (101, 5, 'end_time', '封盘秒数', 'int(11)', 'Long', 'endTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (102, 5, 'robot_rate', '机器人比例', 'int(3)', 'Integer', 'robotRate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (103, 5, 'room_rule', '房间规则', 'text', 'String', 'roomRule', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'textarea', '', 19, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (104, 5, 'sort', '排序', 'int(4)', 'Integer', 'sort', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (105, 5, 'status', '游戏状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_game_status', 21, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (106, 5, 'is_hidden', '是否隐藏（N否 Y是）', 'char(1)', 'String', 'isHidden', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 22, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (107, 5, 'house_open', '房间模式', 'int(11)', 'Long', 'houseOpen', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'input', '', 23, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (108, 5, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 24, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (109, 5, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 25, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (110, 5, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 26, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (111, 5, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 27, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (112, 5, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 28, 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26');
INSERT INTO `gen_table_column` VALUES (113, 6, 'bet_type_id', '游戏玩法ID', 'int(11)', 'Long', 'betTypeId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-10 21:13:57', '', '2024-03-10 21:14:44');
INSERT INTO `gen_table_column` VALUES (114, 6, 'game_id', '游戏ID', 'int(11)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2024-03-10 21:13:57', '', '2024-03-10 21:14:44');
INSERT INTO `gen_table_column` VALUES (115, 6, 'bet_type_name', '游戏玩法名', 'varchar(25)', 'String', 'betTypeName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-03-10 21:13:57', '', '2024-03-10 21:14:44');
INSERT INTO `gen_table_column` VALUES (116, 6, 'sort', '排序', 'int(4)', 'Integer', 'sort', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-10 21:13:57', '', '2024-03-10 21:14:44');
INSERT INTO `gen_table_column` VALUES (117, 6, 'status', '游戏状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2024-03-10 21:13:57', '', '2024-03-10 21:14:44');
INSERT INTO `gen_table_column` VALUES (118, 6, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-03-10 21:13:57', '', '2024-03-10 21:14:44');
INSERT INTO `gen_table_column` VALUES (119, 6, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-03-10 21:13:57', '', '2024-03-10 21:14:44');
INSERT INTO `gen_table_column` VALUES (120, 6, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-03-10 21:13:57', '', '2024-03-10 21:14:44');
INSERT INTO `gen_table_column` VALUES (121, 6, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-03-10 21:13:57', '', '2024-03-10 21:14:44');
INSERT INTO `gen_table_column` VALUES (122, 6, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2024-03-10 21:13:57', '', '2024-03-10 21:14:44');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_bet_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_bet_item`;
CREATE TABLE `sys_bet_item`  (
  `bet_item_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '游戏投注项ID',
  `game_id` int(11) NOT NULL COMMENT '游戏ID',
  `bet_item_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投注项类别',
  `bet_item_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投注项名',
  `bet_item_describe` longblob NULL COMMENT '特色定义内容',
  `odd` float(10, 2) NULL DEFAULT 0.00 COMMENT '赔率',
  `min_bet_amount` float(11, 2) NULL DEFAULT 0.00 COMMENT '最小投注金额',
  `max_bet_amount` float(11, 2) NULL DEFAULT 0.00 COMMENT '最大投注金额',
  `sort` int(4) NULL DEFAULT 0 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '投注项状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`bet_item_id`) USING BTREE,
  INDEX `bet_item_name`(`game_id`, `bet_item_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏投注项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_bet_item
-- ----------------------------
INSERT INTO `sys_bet_item` VALUES (2, 1, '1', '大', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (3, 1, '1', '小', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.01, 9999.99, 2.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (4, 1, '1', '单', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (5, 1, '1', '双', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.00, 9999.99, 5.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (6, 1, '1', '极大', '', 15.00, 500.00, 2.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (7, 1, '1', '大单', '', 4.20, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (8, 1, '1', '小单', 0xE5BC805B31335DE7BB84E59088E5B08FE58D95E999AA5B315DE5808DEFBC8CE5BC80E7BB84E590885B31345DE5A4A7E58F8CE999AA5B315DE5808D, 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (9, 1, '1', '大双', 0xE5BC805B31335DE7BB84E59088E5B08FE58D95E999AA5B315DE5808DEFBC8CE5BC80E7BB84E590885B31345DE5A4A7E58F8CE999AA5B315DE5808D, 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (10, 1, '1', '小双', '', 4.20, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (11, 1, '1', '极小', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (12, 1, '2', '0 ', '', 500.01, 1000.00, 5.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:03:41', '');
INSERT INTO `sys_bet_item` VALUES (13, 1, '2', '1 ', '', 188.00, 9999.99, 5.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:08', '');
INSERT INTO `sys_bet_item` VALUES (14, 1, '2', '2 ', '', 120.00, 1000.00, 5.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:19', '');
INSERT INTO `sys_bet_item` VALUES (15, 1, '2', '3 ', '', 72.00, 1000.00, 5.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:40', '');
INSERT INTO `sys_bet_item` VALUES (16, 1, '2', '4 ', '', 38.00, 1000.00, 5.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:54', '');
INSERT INTO `sys_bet_item` VALUES (17, 1, '2', '5 ', '', 30.00, 1000.00, 5.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:07', '');
INSERT INTO `sys_bet_item` VALUES (18, 1, '2', '6 ', '', 24.00, 1000.00, 5.00, 18, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:24', '');
INSERT INTO `sys_bet_item` VALUES (19, 1, '2', '7 ', '', 19.00, 10000.00, 5.00, 19, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:39', '');
INSERT INTO `sys_bet_item` VALUES (20, 1, '2', '8 ', '', 17.00, 10000.00, 5.00, 20, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:19:02', '');
INSERT INTO `sys_bet_item` VALUES (21, 1, '2', '9 ', '', 15.00, 9999.99, 5.00, 21, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (22, 1, '2', '10', '', 14.00, 9999.99, 5.00, 22, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (23, 1, '2', '11', '', 13.00, 9999.99, 5.00, 23, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (24, 1, '2', '12', '', 12.00, 9999.99, 5.00, 24, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (25, 1, '2', '13', '', 12.00, 9999.99, 5.00, 25, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (26, 1, '2', '14', '', 12.00, 9999.99, 5.00, 26, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (27, 1, '2', '15', '', 12.00, 9999.99, 5.00, 27, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (28, 1, '2', '16', '', 13.00, 9999.99, 5.00, 28, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (29, 1, '2', '17', '', 14.00, 9999.99, 5.00, 29, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (30, 1, '2', '18', '', 15.00, 9999.99, 5.00, 30, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (31, 1, '2', '19', '', 17.00, 9999.99, 5.00, 31, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (32, 1, '2', '20', '', 19.00, 9999.99, 5.00, 32, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (33, 1, '2', '21', '', 24.00, 9999.99, 5.00, 33, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (34, 1, '2', '22', '', 30.00, 9999.99, 5.00, 34, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (35, 1, '2', '23', '', 38.00, 9999.99, 5.00, 35, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (36, 1, '2', '24', '', 72.00, 9999.99, 5.00, 36, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (37, 1, '2', '25', '', 120.00, 9999.99, 5.00, 37, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (38, 1, '2', '26', '', 188.00, 9999.99, 5.00, 38, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (39, 1, '2', '27', '', 500.00, 9999.99, 2.00, 39, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (40, 1, '3', '红', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 40, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (41, 1, '3', '绿', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 41, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (42, 1, '3', '蓝', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 42, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (43, 1, '3', '龙', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 43, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (44, 1, '3', '虎', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 44, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (45, 1, '3', '合', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 45, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (46, 1, '3', '豹子', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 46, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (47, 1, '3', '对子', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 47, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (48, 1, '3', '顺子', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 48, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');

-- ----------------------------
-- Table structure for sys_bet_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_bet_type`;
CREATE TABLE `sys_bet_type`  (
  `bet_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '游戏玩法ID',
  `game_id` int(11) NOT NULL COMMENT '游戏ID',
  `bet_type_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏玩法名',
  `sort` int(4) NULL DEFAULT 0 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '游戏状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`bet_type_id`) USING BTREE,
  INDEX `bet_type_name`(`game_id`, `bet_type_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏玩法表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_bet_type
-- ----------------------------
INSERT INTO `sys_bet_type` VALUES (1, 1, '大小单双', 1, '0', '', '2024-03-10 21:39:45', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (2, 1, '猜数字', 2, '0', '', '2024-03-10 21:40:13', '', '2024-03-10 21:40:37', '');
INSERT INTO `sys_bet_type` VALUES (3, 1, '特殊玩法', 3, '0', '', '2024-03-10 21:40:34', '', NULL, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-03-05 21:03:11', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-03-05 21:03:11', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-03-05 21:03:11', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2024-03-05 21:03:11', 'admin', '2024-03-05 21:06:00', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-03-05 21:03:11', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-03-05 21:03:11', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-05 21:03:10', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-05 21:03:10', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-05 21:03:10', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-05 21:03:10', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-05 21:03:10', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-05 21:03:10', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-05 21:03:10', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-05 21:03:10', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-05 21:03:10', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-05 21:03:10', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '3球', '3', 'sys_game_type', NULL, 'default', 'N', '0', 'admin', '2024-03-06 20:23:54', 'admin', '2024-03-06 21:29:04', '加拿大');
INSERT INTO `sys_dict_data` VALUES (101, 2, '5球', '5', 'sys_game_type', NULL, 'default', 'N', '0', 'admin', '2024-03-06 20:24:02', 'admin', '2024-03-06 20:24:44', '时时彩');
INSERT INTO `sys_dict_data` VALUES (102, 3, '10球', '10', 'sys_game_type', NULL, 'default', 'N', '0', 'admin', '2024-03-06 20:24:12', 'admin', '2024-03-06 20:24:28', '赛车');
INSERT INTO `sys_dict_data` VALUES (103, 1, '正常', '0', 'sys_bet_item_status', NULL, 'primary', 'N', '0', 'admin', '2024-03-06 21:35:32', 'admin', '2024-03-06 21:35:58', NULL);
INSERT INTO `sys_dict_data` VALUES (104, 1, '停用', '1', 'sys_bet_item_status', NULL, 'danger', 'N', '0', 'admin', '2024-03-06 21:35:40', 'admin', '2024-03-06 21:36:03', NULL);
INSERT INTO `sys_dict_data` VALUES (105, 1, '正常', '0', 'sys_game_status', NULL, 'primary', 'N', '0', 'admin', '2024-03-06 21:39:22', 'admin', '2024-03-06 21:39:35', NULL);
INSERT INTO `sys_dict_data` VALUES (106, 2, '停用', '1', 'sys_game_status', NULL, 'danger', 'N', '0', 'admin', '2024-03-06 21:39:32', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '游戏类型', 'sys_game_type', '0', 'admin', '2024-03-06 20:23:36', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '游戏投注项状态', 'sys_bet_item_status', '0', 'admin', '2024-03-06 21:35:03', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '游戏状态', 'sys_game_status', '0', 'admin', '2024-03-06 21:39:10', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_game
-- ----------------------------
DROP TABLE IF EXISTS `sys_game`;
CREATE TABLE `sys_game`  (
  `game_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '游戏ID',
  `game_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏图片',
  `game_type` int(11) NULL DEFAULT NULL COMMENT '游戏类别',
  `game_mark_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏标识ID',
  `game_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏名',
  `game_alias_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏别名',
  `game_describe` longblob NULL COMMENT '描述',
  `profit_loss_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盈亏名',
  `game_record` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录表',
  `game_kj` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开奖表',
  `game_commission` float(5, 2) NULL DEFAULT 0.00 COMMENT '佣金',
  `game_commission_two` float(5, 2) NULL DEFAULT NULL COMMENT '2级佣金',
  `game_cate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回水彩种',
  `game_cashback` float(5, 2) NULL DEFAULT 0.00 COMMENT '回水',
  `min_bet_amount` float(11, 2) NULL DEFAULT 0.00 COMMENT '最小投注金额',
  `max_bet_amount` float(11, 2) NULL DEFAULT 0.00 COMMENT '最大投注金额',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '封盘秒数',
  `robot_rate` int(3) NULL DEFAULT NULL COMMENT '机器人比例',
  `room_rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '房间规则',
  `sort` int(4) NULL DEFAULT 0 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '游戏状态（0正常 1停用）',
  `is_hidden` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否隐藏（N否 Y是）',
  `house_open` int(11) NULL DEFAULT 0 COMMENT '房间模式',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`game_id`) USING BTREE,
  INDEX `game_mark_id`(`game_mark_id`) USING BTREE,
  INDEX `game_name`(`game_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_game
-- ----------------------------
INSERT INTO `sys_game` VALUES (1, '/profile/upload/2024/03/06/jnd2.0_20240306222925A002.jpg', 3, 'jnd20', '加拿大2.0', '加拿大28', 0xE38090E58AA0E68BBFE5A4A7322E30E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A322E30E5808DEFBC88E5BC8031332F3134E8B594312E35E5808DEFBC89E5B08FE58D952FE5A4A7E58F8CEFBC9A342E36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A342E32E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3135E5808DE38090E789B9E6AE8AE8B594E78E87E38091E4B9B0E5B08FE68896E58D95EFBC8CE5BC80E5A596E4B8BA3133E4B894E8B594EFBC9A312E35E5808DE4B9B0E5A4A7E68896E58F8CEFBC8CE5BC80E5A596E4B8BA3134E4B894E8B594EFBC9A312E35E5808DE4B88BE6B3A8E5B08FE58D95E5BC80E5A596E4B8BA3133E4B8ADE5A596E59B9EE69CAC266E6273703BE4B88BE6B3A8E5A4A7E58F8CE5BC80E5A596E4B8BA3134E4B8ADE5A596E59B9EE69CAC266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E58F8DE58D83E58886E4B98B3135E38091E38090E6999AE4B88A30303A3135E5898DE7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 3.00, NULL, NULL, 0.00, 2.00, 10000.00, 60, 20, NULL, 1, '0', 'N', 0, '', '2024-03-06 22:34:06', '', NULL, '');
INSERT INTO `sys_game` VALUES (2, '/profile/upload/2024/03/09/jnd28_20240309200723A001.jpg', 3, 'jnd28', '加拿大2.8', '加拿大2.8', 0xE38090E58AA0E68BBFE5A4A7322E38E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A322E38E5808DE5B08FE58D952FE5A4A7E58F8CEFBC9A36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A36E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3136E5808DE5AFB9E5AD902F33266E6273703B20266E6273703BE9A1BAE5AD902F3132266E6273703B20266E6273703BE8B1B9E5AD902F3630266E6273703BE38090E789B9E6AE8AE8B594E78E87E38091E5BC80E695B0E5AD9731332F31342FE5AFB9E5AD902FE9A1BAE5AD902FE8B1B9E5AD902F20E4B8ADE5A596E58D95E6B3A8E7BB84E59088E59B9EE69CAC266E6273703BE695B0E5AD97EFBC8830302F3237EFBC89EFBC9A353230E5808DE695B0E5AD97EFBC8830312F3236EFBC89EFBC9A323430E5808DE695B0E5AD97EFBC8830322F3235EFBC89EFBC9A313230E5808DE695B0E5AD97EFBC8830332F3234EFBC89EFBC9A3732E5808DE695B0E5AD97EFBC8830342F3233EFBC89EFBC9A3438E5808DE695B0E5AD97EFBC8830352F3232EFBC89EFBC9A3330E5808DE695B0E5AD97EFBC8830362F3231EFBC89EFBC9A3234E5808DE695B0E5AD97EFBC8830372F3230EFBC89EFBC9A3139E5808DE695B0E5AD97EFBC8830382F3139EFBC89EFBC9A3137E5808DE695B0E5AD97EFBC8830392F3138EFBC89EFBC9A3135E5808DE695B0E5AD97EFBC8831302F3137EFBC89EFBC9A3134E5808DE695B0E5AD97EFBC8831312F3136EFBC89EFBC9A3133E5808DE695B0E5AD97EFBC8831322F3135EFBC89EFBC9A3132E5808DE695B0E5AD97EFBC8831332F3134EFBC89EFBC9A3132E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E58C85E590ABE69CACE98791EFBC81266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE7BB84E59088EFBC9A3130303030E5B081E9A1B6266E6273703BE69E81E5A4A72FE69E81E5B08FEFBC9A3130303030E5B081E9A1B6266E6273703BE695B0E5AD9730302F3237EFBC9A31303030E5B081E9A1B6E695B0E5AD97312F3236EFBC9A33303030E5B081E9A1B6E5AFB9E9A1BAE5AD90EFBC9A3130303030E5B081E9A1B6E8B1B9E5AD90EFBC9A35303030E5B081E9A1B6E58D95E782B9E695B0E5AD97E69C80E9AB98E8B594E4BB98353030303030E38090E4BA8FE68D9FE58F8DE6B0B4E38091E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3135E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 75, 20, NULL, 2, '0', 'N', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:07:58', '');
INSERT INTO `sys_game` VALUES (3, '/profile/upload/2024/03/09/jnd32_20240309200821A002.jpg', 3, 'jnd32', '加拿大3.2', '加拿大3.2', 0xE38090E58AA0E68BBFE5A4A7332E32E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A332E32E5808DE5B08FE58D952FE5A4A7E58F8CEFBC9A362E36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A362E36E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3135E5808DE38090E789B9E6AE8AE8B594E78E87E38091E5A4A7E5B08FE58D95E58F8C20E6ADA3E5B8B8E8B594E78E87332E32E5808DEFBC8CE5BC80E5A596E7BB93E69E9CE98187E5BC80E5A596E58CBAE4B889E4B8AAE695B0E5AD97E585B6E4B8ADE4B880E4B8AAE5B8A630E6889639E4B88EE5BC80E5A596E7BB93E69E9C3133E688963134EFBC8CE4B8ADE5A596E59B9EE69CACE98791E38082E7BB84E59088EFBC8CE6ADA3E5B8B8E8B594E78E87362E36E5808DEFBC8CE5BC80E5A596E7BB93E69E9CE98187E5BC80E5A596E58CBAE4B889E4B8AAE695B0E5AD97E585B6E4B8ADE4B880E4B8AAE5B8A630E6889639E4B88EE5BC80E5A596E7BB93E69E9C3133E688963134EFBC8CE4B8ADE5A596E59B9EE69CACE98791E38082E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B35E38091E38090E6B581E6B0B4E58F8DE58D83E58886E4B98B35E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 15.00, 5.00, 20000.00, 75, 20, NULL, 3, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:08:45', '');
INSERT INTO `sys_game` VALUES (4, '/profile/upload/2024/03/09/jspc28_20240309200907A003.png', 3, 'jspc28', '比特2.0', '比特28', 0xE38090E6BEB3E6B4B2E69E81E9809F322E30E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A322E30E5808DEFBC88E5BC8031332F3134E8B594312E36E5808DEFBC89E5B08FE58D952FE5A4A7E58F8CEFBC9A342E36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A342E32E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3135E5808DE38090E789B9E6AE8AE8B594E78E87E38091E4B9B0E5B08FE68896E58D95EFBC8CE5BC80E5A596E4B8BA3133E4B894E8B594EFBC9A312E36E5808DE4B9B0E5A4A7E68896E58F8CEFBC8CE5BC80E5A596E4B8BA3134E4B894E8B594EFBC9A312E36E5808DE4B88BE6B3A8E5B08FE58D95E5BC80E5A596E4B8BA3133E4B8ADE5A596E59B9EE69CAC266E6273703BE4B88BE6B3A8E5A4A7E58F8CE5BC80E5A596E4B8BA3134E4B8ADE5A596E59B9EE69CAC266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E58F8DE58D83E58886E4B98B3230E38091E38090E6999AE4B88A30303A3135E5898DE7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 10.00, NULL, NULL, 20.00, 2.00, 20000.00, 20, 20, NULL, 4, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:09:59', '');
INSERT INTO `sys_game` VALUES (5, '/profile/upload/2024/03/09/bt28_20240309201046A004.png', 3, 'bt28', '比特2.8', '比特2.8', 0xE38090E6BEB3E6B4B2E69E81E9809F322E38E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A322E38E5808DE5B08FE58D952FE5A4A7E58F8CEFBC9A36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A36E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3135E5808DE5AFB9E5AD902F33266E6273703B20266E6273703BE9A1BAE5AD902F3132266E6273703B20266E6273703BE8B1B9E5AD902F3530266E6273703BE38090E789B9E6AE8AE8B594E78E87E38091E5BC80E695B0E5AD9731332F31342FE5AFB9E5AD902FE9A1BAE5AD902FE8B1B9E5AD902F20E4B8ADE5A596E58D95E6B3A8E7BB84E59088E59B9EE69CAC266E6273703BE695B0E5AD97EFBC8830302F3237EFBC89EFBC9A353030E5808DE695B0E5AD97EFBC8830312F3236EFBC89EFBC9A323430E5808DE695B0E5AD97EFBC8830322F3235EFBC89EFBC9A313230E5808DE695B0E5AD97EFBC8830332F3234EFBC89EFBC9A3732E5808DE695B0E5AD97EFBC8830342F3233EFBC89EFBC9A3438E5808DE695B0E5AD97EFBC8830352F3232EFBC89EFBC9A3333E5808DE695B0E5AD97EFBC8830362F3231EFBC89EFBC9A3235E5808DE695B0E5AD97EFBC8830372F3230EFBC89EFBC9A3230E5808DE695B0E5AD97EFBC8830382F3139EFBC89EFBC9A3137E5808DE695B0E5AD97EFBC8830392F3138EFBC89EFBC9A3135E5808DE695B0E5AD97EFBC8831302F3137EFBC89EFBC9A3134E5808DE695B0E5AD97EFBC8831312F3136EFBC89EFBC9A3134E5808DE695B0E5AD97EFBC8831322F3135EFBC89EFBC9A3133E5808DE695B0E5AD97EFBC8831332F3134EFBC89EFBC9A3132E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E58C85E590ABE69CACE98791EFBC81266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE7BB84E59088EFBC9A3130303030E5B081E9A1B6266E6273703BE69E81E5A4A72FE69E81E5B08FEFBC9A3130303030E5B081E9A1B6266E6273703BE695B0E5AD9730302F3237EFBC9A31303030E5B081E9A1B6E695B0E5AD97312F3236EFBC9A33303030E5B081E9A1B6E5AFB9E9A1BAE5AD90EFBC9A3130303030E5B081E9A1B6E8B1B9E5AD90EFBC9A35303030E5B081E9A1B6E58D95E782B9E695B0E5AD97E69C80E9AB98E8B594E4BB98353030303030E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3135E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 5.00, NULL, NULL, 5.00, 5.00, 50000.00, 20, 20, NULL, 5, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:11:14', '');
INSERT INTO `sys_game` VALUES (6, '/profile/upload/2024/03/09/mssc_20240309201138A005.png', 10, 'mssc', '极速赛车', '极速赛车', 0xE38090E6BEB3E6B4B2E69E81E9809FE8B59BE8BDA6E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E7A68FE588A9E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3135E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 10.00, NULL, NULL, 5.00, 5.00, 50000.00, 20, 20, NULL, 6, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:12:38', '');
INSERT INTO `sys_game` VALUES (7, '/profile/upload/2024/03/09/azxy52_20240309201631A006.jpg', 5, 'azxy52', '澳洲幸运5高赔率', '澳洲幸运5高赔率', 0xE38090E6BEB3E6B4B2E5B9B8E8BF9035266E6273703B392E39E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D302D39E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 100000.00, 70, 20, NULL, 7, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:17:06', '');
INSERT INTO `sys_game` VALUES (8, '/profile/upload/2024/03/09/azxy5_20240309201732A007.jpg', 5, 'azxy5', '澳洲幸运5', '澳洲幸运5', 0xE38090E6BEB3E6B4B2E5B9B8E8BF9035266E6273703B392E39E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D302D39E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 100000.00, 70, 20, NULL, 8, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:18:04', '');
INSERT INTO `sys_game` VALUES (9, '/profile/upload/2024/03/09/azxy10_20240309201831A008.jpg', 10, 'azxy10', '澳洲幸运10', '澳洲幸运10', 0xE38090E6BEB3E6B4B2E5B9B8E8BF903130266E6273703B20392E39E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 0.00, 5.00, 300000.00, 70, 20, NULL, 9, '0', 'N', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:19:19', '');
INSERT INTO `sys_game` VALUES (10, '/profile/upload/2024/03/09/azxy10_20240309201934A009.jpg', 10, 'azxy102', '澳洲幸运10高赔率', '澳洲幸运10高赔率', 0xE38090E6BEB3E6B4B2E5B9B8E8BF903130266E6273703B20392E39E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 300000.00, 70, 20, NULL, 10, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:20:07', '');
INSERT INTO `sys_game` VALUES (11, '/profile/upload/2024/03/09/xyft_20240309202028A010.jpg', 10, 'xyft', '幸运飞艇', '幸运飞艇', 0xE38090E5B9B8E8BF90E9A39EE88987392E39E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808DEFBC88E590ABE69CACE98791EFBC893130E8BDA6E58FB7EFBC9A392E39E5808DEFBC88E590ABE69CACE98791EFBC89E9BE992FE8998EEFBC9A312E3938E5808DEFBC88E590ABE69CACE98791EFBC89E586A0E4BA9AE5928CE5A4A72FE58F8CEFBC9A322E31E5808DEFBC88E590ABE69CACE98791EFBC89E5B08F2FE58D95EFBC9A312E37E5808DEFBC88E590ABE69CACE98791EFBC89332F342F31382F3139EFBC9AE590ABE69CAC3431E5808D352F362F31362F3137EFBC9AE590ABE69CAC3230E5808D372F382F31342F3135EFBC9AE590ABE69CAC3133E5808D392F31302F31322F3133EFBC9AE590ABE69CAC39E5808D3131EFBC9AE590ABE69CAC37E5808D317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E2062722FE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 110, 20, NULL, 11, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:20:59', '');
INSERT INTO `sys_game` VALUES (12, '/profile/upload/2024/03/09/jssc_20240309202124A011.jpg', 10, 'jssc', '168极速赛车', '168极速赛车', 0xE38090E69E81E9809FE8B59BE8BDA6392E39E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4BA8FE68D9FE697A0E58F8DE6B0B4E38091E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3030E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 35, 20, NULL, 12, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:21:54', '');
INSERT INTO `sys_game` VALUES (13, '/profile/upload/2024/03/09/jsft_20240309202548A012.jpg', 10, 'jsft', '168极速飞艇', '168极速飞艇', 0xE38090E69E81E9809FE9A39EE88987E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3030E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 50000.00, 5, 20, NULL, 13, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:26:22', '');
INSERT INTO `sys_game` VALUES (14, '/profile/upload/2024/03/09/jssc2_20240309202640A013.jpg', 10, 'jssc2', '168极速赛车高赔率', '168极速赛车高赔率', 0xE38090E69E81E9809FE8B59BE8BDA6392E39E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4BA8FE68D9FE697A0E58F8DE6B0B4E38091E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3030E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 35, 20, NULL, 14, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:27:07', '');
INSERT INTO `sys_game` VALUES (15, '/profile/upload/2024/03/09/jsssc_20240309202724A014.jpg', 5, 'jsssc', '168极速时时彩', '168极速时时彩', 0xE38090E69E81E9809FE697B6E697B6E5BDA9E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D302D39E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4BA8FE68D9FE697A0E58F8DE6B0B4E38091E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3030E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 100000.00, 35, 30, NULL, 15, '0', 'N', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:27:57', '');
INSERT INTO `sys_game` VALUES (16, '/profile/upload/2024/03/09/xyft2_20240309202820A015.jpg', 10, 'xyft2', '幸运飞艇高赔率', '幸运飞艇高赔率', 0xE38090E5B9B8E8BF90E9A39EE88987392E39E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808DEFBC88E590ABE69CACE98791EFBC893130E8BDA6E58FB7EFBC9A392E39E5808DEFBC88E590ABE69CACE98791EFBC89E9BE992FE8998EEFBC9A312E3938E5808DEFBC88E590ABE69CACE98791EFBC89E586A0E4BA9AE5928CE5A4A72FE58F8CEFBC9A322E31E5808DEFBC88E590ABE69CACE98791EFBC89E5B08F2FE58D95EFBC9A312E37E5808DEFBC88E590ABE69CACE98791EFBC89332F342F31382F3139EFBC9AE590ABE69CAC3431E5808D352F362F31362F3137EFBC9AE590ABE69CAC3230E5808D372F382F31342F3135EFBC9AE590ABE69CAC3133E5808D392F31302F31322F3133EFBC9AE590ABE69CAC39E5808D3131EFBC9AE590ABE69CAC37E5808D317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E2062722FE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 110, 20, NULL, 16, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:28:48', '');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-03-05 21:03:11', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-05 21:05:41');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-05 21:06:04');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-05 21:06:06');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-05 21:37:48');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-09 19:51:30');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-09 20:41:31');
INSERT INTO `sys_logininfor` VALUES (106, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-03-09 20:41:36');
INSERT INTO `sys_logininfor` VALUES (107, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-09 20:41:41');
INSERT INTO `sys_logininfor` VALUES (108, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-09 20:41:54');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-09 20:41:56');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-10 20:12:28');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2019 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-03-05 21:03:11', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 97, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-03-05 21:03:11', 'admin', '2024-03-05 21:38:19', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 98, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-03-05 21:03:11', 'admin', '2024-03-05 21:38:10', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 99, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2024-03-05 21:03:11', 'admin', '2024-03-05 21:38:02', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-03-05 21:03:11', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-03-05 21:03:11', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-03-05 21:03:11', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-03-05 21:03:11', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-03-05 21:03:11', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-03-05 21:03:11', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-03-05 21:03:11', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-03-05 21:03:11', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-03-05 21:03:11', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-03-05 21:03:11', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-03-05 21:03:11', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-03-05 21:03:11', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-03-05 21:03:11', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-03-05 21:03:11', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-03-05 21:03:11', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-03-05 21:03:11', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-03-05 21:03:11', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-03-05 21:03:11', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-03-05 21:03:11', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-03-05 21:03:11', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '游戏管理', 0, 2, 'game', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'guide', 'admin', '2024-03-05 21:39:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '游戏', 2000, 1, 'game', 'system/game/index', NULL, 1, 0, 'C', '0', '0', 'system:game:list', 'cascader', 'admin', '2024-03-05 21:41:56', 'admin', '2024-03-10 21:24:42', '游戏菜单');
INSERT INTO `sys_menu` VALUES (2002, '游戏查询', 2001, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:game:query', '#', 'admin', '2024-03-05 21:41:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '游戏新增', 2001, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:game:add', '#', 'admin', '2024-03-05 21:41:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '游戏修改', 2001, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:game:edit', '#', 'admin', '2024-03-05 21:41:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '游戏删除', 2001, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:game:remove', '#', 'admin', '2024-03-05 21:41:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '游戏导出', 2001, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:game:export', '#', 'admin', '2024-03-05 21:41:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '游戏投注项', 2000, 3, 'betItem', 'system/betItem/index', NULL, 1, 0, 'C', '0', '0', 'system:betItem:list', 'build', 'admin', '2024-03-06 21:24:49', 'admin', '2024-03-10 21:24:30', '游戏投注项菜单');
INSERT INTO `sys_menu` VALUES (2008, '游戏投注项查询', 2007, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:betItem:query', '#', 'admin', '2024-03-06 21:24:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '游戏投注项新增', 2007, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:betItem:add', '#', 'admin', '2024-03-06 21:24:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '游戏投注项修改', 2007, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:betItem:edit', '#', 'admin', '2024-03-06 21:24:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '游戏投注项删除', 2007, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:betItem:remove', '#', 'admin', '2024-03-06 21:24:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '游戏投注项导出', 2007, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:betItem:export', '#', 'admin', '2024-03-06 21:24:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '游戏玩法', 2000, 2, 'betType', 'system/betType/index', NULL, 1, 0, 'C', '0', '0', 'system:betType:list', 'clipboard', 'admin', '2024-03-10 21:15:49', 'admin', '2024-03-10 21:24:53', '游戏玩法菜单');
INSERT INTO `sys_menu` VALUES (2014, '游戏玩法查询', 2013, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:betType:query', '#', 'admin', '2024-03-10 21:15:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '游戏玩法新增', 2013, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:betType:add', '#', 'admin', '2024-03-10 21:15:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '游戏玩法修改', 2013, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:betType:edit', '#', 'admin', '2024-03-10 21:15:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '游戏玩法删除', 2013, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:betType:remove', '#', 'admin', '2024-03-10 21:15:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '游戏玩法导出', 2013, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:betType:export', '#', 'admin', '2024-03-10 21:15:49', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-03-05 21:03:11', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-03-05 21:03:11', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 224 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2024-03-05 21:03:11\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 21:06:00', 0);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-03-05 21:03:11\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":99,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 21:38:02', 9);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-03-05 21:03:11\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":98,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 21:38:10', 0);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-03-05 21:03:11\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":97,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 21:38:19', 5);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"游戏管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"game\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 21:39:29', 12);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_game\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 21:39:50', 69);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_game\"}', NULL, 0, NULL, '2024-03-05 21:40:23', 234);
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/game/index\",\"createTime\":\"2024-03-05 21:41:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"游戏\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"game\",\"perms\":\"system:game:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 21:45:35', 12);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/game/index\",\"createTime\":\"2024-03-05 21:41:56\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"游戏\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"game\",\"perms\":\"system:game:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 21:46:33', 7);
INSERT INTO `sys_oper_log` VALUES (109, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"游戏类型\",\"dictType\":\"sys_game_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 20:23:36', 0);
INSERT INTO `sys_oper_log` VALUES (110, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"三球\",\"dictSort\":1,\"dictType\":\"sys_game_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 20:23:54', 8);
INSERT INTO `sys_oper_log` VALUES (111, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"5球\",\"dictSort\":2,\"dictType\":\"sys_game_type\",\"dictValue\":\"5\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 20:24:02', 11);
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"10球\",\"dictSort\":3,\"dictType\":\"sys_game_type\",\"dictValue\":\"10\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 20:24:12', 9);
INSERT INTO `sys_oper_log` VALUES (113, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-06 20:24:12\",\"default\":false,\"dictCode\":102,\"dictLabel\":\"10球\",\"dictSort\":3,\"dictType\":\"sys_game_type\",\"dictValue\":\"10\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"赛车\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 20:24:28', 16);
INSERT INTO `sys_oper_log` VALUES (114, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-06 20:23:54\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"三球\",\"dictSort\":1,\"dictType\":\"sys_game_type\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"加拿大\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 20:24:39', 16);
INSERT INTO `sys_oper_log` VALUES (115, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-06 20:24:02\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"5球\",\"dictSort\":2,\"dictType\":\"sys_game_type\",\"dictValue\":\"5\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"时时彩\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 20:24:44', 17);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_bet_item\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:19:29', 56);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:19:33', 11);
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_game\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:19:37', 40);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"betItem\",\"className\":\"SysBetItem\",\"columns\":[{\"capJavaField\":\"BetItemId\",\"columnComment\":\"游戏投注项ID\",\"columnId\":24,\"columnName\":\"bet_item_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"betItemId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GameId\",\"columnComment\":\"游戏ID\",\"columnId\":25,\"columnName\":\"game_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gameId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BetItemType\",\"columnComment\":\"投注项类别\",\"columnId\":26,\"columnName\":\"bet_item_type\",\"columnType\":\"varchar(2)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"betItemType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BetItemName\",\"columnComment\":\"投注项名\",\"columnId\":27,\"columnName\":\"bet_item_name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:19:48', 15);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_bet_item,sys_game\"}', NULL, 0, NULL, '2024-03-06 21:19:57', 333);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/betItem/index\",\"createTime\":\"2024-03-06 21:24:49\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"游戏投注项\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"betItem\",\"perms\":\"system:betItem:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:25:30', 18);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"betItem\",\"className\":\"SysBetItem\",\"columns\":[{\"capJavaField\":\"BetItemId\",\"columnComment\":\"游戏投注项ID\",\"columnId\":24,\"columnName\":\"bet_item_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"betItemId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:19:48\",\"usableColumn\":false},{\"capJavaField\":\"GameId\",\"columnComment\":\"游戏ID\",\"columnId\":25,\"columnName\":\"game_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gameId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:19:48\",\"usableColumn\":false},{\"capJavaField\":\"BetItemType\",\"columnComment\":\"投注项类别\",\"columnId\":26,\"columnName\":\"bet_item_type\",\"columnType\":\"varchar(2)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"betItemType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:19:48\",\"usableColumn\":false},{\"capJavaField\":\"BetItemName\",\"columnComment\":\"投注项名\",\"columnId\":27,\"columnName\":\"bet_item_name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:27:18', 52);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"game\",\"className\":\"SysGame\",\"columns\":[{\"capJavaField\":\"GameId\",\"columnComment\":\"游戏ID\",\"columnId\":39,\"columnName\":\"game_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GameImg\",\"columnComment\":\"游戏图片\",\"columnId\":40,\"columnName\":\"game_img\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameImg\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GameType\",\"columnComment\":\"游戏类别\",\"columnId\":41,\"columnName\":\"game_type\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:36\",\"dictType\":\"sys_game_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GameName\",\"columnComment\":\"压缩名\",\"columnId\":42,\"columnName\":\"game_name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequire', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:27:54', 46);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_bet_item,sys_game\"}', NULL, 0, NULL, '2024-03-06 21:28:00', 277);
INSERT INTO `sys_oper_log` VALUES (125, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-06 20:23:54\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"3球\",\"dictSort\":1,\"dictType\":\"sys_game_type\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"加拿大\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:29:04', 13);
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"game\",\"className\":\"SysGame\",\"columns\":[{\"capJavaField\":\"GameId\",\"columnComment\":\"游戏ID\",\"columnId\":39,\"columnName\":\"game_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:27:54\",\"usableColumn\":false},{\"capJavaField\":\"GameImg\",\"columnComment\":\"游戏图片\",\"columnId\":40,\"columnName\":\"game_img\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameImg\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:27:54\",\"usableColumn\":false},{\"capJavaField\":\"GameType\",\"columnComment\":\"游戏类别\",\"columnId\":41,\"columnName\":\"game_type\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:36\",\"dictType\":\"sys_game_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:27:54\",\"usableColumn\":false},{\"capJavaField\":\"GameName\",\"columnComment\":\"压缩名\",\"columnId\":42,\"columnName\":\"game_name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"in', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:30:18', 40);
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"game\",\"className\":\"SysGame\",\"columns\":[{\"capJavaField\":\"GameId\",\"columnComment\":\"游戏ID\",\"columnId\":39,\"columnName\":\"game_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:30:18\",\"usableColumn\":false},{\"capJavaField\":\"GameImg\",\"columnComment\":\"游戏图片\",\"columnId\":40,\"columnName\":\"game_img\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameImg\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:30:18\",\"usableColumn\":false},{\"capJavaField\":\"GameType\",\"columnComment\":\"游戏类别\",\"columnId\":41,\"columnName\":\"game_type\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:36\",\"dictType\":\"sys_game_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:30:18\",\"usableColumn\":false},{\"capJavaField\":\"GameName\",\"columnComment\":\"压缩名\",\"columnId\":42,\"columnName\":\"game_name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"in', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:31:43', 32);
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"betItem\",\"className\":\"SysBetItem\",\"columns\":[{\"capJavaField\":\"BetItemId\",\"columnComment\":\"游戏投注项ID\",\"columnId\":24,\"columnName\":\"bet_item_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"betItemId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:27:18\",\"usableColumn\":false},{\"capJavaField\":\"GameId\",\"columnComment\":\"游戏ID\",\"columnId\":25,\"columnName\":\"game_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gameId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:27:18\",\"usableColumn\":false},{\"capJavaField\":\"BetItemType\",\"columnComment\":\"投注项类别\",\"columnId\":26,\"columnName\":\"bet_item_type\",\"columnType\":\"varchar(2)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"betItemType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:27:18\",\"usableColumn\":false},{\"capJavaField\":\"BetItemName\",\"columnComment\":\"投注项名\",\"columnId\":27,\"columnName\":\"bet_item_name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:32:44', 34);
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_bet_item,sys_game\"}', NULL, 0, NULL, '2024-03-06 21:33:05', 153);
INSERT INTO `sys_oper_log` VALUES (130, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"游戏投注项状态\",\"dictType\":\"sys_bet_item_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:35:03', 1);
INSERT INTO `sys_oper_log` VALUES (131, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"正常\",\"dictSort\":1,\"dictType\":\"sys_bet_item_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:35:32', 8);
INSERT INTO `sys_oper_log` VALUES (132, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"停用\",\"dictSort\":1,\"dictType\":\"sys_bet_item_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:35:40', 4);
INSERT INTO `sys_oper_log` VALUES (133, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:35:32\",\"default\":false,\"dictCode\":103,\"dictLabel\":\"正常\",\"dictSort\":1,\"dictType\":\"sys_bet_item_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:35:58', 7);
INSERT INTO `sys_oper_log` VALUES (134, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:35:40\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"停用\",\"dictSort\":1,\"dictType\":\"sys_bet_item_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:36:03', 7);
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:37:22', 10);
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_game\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:37:29', 47);
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"game\",\"className\":\"SysGame\",\"columns\":[{\"capJavaField\":\"GameId\",\"columnComment\":\"游戏ID\",\"columnId\":62,\"columnName\":\"game_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:37:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GameImg\",\"columnComment\":\"游戏图片\",\"columnId\":63,\"columnName\":\"game_img\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:37:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameImg\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GameType\",\"columnComment\":\"游戏类别\",\"columnId\":64,\"columnName\":\"game_type\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:37:29\",\"dictType\":\"sys_game_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GameName\",\"columnComment\":\"压缩名\",\"columnId\":65,\"columnName\":\"game_name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:37:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequire', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:38:26', 41);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"betItem\",\"className\":\"SysBetItem\",\"columns\":[{\"capJavaField\":\"BetItemId\",\"columnComment\":\"游戏投注项ID\",\"columnId\":24,\"columnName\":\"bet_item_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"betItemId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:32:44\",\"usableColumn\":false},{\"capJavaField\":\"GameId\",\"columnComment\":\"游戏ID\",\"columnId\":25,\"columnName\":\"game_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gameId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:32:44\",\"usableColumn\":false},{\"capJavaField\":\"BetItemType\",\"columnComment\":\"投注项类别\",\"columnId\":26,\"columnName\":\"bet_item_type\",\"columnType\":\"varchar(2)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"betItemType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:32:44\",\"usableColumn\":false},{\"capJavaField\":\"BetItemName\",\"columnComment\":\"投注项名\",\"columnId\":27,\"columnName\":\"bet_item_name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:19:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:38:45', 19);
INSERT INTO `sys_oper_log` VALUES (139, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"游戏状态\",\"dictType\":\"sys_game_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:39:10', 7);
INSERT INTO `sys_oper_log` VALUES (140, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"正常\",\"dictSort\":0,\"dictType\":\"sys_game_status\",\"dictValue\":\"0\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:39:22', 3);
INSERT INTO `sys_oper_log` VALUES (141, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"停用\",\"dictSort\":2,\"dictType\":\"sys_game_status\",\"dictValue\":\"1\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:39:32', 7);
INSERT INTO `sys_oper_log` VALUES (142, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:39:22\",\"default\":false,\"dictCode\":105,\"dictLabel\":\"正常\",\"dictSort\":1,\"dictType\":\"sys_game_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:39:35', 7);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"game\",\"className\":\"SysGame\",\"columns\":[{\"capJavaField\":\"GameId\",\"columnComment\":\"游戏ID\",\"columnId\":62,\"columnName\":\"game_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:37:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:38:26\",\"usableColumn\":false},{\"capJavaField\":\"GameImg\",\"columnComment\":\"游戏图片\",\"columnId\":63,\"columnName\":\"game_img\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:37:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameImg\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:38:26\",\"usableColumn\":false},{\"capJavaField\":\"GameType\",\"columnComment\":\"游戏类别\",\"columnId\":64,\"columnName\":\"game_type\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:37:29\",\"dictType\":\"sys_game_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:38:26\",\"usableColumn\":false},{\"capJavaField\":\"GameName\",\"columnComment\":\"压缩名\",\"columnId\":65,\"columnName\":\"game_name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:37:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"in', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 21:39:48', 34);
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_bet_item,sys_game\"}', NULL, 0, NULL, '2024-03-06 21:39:51', 139);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"game\",\"className\":\"SysGame\",\"columns\":[{\"capJavaField\":\"GameId\",\"columnComment\":\"游戏ID\",\"columnId\":62,\"columnName\":\"game_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:37:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:39:48\",\"usableColumn\":false},{\"capJavaField\":\"GameImg\",\"columnComment\":\"游戏图片\",\"columnId\":63,\"columnName\":\"game_img\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:37:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"gameImg\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:39:48\",\"usableColumn\":false},{\"capJavaField\":\"GameType\",\"columnComment\":\"游戏类别\",\"columnId\":64,\"columnName\":\"game_type\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:37:29\",\"dictType\":\"sys_game_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 21:39:48\",\"usableColumn\":false},{\"capJavaField\":\"GameName\",\"columnComment\":\"压缩名\",\"columnId\":65,\"columnName\":\"game_name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 21:37:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":fa', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 22:00:08', 66);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_game\"}', NULL, 0, NULL, '2024-03-06 22:00:24', 216);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 22:13:26', 28);
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_game\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 22:13:29', 58);
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"game\",\"className\":\"SysGame\",\"columns\":[{\"capJavaField\":\"GameId\",\"columnComment\":\"游戏ID\",\"columnId\":85,\"columnName\":\"game_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 22:13:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GameImg\",\"columnComment\":\"游戏图片\",\"columnId\":86,\"columnName\":\"game_img\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 22:13:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"gameImg\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GameType\",\"columnComment\":\"游戏类别\",\"columnId\":87,\"columnName\":\"game_type\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 22:13:29\",\"dictType\":\"sys_game_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GameMarkId\",\"columnComment\":\"游戏标识ID\",\"columnId\":88,\"columnName\":\"game_mark_id\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 22:13:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 22:15:05', 30);
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_game\"}', NULL, 0, NULL, '2024-03-06 22:15:09', 74);
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"game\",\"className\":\"SysGame\",\"columns\":[{\"capJavaField\":\"GameId\",\"columnComment\":\"游戏ID\",\"columnId\":85,\"columnName\":\"game_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 22:13:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 22:15:05\",\"usableColumn\":false},{\"capJavaField\":\"GameImg\",\"columnComment\":\"游戏图片\",\"columnId\":86,\"columnName\":\"game_img\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 22:13:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"gameImg\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 22:15:05\",\"usableColumn\":false},{\"capJavaField\":\"GameType\",\"columnComment\":\"游戏类别\",\"columnId\":87,\"columnName\":\"game_type\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 22:13:29\",\"dictType\":\"sys_game_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gameType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-03-06 22:15:05\",\"usableColumn\":false},{\"capJavaField\":\"GameMarkId\",\"columnComment\":\"游戏标识ID\",\"columnId\":88,\"columnName\":\"game_mark_id\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-06 22:13:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"incre', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 22:17:26', 86);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_game\"}', NULL, 0, NULL, '2024-03-06 22:17:31', 193);
INSERT INTO `sys_oper_log` VALUES (153, '游戏', 1, 'com.ruoyi.system.controller.SysGameController.add()', 'POST', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-06 22:31:49\",\"endTime\":60,\"gameAliasName\":\"加拿大28\",\"gameCashback\":0,\"gameCommission\":3,\"gameDescribe\":\"【加拿大2.0赔率说明】大/小/单/双：2.0倍（开13/14赔1.5倍）小单/大双：4.6倍小双/大单：4.2倍极大/极小：15倍【特殊赔率】买小或单，开奖为13且赔：1.5倍买大或双，开奖为14且赔：1.5倍下注小单开奖为13中奖回本&nbsp;下注大双开奖为14中奖回本&nbsp;以上所有赔率都包含本金！【上级佣金千分之3】【流水反千分之15】【晚上00:15前系统自动反入账单，个人帐变记录查询】\",\"gameImg\":\"/profile/upload/2024/03/06/jnd2.0_20240306222925A002.jpg\",\"gameMarkId\":\"jnd20\",\"gameName\":\"加拿大2.0\",\"gameType\":3,\"isHidden\":\"N\",\"maxBetAmount\":10000,\"minBetAmount\":2,\"params\":{},\"robotRate\":20,\"sort\":1,\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'game_img\' at row 1\r\n### The error may exist in file [D:\\project\\sharkpay\\ruoyi-system\\target\\classes\\mapper\\system\\SysGameMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGameMapper.insertSysGame-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_game          ( game_img,             game_type,             game_mark_id,             game_name,             game_alias_name,             game_describe,                                                    game_commission,                                       game_cashback,             min_bet_amount,             max_bet_amount,             end_time,             robot_rate,                          sort,             status,             is_hidden,                                       create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,                                       ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ?,                                       ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'game_img\' at row 1\n; Data truncation: Data too long for column \'game_img\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'game_img\' at row 1', '2024-03-06 22:31:49', 40);
INSERT INTO `sys_oper_log` VALUES (154, '游戏', 1, 'com.ruoyi.system.controller.SysGameController.add()', 'POST', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-06 22:33:07\",\"endTime\":60,\"gameAliasName\":\"加拿大28\",\"gameCashback\":0,\"gameCommission\":3,\"gameDescribe\":\"【加拿大2.0赔率说明】大/小/单/双：2.0倍（开13/14赔1.5倍）小单/大双：4.6倍小双/大单：4.2倍极大/极小：15倍【特殊赔率】买小或单，开奖为13且赔：1.5倍买大或双，开奖为14且赔：1.5倍下注小单开奖为13中奖回本&nbsp;下注大双开奖为14中奖回本&nbsp;以上所有赔率都包含本金！【上级佣金千分之3】【流水反千分之15】【晚上00:15前系统自动反入账单，个人帐变记录查询】\",\"gameImg\":\"/profile/upload/2024/03/06/jnd2.0_20240306222925A002.jpg\",\"gameMarkId\":\"jnd20\",\"gameName\":\"加拿大2.0\",\"gameType\":3,\"isHidden\":\"N\",\"maxBetAmount\":10000,\"minBetAmount\":2,\"params\":{},\"robotRate\":20,\"sort\":1,\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'max_bet_amount\' at row 1\r\n### The error may exist in file [D:\\project\\sharkpay\\ruoyi-system\\target\\classes\\mapper\\system\\SysGameMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGameMapper.insertSysGame-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_game          ( game_img,             game_type,             game_mark_id,             game_name,             game_alias_name,             game_describe,                                                    game_commission,                                       game_cashback,             min_bet_amount,             max_bet_amount,             end_time,             robot_rate,                          sort,             status,             is_hidden,                                       create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,                                       ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ?,                                       ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'max_bet_amount\' at row 1\n; Data truncation: Out of range value for column \'max_bet_amount\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'max_bet_amount\' at row 1', '2024-03-06 22:33:07', 5);
INSERT INTO `sys_oper_log` VALUES (155, '游戏', 1, 'com.ruoyi.system.controller.SysGameController.add()', 'POST', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-06 22:33:15\",\"endTime\":60,\"gameAliasName\":\"加拿大28\",\"gameCashback\":0,\"gameCommission\":3,\"gameDescribe\":\"【加拿大2.0赔率说明】大/小/单/双：2.0倍（开13/14赔1.5倍）小单/大双：4.6倍小双/大单：4.2倍极大/极小：15倍【特殊赔率】买小或单，开奖为13且赔：1.5倍买大或双，开奖为14且赔：1.5倍下注小单开奖为13中奖回本&nbsp;下注大双开奖为14中奖回本&nbsp;以上所有赔率都包含本金！【上级佣金千分之3】【流水反千分之15】【晚上00:15前系统自动反入账单，个人帐变记录查询】\",\"gameImg\":\"/profile/upload/2024/03/06/jnd2.0_20240306222925A002.jpg\",\"gameMarkId\":\"jnd20\",\"gameName\":\"加拿大2.0\",\"gameType\":3,\"isHidden\":\"N\",\"maxBetAmount\":10000,\"minBetAmount\":2,\"params\":{},\"robotRate\":20,\"sort\":1,\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'max_bet_amount\' at row 1\r\n### The error may exist in file [D:\\project\\sharkpay\\ruoyi-system\\target\\classes\\mapper\\system\\SysGameMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGameMapper.insertSysGame-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_game          ( game_img,             game_type,             game_mark_id,             game_name,             game_alias_name,             game_describe,                                                    game_commission,                                       game_cashback,             min_bet_amount,             max_bet_amount,             end_time,             robot_rate,                          sort,             status,             is_hidden,                                       create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,                                       ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ?,                                       ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'max_bet_amount\' at row 1\n; Data truncation: Out of range value for column \'max_bet_amount\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'max_bet_amount\' at row 1', '2024-03-06 22:33:15', 2);
INSERT INTO `sys_oper_log` VALUES (156, '游戏', 1, 'com.ruoyi.system.controller.SysGameController.add()', 'POST', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":60,\"gameAliasName\":\"加拿大28\",\"gameCashback\":0,\"gameCommission\":3,\"gameDescribe\":\"【加拿大2.0赔率说明】大/小/单/双：2.0倍（开13/14赔1.5倍）小单/大双：4.6倍小双/大单：4.2倍极大/极小：15倍【特殊赔率】买小或单，开奖为13且赔：1.5倍买大或双，开奖为14且赔：1.5倍下注小单开奖为13中奖回本&nbsp;下注大双开奖为14中奖回本&nbsp;以上所有赔率都包含本金！【上级佣金千分之3】【流水反千分之15】【晚上00:15前系统自动反入账单，个人帐变记录查询】\",\"gameId\":1,\"gameImg\":\"/profile/upload/2024/03/06/jnd2.0_20240306222925A002.jpg\",\"gameMarkId\":\"jnd20\",\"gameName\":\"加拿大2.0\",\"gameType\":3,\"isHidden\":\"N\",\"maxBetAmount\":10000,\"minBetAmount\":2,\"params\":{},\"robotRate\":20,\"sort\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-06 22:34:06', 8);
INSERT INTO `sys_oper_log` VALUES (157, '游戏', 2, 'com.ruoyi.system.controller.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":75,\"gameAliasName\":\"加拿大2.8\",\"gameCashback\":5,\"gameCommission\":0,\"gameDescribe\":\"【加拿大2.8赔率说明】大/小/单/双：2.8倍小单/大双：6倍小双/大单：6倍极大/极小：16倍对子/3&nbsp; &nbsp;顺子/12&nbsp; &nbsp;豹子/60&nbsp;【特殊赔率】开数字13/14/对子/顺子/豹子/ 中奖单注组合回本&nbsp;数字（00/27）：520倍数字（01/26）：240倍数字（02/25）：120倍数字（03/24）：72倍数字（04/23）：48倍数字（05/22）：30倍数字（06/21）：24倍数字（07/20）：19倍数字（08/19）：17倍数字（09/18）：15倍数字（10/17）：14倍数字（11/16）：13倍数字（12/15）：12倍数字（13/14）：12倍以上所有赔率包含本金！&nbsp;大/小/单/双：40000封顶&nbsp;组合：10000封顶&nbsp;极大/极小：10000封顶&nbsp;数字00/27：1000封顶数字1/26：3000封顶对顺子：10000封顶豹子：5000封顶单点数字最高赔付500000【亏损反水】【上级佣金千分之3】【流水回水千分之5】【晚上00:15系统自动反入账单，个人帐变记录查询】\",\"gameId\":2,\"gameImg\":\"/profile/upload/2024/03/09/jnd28_20240309200723A001.jpg\",\"gameMarkId\":\"jnd28\",\"gameName\":\"加拿大2.8\",\"gameType\":3,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":20000,\"minBetAmount\":5,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":2,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 20:07:58\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:07:58', 19);
INSERT INTO `sys_oper_log` VALUES (158, '游戏', 2, 'com.ruoyi.system.controller.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":75,\"gameAliasName\":\"加拿大3.2\",\"gameCashback\":15,\"gameCommission\":0,\"gameDescribe\":\"【加拿大3.2赔率说明】大/小/单/双：3.2倍小单/大双：6.6倍小双/大单：6.6倍极大/极小：15倍【特殊赔率】大小单双 正常赔率3.2倍，开奖结果遇开奖区三个数字其中一个带0或9与开奖结果13或14，中奖回本金。组合，正常赔率6.6倍，开奖结果遇开奖区三个数字其中一个带0或9与开奖结果13或14，中奖回本金。【上级佣金千分之5】【流水反千分之5】\",\"gameId\":3,\"gameImg\":\"/profile/upload/2024/03/09/jnd32_20240309200821A002.jpg\",\"gameMarkId\":\"jnd32\",\"gameName\":\"加拿大3.2\",\"gameType\":3,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":20000,\"minBetAmount\":5,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":4,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 20:08:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:08:44', 19);
INSERT INTO `sys_oper_log` VALUES (159, '游戏', 2, 'com.ruoyi.system.controller.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":20,\"gameAliasName\":\"比特28\",\"gameCashback\":20,\"gameCommission\":10,\"gameDescribe\":\"【澳洲极速2.0赔率说明】大/小/单/双：2.0倍（开13/14赔1.6倍）小单/大双：4.6倍小双/大单：4.2倍极大/极小：15倍【特殊赔率】买小或单，开奖为13且赔：1.6倍买大或双，开奖为14且赔：1.6倍下注小单开奖为13中奖回本&nbsp;下注大双开奖为14中奖回本&nbsp;以上所有赔率都包含本金！【上级佣金千分之3】【流水反千分之20】【晚上00:15前系统自动反入账单，个人帐变记录查询】\",\"gameId\":4,\"gameImg\":\"/profile/upload/2024/03/09/jspc28_20240309200907A003.png\",\"gameMarkId\":\"jspc28\",\"gameName\":\"比特2.0\",\"gameType\":3,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":20000,\"minBetAmount\":2,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":6,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 20:09:58\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:09:58', 7);
INSERT INTO `sys_oper_log` VALUES (160, '游戏', 2, 'com.ruoyi.system.controller.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":20,\"gameAliasName\":\"比特2.8\",\"gameCashback\":5,\"gameCommission\":5,\"gameDescribe\":\"【澳洲极速2.8赔率说明】大/小/单/双：2.8倍小单/大双：6倍小双/大单：6倍极大/极小：15倍对子/3&nbsp; &nbsp;顺子/12&nbsp; &nbsp;豹子/50&nbsp;【特殊赔率】开数字13/14/对子/顺子/豹子/ 中奖单注组合回本&nbsp;数字（00/27）：500倍数字（01/26）：240倍数字（02/25）：120倍数字（03/24）：72倍数字（04/23）：48倍数字（05/22）：33倍数字（06/21）：25倍数字（07/20）：20倍数字（08/19）：17倍数字（09/18）：15倍数字（10/17）：14倍数字（11/16）：14倍数字（12/15）：13倍数字（13/14）：12倍以上所有赔率包含本金！&nbsp;大/小/单/双：40000封顶&nbsp;组合：10000封顶&nbsp;极大/极小：10000封顶&nbsp;数字00/27：1000封顶数字1/26：3000封顶对顺子：10000封顶豹子：5000封顶单点数字最高赔付500000【上级佣金千分之3】【流水回水千分之5】【晚上00:15系统自动反入账单，个人帐变记录查询】\",\"gameId\":5,\"gameImg\":\"/profile/upload/2024/03/09/bt28_20240309201046A004.png\",\"gameMarkId\":\"bt28\",\"gameName\":\"比特2.8\",\"gameType\":3,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":50000,\"minBetAmount\":5,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":5,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 20:11:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:11:13', 8);
INSERT INTO `sys_oper_log` VALUES (161, '游戏', 2, 'com.ruoyi.system.controller.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":20,\"gameAliasName\":\"极速赛车\",\"gameCashback\":5,\"gameCommission\":10,\"gameDescribe\":\"【澳洲极速赛车赔率说明】&nbsp;&nbsp;【赔率说明】&nbsp;大/小/单/双：1.98倍10车号：9.9倍龙/虎：1.98倍冠亚和 大/双：2.1倍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小/单：1.7倍&nbsp;3/4/18/19：41倍&nbsp;5/6/16/17：20倍&nbsp;7/8/14/15：13倍&nbsp;9/10/12/13：9倍&nbsp;11：含本7倍&nbsp;&nbsp;以上所有赔率都包含本金！1~10名猜大小单双开出之号码：1/2/3/4/5为小，6/7/8/9/10为大。开出的号码偶数为双，号码奇数为单。&nbsp;猜号码&nbsp;每一号码为一竞猜组，开奖结果【竞猜号码】对应所猜【赛道】视为中奖，其余情形视为不中奖。&nbsp;猜龙虎&nbsp;第1名vs第10名，第2名vs第9名，第3名vs第8名，第4名vs第7名，第5名vs第6名，前比后大为龙，反之为虎&nbsp;猜冠亚&nbsp;猜冠军及亚军号码，每次竞猜2个号码，顺序不限。&nbsp;冠亚和值（特码）猜大小单双：冠军号码+亚军号码=冠亚和值=特码=数字3~19，冠亚和值大于或等于12为大，小于或等于11为小。开出的号码偶数为双，号码奇数为单。&nbsp;冠亚和值（特码）猜数字：【冠亚和值】为【特码】可能出现的结果为3~19，竞猜中对应【冠亚和值】数字的视为中奖，其余视为不中奖。&nbsp;【限额说明】&nbsp;&nbsp;总下注：100000封顶&nbsp;大小单双：40000封顶&nbsp;单号码：10000封顶&nbsp;龙/虎：10000封顶【上级佣金千分之3】【流水福利千分之5】【晚上00:15系统自动反入账单，个人帐变记录查询】\",\"gameId\":6,\"gameImg\":\"/profile/upload/2024/03/09/mssc_20240309201138A005.png\",\"gameMarkId\":\"mssc\",\"gameName\":\"极速赛车\",\"gameType\":10,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":50000,\"minBetAmount\":5,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":6,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 20:12:38\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:12:38', 7);
INSERT INTO `sys_oper_log` VALUES (162, '游戏', 2, 'com.ruoyi.system.controller.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":70,\"gameAliasName\":\"澳洲幸运5高赔率\",\"gameCashback\":5,\"gameCommission\":0,\"gameDescribe\":\"【澳洲幸运5&nbsp;9.9赔率说明】【赔率说明】大/小/单/双：1.98倍0-9号：9.9倍龙/虎：1.98倍以上所有赔率都包含本金！【限额说明】总下注：100000封顶大小单双：40000封顶单号码：10000封顶冠亚合：5000封顶【上级佣金千分之3】【流水回水千分之5】\",\"gameId\":7,\"gameImg\":\"/profile/upload/2024/03/09/azxy52_20240309201631A006.jpg\",\"gameMarkId\":\"azxy52\",\"gameName\":\"澳洲幸运5高赔率\",\"gameType\":5,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":100000,\"minBetAmount\":5,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":7,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 20:17:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:17:06', 4);
INSERT INTO `sys_oper_log` VALUES (163, '游戏', 2, 'com.ruoyi.system.controller.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":70,\"gameAliasName\":\"澳洲幸运5\",\"gameCashback\":5,\"gameCommission\":0,\"gameDescribe\":\"【澳洲幸运5&nbsp;9.9赔率说明】【赔率说明】大/小/单/双：1.98倍0-9号：9.9倍龙/虎：1.98倍以上所有赔率都包含本金！【限额说明】总下注：100000封顶大小单双：40000封顶单号码：10000封顶冠亚合：5000封顶【上级佣金千分之3】【流水回水千分之5】\",\"gameId\":8,\"gameImg\":\"/profile/upload/2024/03/09/azxy5_20240309201732A007.jpg\",\"gameMarkId\":\"azxy5\",\"gameName\":\"澳洲幸运5\",\"gameType\":5,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":100000,\"minBetAmount\":5,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":8,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 20:18:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:18:04', 7);
INSERT INTO `sys_oper_log` VALUES (164, '游戏', 2, 'com.ruoyi.system.controller.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":70,\"gameAliasName\":\"澳洲幸运10\",\"gameCashback\":0,\"gameCommission\":0,\"gameDescribe\":\"【澳洲幸运10&nbsp; 9.9赔率说明】&nbsp;&nbsp;【赔率说明】&nbsp;大/小/单/双：1.98倍10车号：9.9倍龙/虎：1.98倍冠亚和 大/双：2.1倍&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;小/单：1.7倍&nbsp;3/4/18/19：41倍&nbsp;5/6/16/17：20倍&nbsp;7/8/14/15：13倍&nbsp;9/10/12/13：9倍&nbsp;11：含本7倍&nbsp;&nbsp;以上所有赔率都包含本金！1~10名猜大小单双开出之号码：1/2/3/4/5为小，6/7/8/9/10为大。开出的号码偶数为双，号码奇数为单。&nbsp;猜号码&nbsp;每一号码为一竞猜组，开奖结果【竞猜号码】对应所猜【赛道】视为中奖，其余情形视为不中奖。&nbsp;猜龙虎&nbsp;第1名vs第10名，第2名vs第9名，第3名vs第8名，第4名vs第7名，第5名vs第6名，前比后大为龙，反之为虎&nbsp;猜冠亚&nbsp;猜冠军及亚军号码，每次竞猜2个号码，顺序不限。&nbsp;冠亚和值（特码）猜大小单双：冠军号码+亚军号码=冠亚和值=特码=数字3~19，冠亚和值大于或等于12为大，小于或等于11为小。开出的号码偶数为双，号码奇数为单。&nbsp;冠亚和值（特码）猜数字：【冠亚和值】为【特码】可能出现的结果为3~19，竞猜中对应【冠亚和值】数字的视为中奖，其余视为不中奖。&nbsp;【限额说明】&nbsp;&nbsp;总下注：100000封顶&nbsp;大小单双：40000封顶&nbsp;单号码：10000封顶&nbsp;龙/虎：10000封顶【上级佣金千分之3】【流水回水千分之5】\",\"gameId\":9,\"gameImg\":\"/profile/upload/2024/03/09/azxy10_20240309201831A008.jpg\",\"gameMarkId\":\"azxy10\",\"gameName\":\"澳洲幸运10\",\"gameType\":10,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":300000,\"minBetAmount\":5,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":9,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 20:19:19\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:19:19', 8);
INSERT INTO `sys_oper_log` VALUES (165, '游戏', 2, 'com.ruoyi.system.controller.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":70,\"gameAliasName\":\"澳洲幸运10高赔率\",\"gameCashback\":5,\"gameCommission\":0,\"gameDescribe\":\"【澳洲幸运10&nbsp; 9.9赔率说明】&nbsp;&nbsp;【赔率说明】&nbsp;大/小/单/双：1.98倍10车号：9.9倍龙/虎：1.98倍冠亚和 大/双：2.1倍&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;小/单：1.7倍&nbsp;3/4/18/19：41倍&nbsp;5/6/16/17：20倍&nbsp;7/8/14/15：13倍&nbsp;9/10/12/13：9倍&nbsp;11：含本7倍&nbsp;&nbsp;以上所有赔率都包含本金！1~10名猜大小单双开出之号码：1/2/3/4/5为小，6/7/8/9/10为大。开出的号码偶数为双，号码奇数为单。&nbsp;猜号码&nbsp;每一号码为一竞猜组，开奖结果【竞猜号码】对应所猜【赛道】视为中奖，其余情形视为不中奖。&nbsp;猜龙虎&nbsp;第1名vs第10名，第2名vs第9名，第3名vs第8名，第4名vs第7名，第5名vs第6名，前比后大为龙，反之为虎&nbsp;猜冠亚&nbsp;猜冠军及亚军号码，每次竞猜2个号码，顺序不限。&nbsp;冠亚和值（特码）猜大小单双：冠军号码+亚军号码=冠亚和值=特码=数字3~19，冠亚和值大于或等于12为大，小于或等于11为小。开出的号码偶数为双，号码奇数为单。&nbsp;冠亚和值（特码）猜数字：【冠亚和值】为【特码】可能出现的结果为3~19，竞猜中对应【冠亚和值】数字的视为中奖，其余视为不中奖。&nbsp;【限额说明】&nbsp;&nbsp;总下注：100000封顶&nbsp;大小单双：40000封顶&nbsp;单号码：10000封顶&nbsp;龙/虎：10000封顶【上级佣金千分之3】【流水回水千分之5】\",\"gameId\":10,\"gameImg\":\"/profile/upload/2024/03/09/azxy10_20240309201934A009.jpg\",\"gameMarkId\":\"azxy102\",\"gameName\":\"澳洲幸运10高赔率\",\"gameType\":10,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":300000,\"minBetAmount\":5,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":10,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 20:20:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:20:06', 7);
INSERT INTO `sys_oper_log` VALUES (166, '游戏', 2, 'com.ruoyi.system.controller.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":110,\"gameAliasName\":\"幸运飞艇\",\"gameCashback\":5,\"gameCommission\":0,\"gameDescribe\":\"【幸运飞艇9.9赔率说明】【赔率说明】大/小/单/双：1.98倍（含本金）10车号：9.9倍（含本金）龙/虎：1.98倍（含本金）冠亚和大/双：2.1倍（含本金）小/单：1.7倍（含本金）3/4/18/19：含本41倍5/6/16/17：含本20倍7/8/14/15：含本13倍9/10/12/13：含本9倍11：含本7倍1~10名猜大小单双开出之号码：1/2/3/4/5为小，6/7/8/9/10为大。开出的号码偶数为双，号码奇数为单。&nbsp;猜号码&nbsp;每一号码为一竞猜组，开奖结果【竞猜号码】对应所猜【赛道】视为中奖，其余情形视为不中奖。&nbsp;猜龙虎 br/第1名vs第10名，第2名vs第9名，第3名vs第8名，第4名vs第7名，第5名vs第6名，前比后大为龙，反之为虎&nbsp;猜冠亚&nbsp;猜冠军及亚军号码，每次竞猜2个号码，顺序不限。&nbsp;冠亚和值（特码）猜大小单双：冠军号码+亚军号码=冠亚和值=特码=数字3~19，冠亚和值大于或等于12为大，小于或等于11为小。开出的号码偶数为双，号码奇数为单。&nbsp;冠亚和值（特码）猜数字：【冠亚和值】为【特码】可能出现的结果为3~19，竞猜中对应【冠亚和值】数字的视为中奖，其余视为不中奖。&nbsp;【限额说明】总下注：100000封顶大小单双：40000封顶单号码：10000封顶冠亚合：5000封顶【上级佣金千分之3】【流水回水千分之5】\",\"gameId\":11,\"gameImg\":\"/profile/upload/2024/03/09/xyft_20240309202028A010.jpg\",\"gameMarkId\":\"xyft\",\"gameName\":\"幸运飞艇\",\"gameType\":10,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":20000,\"minBetAmount\":5,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":11,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 20:20:58\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:20:58', 5);
INSERT INTO `sys_oper_log` VALUES (167, '游戏', 2, 'com.ruoyi.system.controller.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":35,\"gameAliasName\":\"168极速赛车\",\"gameCashback\":5,\"gameCommission\":0,\"gameDescribe\":\"【极速赛车9.9赔率说明】&nbsp;&nbsp;【赔率说明】&nbsp;大/小/单/双：1.98倍10车号：9.9倍龙/虎：1.98倍冠亚和 大/双：2.1倍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小/单：1.7倍&nbsp;3/4/18/19：41倍&nbsp;5/6/16/17：20倍&nbsp;7/8/14/15：13倍&nbsp;9/10/12/13：9倍&nbsp;11：含本7倍&nbsp;&nbsp;以上所有赔率都包含本金！1~10名猜大小单双开出之号码：1/2/3/4/5为小，6/7/8/9/10为大。开出的号码偶数为双，号码奇数为单。&nbsp;猜号码&nbsp;每一号码为一竞猜组，开奖结果【竞猜号码】对应所猜【赛道】视为中奖，其余情形视为不中奖。&nbsp;猜龙虎&nbsp;第1名vs第10名，第2名vs第9名，第3名vs第8名，第4名vs第7名，第5名vs第6名，前比后大为龙，反之为虎&nbsp;猜冠亚&nbsp;猜冠军及亚军号码，每次竞猜2个号码，顺序不限。&nbsp;冠亚和值（特码）猜大小单双：冠军号码+亚军号码=冠亚和值=特码=数字3~19，冠亚和值大于或等于12为大，小于或等于11为小。开出的号码偶数为双，号码奇数为单。&nbsp;冠亚和值（特码）猜数字：【冠亚和值】为【特码】可能出现的结果为3~19，竞猜中对应【冠亚和值】数字的视为中奖，其余视为不中奖。&nbsp;【限额说明】&nbsp;&nbsp;总下注：100000封顶&nbsp;大小单双：40000封顶&nbsp;单号码：10000封顶&nbsp;龙/虎：10000封顶【亏损无反水】【上级佣金千分之3】【流水回水千分之5】【晚上00:00系统自动反入账单，个人帐变记录查询】\",\"gameId\":12,\"gameImg\":\"/profile/upload/2024/03/09/jssc_20240309202124A011.jpg\",\"gameMarkId\":\"jssc\",\"gameName\":\"168极速赛车\",\"gameType\":10,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":20000,\"minBetAmount\":5,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":12,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 20:21:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:21:54', 7);
INSERT INTO `sys_oper_log` VALUES (168, '游戏', 2, 'com.ruoyi.system.controller.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":5,\"gameAliasName\":\"168极速飞艇\",\"gameCashback\":5,\"gameCommission\":0,\"gameDescribe\":\"【极速飞艇赔率说明】&nbsp;&nbsp;【赔率说明】&nbsp;大/小/单/双：1.98倍10车号：9.9倍龙/虎：1.98倍冠亚和 大/双：2.1倍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小/单：1.7倍&nbsp;3/4/18/19：41倍&nbsp;5/6/16/17：20倍&nbsp;7/8/14/15：13倍&nbsp;9/10/12/13：9倍&nbsp;11：含本7倍&nbsp;&nbsp;以上所有赔率都包含本金！1~10名猜大小单双开出之号码：1/2/3/4/5为小，6/7/8/9/10为大。开出的号码偶数为双，号码奇数为单。&nbsp;猜号码&nbsp;每一号码为一竞猜组，开奖结果【竞猜号码】对应所猜【赛道】视为中奖，其余情形视为不中奖。&nbsp;猜龙虎&nbsp;第1名vs第10名，第2名vs第9名，第3名vs第8名，第4名vs第7名，第5名vs第6名，前比后大为龙，反之为虎&nbsp;猜冠亚&nbsp;猜冠军及亚军号码，每次竞猜2个号码，顺序不限。&nbsp;冠亚和值（特码）猜大小单双：冠军号码+亚军号码=冠亚和值=特码=数字3~19，冠亚和值大于或等于12为大，小于或等于11为小。开出的号码偶数为双，号码奇数为单。&nbsp;冠亚和值（特码）猜数字：【冠亚和值】为【特码】可能出现的结果为3~19，竞猜中对应【冠亚和值】数字的视为中奖，其余视为不中奖。&nbsp;【限额说明】&nbsp;&nbsp;总下注：100000封顶&nbsp;大小单双：40000封顶&nbsp;单号码：10000封顶&nbsp;龙/虎：10000封顶【上级佣金千分之3】【流水回水千分之5】【晚上00:00系统自动反入账单，个人帐变记录查询】\",\"gameId\":13,\"gameImg\":\"/profile/upload/2024/03/09/jsft_20240309202548A012.jpg\",\"gameMarkId\":\"jsft\",\"gameName\":\"168极速飞艇\",\"gameType\":10,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":50000,\"minBetAmount\":5,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":13,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 20:26:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:26:21', 8);
INSERT INTO `sys_oper_log` VALUES (169, '游戏', 2, 'com.ruoyi.system.controller.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":35,\"gameAliasName\":\"168极速赛车高赔率\",\"gameCashback\":5,\"gameCommission\":0,\"gameDescribe\":\"【极速赛车9.9赔率说明】&nbsp;&nbsp;【赔率说明】&nbsp;大/小/单/双：1.98倍10车号：9.9倍龙/虎：1.98倍冠亚和 大/双：2.1倍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小/单：1.7倍&nbsp;3/4/18/19：41倍&nbsp;5/6/16/17：20倍&nbsp;7/8/14/15：13倍&nbsp;9/10/12/13：9倍&nbsp;11：含本7倍&nbsp;&nbsp;以上所有赔率都包含本金！1~10名猜大小单双开出之号码：1/2/3/4/5为小，6/7/8/9/10为大。开出的号码偶数为双，号码奇数为单。&nbsp;猜号码&nbsp;每一号码为一竞猜组，开奖结果【竞猜号码】对应所猜【赛道】视为中奖，其余情形视为不中奖。&nbsp;猜龙虎&nbsp;第1名vs第10名，第2名vs第9名，第3名vs第8名，第4名vs第7名，第5名vs第6名，前比后大为龙，反之为虎&nbsp;猜冠亚&nbsp;猜冠军及亚军号码，每次竞猜2个号码，顺序不限。&nbsp;冠亚和值（特码）猜大小单双：冠军号码+亚军号码=冠亚和值=特码=数字3~19，冠亚和值大于或等于12为大，小于或等于11为小。开出的号码偶数为双，号码奇数为单。&nbsp;冠亚和值（特码）猜数字：【冠亚和值】为【特码】可能出现的结果为3~19，竞猜中对应【冠亚和值】数字的视为中奖，其余视为不中奖。&nbsp;【限额说明】&nbsp;&nbsp;总下注：100000封顶&nbsp;大小单双：40000封顶&nbsp;单号码：10000封顶&nbsp;龙/虎：10000封顶【亏损无反水】【上级佣金千分之3】【流水回水千分之5】【晚上00:00系统自动反入账单，个人帐变记录查询】\",\"gameId\":14,\"gameImg\":\"/profile/upload/2024/03/09/jssc2_20240309202640A013.jpg\",\"gameMarkId\":\"jssc2\",\"gameName\":\"168极速赛车高赔率\",\"gameType\":10,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":20000,\"minBetAmount\":5,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":14,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 20:27:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:27:06', 7);
INSERT INTO `sys_oper_log` VALUES (170, '游戏', 2, 'com.ruoyi.system.controller.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":35,\"gameAliasName\":\"168极速时时彩\",\"gameCashback\":5,\"gameCommission\":0,\"gameDescribe\":\"【极速时时彩赔率说明】【赔率说明】大/小/单/双：1.98倍0-9号：9.9倍龙/虎：1.98倍以上所有赔率都包含本金！【限额说明】总下注：100000封顶大小单双：40000封顶单号码：10000封顶冠亚合：5000封顶【亏损无反水】【上级佣金千分之3】【流水回水千分之5】【晚上00:00系统自动反入账单，个人帐变记录查询】\",\"gameId\":15,\"gameImg\":\"/profile/upload/2024/03/09/jsssc_20240309202724A014.jpg\",\"gameMarkId\":\"jsssc\",\"gameName\":\"168极速时时彩\",\"gameType\":5,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":100000,\"minBetAmount\":5,\"params\":{},\"remark\":\"\",\"robotRate\":30,\"sort\":15,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 20:27:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:27:56', 6);
INSERT INTO `sys_oper_log` VALUES (171, '游戏', 2, 'com.ruoyi.system.controller.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":110,\"gameAliasName\":\"幸运飞艇高赔率\",\"gameCashback\":5,\"gameCommission\":0,\"gameDescribe\":\"【幸运飞艇9.9赔率说明】【赔率说明】大/小/单/双：1.98倍（含本金）10车号：9.9倍（含本金）龙/虎：1.98倍（含本金）冠亚和大/双：2.1倍（含本金）小/单：1.7倍（含本金）3/4/18/19：含本41倍5/6/16/17：含本20倍7/8/14/15：含本13倍9/10/12/13：含本9倍11：含本7倍1~10名猜大小单双开出之号码：1/2/3/4/5为小，6/7/8/9/10为大。开出的号码偶数为双，号码奇数为单。&nbsp;猜号码&nbsp;每一号码为一竞猜组，开奖结果【竞猜号码】对应所猜【赛道】视为中奖，其余情形视为不中奖。&nbsp;猜龙虎 br/第1名vs第10名，第2名vs第9名，第3名vs第8名，第4名vs第7名，第5名vs第6名，前比后大为龙，反之为虎&nbsp;猜冠亚&nbsp;猜冠军及亚军号码，每次竞猜2个号码，顺序不限。&nbsp;冠亚和值（特码）猜大小单双：冠军号码+亚军号码=冠亚和值=特码=数字3~19，冠亚和值大于或等于12为大，小于或等于11为小。开出的号码偶数为双，号码奇数为单。&nbsp;冠亚和值（特码）猜数字：【冠亚和值】为【特码】可能出现的结果为3~19，竞猜中对应【冠亚和值】数字的视为中奖，其余视为不中奖。&nbsp;【限额说明】总下注：100000封顶大小单双：40000封顶单号码：10000封顶冠亚合：5000封顶【上级佣金千分之3】【流水回水千分之5】\",\"gameId\":16,\"gameImg\":\"/profile/upload/2024/03/09/xyft2_20240309202820A015.jpg\",\"gameMarkId\":\"xyft2\",\"gameName\":\"幸运飞艇高赔率\",\"gameType\":10,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":20000,\"minBetAmount\":5,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":16,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 20:28:47\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:28:47', 8);
INSERT INTO `sys_oper_log` VALUES (172, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-03-05 21:03:11\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012],\"params\":{},\"remark\":\"平台管理员\",\"roleId\":2,\"roleKey\":\"sharkadmin\",\"roleName\":\"平台管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:40:42', 30);
INSERT INTO `sys_oper_log` VALUES (173, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:40:54', 69);
INSERT INTO `sys_oper_log` VALUES (174, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-05 21:03:10\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-03-05 21:03:10\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"平台管理员\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"sharkadmin\",\"roleName\":\"平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"sharkadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 20:41:27', 11);
INSERT INTO `sys_oper_log` VALUES (175, '游戏投注项', 1, 'com.ruoyi.web.controller.system.SysBetItemController.add()', 'POST', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemName\":\"大\",\"createTime\":\"2024-03-09 22:04:05\",\"gameId\":1,\"maxBetAmount\":2.0,\"minBetAmount\":1.0E8,\"odd\":2.04,\"params\":{},\"sort\":1,\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'min_bet_amount\' at row 1\r\n### The error may exist in file [D:\\project\\sharkpay\\ruoyi-system\\target\\classes\\mapper\\system\\SysBetItemMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysBetItemMapper.insertSysBetItem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_bet_item          ( game_id,                          bet_item_name,             bet_item_describe,             odd,             min_bet_amount,             max_bet_amount,             sort,             status,                          create_time )           values ( ?,                          ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'min_bet_amount\' at row 1\n; Data truncation: Out of range value for column \'min_bet_amount\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'min_bet_amount\' at row 1', '2024-03-09 22:04:05', 45);
INSERT INTO `sys_oper_log` VALUES (176, '游戏投注项', 1, 'com.ruoyi.web.controller.system.SysBetItemController.add()', 'POST', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemName\":\"大\",\"createTime\":\"2024-03-09 22:04:52\",\"gameId\":1,\"maxBetAmount\":2.0,\"minBetAmount\":1.0E8,\"odd\":2.04,\"params\":{},\"sort\":1,\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'bet_item_type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\project\\sharkpay\\ruoyi-system\\target\\classes\\mapper\\system\\SysBetItemMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysBetItemMapper.insertSysBetItem-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_bet_item          ( game_id,                          bet_item_name,             bet_item_describe,             odd,             min_bet_amount,             max_bet_amount,             sort,             status,                          create_time )           values ( ?,                          ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'bet_item_type\' doesn\'t have a default value\n; Field \'bet_item_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'bet_item_type\' doesn\'t have a default value', '2024-03-09 22:04:52', 17);
INSERT INTO `sys_oper_log` VALUES (177, '游戏投注项', 1, 'com.ruoyi.web.controller.system.SysBetItemController.add()', 'POST', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":1,\"betItemName\":\"大\",\"createTime\":\"2024-03-09 22:05:43\",\"gameId\":1,\"maxBetAmount\":2.0,\"minBetAmount\":1.0E8,\"odd\":2.04,\"params\":{},\"sort\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 22:05:43', 7);
INSERT INTO `sys_oper_log` VALUES (178, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":1,\"betItemName\":\"大\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":2.0,\"minBetAmount\":1.0E8,\"odd\":2.04,\"params\":{},\"remark\":\"\",\"sort\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 22:07:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 22:07:45', 6);
INSERT INTO `sys_oper_log` VALUES (179, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":1,\"betItemName\":\"大\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":2.0,\"minBetAmount\":999999.9,\"odd\":2.04,\"params\":{},\"remark\":\"\",\"sort\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 22:07:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 22:07:59', 4);
INSERT INTO `sys_oper_log` VALUES (180, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":1,\"betItemName\":\"大\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":2.0,\"minBetAmount\":1000000.0,\"odd\":2.04,\"params\":{},\"remark\":\"\",\"sort\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 22:08:05\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 22:08:05', 4);
INSERT INTO `sys_oper_log` VALUES (181, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":1,\"betItemName\":\"大\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":2.0,\"minBetAmount\":1.0E8,\"odd\":2.04,\"params\":{},\"remark\":\"\",\"sort\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 22:08:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 22:08:59', 5);
INSERT INTO `sys_oper_log` VALUES (182, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":1,\"betItemName\":\"大\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":2.0,\"minBetAmount\":1.0E8,\"odd\":2.04,\"params\":{},\"remark\":\"\",\"sort\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 22:09:20\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 22:09:20', 4);
INSERT INTO `sys_oper_log` VALUES (183, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":1,\"betItemName\":\"大\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":2.0,\"minBetAmount\":99999.0,\"odd\":2.04,\"params\":{},\"remark\":\"\",\"sort\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 22:09:32\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 22:09:32', 5);
INSERT INTO `sys_oper_log` VALUES (184, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":1,\"betItemName\":\"大\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":2.0,\"minBetAmount\":999999.0,\"odd\":2.04,\"params\":{},\"remark\":\"\",\"sort\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 22:09:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 22:09:39', 4);
INSERT INTO `sys_oper_log` VALUES (185, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":1,\"betItemName\":\"大\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":2.0,\"minBetAmount\":9999999.0,\"odd\":2.04,\"params\":{},\"remark\":\"\",\"sort\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 22:09:43\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 22:09:43', 3);
INSERT INTO `sys_oper_log` VALUES (186, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":1,\"betItemName\":\"大\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":2.0,\"minBetAmount\":1.0E8,\"odd\":2.04,\"params\":{},\"remark\":\"\",\"sort\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 22:09:47\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 22:09:48', 4);
INSERT INTO `sys_oper_log` VALUES (187, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":1,\"betItemName\":\"大\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":2,\"minBetAmount\":99999999.99,\"odd\":2.04,\"params\":{},\"remark\":\"\",\"sort\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 22:10:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 22:10:55', 16);
INSERT INTO `sys_oper_log` VALUES (188, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":1,\"betItemName\":\"大\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":2,\"minBetAmount\":9999999.99,\"odd\":2.04,\"params\":{},\"remark\":\"\",\"sort\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 22:11:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 22:11:02', 4);
INSERT INTO `sys_oper_log` VALUES (189, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":1,\"betItemName\":\"大\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":2,\"minBetAmount\":9999.99,\"odd\":2.04,\"params\":{},\"remark\":\"\",\"sort\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-09 22:11:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-09 22:11:09', 4);
INSERT INTO `sys_oper_log` VALUES (190, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_bet_type\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 21:13:57', 58);
INSERT INTO `sys_oper_log` VALUES (191, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"betType\",\"className\":\"SysBetType\",\"columns\":[{\"capJavaField\":\"BetTypeId\",\"columnComment\":\"游戏玩法ID\",\"columnId\":113,\"columnName\":\"bet_type_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-10 21:13:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"betTypeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GameId\",\"columnComment\":\"游戏ID\",\"columnId\":114,\"columnName\":\"game_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-10 21:13:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gameId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BetTypeName\",\"columnComment\":\"游戏玩法名\",\"columnId\":115,\"columnName\":\"bet_type_name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-10 21:13:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"betTypeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":116,\"columnName\":\"sort\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-10 21:13:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 21:14:44', 27);
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_bet_type\"}', NULL, 0, NULL, '2024-03-10 21:14:49', 199);
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/betItem/index\",\"createTime\":\"2024-03-06 21:24:49\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"游戏投注项\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"betItem\",\"perms\":\"system:betItem:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 21:24:30', 17);
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/game/index\",\"createTime\":\"2024-03-05 21:41:56\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"游戏\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"game\",\"perms\":\"system:game:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 21:24:36', 6);
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/game/index\",\"createTime\":\"2024-03-05 21:41:56\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"游戏\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"game\",\"perms\":\"system:game:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 21:24:42', 8);
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/betType/index\",\"createTime\":\"2024-03-10 21:15:49\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"游戏玩法\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"betType\",\"perms\":\"system:betType:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 21:24:53', 6);
INSERT INTO `sys_oper_log` VALUES (197, '游戏玩法', 1, 'com.ruoyi.web.controller.system.SysBetTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/betType', '127.0.0.1', '内网IP', '{\"betTypeId\":1,\"betTypeName\":\"大小单双\",\"createTime\":\"2024-03-10 21:39:44\",\"gameId\":1,\"params\":{},\"sort\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 21:39:44', 19);
INSERT INTO `sys_oper_log` VALUES (198, '游戏玩法', 1, 'com.ruoyi.web.controller.system.SysBetTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/betType', '127.0.0.1', '内网IP', '{\"betTypeId\":2,\"betTypeName\":\"猜数字\",\"createTime\":\"2024-03-10 21:40:13\",\"gameId\":1,\"params\":{},\"sort\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 21:40:13', 11);
INSERT INTO `sys_oper_log` VALUES (199, '游戏玩法', 1, 'com.ruoyi.web.controller.system.SysBetTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/betType', '127.0.0.1', '内网IP', '{\"betTypeId\":3,\"betTypeName\":\"特殊玩法\",\"createTime\":\"2024-03-10 21:40:33\",\"gameId\":1,\"params\":{},\"sort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 21:40:33', 4);
INSERT INTO `sys_oper_log` VALUES (200, '游戏玩法', 2, 'com.ruoyi.web.controller.system.SysBetTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betType', '127.0.0.1', '内网IP', '{\"betTypeId\":2,\"betTypeName\":\"猜数字\",\"createBy\":\"\",\"createTime\":\"2024-03-10 21:40:13\",\"gameId\":1,\"gameName\":\"加拿大2.0\",\"params\":{},\"remark\":\"\",\"sort\":2,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 21:40:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 21:40:37', 6);
INSERT INTO `sys_oper_log` VALUES (201, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":3,\"betItemName\":\"小\",\"betItemType\":\"1\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":2,\"minBetAmount\":9999.99,\"odd\":2.01,\"params\":{},\"remark\":\"\",\"sort\":3,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 22:56:16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 22:56:16', 14);
INSERT INTO `sys_oper_log` VALUES (202, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":4,\"betItemName\":\"单\",\"betItemType\":\"1\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":9999.99,\"odd\":2,\"params\":{},\"remark\":\"\",\"sort\":4,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 22:56:41\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 22:56:41', 3);
INSERT INTO `sys_oper_log` VALUES (203, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":5,\"betItemName\":\"双\",\"betItemType\":\"1\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":9999.99,\"odd\":2,\"params\":{},\"remark\":\"\",\"sort\":5,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 22:56:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 22:56:57', 5);
INSERT INTO `sys_oper_log` VALUES (204, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13]组合小单陪[1]倍，开组合[14]大双陪[1]倍\",\"betItemId\":6,\"betItemName\":\"极大\",\"betItemType\":\"1\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":9999.99,\"odd\":4.6,\"params\":{},\"remark\":\"\",\"sort\":6,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 22:57:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 22:57:13', 5);
INSERT INTO `sys_oper_log` VALUES (205, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"\",\"betItemId\":7,\"betItemName\":\"大单\",\"betItemType\":\"1\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":9999.99,\"odd\":4.2,\"params\":{},\"remark\":\"\",\"sort\":7,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 22:57:34\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 22:57:34', 5);
INSERT INTO `sys_oper_log` VALUES (206, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13]组合小单陪[1]倍，开组合[14]大双陪[1]倍\",\"betItemId\":8,\"betItemName\":\"小单\",\"betItemType\":\"1\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":9999.99,\"odd\":4.6,\"params\":{},\"remark\":\"\",\"sort\":8,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 22:57:50\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 22:57:50', 4);
INSERT INTO `sys_oper_log` VALUES (207, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"\",\"betItemId\":6,\"betItemName\":\"极大\",\"betItemType\":\"1\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":2,\"minBetAmount\":500,\"odd\":15,\"params\":{},\"remark\":\"\",\"sort\":6,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 22:58:18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 22:58:18', 4);
INSERT INTO `sys_oper_log` VALUES (208, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13]组合小单陪[1]倍，开组合[14]大双陪[1]倍\",\"betItemId\":9,\"betItemName\":\"大双\",\"betItemType\":\"1\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":9999.99,\"odd\":4.6,\"params\":{},\"remark\":\"\",\"sort\":9,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 22:58:43\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 22:58:43', 4);
INSERT INTO `sys_oper_log` VALUES (209, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"\",\"betItemId\":10,\"betItemName\":\"小双\",\"betItemType\":\"1\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":9999.99,\"odd\":4.2,\"params\":{},\"remark\":\"\",\"sort\":10,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 22:59:19\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 22:59:19', 5);
INSERT INTO `sys_oper_log` VALUES (210, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":11,\"betItemName\":\"极小\",\"betItemType\":\"1\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":2,\"minBetAmount\":1000,\"odd\":15,\"params\":{},\"remark\":\"\",\"sort\":11,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 22:59:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 22:59:37', 5);
INSERT INTO `sys_oper_log` VALUES (211, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"\",\"betItemId\":12,\"betItemName\":\"0 \",\"betItemType\":\"1\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":1000,\"odd\":500.01,\"params\":{},\"remark\":\"\",\"sort\":12,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 23:02:18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 23:02:18', 6);
INSERT INTO `sys_oper_log` VALUES (212, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":14,\"betItemName\":\"2 \",\"betItemType\":\"1\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":1000,\"odd\":188,\"params\":{},\"remark\":\"\",\"sort\":14,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 23:03:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 23:03:02', 3);
INSERT INTO `sys_oper_log` VALUES (213, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"\",\"betItemId\":12,\"betItemName\":\"0 \",\"betItemType\":\"2\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":1000,\"odd\":500.01,\"params\":{},\"remark\":\"\",\"sort\":12,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 23:03:40\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 23:03:40', 6);
INSERT INTO `sys_oper_log` VALUES (214, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":14,\"betItemName\":\"2 \",\"betItemType\":\"2\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":1000,\"odd\":188,\"params\":{},\"remark\":\"\",\"sort\":14,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 23:03:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 23:03:44', 5);
INSERT INTO `sys_oper_log` VALUES (215, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"开[13][14]赔[1.5]倍\",\"betItemId\":15,\"betItemName\":\"3 \",\"betItemType\":\"2\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":2,\"minBetAmount\":9999.99,\"odd\":2.04,\"params\":{},\"remark\":\"\",\"sort\":15,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 23:11:53\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 23:11:53', 4);
INSERT INTO `sys_oper_log` VALUES (216, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"\",\"betItemId\":13,\"betItemName\":\"1 \",\"betItemType\":\"2\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":9999.99,\"odd\":188,\"params\":{},\"remark\":\"\",\"sort\":13,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 23:17:08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 23:17:08', 6);
INSERT INTO `sys_oper_log` VALUES (217, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"\",\"betItemId\":14,\"betItemName\":\"2 \",\"betItemType\":\"2\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":1000,\"odd\":120,\"params\":{},\"remark\":\"\",\"sort\":14,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 23:17:18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 23:17:18', 5);
INSERT INTO `sys_oper_log` VALUES (218, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"\",\"betItemId\":15,\"betItemName\":\"3 \",\"betItemType\":\"2\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":1000,\"odd\":72,\"params\":{},\"remark\":\"\",\"sort\":15,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 23:17:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 23:17:39', 6);
INSERT INTO `sys_oper_log` VALUES (219, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"\",\"betItemId\":16,\"betItemName\":\"4 \",\"betItemType\":\"2\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":1000,\"odd\":38,\"params\":{},\"remark\":\"\",\"sort\":16,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 23:17:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 23:17:54', 6);
INSERT INTO `sys_oper_log` VALUES (220, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"\",\"betItemId\":17,\"betItemName\":\"5 \",\"betItemType\":\"2\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":1000,\"odd\":30,\"params\":{},\"remark\":\"\",\"sort\":17,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 23:18:07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 23:18:07', 7);
INSERT INTO `sys_oper_log` VALUES (221, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"\",\"betItemId\":18,\"betItemName\":\"6 \",\"betItemType\":\"2\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":1000,\"odd\":24,\"params\":{},\"remark\":\"\",\"sort\":18,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 23:18:23\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 23:18:23', 5);
INSERT INTO `sys_oper_log` VALUES (222, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"\",\"betItemId\":19,\"betItemName\":\"7 \",\"betItemType\":\"2\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":10000,\"odd\":19,\"params\":{},\"remark\":\"\",\"sort\":19,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 23:18:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 23:18:39', 4);
INSERT INTO `sys_oper_log` VALUES (223, '游戏投注项', 2, 'com.ruoyi.web.controller.system.SysBetItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/betItem', '127.0.0.1', '内网IP', '{\"betItemDescribe\":\"\",\"betItemId\":20,\"betItemName\":\"8 \",\"betItemType\":\"2\",\"createBy\":\"\",\"createTime\":\"2024-03-09 22:05:44\",\"gameId\":1,\"maxBetAmount\":5,\"minBetAmount\":10000,\"odd\":17,\"params\":{},\"remark\":\"\",\"sort\":20,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-10 23:19:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-10 23:19:01', 5);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-03-05 21:03:11', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '平台管理员', 'sharkadmin', 2, '2', 1, 1, '0', '0', 'admin', '2024-03-05 21:03:11', 'admin', '2024-03-09 20:40:42', '平台管理员');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-03-10 20:12:29', 'admin', '2024-03-05 21:03:10', '', '2024-03-10 20:12:28', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'sharkadmin', '平台管理员', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$6AO5Mx33xFDoAJ61aQC8F.Tpyc1W/1zCBh9EdE8RTXiFhlAsRdQmK', '0', '0', '127.0.0.1', '2024-03-09 20:41:41', 'admin', '2024-03-05 21:03:10', 'admin', '2024-03-09 20:41:41', '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
