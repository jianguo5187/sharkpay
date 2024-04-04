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

 Date: 04/04/2024 22:27:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adminwin
-- ----------------------------
DROP TABLE IF EXISTS `adminwin`;
CREATE TABLE `adminwin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员盈亏ID',
  `win_time` datetime NOT NULL COMMENT '盈亏时间(YMD)',
  `game_id` bigint(20) NOT NULL COMMENT '游戏ID',
  `game_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏名',
  `win_money` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '今日盈亏金额',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `game_id`(`game_id`, `win_time`) USING BTREE,
  INDEX `win_time`(`win_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员盈亏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adminwin
-- ----------------------------
INSERT INTO `adminwin` VALUES (1, '2024-03-24 00:00:00', 1, NULL, 0.00, '', '2024-03-24 22:50:59', '', NULL, '');
INSERT INTO `adminwin` VALUES (2, '2024-04-01 00:00:00', 9, '澳洲幸运10', 238.00, 'lotteryAzxy10', '2024-04-01 21:30:02', 'lotteryAzxy10', '2024-04-01 22:35:02', '');

-- ----------------------------
-- Table structure for azxy10
-- ----------------------------
DROP TABLE IF EXISTS `azxy10`;
CREATE TABLE `azxy10`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '期数',
  `time` datetime NULL DEFAULT NULL COMMENT '开奖时间',
  `num1` int(11) NULL DEFAULT NULL COMMENT '开奖号码1',
  `num2` int(11) NULL DEFAULT NULL COMMENT '开奖号码2',
  `num3` int(11) NULL DEFAULT NULL COMMENT '开奖号码3',
  `num4` int(11) NULL DEFAULT NULL COMMENT '开奖号码4',
  `num5` int(11) NULL DEFAULT NULL COMMENT '开奖号码5',
  `num6` int(11) NULL DEFAULT NULL COMMENT '开奖号码6',
  `num7` int(11) NULL DEFAULT NULL COMMENT '开奖号码7',
  `num8` int(11) NULL DEFAULT NULL COMMENT '开奖号码8',
  `num9` int(11) NULL DEFAULT NULL COMMENT '开奖号码9',
  `num10` int(11) NULL DEFAULT NULL COMMENT '开奖号码10',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21102363 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '澳洲幸运10开奖历史表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of azxy10
-- ----------------------------
INSERT INTO `azxy10` VALUES (21099729, '2024-03-26 18:58:40', 4, 5, 6, 3, 9, 1, 8, 2, 10, 7, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099730, '2024-03-26 19:03:40', 7, 2, 6, 1, 3, 5, 9, 8, 4, 10, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099731, '2024-03-26 19:08:40', 2, 1, 8, 5, 7, 4, 3, 6, 9, 10, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099732, '2024-03-26 19:13:40', 7, 5, 8, 4, 2, 6, 1, 9, 3, 10, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099733, '2024-03-26 19:18:40', 1, 8, 3, 6, 5, 2, 10, 7, 4, 9, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099734, '2024-03-26 19:23:40', 4, 6, 8, 10, 3, 5, 7, 9, 2, 1, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099735, '2024-03-26 19:28:40', 2, 5, 7, 1, 8, 9, 4, 10, 6, 3, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099736, '2024-03-26 19:33:40', 4, 2, 10, 7, 5, 1, 8, 3, 6, 9, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099737, '2024-03-26 19:38:40', 5, 7, 2, 4, 10, 3, 1, 9, 8, 6, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099738, '2024-03-26 19:43:40', 8, 9, 2, 4, 7, 10, 6, 3, 1, 5, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099739, '2024-03-26 19:48:40', 4, 7, 6, 3, 1, 10, 8, 2, 5, 9, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099740, '2024-03-26 19:53:40', 3, 1, 10, 6, 9, 7, 5, 4, 2, 8, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099741, '2024-03-26 19:58:40', 5, 3, 8, 9, 6, 2, 1, 10, 4, 7, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099742, '2024-03-26 20:03:40', 4, 7, 2, 3, 6, 5, 8, 9, 10, 1, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099743, '2024-03-26 20:08:40', 9, 6, 3, 10, 2, 5, 8, 1, 4, 7, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099744, '2024-03-26 20:13:40', 4, 9, 8, 10, 6, 7, 2, 1, 5, 3, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099745, '2024-03-26 20:18:40', 4, 2, 3, 7, 1, 5, 9, 8, 6, 10, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099746, '2024-03-26 20:23:40', 2, 10, 9, 5, 3, 7, 6, 1, 8, 4, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099747, '2024-03-26 20:28:40', 4, 2, 1, 7, 6, 5, 8, 9, 3, 10, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099748, '2024-03-26 20:33:40', 6, 5, 4, 10, 7, 8, 1, 2, 9, 3, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099749, '2024-03-26 20:38:40', 3, 8, 9, 4, 5, 7, 1, 6, 10, 2, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099750, '2024-03-26 20:43:40', 4, 10, 8, 5, 9, 7, 6, 1, 2, 3, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099751, '2024-03-26 20:48:40', 1, 4, 9, 10, 3, 6, 2, 8, 5, 7, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099752, '2024-03-26 20:53:40', 2, 7, 6, 8, 1, 9, 10, 5, 3, 4, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099753, '2024-03-26 20:58:40', 1, 2, 10, 5, 6, 3, 9, 7, 4, 8, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099754, '2024-03-26 21:03:40', 10, 1, 5, 6, 3, 9, 2, 8, 4, 7, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099755, '2024-03-26 21:08:40', 2, 4, 3, 9, 7, 1, 8, 6, 5, 10, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099756, '2024-03-26 21:13:40', 2, 8, 4, 9, 3, 6, 5, 10, 1, 7, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099757, '2024-03-26 21:18:40', 9, 6, 2, 10, 5, 4, 8, 1, 7, 3, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099758, '2024-03-26 21:23:40', 9, 2, 4, 5, 10, 6, 3, 1, 8, 7, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099759, '2024-03-26 21:28:40', 6, 8, 2, 1, 10, 5, 7, 4, 9, 3, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099760, '2024-03-26 21:33:40', 9, 5, 2, 7, 6, 4, 8, 10, 1, 3, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099761, '2024-03-26 21:38:40', 2, 7, 8, 1, 4, 5, 3, 6, 10, 9, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099762, '2024-03-26 21:43:40', 3, 5, 6, 1, 8, 4, 9, 2, 10, 7, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099763, '2024-03-26 21:48:40', 9, 4, 7, 1, 6, 3, 8, 10, 5, 2, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099764, '2024-03-26 21:53:40', 3, 7, 1, 2, 5, 8, 6, 4, 10, 9, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099765, '2024-03-26 21:58:40', 10, 8, 1, 7, 5, 2, 6, 4, 3, 9, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099766, '2024-03-26 22:03:40', 6, 4, 8, 7, 5, 2, 3, 9, 1, 10, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099767, '2024-03-26 22:08:40', 2, 5, 4, 10, 1, 6, 7, 3, 9, 8, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099768, '2024-03-26 22:13:40', 10, 2, 7, 9, 4, 1, 3, 8, 6, 5, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099769, '2024-03-26 22:18:40', 3, 9, 7, 8, 4, 1, 10, 5, 6, 2, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099770, '2024-03-26 22:23:40', 3, 2, 9, 7, 1, 4, 5, 8, 6, 10, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099771, '2024-03-26 22:28:40', 5, 6, 2, 10, 4, 9, 8, 7, 3, 1, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099772, '2024-03-26 22:33:40', 6, 2, 4, 8, 1, 3, 5, 7, 10, 9, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099773, '2024-03-26 22:38:40', 5, 10, 8, 7, 9, 1, 4, 3, 6, 2, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099774, '2024-03-26 22:43:40', 8, 10, 1, 7, 2, 6, 3, 5, 9, 4, 'TASK', '2024-03-26 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099775, '2024-03-26 22:48:40', 7, 6, 10, 8, 1, 2, 4, 5, 3, 9, 'TASK', '2024-03-26 22:50:01', '', NULL, '');
INSERT INTO `azxy10` VALUES (21099776, '2024-03-26 22:53:40', 8, 7, 9, 4, 6, 10, 3, 1, 5, 2, 'TASK', '2024-03-26 22:55:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100038, '2024-03-27 20:43:40', 10, 2, 9, 3, 7, 4, 8, 5, 6, 1, 'TASK', '2024-03-27 20:48:02', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100039, '2024-03-27 20:48:40', 7, 9, 3, 10, 6, 8, 5, 2, 4, 1, 'TASK', '2024-03-27 20:50:01', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100040, '2024-03-27 20:53:40', 6, 3, 4, 1, 7, 8, 5, 10, 2, 9, 'TASK', '2024-03-27 20:55:01', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100041, '2024-03-27 20:58:40', 7, 9, 6, 10, 3, 4, 2, 8, 5, 1, 'TASK', '2024-03-27 21:00:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100042, '2024-03-27 21:03:40', 1, 2, 5, 8, 10, 3, 9, 6, 4, 7, 'TASK', '2024-03-27 21:05:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100043, '2024-03-27 21:08:40', 6, 8, 10, 2, 5, 3, 7, 4, 1, 9, 'TASK', '2024-03-27 21:10:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100044, '2024-03-27 21:13:40', 1, 6, 9, 10, 4, 2, 3, 8, 5, 7, 'TASK', '2024-03-27 21:15:01', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100045, '2024-03-27 21:18:40', 9, 5, 10, 7, 8, 3, 4, 1, 2, 6, 'TASK', '2024-03-27 21:20:01', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100046, '2024-03-27 21:23:40', 9, 8, 2, 10, 3, 6, 4, 5, 1, 7, 'TASK', '2024-03-27 21:25:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100047, '2024-03-27 21:28:40', 3, 4, 1, 10, 9, 8, 2, 6, 7, 5, 'TASK', '2024-03-27 21:30:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100048, '2024-03-27 21:33:40', 7, 1, 2, 4, 8, 5, 6, 3, 10, 9, 'TASK', '2024-03-27 21:35:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100049, '2024-03-27 21:38:40', 8, 4, 10, 9, 5, 7, 2, 3, 1, 6, 'TASK', '2024-03-27 21:40:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100050, '2024-03-27 21:43:40', 9, 6, 7, 2, 4, 8, 10, 1, 3, 5, 'TASK', '2024-03-27 21:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100051, '2024-03-27 21:48:40', 5, 8, 2, 10, 9, 3, 6, 7, 4, 1, 'TASK', '2024-03-27 21:50:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100052, '2024-03-27 21:53:40', 1, 4, 3, 9, 5, 8, 6, 7, 10, 2, 'TASK', '2024-03-27 21:55:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100053, '2024-03-27 21:58:40', 3, 5, 2, 8, 7, 4, 6, 10, 1, 9, 'TASK', '2024-03-27 22:00:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100054, '2024-03-27 22:03:40', 2, 5, 8, 4, 6, 10, 7, 3, 9, 1, 'TASK', '2024-03-27 22:05:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100055, '2024-03-27 22:08:40', 3, 6, 5, 10, 2, 1, 4, 8, 7, 9, 'TASK', '2024-03-27 22:10:01', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100056, '2024-03-27 22:13:40', 7, 5, 1, 6, 10, 2, 4, 9, 3, 8, 'TASK', '2024-03-27 22:15:09', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100057, '2024-03-27 22:18:40', 5, 2, 8, 4, 3, 9, 10, 1, 6, 7, 'TASK', '2024-03-27 22:20:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100058, '2024-03-27 22:23:40', 3, 1, 10, 7, 2, 8, 4, 6, 5, 9, 'TASK', '2024-03-27 22:25:03', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100059, '2024-03-27 22:28:40', 10, 9, 7, 8, 5, 1, 4, 6, 2, 3, 'TASK', '2024-03-27 22:30:01', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100060, '2024-03-27 22:33:40', 8, 10, 5, 3, 4, 2, 1, 7, 6, 9, 'TASK', '2024-03-27 22:35:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100061, '2024-03-27 22:38:40', 3, 6, 7, 8, 1, 2, 10, 5, 9, 4, 'TASK', '2024-03-27 22:40:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100062, '2024-03-27 22:43:40', 5, 9, 8, 4, 7, 2, 6, 10, 1, 3, 'TASK', '2024-03-27 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100063, '2024-03-27 22:48:40', 3, 10, 9, 6, 5, 4, 1, 2, 7, 8, 'TASK', '2024-03-27 22:50:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100064, '2024-03-27 22:53:40', 3, 5, 9, 1, 6, 10, 4, 7, 2, 8, 'TASK', '2024-03-27 22:55:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100065, '2024-03-27 22:58:40', 7, 4, 6, 8, 9, 10, 5, 1, 3, 2, 'TASK', '2024-03-27 22:59:03', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100066, '2024-03-27 23:03:40', 7, 2, 9, 8, 6, 3, 4, 1, 5, 10, 'TASK', '2024-03-27 23:05:01', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100067, '2024-03-27 23:08:40', 8, 6, 4, 5, 9, 7, 10, 2, 3, 1, 'TASK', '2024-03-27 23:10:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100068, '2024-03-27 23:13:40', 4, 1, 10, 2, 7, 5, 3, 6, 9, 8, 'TASK', '2024-03-27 23:15:01', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100069, '2024-03-27 23:18:40', 6, 4, 10, 5, 7, 2, 3, 8, 9, 1, 'TASK', '2024-03-27 23:20:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100070, '2024-03-27 23:23:40', 2, 4, 6, 7, 3, 1, 5, 8, 10, 9, 'TASK', '2024-03-27 23:25:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100071, '2024-03-27 23:28:40', 5, 10, 3, 9, 7, 4, 2, 6, 1, 8, 'TASK', '2024-03-27 23:30:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100072, '2024-03-27 23:33:40', 8, 9, 10, 4, 7, 3, 2, 1, 5, 6, 'TASK', '2024-03-27 23:35:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100323, '2024-03-28 20:28:40', 3, 6, 9, 10, 1, 5, 7, 2, 8, 4, 'TASK', '2024-03-28 20:33:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100324, '2024-03-28 20:33:40', 4, 5, 8, 10, 3, 1, 2, 6, 9, 7, 'TASK', '2024-03-28 20:35:01', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100325, '2024-03-28 20:38:40', 3, 4, 7, 9, 8, 10, 1, 2, 6, 5, 'TASK', '2024-03-28 20:40:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100326, '2024-03-28 20:43:40', 3, 2, 8, 1, 10, 9, 4, 5, 6, 7, 'TASK', '2024-03-28 20:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100327, '2024-03-28 20:48:40', 8, 1, 3, 4, 6, 9, 5, 2, 7, 10, 'TASK', '2024-03-28 20:50:01', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100328, '2024-03-28 20:53:40', 2, 5, 10, 9, 8, 6, 7, 3, 4, 1, 'TASK', '2024-03-28 20:55:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100329, '2024-03-28 20:58:40', 2, 7, 6, 1, 10, 8, 9, 4, 3, 5, 'TASK', '2024-03-28 21:00:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100330, '2024-03-28 21:03:40', 2, 6, 4, 9, 8, 1, 5, 10, 3, 7, 'TASK', '2024-03-28 21:05:01', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100331, '2024-03-28 21:08:40', 10, 2, 7, 4, 6, 9, 8, 3, 5, 1, 'TASK', '2024-03-28 21:10:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100332, '2024-03-28 21:13:40', 4, 6, 2, 7, 1, 8, 5, 10, 3, 9, 'TASK', '2024-03-28 21:15:02', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100333, '2024-03-28 21:18:40', 3, 6, 7, 1, 8, 5, 2, 4, 9, 10, 'TASK', '2024-03-28 21:20:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100334, '2024-03-28 21:23:40', 3, 5, 8, 4, 10, 1, 6, 7, 9, 2, 'TASK', '2024-03-28 21:25:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100335, '2024-03-28 21:28:40', 6, 7, 9, 8, 3, 1, 10, 5, 2, 4, 'TASK', '2024-03-28 21:30:01', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100336, '2024-03-28 21:33:40', 1, 2, 10, 8, 6, 5, 9, 7, 4, 3, 'TASK', '2024-03-28 21:35:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100337, '2024-03-28 21:38:40', 1, 2, 9, 5, 4, 7, 10, 8, 3, 6, 'TASK', '2024-03-28 21:40:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100338, '2024-03-28 21:43:40', 3, 1, 5, 8, 2, 4, 7, 10, 9, 6, 'TASK', '2024-03-28 21:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100339, '2024-03-28 21:48:40', 3, 10, 9, 2, 5, 6, 4, 1, 7, 8, 'TASK', '2024-03-28 21:50:01', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100340, '2024-03-28 21:53:40', 6, 4, 7, 3, 2, 1, 9, 8, 10, 5, 'TASK', '2024-03-28 21:55:02', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100341, '2024-03-28 21:58:40', 7, 5, 10, 6, 4, 3, 9, 1, 8, 2, 'TASK', '2024-03-28 22:00:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100342, '2024-03-28 22:03:40', 2, 4, 5, 7, 1, 8, 6, 9, 3, 10, 'TASK', '2024-03-28 22:05:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100343, '2024-03-28 22:08:40', 6, 9, 3, 10, 2, 7, 1, 4, 8, 5, 'TASK', '2024-03-28 22:10:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100344, '2024-03-28 22:13:40', 2, 7, 6, 3, 9, 10, 5, 8, 4, 1, 'TASK', '2024-03-28 22:15:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21100345, '2024-03-28 22:18:40', 1, 7, 8, 3, 9, 10, 2, 4, 6, 5, 'TASK', '2024-03-28 22:20:01', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101482, '2024-04-01 21:03:40', 8, 1, 9, 4, 10, 3, 7, 2, 5, 6, 'TASK', '2024-04-01 21:09:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101483, '2024-04-01 21:08:40', 8, 6, 9, 7, 5, 2, 1, 10, 3, 4, 'TASK', '2024-04-01 21:10:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101484, '2024-04-01 21:13:40', 6, 2, 4, 10, 9, 3, 1, 5, 7, 8, 'TASK', '2024-04-01 21:15:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101485, '2024-04-01 21:18:40', 10, 6, 8, 4, 2, 3, 7, 1, 5, 9, 'TASK', '2024-04-01 21:20:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101486, '2024-04-01 21:23:40', 8, 2, 4, 7, 10, 1, 5, 6, 3, 9, 'TASK', '2024-04-01 21:25:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101487, '2024-04-01 21:28:40', 4, 3, 9, 7, 1, 8, 2, 5, 10, 6, 'TASK', '2024-04-01 21:30:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101488, '2024-04-01 21:33:40', 8, 10, 3, 6, 5, 9, 7, 2, 4, 1, 'TASK', '2024-04-01 21:35:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101489, '2024-04-01 21:38:40', 9, 6, 5, 1, 2, 8, 4, 7, 3, 10, 'TASK', '2024-04-01 21:40:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101490, '2024-04-01 21:43:40', 3, 2, 4, 7, 6, 9, 8, 10, 1, 5, 'TASK', '2024-04-01 21:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101491, '2024-04-01 21:48:40', 3, 6, 9, 4, 8, 7, 5, 10, 2, 1, 'TASK', '2024-04-01 21:51:18', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101492, '2024-04-01 21:53:40', 7, 9, 5, 2, 8, 4, 10, 6, 1, 3, 'TASK', '2024-04-01 21:55:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101493, '2024-04-01 21:58:40', 3, 1, 4, 9, 5, 7, 2, 10, 6, 8, 'TASK', '2024-04-01 22:00:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101494, '2024-04-01 22:03:40', 5, 1, 2, 4, 6, 8, 7, 9, 10, 3, 'TASK', '2024-04-01 22:05:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101495, '2024-04-01 22:08:40', 1, 8, 6, 10, 9, 3, 2, 4, 7, 5, 'TASK', '2024-04-01 22:10:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101496, '2024-04-01 22:13:40', 4, 5, 10, 8, 2, 1, 6, 7, 9, 3, 'TASK', '2024-04-01 22:15:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101497, '2024-04-01 22:18:40', 6, 1, 4, 3, 8, 5, 9, 2, 10, 7, 'TASK', '2024-04-01 22:20:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101498, '2024-04-01 22:23:40', 8, 9, 1, 5, 6, 4, 7, 3, 10, 2, 'TASK', '2024-04-01 22:25:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101499, '2024-04-01 22:28:40', 2, 9, 3, 7, 10, 5, 1, 8, 6, 4, 'TASK', '2024-04-01 22:30:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101500, '2024-04-01 22:33:40', 2, 1, 10, 5, 7, 3, 4, 9, 6, 8, 'TASK', '2024-04-01 22:35:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101501, '2024-04-01 22:38:40', 2, 1, 5, 9, 8, 4, 7, 10, 3, 6, 'TASK', '2024-04-01 22:39:18', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101502, '2024-04-01 22:43:40', 6, 3, 1, 5, 8, 9, 4, 2, 10, 7, 'TASK', '2024-04-01 22:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101503, '2024-04-01 22:48:40', 5, 8, 2, 10, 4, 7, 3, 9, 6, 1, 'TASK', '2024-04-01 22:50:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101504, '2024-04-01 22:53:40', 8, 4, 2, 5, 1, 7, 6, 9, 3, 10, 'TASK', '2024-04-01 22:55:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101505, '2024-04-01 22:58:40', 1, 5, 7, 9, 4, 6, 8, 2, 3, 10, 'TASK', '2024-04-01 23:00:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101506, '2024-04-01 23:03:40', 6, 4, 9, 7, 10, 2, 3, 5, 8, 1, 'TASK', '2024-04-01 23:05:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101507, '2024-04-01 23:08:40', 9, 6, 5, 10, 2, 4, 1, 3, 8, 7, 'TASK', '2024-04-01 23:10:01', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101508, '2024-04-01 23:13:40', 9, 10, 2, 5, 6, 7, 1, 8, 3, 4, 'TASK', '2024-04-01 23:15:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101509, '2024-04-01 23:18:40', 7, 9, 4, 6, 8, 2, 5, 10, 3, 1, 'TASK', '2024-04-01 23:19:40', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101510, '2024-04-01 23:23:40', 4, 9, 10, 6, 3, 1, 8, 7, 5, 2, 'TASK', '2024-04-01 23:25:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101511, '2024-04-01 23:28:40', 2, 3, 7, 9, 4, 1, 5, 10, 8, 6, 'TASK', '2024-04-01 23:30:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101512, '2024-04-01 23:33:40', 3, 1, 4, 8, 9, 7, 6, 10, 5, 2, 'TASK', '2024-04-01 23:35:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21101513, '2024-04-01 23:38:40', 2, 8, 7, 5, 10, 6, 1, 9, 4, 3, 'TASK', '2024-04-01 23:40:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102337, '2024-04-04 20:18:40', 2, 6, 9, 1, 3, 7, 10, 5, 8, 4, 'TASK', '2024-04-04 20:22:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102338, '2024-04-04 20:23:40', 10, 8, 3, 9, 5, 6, 7, 2, 4, 1, 'TASK', '2024-04-04 20:25:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102339, '2024-04-04 20:28:40', 1, 5, 10, 2, 9, 4, 7, 8, 3, 6, 'TASK', '2024-04-04 20:30:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102340, '2024-04-04 20:33:40', 2, 6, 9, 5, 1, 10, 4, 3, 7, 8, 'TASK', '2024-04-04 20:35:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102341, '2024-04-04 20:38:40', 5, 4, 2, 9, 3, 6, 10, 1, 7, 8, 'TASK', '2024-04-04 20:40:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102342, '2024-04-04 20:43:40', 6, 9, 2, 1, 7, 10, 3, 4, 5, 8, 'TASK', '2024-04-04 20:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102343, '2024-04-04 20:48:40', 10, 3, 8, 1, 9, 4, 5, 6, 2, 7, 'TASK', '2024-04-04 20:50:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102344, '2024-04-04 20:53:40', 9, 8, 2, 10, 6, 4, 7, 1, 3, 5, 'TASK', '2024-04-04 20:55:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102345, '2024-04-04 20:58:40', 7, 1, 8, 6, 5, 10, 9, 4, 2, 3, 'TASK', '2024-04-04 21:00:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102346, '2024-04-04 21:03:40', 4, 7, 3, 10, 5, 8, 1, 6, 9, 2, 'TASK', '2024-04-04 21:05:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102347, '2024-04-04 21:08:40', 10, 7, 1, 6, 4, 8, 2, 9, 3, 5, 'TASK', '2024-04-04 21:10:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102348, '2024-04-04 21:13:40', 4, 1, 3, 9, 10, 2, 6, 5, 7, 8, 'TASK', '2024-04-04 21:15:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102349, '2024-04-04 21:18:40', 2, 9, 8, 1, 7, 3, 4, 6, 10, 5, 'TASK', '2024-04-04 21:20:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102350, '2024-04-04 21:23:40', 2, 3, 9, 5, 10, 8, 4, 6, 1, 7, 'TASK', '2024-04-04 21:25:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102351, '2024-04-04 21:28:40', 2, 8, 3, 4, 5, 7, 9, 6, 1, 10, 'TASK', '2024-04-04 21:30:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102352, '2024-04-04 21:33:40', 2, 5, 1, 9, 8, 10, 6, 4, 3, 7, 'TASK', '2024-04-04 21:35:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102353, '2024-04-04 21:38:40', 10, 6, 2, 5, 3, 8, 7, 1, 9, 4, 'TASK', '2024-04-04 21:40:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102354, '2024-04-04 21:43:40', 10, 9, 3, 5, 1, 2, 8, 4, 7, 6, 'TASK', '2024-04-04 21:45:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102355, '2024-04-04 21:48:40', 8, 2, 5, 9, 1, 4, 6, 10, 3, 7, 'TASK', '2024-04-04 21:50:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102356, '2024-04-04 21:53:40', 7, 4, 9, 8, 10, 3, 2, 6, 1, 5, 'TASK', '2024-04-04 21:54:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102357, '2024-04-04 21:58:40', 6, 10, 7, 3, 8, 4, 9, 5, 2, 1, 'TASK', '2024-04-04 22:00:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102358, '2024-04-04 22:03:40', 1, 9, 10, 2, 7, 5, 8, 6, 4, 3, 'TASK', '2024-04-04 22:05:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102359, '2024-04-04 22:08:40', 1, 9, 6, 8, 3, 5, 7, 10, 4, 2, 'TASK', '2024-04-04 22:10:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102360, '2024-04-04 22:13:40', 9, 3, 6, 10, 5, 2, 8, 1, 4, 7, 'TASK', '2024-04-04 22:15:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102361, '2024-04-04 22:18:40', 4, 3, 2, 5, 10, 6, 1, 9, 7, 8, 'TASK', '2024-04-04 22:19:00', '', NULL, '');
INSERT INTO `azxy10` VALUES (21102362, '2024-04-04 22:23:40', 4, 3, 9, 6, 10, 8, 5, 2, 7, 1, 'TASK', '2024-04-04 22:25:00', '', NULL, '');

-- ----------------------------
-- Table structure for azxy10kj
-- ----------------------------
DROP TABLE IF EXISTS `azxy10kj`;
CREATE TABLE `azxy10kj`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '期数',
  `num1` int(11) NULL DEFAULT NULL COMMENT '开奖号码1',
  `num2` int(11) NULL DEFAULT NULL COMMENT '开奖号码2',
  `num3` int(11) NULL DEFAULT NULL COMMENT '开奖号码3',
  `num4` int(11) NULL DEFAULT NULL COMMENT '开奖号码4',
  `num5` int(11) NULL DEFAULT NULL COMMENT '开奖号码5',
  `num6` int(11) NULL DEFAULT NULL COMMENT '开奖号码6',
  `num7` int(11) NULL DEFAULT NULL COMMENT '开奖号码7',
  `num8` int(11) NULL DEFAULT NULL COMMENT '开奖号码8',
  `num9` int(11) NULL DEFAULT NULL COMMENT '开奖号码9',
  `num10` int(11) NULL DEFAULT NULL COMMENT '开奖号码10',
  `bet_time` datetime NOT NULL COMMENT '封盘投注截止时间',
  `pre_time` datetime NOT NULL COMMENT '预计开奖时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否已经开奖（0未开奖 1已开奖）',
  `the_time` datetime NULL DEFAULT NULL COMMENT '开奖时间',
  `count_money` int(11) NULL DEFAULT 0 COMMENT '总下注金额',
  `win_money` int(11) NULL DEFAULT 0 COMMENT '总中奖金额',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21101516 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '澳洲幸运10开奖表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of azxy10kj
-- ----------------------------
INSERT INTO `azxy10kj` VALUES (21101487, 4, 3, 9, 7, 1, 8, 2, 5, 10, 6, '2024-04-01 21:27:25', '2024-04-01 21:28:35', '1', '2024-04-01 21:28:40', 0, 0, '', '2024-04-01 21:52:45', '', NULL, '');
INSERT INTO `azxy10kj` VALUES (21101488, 8, 10, 3, 6, 5, 9, 7, 2, 4, 1, '2024-04-01 21:32:25', '2024-04-01 21:33:35', '1', '2024-04-01 21:33:40', 0, 0, '', '2024-04-01 21:52:45', '', NULL, '');
INSERT INTO `azxy10kj` VALUES (21101489, 9, 6, 5, 1, 2, 8, 4, 7, 3, 10, '2024-04-01 21:37:25', '2024-04-01 21:38:35', '1', '2024-04-01 21:38:40', 0, 0, '', '2024-04-01 21:52:45', '', NULL, '');
INSERT INTO `azxy10kj` VALUES (21101490, 3, 2, 4, 7, 6, 9, 8, 10, 1, 5, '2024-04-01 21:42:25', '2024-04-01 21:43:35', '1', '2024-04-01 21:43:40', 0, 0, '', '2024-04-01 21:52:45', '', NULL, '');
INSERT INTO `azxy10kj` VALUES (21101491, 3, 6, 9, 4, 8, 7, 5, 10, 2, 1, '2024-04-01 21:47:25', '2024-04-01 21:48:35', '1', '2024-04-01 21:48:40', 0, 0, '', '2024-04-01 21:52:45', '', NULL, '');
INSERT INTO `azxy10kj` VALUES (21101492, 7, 9, 5, 2, 8, 4, 10, 6, 1, 3, '2024-04-01 21:52:30', '2024-04-01 21:53:40', '1', '2024-04-01 21:53:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 21:52:24', '', '2024-04-01 21:57:10', '');
INSERT INTO `azxy10kj` VALUES (21101493, 3, 1, 4, 9, 5, 7, 2, 10, 6, 8, '2024-04-01 21:57:30', '2024-04-01 21:58:40', '1', '2024-04-01 21:58:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 21:52:24', '', '2024-04-01 22:00:02', '');
INSERT INTO `azxy10kj` VALUES (21101494, 5, 1, 2, 4, 6, 8, 7, 9, 10, 3, '2024-04-01 22:02:30', '2024-04-01 22:03:40', '1', '2024-04-01 22:03:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 21:58:38', '', '2024-04-01 22:05:17', '');
INSERT INTO `azxy10kj` VALUES (21101496, 4, 5, 10, 8, 2, 1, 6, 7, 9, 3, '2024-04-01 22:12:30', '2024-04-01 22:13:40', '1', '2024-04-01 22:13:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 22:14:15', '', '2024-04-01 22:15:02', '');
INSERT INTO `azxy10kj` VALUES (21101497, 6, 1, 4, 3, 8, 5, 9, 2, 10, 7, '2024-04-01 22:17:30', '2024-04-01 22:18:40', '1', '2024-04-01 22:18:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 22:14:15', '', '2024-04-01 22:20:02', '');
INSERT INTO `azxy10kj` VALUES (21101498, 8, 9, 1, 5, 6, 4, 7, 3, 10, 2, '2024-04-01 22:22:30', '2024-04-01 22:23:40', '1', '2024-04-01 22:23:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 22:15:02', '', '2024-04-01 22:25:02', '');
INSERT INTO `azxy10kj` VALUES (21101499, 2, 9, 3, 7, 10, 5, 1, 8, 6, 4, '2024-04-01 22:27:30', '2024-04-01 22:28:40', '1', '2024-04-01 22:28:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 22:20:02', '', '2024-04-01 22:30:02', '');
INSERT INTO `azxy10kj` VALUES (21101500, 2, 1, 10, 5, 7, 3, 4, 9, 6, 8, '2024-04-01 22:32:30', '2024-04-01 22:33:40', '1', '2024-04-01 22:33:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 22:25:19', '', '2024-04-01 22:35:02', '');
INSERT INTO `azxy10kj` VALUES (21101501, 2, 1, 5, 9, 8, 4, 7, 10, 3, 6, '2024-04-01 22:37:50', '2024-04-01 22:39:00', '1', '2024-04-01 22:38:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 22:30:02', '', '2024-04-01 22:39:20', '');
INSERT INTO `azxy10kj` VALUES (21101502, 6, 3, 1, 5, 8, 9, 4, 2, 10, 7, '2024-04-01 22:42:50', '2024-04-01 22:39:00', '1', '2024-04-01 22:43:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 22:35:02', '', '2024-04-01 22:45:02', '');
INSERT INTO `azxy10kj` VALUES (21101503, 5, 8, 2, 10, 4, 7, 3, 9, 6, 1, '2024-04-01 22:47:30', '2024-04-01 22:48:40', '1', '2024-04-01 22:48:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 22:39:20', '', '2024-04-01 22:50:02', '');
INSERT INTO `azxy10kj` VALUES (21101504, 8, 4, 2, 5, 1, 7, 6, 9, 3, 10, '2024-04-01 22:52:30', '2024-04-01 22:53:40', '1', '2024-04-01 22:53:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 22:45:02', '', '2024-04-01 22:55:02', '');
INSERT INTO `azxy10kj` VALUES (21101505, 1, 5, 7, 9, 4, 6, 8, 2, 3, 10, '2024-04-01 22:57:30', '2024-04-01 22:58:40', '1', '2024-04-01 22:58:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 22:50:02', '', '2024-04-01 23:00:02', '');
INSERT INTO `azxy10kj` VALUES (21101506, 6, 4, 9, 7, 10, 2, 3, 5, 8, 1, '2024-04-01 23:02:30', '2024-04-01 23:03:40', '1', '2024-04-01 23:03:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 22:55:02', '', '2024-04-01 23:05:02', '');
INSERT INTO `azxy10kj` VALUES (21101507, 9, 6, 5, 10, 2, 4, 1, 3, 8, 7, '2024-04-01 23:07:30', '2024-04-01 23:08:40', '1', '2024-04-01 23:08:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 23:00:02', '', '2024-04-01 23:10:02', '');
INSERT INTO `azxy10kj` VALUES (21101508, 9, 10, 2, 5, 6, 7, 1, 8, 3, 4, '2024-04-01 23:11:40', '2024-04-01 23:12:50', '1', '2024-04-01 23:13:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 23:12:22', '', '2024-04-01 23:15:02', '');
INSERT INTO `azxy10kj` VALUES (21101509, 7, 9, 4, 6, 8, 2, 5, 10, 3, 1, '2024-04-01 23:17:50', '2024-04-01 23:19:00', '1', '2024-04-01 23:18:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 23:19:15', '', '2024-04-01 23:19:41', '');
INSERT INTO `azxy10kj` VALUES (21101510, 4, 9, 10, 6, 3, 1, 8, 7, 5, 2, '2024-04-01 23:22:50', '2024-04-01 23:24:00', '1', '2024-04-01 23:23:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 23:19:15', '', '2024-04-01 23:25:02', '');
INSERT INTO `azxy10kj` VALUES (21101511, 2, 3, 7, 9, 4, 1, 5, 10, 8, 6, '2024-04-01 23:27:50', '2024-04-01 23:29:00', '1', '2024-04-01 23:28:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 23:27:55', '', '2024-04-01 23:30:02', '');
INSERT INTO `azxy10kj` VALUES (21101512, 3, 1, 4, 8, 9, 7, 6, 10, 5, 2, '2024-04-01 23:32:50', '2024-04-01 23:34:00', '1', '2024-04-01 23:33:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 23:27:55', '', '2024-04-01 23:35:02', '');
INSERT INTO `azxy10kj` VALUES (21101513, 2, 8, 7, 5, 10, 6, 1, 9, 4, 3, '2024-04-01 23:37:50', '2024-04-01 23:39:00', '1', '2024-04-01 23:38:40', 0, 0, 'CreateAzxy10Data', '2024-04-01 23:30:02', '', '2024-04-01 23:40:02', '');
INSERT INTO `azxy10kj` VALUES (21101514, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 23:42:50', '2024-04-01 23:44:00', '0', NULL, 0, 0, 'CreateAzxy10Data', '2024-04-01 23:35:02', '', NULL, '');
INSERT INTO `azxy10kj` VALUES (21101515, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 23:47:50', '2024-04-01 23:49:00', '0', NULL, 0, 0, 'CreateAzxy10Data', '2024-04-01 23:40:02', '', NULL, '');

-- ----------------------------
-- Table structure for azxy10record
-- ----------------------------
DROP TABLE IF EXISTS `azxy10record`;
CREATE TABLE `azxy10record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '下注表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `periods` bigint(20) NOT NULL COMMENT '期数',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '投注状态（0投注 1撤单）',
  `record_time` datetime NOT NULL COMMENT '投注时间',
  `check_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `count_money` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注金额',
  `win_money` float(11, 2) NULL DEFAULT 0.00 COMMENT '中奖金额',
  `type1_big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和大的金额',
  `type1_small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和小的金额',
  `type1_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和单的金额',
  `type1_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和双的金额',
  `type1_num3` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和3的金额',
  `type1_num4` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和4的金额',
  `type1_num5` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和5的金额',
  `type1_num6` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和6的金额',
  `type1_num7` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和7的金额',
  `type1_num8` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和8的金额',
  `type1_num9` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和9的金额',
  `type1_num10` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和10的金额',
  `type1_num11` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和11的金额',
  `type1_num12` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和12的金额',
  `type1_num13` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和13的金额',
  `type1_num14` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和14的金额',
  `type1_num15` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和15的金额',
  `type1_num16` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和16的金额',
  `type1_num17` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和17的金额',
  `type1_num18` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和18的金额',
  `type1_num19` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠亚和19的金额',
  `type2_big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠军大的金额',
  `type2_small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠军小的金额',
  `type2_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠军单的金额',
  `type2_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠军双的金额',
  `type2_loong` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠军龙的金额',
  `type2_tiger` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠军虎的金额',
  `type2_num1` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠军1的金额',
  `type2_num2` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠军2的金额',
  `type2_num3` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠军3的金额',
  `type2_num4` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠军4的金额',
  `type2_num5` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠军5的金额',
  `type2_num6` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠军6的金额',
  `type2_num7` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠军7的金额',
  `type2_num8` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠军8的金额',
  `type2_num9` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠军9的金额',
  `type2_num10` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注冠军10的金额',
  `type3_big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注亚军大的金额',
  `type3_small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注亚军小的金额',
  `type3_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注亚军单的金额',
  `type3_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注亚军双的金额',
  `type3_loong` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注亚军龙的金额',
  `type3_tiger` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注亚军虎的金额',
  `type3_num1` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注亚军1的金额',
  `type3_num2` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注亚军2的金额',
  `type3_num3` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注亚军3的金额',
  `type3_num4` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注亚军4的金额',
  `type3_num5` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注亚军5的金额',
  `type3_num6` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注亚军6的金额',
  `type3_num7` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注亚军7的金额',
  `type3_num8` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注亚军8的金额',
  `type3_num9` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注亚军9的金额',
  `type3_num10` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注亚军10的金额',
  `type4_big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第三名大的金额',
  `type4_small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第三名小的金额',
  `type4_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第三名单的金额',
  `type4_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第三名双的金额',
  `type4_loong` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第三名龙的金额',
  `type4_tiger` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第三名虎的金额',
  `type4_num1` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第三名1的金额',
  `type4_num2` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第三名2的金额',
  `type4_num3` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第三名3的金额',
  `type4_num4` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第三名4的金额',
  `type4_num5` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第三名5的金额',
  `type4_num6` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第三名6的金额',
  `type4_num7` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第三名7的金额',
  `type4_num8` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第三名8的金额',
  `type4_num9` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第三名9的金额',
  `type4_num10` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第三名10的金额',
  `type5_big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第四名大的金额',
  `type5_small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第四名小的金额',
  `type5_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第四名单的金额',
  `type5_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第四名双的金额',
  `type5_loong` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第四名龙的金额',
  `type5_tiger` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第四名虎的金额',
  `type5_num1` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第四名1的金额',
  `type5_num2` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第四名2的金额',
  `type5_num3` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第四名3的金额',
  `type5_num4` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第四名4的金额',
  `type5_num5` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第四名5的金额',
  `type5_num6` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第四名6的金额',
  `type5_num7` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第四名7的金额',
  `type5_num8` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第四名8的金额',
  `type5_num9` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第四名9的金额',
  `type5_num10` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第四名10的金额',
  `type6_big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第五名大的金额',
  `type6_small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第五名小的金额',
  `type6_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第五名单的金额',
  `type6_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第五名双的金额',
  `type6_loong` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第五名龙的金额',
  `type6_tiger` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第五名虎的金额',
  `type6_num1` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第五名1的金额',
  `type6_num2` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第五名2的金额',
  `type6_num3` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第五名3的金额',
  `type6_num4` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第五名4的金额',
  `type6_num5` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第五名5的金额',
  `type6_num6` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第五名6的金额',
  `type6_num7` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第五名7的金额',
  `type6_num8` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第五名8的金额',
  `type6_num9` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第五名9的金额',
  `type6_num10` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第五名10的金额',
  `type7_big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第六名大的金额',
  `type7_small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第六名小的金额',
  `type7_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第六名单的金额',
  `type7_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第六名双的金额',
  `type7_loong` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第六名龙的金额',
  `type7_tiger` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第六名虎的金额',
  `type7_num1` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第六名1的金额',
  `type7_num2` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第六名2的金额',
  `type7_num3` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第六名3的金额',
  `type7_num4` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第六名4的金额',
  `type7_num5` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第六名5的金额',
  `type7_num6` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第六名6的金额',
  `type7_num7` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第六名7的金额',
  `type7_num8` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第六名8的金额',
  `type7_num9` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第六名9的金额',
  `type7_num10` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第六名10的金额',
  `type8_big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第七名大的金额',
  `type8_small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第七名小的金额',
  `type8_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第七名单的金额',
  `type8_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第七名双的金额',
  `type8_loong` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第七名龙的金额',
  `type8_tiger` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第七名虎的金额',
  `type8_num1` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第七名1的金额',
  `type8_num2` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第七名2的金额',
  `type8_num3` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第七名3的金额',
  `type8_num4` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第七名4的金额',
  `type8_num5` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第七名5的金额',
  `type8_num6` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第七名6的金额',
  `type8_num7` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第七名7的金额',
  `type8_num8` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第七名8的金额',
  `type8_num9` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第七名9的金额',
  `type8_num10` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第七名10的金额',
  `type9_big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第八名大的金额',
  `type9_small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第八名小的金额',
  `type9_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第八名单的金额',
  `type9_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第八名双的金额',
  `type9_loong` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第八名龙的金额',
  `type9_tiger` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第八名虎的金额',
  `type9_num1` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第八名1的金额',
  `type9_num2` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第八名2的金额',
  `type9_num3` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第八名3的金额',
  `type9_num4` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第八名4的金额',
  `type9_num5` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第八名5的金额',
  `type9_num6` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第八名6的金额',
  `type9_num7` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第八名7的金额',
  `type9_num8` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第八名8的金额',
  `type9_num9` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第八名9的金额',
  `type9_num10` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第八名10的金额',
  `type10_big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第九名大的金额',
  `type10_small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第九名小的金额',
  `type10_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第九名单的金额',
  `type10_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第九名双的金额',
  `type10_loong` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第九名龙的金额',
  `type10_tiger` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第九名虎的金额',
  `type10_num1` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第九名1的金额',
  `type10_num2` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第九名2的金额',
  `type10_num3` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第九名3的金额',
  `type10_num4` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第九名4的金额',
  `type10_num5` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第九名5的金额',
  `type10_num6` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第九名6的金额',
  `type10_num7` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第九名7的金额',
  `type10_num8` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第九名8的金额',
  `type10_num9` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第九名9的金额',
  `type10_num10` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第九名10的金额',
  `type11_big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第十名大的金额',
  `type11_small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第十名小的金额',
  `type11_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第十名单的金额',
  `type11_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第十名双的金额',
  `type11_loong` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第十名龙的金额',
  `type11_tiger` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第十名虎的金额',
  `type11_num1` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第十名1的金额',
  `type11_num2` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第十名2的金额',
  `type11_num3` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第十名3的金额',
  `type11_num4` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第十名4的金额',
  `type11_num5` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第十名5的金额',
  `type11_num6` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第十名6的金额',
  `type11_num7` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第十名7的金额',
  `type11_num8` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第十名8的金额',
  `type11_num9` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第十名9的金额',
  `type11_num10` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注第十名10的金额',
  `big_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注大单的金额',
  `big_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注大双的金额',
  `small_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注小单的金额',
  `small_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注小双的金额',
  `num1` int(11) NULL DEFAULT NULL COMMENT '开奖号码1',
  `num2` int(11) NULL DEFAULT NULL COMMENT '开奖号码2',
  `num3` int(11) NULL DEFAULT NULL COMMENT '开奖号码3',
  `num4` int(11) NULL DEFAULT NULL COMMENT '开奖号码4',
  `num5` int(11) NULL DEFAULT NULL COMMENT '开奖号码5',
  `num6` int(11) NULL DEFAULT NULL COMMENT '开奖号码6',
  `num7` int(11) NULL DEFAULT NULL COMMENT '开奖号码7',
  `num8` int(11) NULL DEFAULT NULL COMMENT '开奖号码8',
  `num9` int(11) NULL DEFAULT NULL COMMENT '开奖号码9',
  `num10` int(11) NULL DEFAULT NULL COMMENT '开奖号码10',
  `sum_num` int(11) NULL DEFAULT 0 COMMENT '开奖合算数字',
  `is_delete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否扣除(0否 1是)',
  `is_deduct` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否扣除',
  `house` int(4) NOT NULL DEFAULT 0 COMMENT '房间号',
  `hz_id` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否合庄模式',
  `hz_user` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否用户(0否 1是)',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `user_id_2`(`user_id`, `periods`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '澳洲幸运10下注表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of azxy10record
-- ----------------------------
INSERT INTO `azxy10record` VALUES (1, 1, 21101487, '1', '2024-04-01 21:26:13', '2024-04-01 21:39:48', 40.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4, 3, 9, 7, 1, 8, 2, 5, 10, 6, 7, '0', '0', 0, '0', '0', '', NULL, '', '2024-04-01 21:30:02', '');
INSERT INTO `azxy10record` VALUES (2, 1, 21101489, '1', '2024-04-01 21:26:13', '2024-04-01 21:40:02', 40.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 9, 6, 5, 1, 2, 8, 4, 7, 3, 10, 15, '0', '0', 0, '0', '0', '', NULL, '', '2024-04-01 21:40:02', '');
INSERT INTO `azxy10record` VALUES (3, 1, 21101492, '1', '2024-04-01 21:44:19', '2024-04-01 21:58:09', 40.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 7, 9, 5, 2, 8, 4, 10, 6, 1, 3, 16, '0', '0', 0, '0', '0', '', NULL, '', '2024-04-01 21:58:09', '');
INSERT INTO `azxy10record` VALUES (4, 1, 21101494, '1', '2024-04-01 21:59:30', '2024-04-01 22:05:30', 40.00, 21.00, 10.00, 0.00, 0.00, 10.00, 0.00, 10.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5, 1, 2, 4, 6, 8, 7, 9, 10, 3, 6, '0', '0', 0, '0', '0', '', NULL, '', '2024-04-01 22:05:30', '');
INSERT INTO `azxy10record` VALUES (5, 1, 21101498, '1', '2024-04-01 22:17:27', '2024-04-01 22:25:19', 40.00, 21.00, 10.00, 0.00, 0.00, 10.00, 0.00, 10.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 8, 9, 1, 5, 6, 4, 7, 3, 10, 2, 17, '0', '0', 0, '0', '0', '', NULL, '', '2024-04-01 22:25:19', '');
INSERT INTO `azxy10record` VALUES (6, 1, 21101500, '1', '2024-04-01 22:31:20', '2024-04-01 22:35:02', 40.00, 0.00, 10.00, 0.00, 0.00, 10.00, 0.00, 10.00, 0.00, 0.00, 10.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 10, 5, 7, 3, 4, 9, 6, 8, 3, '0', '0', 0, '0', '0', '', NULL, '', '2024-04-01 22:35:02', '');

-- ----------------------------
-- Table structure for bet_record
-- ----------------------------
DROP TABLE IF EXISTS `bet_record`;
CREATE TABLE `bet_record`  (
  `bet_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '投注单ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `periods` bigint(20) NOT NULL COMMENT '期数',
  `record_time` datetime NOT NULL COMMENT '投注时间',
  `time_checkpoint` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '校准时间',
  `game_id` bigint(20) NOT NULL COMMENT '游戏ID',
  `game_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏名',
  `play_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '玩法分类',
  `play_detail` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投注内容',
  `play_group` int(6) NOT NULL DEFAULT 0 COMMENT '游戏种类',
  `option` int(8) NOT NULL DEFAULT 0,
  `money` float(11, 2) UNSIGNED NOT NULL COMMENT '投注金额',
  `balance` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '投注后用户余额',
  `account_result` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '输赢结果',
  `settle_flg` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '结算区分（0未结算 1已结算）',
  `game_result` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '开奖结果',
  `is_delete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否删除(0否 1是)',
  `is_robot` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否机器人下注',
  `robot_nick_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机器人下注昵称',
  `robot_pic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机器人下注头像',
  `robot_img` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机器人下注图片',
  `house_id` int(11) NOT NULL DEFAULT 1 COMMENT '房间号',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`bet_id`) USING BTREE,
  INDEX `game_id`(`game_id`, `user_id`) USING BTREE,
  INDEX `uid`(`user_id`) USING BTREE,
  INDEX `index1`(`game_id`, `periods`, `settle_flg`) USING BTREE,
  INDEX `index2`(`is_delete`, `settle_flg`, `record_time`) USING BTREE,
  INDEX `index3`(`user_id`, `periods`, `play_group`, `option`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `user_id_2`(`user_id`, `periods`, `is_delete`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投注单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bet_record
-- ----------------------------
INSERT INTO `bet_record` VALUES (1, 1, 21101489, '2024-04-01 21:27:13', '2024-04-01 21:35:20', 9, '澳洲幸运10', '冠亚和', '大', 1, 0, 10.00, 538.73, 0.00, '0', '', '0', '0', NULL, NULL, NULL, 1, '', NULL, '', NULL, '');
INSERT INTO `bet_record` VALUES (2, 1, 21101489, '2024-04-01 21:27:13', '2024-04-01 21:35:22', 9, '澳洲幸运10', '冠亚和', '双', 1, 0, 10.00, 528.73, 0.00, '0', '', '0', '0', NULL, NULL, NULL, 1, '', NULL, '', NULL, '');
INSERT INTO `bet_record` VALUES (3, 1, 21101489, '2024-04-01 21:27:13', '2024-04-01 21:35:24', 9, '澳洲幸运10', '冠亚和', '7', 1, 0, 10.00, 518.73, 0.00, '0', '', '0', '0', NULL, NULL, NULL, 1, '', NULL, '', NULL, '');
INSERT INTO `bet_record` VALUES (4, 1, 21101489, '2024-04-01 21:27:13', '2024-04-01 21:35:28', 9, '澳洲幸运10', '冠亚和', '4', 1, 0, 10.00, 508.73, 0.00, '0', '', '0', '0', NULL, NULL, NULL, 1, '', NULL, '', NULL, '');
INSERT INTO `bet_record` VALUES (5, 1, 21101492, '2024-04-01 21:27:13', '2024-04-01 21:53:35', 9, '澳洲幸运10', '冠亚和', '大', 1, 0, 10.00, 519.73, 0.00, '0', '', '0', '0', '', '', '', 1, '', NULL, '', NULL, '');
INSERT INTO `bet_record` VALUES (6, 1, 21101492, '2024-04-01 21:27:13', '2024-04-01 21:53:35', 9, '澳洲幸运10', '冠亚和', '双', 1, 0, 10.00, 509.73, 0.00, '0', '', '0', '0', '', '', '', 1, '', NULL, '', NULL, '');
INSERT INTO `bet_record` VALUES (7, 1, 21101492, '2024-04-01 21:27:13', '2024-04-01 21:53:36', 9, '澳洲幸运10', '冠亚和', '7', 1, 0, 10.00, 499.73, 0.00, '0', '', '0', '0', '', '', '', 1, '', NULL, '', NULL, '');
INSERT INTO `bet_record` VALUES (8, 1, 21101492, '2024-04-01 21:27:13', '2024-04-01 21:53:37', 9, '澳洲幸运10', '冠亚和', '4', 1, 0, 10.00, 489.73, 0.00, '0', '', '0', '0', '', '', '', 1, '', NULL, '', NULL, '');
INSERT INTO `bet_record` VALUES (9, 1, 21101494, '2024-04-01 21:27:13', '2024-04-01 22:01:50', 9, '澳洲幸运10', '冠亚和', '大', 1, 0, 10.00, 479.73, 0.00, '0', '', '0', '0', '', '', '', 1, '', NULL, '', NULL, '');
INSERT INTO `bet_record` VALUES (10, 1, 21101494, '2024-04-01 21:27:13', '2024-04-01 22:01:52', 9, '澳洲幸运10', '冠亚和', '双', 1, 0, 10.00, 469.73, 0.00, '0', '', '0', '0', '', '', '', 1, '', NULL, '', NULL, '');
INSERT INTO `bet_record` VALUES (11, 1, 21101494, '2024-04-01 21:27:13', '2024-04-01 22:01:54', 9, '澳洲幸运10', '冠亚和', '7', 1, 0, 10.00, 459.73, 0.00, '0', '', '0', '0', '', '', '', 1, '', NULL, '', NULL, '');
INSERT INTO `bet_record` VALUES (12, 1, 21101494, '2024-04-01 21:27:13', '2024-04-01 22:01:59', 9, '澳洲幸运10', '冠亚和', '4', 1, 0, 10.00, 449.73, 0.00, '0', '', '0', '0', '', '', '', 1, '', NULL, '', NULL, '');
INSERT INTO `bet_record` VALUES (13, 1, 21101498, '2024-04-01 21:27:13', '2024-04-01 22:21:08', 9, '澳洲幸运10', '冠亚和', '大', 1, 0, 10.00, 460.73, 0.00, '0', '', '0', '0', '', '', '', 1, '', NULL, '', NULL, '');
INSERT INTO `bet_record` VALUES (14, 1, 21101498, '2024-04-01 21:27:13', '2024-04-01 22:21:10', 9, '澳洲幸运10', '冠亚和', '双', 1, 0, 10.00, 450.73, 0.00, '0', '', '0', '0', '', '', '', 1, '', NULL, '', NULL, '');
INSERT INTO `bet_record` VALUES (15, 1, 21101498, '2024-04-01 21:27:13', '2024-04-01 22:21:12', 9, '澳洲幸运10', '冠亚和', '7', 1, 0, 10.00, 440.73, 0.00, '0', '', '0', '0', '', '', '', 1, '', NULL, '', NULL, '');
INSERT INTO `bet_record` VALUES (16, 1, 21101498, '2024-04-01 21:27:13', '2024-04-01 22:21:15', 9, '澳洲幸运10', '冠亚和', '4', 1, 0, 10.00, 430.73, 0.00, '0', '', '0', '0', '', '', '', 1, '', NULL, '', NULL, '');
INSERT INTO `bet_record` VALUES (17, 1, 21101500, '2024-04-01 21:27:13', '2024-04-01 22:35:02', 9, '澳洲幸运10', '冠亚和', '大', 1, 0, 10.00, 441.73, -40.00, '1', '2+1+10+5+7+3+4+9+6+8', '0', '0', '', '', '', 1, '', NULL, '', '2024-04-01 22:35:02', '');
INSERT INTO `bet_record` VALUES (18, 1, 21101500, '2024-04-01 21:27:13', '2024-04-01 22:35:02', 9, '澳洲幸运10', '冠亚和', '双', 1, 0, 10.00, 431.73, -40.00, '1', '2+1+10+5+7+3+4+9+6+8', '0', '0', '', '', '', 1, '', NULL, '', '2024-04-01 22:35:02', '');
INSERT INTO `bet_record` VALUES (19, 1, 21101500, '2024-04-01 21:27:13', '2024-04-01 22:35:02', 9, '澳洲幸运10', '冠亚和', '7', 1, 0, 10.00, 421.73, -40.00, '1', '2+1+10+5+7+3+4+9+6+8', '0', '0', '', '', '', 1, '', NULL, '', '2024-04-01 22:35:02', '');
INSERT INTO `bet_record` VALUES (20, 1, 21101500, '2024-04-01 21:27:13', '2024-04-01 22:35:02', 9, '澳洲幸运10', '冠亚和', '4', 1, 0, 10.00, 411.73, -40.00, '1', '2+1+10+5+7+3+4+9+6+8', '0', '0', '', '', '', 1, '', NULL, '', '2024-04-01 22:35:02', '');

-- ----------------------------
-- Table structure for false_user
-- ----------------------------
DROP TABLE IF EXISTS `false_user`;
CREATE TABLE `false_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机器人昵称',
  `user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机器人账号',
  `robot_pic` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'default.png' COMMENT '机器人头像',
  `robot_bet_money` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机器人投注金额',
  `robot_bet_num` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机器人投注号码',
  `robot_bet_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机器人投注时间',
  `game_id` bigint(20) NULL DEFAULT NULL COMMENT '机器人投注游戏',
  `group_id` int(2) NULL DEFAULT NULL COMMENT '机器人等级id',
  `play_type` int(2) NULL DEFAULT 0 COMMENT '玩法车道:pk10和飞艇默认0，即为冠亚和值，大于零则随机为1-10车道',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user`(`user`) USING BTREE,
  INDEX `Type`(`game_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 317 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '投注机器人' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of false_user
-- ----------------------------
INSERT INTO `false_user` VALUES (232, '疯狂', 'pc001', '/profile/upload/2024/03/17/20231121003517_20240317185234A001.jpg', '1088|1500|2000|1800|2500|280|290|2800|2900', '大|小|单|双|大双|大单|小单|小双|豹子|12', '5', 1, 4, 0, NULL, NULL, NULL, '2024-03-17 18:52:52', NULL);
INSERT INTO `false_user` VALUES (233, 'MISS', 'a1', '/profile/upload/user/61c6ffe59e065.png', '5000|6000|8000|10000|12000|12500', '大单|大|大双|小单|小双|小|12|15', '5', 1, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (234, '传仁', 'a2', '/profile/upload/user/61c6ffd621405.png', '100|200|300|500|1000|1500|1800|1900|2000|2500|3000', '大|小|单|双|大双|小双|小单|大单', '5', 1, 4, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (235, '只是。。。。', 'a3', '/profile/upload/user/61c6ffc13f50e.png', '5000|6000|8000|10000|12000|12500', '大|小|单|双|大单|大双|小单|小双', '5', 1, 4, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (236, '贷款找我', 'a4', '/profile/upload/user/61c6fe0e22eda.png', '1000|1500|1800|1900|2000|2500|3000', '大|小|单|双|大单|大双|小单|小双', '5', 1, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (237, '一颗颗', 'a5', '/profile/upload/user/61c6fdf2ee58b.png', '1000|1500|1800|1900|2000|2500|3000', '小|单|双|大|大单|大双|小单|小双', '5', 1, 3, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (240, '湖广会馆', 'a8', '/profile/upload/user/61c6fde19a091.png', '100|200|300|500|1000|2000', '大|小|单|双|大单|大双|小单|小双', '5', 1, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (241, '汉库克', 'a9', '/profile/upload/user/61c6fdd1048d5.png', '1000|2000|3000', '大|小|单|双|大单|小双|', '5', 1, 4, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (242, 'LOL', 's1', '/profile/upload/user/60560725ed40c.jpeg', '1500|2000|1800|2500|280|290|2800|2900|3000|3500|4000', '大双|小单|小双|大单|大|小|单|双', '5', 1, 6, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (243, '快乐过', 's2', '/profile/upload/user/61c6fdbfde965.png', '5000|2000|3000|8000', '大|小|单| 双|大单|小双|大双|小单', '5', 1, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (244, '网贷秒出款', 's3', '/profile/upload/user/61c6fdacee297.png', '1088|1500|2000|1800|2500|280|290|2800|2900', '大|小|单|双|10|12|11|13|14', '5', 1, 6, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (246, '地毯18659596269', 's4', '/profile/upload/user/61c6fd9444338.png', '5000|10000|12000|15000|20000|15000|18000', '大|小|单|双|大双|大单', '5', 1, 6, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (247, '豪迪有限公司', 's5', '/profile/upload/user/61c6fd73ed6ee.png', '5000|10000|12000|15000|20000', '大双|小单|大单|小双', '5', 1, 7, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (248, '可欧非', 's6', '/profile/upload/user/61c6fd614c930.png', '1500|2000|1800|2500|280|290|2800|2900|3000|3500|4000', '大|小|单|双|大双|小单|大单|小双', '5', 1, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (249, '知足常', 's7', '/profile/upload/user/61c6fd54e073e.png', '2000|3000|4000|5000|4500|6000|6500', '大|小|单|双|绿|蓝|红|大双|大单|小单|小双', '5', 1, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (252, '未秀达', 's8', '/profile/upload/user/61c6fd45c6b84.png', '100|200|500|800|66|88|100|50|120|150|180|200|288|300|500|688', '大|小|单|双|豹子|13|14|龙|虎|合|绿|蓝|红|大双|大单|小单|小双', '5', 1, 2, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (254, '通过', 's9', '/profile/upload/user/61c6fd3534024.png', '500|1000|2000|66|88|100|50|120|150|180|200|288|300|500|688', '大|小|单|双|豹子|13|14|龙|虎|合|绿|蓝|红|大双|大单|小单|小双', '5', 1, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (255, '美人机', 'd1', '/profile/upload/user/61c6fd2834bfb.png', '200|500|800|600|700|150|1500|1800|2000|2500|2800|3300|3200', '大|小|单|双||豹子|13|14|龙|虎|合|绿|蓝|红|大双|大单|小单|小双', '5', 1, 3, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (256, '辉哥ll', 'd2', '/profile/upload/user/61c6fd1b4e7fe.png', '500|300|380|450|600|1200|3000|2500|3600|4000', '大|小|单|双|大双|大单|小单', '5', 1, 3, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (257, '王子金', 'ads1', '/profile/upload/user/61c6fd0ed93a4.png', '100|200|300|400|500|600|700|800', '1|2|3|4|5|6|7|8|9|10', '5', 11, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (259, '品牌加', 'asd1', '/profile/upload/user/61c6fd0231eda.png', '100|200|500|800|600|120|110|1000|1200', '1|2|3|4|5|6|7|8|9|10', '5', 11, 5, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (260, '85发', 'ds1', '/profile/upload/user/61c6fcf364253.png', '50|100|80|99|128|168|200|220|250|300|400', '1|2|3|4|5|6|7|8|9|10', '5', 11, 3, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (261, '长安jj', 'a123', '/profile/upload/user/61c6fce491345.png', '1000|2000|3000|5000', '1|2|3|4|5|6|7|8|9|10', '5', 11, 6, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (262, '阿里看到', 'dsf1', '/profile/upload/user/61c6fcd91f72b.png', '66|88|100|50|120|150|180|200|288|300|500|688', '3|4|5|6|7|8', '5', 9, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (264, '美好好', 'zxc123', '/profile/upload/user/605607637879e.jpeg', '100|200|300|400|500|600|700|800|900|1000', '大|小|双|单|大单|大双|小单|小双', '5', 1, 2, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (266, '水产品招商', 'q1', '/profile/upload/user/61c6fcc454284.png', '2000|3000|5000', '1|2|3|4|5|6|7|8|9|10', '5', 11, 5, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (267, '北冰洋', 'q2', '/profile/upload/user/61c6fb113bdf9.png', '200|300|500|600|1000|800|900|1200|1300', '1|2|3|4|5|6|7|8|9|10', '5', 11, 3, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (268, '胡一好', 'q3', '/profile/upload/user/61c6fafaf0884.png', '1500|2000|1800|2500|280|290|2800|2900|3000|3500|4000', '1|2|3|4|5|6|7|8|9|10', '5', 11, 3, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (269, '继续会', 'q5', '/profile/upload/user/61c6faeed4d8d.png', '200|300|500|100|400|450|600|700', '1|2|3|4|5|6|7|8|9|10', '5', 11, 3, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (270, '卜卜贝', 'q6', '/profile/upload/user/61c6fae098fae.png', '66|88|100|50|120|150|180|200|288|300|500|688', '1|2|3|4|5|6|7|8|9|10', '5', 11, 3, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (271, '高规格', 'q8', '/profile/upload/user/61c6fad484d35.png', '10|50|30|80|100|200|88|150|180', '大|小|单|双|对子|顺子|豹子|13|14|龙|虎|合|绿|蓝|红|大双|大单|小单|小双', '5', 1, 4, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (272, '关二爷', 'q9', '/profile/upload/user/61c6fac4b5a04.png', '1000|2000|3000|1500|2500|3200|3500|3800|4000', '大|小|单|双|豹子|13|14|龙|虎|合|绿|蓝|红|大双|大单|小单|小双', '5', 1, 4, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (273, '不要推塔', 'w1', '/profile/upload/user/61c6fa9148503.png', '1000|2000|3000|5000', '大|小|单|双|豹子|13|14|龙|虎|合|绿|蓝|红|大双|大单|小单|小双', '5', 1, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (274, '欧啦放', 'w3', '/profile/upload/user/61c6fa85f3216.png', '100|200|300|500|600|700|800|900|1000|1200', '大|小|单|双|豹子|13|14|龙|虎|合|绿|蓝|红|大双|大单|小单|小双', '5', 1, 3, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (275, '记忆中', 'w4', '/profile/upload/user/6056058331151.jpeg', '100|200|50|120|88|300|400|380|500|600|', '大|小|单|双|豹子|13|14|龙|虎|合|绿|蓝|红|大双|大单|小单|小双', '5', 1, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (276, '育德急', 'w6', '/profile/upload/user/61c6fa7714726.png', '1500|2000|1800|2500|280|290|2800|2900|3000|3500|4000', '大|小|单|双|大双|大单|小单|小双', '5', 1, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (277, '漂亮了', 'w4', '/profile/upload/user/61c6fa6b8ebc8.png', '10|50|100|200|300', '大|小|单|双|1|2|3|4|5|6|7|8|9|10', '5', 11, 2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (278, '解放军', 'shuaishuai', '/profile/upload/user/61c6fa61e3c67.png', '50|20|30|10|60|66|88|68|100|1000|120|100|10|12|12|120|200|500|600', '1|2|3|4|5|6|7|8|9|10|大|双', '5', 11, 5, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (282, '寂寞的也', 'woshi94', '/profile/upload/user/61c6fa53f38a6.png', '50|100|60|1000|800|10|20|200|500|300|600|400|88|80|120|250|5000|2000|3333|3000', '1|2|3|4|5|6|7|8|9|10|小|双', '5', 11, 4, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (283, '车返点', 'yeyeyey', '/profile/upload/user/61c6fa491c9a1.png', '50|100|60|1000|800|10|20|200|500|300|600|400|88|80|120|250', '1|2|3|4|5|6|7|8|9|10', '5', 11, 3, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (287, '大宝贝', 'qqweryhh988', '/profile/upload/user/61c6fa38b7f52.png', '400|500|600|700|800|1000|1200|1400|1500|1600|1800|2000|2500', '大单|大双|小单|小双|大|小|单|双', '5', 1, 4, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (288, '辉煌国际', 'qqweryhh98800', '/profile/upload/user/61c6fa224371e.png', '450|500|800|900|300|700|688|1200|1100|1500|1800', '大|小|单|双|大|大双|小|小单|单|大单|双|小双', '5', 1, 3, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (289, '有几个看过', 'qqweryhh98866', '/profile/upload/user/61c6fa11d76d2.png', '100|200|300|400|500|600|700|800|900|1000', '大|小|单|双|大双|小单|大单|小双', '5', 1, 3, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (293, '煤化工', 'qqweryhh99955', '/profile/upload/user/61c6fa0845792.png', '100|200|300|400|500|600|700|800|900|1000', '大单|大|大双|小单|小双|小|12|15', '5', 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (294, '快乐规范', 'qqweryhh9886611', '/profile/upload/user/61c6f9fa392ac.png', '2000|3000|4000|5000|4500|6000|6500', '大|大单|单|大|双|大|大双|小单|双|双|小单|单|双|大', '5', 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (295, '健康卡', 'qqweryhh9882222', '/profile/upload/user/61c6f76d1c0e4.png', '2000|3000|4000|5000|4500|6000|6500', '大|大单|小|小双|双|大双|小单|小双|大双|小双|大单|小单', '5', 1, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (296, '万事不', 'qqweryhh988662222', '/profile/upload/user/61c6f76092de8.png', '100|200|300|400|500|600|700|800|900|1000', '大|大单|大|大双|大双|双|单|小单|小双|小|12|15', '5', 1, 4, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (297, '好的交换机', '6666DD', '/profile/upload/user/61c6f7537989f.png', '50|100|80|99|128|168|200|220|250|300|400', '3|4|5|6|18|19', '5', 9, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (298, '好家伙', '444fff', '/profile/upload/user/61c6f722f3c62.jpg', '1000|1500|1800|1900|2000|2500|3000', '1|2|3|4|5|6|7|8|小|双', '5', 9, 4, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (300, '红包过户', 'FFFFE5', '/profile/upload/user/61c6f701577cb.jpg', '1500|2000|1800|2500|2800|2900|3000|3500|4000', '4|5|6|大|单', '5', 9, 5, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (301, '喝不过IgG', '12444', '/profile/upload/user/61c6f6e77ac39.jpg', '50|500|100|300|400', '3|4|5|6|16|17|18|19', '5', 11, 2, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (302, '很好看', '2131', '/profile/upload/user/61c6f6d5c1044.jpg', '50|500|100|300|400|500|600|700|800|900|880|750|650|550', '1|2|3|4|5|6|7|8|9|0', '5', 11, 3, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (303, '卡罗拉', '359989', '/profile/upload/user/61c6f71aa0f41.png', '50|100|200|300|400|500|600|550|150|450|660|680', '1|2|3|4|5|6|7|8|9|10', '5', 9, 2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (304, '那给你', 'zxca111', '/profile/upload/user/61c6f711c9155.png', '100|200|250|220|180', '3|4|18|19|16|17|5|6', '5', 9, 2, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (305, '大锅饭', 'menglu21', '/profile/upload/user/61c6f7073d161.png', '20|50|100|200|300|400|500|600|680', '1|2|3|4|5|6|7|8|9', '5', 9, 5, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (306, '那给你', 'zxca111', '/profile/upload/user/61c6f6ff601ed.png', '100|200|250|220|180', '3|4|18|19|16|17|5|6', '5', 12, 2, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (307, '大锅饭', 'menglu21', '/profile/upload/user/61c6f6f41a3df.png', '20|50|100|200|300|400|500|600|680', '1|2|3|4|5|6|7|8|9', '5', 12, 5, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (308, '卡罗拉', '359989', '/profile/upload/user/61c6f6ea288e1.png', '50|100|200|300|400|500|600|550|150|450|660|680', '1|2|3|4|5|6|7|8|9|10', '5', 13, 2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (309, '那给你', 'zxca111', '/profile/upload/user/61c6f6e0d8b92.png', '100|200|250|220|180', '3|4|18|19|16|17|5|6', '5', 13, 2, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (311, '那给你', 'zxca111', '/profile/upload/user/61c6f6d7920fd.png', '100|200|250|220|180', '3|4|18|19|16|17|5|6', '5', 6, 2, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (312, '卡罗拉', '359989', '/profile/upload/user/61c6f3b411263.jpg', '50|100|200|300|400|500|600|550|150|450|660|680', '1|2|3|4|5|6|7|8|9|10', '5', 6, 2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (313, 'huasd', 'huasd', '/profile/upload/user/61c4f267636e7.jpg', '20|30|50|55', '1|2|3|4|5|6|7|8|9|10', '20', 9, 5, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (314, '痴人说梦', 'azo28001', '/profile/upload/user/61c6ffedc2ecb.png', '1000|150|180|190|200|250|300|200|50|150|500|1888|2000|1666|1111|111|222', '大|小|单|双|大双|大单|小单|小双|豹子|12', '5', 15, 3, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (315, '小奥梅', 'az28s002', '/profile/upload/user/61c6ffedc2ecb.png', '10|20|50|100|80|66|60|120|150|1800|1600|300|400|500|200|100|100|200|200|500', '大|小|单|双|大双|大单|小单|小双', '5', 15, 3, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (316, '是你的心啊', 'ae8888', '/profile/upload/user/62ff496fbf9c8.jpg', '60|80|90|122|116', '大单|小双|小单|小双|大|小|单|双', '20|28|36|52', 15, 5, 1, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (5, 'sys_game', '游戏表', NULL, NULL, 'SysGame', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'game', '游戏', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26', NULL);
INSERT INTO `gen_table` VALUES (6, 'sys_bet_type', '游戏玩法表', NULL, NULL, 'SysBetType', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'betType', '游戏玩法', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-10 21:13:57', '', '2024-03-10 21:14:44', NULL);
INSERT INTO `gen_table` VALUES (7, 'azxy10', '澳洲幸运10开奖历史表', NULL, NULL, 'Azxy10', 'crud', '', 'com.ruoyi.system', 'system', 'azxy10', '澳洲幸运10开奖历史', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-17 16:40:34', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (8, 'azxy10kj', '澳洲幸运10开奖表', NULL, NULL, 'Azxy10kj', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'azxy10kj', '澳洲幸运10开奖', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54', NULL);
INSERT INTO `gen_table` VALUES (11, 'jnd', '加拿大开奖历史表', NULL, NULL, 'Jnd', 'crud', '', 'com.ruoyi.system', 'system', 'jnd', '加拿大开奖历史', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-17 16:40:35', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (12, 'jnd28', '加拿大开奖表', NULL, NULL, 'Jnd28', 'crud', '', 'com.ruoyi.system', 'system', 'jnd28', '加拿大开奖', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-17 16:40:35', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (14, 'jsssc', '极速时时彩开奖历史表', NULL, NULL, 'Jsssc', 'crud', '', 'com.ruoyi.system', 'system', 'jsssc', '极速时时彩开奖历史', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-17 16:40:35', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (15, 'jsssckj', '极速时时彩开奖表', NULL, NULL, 'Jsssckj', 'crud', '', 'com.ruoyi.system', 'system', 'jsssckj', '极速时时彩开奖', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-17 16:40:35', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (17, 'bet_record', '投注单', NULL, NULL, 'BetRecord', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'betRecord', '投注单', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13', NULL);
INSERT INTO `gen_table` VALUES (18, 'false_user', '投注机器人', NULL, NULL, 'FalseUser', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'falseUser', '投注机器人', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-17 17:16:48', '', '2024-03-17 18:35:45', NULL);
INSERT INTO `gen_table` VALUES (21, 'sys_replace', '广告轮播图', NULL, NULL, 'SysReplace', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'replace', '广告轮播图', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47', NULL);
INSERT INTO `gen_table` VALUES (22, 'azxy10record', '澳洲幸运10下注表', NULL, NULL, 'Azxy10record', 'crud', '', 'com.ruoyi.system', 'system', 'azxy10record', '澳洲幸运10下注', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-23 21:12:34', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (23, 'jndrecord', '加拿大下注表', NULL, NULL, 'Jndrecord', 'crud', '', 'com.ruoyi.system', 'system', 'jndrecord', '加拿大下注', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-23 21:12:34', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (28, 'adminwin', '管理员盈亏表', NULL, NULL, 'Adminwin', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'adminwin', '管理员盈亏', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:07', NULL);
INSERT INTO `gen_table` VALUES (29, 'usermoney', '用户资金流水表', NULL, NULL, 'Usermoney', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'usermoney', '用户资金流水', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19', NULL);
INSERT INTO `gen_table` VALUES (30, 'userwin', '用户盈亏表', NULL, NULL, 'Userwin', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'userwin', '用户盈亏', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:27', NULL);
INSERT INTO `gen_table` VALUES (31, 'sys_bet_item', '游戏投注项表', NULL, NULL, 'SysBetItem', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'betItem', '游戏投注项', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28', NULL);
INSERT INTO `gen_table` VALUES (33, 'wave', '数字红绿蓝属性表', NULL, NULL, 'Wave', 'crud', '', 'com.ruoyi.system', 'system', 'wave', '数字红绿蓝属性', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-27 20:56:32', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (34, 'jssscrecord', '极速时时彩下注表', NULL, NULL, 'Jssscrecord', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'jssscrecord', '极速时时彩下注', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1495 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
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
INSERT INTO `gen_table_column` VALUES (123, 7, 'id', '期数', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (124, 7, 'time', '开奖时间', 'datetime', 'Date', 'time', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 2, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (125, 7, 'num1', '开奖号码1', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (126, 7, 'num2', '开奖号码2', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (127, 7, 'num3', '开奖号码3', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (128, 7, 'num4', '开奖号码4', 'int(11)', 'Long', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (129, 7, 'num5', '开奖号码5', 'int(11)', 'Long', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (130, 7, 'num6', '开奖号码6', 'int(11)', 'Long', 'num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (131, 7, 'num7', '开奖号码7', 'int(11)', 'Long', 'num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (132, 7, 'num8', '开奖号码8', 'int(11)', 'Long', 'num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (133, 7, 'num9', '开奖号码9', 'int(11)', 'Long', 'num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (134, 7, 'num10', '开奖号码10', 'int(11)', 'Long', 'num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (135, 7, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (136, 7, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (137, 7, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (138, 7, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (139, 7, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 17, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (140, 8, 'id', '期数', 'bigint(20) unsigned', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (141, 8, 'num1', '开奖号码1', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (142, 8, 'num2', '开奖号码2', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (143, 8, 'num3', '开奖号码3', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (144, 8, 'num4', '开奖号码4', 'int(11)', 'Long', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (145, 8, 'num5', '开奖号码5', 'int(11)', 'Long', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (146, 8, 'num6', '开奖号码6', 'int(11)', 'Long', 'num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (147, 8, 'num7', '开奖号码7', 'int(11)', 'Long', 'num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (148, 8, 'num8', '开奖号码8', 'int(11)', 'Long', 'num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (149, 8, 'num9', '开奖号码9', 'int(11)', 'Long', 'num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (150, 8, 'num10', '开奖号码10', 'int(11)', 'Long', 'num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (151, 8, 'bet_time', '封盘投注截止时间', 'datetime', 'Date', 'betTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 12, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (152, 8, 'pre_time', '预计开奖时间', 'datetime', 'Date', 'preTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 13, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (153, 8, 'status', '是否已经开奖（0已经开奖 1未开奖）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'sys_kj_status', 14, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (154, 8, 'the_time', '开奖时间', 'datetime', 'Date', 'theTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 15, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (155, 8, 'count_money', '总下注金额', 'int(11)', 'Long', 'countMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (156, 8, 'win_money', '总中奖金额', 'int(11)', 'Long', 'winMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (157, 8, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (158, 8, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 19, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (159, 8, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 20, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (160, 8, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 21, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (161, 8, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 22, 'admin', '2024-03-17 16:40:34', '', '2024-04-04 20:35:54');
INSERT INTO `gen_table_column` VALUES (402, 11, 'id', '期数', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (403, 11, 'time', '开奖时间', 'datetime', 'Date', 'time', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 2, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (404, 11, 'num1', '无效字段', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (405, 11, 'num2', '无效字段', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (406, 11, 'num3', '无效字段', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (407, 11, 'num4', '无效字段', 'int(11)', 'Long', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (408, 11, 'num5', '无效字段', 'int(11)', 'Long', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (409, 11, 'num6', '无效字段', 'int(11)', 'Long', 'num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (410, 11, 'num7', '无效字段', 'int(11)', 'Long', 'num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (411, 11, 'num8', '无效字段', 'int(11)', 'Long', 'num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (412, 11, 'num9', '无效字段', 'int(11)', 'Long', 'num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (413, 11, 'num10', '无效字段', 'int(11)', 'Long', 'num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (414, 11, 'num11', '无效字段', 'int(11)', 'Long', 'num11', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (415, 11, 'num12', '无效字段', 'int(11)', 'Long', 'num12', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (416, 11, 'num13', '无效字段', 'int(11)', 'Long', 'num13', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (417, 11, 'num14', '无效字段', 'int(11)', 'Long', 'num14', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (418, 11, 'num15', '无效字段', 'int(11)', 'Long', 'num15', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (419, 11, 'num16', '无效字段', 'int(11)', 'Long', 'num16', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (420, 11, 'num17', '无效字段', 'int(11)', 'Long', 'num17', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (421, 11, 'num18', '无效字段', 'int(11)', 'Long', 'num18', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (422, 11, 'num19', '无效字段', 'int(11)', 'Long', 'num19', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (423, 11, 'num20', '无效字段', 'int(11)', 'Long', 'num20', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (424, 11, 'sum_1', '开奖号码1', 'int(11)', 'Long', 'sum1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (425, 11, 'sum_2', '开奖号码2', 'int(11)', 'Long', 'sum2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (426, 11, 'sum_3', '开奖号码3', 'int(11)', 'Long', 'sum3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (427, 11, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 26, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (428, 11, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 27, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (429, 11, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 28, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (430, 11, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 29, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (431, 11, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 30, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (432, 12, 'id', '期数', 'bigint(20) unsigned', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (433, 12, 'num1', '开奖号码1', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (434, 12, 'num2', '开奖号码2', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (435, 12, 'num3', '开奖号码3', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (436, 12, 'sum_num', '开奖合计号码', 'int(11)', 'Long', 'sumNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (437, 12, 'bet_time', '封盘投注截止时间', 'datetime', 'Date', 'betTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (438, 12, 'pre_time', '预计开奖时间', 'datetime', 'Date', 'preTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (439, 12, 'status', '是否已经开奖（0已经开奖 1未开奖）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (440, 12, 'the_time', '开奖时间', 'datetime', 'Date', 'theTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (441, 12, 'count_money', '总下注金额', 'int(11)', 'Long', 'countMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (442, 12, 'win_money', '总中奖金额', 'int(11)', 'Long', 'winMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (443, 12, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (444, 12, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (445, 12, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (446, 12, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (447, 12, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 16, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (518, 14, 'id', '期数', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (519, 14, 'time', '开奖时间', 'datetime', 'Date', 'time', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 2, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (520, 14, 'num1', '开奖号码1', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (521, 14, 'num2', '开奖号码2', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (522, 14, 'num3', '开奖号码3', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (523, 14, 'num4', '开奖号码4', 'int(11)', 'Long', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (524, 14, 'num5', '开奖号码5', 'int(11)', 'Long', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (525, 14, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (526, 14, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (527, 14, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (528, 14, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (529, 14, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 12, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (530, 15, 'id', '期数', 'bigint(20) unsigned', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (531, 15, 'status', '是否已经开奖（0已经开奖 1未开奖）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 2, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (532, 15, 'bet_time', '封盘投注截止时间', 'datetime', 'Date', 'betTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (533, 15, 'pre_time', '预计开奖时间', 'datetime', 'Date', 'preTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (534, 15, 'the_time', '开奖时间', 'datetime', 'Date', 'theTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (535, 15, 'count_money', '总下注金额', 'int(11)', 'Long', 'countMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (536, 15, 'win_money', '总中奖金额', 'int(11)', 'Long', 'winMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (537, 15, 'num1', '开奖号码1', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (538, 15, 'num2', '开奖号码2', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (539, 15, 'num3', '开奖号码3', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (540, 15, 'num4', '开奖号码4', 'int(11)', 'Long', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (541, 15, 'num5', '开奖号码5', 'int(11)', 'Long', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (542, 15, 'sum', '开奖合计号码', 'int(11)', 'Long', 'sum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (543, 15, 'num1_bs', '开奖号码1大小', 'int(11)', 'Long', 'num1Bs', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (544, 15, 'num1_sd', '开奖号码1单双', 'int(11)', 'Long', 'num1Sd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (545, 15, 'num2_bs', '开奖号码2大小', 'int(11)', 'Long', 'num2Bs', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (546, 15, 'num2_sd', '开奖号码2单双', 'int(11)', 'Long', 'num2Sd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (547, 15, 'num3_bs', '开奖号码3大小', 'int(11)', 'Long', 'num3Bs', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (548, 15, 'num3_sd', '开奖号码3单双', 'int(11)', 'Long', 'num3Sd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (549, 15, 'num4_bs', '开奖号码4大小', 'int(11)', 'Long', 'num4Bs', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (550, 15, 'num4_sd', '开奖号码4单双', 'int(11)', 'Long', 'num4Sd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (551, 15, 'num5_bs', '开奖号码5大小', 'int(11)', 'Long', 'num5Bs', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (552, 15, 'num5_sd', '开奖号码5单双', 'int(11)', 'Long', 'num5Sd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (553, 15, 'sum_bs', '开奖合计号码大小', 'int(11)', 'Long', 'sumBs', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (554, 15, 'sum_sd', '开奖合计号码单双', 'int(11)', 'Long', 'sumSd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (555, 15, 'sum_lts', '开奖合计号码和虎龙', 'int(11)', 'Long', 'sumLts', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (556, 15, 'num_f', '开奖号码(123)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂]', 'int(11)', 'Long', 'numF', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (557, 15, 'num_m', '开奖号码(234)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂]', 'int(11)', 'Long', 'numM', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (558, 15, 'num_b', '开奖号码(345)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂]', 'int(11)', 'Long', 'numB', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (559, 15, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 30, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (560, 15, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 31, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (561, 15, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 32, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (562, 15, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 33, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (563, 15, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 34, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (680, 17, 'bet_id', '投注单ID', 'bigint(20)', 'Long', 'betId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (681, 17, 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (682, 17, 'periods', '期数', 'bigint(20)', 'Long', 'periods', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (683, 17, 'record_time', '投注时间', 'datetime', 'Date', 'recordTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (684, 17, 'time_checkpoint', '校准时间', 'timestamp', 'Date', 'timeCheckpoint', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (685, 17, 'game_id', '游戏ID', 'bigint(20)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (686, 17, 'game_name', '游戏名', 'varchar(25)', 'String', 'gameName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (687, 17, 'play_type', '玩法分类', 'varchar(20)', 'String', 'playType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 8, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (688, 17, 'play_detail', '投注内容', 'varchar(20)', 'String', 'playDetail', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (689, 17, 'play_group', '游戏种类', 'int(6)', 'Integer', 'playGroup', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (690, 17, 'option', NULL, 'int(8)', 'Integer', 'option', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (691, 17, 'money', '投注金额', 'int(10) unsigned', 'Integer', 'money', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (692, 17, 'balance', '投注后用户余额', 'double(10,2)', 'BigDecimal', 'balance', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (693, 17, 'account_result', '输赢结果', 'double(10,2)', 'BigDecimal', 'accountResult', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (694, 17, 'settle_flg', '结算区分（0未结算 1已结算）', 'char(1)', 'String', 'settleFlg', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (695, 17, 'game_result', '开奖结果', 'varchar(50)', 'String', 'gameResult', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (696, 17, 'is_delete', NULL, 'char(1)', 'String', 'isDelete', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (697, 17, 'is_robot', '是否机器人下注', 'char(1)', 'String', 'isRobot', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (698, 17, 'robot_nick_name', '机器人下注昵称', 'varchar(24)', 'String', 'robotNickName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 19, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (699, 17, 'robot_pic', '机器人下注头像', 'varchar(50)', 'String', 'robotPic', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (700, 17, 'robot_img', '机器人下注图片', 'varchar(50)', 'String', 'robotImg', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (701, 17, 'house_id', '房间号', 'int(11)', 'Long', 'houseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (702, 17, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 23, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (703, 17, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 24, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (704, 17, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 25, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (705, 17, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 26, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (706, 17, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 27, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13');
INSERT INTO `gen_table_column` VALUES (707, 18, 'id', NULL, 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 18:35:45');
INSERT INTO `gen_table_column` VALUES (708, 18, 'user_name', '机器人昵称', 'varchar(100)', 'String', 'userName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 18:35:45');
INSERT INTO `gen_table_column` VALUES (709, 18, 'user', '机器人账号', 'varchar(50)', 'String', 'user', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 18:35:45');
INSERT INTO `gen_table_column` VALUES (710, 18, 'robot_pic', '机器人头像', 'varchar(50)', 'String', 'robotPic', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'imageUpload', '', 4, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 18:35:45');
INSERT INTO `gen_table_column` VALUES (711, 18, 'robot_bet_money', '机器人投注金额', 'varchar(100)', 'String', 'robotBetMoney', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 18:35:45');
INSERT INTO `gen_table_column` VALUES (712, 18, 'robot_bet_num', '机器人投注号码', 'varchar(250)', 'String', 'robotBetNum', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 18:35:45');
INSERT INTO `gen_table_column` VALUES (713, 18, 'robot_bet_time', '机器人投注时间', 'varchar(100)', 'String', 'robotBetTime', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 18:35:45');
INSERT INTO `gen_table_column` VALUES (714, 18, 'game_id', '机器人投注游戏', 'bigint(20)', 'Long', 'gameId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 18:35:45');
INSERT INTO `gen_table_column` VALUES (715, 18, 'group_id', '机器人等级id', 'int(2)', 'Integer', 'groupId', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 18:35:45');
INSERT INTO `gen_table_column` VALUES (716, 18, 'play_type', '玩法车道:pk10和飞艇默认0，即为冠亚和值，大于零则随机为1-10车道', 'int(2)', 'Integer', 'playType', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'select', '', 10, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 18:35:45');
INSERT INTO `gen_table_column` VALUES (717, 18, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 18:35:45');
INSERT INTO `gen_table_column` VALUES (718, 18, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 18:35:45');
INSERT INTO `gen_table_column` VALUES (719, 18, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 18:35:45');
INSERT INTO `gen_table_column` VALUES (720, 18, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 18:35:45');
INSERT INTO `gen_table_column` VALUES (721, 18, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '0', NULL, 'EQ', 'textarea', '', 15, 'admin', '2024-03-17 17:16:48', '', '2024-03-17 18:35:45');
INSERT INTO `gen_table_column` VALUES (800, 21, 'replace_id', '广告轮播图ID', 'int(11)', 'Long', 'replaceId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47');
INSERT INTO `gen_table_column` VALUES (801, 21, 'replace_pic', '广告轮播图图片', 'varchar(200)', 'String', 'replacePic', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'imageUpload', '', 2, 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47');
INSERT INTO `gen_table_column` VALUES (802, 21, 'status', '广告轮播图状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_replace_status', 3, 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47');
INSERT INTO `gen_table_column` VALUES (803, 21, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47');
INSERT INTO `gen_table_column` VALUES (804, 21, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47');
INSERT INTO `gen_table_column` VALUES (805, 21, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47');
INSERT INTO `gen_table_column` VALUES (806, 21, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47');
INSERT INTO `gen_table_column` VALUES (807, 21, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 8, 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47');
INSERT INTO `gen_table_column` VALUES (808, 22, 'id', '下注表ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (809, 22, 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (810, 22, 'periods', '期数', 'bigint(20)', 'Long', 'periods', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (811, 22, 'status', '投注状态（0投注 1撤单）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (812, 22, 'record_time', '投注时间', 'datetime', 'Date', 'recordTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (813, 22, 'check_time', NULL, 'timestamp', 'Date', 'checkTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (814, 22, 'count_money', '下注金额', 'float(11,2)', 'BigDecimal', 'countMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (815, 22, 'win_money', '中奖金额', 'float(11,2)', 'BigDecimal', 'winMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (816, 22, 'type1_big', '下注冠亚和大的金额', 'float(11,2)', 'BigDecimal', 'type1Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (817, 22, 'type1_small', '下注冠亚和小的金额', 'float(11,2)', 'BigDecimal', 'type1Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (818, 22, 'type1_single', '下注冠亚和单的金额', 'float(11,2)', 'BigDecimal', 'type1Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (819, 22, 'type1_double', '下注冠亚和双的金额', 'float(11,2)', 'BigDecimal', 'type1Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (820, 22, 'type1_num3', '下注冠亚和3的金额', 'float(11,2)', 'BigDecimal', 'type1Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (821, 22, 'type1_num4', '下注冠亚和4的金额', 'float(11,2)', 'BigDecimal', 'type1Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (822, 22, 'type1_num5', '下注冠亚和5的金额', 'float(11,2)', 'BigDecimal', 'type1Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (823, 22, 'type1_num6', '下注冠亚和6的金额', 'float(11,2)', 'BigDecimal', 'type1Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (824, 22, 'type1_num7', '下注冠亚和7的金额', 'float(11,2)', 'BigDecimal', 'type1Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (825, 22, 'type1_num8', '下注冠亚和8的金额', 'float(11,2)', 'BigDecimal', 'type1Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (826, 22, 'type1_num9', '下注冠亚和9的金额', 'float(11,2)', 'BigDecimal', 'type1Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (827, 22, 'type1_num10', '下注冠亚和10的金额', 'float(11,2)', 'BigDecimal', 'type1Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (828, 22, 'type1_num11', '下注冠亚和11的金额', 'float(11,2)', 'BigDecimal', 'type1Num11', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (829, 22, 'type1_num12', '下注冠亚和12的金额', 'float(11,2)', 'BigDecimal', 'type1Num12', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (830, 22, 'type1_num13', '下注冠亚和13的金额', 'float(11,2)', 'BigDecimal', 'type1Num13', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (831, 22, 'type1_num14', '下注冠亚和14的金额', 'float(11,2)', 'BigDecimal', 'type1Num14', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (832, 22, 'type1_num15', '下注冠亚和15的金额', 'float(11,2)', 'BigDecimal', 'type1Num15', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (833, 22, 'type1_num16', '下注冠亚和16的金额', 'float(11,2)', 'BigDecimal', 'type1Num16', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (834, 22, 'type1_num17', '下注冠亚和17的金额', 'float(11,2)', 'BigDecimal', 'type1Num17', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (835, 22, 'type1_num18', '下注冠亚和18的金额', 'float(11,2)', 'BigDecimal', 'type1Num18', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (836, 22, 'type1_num19', '下注冠亚和19的金额', 'float(11,2)', 'BigDecimal', 'type1Num19', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (837, 22, 'type2_big', '下注冠军大的金额', 'float(11,2)', 'BigDecimal', 'type2Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 30, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (838, 22, 'type2_small', '下注冠军小的金额', 'float(11,2)', 'BigDecimal', 'type2Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 31, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (839, 22, 'type2_single', '下注冠军单的金额', 'float(11,2)', 'BigDecimal', 'type2Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 32, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (840, 22, 'type2_double', '下注冠军双的金额', 'float(11,2)', 'BigDecimal', 'type2Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 33, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (841, 22, 'type2_loong', '下注冠军龙的金额', 'float(11,2)', 'BigDecimal', 'type2Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 34, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (842, 22, 'type2_tiger', '下注冠军虎的金额', 'float(11,2)', 'BigDecimal', 'type2Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 35, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (843, 22, 'type2_num1', '下注冠军1的金额', 'float(11,2)', 'BigDecimal', 'type2Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 36, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (844, 22, 'type2_num2', '下注冠军2的金额', 'float(11,2)', 'BigDecimal', 'type2Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 37, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (845, 22, 'type2_num3', '下注冠军3的金额', 'float(11,2)', 'BigDecimal', 'type2Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 38, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (846, 22, 'type2_num4', '下注冠军4的金额', 'float(11,2)', 'BigDecimal', 'type2Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 39, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (847, 22, 'type2_num5', '下注冠军5的金额', 'float(11,2)', 'BigDecimal', 'type2Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 40, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (848, 22, 'type2_num6', '下注冠军6的金额', 'float(11,2)', 'BigDecimal', 'type2Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 41, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (849, 22, 'type2_num7', '下注冠军7的金额', 'float(11,2)', 'BigDecimal', 'type2Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 42, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (850, 22, 'type2_num8', '下注冠军8的金额', 'float(11,2)', 'BigDecimal', 'type2Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 43, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (851, 22, 'type2_num9', '下注冠军9的金额', 'float(11,2)', 'BigDecimal', 'type2Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 44, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (852, 22, 'type2_num10', '下注冠军10的金额', 'float(11,2)', 'BigDecimal', 'type2Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 45, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (853, 22, 'type3_big', '下注亚军大的金额', 'float(11,2)', 'BigDecimal', 'type3Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 46, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (854, 22, 'type3_small', '下注亚军小的金额', 'float(11,2)', 'BigDecimal', 'type3Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 47, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (855, 22, 'type3_single', '下注亚军单的金额', 'float(11,2)', 'BigDecimal', 'type3Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 48, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (856, 22, 'type3_double', '下注亚军双的金额', 'float(11,2)', 'BigDecimal', 'type3Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 49, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (857, 22, 'type3_loong', '下注亚军龙的金额', 'float(11,2)', 'BigDecimal', 'type3Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 50, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (858, 22, 'type3_tiger', '下注亚军虎的金额', 'float(11,2)', 'BigDecimal', 'type3Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 51, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (859, 22, 'type3_num1', '下注亚军1的金额', 'float(11,2)', 'BigDecimal', 'type3Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 52, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (860, 22, 'type3_num2', '下注亚军2的金额', 'float(11,2)', 'BigDecimal', 'type3Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 53, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (861, 22, 'type3_num3', '下注亚军3的金额', 'float(11,2)', 'BigDecimal', 'type3Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 54, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (862, 22, 'type3_num4', '下注亚军4的金额', 'float(11,2)', 'BigDecimal', 'type3Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 55, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (863, 22, 'type3_num5', '下注亚军5的金额', 'float(11,2)', 'BigDecimal', 'type3Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 56, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (864, 22, 'type3_num6', '下注亚军6的金额', 'float(11,2)', 'BigDecimal', 'type3Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 57, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (865, 22, 'type3_num7', '下注亚军7的金额', 'float(11,2)', 'BigDecimal', 'type3Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 58, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (866, 22, 'type3_num8', '下注亚军8的金额', 'float(11,2)', 'BigDecimal', 'type3Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 59, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (867, 22, 'type3_num9', '下注亚军9的金额', 'float(11,2)', 'BigDecimal', 'type3Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 60, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (868, 22, 'type3_num10', '下注亚军10的金额', 'float(11,2)', 'BigDecimal', 'type3Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 61, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (869, 22, 'type4_big', '下注第三名大的金额', 'float(11,2)', 'BigDecimal', 'type4Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 62, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (870, 22, 'type4_small', '下注第三名小的金额', 'float(11,2)', 'BigDecimal', 'type4Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 63, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (871, 22, 'type4_single', '下注第三名单的金额', 'float(11,2)', 'BigDecimal', 'type4Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 64, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (872, 22, 'type4_double', '下注第三名双的金额', 'float(11,2)', 'BigDecimal', 'type4Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 65, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (873, 22, 'type4_loong', '下注第三名龙的金额', 'float(11,2)', 'BigDecimal', 'type4Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 66, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (874, 22, 'type4_tiger', '下注第三名虎的金额', 'float(11,2)', 'BigDecimal', 'type4Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 67, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (875, 22, 'type4_num1', '下注第三名1的金额', 'float(11,2)', 'BigDecimal', 'type4Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 68, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (876, 22, 'type4_num2', '下注第三名2的金额', 'float(11,2)', 'BigDecimal', 'type4Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 69, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (877, 22, 'type4_num3', '下注第三名3的金额', 'float(11,2)', 'BigDecimal', 'type4Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 70, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (878, 22, 'type4_num4', '下注第三名4的金额', 'float(11,2)', 'BigDecimal', 'type4Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 71, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (879, 22, 'type4_num5', '下注第三名5的金额', 'float(11,2)', 'BigDecimal', 'type4Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 72, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (880, 22, 'type4_num6', '下注第三名6的金额', 'float(11,2)', 'BigDecimal', 'type4Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 73, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (881, 22, 'type4_num7', '下注第三名7的金额', 'float(11,2)', 'BigDecimal', 'type4Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 74, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (882, 22, 'type4_num8', '下注第三名8的金额', 'float(11,2)', 'BigDecimal', 'type4Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 75, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (883, 22, 'type4_num9', '下注第三名9的金额', 'float(11,2)', 'BigDecimal', 'type4Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 76, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (884, 22, 'type4_num10', '下注第三名10的金额', 'float(11,2)', 'BigDecimal', 'type4Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 77, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (885, 22, 'type5_big', '下注第四名大的金额', 'float(11,2)', 'BigDecimal', 'type5Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 78, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (886, 22, 'type5_small', '下注第四名小的金额', 'float(11,2)', 'BigDecimal', 'type5Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 79, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (887, 22, 'type5_single', '下注第四名单的金额', 'float(11,2)', 'BigDecimal', 'type5Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 80, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (888, 22, 'type5_double', '下注第四名双的金额', 'float(11,2)', 'BigDecimal', 'type5Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 81, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (889, 22, 'type5_loong', '下注第四名龙的金额', 'float(11,2)', 'BigDecimal', 'type5Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 82, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (890, 22, 'type5_tiger', '下注第四名虎的金额', 'float(11,2)', 'BigDecimal', 'type5Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 83, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (891, 22, 'type5_num1', '下注第四名1的金额', 'float(11,2)', 'BigDecimal', 'type5Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 84, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (892, 22, 'type5_num2', '下注第四名2的金额', 'float(11,2)', 'BigDecimal', 'type5Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 85, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (893, 22, 'type5_num3', '下注第四名3的金额', 'float(11,2)', 'BigDecimal', 'type5Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 86, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (894, 22, 'type5_num4', '下注第四名4的金额', 'float(11,2)', 'BigDecimal', 'type5Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 87, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (895, 22, 'type5_num5', '下注第四名5的金额', 'float(11,2)', 'BigDecimal', 'type5Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 88, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (896, 22, 'type5_num6', '下注第四名6的金额', 'float(11,2)', 'BigDecimal', 'type5Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 89, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (897, 22, 'type5_num7', '下注第四名7的金额', 'float(11,2)', 'BigDecimal', 'type5Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 90, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (898, 22, 'type5_num8', '下注第四名8的金额', 'float(11,2)', 'BigDecimal', 'type5Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 91, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (899, 22, 'type5_num9', '下注第四名9的金额', 'float(11,2)', 'BigDecimal', 'type5Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 92, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (900, 22, 'type5_num10', '下注第四名10的金额', 'float(11,2)', 'BigDecimal', 'type5Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 93, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (901, 22, 'type6_big', '下注第五名大的金额', 'float(11,2)', 'BigDecimal', 'type6Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 94, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (902, 22, 'type6_small', '下注第五名小的金额', 'float(11,2)', 'BigDecimal', 'type6Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 95, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (903, 22, 'type6_single', '下注第五名单的金额', 'float(11,2)', 'BigDecimal', 'type6Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 96, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (904, 22, 'type6_double', '下注第五名双的金额', 'float(11,2)', 'BigDecimal', 'type6Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 97, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (905, 22, 'type6_loong', '下注第五名龙的金额', 'float(11,2)', 'BigDecimal', 'type6Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 98, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (906, 22, 'type6_tiger', '下注第五名虎的金额', 'float(11,2)', 'BigDecimal', 'type6Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 99, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (907, 22, 'type6_num1', '下注第五名1的金额', 'float(11,2)', 'BigDecimal', 'type6Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 100, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (908, 22, 'type6_num2', '下注第五名2的金额', 'float(11,2)', 'BigDecimal', 'type6Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 101, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (909, 22, 'type6_num3', '下注第五名3的金额', 'float(11,2)', 'BigDecimal', 'type6Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 102, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (910, 22, 'type6_num4', '下注第五名4的金额', 'float(11,2)', 'BigDecimal', 'type6Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 103, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (911, 22, 'type6_num5', '下注第五名5的金额', 'float(11,2)', 'BigDecimal', 'type6Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 104, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (912, 22, 'type6_num6', '下注第五名6的金额', 'float(11,2)', 'BigDecimal', 'type6Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 105, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (913, 22, 'type6_num7', '下注第五名7的金额', 'float(11,2)', 'BigDecimal', 'type6Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 106, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (914, 22, 'type6_num8', '下注第五名8的金额', 'float(11,2)', 'BigDecimal', 'type6Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 107, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (915, 22, 'type6_num9', '下注第五名9的金额', 'float(11,2)', 'BigDecimal', 'type6Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 108, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (916, 22, 'type6_num10', '下注第五名10的金额', 'float(11,2)', 'BigDecimal', 'type6Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 109, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (917, 22, 'type7_big', '下注第六名大的金额', 'float(11,2)', 'BigDecimal', 'type7Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 110, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (918, 22, 'type7_small', '下注第六名小的金额', 'float(11,2)', 'BigDecimal', 'type7Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 111, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (919, 22, 'type7_single', '下注第六名单的金额', 'float(11,2)', 'BigDecimal', 'type7Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 112, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (920, 22, 'type7_double', '下注第六名双的金额', 'float(11,2)', 'BigDecimal', 'type7Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 113, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (921, 22, 'type7_loong', '下注第六名龙的金额', 'float(11,2)', 'BigDecimal', 'type7Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 114, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (922, 22, 'type7_tiger', '下注第六名虎的金额', 'float(11,2)', 'BigDecimal', 'type7Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 115, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (923, 22, 'type7_num1', '下注第六名1的金额', 'float(11,2)', 'BigDecimal', 'type7Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 116, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (924, 22, 'type7_num2', '下注第六名2的金额', 'float(11,2)', 'BigDecimal', 'type7Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 117, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (925, 22, 'type7_num3', '下注第六名3的金额', 'float(11,2)', 'BigDecimal', 'type7Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 118, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (926, 22, 'type7_num4', '下注第六名4的金额', 'float(11,2)', 'BigDecimal', 'type7Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 119, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (927, 22, 'type7_num5', '下注第六名5的金额', 'float(11,2)', 'BigDecimal', 'type7Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 120, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (928, 22, 'type7_num6', '下注第六名6的金额', 'float(11,2)', 'BigDecimal', 'type7Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 121, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (929, 22, 'type7_num7', '下注第六名7的金额', 'float(11,2)', 'BigDecimal', 'type7Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 122, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (930, 22, 'type7_num8', '下注第六名8的金额', 'float(11,2)', 'BigDecimal', 'type7Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 123, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (931, 22, 'type7_num9', '下注第六名9的金额', 'float(11,2)', 'BigDecimal', 'type7Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 124, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (932, 22, 'type7_num10', '下注第六名10的金额', 'float(11,2)', 'BigDecimal', 'type7Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 125, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (933, 22, 'type8_big', '下注第七名大的金额', 'float(11,2)', 'BigDecimal', 'type8Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 126, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (934, 22, 'type8_small', '下注第七名小的金额', 'float(11,2)', 'BigDecimal', 'type8Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 127, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (935, 22, 'type8_single', '下注第七名单的金额', 'float(11,2)', 'BigDecimal', 'type8Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 128, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (936, 22, 'type8_double', '下注第七名双的金额', 'float(11,2)', 'BigDecimal', 'type8Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 129, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (937, 22, 'type8_loong', '下注第七名龙的金额', 'float(11,2)', 'BigDecimal', 'type8Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 130, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (938, 22, 'type8_tiger', '下注第七名虎的金额', 'float(11,2)', 'BigDecimal', 'type8Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 131, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (939, 22, 'type8_num1', '下注第七名1的金额', 'float(11,2)', 'BigDecimal', 'type8Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 132, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (940, 22, 'type8_num2', '下注第七名2的金额', 'float(11,2)', 'BigDecimal', 'type8Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 133, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (941, 22, 'type8_num3', '下注第七名3的金额', 'float(11,2)', 'BigDecimal', 'type8Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 134, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (942, 22, 'type8_num4', '下注第七名4的金额', 'float(11,2)', 'BigDecimal', 'type8Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 135, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (943, 22, 'type8_num5', '下注第七名5的金额', 'float(11,2)', 'BigDecimal', 'type8Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 136, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (944, 22, 'type8_num6', '下注第七名6的金额', 'float(11,2)', 'BigDecimal', 'type8Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 137, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (945, 22, 'type8_num7', '下注第七名7的金额', 'float(11,2)', 'BigDecimal', 'type8Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 138, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (946, 22, 'type8_num8', '下注第七名8的金额', 'float(11,2)', 'BigDecimal', 'type8Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 139, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (947, 22, 'type8_num9', '下注第七名9的金额', 'float(11,2)', 'BigDecimal', 'type8Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 140, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (948, 22, 'type8_num10', '下注第七名10的金额', 'float(11,2)', 'BigDecimal', 'type8Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 141, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (949, 22, 'type9_big', '下注第八名大的金额', 'float(11,2)', 'BigDecimal', 'type9Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 142, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (950, 22, 'type9_small', '下注第八名小的金额', 'float(11,2)', 'BigDecimal', 'type9Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 143, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (951, 22, 'type9_single', '下注第八名单的金额', 'float(11,2)', 'BigDecimal', 'type9Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 144, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (952, 22, 'type9_double', '下注第八名双的金额', 'float(11,2)', 'BigDecimal', 'type9Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 145, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (953, 22, 'type9_loong', '下注第八名龙的金额', 'float(11,2)', 'BigDecimal', 'type9Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 146, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (954, 22, 'type9_tiger', '下注第八名虎的金额', 'float(11,2)', 'BigDecimal', 'type9Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 147, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (955, 22, 'type9_num1', '下注第八名1的金额', 'float(11,2)', 'BigDecimal', 'type9Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 148, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (956, 22, 'type9_num2', '下注第八名2的金额', 'float(11,2)', 'BigDecimal', 'type9Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 149, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (957, 22, 'type9_num3', '下注第八名3的金额', 'float(11,2)', 'BigDecimal', 'type9Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 150, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (958, 22, 'type9_num4', '下注第八名4的金额', 'float(11,2)', 'BigDecimal', 'type9Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 151, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (959, 22, 'type9_num5', '下注第八名5的金额', 'float(11,2)', 'BigDecimal', 'type9Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 152, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (960, 22, 'type9_num6', '下注第八名6的金额', 'float(11,2)', 'BigDecimal', 'type9Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 153, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (961, 22, 'type9_num7', '下注第八名7的金额', 'float(11,2)', 'BigDecimal', 'type9Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 154, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (962, 22, 'type9_num8', '下注第八名8的金额', 'float(11,2)', 'BigDecimal', 'type9Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 155, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (963, 22, 'type9_num9', '下注第八名9的金额', 'float(11,2)', 'BigDecimal', 'type9Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 156, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (964, 22, 'type9_num10', '下注第八名10的金额', 'float(11,2)', 'BigDecimal', 'type9Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 157, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (965, 22, 'type10_big', '下注第九名大的金额', 'float(11,2)', 'BigDecimal', 'type10Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 158, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (966, 22, 'type10_small', '下注第九名小的金额', 'float(11,2)', 'BigDecimal', 'type10Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 159, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (967, 22, 'type10_single', '下注第九名单的金额', 'float(11,2)', 'BigDecimal', 'type10Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 160, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (968, 22, 'type10_double', '下注第九名双的金额', 'float(11,2)', 'BigDecimal', 'type10Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 161, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (969, 22, 'type10_loong', '下注第九名龙的金额', 'float(11,2)', 'BigDecimal', 'type10Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 162, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (970, 22, 'type10_tiger', '下注第九名虎的金额', 'float(11,2)', 'BigDecimal', 'type10Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 163, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (971, 22, 'type10_num1', '下注第九名1的金额', 'float(11,2)', 'BigDecimal', 'type10Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 164, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (972, 22, 'type10_num2', '下注第九名2的金额', 'float(11,2)', 'BigDecimal', 'type10Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 165, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (973, 22, 'type10_num3', '下注第九名3的金额', 'float(11,2)', 'BigDecimal', 'type10Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 166, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (974, 22, 'type10_num4', '下注第九名4的金额', 'float(11,2)', 'BigDecimal', 'type10Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 167, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (975, 22, 'type10_num5', '下注第九名5的金额', 'float(11,2)', 'BigDecimal', 'type10Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 168, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (976, 22, 'type10_num6', '下注第九名6的金额', 'float(11,2)', 'BigDecimal', 'type10Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 169, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (977, 22, 'type10_num7', '下注第九名7的金额', 'float(11,2)', 'BigDecimal', 'type10Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 170, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (978, 22, 'type10_num8', '下注第九名8的金额', 'float(11,2)', 'BigDecimal', 'type10Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 171, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (979, 22, 'type10_num9', '下注第九名9的金额', 'float(11,2)', 'BigDecimal', 'type10Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 172, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (980, 22, 'type10_num10', '下注第九名10的金额', 'float(11,2)', 'BigDecimal', 'type10Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 173, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (981, 22, 'type11_big', '下注第十名大的金额', 'float(11,2)', 'BigDecimal', 'type11Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 174, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (982, 22, 'type11_small', '下注第十名小的金额', 'float(11,2)', 'BigDecimal', 'type11Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 175, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (983, 22, 'type11_single', '下注第十名单的金额', 'float(11,2)', 'BigDecimal', 'type11Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 176, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (984, 22, 'type11_double', '下注第十名双的金额', 'float(11,2)', 'BigDecimal', 'type11Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 177, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (985, 22, 'type11_loong', '下注第十名龙的金额', 'float(11,2)', 'BigDecimal', 'type11Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 178, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (986, 22, 'type11_tiger', '下注第十名虎的金额', 'float(11,2)', 'BigDecimal', 'type11Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 179, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (987, 22, 'type11_num1', '下注第十名1的金额', 'float(11,2)', 'BigDecimal', 'type11Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 180, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (988, 22, 'type11_num2', '下注第十名2的金额', 'float(11,2)', 'BigDecimal', 'type11Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 181, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (989, 22, 'type11_num3', '下注第十名3的金额', 'float(11,2)', 'BigDecimal', 'type11Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 182, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (990, 22, 'type11_num4', '下注第十名4的金额', 'float(11,2)', 'BigDecimal', 'type11Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 183, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (991, 22, 'type11_num5', '下注第十名5的金额', 'float(11,2)', 'BigDecimal', 'type11Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 184, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (992, 22, 'type11_num6', '下注第十名6的金额', 'float(11,2)', 'BigDecimal', 'type11Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 185, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (993, 22, 'type11_num7', '下注第十名7的金额', 'float(11,2)', 'BigDecimal', 'type11Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 186, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (994, 22, 'type11_num8', '下注第十名8的金额', 'float(11,2)', 'BigDecimal', 'type11Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 187, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (995, 22, 'type11_num9', '下注第十名9的金额', 'float(11,2)', 'BigDecimal', 'type11Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 188, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (996, 22, 'type11_num10', '下注第十名10的金额', 'float(11,2)', 'BigDecimal', 'type11Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 189, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (997, 22, 'big_single', '下注大单的金额', 'float(11,2)', 'BigDecimal', 'bigSingle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 190, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (998, 22, 'big_double', '下注大双的金额', 'float(11,2)', 'BigDecimal', 'bigDouble', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 191, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (999, 22, 'small_single', '下注小单的金额', 'float(11,2)', 'BigDecimal', 'smallSingle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 192, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1000, 22, 'small_double', '下注小双的金额', 'float(11,2)', 'BigDecimal', 'smallDouble', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 193, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1001, 22, 'num1', '开奖号码1', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 194, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1002, 22, 'num2', '开奖号码2', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 195, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1003, 22, 'num3', '开奖号码3', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 196, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1004, 22, 'num4', '开奖号码4', 'int(11)', 'Long', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 197, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1005, 22, 'num5', '开奖号码5', 'int(11)', 'Long', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 198, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1006, 22, 'num6', '开奖号码6', 'int(11)', 'Long', 'num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 199, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1007, 22, 'num7', '开奖号码7', 'int(11)', 'Long', 'num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 200, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1008, 22, 'num8', '开奖号码8', 'int(11)', 'Long', 'num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 201, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1009, 22, 'num9', '开奖号码9', 'int(11)', 'Long', 'num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 202, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1010, 22, 'num10', '开奖号码10', 'int(11)', 'Long', 'num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 203, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1011, 22, 'sum_num', '开奖合算数字', 'int(11)', 'Long', 'sumNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 204, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1012, 22, 'is_delete', '是否扣除(0否 1是)', 'char(1)', 'String', 'isDelete', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 205, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1013, 22, 'is_deduct', '是否扣除', 'char(1)', 'String', 'isDeduct', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 206, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1014, 22, 'house', '房间号', 'int(4)', 'Integer', 'house', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 207, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1015, 22, 'hz_id', '是否合庄模式', 'char(1)', 'String', 'hzId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 208, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1016, 22, 'hz_user', '是否用户(0否 1是)', 'char(1)', 'String', 'hzUser', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 209, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1017, 22, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 210, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1018, 22, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 211, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1019, 22, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 212, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1020, 22, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 213, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1021, 22, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 214, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1022, 23, 'id', '下注表ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1023, 23, 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1024, 23, 'periods', '期数', 'bigint(20)', 'Long', 'periods', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1025, 23, 'status', '投注状态（0投注 1撤单）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1026, 23, 'record_time', '投注时间', 'datetime', 'Date', 'recordTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1027, 23, 'check_time', '确认时间', 'timestamp', 'Date', 'checkTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1028, 23, 'count_money', '下注金额', 'float(11,2)', 'BigDecimal', 'countMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1029, 23, 'win_money', '中奖金额', 'float(11,2)', 'BigDecimal', 'winMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1030, 23, 'big', '下注大的金额', 'float(11,2)', 'BigDecimal', 'big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1031, 23, 'small', '下注小的金额', 'float(11,2)', 'BigDecimal', 'small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1032, 23, 'single', '下注单的金额', 'float(11,2)', 'BigDecimal', 'single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1033, 23, 'double_amount', '下注双的金额', 'float(11,2)', 'BigDecimal', 'doubleAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1034, 23, 'much_Big', '下注极大的金额', 'float(11,2)', 'BigDecimal', 'muchBig', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1035, 23, 'big_Single', '下注大单的金额', 'float(11,2)', 'BigDecimal', 'bigSingle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1036, 23, 'small_Single', '下注小单的金额', 'float(11,2)', 'BigDecimal', 'smallSingle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1037, 23, 'big_Double', '下注大双的金额', 'float(11,2)', 'BigDecimal', 'bigDouble', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1038, 23, 'small_Double', '下注小双的金额', 'float(11,2)', 'BigDecimal', 'smallDouble', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1039, 23, 'much_Small', '下注极小的金额', 'float(11,2)', 'BigDecimal', 'muchSmall', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1040, 23, 'num0', '下注数字0的金额', 'float(11,2)', 'BigDecimal', 'num0', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1041, 23, 'num1', '下注数字1的金额', 'float(11,2)', 'BigDecimal', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1042, 23, 'num2', '下注数字2的金额', 'float(11,2)', 'BigDecimal', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1043, 23, 'num3', '下注数字3的金额', 'float(11,2)', 'BigDecimal', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1044, 23, 'num4', '下注数字4的金额', 'float(11,2)', 'BigDecimal', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1045, 23, 'num5', '下注数字5的金额', 'float(11,2)', 'BigDecimal', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1046, 23, 'num6', '下注数字6的金额', 'float(11,2)', 'BigDecimal', 'num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1047, 23, 'num7', '下注数字7的金额', 'float(11,2)', 'BigDecimal', 'num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1048, 23, 'num8', '下注数字8的金额', 'float(11,2)', 'BigDecimal', 'num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1049, 23, 'num9', '下注数字9的金额', 'float(11,2)', 'BigDecimal', 'num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1050, 23, 'num10', '下注数字10的金额', 'float(11,2)', 'BigDecimal', 'num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1051, 23, 'num11', '下注数字11的金额', 'float(11,2)', 'BigDecimal', 'num11', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 30, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1052, 23, 'num12', '下注数字12的金额', 'float(11,2)', 'BigDecimal', 'num12', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 31, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1053, 23, 'num13', '下注数字13的金额', 'float(11,2)', 'BigDecimal', 'num13', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 32, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1054, 23, 'num14', '下注数字14的金额', 'float(11,2)', 'BigDecimal', 'num14', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 33, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1055, 23, 'num15', '下注数字15的金额', 'float(11,2)', 'BigDecimal', 'num15', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 34, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1056, 23, 'num16', '下注数字16的金额', 'float(11,2)', 'BigDecimal', 'num16', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 35, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1057, 23, 'num17', '下注数字17的金额', 'float(11,2)', 'BigDecimal', 'num17', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 36, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1058, 23, 'num18', '下注数字18的金额', 'float(11,2)', 'BigDecimal', 'num18', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 37, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1059, 23, 'num19', '下注数字19的金额', 'float(11,2)', 'BigDecimal', 'num19', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 38, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1060, 23, 'num20', '下注数字20的金额', 'float(11,2)', 'BigDecimal', 'num20', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 39, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1061, 23, 'num21', '下注数字21的金额', 'float(11,2)', 'BigDecimal', 'num21', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 40, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1062, 23, 'num22', '下注数字22的金额', 'float(11,2)', 'BigDecimal', 'num22', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 41, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1063, 23, 'num23', '下注数字23的金额', 'float(11,2)', 'BigDecimal', 'num23', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 42, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1064, 23, 'num24', '下注数字24的金额', 'float(11,2)', 'BigDecimal', 'num24', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 43, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1065, 23, 'num25', '下注数字25的金额', 'float(11,2)', 'BigDecimal', 'num25', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 44, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1066, 23, 'num26', '下注数字26的金额', 'float(11,2)', 'BigDecimal', 'num26', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 45, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1067, 23, 'num27', '下注数字27的金额', 'float(11,2)', 'BigDecimal', 'num27', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 46, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1068, 23, 'red', '下注红的金额', 'float(11,2)', 'BigDecimal', 'red', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 47, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1069, 23, 'green', '下注绿的金额', 'float(11,2)', 'BigDecimal', 'green', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 48, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1070, 23, 'blue', '下注蓝的金额', 'float(11,2)', 'BigDecimal', 'blue', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 49, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1071, 23, 'loong', '下注龙的金额', 'float(11,2)', 'BigDecimal', 'loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 50, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1072, 23, 'tiger', '下注虎的金额', 'float(11,2)', 'BigDecimal', 'tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 51, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1073, 23, 'close', '下注合的金额', 'float(11,2)', 'BigDecimal', 'close', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 52, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1074, 23, 'leopard', '下注豹子的金额', 'float(11,2)', 'BigDecimal', 'leopard', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 53, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1075, 23, 'pairs', '下注对子的金额', 'float(11,2)', 'BigDecimal', 'pairs', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 54, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1076, 23, 'shun', '下注顺子的金额', 'float(11,2)', 'BigDecimal', 'shun', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 55, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1077, 23, 'vip', 'VIP房间', 'int(4)', 'Integer', 'vip', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 56, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1078, 23, 'n1', '开奖号码1', 'int(11)', 'Long', 'n1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 57, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1079, 23, 'n2', '开奖号码2', 'int(11)', 'Long', 'n2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 58, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1080, 23, 'n3', '开奖号码3', 'int(11)', 'Long', 'n3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 59, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1081, 23, 'sum_num', '开奖合算数字', 'int(11)', 'Long', 'sumNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 60, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1082, 23, 'is_delete', '是否扣除(0否 1是)', 'char(1)', 'String', 'isDelete', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 61, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1083, 23, 'is_deduct', '是否扣除', 'char(1)', 'String', 'isDeduct', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 62, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1084, 23, 'house', '房间号', 'int(4)', 'Integer', 'house', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 63, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1085, 23, 'hz_id', '是否合庄模式', 'char(1)', 'String', 'hzId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 64, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1086, 23, 'hz_user', '是否用户(0否 1是)', 'char(1)', 'String', 'hzUser', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 65, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1087, 23, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 66, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1088, 23, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 67, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1089, 23, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 68, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1090, 23, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 69, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1091, 23, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 70, 'admin', '2024-03-23 21:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (1251, 28, 'id', '管理员盈亏ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:07');
INSERT INTO `gen_table_column` VALUES (1252, 28, 'win_time', '盈亏时间(YMD)', 'datetime', 'Date', 'winTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 2, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:07');
INSERT INTO `gen_table_column` VALUES (1253, 28, 'game_id', '游戏ID', 'bigint(20)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:07');
INSERT INTO `gen_table_column` VALUES (1254, 28, 'game_name', '游戏名', 'varchar(25)', 'String', 'gameName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:07');
INSERT INTO `gen_table_column` VALUES (1255, 28, 'win_money', '今日盈亏金额', 'float(11,2)', 'Float', 'winMoney', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:07');
INSERT INTO `gen_table_column` VALUES (1256, 28, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:07');
INSERT INTO `gen_table_column` VALUES (1257, 28, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:07');
INSERT INTO `gen_table_column` VALUES (1258, 28, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:07');
INSERT INTO `gen_table_column` VALUES (1259, 28, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:07');
INSERT INTO `gen_table_column` VALUES (1260, 28, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:07');
INSERT INTO `gen_table_column` VALUES (1261, 29, 'id', '用户资金流水ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1262, 29, 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1263, 29, 'cash_content', '资金流水内容', 'varchar(255)', 'String', 'cashContent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', 3, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1264, 29, 'cash_time', '资金流水时间', 'datetime', 'Date', 'cashTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1265, 29, 'cash_money', '流水金额', 'float(11,2)', 'Float', 'cashMoney', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1266, 29, 'type', '1、申请充值、2、充值成功3、充值失败4、申请提现5、提现成功6、提现失败7、购买彩票8、彩票中奖9、彩票撤单 10、下线创收 11、提取返利 12、代理佣金13、代理金额由于下线开奖变动14、代理金额转入15、代理金额转出16.牛牛押金返还', 'tinyint(4)', 'Integer', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1267, 29, 'user_balance', '账户剩余金额', 'float(11,2)', 'BigDecimal', 'userBalance', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1268, 29, 'union_pay_id', '提现账户ID', 'int(11)', 'Long', 'unionPayId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1269, 29, 'user_name', '用户名', 'varchar(50)', 'String', 'userName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 9, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1270, 29, 'user_pay', '支付方式', 'varchar(100)', 'String', 'userPay', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1271, 29, 'user_account', '账户名', 'varchar(255)', 'String', 'userAccount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1272, 29, 'cash_describe', '管理员上下分备注信息', 'longblob', 'String', 'cashDescribe', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 12, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1273, 29, 'game_id', '游戏ID', 'bigint(20)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1274, 29, 'game_name', '游戏名', 'varchar(25)', 'String', 'gameName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 14, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1275, 29, 'house', '房间号', 'int(4)', 'Integer', 'house', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1276, 29, 'is_delete', '是否删除(0否 1是)', 'char(1)', 'String', 'isDelete', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1277, 29, 'hz_id', '是否合庄模式', 'char(1)', 'String', 'hzId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1278, 29, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1279, 29, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 19, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1280, 29, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 20, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1281, 29, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 21, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1282, 29, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 22, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:19');
INSERT INTO `gen_table_column` VALUES (1283, 30, 'id', '用户盈亏ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:27');
INSERT INTO `gen_table_column` VALUES (1284, 30, 'win_time', '盈亏时间(YMD)', 'datetime', 'Date', 'winTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 2, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:27');
INSERT INTO `gen_table_column` VALUES (1285, 30, 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:27');
INSERT INTO `gen_table_column` VALUES (1286, 30, 'game_id', '游戏ID', 'bigint(20)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:27');
INSERT INTO `gen_table_column` VALUES (1287, 30, 'game_name', '游戏名', 'varchar(25)', 'String', 'gameName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:27');
INSERT INTO `gen_table_column` VALUES (1288, 30, 'win_money', '今日盈亏金额', 'float(11,2)', 'Float', 'winMoney', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:27');
INSERT INTO `gen_table_column` VALUES (1289, 30, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:27');
INSERT INTO `gen_table_column` VALUES (1290, 30, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:27');
INSERT INTO `gen_table_column` VALUES (1291, 30, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:27');
INSERT INTO `gen_table_column` VALUES (1292, 30, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:27');
INSERT INTO `gen_table_column` VALUES (1293, 30, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 11, 'admin', '2024-03-24 22:51:56', '', '2024-03-24 22:52:27');
INSERT INTO `gen_table_column` VALUES (1294, 31, 'bet_item_id', '游戏投注项ID', 'int(11)', 'Long', 'betItemId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28');
INSERT INTO `gen_table_column` VALUES (1295, 31, 'game_id', '游戏ID', 'int(11)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28');
INSERT INTO `gen_table_column` VALUES (1296, 31, 'bet_item_type', '投注项类别', 'int(11)', 'Long', 'betItemType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28');
INSERT INTO `gen_table_column` VALUES (1297, 31, 'bet_item_code', '投注项cd', 'varchar(255)', 'String', 'betItemCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28');
INSERT INTO `gen_table_column` VALUES (1298, 31, 'bet_item_name', '投注项名', 'varchar(25)', 'String', 'betItemName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28');
INSERT INTO `gen_table_column` VALUES (1299, 31, 'bet_item_describe', '特色定义内容', 'longblob', 'String', 'betItemDescribe', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 6, 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28');
INSERT INTO `gen_table_column` VALUES (1300, 31, 'odd', '赔率', 'float(10,2)', 'Float', 'odd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28');
INSERT INTO `gen_table_column` VALUES (1301, 31, 'min_bet_amount', '最小投注金额', 'float(11,2)', 'Float', 'minBetAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28');
INSERT INTO `gen_table_column` VALUES (1302, 31, 'max_bet_amount', '最大投注金额', 'float(11,2)', 'Float', 'maxBetAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28');
INSERT INTO `gen_table_column` VALUES (1303, 31, 'sort', '排序', 'int(4)', 'Integer', 'sort', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28');
INSERT INTO `gen_table_column` VALUES (1304, 31, 'status', '投注项状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28');
INSERT INTO `gen_table_column` VALUES (1305, 31, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28');
INSERT INTO `gen_table_column` VALUES (1306, 31, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28');
INSERT INTO `gen_table_column` VALUES (1307, 31, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28');
INSERT INTO `gen_table_column` VALUES (1308, 31, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28');
INSERT INTO `gen_table_column` VALUES (1309, 31, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 16, 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28');
INSERT INTO `gen_table_column` VALUES (1344, 33, 'id', '数字红绿蓝属性ID', 'int(11) unsigned', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1345, 33, 'game_id', '游戏ID', 'int(11)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1346, 33, 'num0', '数字0红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num0', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1347, 33, 'num1', '数字1红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num1', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1348, 33, 'num2', '数字2红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num2', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1349, 33, 'num3', '数字3红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num3', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1350, 33, 'num4', '数字4红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num4', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1351, 33, 'num5', '数字5红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num5', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1352, 33, 'num6', '数字6红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num6', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1353, 33, 'num7', '数字7红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num7', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1354, 33, 'num8', '数字8红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num8', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1355, 33, 'num9', '数字9红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num9', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1356, 33, 'num10', '数字10红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num10', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1357, 33, 'num11', '数字11红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num11', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1358, 33, 'num12', '数字12红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num12', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1359, 33, 'num13', '数字13红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num13', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1360, 33, 'num14', '数字14红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num14', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1361, 33, 'num15', '数字15红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num15', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1362, 33, 'num16', '数字16红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num16', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1363, 33, 'num17', '数字17红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num17', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1364, 33, 'num18', '数字18红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num18', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1365, 33, 'num19', '数字19红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num19', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1366, 33, 'num20', '数字20红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num20', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1367, 33, 'num21', '数字21红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num21', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1368, 33, 'num22', '数字22红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num22', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1369, 33, 'num23', '数字23红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num23', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1370, 33, 'num24', '数字24红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num24', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1371, 33, 'num25', '数字25红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num25', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1372, 33, 'num26', '数字26红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num26', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1373, 33, 'num27', '数字27红绿蓝属性(1：绿 2：红 3：蓝)', 'int(2)', 'Integer', 'num27', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 30, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1374, 33, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 31, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1375, 33, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 32, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1376, 33, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 33, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1377, 33, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 34, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1378, 33, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 35, 'admin', '2024-03-27 20:56:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (1379, 34, 'id', '下注表ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1380, 34, 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1381, 34, 'periods', '期数', 'bigint(20)', 'Long', 'periods', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1382, 34, 'status', '投注状态（0投注 1撤单）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1383, 34, 'record_time', '投注时间', 'datetime', 'Date', 'recordTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1384, 34, 'check_time', '确认时间', 'timestamp', 'Date', 'checkTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1385, 34, 'count_money', '下注金额', 'float(11,2)', 'Float', 'countMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1386, 34, 'win_money', '中奖金额', 'float(11,2)', 'Float', 'winMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1387, 34, 'sum_big', '下注和值大的金额', 'float(11,2)', 'Float', 'sumBig', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1388, 34, 'sum_small', '下注和值小的金额', 'float(11,2)', 'Float', 'sumSmall', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1389, 34, 'sum_single', '下注和值单的金额', 'float(11,2)', 'Float', 'sumSingle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1390, 34, 'sum_double', '下注和值双的金额', 'float(11,2)', 'Float', 'sumDouble', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1391, 34, 'sum_loong', '下注和值龙的金额', 'float(11,2)', 'Float', 'sumLoong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1392, 34, 'sum_tiger', '下注和值虎的金额', 'float(11,2)', 'Float', 'sumTiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1393, 34, 'sum_sum', '下注和值和的金额', 'float(11,2)', 'Float', 'sumSum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1394, 34, 'num1_big', '下注买1号球大的金额', 'float(11,2)', 'Float', 'num1Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1395, 34, 'num1_small', '下注买1号球小的金额', 'float(11,2)', 'Float', 'num1Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1396, 34, 'num1_single', '下注买1号球单的金额', 'float(11,2)', 'Float', 'num1Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1397, 34, 'num1_double', '下注买1号球双的金额', 'float(11,2)', 'Float', 'num1Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1398, 34, 'num1_ball0', '下注买1号球0的金额', 'float(11,2)', 'Float', 'num1Ball0', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1399, 34, 'num1_ball1', '下注买1号球1的金额', 'float(11,2)', 'Float', 'num1Ball1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1400, 34, 'num1_ball2', '下注买1号球2的金额', 'float(11,2)', 'Float', 'num1Ball2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1401, 34, 'num1_ball3', '下注买1号球3的金额', 'float(11,2)', 'Float', 'num1Ball3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1402, 34, 'num1_ball4', '下注买1号球4的金额', 'float(11,2)', 'Float', 'num1Ball4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1403, 34, 'num1_ball5', '下注买1号球5的金额', 'float(11,2)', 'Float', 'num1Ball5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1404, 34, 'num1_ball6', '下注买1号球6的金额', 'float(11,2)', 'Float', 'num1Ball6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1405, 34, 'num1_ball7', '下注买1号球7的金额', 'float(11,2)', 'Float', 'num1Ball7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1406, 34, 'num1_ball8', '下注买1号球8的金额', 'float(11,2)', 'Float', 'num1Ball8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1407, 34, 'num1_ball9', '下注买1号球9的金额', 'float(11,2)', 'Float', 'num1Ball9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1408, 34, 'num2_big', '下注买2号球大的金额', 'float(11,2)', 'Float', 'num2Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 30, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1409, 34, 'num2_small', '下注买2号球小的金额', 'float(11,2)', 'Float', 'num2Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 31, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1410, 34, 'num2_single', '下注买2号球单的金额', 'float(11,2)', 'Float', 'num2Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 32, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1411, 34, 'num2_double', '下注买2号球双的金额', 'float(11,2)', 'Float', 'num2Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 33, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1412, 34, 'num2_ball0', '下注买2号球0的金额', 'float(11,2)', 'Float', 'num2Ball0', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 34, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1413, 34, 'num2_ball1', '下注买2号球1的金额', 'float(11,2)', 'Float', 'num2Ball1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 35, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1414, 34, 'num2_ball2', '下注买2号球2的金额', 'float(11,2)', 'Float', 'num2Ball2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 36, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1415, 34, 'num2_ball3', '下注买2号球3的金额', 'float(11,2)', 'Float', 'num2Ball3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 37, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1416, 34, 'num2_ball4', '下注买2号球4的金额', 'float(11,2)', 'Float', 'num2Ball4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 38, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1417, 34, 'num2_ball5', '下注买2号球5的金额', 'float(11,2)', 'Float', 'num2Ball5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 39, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1418, 34, 'num2_ball6', '下注买2号球6的金额', 'float(11,2)', 'Float', 'num2Ball6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 40, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1419, 34, 'num2_ball7', '下注买2号球7的金额', 'float(11,2)', 'Float', 'num2Ball7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 41, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1420, 34, 'num2_ball8', '下注买2号球8的金额', 'float(11,2)', 'Float', 'num2Ball8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 42, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1421, 34, 'num2_ball9', '下注买2号球9的金额', 'float(11,2)', 'Float', 'num2Ball9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 43, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1422, 34, 'num3_big', '下注买3号球大的金额', 'float(11,2)', 'Float', 'num3Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 44, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1423, 34, 'num3_small', '下注买3号球小的金额', 'float(11,2)', 'Float', 'num3Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 45, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1424, 34, 'num3_single', '下注买3号球单的金额', 'float(11,2)', 'Float', 'num3Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 46, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1425, 34, 'num3_double', '下注买3号球双的金额', 'float(11,2)', 'Float', 'num3Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 47, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1426, 34, 'num3_ball0', '下注买3号球0的金额', 'float(11,2)', 'Float', 'num3Ball0', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 48, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1427, 34, 'num3_ball1', '下注买3号球1的金额', 'float(11,2)', 'Float', 'num3Ball1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 49, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1428, 34, 'num3_ball2', '下注买3号球2的金额', 'float(11,2)', 'Float', 'num3Ball2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 50, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1429, 34, 'num3_ball3', '下注买3号球3的金额', 'float(11,2)', 'Float', 'num3Ball3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 51, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1430, 34, 'num3_ball4', '下注买3号球4的金额', 'float(11,2)', 'Float', 'num3Ball4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 52, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1431, 34, 'num3_ball5', '下注买3号球5的金额', 'float(11,2)', 'Float', 'num3Ball5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 53, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1432, 34, 'num3_ball6', '下注买3号球6的金额', 'float(11,2)', 'Float', 'num3Ball6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 54, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1433, 34, 'num3_ball7', '下注买3号球7的金额', 'float(11,2)', 'Float', 'num3Ball7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 55, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1434, 34, 'num3_ball8', '下注买3号球8的金额', 'float(11,2)', 'Float', 'num3Ball8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 56, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1435, 34, 'num3_ball9', '下注买3号球9的金额', 'float(11,2)', 'Float', 'num3Ball9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 57, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1436, 34, 'num4_big', '下注买4号球大的金额', 'float(11,2)', 'Float', 'num4Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 58, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1437, 34, 'num4_small', '下注买4号球小的金额', 'float(11,2)', 'Float', 'num4Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 59, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1438, 34, 'num4_single', '下注买4号球单的金额', 'float(11,2)', 'Float', 'num4Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 60, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1439, 34, 'num4_double', '下注买4号球双的金额', 'float(11,2)', 'Float', 'num4Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 61, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1440, 34, 'num4_ball0', '下注买4号球0的金额', 'float(11,2)', 'Float', 'num4Ball0', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 62, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1441, 34, 'num4_ball1', '下注买4号球1的金额', 'float(11,2)', 'Float', 'num4Ball1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 63, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1442, 34, 'num4_ball2', '下注买4号球2的金额', 'float(11,2)', 'Float', 'num4Ball2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 64, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1443, 34, 'num4_ball3', '下注买4号球3的金额', 'float(11,2)', 'Float', 'num4Ball3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 65, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1444, 34, 'num4_ball4', '下注买4号球4的金额', 'float(11,2)', 'Float', 'num4Ball4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 66, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1445, 34, 'num4_ball5', '下注买4号球5的金额', 'float(11,2)', 'Float', 'num4Ball5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 67, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1446, 34, 'num4_ball6', '下注买4号球6的金额', 'float(11,2)', 'Float', 'num4Ball6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 68, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1447, 34, 'num4_ball7', '下注买4号球7的金额', 'float(11,2)', 'Float', 'num4Ball7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 69, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1448, 34, 'num4_ball8', '下注买4号球8的金额', 'float(11,2)', 'Float', 'num4Ball8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 70, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1449, 34, 'num4_ball9', '下注买4号球9的金额', 'float(11,2)', 'Float', 'num4Ball9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 71, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1450, 34, 'num5_big', '下注买5号球大的金额', 'float(11,2)', 'Float', 'num5Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 72, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1451, 34, 'num5_small', '下注买5号球小的金额', 'float(11,2)', 'Float', 'num5Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 73, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1452, 34, 'num5_single', '下注买5号球单的金额', 'float(11,2)', 'Float', 'num5Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 74, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1453, 34, 'num5_double', '下注买5号球双的金额', 'float(11,2)', 'Float', 'num5Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 75, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1454, 34, 'num5_ball0', '下注买5号球0的金额', 'float(11,2)', 'Float', 'num5Ball0', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 76, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1455, 34, 'num5_ball1', '下注买5号球1的金额', 'float(11,2)', 'Float', 'num5Ball1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 77, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1456, 34, 'num5_ball2', '下注买5号球2的金额', 'float(11,2)', 'Float', 'num5Ball2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 78, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1457, 34, 'num5_ball3', '下注买5号球3的金额', 'float(11,2)', 'Float', 'num5Ball3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 79, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1458, 34, 'num5_ball4', '下注买5号球4的金额', 'float(11,2)', 'Float', 'num5Ball4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 80, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1459, 34, 'num5_ball5', '下注买5号球5的金额', 'float(11,2)', 'Float', 'num5Ball5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 81, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1460, 34, 'num5_ball6', '下注买5号球6的金额', 'float(11,2)', 'Float', 'num5Ball6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 82, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1461, 34, 'num5_ball7', '下注买5号球7的金额', 'float(11,2)', 'Float', 'num5Ball7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 83, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1462, 34, 'num5_ball8', '下注买5号球8的金额', 'float(11,2)', 'Float', 'num5Ball8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 84, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1463, 34, 'num5_ball9', '下注买5号球9的金额', 'float(11,2)', 'Float', 'num5Ball9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 85, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1464, 34, 'first_bao', '下注买前三豹的金额', 'float(11,2)', 'Float', 'firstBao', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 86, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1465, 34, 'first_dui', '下注买前三对的金额', 'float(11,2)', 'Float', 'firstDui', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 87, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1466, 34, 'first_sun', '下注买前三顺的金额', 'float(11,2)', 'Float', 'firstSun', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 88, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1467, 34, 'first_ban', '下注买前三半的金额', 'float(11,2)', 'Float', 'firstBan', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 89, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1468, 34, 'first_za', '下注买前三杂的金额', 'float(11,2)', 'Float', 'firstZa', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 90, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1469, 34, 'mid_bao', '下注买中三豹的的金额', 'float(11,2)', 'Float', 'midBao', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 91, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1470, 34, 'mid_dui', '下注买中三对的的金额', 'float(11,2)', 'Float', 'midDui', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 92, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1471, 34, 'mid_sun', '下注买中三顺的的金额', 'float(11,2)', 'Float', 'midSun', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 93, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1472, 34, 'mid_ban', '下注买中三半的的金额', 'float(11,2)', 'Float', 'midBan', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 94, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1473, 34, 'mid_za', '下注买中三杂的的金额', 'float(11,2)', 'Float', 'midZa', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 95, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1474, 34, 'back_bao', '下注买后三豹的的金额', 'float(11,2)', 'Float', 'backBao', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 96, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1475, 34, 'back_dui', '下注买后三对的的金额', 'float(11,2)', 'Float', 'backDui', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 97, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1476, 34, 'back_sun', '下注买后三顺的的金额', 'float(11,2)', 'Float', 'backSun', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 98, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1477, 34, 'back_ban', '下注买后三半的的金额', 'float(11,2)', 'Float', 'backBan', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 99, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1478, 34, 'back_za', '下注买后三杂的的金额', 'float(11,2)', 'Float', 'backZa', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 100, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1479, 34, 'num1', '开奖号码1', 'int(11)', 'Integer', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 101, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1480, 34, 'num2', '开奖号码2', 'int(11)', 'Integer', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 102, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1481, 34, 'num3', '开奖号码3', 'int(11)', 'Integer', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 103, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1482, 34, 'num4', '开奖号码4', 'int(11)', 'Integer', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 104, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1483, 34, 'num5', '开奖号码5', 'int(11)', 'Integer', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 105, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1484, 34, 'sum', '开奖合算数字', 'int(11)', 'Integer', 'sum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 106, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1485, 34, 'is_delete', '是否扣除(0否 1是)', 'char(1)', 'String', 'isDelete', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 107, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1486, 34, 'is_deduct', '是否扣除', 'char(1)', 'String', 'isDeduct', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 108, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1487, 34, 'house', '房间号', 'int(4)', 'Integer', 'house', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 109, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1488, 34, 'hz_id', '是否合庄模式', 'char(1)', 'String', 'hzId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 110, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1489, 34, 'hz_user', '是否用户(0否 1是)', 'char(1)', 'String', 'hzUser', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 111, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1490, 34, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 112, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1491, 34, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 113, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1492, 34, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 114, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1493, 34, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 115, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');
INSERT INTO `gen_table_column` VALUES (1494, 34, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 116, 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25');

-- ----------------------------
-- Table structure for jnd
-- ----------------------------
DROP TABLE IF EXISTS `jnd`;
CREATE TABLE `jnd`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '期数',
  `time` datetime NULL DEFAULT NULL COMMENT '开奖时间',
  `sum_1` int(11) NULL DEFAULT NULL COMMENT '开奖号码1',
  `sum_2` int(11) NULL DEFAULT NULL COMMENT '开奖号码2',
  `sum_3` int(11) NULL DEFAULT NULL COMMENT '开奖号码3',
  `num1` int(11) NULL DEFAULT NULL COMMENT '无效字段1',
  `num2` int(11) NULL DEFAULT NULL COMMENT '无效字段2',
  `num3` int(11) NULL DEFAULT NULL COMMENT '无效字段3',
  `num4` int(11) NULL DEFAULT NULL COMMENT '无效字段4',
  `num5` int(11) NULL DEFAULT NULL COMMENT '无效字段5',
  `num6` int(11) NULL DEFAULT NULL COMMENT '无效字段6',
  `num7` int(11) NULL DEFAULT NULL COMMENT '无效字段7',
  `num8` int(11) NULL DEFAULT NULL COMMENT '无效字段8',
  `num9` int(11) NULL DEFAULT NULL COMMENT '无效字段9',
  `num10` int(11) NULL DEFAULT NULL COMMENT '无效字段10',
  `num11` int(11) NULL DEFAULT NULL COMMENT '无效字段11',
  `num12` int(11) NULL DEFAULT NULL COMMENT '无效字段12',
  `num13` int(11) NULL DEFAULT NULL COMMENT '无效字段13',
  `num14` int(11) NULL DEFAULT NULL COMMENT '无效字段14',
  `num15` int(11) NULL DEFAULT NULL COMMENT '无效字段15',
  `num16` int(11) NULL DEFAULT NULL COMMENT '无效字段16',
  `num17` int(11) NULL DEFAULT NULL COMMENT '无效字段17',
  `num18` int(11) NULL DEFAULT NULL COMMENT '无效字段18',
  `num19` int(11) NULL DEFAULT NULL COMMENT '无效字段19',
  `num20` int(11) NULL DEFAULT NULL COMMENT '无效字段20',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3124069 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '加拿大开奖历史表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jnd
-- ----------------------------
INSERT INTO `jnd` VALUES (3120509, '2024-03-26 19:00:00', 9, 8, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120510, '2024-03-26 20:01:00', 6, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120511, '2024-03-26 20:04:30', 3, 9, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120512, '2024-03-26 20:08:00', 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120513, '2024-03-26 20:11:30', 3, 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120514, '2024-03-26 20:15:00', 4, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120515, '2024-03-26 20:18:30', 1, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120516, '2024-03-26 20:22:00', 5, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120517, '2024-03-26 20:25:30', 0, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120518, '2024-03-26 20:29:00', 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120519, '2024-03-26 20:32:30', 9, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120520, '2024-03-26 20:36:00', 6, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120521, '2024-03-26 20:39:30', 2, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120522, '2024-03-26 20:43:00', 1, 5, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120523, '2024-03-26 20:46:30', 1, 9, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120524, '2024-03-26 20:50:00', 4, 7, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120525, '2024-03-26 20:53:30', 3, 9, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120526, '2024-03-26 20:57:00', 7, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120527, '2024-03-26 21:00:30', 7, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120528, '2024-03-26 21:04:00', 4, 9, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120529, '2024-03-26 21:07:30', 2, 8, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120530, '2024-03-26 21:11:00', 4, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120531, '2024-03-26 21:14:30', 7, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120532, '2024-03-26 21:18:00', 5, 5, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120533, '2024-03-26 21:21:30', 3, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120534, '2024-03-26 21:25:00', 6, 2, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120535, '2024-03-26 21:28:30', 6, 6, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120536, '2024-03-26 21:32:00', 8, 3, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120537, '2024-03-26 21:35:30', 3, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120538, '2024-03-26 21:39:00', 3, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120539, '2024-03-26 21:42:30', 0, 7, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120540, '2024-03-26 21:46:00', 6, 8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120541, '2024-03-26 21:49:30', 2, 2, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120542, '2024-03-26 21:53:00', 2, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120543, '2024-03-26 21:56:30', 4, 4, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120544, '2024-03-26 22:00:00', 8, 6, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120545, '2024-03-26 22:03:30', 3, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120546, '2024-03-26 22:07:00', 7, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120547, '2024-03-26 22:10:30', 5, 9, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120548, '2024-03-26 22:14:00', 9, 8, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120549, '2024-03-26 22:17:30', 1, 9, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120550, '2024-03-26 22:21:00', 4, 9, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120551, '2024-03-26 22:24:30', 6, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120552, '2024-03-26 22:28:00', 5, 5, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120553, '2024-03-26 22:31:30', 3, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120554, '2024-03-26 22:35:00', 2, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120555, '2024-03-26 22:38:30', 6, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120556, '2024-03-26 22:42:00', 0, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120557, '2024-03-26 22:45:30', 0, 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:47:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120558, '2024-03-26 22:49:00', 5, 7, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:50:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120559, '2024-03-26 22:52:30', 1, 7, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-26 22:54:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120917, '2024-03-27 20:46:30', 5, 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 20:48:02', '', NULL, '');
INSERT INTO `jnd` VALUES (3120918, '2024-03-27 20:50:00', 8, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 20:51:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120919, '2024-03-27 20:53:30', 3, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 20:54:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120920, '2024-03-27 20:57:00', 1, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 20:58:04', '', NULL, '');
INSERT INTO `jnd` VALUES (3120921, '2024-03-27 21:00:30', 0, 8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 21:01:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120922, '2024-03-27 21:04:00', 3, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 21:05:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120923, '2024-03-27 21:07:30', 1, 8, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 21:08:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120924, '2024-03-27 21:11:00', 9, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 21:12:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120925, '2024-03-27 21:14:30', 4, 7, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 21:15:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120926, '2024-03-27 21:18:00', 2, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 21:19:01', '', NULL, '');
INSERT INTO `jnd` VALUES (3120927, '2024-03-27 21:21:30', 0, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 21:22:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120928, '2024-03-27 21:25:00', 9, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 21:26:02', '', NULL, '');
INSERT INTO `jnd` VALUES (3120929, '2024-03-27 21:28:30', 2, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 21:29:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120930, '2024-03-27 21:32:00', 0, 7, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 21:33:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120931, '2024-03-27 21:35:30', 1, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 21:36:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120932, '2024-03-27 21:39:00', 2, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 21:40:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120933, '2024-03-27 21:42:30', 8, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 21:44:01', '', NULL, '');
INSERT INTO `jnd` VALUES (3120934, '2024-03-27 21:46:00', 5, 8, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 21:47:01', '', NULL, '');
INSERT INTO `jnd` VALUES (3120935, '2024-03-27 21:49:30', 3, 8, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 21:50:01', '', NULL, '');
INSERT INTO `jnd` VALUES (3120936, '2024-03-27 21:53:00', 2, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 21:54:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120937, '2024-03-27 21:56:30', 7, 9, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 21:57:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120938, '2024-03-27 22:00:00', 3, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 22:01:01', '', NULL, '');
INSERT INTO `jnd` VALUES (3120939, '2024-03-27 22:03:30', 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 22:04:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120940, '2024-03-27 22:07:00', 2, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 22:08:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120941, '2024-03-27 22:10:30', 6, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 22:11:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120942, '2024-03-27 22:14:00', 6, 5, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 22:15:02', '', NULL, '');
INSERT INTO `jnd` VALUES (3120943, '2024-03-27 22:17:30', 8, 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 22:19:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120944, '2024-03-27 22:21:00', 1, 6, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 22:22:04', '', NULL, '');
INSERT INTO `jnd` VALUES (3120945, '2024-03-27 22:24:30', 4, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 22:25:02', '', NULL, '');
INSERT INTO `jnd` VALUES (3120946, '2024-03-27 22:28:00', 9, 8, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 22:29:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120947, '2024-03-27 22:31:30', 9, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 22:32:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120948, '2024-03-27 22:35:00', 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 22:36:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120949, '2024-03-27 22:38:30', 3, 9, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 22:39:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120950, '2024-03-27 22:42:00', 0, 5, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 22:43:01', '', NULL, '');
INSERT INTO `jnd` VALUES (3120951, '2024-03-27 22:45:30', 9, 5, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 22:46:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120952, '2024-03-27 22:49:00', 1, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 22:50:01', '', NULL, '');
INSERT INTO `jnd` VALUES (3120953, '2024-03-27 22:52:30', 2, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 22:53:01', '', NULL, '');
INSERT INTO `jnd` VALUES (3120954, '2024-03-27 22:56:00', 1, 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 22:57:01', '', NULL, '');
INSERT INTO `jnd` VALUES (3120955, '2024-03-27 22:59:30', 1, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 23:00:01', '', NULL, '');
INSERT INTO `jnd` VALUES (3120956, '2024-03-27 23:03:00', 5, 5, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 23:04:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120957, '2024-03-27 23:06:30', 0, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 23:07:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120958, '2024-03-27 23:10:00', 5, 8, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 23:11:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120959, '2024-03-27 23:13:30', 7, 9, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 23:15:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120960, '2024-03-27 23:17:00', 9, 4, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 23:18:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120961, '2024-03-27 23:20:30', 9, 6, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 23:21:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120962, '2024-03-27 23:24:00', 4, 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 23:25:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120963, '2024-03-27 23:27:30', 0, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 23:28:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3120964, '2024-03-27 23:31:00', 3, 6, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 23:32:06', '', NULL, '');
INSERT INTO `jnd` VALUES (3120965, '2024-03-27 23:34:30', 4, 8, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-27 23:35:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121301, '2024-03-28 20:32:30', 7, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 20:33:02', '', NULL, '');
INSERT INTO `jnd` VALUES (3121302, '2024-03-28 20:36:00', 3, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 20:37:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121303, '2024-03-28 20:39:30', 7, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 20:40:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121304, '2024-03-28 20:43:00', 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 20:44:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121305, '2024-03-28 20:46:30', 6, 8, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 20:47:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121306, '2024-03-28 20:50:00', 1, 4, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 20:51:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121307, '2024-03-28 20:53:30', 7, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 20:54:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121308, '2024-03-28 20:57:00', 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 20:58:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121309, '2024-03-28 21:00:30', 8, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 21:01:01', '', NULL, '');
INSERT INTO `jnd` VALUES (3121310, '2024-03-28 21:04:00', 3, 8, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 21:05:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121311, '2024-03-28 21:07:30', 1, 6, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 21:08:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121312, '2024-03-28 21:11:00', 5, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 21:12:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121313, '2024-03-28 21:14:30', 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 21:15:02', '', NULL, '');
INSERT INTO `jnd` VALUES (3121314, '2024-03-28 21:18:00', 2, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 21:19:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121315, '2024-03-28 21:21:30', 3, 8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 21:22:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121316, '2024-03-28 21:25:00', 5, 8, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 21:26:01', '', NULL, '');
INSERT INTO `jnd` VALUES (3121317, '2024-03-28 21:28:30', 0, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 21:29:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121318, '2024-03-28 21:32:00', 7, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 21:33:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121319, '2024-03-28 21:35:30', 3, 7, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 21:36:02', '', NULL, '');
INSERT INTO `jnd` VALUES (3121320, '2024-03-28 21:39:00', 2, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 21:40:01', '', NULL, '');
INSERT INTO `jnd` VALUES (3121321, '2024-03-28 21:42:30', 4, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 21:43:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121322, '2024-03-28 21:46:00', 1, 7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 21:47:01', '', NULL, '');
INSERT INTO `jnd` VALUES (3121323, '2024-03-28 21:49:30', 2, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 21:51:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121324, '2024-03-28 21:53:00', 6, 7, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 21:54:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121325, '2024-03-28 21:56:30', 5, 7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 21:57:01', '', NULL, '');
INSERT INTO `jnd` VALUES (3121326, '2024-03-28 22:00:00', 7, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 22:01:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121327, '2024-03-28 22:03:30', 6, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 22:04:01', '', NULL, '');
INSERT INTO `jnd` VALUES (3121328, '2024-03-28 22:07:00', 1, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 22:08:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121329, '2024-03-28 22:10:30', 3, 4, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 22:11:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121330, '2024-03-28 22:14:00', 6, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 22:15:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121331, '2024-03-28 22:17:30', 7, 2, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 22:18:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3121332, '2024-03-28 22:21:00', 0, 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-03-28 22:22:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122868, '2024-04-01 21:07:30', 2, 7, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 21:09:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122869, '2024-04-01 21:11:00', 6, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 21:12:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122870, '2024-04-01 21:14:30', 4, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 21:16:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122871, '2024-04-01 21:18:00', 8, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 21:19:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122872, '2024-04-01 21:21:30', 1, 9, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 21:22:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122873, '2024-04-01 21:25:00', 6, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 21:26:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122874, '2024-04-01 21:28:30', 5, 6, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 21:29:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122875, '2024-04-01 21:32:00', 1, 6, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 21:33:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122876, '2024-04-01 21:35:30', 0, 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 21:36:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122877, '2024-04-01 21:39:00', 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 21:40:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122878, '2024-04-01 21:42:30', 1, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 21:43:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122879, '2024-04-01 21:46:00', 3, 5, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 21:47:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122880, '2024-04-01 21:49:30', 4, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 21:51:18', '', NULL, '');
INSERT INTO `jnd` VALUES (3122881, '2024-04-01 21:53:00', 4, 9, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 21:54:03', '', NULL, '');
INSERT INTO `jnd` VALUES (3122882, '2024-04-01 21:56:30', 2, 8, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 21:57:15', '', NULL, '');
INSERT INTO `jnd` VALUES (3122883, '2024-04-01 22:00:00', 6, 8, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 22:01:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122884, '2024-04-01 22:03:30', 7, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 22:04:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122885, '2024-04-01 22:07:00', 9, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 22:08:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122886, '2024-04-01 22:10:30', 4, 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 22:12:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122887, '2024-04-01 22:14:00', 2, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 22:15:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122888, '2024-04-01 22:17:30', 4, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 22:19:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122889, '2024-04-01 22:21:00', 3, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 22:22:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122890, '2024-04-01 22:24:30', 6, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 22:25:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122891, '2024-04-01 22:28:00', 1, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 22:29:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122892, '2024-04-01 22:31:30', 6, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 22:32:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122893, '2024-04-01 22:35:00', 9, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 22:36:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122894, '2024-04-01 22:38:30', 4, 5, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 22:39:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122895, '2024-04-01 22:42:00', 7, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 22:43:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122896, '2024-04-01 22:45:30', 0, 9, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 22:47:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122897, '2024-04-01 22:49:00', 9, 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 22:50:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122898, '2024-04-01 22:52:30', 2, 6, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 22:53:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122899, '2024-04-01 22:56:00', 3, 2, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 22:57:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122900, '2024-04-01 22:59:30', 5, 6, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 23:00:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122901, '2024-04-01 23:03:00', 5, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 23:04:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122902, '2024-04-01 23:06:30', 8, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 23:08:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122903, '2024-04-01 23:10:00', 0, 8, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 23:11:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122904, '2024-04-01 23:13:30', 9, 8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 23:15:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122905, '2024-04-01 23:17:00', 3, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 23:18:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122906, '2024-04-01 23:20:30', 1, 7, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 23:21:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122907, '2024-04-01 23:24:00', 8, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 23:25:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122908, '2024-04-01 23:27:30', 4, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 23:29:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122909, '2024-04-01 23:31:00', 6, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 23:32:15', '', NULL, '');
INSERT INTO `jnd` VALUES (3122910, '2024-04-01 23:34:30', 3, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 23:35:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122911, '2024-04-01 23:38:00', 9, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 23:39:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3122912, '2024-04-01 23:41:30', 3, 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-01 23:42:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124032, '2024-04-04 20:18:30', 2, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 20:22:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124033, '2024-04-04 20:22:00', 3, 6, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 20:24:02', '', NULL, '');
INSERT INTO `jnd` VALUES (3124034, '2024-04-04 20:25:30', 9, 7, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 20:27:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124035, '2024-04-04 20:29:00', 4, 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 20:30:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124036, '2024-04-04 20:32:30', 7, 5, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 20:34:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124037, '2024-04-04 20:36:00', 8, 9, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 20:37:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124038, '2024-04-04 20:39:30', 5, 9, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 20:41:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124039, '2024-04-04 20:43:00', 2, 8, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 20:45:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124040, '2024-04-04 20:46:30', 9, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 20:49:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124041, '2024-04-04 20:50:00', 6, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 20:51:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124042, '2024-04-04 20:53:30', 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 20:55:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124043, '2024-04-04 20:57:00', 1, 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 20:58:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124044, '2024-04-04 21:00:30', 4, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 21:02:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124045, '2024-04-04 21:04:00', 9, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 21:05:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124046, '2024-04-04 21:07:30', 5, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 21:09:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124047, '2024-04-04 21:11:00', 7, 9, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 21:12:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124048, '2024-04-04 21:14:30', 1, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 21:16:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124049, '2024-04-04 21:18:00', 4, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 21:20:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124050, '2024-04-04 21:21:30', 7, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 21:24:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124051, '2024-04-04 21:25:00', 4, 8, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 21:26:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124052, '2024-04-04 21:28:30', 1, 5, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 21:30:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124053, '2024-04-04 21:32:00', 0, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 21:33:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124054, '2024-04-04 21:35:30', 2, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 21:37:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124055, '2024-04-04 21:39:00', 8, 7, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 21:40:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124056, '2024-04-04 21:42:30', 1, 8, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 21:43:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124057, '2024-04-04 21:46:00', 0, 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 21:48:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124058, '2024-04-04 21:49:30', 5, 2, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 21:51:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124059, '2024-04-04 21:53:00', 3, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 21:55:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124060, '2024-04-04 21:56:30', 7, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 21:58:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124061, '2024-04-04 22:00:00', 0, 6, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 22:01:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124062, '2024-04-04 22:03:30', 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 22:05:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124063, '2024-04-04 22:07:00', 8, 8, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 22:08:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124064, '2024-04-04 22:10:30', 8, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 22:12:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124065, '2024-04-04 22:14:00', 5, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 22:16:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124066, '2024-04-04 22:17:30', 0, 8, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 22:19:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124067, '2024-04-04 22:21:00', 1, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 22:23:00', '', NULL, '');
INSERT INTO `jnd` VALUES (3124068, '2024-04-04 22:24:30', 6, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TASK', '2024-04-04 22:26:00', '', NULL, '');

-- ----------------------------
-- Table structure for jnd28
-- ----------------------------
DROP TABLE IF EXISTS `jnd28`;
CREATE TABLE `jnd28`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '期数',
  `num1` int(11) NULL DEFAULT NULL COMMENT '开奖号码1',
  `num2` int(11) NULL DEFAULT NULL COMMENT '开奖号码2',
  `num3` int(11) NULL DEFAULT NULL COMMENT '开奖号码3',
  `sum_num` int(11) NULL DEFAULT NULL COMMENT '开奖合计号码',
  `bet_time` datetime NOT NULL COMMENT '封盘投注截止时间',
  `pre_time` datetime NOT NULL COMMENT '预计开奖时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否已经开奖（0未开奖 1已开奖）',
  `the_time` datetime NULL DEFAULT NULL COMMENT '开奖时间',
  `count_money` int(11) NULL DEFAULT 0 COMMENT '总下注金额',
  `win_money` int(11) NULL DEFAULT 0 COMMENT '总中奖金额',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3122913 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '加拿大开奖表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jnd28
-- ----------------------------
INSERT INTO `jnd28` VALUES (3122911, NULL, NULL, NULL, NULL, '2024-04-01 23:37:15', '2024-04-01 23:38:10', '0', NULL, 0, 0, 'CreateJndData', '2024-04-01 23:37:30', 'lotteryJndBalance', '2024-04-01 23:42:02', '');
INSERT INTO `jnd28` VALUES (3122912, NULL, NULL, NULL, NULL, '2024-04-01 23:40:45', '2024-04-01 23:41:40', '0', NULL, 0, 0, 'CreateJndData', '2024-04-01 23:37:30', '', NULL, '');

-- ----------------------------
-- Table structure for jndrecord
-- ----------------------------
DROP TABLE IF EXISTS `jndrecord`;
CREATE TABLE `jndrecord`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '下注表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `periods` bigint(20) NOT NULL COMMENT '期数',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '投注状态（0投注 1撤单）',
  `record_time` datetime NOT NULL COMMENT '投注时间',
  `check_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '确认时间',
  `count_money` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注金额',
  `win_money` float(11, 2) NULL DEFAULT 0.00 COMMENT '中奖金额',
  `big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注大的金额',
  `small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注小的金额',
  `single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注单的金额',
  `double_amount` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注双的金额',
  `much_Big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注极大的金额',
  `big_Single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注大单的金额',
  `small_Single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注小单的金额',
  `big_Double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注大双的金额',
  `small_Double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注小双的金额',
  `much_Small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注极小的金额',
  `num0` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字0的金额',
  `num1` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字1的金额',
  `num2` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字2的金额',
  `num3` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字3的金额',
  `num4` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字4的金额',
  `num5` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字5的金额',
  `num6` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字6的金额',
  `num7` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字7的金额',
  `num8` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字8的金额',
  `num9` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字9的金额',
  `num10` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字10的金额',
  `num11` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字11的金额',
  `num12` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字12的金额',
  `num13` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字13的金额',
  `num14` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字14的金额',
  `num15` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字15的金额',
  `num16` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字16的金额',
  `num17` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字17的金额',
  `num18` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字18的金额',
  `num19` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字19的金额',
  `num20` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字20的金额',
  `num21` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字21的金额',
  `num22` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字22的金额',
  `num23` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字23的金额',
  `num24` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字24的金额',
  `num25` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字25的金额',
  `num26` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字26的金额',
  `num27` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注数字27的金额',
  `red` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注红的金额',
  `green` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注绿的金额',
  `blue` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注蓝的金额',
  `loong` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注龙的金额',
  `tiger` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注虎的金额',
  `close` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注合的金额',
  `leopard` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注豹子的金额',
  `pairs` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注对子的金额',
  `shun` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注顺子的金额',
  `vip` int(4) NOT NULL COMMENT 'VIP房间',
  `n1` int(11) NULL DEFAULT NULL COMMENT '开奖号码1',
  `n2` int(11) NULL DEFAULT NULL COMMENT '开奖号码2',
  `n3` int(11) NULL DEFAULT NULL COMMENT '开奖号码3',
  `sum_num` int(11) NULL DEFAULT 0 COMMENT '开奖合算数字',
  `is_delete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否扣除(0否 1是)',
  `is_deduct` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否扣除',
  `house` int(4) NOT NULL DEFAULT 0 COMMENT '房间号',
  `hz_id` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否合庄模式',
  `hz_user` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否用户(0否 1是)',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `user_id_2`(`user_id`, `periods`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '加拿大下注表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jndrecord
-- ----------------------------

-- ----------------------------
-- Table structure for jsssc
-- ----------------------------
DROP TABLE IF EXISTS `jsssc`;
CREATE TABLE `jsssc`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '期数',
  `time` datetime NULL DEFAULT NULL COMMENT '开奖时间',
  `num1` int(11) NULL DEFAULT NULL COMMENT '开奖号码1',
  `num2` int(11) NULL DEFAULT NULL COMMENT '开奖号码2',
  `num3` int(11) NULL DEFAULT NULL COMMENT '开奖号码3',
  `num4` int(11) NULL DEFAULT NULL COMMENT '开奖号码4',
  `num5` int(11) NULL DEFAULT NULL COMMENT '开奖号码5',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3954548 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '极速时时彩开奖历史表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jsssc
-- ----------------------------
INSERT INTO `jsssc` VALUES (3947541, '2024-03-26 21:44:18', 4, 6, 7, 5, 3, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947542, '2024-03-26 21:45:33', 3, 10, 5, 1, 6, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947543, '2024-03-26 21:46:48', 8, 7, 3, 9, 2, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947544, '2024-03-26 21:48:03', 10, 5, 3, 7, 9, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947545, '2024-03-26 21:49:18', 6, 4, 3, 7, 10, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947546, '2024-03-26 21:50:33', 4, 3, 10, 6, 8, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947547, '2024-03-26 21:51:48', 6, 1, 2, 5, 9, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947548, '2024-03-26 21:53:03', 5, 2, 9, 3, 8, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947549, '2024-03-26 21:54:18', 6, 7, 9, 2, 4, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947550, '2024-03-26 21:55:33', 4, 2, 5, 10, 7, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947551, '2024-03-26 21:56:48', 5, 6, 1, 3, 8, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947552, '2024-03-26 21:58:03', 7, 5, 9, 6, 10, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947553, '2024-03-26 21:59:18', 6, 5, 8, 4, 1, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947554, '2024-03-26 22:00:33', 3, 10, 6, 8, 7, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947555, '2024-03-26 22:01:48', 10, 2, 8, 3, 6, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947556, '2024-03-26 22:03:03', 2, 10, 1, 8, 6, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947557, '2024-03-26 22:04:18', 8, 1, 3, 5, 9, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947558, '2024-03-26 22:05:33', 1, 4, 6, 3, 8, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947559, '2024-03-26 22:06:48', 7, 9, 8, 6, 1, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947560, '2024-03-26 22:08:03', 6, 7, 1, 10, 3, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947561, '2024-03-26 22:09:18', 9, 7, 4, 1, 5, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947562, '2024-03-26 22:10:33', 5, 8, 3, 7, 6, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947563, '2024-03-26 22:11:48', 4, 1, 3, 2, 10, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947564, '2024-03-26 22:13:03', 1, 3, 9, 10, 7, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947565, '2024-03-26 22:14:18', 7, 6, 5, 2, 3, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947566, '2024-03-26 22:15:33', 7, 5, 3, 6, 9, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947567, '2024-03-26 22:16:48', 3, 5, 9, 7, 8, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947568, '2024-03-26 22:18:03', 6, 10, 5, 3, 9, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947569, '2024-03-26 22:19:18', 9, 10, 2, 1, 8, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947570, '2024-03-26 22:20:33', 8, 5, 2, 10, 9, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947571, '2024-03-26 22:21:48', 5, 10, 9, 2, 8, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947572, '2024-03-26 22:23:03', 6, 2, 3, 1, 8, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947573, '2024-03-26 22:24:18', 8, 1, 9, 7, 10, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947574, '2024-03-26 22:25:33', 5, 7, 4, 9, 3, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947575, '2024-03-26 22:26:48', 9, 4, 5, 7, 2, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947576, '2024-03-26 22:28:03', 5, 7, 2, 3, 10, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947577, '2024-03-26 22:29:18', 7, 1, 6, 8, 5, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947578, '2024-03-26 22:30:33', 8, 1, 5, 9, 3, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947579, '2024-03-26 22:31:48', 1, 4, 9, 7, 8, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947580, '2024-03-26 22:33:03', 4, 2, 8, 6, 3, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947581, '2024-03-26 22:34:18', 8, 6, 9, 7, 4, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947582, '2024-03-26 22:35:33', 5, 6, 4, 3, 9, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947583, '2024-03-26 22:36:48', 10, 4, 5, 8, 3, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947584, '2024-03-26 22:38:03', 9, 8, 6, 3, 5, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947585, '2024-03-26 22:39:18', 1, 4, 7, 10, 2, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947586, '2024-03-26 22:40:33', 5, 4, 2, 8, 6, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947587, '2024-03-26 22:41:48', 5, 7, 10, 1, 9, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947588, '2024-03-26 22:43:03', 5, 1, 7, 8, 2, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947589, '2024-03-26 22:44:18', 8, 7, 5, 4, 9, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947590, '2024-03-26 22:45:33', 6, 8, 9, 2, 5, 'TASK', '2024-03-26 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947591, '2024-03-26 22:46:48', 4, 1, 9, 2, 3, 'TASK', '2024-03-26 22:47:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947592, '2024-03-26 22:48:03', 9, 4, 7, 10, 6, 'TASK', '2024-03-26 22:49:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947593, '2024-03-26 22:49:18', 5, 1, 6, 9, 10, 'TASK', '2024-03-26 22:50:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947594, '2024-03-26 22:50:33', 10, 6, 8, 2, 5, 'TASK', '2024-03-26 22:51:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947595, '2024-03-26 22:51:48', 1, 8, 2, 6, 7, 'TASK', '2024-03-26 22:52:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947596, '2024-03-26 22:53:03', 1, 8, 3, 6, 5, 'TASK', '2024-03-26 22:54:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947597, '2024-03-26 22:54:18', 5, 4, 10, 1, 8, 'TASK', '2024-03-26 22:55:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3947598, '2024-03-26 22:55:33', 1, 3, 9, 6, 8, 'TASK', '2024-03-26 22:56:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948647, '2024-03-27 20:46:48', 6, 8, 3, 5, 9, 'TASK', '2024-03-27 20:48:02', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948648, '2024-03-27 20:48:03', 1, 2, 5, 10, 4, 'TASK', '2024-03-27 20:49:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948649, '2024-03-27 20:49:18', 2, 4, 1, 10, 9, 'TASK', '2024-03-27 20:50:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948650, '2024-03-27 20:50:33', 3, 9, 10, 8, 6, 'TASK', '2024-03-27 20:51:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948651, '2024-03-27 20:51:48', 7, 4, 6, 10, 1, 'TASK', '2024-03-27 20:52:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948652, '2024-03-27 20:53:03', 10, 7, 8, 1, 4, 'TASK', '2024-03-27 20:54:03', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948653, '2024-03-27 20:54:18', 10, 5, 9, 7, 4, 'TASK', '2024-03-27 20:55:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948654, '2024-03-27 20:55:33', 1, 8, 3, 10, 7, 'TASK', '2024-03-27 20:56:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948655, '2024-03-27 20:56:48', 6, 3, 10, 5, 7, 'TASK', '2024-03-27 20:57:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948656, '2024-03-27 20:58:03', 4, 8, 5, 3, 9, 'TASK', '2024-03-27 20:59:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948657, '2024-03-27 20:59:18', 3, 4, 8, 10, 9, 'TASK', '2024-03-27 21:00:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948658, '2024-03-27 21:00:33', 8, 6, 3, 4, 9, 'TASK', '2024-03-27 21:01:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948659, '2024-03-27 21:01:48', 2, 9, 10, 6, 5, 'TASK', '2024-03-27 21:02:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948660, '2024-03-27 21:03:03', 6, 9, 3, 5, 7, 'TASK', '2024-03-27 21:04:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948661, '2024-03-27 21:04:18', 5, 9, 8, 10, 2, 'TASK', '2024-03-27 21:05:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948662, '2024-03-27 21:05:33', 7, 2, 9, 3, 4, 'TASK', '2024-03-27 21:06:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948663, '2024-03-27 21:06:48', 10, 8, 7, 4, 1, 'TASK', '2024-03-27 21:07:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948664, '2024-03-27 21:08:03', 5, 6, 2, 4, 3, 'TASK', '2024-03-27 21:09:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948665, '2024-03-27 21:09:18', 1, 5, 2, 6, 3, 'TASK', '2024-03-27 21:10:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948666, '2024-03-27 21:10:33', 3, 2, 1, 9, 8, 'TASK', '2024-03-27 21:11:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948667, '2024-03-27 21:11:48', 10, 3, 7, 5, 9, 'TASK', '2024-03-27 21:12:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948668, '2024-03-27 21:13:03', 10, 8, 7, 9, 6, 'TASK', '2024-03-27 21:14:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948669, '2024-03-27 21:14:18', 3, 5, 6, 8, 2, 'TASK', '2024-03-27 21:15:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948670, '2024-03-27 21:15:33', 5, 1, 8, 9, 7, 'TASK', '2024-03-27 21:16:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948671, '2024-03-27 21:16:48', 5, 2, 10, 9, 4, 'TASK', '2024-03-27 21:17:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948672, '2024-03-27 21:18:03', 8, 5, 7, 6, 10, 'TASK', '2024-03-27 21:19:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948673, '2024-03-27 21:19:18', 3, 10, 2, 4, 6, 'TASK', '2024-03-27 21:20:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948674, '2024-03-27 21:20:33', 3, 6, 10, 8, 2, 'TASK', '2024-03-27 21:21:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948675, '2024-03-27 21:21:48', 10, 4, 8, 2, 3, 'TASK', '2024-03-27 21:22:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948676, '2024-03-27 21:23:03', 10, 8, 7, 1, 5, 'TASK', '2024-03-27 21:24:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948677, '2024-03-27 21:24:18', 5, 2, 6, 1, 4, 'TASK', '2024-03-27 21:25:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948678, '2024-03-27 21:25:33', 2, 5, 10, 4, 6, 'TASK', '2024-03-27 21:26:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948679, '2024-03-27 21:26:48', 6, 1, 10, 3, 7, 'TASK', '2024-03-27 21:27:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948680, '2024-03-27 21:28:03', 2, 3, 4, 1, 5, 'TASK', '2024-03-27 21:29:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948681, '2024-03-27 21:29:18', 9, 1, 3, 7, 6, 'TASK', '2024-03-27 21:30:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948682, '2024-03-27 21:30:33', 1, 10, 9, 4, 8, 'TASK', '2024-03-27 21:31:03', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948683, '2024-03-27 21:31:48', 6, 5, 2, 9, 4, 'TASK', '2024-03-27 21:32:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948684, '2024-03-27 21:33:03', 6, 5, 7, 10, 9, 'TASK', '2024-03-27 21:34:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948685, '2024-03-27 21:34:18', 5, 1, 4, 7, 9, 'TASK', '2024-03-27 21:35:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948686, '2024-03-27 21:35:33', 7, 9, 4, 2, 6, 'TASK', '2024-03-27 21:36:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948687, '2024-03-27 21:36:48', 7, 5, 8, 10, 6, 'TASK', '2024-03-27 21:37:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948688, '2024-03-27 21:38:03', 2, 3, 7, 1, 5, 'TASK', '2024-03-27 21:39:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948689, '2024-03-27 21:39:18', 7, 4, 10, 8, 6, 'TASK', '2024-03-27 21:40:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948690, '2024-03-27 21:40:33', 4, 2, 1, 6, 9, 'TASK', '2024-03-27 21:41:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948691, '2024-03-27 21:41:48', 4, 6, 3, 5, 10, 'TASK', '2024-03-27 21:42:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948692, '2024-03-27 21:43:03', 2, 8, 6, 5, 7, 'TASK', '2024-03-27 21:44:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948693, '2024-03-27 21:44:18', 9, 5, 7, 8, 4, 'TASK', '2024-03-27 21:45:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948694, '2024-03-27 21:45:33', 5, 1, 4, 8, 3, 'TASK', '2024-03-27 21:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948695, '2024-03-27 21:46:48', 3, 2, 7, 1, 8, 'TASK', '2024-03-27 21:47:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948696, '2024-03-27 21:48:03', 7, 8, 5, 10, 6, 'TASK', '2024-03-27 21:49:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948697, '2024-03-27 21:49:18', 4, 10, 9, 1, 6, 'TASK', '2024-03-27 21:50:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948698, '2024-03-27 21:50:33', 8, 1, 6, 5, 7, 'TASK', '2024-03-27 21:51:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948699, '2024-03-27 21:51:48', 8, 2, 4, 9, 10, 'TASK', '2024-03-27 21:52:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948700, '2024-03-27 21:53:03', 2, 1, 8, 4, 6, 'TASK', '2024-03-27 21:54:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948701, '2024-03-27 21:54:18', 3, 8, 2, 5, 9, 'TASK', '2024-03-27 21:55:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948702, '2024-03-27 21:55:33', 1, 9, 7, 8, 4, 'TASK', '2024-03-27 21:56:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948703, '2024-03-27 21:56:48', 10, 2, 5, 3, 7, 'TASK', '2024-03-27 21:57:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948704, '2024-03-27 21:58:03', 3, 2, 9, 5, 7, 'TASK', '2024-03-27 21:59:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948705, '2024-03-27 21:59:18', 8, 10, 7, 2, 3, 'TASK', '2024-03-27 22:00:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948706, '2024-03-27 22:00:33', 5, 4, 9, 2, 3, 'TASK', '2024-03-27 22:01:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948707, '2024-03-27 22:01:48', 7, 6, 4, 3, 10, 'TASK', '2024-03-27 22:02:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948708, '2024-03-27 22:03:03', 6, 8, 10, 2, 3, 'TASK', '2024-03-27 22:04:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948709, '2024-03-27 22:04:18', 1, 5, 7, 4, 6, 'TASK', '2024-03-27 22:05:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948710, '2024-03-27 22:05:33', 8, 6, 5, 3, 9, 'TASK', '2024-03-27 22:06:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948711, '2024-03-27 22:06:48', 3, 1, 4, 8, 10, 'TASK', '2024-03-27 22:07:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948712, '2024-03-27 22:08:03', 7, 4, 6, 1, 10, 'TASK', '2024-03-27 22:09:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948713, '2024-03-27 22:09:18', 3, 4, 9, 5, 7, 'TASK', '2024-03-27 22:10:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948714, '2024-03-27 22:10:33', 4, 10, 3, 9, 6, 'TASK', '2024-03-27 22:11:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948715, '2024-03-27 22:11:48', 5, 2, 4, 8, 7, 'TASK', '2024-03-27 22:12:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948716, '2024-03-27 22:13:03', 9, 2, 5, 10, 4, 'TASK', '2024-03-27 22:14:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948717, '2024-03-27 22:14:18', 8, 5, 7, 1, 10, 'TASK', '2024-03-27 22:15:03', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948718, '2024-03-27 22:15:33', 7, 9, 8, 10, 1, 'TASK', '2024-03-27 22:16:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948719, '2024-03-27 22:16:48', 2, 6, 7, 8, 5, 'TASK', '2024-03-27 22:17:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948720, '2024-03-27 22:18:03', 2, 8, 6, 5, 1, 'TASK', '2024-03-27 22:19:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948721, '2024-03-27 22:19:18', 1, 4, 7, 9, 10, 'TASK', '2024-03-27 22:20:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948722, '2024-03-27 22:20:33', 8, 2, 7, 3, 6, 'TASK', '2024-03-27 22:21:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948723, '2024-03-27 22:21:48', 2, 4, 3, 7, 6, 'TASK', '2024-03-27 22:22:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948724, '2024-03-27 22:23:03', 5, 7, 10, 2, 1, 'TASK', '2024-03-27 22:24:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948725, '2024-03-27 22:24:18', 5, 9, 1, 6, 10, 'TASK', '2024-03-27 22:25:02', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948726, '2024-03-27 22:25:33', 8, 6, 1, 10, 4, 'TASK', '2024-03-27 22:26:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948727, '2024-03-27 22:26:48', 3, 10, 5, 2, 7, 'TASK', '2024-03-27 22:27:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948728, '2024-03-27 22:28:03', 10, 1, 6, 8, 4, 'TASK', '2024-03-27 22:29:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948729, '2024-03-27 22:29:18', 6, 4, 7, 1, 8, 'TASK', '2024-03-27 22:30:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948730, '2024-03-27 22:30:33', 8, 9, 3, 5, 10, 'TASK', '2024-03-27 22:31:02', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948731, '2024-03-27 22:31:48', 3, 1, 8, 4, 10, 'TASK', '2024-03-27 22:32:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948732, '2024-03-27 22:33:03', 10, 8, 7, 1, 2, 'TASK', '2024-03-27 22:34:02', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948733, '2024-03-27 22:34:18', 2, 4, 5, 9, 8, 'TASK', '2024-03-27 22:35:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948734, '2024-03-27 22:35:33', 2, 6, 5, 3, 7, 'TASK', '2024-03-27 22:36:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948735, '2024-03-27 22:36:48', 6, 3, 5, 2, 10, 'TASK', '2024-03-27 22:37:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948736, '2024-03-27 22:38:03', 3, 2, 10, 6, 4, 'TASK', '2024-03-27 22:39:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948737, '2024-03-27 22:39:18', 8, 7, 2, 10, 4, 'TASK', '2024-03-27 22:40:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948738, '2024-03-27 22:40:33', 1, 6, 10, 9, 4, 'TASK', '2024-03-27 22:41:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948739, '2024-03-27 22:41:48', 2, 3, 10, 6, 5, 'TASK', '2024-03-27 22:42:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948740, '2024-03-27 22:43:03', 1, 5, 4, 2, 9, 'TASK', '2024-03-27 22:44:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948741, '2024-03-27 22:44:18', 5, 9, 7, 10, 1, 'TASK', '2024-03-27 22:45:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948742, '2024-03-27 22:45:33', 3, 9, 7, 2, 1, 'TASK', '2024-03-27 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948743, '2024-03-27 22:46:48', 10, 7, 8, 4, 5, 'TASK', '2024-03-27 22:47:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948744, '2024-03-27 22:48:03', 9, 7, 2, 5, 6, 'TASK', '2024-03-27 22:49:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948745, '2024-03-27 22:49:18', 8, 6, 3, 10, 2, 'TASK', '2024-03-27 22:50:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948746, '2024-03-27 22:50:33', 1, 8, 6, 9, 5, 'TASK', '2024-03-27 22:51:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948747, '2024-03-27 22:51:48', 3, 8, 2, 10, 1, 'TASK', '2024-03-27 22:52:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948748, '2024-03-27 22:53:03', 1, 2, 3, 10, 6, 'TASK', '2024-03-27 22:54:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948749, '2024-03-27 22:54:18', 7, 9, 2, 10, 4, 'TASK', '2024-03-27 22:55:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948750, '2024-03-27 22:55:33', 1, 2, 9, 3, 7, 'TASK', '2024-03-27 22:56:02', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948751, '2024-03-27 22:56:48', 3, 1, 9, 7, 6, 'TASK', '2024-03-27 22:57:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948752, '2024-03-27 22:58:03', 9, 10, 6, 1, 8, 'TASK', '2024-03-27 22:59:03', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948753, '2024-03-27 22:59:18', 8, 5, 2, 6, 1, 'TASK', '2024-03-27 23:00:04', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948754, '2024-03-27 23:00:33', 9, 4, 2, 8, 7, 'TASK', '2024-03-27 23:01:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948755, '2024-03-27 23:01:48', 1, 2, 6, 3, 9, 'TASK', '2024-03-27 23:02:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948756, '2024-03-27 23:03:03', 6, 5, 8, 7, 4, 'TASK', '2024-03-27 23:04:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948757, '2024-03-27 23:04:18', 6, 10, 2, 1, 3, 'TASK', '2024-03-27 23:05:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948758, '2024-03-27 23:05:33', 4, 10, 5, 3, 1, 'TASK', '2024-03-27 23:06:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948759, '2024-03-27 23:06:48', 7, 3, 8, 5, 6, 'TASK', '2024-03-27 23:07:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948760, '2024-03-27 23:08:03', 10, 6, 2, 4, 5, 'TASK', '2024-03-27 23:09:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948761, '2024-03-27 23:09:18', 5, 7, 2, 9, 6, 'TASK', '2024-03-27 23:10:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948762, '2024-03-27 23:10:33', 6, 3, 5, 9, 7, 'TASK', '2024-03-27 23:11:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948763, '2024-03-27 23:11:48', 3, 8, 9, 2, 1, 'TASK', '2024-03-27 23:12:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948764, '2024-03-27 23:13:03', 7, 8, 2, 3, 6, 'TASK', '2024-03-27 23:14:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948765, '2024-03-27 23:14:18', 6, 10, 8, 1, 4, 'TASK', '2024-03-27 23:15:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948766, '2024-03-27 23:15:33', 7, 3, 5, 1, 2, 'TASK', '2024-03-27 23:16:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948767, '2024-03-27 23:16:48', 9, 8, 1, 4, 6, 'TASK', '2024-03-27 23:17:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948768, '2024-03-27 23:18:03', 6, 5, 7, 3, 9, 'TASK', '2024-03-27 23:19:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948769, '2024-03-27 23:19:18', 9, 4, 8, 6, 3, 'TASK', '2024-03-27 23:20:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948770, '2024-03-27 23:20:33', 7, 3, 4, 10, 9, 'TASK', '2024-03-27 23:21:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948771, '2024-03-27 23:21:48', 9, 7, 1, 6, 3, 'TASK', '2024-03-27 23:22:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948772, '2024-03-27 23:23:03', 2, 6, 9, 3, 4, 'TASK', '2024-03-27 23:24:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948773, '2024-03-27 23:24:18', 8, 6, 4, 5, 1, 'TASK', '2024-03-27 23:25:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948774, '2024-03-27 23:25:33', 8, 3, 4, 9, 7, 'TASK', '2024-03-27 23:26:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948775, '2024-03-27 23:26:48', 7, 9, 2, 6, 8, 'TASK', '2024-03-27 23:27:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948776, '2024-03-27 23:28:03', 3, 4, 1, 8, 5, 'TASK', '2024-03-27 23:29:02', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948777, '2024-03-27 23:29:18', 2, 6, 3, 1, 5, 'TASK', '2024-03-27 23:30:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948778, '2024-03-27 23:30:33', 3, 9, 10, 4, 6, 'TASK', '2024-03-27 23:31:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948779, '2024-03-27 23:31:48', 2, 6, 8, 10, 3, 'TASK', '2024-03-27 23:32:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948780, '2024-03-27 23:33:03', 6, 9, 10, 7, 1, 'TASK', '2024-03-27 23:34:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948781, '2024-03-27 23:34:18', 10, 8, 9, 1, 7, 'TASK', '2024-03-27 23:35:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948782, '2024-03-27 23:35:33', 7, 10, 3, 9, 2, 'TASK', '2024-03-27 23:36:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3948783, '2024-03-27 23:36:48', 7, 10, 6, 4, 5, 'TASK', '2024-03-27 23:37:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949787, '2024-03-28 20:31:48', 2, 4, 1, 8, 6, 'TASK', '2024-03-28 20:33:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949788, '2024-03-28 20:33:03', 9, 8, 6, 4, 1, 'TASK', '2024-03-28 20:34:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949789, '2024-03-28 20:34:18', 3, 6, 2, 1, 9, 'TASK', '2024-03-28 20:35:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949790, '2024-03-28 20:35:33', 10, 5, 9, 3, 7, 'TASK', '2024-03-28 20:36:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949791, '2024-03-28 20:36:48', 1, 10, 3, 7, 2, 'TASK', '2024-03-28 20:37:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949792, '2024-03-28 20:38:03', 7, 6, 8, 4, 10, 'TASK', '2024-03-28 20:39:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949793, '2024-03-28 20:39:18', 8, 3, 4, 9, 6, 'TASK', '2024-03-28 20:40:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949794, '2024-03-28 20:40:33', 5, 4, 2, 1, 9, 'TASK', '2024-03-28 20:41:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949795, '2024-03-28 20:41:48', 10, 7, 5, 1, 3, 'TASK', '2024-03-28 20:42:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949796, '2024-03-28 20:43:03', 3, 4, 1, 9, 8, 'TASK', '2024-03-28 20:44:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949797, '2024-03-28 20:44:18', 5, 4, 3, 7, 1, 'TASK', '2024-03-28 20:45:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949798, '2024-03-28 20:45:33', 9, 4, 2, 6, 1, 'TASK', '2024-03-28 20:46:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949799, '2024-03-28 20:46:48', 1, 2, 10, 8, 4, 'TASK', '2024-03-28 20:47:02', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949800, '2024-03-28 20:48:03', 7, 4, 5, 2, 3, 'TASK', '2024-03-28 20:49:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949801, '2024-03-28 20:49:18', 3, 9, 6, 5, 10, 'TASK', '2024-03-28 20:50:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949802, '2024-03-28 20:50:33', 8, 5, 2, 7, 1, 'TASK', '2024-03-28 20:51:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949803, '2024-03-28 20:51:48', 5, 6, 10, 1, 8, 'TASK', '2024-03-28 20:52:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949804, '2024-03-28 20:53:03', 7, 9, 6, 3, 4, 'TASK', '2024-03-28 20:54:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949805, '2024-03-28 20:54:18', 6, 10, 3, 4, 5, 'TASK', '2024-03-28 20:55:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949806, '2024-03-28 20:55:33', 4, 5, 10, 9, 3, 'TASK', '2024-03-28 20:56:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949807, '2024-03-28 20:56:48', 6, 4, 5, 7, 8, 'TASK', '2024-03-28 20:57:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949808, '2024-03-28 20:58:03', 10, 5, 4, 3, 8, 'TASK', '2024-03-28 20:59:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949809, '2024-03-28 20:59:18', 9, 1, 8, 6, 4, 'TASK', '2024-03-28 21:00:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949810, '2024-03-28 21:00:33', 5, 1, 9, 4, 6, 'TASK', '2024-03-28 21:01:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949811, '2024-03-28 21:01:48', 10, 9, 5, 4, 3, 'TASK', '2024-03-28 21:02:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949812, '2024-03-28 21:03:03', 10, 3, 6, 7, 8, 'TASK', '2024-03-28 21:04:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949813, '2024-03-28 21:04:18', 4, 7, 5, 3, 1, 'TASK', '2024-03-28 21:05:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949814, '2024-03-28 21:05:33', 8, 7, 4, 6, 5, 'TASK', '2024-03-28 21:06:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949815, '2024-03-28 21:06:48', 3, 9, 6, 7, 1, 'TASK', '2024-03-28 21:07:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949816, '2024-03-28 21:08:03', 1, 4, 9, 5, 10, 'TASK', '2024-03-28 21:09:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949817, '2024-03-28 21:09:18', 5, 8, 9, 6, 7, 'TASK', '2024-03-28 21:10:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949818, '2024-03-28 21:10:33', 5, 8, 3, 7, 4, 'TASK', '2024-03-28 21:11:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949819, '2024-03-28 21:11:48', 7, 1, 5, 4, 2, 'TASK', '2024-03-28 21:12:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949820, '2024-03-28 21:13:03', 8, 4, 5, 7, 9, 'TASK', '2024-03-28 21:14:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949821, '2024-03-28 21:14:18', 3, 6, 1, 5, 7, 'TASK', '2024-03-28 21:15:03', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949822, '2024-03-28 21:15:33', 9, 2, 3, 10, 4, 'TASK', '2024-03-28 21:16:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949823, '2024-03-28 21:16:48', 2, 10, 9, 4, 3, 'TASK', '2024-03-28 21:17:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949824, '2024-03-28 21:18:03', 3, 2, 7, 10, 6, 'TASK', '2024-03-28 21:19:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949825, '2024-03-28 21:19:18', 8, 10, 4, 7, 6, 'TASK', '2024-03-28 21:20:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949826, '2024-03-28 21:20:33', 2, 1, 3, 9, 8, 'TASK', '2024-03-28 21:21:02', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949827, '2024-03-28 21:21:48', 10, 3, 5, 9, 4, 'TASK', '2024-03-28 21:22:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949828, '2024-03-28 21:23:03', 1, 7, 3, 10, 4, 'TASK', '2024-03-28 21:24:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949829, '2024-03-28 21:24:18', 2, 7, 4, 10, 9, 'TASK', '2024-03-28 21:25:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949830, '2024-03-28 21:25:33', 6, 7, 5, 9, 2, 'TASK', '2024-03-28 21:26:02', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949831, '2024-03-28 21:26:48', 8, 7, 2, 5, 9, 'TASK', '2024-03-28 21:27:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949832, '2024-03-28 21:28:03', 5, 10, 7, 8, 4, 'TASK', '2024-03-28 21:29:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949833, '2024-03-28 21:29:18', 10, 8, 9, 5, 4, 'TASK', '2024-03-28 21:30:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949834, '2024-03-28 21:30:33', 9, 1, 7, 2, 4, 'TASK', '2024-03-28 21:31:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949835, '2024-03-28 21:31:48', 7, 10, 4, 5, 8, 'TASK', '2024-03-28 21:32:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949836, '2024-03-28 21:33:03', 3, 7, 1, 2, 9, 'TASK', '2024-03-28 21:34:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949837, '2024-03-28 21:34:18', 6, 1, 8, 7, 4, 'TASK', '2024-03-28 21:35:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949838, '2024-03-28 21:35:33', 8, 2, 4, 3, 1, 'TASK', '2024-03-28 21:36:02', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949839, '2024-03-28 21:36:48', 4, 1, 8, 7, 2, 'TASK', '2024-03-28 21:37:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949840, '2024-03-28 21:38:03', 10, 7, 5, 2, 1, 'TASK', '2024-03-28 21:39:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949841, '2024-03-28 21:39:18', 6, 10, 9, 4, 7, 'TASK', '2024-03-28 21:40:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949842, '2024-03-28 21:40:33', 2, 8, 4, 5, 9, 'TASK', '2024-03-28 21:41:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949843, '2024-03-28 21:41:48', 8, 3, 1, 9, 6, 'TASK', '2024-03-28 21:42:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949844, '2024-03-28 21:43:03', 4, 9, 1, 6, 10, 'TASK', '2024-03-28 21:44:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949845, '2024-03-28 21:44:18', 10, 2, 8, 3, 4, 'TASK', '2024-03-28 21:45:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949846, '2024-03-28 21:45:33', 9, 8, 7, 10, 3, 'TASK', '2024-03-28 21:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949847, '2024-03-28 21:46:48', 3, 7, 4, 10, 9, 'TASK', '2024-03-28 21:47:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949848, '2024-03-28 21:48:03', 5, 4, 9, 2, 1, 'TASK', '2024-03-28 21:49:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949849, '2024-03-28 21:49:18', 3, 5, 4, 10, 9, 'TASK', '2024-03-28 21:50:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949850, '2024-03-28 21:50:33', 10, 4, 3, 2, 9, 'TASK', '2024-03-28 21:51:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949851, '2024-03-28 21:51:48', 5, 4, 3, 9, 10, 'TASK', '2024-03-28 21:52:02', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949852, '2024-03-28 21:53:03', 7, 6, 5, 8, 3, 'TASK', '2024-03-28 21:54:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949853, '2024-03-28 21:54:18', 10, 1, 6, 3, 4, 'TASK', '2024-03-28 21:55:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949854, '2024-03-28 21:55:33', 7, 6, 3, 1, 10, 'TASK', '2024-03-28 21:56:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949855, '2024-03-28 21:56:48', 9, 5, 4, 7, 10, 'TASK', '2024-03-28 21:57:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949856, '2024-03-28 21:58:03', 3, 9, 8, 7, 2, 'TASK', '2024-03-28 21:59:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949857, '2024-03-28 21:59:18', 6, 7, 1, 10, 8, 'TASK', '2024-03-28 22:00:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949858, '2024-03-28 22:00:33', 4, 9, 3, 8, 10, 'TASK', '2024-03-28 22:01:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949859, '2024-03-28 22:01:48', 7, 8, 1, 10, 4, 'TASK', '2024-03-28 22:02:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949860, '2024-03-28 22:03:03', 9, 10, 8, 7, 4, 'TASK', '2024-03-28 22:04:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949861, '2024-03-28 22:04:18', 8, 2, 3, 7, 5, 'TASK', '2024-03-28 22:05:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949862, '2024-03-28 22:05:33', 9, 3, 4, 8, 2, 'TASK', '2024-03-28 22:06:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949863, '2024-03-28 22:06:48', 5, 4, 7, 8, 10, 'TASK', '2024-03-28 22:07:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949864, '2024-03-28 22:08:03', 1, 10, 3, 7, 8, 'TASK', '2024-03-28 22:09:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949865, '2024-03-28 22:09:18', 4, 7, 6, 9, 5, 'TASK', '2024-03-28 22:10:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949866, '2024-03-28 22:10:33', 4, 6, 7, 3, 8, 'TASK', '2024-03-28 22:11:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949867, '2024-03-28 22:11:48', 7, 3, 9, 2, 5, 'TASK', '2024-03-28 22:12:04', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949868, '2024-03-28 22:13:03', 4, 7, 9, 6, 10, 'TASK', '2024-03-28 22:14:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949869, '2024-03-28 22:14:18', 5, 9, 1, 7, 3, 'TASK', '2024-03-28 22:15:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949870, '2024-03-28 22:15:33', 2, 5, 3, 10, 8, 'TASK', '2024-03-28 22:16:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949871, '2024-03-28 22:16:48', 10, 1, 8, 3, 2, 'TASK', '2024-03-28 22:17:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949872, '2024-03-28 22:18:03', 5, 7, 9, 6, 2, 'TASK', '2024-03-28 22:19:02', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949873, '2024-03-28 22:19:18', 9, 2, 7, 8, 3, 'TASK', '2024-03-28 22:20:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949874, '2024-03-28 22:20:33', 2, 9, 4, 1, 5, 'TASK', '2024-03-28 22:21:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949875, '2024-03-28 22:21:48', 9, 10, 5, 8, 1, 'TASK', '2024-03-28 22:22:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3949876, '2024-03-28 22:23:03', 5, 4, 2, 6, 9, 'TASK', '2024-03-28 22:24:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954424, '2024-04-01 21:08:03', 10, 8, 4, 3, 2, 'TASK', '2024-04-01 21:09:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954425, '2024-04-01 21:09:18', 9, 7, 3, 5, 1, 'TASK', '2024-04-01 21:10:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954426, '2024-04-01 21:10:33', 9, 10, 2, 4, 7, 'TASK', '2024-04-01 21:11:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954427, '2024-04-01 21:11:48', 9, 7, 4, 3, 8, 'TASK', '2024-04-01 21:12:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954428, '2024-04-01 21:13:03', 1, 3, 10, 4, 2, 'TASK', '2024-04-01 21:14:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954429, '2024-04-01 21:14:18', 1, 9, 8, 10, 5, 'TASK', '2024-04-01 21:15:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954430, '2024-04-01 21:15:33', 4, 6, 1, 3, 10, 'TASK', '2024-04-01 21:16:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954431, '2024-04-01 21:16:48', 9, 5, 7, 3, 10, 'TASK', '2024-04-01 21:17:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954432, '2024-04-01 21:18:03', 10, 2, 6, 5, 8, 'TASK', '2024-04-01 21:19:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954433, '2024-04-01 21:19:18', 5, 4, 10, 7, 8, 'TASK', '2024-04-01 21:20:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954434, '2024-04-01 21:20:33', 8, 6, 3, 4, 9, 'TASK', '2024-04-01 21:21:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954435, '2024-04-01 21:21:48', 5, 2, 1, 9, 6, 'TASK', '2024-04-01 21:22:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954436, '2024-04-01 21:23:03', 1, 4, 8, 2, 3, 'TASK', '2024-04-01 21:24:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954437, '2024-04-01 21:24:18', 3, 6, 8, 7, 4, 'TASK', '2024-04-01 21:25:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954438, '2024-04-01 21:25:33', 5, 7, 10, 2, 4, 'TASK', '2024-04-01 21:26:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954439, '2024-04-01 21:26:48', 9, 5, 8, 2, 6, 'TASK', '2024-04-01 21:27:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954440, '2024-04-01 21:28:03', 8, 9, 3, 1, 5, 'TASK', '2024-04-01 21:29:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954441, '2024-04-01 21:29:18', 7, 1, 10, 2, 8, 'TASK', '2024-04-01 21:30:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954442, '2024-04-01 21:30:33', 3, 5, 2, 9, 6, 'TASK', '2024-04-01 21:31:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954443, '2024-04-01 21:31:48', 10, 4, 6, 3, 9, 'TASK', '2024-04-01 21:32:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954444, '2024-04-01 21:33:03', 8, 9, 4, 1, 5, 'TASK', '2024-04-01 21:34:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954445, '2024-04-01 21:34:18', 8, 1, 3, 5, 2, 'TASK', '2024-04-01 21:35:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954446, '2024-04-01 21:35:33', 2, 6, 1, 9, 3, 'TASK', '2024-04-01 21:36:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954447, '2024-04-01 21:36:48', 5, 9, 4, 1, 8, 'TASK', '2024-04-01 21:37:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954448, '2024-04-01 21:38:03', 9, 6, 2, 7, 8, 'TASK', '2024-04-01 21:39:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954449, '2024-04-01 21:39:18', 2, 3, 10, 5, 4, 'TASK', '2024-04-01 21:40:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954450, '2024-04-01 21:40:33', 2, 6, 8, 4, 7, 'TASK', '2024-04-01 21:41:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954451, '2024-04-01 21:41:48', 8, 1, 6, 2, 5, 'TASK', '2024-04-01 21:42:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954452, '2024-04-01 21:43:03', 8, 7, 3, 2, 1, 'TASK', '2024-04-01 21:44:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954453, '2024-04-01 21:44:18', 10, 5, 2, 6, 8, 'TASK', '2024-04-01 21:45:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954454, '2024-04-01 21:45:33', 2, 10, 9, 3, 8, 'TASK', '2024-04-01 21:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954455, '2024-04-01 21:46:48', 2, 5, 7, 4, 1, 'TASK', '2024-04-01 21:47:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954456, '2024-04-01 21:48:03', 4, 8, 1, 2, 3, 'TASK', '2024-04-01 21:49:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954457, '2024-04-01 21:49:18', 8, 2, 9, 4, 5, 'TASK', '2024-04-01 21:51:18', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954458, '2024-04-01 21:50:33', 3, 4, 5, 9, 10, 'TASK', '2024-04-01 21:51:25', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954459, '2024-04-01 21:51:48', 7, 10, 6, 9, 4, 'TASK', '2024-04-01 21:52:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954460, '2024-04-01 21:53:03', 10, 3, 4, 5, 8, 'TASK', '2024-04-01 21:54:03', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954461, '2024-04-01 21:54:18', 10, 9, 4, 5, 8, 'TASK', '2024-04-01 21:55:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954462, '2024-04-01 21:55:33', 6, 7, 2, 3, 9, 'TASK', '2024-04-01 21:57:03', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954463, '2024-04-01 21:56:48', 9, 7, 1, 2, 10, 'TASK', '2024-04-01 21:57:10', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954464, '2024-04-01 21:58:03', 1, 10, 2, 6, 3, 'TASK', '2024-04-01 21:58:10', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954465, '2024-04-01 21:59:18', 3, 1, 9, 8, 2, 'TASK', '2024-04-01 22:00:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954466, '2024-04-01 22:00:33', 3, 8, 7, 5, 1, 'TASK', '2024-04-01 22:01:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954467, '2024-04-01 22:01:48', 5, 4, 1, 8, 3, 'TASK', '2024-04-01 22:02:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954468, '2024-04-01 22:03:03', 8, 10, 4, 5, 6, 'TASK', '2024-04-01 22:04:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954469, '2024-04-01 22:04:18', 7, 3, 9, 2, 1, 'TASK', '2024-04-01 22:05:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954470, '2024-04-01 22:05:33', 4, 2, 3, 5, 8, 'TASK', '2024-04-01 22:06:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954471, '2024-04-01 22:06:48', 3, 5, 10, 8, 2, 'TASK', '2024-04-01 22:07:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954472, '2024-04-01 22:08:03', 5, 4, 10, 8, 2, 'TASK', '2024-04-01 22:09:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954473, '2024-04-01 22:09:18', 6, 3, 10, 5, 7, 'TASK', '2024-04-01 22:10:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954474, '2024-04-01 22:10:33', 6, 10, 9, 7, 4, 'TASK', '2024-04-01 22:11:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954475, '2024-04-01 22:11:48', 10, 7, 1, 6, 8, 'TASK', '2024-04-01 22:12:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954476, '2024-04-01 22:13:03', 1, 6, 2, 8, 3, 'TASK', '2024-04-01 22:14:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954477, '2024-04-01 22:14:18', 4, 6, 8, 1, 9, 'TASK', '2024-04-01 22:15:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954478, '2024-04-01 22:15:33', 3, 8, 7, 4, 1, 'TASK', '2024-04-01 22:16:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954479, '2024-04-01 22:16:48', 2, 4, 10, 6, 5, 'TASK', '2024-04-01 22:17:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954480, '2024-04-01 22:18:03', 2, 6, 8, 5, 10, 'TASK', '2024-04-01 22:19:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954481, '2024-04-01 22:19:18', 6, 1, 9, 7, 8, 'TASK', '2024-04-01 22:20:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954482, '2024-04-01 22:20:33', 6, 8, 3, 1, 9, 'TASK', '2024-04-01 22:21:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954483, '2024-04-01 22:21:48', 3, 10, 9, 7, 8, 'TASK', '2024-04-01 22:22:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954484, '2024-04-01 22:23:03', 10, 7, 3, 9, 1, 'TASK', '2024-04-01 22:24:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954485, '2024-04-01 22:24:18', 6, 9, 4, 2, 8, 'TASK', '2024-04-01 22:25:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954486, '2024-04-01 22:25:33', 5, 10, 9, 2, 8, 'TASK', '2024-04-01 22:26:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954487, '2024-04-01 22:26:48', 10, 9, 7, 4, 6, 'TASK', '2024-04-01 22:27:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954488, '2024-04-01 22:28:03', 4, 5, 3, 7, 8, 'TASK', '2024-04-01 22:29:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954489, '2024-04-01 22:29:18', 7, 3, 10, 9, 6, 'TASK', '2024-04-01 22:30:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954490, '2024-04-01 22:30:33', 1, 4, 9, 6, 3, 'TASK', '2024-04-01 22:31:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954491, '2024-04-01 22:31:48', 3, 8, 2, 10, 1, 'TASK', '2024-04-01 22:32:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954492, '2024-04-01 22:33:03', 9, 10, 7, 4, 2, 'TASK', '2024-04-01 22:34:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954493, '2024-04-01 22:34:18', 6, 10, 3, 1, 5, 'TASK', '2024-04-01 22:35:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954494, '2024-04-01 22:35:33', 3, 5, 10, 2, 1, 'TASK', '2024-04-01 22:36:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954495, '2024-04-01 22:36:48', 4, 5, 9, 8, 1, 'TASK', '2024-04-01 22:37:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954496, '2024-04-01 22:38:03', 4, 1, 10, 6, 2, 'TASK', '2024-04-01 22:39:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954497, '2024-04-01 22:39:18', 4, 7, 1, 6, 5, 'TASK', '2024-04-01 22:40:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954498, '2024-04-01 22:40:33', 4, 6, 2, 3, 9, 'TASK', '2024-04-01 22:41:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954499, '2024-04-01 22:41:48', 7, 9, 6, 3, 4, 'TASK', '2024-04-01 22:42:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954500, '2024-04-01 22:43:03', 4, 9, 5, 2, 7, 'TASK', '2024-04-01 22:44:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954501, '2024-04-01 22:44:18', 5, 4, 2, 9, 7, 'TASK', '2024-04-01 22:45:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954502, '2024-04-01 22:45:33', 8, 3, 1, 6, 9, 'TASK', '2024-04-01 22:46:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954503, '2024-04-01 22:46:48', 5, 9, 8, 2, 3, 'TASK', '2024-04-01 22:47:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954504, '2024-04-01 22:48:03', 4, 6, 5, 3, 8, 'TASK', '2024-04-01 22:49:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954505, '2024-04-01 22:49:18', 10, 1, 3, 5, 9, 'TASK', '2024-04-01 22:50:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954506, '2024-04-01 22:50:33', 2, 7, 10, 9, 8, 'TASK', '2024-04-01 22:51:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954507, '2024-04-01 22:51:48', 1, 5, 4, 7, 2, 'TASK', '2024-04-01 22:52:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954508, '2024-04-01 22:53:03', 4, 1, 5, 2, 3, 'TASK', '2024-04-01 22:54:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954509, '2024-04-01 22:54:18', 7, 5, 10, 3, 2, 'TASK', '2024-04-01 22:55:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954510, '2024-04-01 22:55:33', 10, 3, 2, 4, 1, 'TASK', '2024-04-01 22:56:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954511, '2024-04-01 22:56:48', 1, 3, 9, 4, 10, 'TASK', '2024-04-01 22:57:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954512, '2024-04-01 22:58:03', 2, 3, 9, 5, 1, 'TASK', '2024-04-01 22:59:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954513, '2024-04-01 22:59:18', 3, 2, 7, 6, 1, 'TASK', '2024-04-01 23:00:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954514, '2024-04-01 23:00:33', 4, 6, 1, 3, 2, 'TASK', '2024-04-01 23:01:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954515, '2024-04-01 23:01:48', 2, 8, 6, 4, 9, 'TASK', '2024-04-01 23:02:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954516, '2024-04-01 23:03:03', 10, 4, 7, 6, 8, 'TASK', '2024-04-01 23:04:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954517, '2024-04-01 23:04:18', 2, 4, 5, 7, 8, 'TASK', '2024-04-01 23:05:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954518, '2024-04-01 23:05:33', 7, 8, 4, 3, 6, 'TASK', '2024-04-01 23:06:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954519, '2024-04-01 23:06:48', 7, 9, 5, 8, 10, 'TASK', '2024-04-01 23:07:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954520, '2024-04-01 23:08:03', 9, 3, 8, 7, 2, 'TASK', '2024-04-01 23:09:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954521, '2024-04-01 23:09:18', 6, 5, 10, 2, 4, 'TASK', '2024-04-01 23:10:01', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954522, '2024-04-01 23:10:33', 8, 3, 10, 1, 5, 'TASK', '2024-04-01 23:11:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954523, '2024-04-01 23:11:48', 6, 1, 7, 3, 10, 'TASK', '2024-04-01 23:12:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954524, '2024-04-01 23:13:03', 2, 7, 4, 5, 6, 'TASK', '2024-04-01 23:14:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954525, '2024-04-01 23:14:18', 5, 6, 2, 4, 10, 'TASK', '2024-04-01 23:15:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954526, '2024-04-01 23:15:33', 2, 6, 3, 4, 7, 'TASK', '2024-04-01 23:16:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954527, '2024-04-01 23:16:48', 2, 9, 10, 3, 6, 'TASK', '2024-04-01 23:17:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954528, '2024-04-01 23:18:03', 5, 8, 2, 7, 3, 'TASK', '2024-04-01 23:20:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954529, '2024-04-01 23:19:18', 10, 2, 3, 5, 4, 'TASK', '2024-04-01 23:21:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954530, '2024-04-01 23:20:33', 9, 10, 6, 5, 7, 'TASK', '2024-04-01 23:22:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954531, '2024-04-01 23:21:48', 3, 4, 5, 2, 8, 'TASK', '2024-04-01 23:23:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954532, '2024-04-01 23:23:03', 10, 1, 9, 6, 8, 'TASK', '2024-04-01 23:24:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954533, '2024-04-01 23:24:18', 7, 10, 1, 6, 3, 'TASK', '2024-04-01 23:25:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954534, '2024-04-01 23:25:33', 2, 7, 10, 3, 9, 'TASK', '2024-04-01 23:26:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954535, '2024-04-01 23:26:48', 1, 6, 7, 3, 4, 'TASK', '2024-04-01 23:27:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954536, '2024-04-01 23:28:03', 6, 4, 9, 3, 1, 'TASK', '2024-04-01 23:29:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954537, '2024-04-01 23:29:18', 8, 3, 7, 1, 9, 'TASK', '2024-04-01 23:30:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954538, '2024-04-01 23:30:33', 8, 10, 5, 4, 1, 'TASK', '2024-04-01 23:31:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954539, '2024-04-01 23:31:48', 8, 7, 9, 6, 1, 'TASK', '2024-04-01 23:32:15', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954540, '2024-04-01 23:33:03', 4, 7, 5, 3, 9, 'TASK', '2024-04-01 23:34:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954541, '2024-04-01 23:34:18', 3, 9, 6, 10, 1, 'TASK', '2024-04-01 23:35:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954542, '2024-04-01 23:35:33', 8, 5, 7, 2, 6, 'TASK', '2024-04-01 23:36:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954543, '2024-04-01 23:36:48', 7, 3, 5, 1, 6, 'TASK', '2024-04-01 23:37:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954544, '2024-04-01 23:38:03', 10, 5, 1, 4, 9, 'TASK', '2024-04-01 23:39:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954545, '2024-04-01 23:39:18', 10, 8, 6, 5, 4, 'TASK', '2024-04-01 23:40:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954546, '2024-04-01 23:40:33', 1, 7, 6, 5, 8, 'TASK', '2024-04-01 23:41:00', '', NULL, '');
INSERT INTO `jsssc` VALUES (3954547, '2024-04-01 23:41:48', 10, 4, 3, 5, 8, 'TASK', '2024-04-01 23:42:00', '', NULL, '');

-- ----------------------------
-- Table structure for jsssckj
-- ----------------------------
DROP TABLE IF EXISTS `jsssckj`;
CREATE TABLE `jsssckj`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '期数',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否已经开奖（0未开奖 1已开奖）',
  `bet_time` datetime NOT NULL COMMENT '封盘投注截止时间',
  `pre_time` datetime NOT NULL COMMENT '预计开奖时间',
  `the_time` datetime NULL DEFAULT NULL COMMENT '开奖时间',
  `count_money` int(11) NULL DEFAULT 0 COMMENT '总下注金额',
  `win_money` int(11) NULL DEFAULT 0 COMMENT '总中奖金额',
  `num1` int(11) NULL DEFAULT NULL COMMENT '开奖号码1',
  `num2` int(11) NULL DEFAULT NULL COMMENT '开奖号码2',
  `num3` int(11) NULL DEFAULT NULL COMMENT '开奖号码3',
  `num4` int(11) NULL DEFAULT NULL COMMENT '开奖号码4',
  `num5` int(11) NULL DEFAULT NULL COMMENT '开奖号码5',
  `sum` int(11) NULL DEFAULT NULL COMMENT '开奖合计号码',
  `num1_bs` int(11) NULL DEFAULT NULL COMMENT '开奖号码1大小',
  `num1_sd` int(11) NULL DEFAULT NULL COMMENT '开奖号码1单双',
  `num2_bs` int(11) NULL DEFAULT NULL COMMENT '开奖号码2大小',
  `num2_sd` int(11) NULL DEFAULT NULL COMMENT '开奖号码2单双',
  `num3_bs` int(11) NULL DEFAULT NULL COMMENT '开奖号码3大小',
  `num3_sd` int(11) NULL DEFAULT NULL COMMENT '开奖号码3单双',
  `num4_bs` int(11) NULL DEFAULT NULL COMMENT '开奖号码4大小',
  `num4_sd` int(11) NULL DEFAULT NULL COMMENT '开奖号码4单双',
  `num5_bs` int(11) NULL DEFAULT NULL COMMENT '开奖号码5大小',
  `num5_sd` int(11) NULL DEFAULT NULL COMMENT '开奖号码5单双',
  `sum_bs` int(11) NULL DEFAULT NULL COMMENT '开奖合计号码大小',
  `sum_sd` int(11) NULL DEFAULT NULL COMMENT '开奖合计号码单双',
  `sum_lts` int(11) NULL DEFAULT NULL COMMENT '开奖合计号码和虎龙',
  `num_f` int(11) NULL DEFAULT NULL COMMENT '开奖号码(123)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂]',
  `num_m` int(11) NULL DEFAULT NULL COMMENT '开奖号码(234)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂]',
  `num_b` int(11) NULL DEFAULT NULL COMMENT '开奖号码(345)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂]',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `Id_2`(`id`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3954547 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '极速时时彩开奖表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jsssckj
-- ----------------------------
INSERT INTO `jsssckj` VALUES (3954540, '1', '2024-04-01 23:32:23', '2024-04-01 23:32:58', '2024-04-01 23:33:03', 0, 0, 4, 7, 5, 3, 9, 28, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 3, 4, 4, '', '2024-04-01 23:39:04', '', NULL, '');
INSERT INTO `jsssckj` VALUES (3954541, '1', '2024-04-01 23:33:38', '2024-04-01 23:34:13', '2024-04-01 23:34:18', 0, 0, 3, 9, 6, 10, 1, 29, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 2, 4, 3, 4, '', '2024-04-01 23:39:04', '', NULL, '');
INSERT INTO `jsssckj` VALUES (3954542, '1', '2024-04-01 23:34:53', '2024-04-01 23:35:28', '2024-04-01 23:35:33', 0, 0, 8, 5, 7, 2, 6, 28, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 2, 3, 4, 3, '', '2024-04-01 23:39:04', '', NULL, '');
INSERT INTO `jsssckj` VALUES (3954543, '1', '2024-04-01 23:36:08', '2024-04-01 23:36:43', '2024-04-01 23:36:48', 0, 0, 7, 3, 5, 1, 6, 22, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 2, 4, 4, 3, '', '2024-04-01 23:39:04', '', NULL, '');
INSERT INTO `jsssckj` VALUES (3954544, '1', '2024-04-01 23:37:23', '2024-04-01 23:37:58', '2024-04-01 23:38:03', 0, 0, 10, 5, 1, 4, 9, 29, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 2, 4, 3, 4, '', '2024-04-01 23:39:04', '', NULL, '');
INSERT INTO `jsssckj` VALUES (3954545, '0', '2024-04-01 23:38:43', '2024-04-01 23:39:18', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CreateJssscData', '2024-04-01 23:39:04', '', NULL, '');
INSERT INTO `jsssckj` VALUES (3954546, '0', '2024-04-01 23:39:58', '2024-04-01 23:40:33', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CreateJssscData', '2024-04-01 23:39:04', '', NULL, '');

-- ----------------------------
-- Table structure for jssscrecord
-- ----------------------------
DROP TABLE IF EXISTS `jssscrecord`;
CREATE TABLE `jssscrecord`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '下注表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `periods` bigint(20) NOT NULL COMMENT '期数',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '投注状态（0投注 1撤单）',
  `record_time` datetime NOT NULL COMMENT '投注时间',
  `check_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '确认时间',
  `count_money` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注金额',
  `win_money` float(11, 2) NULL DEFAULT 0.00 COMMENT '中奖金额',
  `sum_big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注和值大的金额',
  `sum_small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注和值小的金额',
  `sum_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注和值单的金额',
  `sum_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注和值双的金额',
  `sum_loong` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注和值龙的金额',
  `sum_tiger` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注和值虎的金额',
  `sum_sum` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注和值和的金额',
  `num1_big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买1号球大的金额',
  `num1_small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买1号球小的金额',
  `num1_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买1号球单的金额',
  `num1_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买1号球双的金额',
  `num1_ball0` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买1号球0的金额',
  `num1_ball1` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买1号球1的金额',
  `num1_ball2` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买1号球2的金额',
  `num1_ball3` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买1号球3的金额',
  `num1_ball4` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买1号球4的金额',
  `num1_ball5` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买1号球5的金额',
  `num1_ball6` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买1号球6的金额',
  `num1_ball7` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买1号球7的金额',
  `num1_ball8` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买1号球8的金额',
  `num1_ball9` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买1号球9的金额',
  `num2_big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买2号球大的金额',
  `num2_small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买2号球小的金额',
  `num2_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买2号球单的金额',
  `num2_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买2号球双的金额',
  `num2_ball0` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买2号球0的金额',
  `num2_ball1` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买2号球1的金额',
  `num2_ball2` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买2号球2的金额',
  `num2_ball3` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买2号球3的金额',
  `num2_ball4` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买2号球4的金额',
  `num2_ball5` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买2号球5的金额',
  `num2_ball6` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买2号球6的金额',
  `num2_ball7` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买2号球7的金额',
  `num2_ball8` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买2号球8的金额',
  `num2_ball9` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买2号球9的金额',
  `num3_big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买3号球大的金额',
  `num3_small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买3号球小的金额',
  `num3_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买3号球单的金额',
  `num3_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买3号球双的金额',
  `num3_ball0` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买3号球0的金额',
  `num3_ball1` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买3号球1的金额',
  `num3_ball2` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买3号球2的金额',
  `num3_ball3` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买3号球3的金额',
  `num3_ball4` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买3号球4的金额',
  `num3_ball5` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买3号球5的金额',
  `num3_ball6` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买3号球6的金额',
  `num3_ball7` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买3号球7的金额',
  `num3_ball8` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买3号球8的金额',
  `num3_ball9` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买3号球9的金额',
  `num4_big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买4号球大的金额',
  `num4_small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买4号球小的金额',
  `num4_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买4号球单的金额',
  `num4_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买4号球双的金额',
  `num4_ball0` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买4号球0的金额',
  `num4_ball1` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买4号球1的金额',
  `num4_ball2` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买4号球2的金额',
  `num4_ball3` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买4号球3的金额',
  `num4_ball4` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买4号球4的金额',
  `num4_ball5` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买4号球5的金额',
  `num4_ball6` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买4号球6的金额',
  `num4_ball7` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买4号球7的金额',
  `num4_ball8` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买4号球8的金额',
  `num4_ball9` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买4号球9的金额',
  `num5_big` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买5号球大的金额',
  `num5_small` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买5号球小的金额',
  `num5_single` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买5号球单的金额',
  `num5_double` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买5号球双的金额',
  `num5_ball0` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买5号球0的金额',
  `num5_ball1` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买5号球1的金额',
  `num5_ball2` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买5号球2的金额',
  `num5_ball3` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买5号球3的金额',
  `num5_ball4` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买5号球4的金额',
  `num5_ball5` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买5号球5的金额',
  `num5_ball6` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买5号球6的金额',
  `num5_ball7` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买5号球7的金额',
  `num5_ball8` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买5号球8的金额',
  `num5_ball9` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买5号球9的金额',
  `first_bao` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买前三豹的金额',
  `first_dui` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买前三对的金额',
  `first_sun` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买前三顺的金额',
  `first_ban` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买前三半的金额',
  `first_za` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买前三杂的金额',
  `mid_bao` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买中三豹的的金额',
  `mid_dui` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买中三对的的金额',
  `mid_sun` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买中三顺的的金额',
  `mid_ban` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买中三半的的金额',
  `mid_za` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买中三杂的的金额',
  `back_bao` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买后三豹的的金额',
  `back_dui` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买后三对的的金额',
  `back_sun` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买后三顺的的金额',
  `back_ban` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买后三半的的金额',
  `back_za` float(11, 2) NULL DEFAULT 0.00 COMMENT '下注买后三杂的的金额',
  `num1` int(11) NULL DEFAULT NULL COMMENT '开奖号码1',
  `num2` int(11) NULL DEFAULT NULL COMMENT '开奖号码2',
  `num3` int(11) NULL DEFAULT NULL COMMENT '开奖号码3',
  `num4` int(11) NULL DEFAULT NULL COMMENT '开奖号码4',
  `num5` int(11) NULL DEFAULT NULL COMMENT '开奖号码5',
  `sum` int(11) NULL DEFAULT 0 COMMENT '开奖合算数字',
  `is_delete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否扣除(0否 1是)',
  `is_deduct` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否扣除',
  `house` int(4) NOT NULL DEFAULT 0 COMMENT '房间号',
  `hz_id` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否合庄模式',
  `hz_user` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否用户(0否 1是)',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `user_id_2`(`user_id`, `periods`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '极速时时彩下注表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jssscrecord
-- ----------------------------

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
  `bet_item_type` int(11) NULL DEFAULT NULL COMMENT '投注项类别',
  `bet_item_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '投注项cd',
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
) ENGINE = InnoDB AUTO_INCREMENT = 369 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏投注项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_bet_item
-- ----------------------------
INSERT INTO `sys_bet_item` VALUES (2, 1, 1, 'big', '大', NULL, 2.04, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (3, 1, 1, 'small', '小', NULL, 2.01, 9999.99, 2.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (4, 1, 1, 'single', '单', NULL, 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (5, 1, 1, 'doubleFlg', '双', NULL, 2.00, 9999.99, 5.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (6, 1, 1, 'muchbig', '极大', NULL, 15.00, 500.00, 2.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (7, 1, 1, 'bigsingle', '大单', NULL, 4.20, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (8, 1, 1, 'smallsingle', '小单', NULL, 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (9, 1, 1, 'bigdouble', '大双', NULL, 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (10, 1, 1, 'smalldouble', '小双', NULL, 4.20, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (11, 1, 1, 'muchsmall', '极小', NULL, 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (12, 1, 2, 'num0', '0 ', NULL, 500.01, 1000.00, 5.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:03:41', '');
INSERT INTO `sys_bet_item` VALUES (13, 1, 2, 'num1', '1 ', NULL, 188.00, 9999.99, 5.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:08', '');
INSERT INTO `sys_bet_item` VALUES (14, 1, 2, 'num2', '2 ', NULL, 120.00, 1000.00, 5.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:19', '');
INSERT INTO `sys_bet_item` VALUES (15, 1, 2, 'num3', '3 ', NULL, 72.00, 1000.00, 5.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:40', '');
INSERT INTO `sys_bet_item` VALUES (16, 1, 2, 'num4', '4 ', NULL, 38.00, 1000.00, 5.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:54', '');
INSERT INTO `sys_bet_item` VALUES (17, 1, 2, 'num5', '5 ', NULL, 30.00, 1000.00, 5.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:07', '');
INSERT INTO `sys_bet_item` VALUES (18, 1, 2, 'num6', '6 ', NULL, 24.00, 1000.00, 5.00, 18, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:24', '');
INSERT INTO `sys_bet_item` VALUES (19, 1, 2, 'num7', '7 ', NULL, 19.00, 10000.00, 5.00, 19, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:39', '');
INSERT INTO `sys_bet_item` VALUES (20, 1, 2, 'num8', '8 ', NULL, 17.00, 10000.00, 5.00, 20, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:19:02', '');
INSERT INTO `sys_bet_item` VALUES (21, 1, 2, 'num9', '9 ', NULL, 15.00, 9999.99, 5.00, 21, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (22, 1, 2, 'num10', '10', NULL, 14.00, 9999.99, 5.00, 22, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (23, 1, 2, 'num11', '11', NULL, 13.00, 9999.99, 5.00, 23, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (24, 1, 2, 'num12', '12', NULL, 12.00, 9999.99, 5.00, 24, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (25, 1, 2, 'num13', '13', NULL, 12.00, 9999.99, 5.00, 25, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (26, 1, 2, 'num14', '14', NULL, 12.00, 9999.99, 5.00, 26, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (27, 1, 2, 'num15', '15', NULL, 12.00, 9999.99, 5.00, 27, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (28, 1, 2, 'num16', '16', NULL, 13.00, 9999.99, 5.00, 28, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (29, 1, 2, 'num17', '17', NULL, 14.00, 9999.99, 5.00, 29, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (30, 1, 2, 'num18', '18', NULL, 15.00, 9999.99, 5.00, 30, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (31, 1, 2, 'num19', '19', NULL, 17.00, 9999.99, 5.00, 31, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (32, 1, 2, 'num20', '20', NULL, 19.00, 9999.99, 5.00, 32, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (33, 1, 2, 'num21', '21', NULL, 24.00, 9999.99, 5.00, 33, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (34, 1, 2, 'num22', '22', NULL, 30.00, 9999.99, 5.00, 34, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (35, 1, 2, 'num23', '23', NULL, 38.00, 9999.99, 5.00, 35, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (36, 1, 2, 'num24', '24', NULL, 72.00, 9999.99, 5.00, 36, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (37, 1, 2, 'num25', '25', NULL, 120.00, 9999.99, 5.00, 37, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (38, 1, 2, 'num26', '26', NULL, 188.00, 9999.99, 5.00, 38, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (39, 1, 2, 'num27', '27', NULL, 500.00, 9999.99, 2.00, 39, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (40, 1, 3, 'red', '红', NULL, 2.04, 9999.99, 2.00, 40, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (41, 1, 3, 'green', '绿', NULL, 2.04, 9999.99, 2.00, 41, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (42, 1, 3, 'blue', '蓝', NULL, 2.04, 9999.99, 2.00, 42, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (43, 1, 3, 'loong', '龙', NULL, 2.04, 9999.99, 2.00, 43, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (44, 1, 3, 'tiger', '虎', NULL, 2.04, 9999.99, 2.00, 44, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (45, 1, 3, 'close', '合', NULL, 2.04, 9999.99, 2.00, 45, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (46, 1, 3, 'leopard', '豹子', NULL, 2.04, 9999.99, 2.00, 46, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (47, 1, 3, 'pairs', '对子', NULL, 2.04, 9999.99, 2.00, 47, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (48, 1, 3, 'shun', '顺子', NULL, 2.04, 9999.99, 2.00, 48, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (49, 2, 4, 'big', '大', NULL, 2.00, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (50, 2, 4, 'small', '小', NULL, 2.00, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (51, 2, 4, 'single', '单', NULL, 2.00, 5.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-25 20:16:46', '');
INSERT INTO `sys_bet_item` VALUES (52, 2, 4, 'doubleFlg', '双', NULL, 2.00, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (53, 2, 4, 'muchbig', '极大', NULL, 15.00, 2.00, 500.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (54, 2, 4, 'bigsingle', '大单', NULL, 4.20, 5.00, 9999.99, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (55, 2, 4, 'smallsingle', '小单', NULL, 4.60, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (56, 2, 4, 'bigdouble', '大双', NULL, 4.60, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (57, 2, 4, 'smalldouble', '小双', NULL, 4.20, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (58, 2, 4, 'muchsmall', '极小', NULL, 15.00, 2.00, 1000.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (59, 2, 5, 'num0', '0 ', NULL, 500.00, 5.00, 1000.00, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:03:41', '');
INSERT INTO `sys_bet_item` VALUES (60, 2, 5, 'num1', '1 ', NULL, 188.00, 5.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:08', '');
INSERT INTO `sys_bet_item` VALUES (61, 2, 5, 'num2', '2 ', NULL, 128.00, 5.00, 1000.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:19', '');
INSERT INTO `sys_bet_item` VALUES (62, 2, 5, 'num3', '3 ', NULL, 68.00, 5.00, 1000.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:40', '');
INSERT INTO `sys_bet_item` VALUES (63, 2, 5, 'num4', '4 ', NULL, 46.00, 5.00, 1000.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:54', '');
INSERT INTO `sys_bet_item` VALUES (64, 2, 5, 'num5', '5 ', NULL, 30.00, 5.00, 1000.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:07', '');
INSERT INTO `sys_bet_item` VALUES (65, 2, 5, 'num6', '6 ', NULL, 18.00, 5.00, 1000.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:24', '');
INSERT INTO `sys_bet_item` VALUES (66, 2, 5, 'num7', '7 ', NULL, 16.00, 5.00, 10000.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:39', '');
INSERT INTO `sys_bet_item` VALUES (67, 2, 5, 'num8', '8 ', NULL, 15.00, 5.00, 10000.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:19:02', '');
INSERT INTO `sys_bet_item` VALUES (68, 2, 5, 'num9', '9 ', NULL, 14.00, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (69, 2, 5, 'num10', '10', NULL, 13.00, 5.00, 9999.99, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (70, 2, 5, 'num11', '11', NULL, 13.00, 5.00, 9999.99, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (71, 2, 5, 'num12', '12', NULL, 12.00, 5.00, 9999.99, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (72, 2, 5, 'num13', '13', NULL, 12.00, 5.00, 9999.99, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (73, 2, 5, 'num14', '14', NULL, 12.00, 5.00, 9999.99, 15, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (74, 2, 5, 'num15', '15', NULL, 12.00, 5.00, 9999.99, 16, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (75, 2, 5, 'num16', '16', NULL, 13.00, 5.00, 9999.99, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (76, 2, 5, 'num17', '17', NULL, 14.00, 5.00, 9999.99, 18, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (77, 2, 5, 'num18', '18', NULL, 15.00, 5.00, 9999.99, 19, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (78, 2, 5, 'num19', '19', NULL, 17.00, 5.00, 9999.99, 20, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (79, 2, 5, 'num20', '20', NULL, 16.00, 5.00, 9999.99, 21, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (80, 2, 5, 'num21', '21', NULL, 18.00, 5.00, 9999.99, 22, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (81, 2, 5, 'num22', '22', NULL, 30.00, 5.00, 9999.99, 23, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (82, 2, 5, 'num23', '23', NULL, 46.00, 5.00, 9999.99, 24, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (83, 2, 5, 'num24', '24', NULL, 68.00, 5.00, 9999.99, 25, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (84, 2, 5, 'num25', '25', NULL, 128.00, 5.00, 9999.99, 26, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (85, 2, 5, 'num26', '26', NULL, 188.00, 5.00, 9999.99, 27, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (86, 2, 5, 'num27', '27', NULL, 500.00, 2.00, 9999.99, 28, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (87, 2, 6, 'red', '红', NULL, 2.85, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (88, 2, 6, 'green', '绿', NULL, 3.00, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (89, 2, 6, 'blue', '蓝', NULL, 3.00, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (90, 2, 6, 'loong', '龙', NULL, 2.00, 2.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (91, 2, 6, 'tiger', '虎', NULL, 2.00, 2.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (92, 2, 6, 'close', '合', NULL, 2.00, 2.00, 9999.99, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (93, 2, 6, 'leopard', '豹子', NULL, 80.00, 2.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (94, 2, 6, 'pairs', '对子', NULL, 3.30, 2.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (95, 2, 6, 'shun', '顺子', NULL, 15.00, 2.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (96, 9, 7, 'big', '大', NULL, 2.10, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:13:18', '');
INSERT INTO `sys_bet_item` VALUES (97, 9, 7, 'small', '小', NULL, 1.70, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:13:27', '');
INSERT INTO `sys_bet_item` VALUES (98, 9, 7, 'single', '单', NULL, 1.70, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:13:32', '');
INSERT INTO `sys_bet_item` VALUES (99, 9, 7, 'doubleFlg', '双', NULL, 2.10, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:13:39', '');
INSERT INTO `sys_bet_item` VALUES (100, 9, 7, 'num3', '3 ', NULL, 41.00, 2.00, 500.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:09:47', '');
INSERT INTO `sys_bet_item` VALUES (101, 9, 7, 'num4', '4 ', NULL, 41.00, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:10:01', '');
INSERT INTO `sys_bet_item` VALUES (102, 9, 7, 'num5', '5 ', NULL, 20.00, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:10:05', '');
INSERT INTO `sys_bet_item` VALUES (103, 9, 7, 'num6', '6 ', NULL, 20.00, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:10:08', '');
INSERT INTO `sys_bet_item` VALUES (104, 9, 7, 'num7', '7 ', NULL, 12.00, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:10:13', '');
INSERT INTO `sys_bet_item` VALUES (105, 9, 7, 'num8', '8 ', NULL, 12.00, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:10:17', '');
INSERT INTO `sys_bet_item` VALUES (106, 9, 7, 'num9', '9 ', NULL, 9.00, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:10:23', '');
INSERT INTO `sys_bet_item` VALUES (107, 9, 7, 'num10', '10', NULL, 9.00, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:10:26', '');
INSERT INTO `sys_bet_item` VALUES (108, 9, 7, 'num11', '11', NULL, 7.00, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:10:40', '');
INSERT INTO `sys_bet_item` VALUES (109, 9, 7, 'num12', '12', NULL, 9.00, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:10:44', '');
INSERT INTO `sys_bet_item` VALUES (110, 9, 7, 'num13', '13', NULL, 9.00, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:10:47', '');
INSERT INTO `sys_bet_item` VALUES (111, 9, 7, 'num14', '14', NULL, 12.00, 2.00, 1000.00, 18, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:10:52', '');
INSERT INTO `sys_bet_item` VALUES (112, 9, 7, 'num15', '15', NULL, 12.00, 2.00, 1000.00, 19, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:10:54', '');
INSERT INTO `sys_bet_item` VALUES (113, 9, 7, 'num16', '16', NULL, 20.00, 2.00, 1000.00, 20, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:10:59', '');
INSERT INTO `sys_bet_item` VALUES (114, 9, 7, 'num17', '17', NULL, 20.00, 2.00, 1000.00, 21, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:11:02', '');
INSERT INTO `sys_bet_item` VALUES (115, 9, 7, 'num18', '18', NULL, 41.00, 2.00, 1000.00, 22, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:11:06', '');
INSERT INTO `sys_bet_item` VALUES (116, 9, 7, 'num19', '19', NULL, 41.00, 2.00, 1000.00, 23, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:11:14', '');
INSERT INTO `sys_bet_item` VALUES (117, 9, 8, 'big1', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:11:34', '');
INSERT INTO `sys_bet_item` VALUES (118, 9, 8, 'small1', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:11:37', '');
INSERT INTO `sys_bet_item` VALUES (119, 9, 8, 'single1', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:11:40', '');
INSERT INTO `sys_bet_item` VALUES (120, 9, 8, 'double1', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:11:46', '');
INSERT INTO `sys_bet_item` VALUES (121, 9, 8, 'loong1', '龙', NULL, 1.98, 2.00, 500.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (122, 9, 8, 'tiger1', '虎', NULL, 1.98, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (123, 9, 8, 'num1Under1', '1 ', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (124, 9, 8, 'num2Under1', '2 ', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (125, 9, 8, 'num3Under1', '3 ', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (126, 9, 8, 'num4Under1', '4 ', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (127, 9, 8, 'num5Under1', '5 ', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (128, 9, 8, 'num6Under1', '6 ', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (129, 9, 8, 'num7Under1', '7 ', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (130, 9, 8, 'num8Under1', '8 ', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (131, 9, 8, 'num9Under1', '9 ', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (132, 9, 8, 'num10Under1', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (133, 9, 9, 'big2', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:11:55', '');
INSERT INTO `sys_bet_item` VALUES (134, 9, 9, 'small2', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:11:58', '');
INSERT INTO `sys_bet_item` VALUES (135, 9, 9, 'single2', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:12:00', '');
INSERT INTO `sys_bet_item` VALUES (136, 9, 9, 'double2', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:12:04', '');
INSERT INTO `sys_bet_item` VALUES (137, 9, 9, 'loong2', '龙', NULL, 1.98, 2.00, 500.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (138, 9, 9, 'tiger2', '虎', NULL, 1.98, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (139, 9, 9, 'num1Under2', '1 ', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (140, 9, 9, 'num2Under2', '2 ', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (141, 9, 9, 'num3Under2', '3 ', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (142, 9, 9, 'num4Under2', '4 ', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (143, 9, 9, 'num5Under2', '5 ', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (144, 9, 9, 'num6Under2', '6 ', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (145, 9, 9, 'num7Under2', '7 ', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (146, 9, 9, 'num8Under2', '8 ', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (147, 9, 9, 'num9Under2', '9 ', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (148, 9, 9, 'num10Under2', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (149, 9, 10, 'big3', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:12:30', '');
INSERT INTO `sys_bet_item` VALUES (150, 9, 10, 'small3', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:12:33', '');
INSERT INTO `sys_bet_item` VALUES (151, 9, 10, 'single3', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:12:35', '');
INSERT INTO `sys_bet_item` VALUES (152, 9, 10, 'double3', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:12:38', '');
INSERT INTO `sys_bet_item` VALUES (153, 9, 10, 'loong3', '龙', NULL, 1.98, 2.00, 500.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:12:44', '');
INSERT INTO `sys_bet_item` VALUES (154, 9, 10, 'tiger3', '虎', NULL, 1.98, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:12:46', '');
INSERT INTO `sys_bet_item` VALUES (155, 9, 10, 'num1Under3', '1 ', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (156, 9, 10, 'num2Under3', '2 ', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (157, 9, 10, 'num3Under3', '3 ', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (158, 9, 10, 'num4Under3', '4 ', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (159, 9, 10, 'num5Under3', '5 ', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (160, 9, 10, 'num6Under3', '6 ', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (161, 9, 10, 'num7Under3', '7 ', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (162, 9, 10, 'num8Under3', '8 ', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (163, 9, 10, 'num9Under3', '9 ', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (164, 9, 10, 'num10Under3', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (165, 9, 11, 'big4', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (166, 9, 11, 'small4', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (167, 9, 11, 'single4', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (168, 9, 11, 'double4', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (169, 9, 11, 'loong4', '龙', NULL, 1.98, 2.00, 500.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (170, 9, 11, 'tiger4', '虎', NULL, 1.98, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (171, 9, 11, 'num1Under4', '1 ', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (172, 9, 11, 'num2Under4', '2 ', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (173, 9, 11, 'num3Under4', '3 ', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (174, 9, 11, 'num4Under4', '4 ', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (175, 9, 11, 'num5Under4', '5 ', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (176, 9, 11, 'num6Under4', '6 ', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (177, 9, 11, 'num7Under4', '7 ', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (178, 9, 11, 'num8Under4', '8 ', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (179, 9, 11, 'num9Under4', '9 ', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (180, 9, 11, 'num10Under4', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (181, 9, 12, 'big5', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (182, 9, 12, 'small5', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (183, 9, 12, 'single5', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (184, 9, 12, 'double5', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (185, 9, 12, 'loong5', '龙', NULL, 1.98, 2.00, 500.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (186, 9, 12, 'tiger5', '虎', NULL, 1.98, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (187, 9, 12, 'num1Under5', '1 ', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (188, 9, 12, 'num2Under5', '2 ', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (189, 9, 12, 'num3Under5', '3 ', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (190, 9, 12, 'num4Under5', '4 ', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (191, 9, 12, 'num5Under5', '5 ', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (192, 9, 12, 'num6Under5', '6 ', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (193, 9, 12, 'num7Under5', '7 ', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (194, 9, 12, 'num8Under5', '8 ', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (195, 9, 12, 'num9Under5', '9 ', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (196, 9, 12, 'num10Under5', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (197, 9, 13, 'big6', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (198, 9, 13, 'small6', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (199, 9, 13, 'single6', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (200, 9, 13, 'double6', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (201, 9, 13, 'loong6', '龙', NULL, 1.98, 2.00, 500.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (202, 9, 13, 'tiger6', '虎', NULL, 1.98, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (203, 9, 13, 'num1Under6', '1 ', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (204, 9, 13, 'num2Under6', '2 ', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (205, 9, 13, 'num3Under6', '3 ', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (206, 9, 13, 'num4Under6', '4 ', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (207, 9, 13, 'num5Under6', '5 ', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (208, 9, 13, 'num6Under6', '6 ', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (209, 9, 13, 'num7Under6', '7 ', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (210, 9, 13, 'num8Under6', '8 ', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (211, 9, 13, 'num9Under6', '9 ', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (212, 9, 13, 'num10Under6', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (213, 9, 14, 'big7', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (214, 9, 14, 'small7', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (215, 9, 14, 'single7', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (216, 9, 14, 'double7', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (217, 9, 14, 'loong7', '龙', NULL, 1.98, 2.00, 500.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (218, 9, 14, 'tiger7', '虎', NULL, 1.98, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (219, 9, 14, 'num1Under7', '1 ', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (220, 9, 14, 'num2Under7', '2 ', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (221, 9, 14, 'num3Under7', '3 ', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (222, 9, 14, 'num4Under7', '4 ', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (223, 9, 14, 'num5Under7', '5 ', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (224, 9, 14, 'num6Under7', '6 ', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (225, 9, 14, 'num7Under7', '7 ', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (226, 9, 14, 'num8Under7', '8 ', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (227, 9, 14, 'num9Under7', '9 ', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (228, 9, 14, 'num10Under7', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (229, 9, 15, 'big8', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (230, 9, 15, 'small8', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (231, 9, 15, 'single8', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (232, 9, 15, 'double8', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (233, 9, 15, 'loong8', '龙', NULL, 1.98, 2.00, 500.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (234, 9, 15, 'tiger8', '虎', NULL, 1.98, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (235, 9, 15, 'num1Under8', '1 ', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (236, 9, 15, 'num2Under8', '2 ', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (237, 9, 15, 'num3Under8', '3 ', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (238, 9, 15, 'num4Under8', '4 ', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (239, 9, 15, 'num5Under8', '5 ', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (240, 9, 15, 'num6Under8', '6 ', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (241, 9, 15, 'num7Under8', '7 ', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (242, 9, 15, 'num8Under8', '8 ', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (243, 9, 15, 'num9Under8', '9 ', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (244, 9, 15, 'num10Under8', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (245, 9, 16, 'big9', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (246, 9, 16, 'small9', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (247, 9, 16, 'single9', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (248, 9, 16, 'double9', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (249, 9, 16, 'loong9', '龙', NULL, 1.98, 2.00, 500.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (250, 9, 16, 'tiger9', '虎', NULL, 1.98, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (251, 9, 16, 'num1Under9', '1 ', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (252, 9, 16, 'num2Under9', '2 ', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (253, 9, 16, 'num3Under9', '3 ', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (254, 9, 16, 'num4Under9', '4 ', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (255, 9, 16, 'num5Under9', '5 ', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (256, 9, 16, 'num6Under9', '6 ', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (257, 9, 16, 'num7Under9', '7 ', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (258, 9, 16, 'num8Under9', '8 ', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (259, 9, 16, 'num9Under9', '9 ', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (260, 9, 16, 'num10Under9', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (261, 9, 17, 'big10', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (262, 9, 17, 'small10', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (263, 9, 17, 'single10', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (264, 9, 17, 'double10', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (265, 9, 17, 'loong10', '龙', NULL, 1.98, 2.00, 500.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (266, 9, 17, 'tiger10', '虎', NULL, 1.98, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (267, 9, 17, 'num1Under10', '1 ', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (268, 9, 17, 'num2Under10', '2 ', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (269, 9, 17, 'num3Under10', '3 ', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (270, 9, 17, 'num4Under10', '4 ', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (271, 9, 17, 'num5Under10', '5 ', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (272, 9, 17, 'num6Under10', '6 ', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (273, 9, 17, 'num7Under10', '7 ', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (274, 9, 17, 'num8Under10', '8 ', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (275, 9, 17, 'num9Under10', '9 ', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (276, 9, 17, 'num10Under10', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (277, 15, 18, 'sumBig', '大', NULL, 1.96, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:17:39', '');
INSERT INTO `sys_bet_item` VALUES (278, 15, 18, 'sumSmall', '小', NULL, 1.96, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:17:45', '');
INSERT INTO `sys_bet_item` VALUES (279, 15, 18, 'sumSingle', '单', NULL, 1.96, 5.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:17:48', '');
INSERT INTO `sys_bet_item` VALUES (280, 15, 18, 'sumDouble', '双', NULL, 1.96, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:17:51', '');
INSERT INTO `sys_bet_item` VALUES (281, 15, 18, 'sumLoong', '龙', NULL, 1.96, 2.00, 500.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:17:58', '');
INSERT INTO `sys_bet_item` VALUES (282, 15, 18, 'sumTiger', '虎', NULL, 1.96, 5.00, 9999.99, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:18:02', '');
INSERT INTO `sys_bet_item` VALUES (283, 15, 18, 'sumSum', '和', NULL, 8.00, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:18:06', '');
INSERT INTO `sys_bet_item` VALUES (284, 15, 19, 'num1Big', '0 ', NULL, 9.80, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (285, 15, 19, 'num1Small', '1 ', NULL, 9.80, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (286, 15, 19, 'num1Single', '2 ', NULL, 9.80, 5.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (287, 15, 19, 'num1Double', '3 ', NULL, 9.80, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (288, 15, 19, 'num1Under0', '4 ', NULL, 9.80, 2.00, 500.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (289, 15, 19, 'num1Under1', '5 ', NULL, 9.80, 5.00, 9999.99, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (290, 15, 19, 'num1Under2', '6 ', NULL, 9.80, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (291, 15, 19, 'num1Under3', '7 ', NULL, 9.80, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (292, 15, 19, 'num1Under4', '8 ', NULL, 9.80, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (293, 15, 19, 'num1Under5', '9 ', NULL, 9.80, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (294, 15, 19, 'num1Under6', '大', NULL, 1.96, 5.00, 9999.99, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (295, 15, 19, 'num1Under7', '小', NULL, 1.96, 5.00, 9999.99, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (296, 15, 19, 'num1Under8', '单', NULL, 1.96, 5.00, 9999.99, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (297, 15, 19, 'num1Under9', '双', NULL, 1.96, 5.00, 9999.99, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (298, 15, 20, 'num2Under0', '0 ', NULL, 9.80, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (299, 15, 20, 'num2Under1', '1 ', NULL, 9.80, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (300, 15, 20, 'num2Under2', '2 ', NULL, 9.80, 5.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (301, 15, 20, 'num2Under3', '3 ', NULL, 9.80, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (302, 15, 20, 'num2Under4', '4 ', NULL, 9.80, 2.00, 500.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (303, 15, 20, 'num2Under5', '5 ', NULL, 9.80, 5.00, 9999.99, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (304, 15, 20, 'num2Under6', '6 ', NULL, 9.80, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (305, 15, 20, 'num2Under7', '7 ', NULL, 9.80, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (306, 15, 20, 'num2Under8', '8 ', NULL, 9.80, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (307, 15, 20, 'num2Under9', '9 ', NULL, 9.80, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (308, 15, 20, 'num2Big', '大', NULL, 1.96, 5.00, 9999.99, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (309, 15, 20, 'num2Small', '小', NULL, 1.96, 5.00, 9999.99, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (310, 15, 20, 'num2Single', '单', NULL, 1.96, 5.00, 9999.99, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (311, 15, 20, 'num2Double', '双', NULL, 1.96, 5.00, 9999.99, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (312, 15, 21, 'num3Under0', '0 ', NULL, 9.80, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (313, 15, 21, 'num3Under1', '1 ', NULL, 9.80, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (314, 15, 21, 'num3Under2', '2 ', NULL, 9.80, 5.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (315, 15, 21, 'num3Under3', '3 ', NULL, 9.80, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (316, 15, 21, 'num3Under4', '4 ', NULL, 9.80, 2.00, 500.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (317, 15, 21, 'num3Under5', '5 ', NULL, 9.80, 5.00, 9999.99, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (318, 15, 21, 'num3Under6', '6 ', NULL, 9.80, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (319, 15, 21, 'num3Under7', '7 ', NULL, 9.80, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (320, 15, 21, 'num3Under8', '8 ', NULL, 9.80, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (321, 15, 21, 'num3Under9', '9 ', NULL, 9.80, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (322, 15, 21, 'num3Big', '大', NULL, 1.96, 5.00, 9999.99, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (323, 15, 21, 'num3Small', '小', NULL, 1.96, 5.00, 9999.99, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (324, 15, 21, 'num3Single', '单', NULL, 1.96, 5.00, 9999.99, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (325, 15, 21, 'num3Double', '双', NULL, 1.96, 5.00, 9999.99, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (326, 15, 22, 'num4Under0', '0 ', NULL, 9.80, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (327, 15, 22, 'num4Under1', '1 ', NULL, 9.80, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (328, 15, 22, 'num4Under2', '2 ', NULL, 9.80, 5.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (329, 15, 22, 'num4Under3', '3 ', NULL, 9.80, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (330, 15, 22, 'num4Under4', '4 ', NULL, 9.80, 2.00, 500.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (331, 15, 22, 'num4Under5', '5 ', NULL, 9.80, 5.00, 9999.99, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (332, 15, 22, 'num4Under6', '6 ', NULL, 9.80, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (333, 15, 22, 'num4Under7', '7 ', NULL, 9.80, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (334, 15, 22, 'num4Under8', '8 ', NULL, 9.80, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (335, 15, 22, 'num4Under9', '9 ', NULL, 9.80, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (336, 15, 22, 'num4Big', '大', NULL, 1.96, 5.00, 9999.99, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (337, 15, 22, 'num4Small', '小', NULL, 1.96, 5.00, 9999.99, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (338, 15, 22, 'num4Single', '单', NULL, 1.96, 5.00, 9999.99, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (339, 15, 22, 'num4Double', '双', NULL, 1.96, 5.00, 9999.99, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (340, 15, 23, 'num5Under0', '0 ', NULL, 9.80, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (341, 15, 23, 'num5Under1', '1 ', NULL, 9.80, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (342, 15, 23, 'num5Under2', '2 ', NULL, 9.80, 5.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (343, 15, 23, 'num5Under3', '3 ', NULL, 9.80, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (344, 15, 23, 'num5Under4', '4 ', NULL, 9.80, 2.00, 500.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (345, 15, 23, 'num5Under5', '5 ', NULL, 9.80, 5.00, 9999.99, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (346, 15, 23, 'num5Under6', '6 ', NULL, 9.80, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (347, 15, 23, 'num5Under7', '7 ', NULL, 9.80, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (348, 15, 23, 'num5Under8', '8 ', NULL, 9.80, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (349, 15, 23, 'num5Under9', '9 ', NULL, 9.80, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (350, 15, 23, 'num5Big', '大', NULL, 1.96, 5.00, 9999.99, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (351, 15, 23, 'num5Small', '小', NULL, 1.96, 5.00, 9999.99, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (352, 15, 23, 'num5Single', '单', NULL, 1.96, 5.00, 9999.99, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (353, 15, 23, 'num5Double', '双', NULL, 1.96, 5.00, 9999.99, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (354, 15, 24, 'fBao', '豹', NULL, 70.00, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (355, 15, 24, 'fDui', '对', NULL, 3.20, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (356, 15, 24, 'fSun', '顺', NULL, 14.00, 5.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (357, 15, 24, 'fBan', '半', NULL, 2.40, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (358, 15, 24, 'fZa', '杂', NULL, 2.90, 2.00, 500.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (359, 15, 25, 'mBao', '豹', NULL, 70.00, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (360, 15, 25, 'mDui', '对', NULL, 3.20, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (361, 15, 25, 'mSun', '顺', NULL, 14.00, 5.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (362, 15, 25, 'mBan', '半', NULL, 2.40, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (363, 15, 25, 'mZa', '杂', NULL, 2.90, 2.00, 500.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (364, 15, 26, 'bBao', '豹', NULL, 70.00, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (365, 15, 26, 'bDui', '对', NULL, 3.20, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (366, 15, 26, 'bSun', '顺', NULL, 14.00, 5.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (367, 15, 26, 'bBan', '半', NULL, 2.40, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (368, 15, 26, 'bZa', '杂', NULL, 2.90, 2.00, 500.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏玩法表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_bet_type
-- ----------------------------
INSERT INTO `sys_bet_type` VALUES (1, 1, '大小单双', 1, '0', '', '2024-03-10 21:39:45', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (2, 1, '猜数字', 2, '0', '', '2024-03-10 21:40:13', '', '2024-03-10 21:40:37', '');
INSERT INTO `sys_bet_type` VALUES (3, 1, '特殊玩法', 3, '0', '', '2024-03-10 21:40:34', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (4, 2, '大小单双', 1, '0', '', '2024-03-10 21:39:45', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (5, 2, '猜数字', 2, '0', '', '2024-03-10 21:40:13', '', '2024-03-10 21:40:37', '');
INSERT INTO `sys_bet_type` VALUES (6, 2, '特殊玩法', 3, '0', '', '2024-03-10 21:40:34', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (7, 9, '冠亚和值', 1, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (8, 9, '猜冠军', 2, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (9, 9, '猜亚军', 3, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (10, 9, '猜第三名', 4, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (11, 9, '猜第四名', 5, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (12, 9, '猜第五名', 6, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (13, 9, '猜第六名', 7, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (14, 9, '猜第七名', 8, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (15, 9, '猜第八名', 9, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (16, 9, '猜第九名', 10, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (17, 9, '猜第十名', 11, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (18, 15, '和值', 1, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (19, 15, '球1', 2, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (20, 15, '球2', 3, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (21, 15, '球3', 4, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (22, 15, '球4', 5, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (23, 15, '球5', 6, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (24, 15, '前三', 7, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (25, 15, '中三', 8, '0', '', '2024-03-16 20:38:38', '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (26, 15, '后三', 9, '0', '', '2024-03-16 20:38:38', '', NULL, '');

-- ----------------------------
-- Table structure for sys_chat
-- ----------------------------
DROP TABLE IF EXISTS `sys_chat`;
CREATE TABLE `sys_chat`  (
  `chat_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `from_user_id` bigint(20) NOT NULL COMMENT '信息发送用户ID',
  `to_user_id` bigint(20) NOT NULL COMMENT '信息接收用户ID',
  `content` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息内容',
  `is_read` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否已读(0 未读 1已读)',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`chat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '聊天信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_chat
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_dict_data` VALUES (107, 1, '正常', '0', 'sys_replace_status', NULL, 'success', 'N', '0', 'admin', '2024-03-17 19:29:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 2, '停用', '1', 'sys_replace_status', NULL, 'danger', 'N', '0', 'admin', '2024-03-17 19:29:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 1, '未开奖', '0', 'sys_kj_status', NULL, 'warning', 'N', '0', 'admin', '2024-04-04 20:35:13', 'admin', '2024-04-04 20:55:24', NULL);
INSERT INTO `sys_dict_data` VALUES (110, 2, '已开奖', '1', 'sys_kj_status', NULL, 'success', 'N', '0', 'admin', '2024-04-04 20:35:24', 'admin', '2024-04-04 20:55:35', NULL);
INSERT INTO `sys_dict_data` VALUES (111, 2, '开奖中', '2', 'sys_kj_status', NULL, 'info', 'N', '0', 'admin', '2024-04-04 22:05:02', '', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_dict_type` VALUES (103, '轮播图状态', 'sys_replace_status', '0', 'admin', '2024-03-17 19:28:42', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '开奖状态', 'sys_kj_status', '0', 'admin', '2024-04-04 20:34:16', 'admin', '2024-04-04 20:34:34', NULL);

-- ----------------------------
-- Table structure for sys_game
-- ----------------------------
DROP TABLE IF EXISTS `sys_game`;
CREATE TABLE `sys_game`  (
  `game_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '游戏ID',
  `game_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏图片',
  `game_type` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏类别',
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
  `lead_time` int(11) NULL DEFAULT 0 COMMENT '预计开奖延后时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '封盘秒数',
  `lottery_interval` int(11) NULL DEFAULT 0 COMMENT '开奖间隔秒数',
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
INSERT INTO `sys_game` VALUES (1, '/profile/upload/2024/03/06/jnd2.0_20240306222925A002.jpg', '3', 'jnd20', '加拿大2.0', '加拿大28', 0xE38090E58AA0E68BBFE5A4A7322E30E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A322E30E5808DEFBC88E5BC8031332F3134E8B594312E35E5808DEFBC89E5B08FE58D952FE5A4A7E58F8CEFBC9A342E36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A342E32E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3135E5808DE38090E789B9E6AE8AE8B594E78E87E38091E4B9B0E5B08FE68896E58D95EFBC8CE5BC80E5A596E4B8BA3133E4B894E8B594EFBC9A312E35E5808DE4B9B0E5A4A7E68896E58F8CEFBC8CE5BC80E5A596E4B8BA3134E4B894E8B594EFBC9A312E35E5808DE4B88BE6B3A8E5B08FE58D95E5BC80E5A596E4B8BA3133E4B8ADE5A596E59B9EE69CAC266E6273703BE4B88BE6B3A8E5A4A7E58F8CE5BC80E5A596E4B8BA3134E4B8ADE5A596E59B9EE69CAC266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E58F8DE58D83E58886E4B98B3135E38091E38090E6999AE4B88A30303A3135E5898DE7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 3.00, NULL, NULL, 0.00, 2.00, 10000.00, 0, 60, 0, 20, NULL, 1, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-11 19:19:01', '');
INSERT INTO `sys_game` VALUES (2, '/profile/upload/2024/03/09/jnd28_20240309200723A001.jpg', '3', 'jnd28', '加拿大2.8', '加拿大2.8', 0xE38090E58AA0E68BBFE5A4A7322E38E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A322E38E5808DE5B08FE58D952FE5A4A7E58F8CEFBC9A36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A36E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3136E5808DE5AFB9E5AD902F33266E6273703B20266E6273703BE9A1BAE5AD902F3132266E6273703B20266E6273703BE8B1B9E5AD902F3630266E6273703BE38090E789B9E6AE8AE8B594E78E87E38091E5BC80E695B0E5AD9731332F31342FE5AFB9E5AD902FE9A1BAE5AD902FE8B1B9E5AD902F20E4B8ADE5A596E58D95E6B3A8E7BB84E59088E59B9EE69CAC266E6273703BE695B0E5AD97EFBC8830302F3237EFBC89EFBC9A353230E5808DE695B0E5AD97EFBC8830312F3236EFBC89EFBC9A323430E5808DE695B0E5AD97EFBC8830322F3235EFBC89EFBC9A313230E5808DE695B0E5AD97EFBC8830332F3234EFBC89EFBC9A3732E5808DE695B0E5AD97EFBC8830342F3233EFBC89EFBC9A3438E5808DE695B0E5AD97EFBC8830352F3232EFBC89EFBC9A3330E5808DE695B0E5AD97EFBC8830362F3231EFBC89EFBC9A3234E5808DE695B0E5AD97EFBC8830372F3230EFBC89EFBC9A3139E5808DE695B0E5AD97EFBC8830382F3139EFBC89EFBC9A3137E5808DE695B0E5AD97EFBC8830392F3138EFBC89EFBC9A3135E5808DE695B0E5AD97EFBC8831302F3137EFBC89EFBC9A3134E5808DE695B0E5AD97EFBC8831312F3136EFBC89EFBC9A3133E5808DE695B0E5AD97EFBC8831322F3135EFBC89EFBC9A3132E5808DE695B0E5AD97EFBC8831332F3134EFBC89EFBC9A3132E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E58C85E590ABE69CACE98791EFBC81266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE7BB84E59088EFBC9A3130303030E5B081E9A1B6266E6273703BE69E81E5A4A72FE69E81E5B08FEFBC9A3130303030E5B081E9A1B6266E6273703BE695B0E5AD9730302F3237EFBC9A31303030E5B081E9A1B6E695B0E5AD97312F3236EFBC9A33303030E5B081E9A1B6E5AFB9E9A1BAE5AD90EFBC9A3130303030E5B081E9A1B6E8B1B9E5AD90EFBC9A35303030E5B081E9A1B6E58D95E782B9E695B0E5AD97E69C80E9AB98E8B594E4BB98353030303030E38090E4BA8FE68D9FE58F8DE6B0B4E38091E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3135E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, 'Jnd28', 'jndrecord', 'jnd28', 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 10, 55, 210, 20, NULL, 2, '0', 'N', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:07:58', '');
INSERT INTO `sys_game` VALUES (3, '/profile/upload/2024/03/09/jnd32_20240309200821A002.jpg', '3', 'jnd32', '加拿大3.2', '加拿大3.2', 0xE38090E58AA0E68BBFE5A4A7332E32E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A332E32E5808DE5B08FE58D952FE5A4A7E58F8CEFBC9A362E36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A362E36E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3135E5808DE38090E789B9E6AE8AE8B594E78E87E38091E5A4A7E5B08FE58D95E58F8C20E6ADA3E5B8B8E8B594E78E87332E32E5808DEFBC8CE5BC80E5A596E7BB93E69E9CE98187E5BC80E5A596E58CBAE4B889E4B8AAE695B0E5AD97E585B6E4B8ADE4B880E4B8AAE5B8A630E6889639E4B88EE5BC80E5A596E7BB93E69E9C3133E688963134EFBC8CE4B8ADE5A596E59B9EE69CACE98791E38082E7BB84E59088EFBC8CE6ADA3E5B8B8E8B594E78E87362E36E5808DEFBC8CE5BC80E5A596E7BB93E69E9CE98187E5BC80E5A596E58CBAE4B889E4B8AAE695B0E5AD97E585B6E4B8ADE4B880E4B8AAE5B8A630E6889639E4B88EE5BC80E5A596E7BB93E69E9C3133E688963134EFBC8CE4B8ADE5A596E59B9EE69CACE98791E38082E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B35E38091E38090E6B581E6B0B4E58F8DE58D83E58886E4B98B35E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 15.00, 5.00, 20000.00, 0, 75, 0, 20, NULL, 3, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:08:45', '');
INSERT INTO `sys_game` VALUES (4, '/profile/upload/2024/03/09/jspc28_20240309200907A003.png', '3', 'jspc28', '比特2.0', '比特28', 0xE38090E6BEB3E6B4B2E69E81E9809F322E30E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A322E30E5808DEFBC88E5BC8031332F3134E8B594312E36E5808DEFBC89E5B08FE58D952FE5A4A7E58F8CEFBC9A342E36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A342E32E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3135E5808DE38090E789B9E6AE8AE8B594E78E87E38091E4B9B0E5B08FE68896E58D95EFBC8CE5BC80E5A596E4B8BA3133E4B894E8B594EFBC9A312E36E5808DE4B9B0E5A4A7E68896E58F8CEFBC8CE5BC80E5A596E4B8BA3134E4B894E8B594EFBC9A312E36E5808DE4B88BE6B3A8E5B08FE58D95E5BC80E5A596E4B8BA3133E4B8ADE5A596E59B9EE69CAC266E6273703BE4B88BE6B3A8E5A4A7E58F8CE5BC80E5A596E4B8BA3134E4B8ADE5A596E59B9EE69CAC266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E58F8DE58D83E58886E4B98B3230E38091E38090E6999AE4B88A30303A3135E5898DE7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 10.00, NULL, NULL, 20.00, 2.00, 20000.00, 0, 20, 0, 20, NULL, 4, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:09:59', '');
INSERT INTO `sys_game` VALUES (5, '/profile/upload/2024/03/09/bt28_20240309201046A004.png', '3', 'bt28', '比特2.8', '比特2.8', 0xE38090E6BEB3E6B4B2E69E81E9809F322E38E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A322E38E5808DE5B08FE58D952FE5A4A7E58F8CEFBC9A36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A36E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3135E5808DE5AFB9E5AD902F33266E6273703B20266E6273703BE9A1BAE5AD902F3132266E6273703B20266E6273703BE8B1B9E5AD902F3530266E6273703BE38090E789B9E6AE8AE8B594E78E87E38091E5BC80E695B0E5AD9731332F31342FE5AFB9E5AD902FE9A1BAE5AD902FE8B1B9E5AD902F20E4B8ADE5A596E58D95E6B3A8E7BB84E59088E59B9EE69CAC266E6273703BE695B0E5AD97EFBC8830302F3237EFBC89EFBC9A353030E5808DE695B0E5AD97EFBC8830312F3236EFBC89EFBC9A323430E5808DE695B0E5AD97EFBC8830322F3235EFBC89EFBC9A313230E5808DE695B0E5AD97EFBC8830332F3234EFBC89EFBC9A3732E5808DE695B0E5AD97EFBC8830342F3233EFBC89EFBC9A3438E5808DE695B0E5AD97EFBC8830352F3232EFBC89EFBC9A3333E5808DE695B0E5AD97EFBC8830362F3231EFBC89EFBC9A3235E5808DE695B0E5AD97EFBC8830372F3230EFBC89EFBC9A3230E5808DE695B0E5AD97EFBC8830382F3139EFBC89EFBC9A3137E5808DE695B0E5AD97EFBC8830392F3138EFBC89EFBC9A3135E5808DE695B0E5AD97EFBC8831302F3137EFBC89EFBC9A3134E5808DE695B0E5AD97EFBC8831312F3136EFBC89EFBC9A3134E5808DE695B0E5AD97EFBC8831322F3135EFBC89EFBC9A3133E5808DE695B0E5AD97EFBC8831332F3134EFBC89EFBC9A3132E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E58C85E590ABE69CACE98791EFBC81266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE7BB84E59088EFBC9A3130303030E5B081E9A1B6266E6273703BE69E81E5A4A72FE69E81E5B08FEFBC9A3130303030E5B081E9A1B6266E6273703BE695B0E5AD9730302F3237EFBC9A31303030E5B081E9A1B6E695B0E5AD97312F3236EFBC9A33303030E5B081E9A1B6E5AFB9E9A1BAE5AD90EFBC9A3130303030E5B081E9A1B6E8B1B9E5AD90EFBC9A35303030E5B081E9A1B6E58D95E782B9E695B0E5AD97E69C80E9AB98E8B594E4BB98353030303030E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3135E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 5.00, NULL, NULL, 5.00, 5.00, 50000.00, 0, 20, 0, 20, NULL, 5, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:11:14', '');
INSERT INTO `sys_game` VALUES (6, '/profile/upload/2024/03/09/mssc_20240309201138A005.png', '10', 'mssc', '极速赛车', '极速赛车', 0xE38090E6BEB3E6B4B2E69E81E9809FE8B59BE8BDA6E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E7A68FE588A9E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3135E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 10.00, NULL, NULL, 5.00, 5.00, 50000.00, 0, 20, 0, 20, NULL, 6, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:12:38', '');
INSERT INTO `sys_game` VALUES (7, '/profile/upload/2024/03/09/azxy52_20240309201631A006.jpg', '5', 'azxy52', '澳洲幸运5高赔率', '澳洲幸运5高赔率', 0xE38090E6BEB3E6B4B2E5B9B8E8BF9035266E6273703B392E39E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D302D39E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 100000.00, 0, 70, 0, 20, NULL, 7, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:17:06', '');
INSERT INTO `sys_game` VALUES (8, '/profile/upload/2024/03/09/azxy5_20240309201732A007.jpg', '5', 'azxy5', '澳洲幸运5', '澳洲幸运5', 0xE38090E6BEB3E6B4B2E5B9B8E8BF9035266E6273703B392E39E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D302D39E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, 'Azxy5', 'azxy5record', 'azxy5kj', 0.00, NULL, NULL, 5.00, 5.00, 100000.00, 0, 70, 0, 20, NULL, 8, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:18:04', '');
INSERT INTO `sys_game` VALUES (9, '/profile/upload/2024/03/09/azxy10_20240309201831A008.jpg', '10', 'azxy10', '澳洲幸运10', '澳洲幸运10', 0xE38090E6BEB3E6B4B2E5B9B8E8BF903130266E6273703B20392E39E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, 'Azxy10', 'azxy10record', 'azxy10kj', 0.00, NULL, NULL, 0.00, 5.00, 300000.00, 15, 70, 300, 20, NULL, 9, '0', 'N', 0, '', '2024-03-06 22:34:06', '', '2024-03-20 22:15:56', '');
INSERT INTO `sys_game` VALUES (10, '/profile/upload/2024/03/09/azxy10_20240309201934A009.jpg', '10', 'azxy102', '澳洲幸运10高赔率', '澳洲幸运10高赔率', 0xE38090E6BEB3E6B4B2E5B9B8E8BF903130266E6273703B20392E39E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 300000.00, 0, 70, 0, 20, NULL, 10, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:20:07', '');
INSERT INTO `sys_game` VALUES (11, '/profile/upload/2024/03/09/xyft_20240309202028A010.jpg', '10', 'xyft', '幸运飞艇', '幸运飞艇', 0xE38090E5B9B8E8BF90E9A39EE88987392E39E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808DEFBC88E590ABE69CACE98791EFBC893130E8BDA6E58FB7EFBC9A392E39E5808DEFBC88E590ABE69CACE98791EFBC89E9BE992FE8998EEFBC9A312E3938E5808DEFBC88E590ABE69CACE98791EFBC89E586A0E4BA9AE5928CE5A4A72FE58F8CEFBC9A322E31E5808DEFBC88E590ABE69CACE98791EFBC89E5B08F2FE58D95EFBC9A312E37E5808DEFBC88E590ABE69CACE98791EFBC89332F342F31382F3139EFBC9AE590ABE69CAC3431E5808D352F362F31362F3137EFBC9AE590ABE69CAC3230E5808D372F382F31342F3135EFBC9AE590ABE69CAC3133E5808D392F31302F31322F3133EFBC9AE590ABE69CAC39E5808D3131EFBC9AE590ABE69CAC37E5808D317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E2062722FE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 0, 110, 0, 20, NULL, 11, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:20:59', '');
INSERT INTO `sys_game` VALUES (12, '/profile/upload/2024/03/09/jssc_20240309202124A011.jpg', '10', 'jssc', '168极速赛车', '168极速赛车', 0xE38090E69E81E9809FE8B59BE8BDA6392E39E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4BA8FE68D9FE697A0E58F8DE6B0B4E38091E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3030E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, 'Jssc', 'jsscrecord', 'jssc10', 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 0, 35, 0, 20, NULL, 12, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:21:54', '');
INSERT INTO `sys_game` VALUES (13, '/profile/upload/2024/03/09/jsft_20240309202548A012.jpg', '10', 'jsft', '168极速飞艇', '168极速飞艇', 0xE38090E69E81E9809FE9A39EE88987E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3030E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, 'Jsfei', 'jsfeirecord', 'jsfei10', 0.00, NULL, NULL, 5.00, 5.00, 50000.00, 0, 5, 0, 20, NULL, 13, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:26:22', '');
INSERT INTO `sys_game` VALUES (14, '/profile/upload/2024/03/09/jssc2_20240309202640A013.jpg', '10', 'jssc2', '168极速赛车高赔率', '168极速赛车高赔率', 0xE38090E69E81E9809FE8B59BE8BDA6392E39E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4BA8FE68D9FE697A0E58F8DE6B0B4E38091E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3030E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 0, 35, 0, 20, NULL, 14, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:27:07', '');
INSERT INTO `sys_game` VALUES (15, '/profile/upload/2024/03/09/jsssc_20240309202724A014.jpg', '5', 'jsscmet', '168极速时时彩', '168极速时时彩', 0xE38090E69E81E9809FE697B6E697B6E5BDA9E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D302D39E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4BA8FE68D9FE697A0E58F8DE6B0B4E38091E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3030E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, 'Jsssc', 'jssscrecord', 'jsssckj', 0.00, NULL, NULL, 5.00, 5.00, 100000.00, 10, 35, 75, 30, NULL, 15, '0', 'N', 0, '', '2024-03-06 22:34:06', '', '2024-03-20 22:20:37', '');
INSERT INTO `sys_game` VALUES (16, '/profile/upload/2024/03/09/xyft2_20240309202820A015.jpg', '10', 'xyft2', '幸运飞艇高赔率', '幸运飞艇高赔率', 0xE38090E5B9B8E8BF90E9A39EE88987392E39E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808DEFBC88E590ABE69CACE98791EFBC893130E8BDA6E58FB7EFBC9A392E39E5808DEFBC88E590ABE69CACE98791EFBC89E9BE992FE8998EEFBC9A312E3938E5808DEFBC88E590ABE69CACE98791EFBC89E586A0E4BA9AE5928CE5A4A72FE58F8CEFBC9A322E31E5808DEFBC88E590ABE69CACE98791EFBC89E5B08F2FE58D95EFBC9A312E37E5808DEFBC88E590ABE69CACE98791EFBC89332F342F31382F3139EFBC9AE590ABE69CAC3431E5808D352F362F31362F3137EFBC9AE590ABE69CAC3230E5808D372F382F31342F3135EFBC9AE590ABE69CAC3133E5808D392F31302F31322F3133EFBC9AE590ABE69CAC39E5808D3131EFBC9AE590ABE69CAC37E5808D317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E2062722FE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, 'Fei', 'feirecord', 'fei10', 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 0, 110, 0, 20, NULL, 16, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:28:48', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_job` VALUES (4, '澳洲幸运10定时获取开奖数据', 'SYSTEM', 'ryTask.getGameExpectData(\'azxy10\')', '0 0/1 * * * ?', '1', '0', '0', 'admin', '2024-03-18 18:39:03', 'admin', '2024-03-26 22:44:43', '');
INSERT INTO `sys_job` VALUES (5, '加拿大2.8定时开奖数据', 'SYSTEM', 'ryTask.getGameExpectData(\'jnd28\')', '0 0/1 * * * ?', '1', '0', '0', 'admin', '2024-03-18 18:51:09', 'admin', '2024-03-26 22:44:45', '');
INSERT INTO `sys_job` VALUES (6, '急速时时彩定时开奖数据', 'SYSTEM', 'ryTask.getGameExpectData(\'jsscmet\')', '0 0/1 * * * ?', '1', '0', '1', 'admin', '2024-03-18 18:39:03', 'admin', '2024-04-04 20:25:39', '');
INSERT INTO `sys_job` VALUES (7, '澳洲幸运10定时开奖结算', 'SYSTEM', 'ryTask.autoLotteryBalance(\'azxy10\')', '2 0/1 * * * ?', '1', '0', '1', 'admin', '2024-03-18 18:39:03', 'admin', '2024-04-04 20:06:02', '');
INSERT INTO `sys_job` VALUES (8, '加拿大2.8定时开奖结算', 'SYSTEM', 'ryTask.autoLotteryBalance(\'jnd28\')', '2 0/1 * * * ?', '1', '0', '1', 'admin', '2024-03-18 18:51:09', 'admin', '2024-04-04 20:06:00', '');
INSERT INTO `sys_job` VALUES (9, '急速时时彩定时开奖结算', 'SYSTEM', 'ryTask.autoLotteryBalance(\'jsscmet\')', '2 0/1 * * * ?', '1', '0', '1', 'admin', '2024-03-18 18:39:03', 'admin', '2024-03-19 21:28:02', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2309 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-11 18:56:42');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-15 22:35:30');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-16 20:01:56');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-16 23:25:11');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-17 11:00:57');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-17 16:40:02');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-18 18:20:07');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-19 21:04:23');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-20 22:15:19');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-23 19:34:40');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-24 21:14:21');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-25 19:52:23');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-25 20:17:25');
INSERT INTO `sys_logininfor` VALUES (124, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-25 20:17:30');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-25 20:21:05');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-26 22:44:32');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-26 22:45:26');
INSERT INTO `sys_logininfor` VALUES (128, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-26 22:45:34');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 20:49:15');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 20:52:14');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 22:58:47');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-28 20:35:07');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-01 21:10:03');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-01 21:18:35');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-04 19:30:47');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2024 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_menu` VALUES (2019, '投注机器人', 1, 10, 'falseUser', 'system/falseUser/index', NULL, 1, 0, 'C', '0', '0', 'system:falseUser:list', 'people', 'admin', '2024-03-17 18:39:55', 'admin', '2024-03-17 19:18:18', '投注机器人菜单');
INSERT INTO `sys_menu` VALUES (2020, '广告轮播图', 1, 11, 'replace', 'system/replace/index', NULL, 1, 0, 'C', '0', '0', 'system:replace:list', '#', 'admin', '2024-03-17 19:30:19', 'admin', '2024-03-17 19:32:50', '广告轮播图菜单');
INSERT INTO `sys_menu` VALUES (2021, '开奖统计', 0, 3, 'kj', NULL, NULL, 1, 0, 'M', '0', '0', '', 'excel', 'admin', '2024-04-04 20:12:34', 'admin', '2024-04-04 20:12:55', '');
INSERT INTO `sys_menu` VALUES (2022, '开奖结果', 2021, 1, 'betkj', 'system/betkj/index', NULL, 1, 0, 'C', '0', '0', 'system:betkj:list', '#', 'admin', '2024-04-04 20:11:33', '', NULL, '极速时时彩开奖菜单');
INSERT INTO `sys_menu` VALUES (2023, '开奖结果查询', 2022, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:betkj:query', '#', 'admin', '2024-04-04 20:11:33', '', NULL, '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 477 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

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
-- Table structure for sys_replace
-- ----------------------------
DROP TABLE IF EXISTS `sys_replace`;
CREATE TABLE `sys_replace`  (
  `replace_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告轮播图ID',
  `replace_pic` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告轮播图图片',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '广告轮播图状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`replace_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告轮播图' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_replace
-- ----------------------------
INSERT INTO `sys_replace` VALUES (1, '/profile/upload/2024/03/17/61c77275304d0_20240317193610A001.png', '0', '', '2024-03-17 19:36:12', '', NULL, '');
INSERT INTO `sys_replace` VALUES (2, '/profile/upload/2024/03/17/61c6efb753fa0_20240317193615A002.jpg', '0', '', '2024-03-17 19:36:16', '', NULL, '');
INSERT INTO `sys_replace` VALUES (3, '/profile/upload/2024/03/17/61c6efac98f1e_20240317193619A003.jpg', '0', '', '2024-03-17 19:36:21', '', NULL, '');

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
INSERT INTO `sys_role` VALUES (2, '平台管理员', 'sharkadmin', 2, '2', 1, 1, '0', '0', 'admin', '2024-03-05 21:03:11', 'admin', '2024-03-23 19:35:36', '平台管理员');

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
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);

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
  `amount` float(11, 2) NULL DEFAULT 0.00 COMMENT '余额',
  `score` float(11, 2) NULL DEFAULT 0.00 COMMENT '积分',
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
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-04-04 19:30:47', 411.73, 120.00, 'admin', '2024-03-05 21:03:10', '', '2024-04-04 19:30:47', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'sharkadmin', '平台管理员', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$6AO5Mx33xFDoAJ61aQC8F.Tpyc1W/1zCBh9EdE8RTXiFhlAsRdQmK', '0', '0', '127.0.0.1', '2024-03-26 22:45:35', 0.00, 0.00, 'admin', '2024-03-05 21:03:10', 'admin', '2024-03-26 22:45:34', '测试员');

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

-- ----------------------------
-- Table structure for usermoney
-- ----------------------------
DROP TABLE IF EXISTS `usermoney`;
CREATE TABLE `usermoney`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户资金流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `cash_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '资金流水内容',
  `cash_time` datetime NOT NULL COMMENT '资金流水时间',
  `cash_money` float(11, 2) NOT NULL COMMENT '流水金额',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '1、申请充值、2、充值成功3、充值失败4、申请提现5、提现成功6、提现失败7、购买彩票8、彩票中奖9、彩票撤单 10、下线创收 11、提取返利 12、代理佣金13、代理金额由于下线开奖变动14、代理金额转入15、代理金额转出16.牛牛押金返还',
  `user_balance` float(11, 2) NOT NULL COMMENT '账户剩余金额',
  `union_pay_id` int(11) NULL DEFAULT NULL COMMENT '提现账户ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_pay` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `user_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账户名',
  `cash_describe` longblob NULL COMMENT '管理员上下分备注信息',
  `game_id` bigint(20) NOT NULL COMMENT '游戏ID',
  `game_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏名',
  `house` int(4) NOT NULL DEFAULT 0 COMMENT '房间号',
  `is_delete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否删除(0否 1是)',
  `hz_id` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否合庄模式',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `user_id`(`user_id`, `type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户资金流水表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usermoney
-- ----------------------------
INSERT INTO `usermoney` VALUES (1, 1, '【澳洲幸运10】中奖-21101494', '2024-04-01 00:00:00', 21.00, '8', 470.73, NULL, NULL, NULL, NULL, NULL, 9, '澳洲幸运10', 0, '0', '0', '', '2024-04-01 22:05:30', '', NULL, '');
INSERT INTO `usermoney` VALUES (2, 1, '【澳洲幸运10】中奖-21101498', '2024-04-01 00:00:00', 21.00, '8', 451.73, NULL, NULL, NULL, NULL, NULL, 9, '澳洲幸运10', 0, '0', '0', '', '2024-04-01 22:25:02', '', NULL, '');

-- ----------------------------
-- Table structure for userwin
-- ----------------------------
DROP TABLE IF EXISTS `userwin`;
CREATE TABLE `userwin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户盈亏ID',
  `win_time` datetime NOT NULL COMMENT '盈亏时间(YMD)',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `game_id` bigint(20) NOT NULL COMMENT '游戏ID',
  `game_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏名',
  `win_money` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '今日盈亏金额',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `win_time`) USING BTREE,
  INDEX `win_time`(`win_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户盈亏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userwin
-- ----------------------------
INSERT INTO `userwin` VALUES (1, '2024-04-01 00:00:00', 1, 9, '澳洲幸运10', -238.00, 'lotteryAzxy10', '2024-04-01 21:30:02', '', '2024-04-01 22:35:02', '');

-- ----------------------------
-- Table structure for wave
-- ----------------------------
DROP TABLE IF EXISTS `wave`;
CREATE TABLE `wave`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '数字红绿蓝属性ID',
  `game_id` int(11) NOT NULL COMMENT '游戏ID',
  `num0` int(2) NOT NULL DEFAULT 0 COMMENT '数字0红绿蓝属性(1：绿 2：红 3：蓝)',
  `num1` int(2) NOT NULL DEFAULT 0 COMMENT '数字1红绿蓝属性(1：绿 2：红 3：蓝)',
  `num2` int(2) NOT NULL DEFAULT 0 COMMENT '数字2红绿蓝属性(1：绿 2：红 3：蓝)',
  `num3` int(2) NOT NULL DEFAULT 0 COMMENT '数字3红绿蓝属性(1：绿 2：红 3：蓝)',
  `num4` int(2) NOT NULL DEFAULT 0 COMMENT '数字4红绿蓝属性(1：绿 2：红 3：蓝)',
  `num5` int(2) NOT NULL DEFAULT 0 COMMENT '数字5红绿蓝属性(1：绿 2：红 3：蓝)',
  `num6` int(2) NOT NULL DEFAULT 0 COMMENT '数字6红绿蓝属性(1：绿 2：红 3：蓝)',
  `num7` int(2) NOT NULL DEFAULT 0 COMMENT '数字7红绿蓝属性(1：绿 2：红 3：蓝)',
  `num8` int(2) NOT NULL DEFAULT 0 COMMENT '数字8红绿蓝属性(1：绿 2：红 3：蓝)',
  `num9` int(2) NOT NULL DEFAULT 0 COMMENT '数字9红绿蓝属性(1：绿 2：红 3：蓝)',
  `num10` int(2) NOT NULL DEFAULT 0 COMMENT '数字10红绿蓝属性(1：绿 2：红 3：蓝)',
  `num11` int(2) NOT NULL DEFAULT 0 COMMENT '数字11红绿蓝属性(1：绿 2：红 3：蓝)',
  `num12` int(2) NOT NULL DEFAULT 0 COMMENT '数字12红绿蓝属性(1：绿 2：红 3：蓝)',
  `num13` int(2) NOT NULL DEFAULT 0 COMMENT '数字13红绿蓝属性(1：绿 2：红 3：蓝)',
  `num14` int(2) NOT NULL DEFAULT 0 COMMENT '数字14红绿蓝属性(1：绿 2：红 3：蓝)',
  `num15` int(2) NOT NULL DEFAULT 0 COMMENT '数字15红绿蓝属性(1：绿 2：红 3：蓝)',
  `num16` int(2) NOT NULL DEFAULT 0 COMMENT '数字16红绿蓝属性(1：绿 2：红 3：蓝)',
  `num17` int(2) NOT NULL DEFAULT 0 COMMENT '数字17红绿蓝属性(1：绿 2：红 3：蓝)',
  `num18` int(2) NOT NULL DEFAULT 0 COMMENT '数字18红绿蓝属性(1：绿 2：红 3：蓝)',
  `num19` int(2) NOT NULL DEFAULT 0 COMMENT '数字19红绿蓝属性(1：绿 2：红 3：蓝)',
  `num20` int(2) NOT NULL DEFAULT 0 COMMENT '数字20红绿蓝属性(1：绿 2：红 3：蓝)',
  `num21` int(2) NOT NULL DEFAULT 0 COMMENT '数字21红绿蓝属性(1：绿 2：红 3：蓝)',
  `num22` int(2) NOT NULL DEFAULT 0 COMMENT '数字22红绿蓝属性(1：绿 2：红 3：蓝)',
  `num23` int(2) NOT NULL DEFAULT 0 COMMENT '数字23红绿蓝属性(1：绿 2：红 3：蓝)',
  `num24` int(2) NOT NULL DEFAULT 0 COMMENT '数字24红绿蓝属性(1：绿 2：红 3：蓝)',
  `num25` int(2) NOT NULL DEFAULT 0 COMMENT '数字25红绿蓝属性(1：绿 2：红 3：蓝)',
  `num26` int(2) NOT NULL DEFAULT 0 COMMENT '数字26红绿蓝属性(1：绿 2：红 3：蓝)',
  `num27` int(2) NOT NULL DEFAULT 0 COMMENT '数字27红绿蓝属性(1：绿 2：红 3：蓝)',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '备注',
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数字红绿蓝属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wave
-- ----------------------------
INSERT INTO `wave` VALUES (1, 2, 0, 1, 3, 2, 1, 3, 2, 1, 3, 2, 1, 3, 2, 0, 0, 2, 1, 3, 2, 1, 3, 2, 1, 3, 2, 1, 3, 2, 'SYSTEM', '2024-03-27 20:59:53', '', NULL, '');

SET FOREIGN_KEY_CHECKS = 1;
