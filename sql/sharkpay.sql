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

 Date: 17/03/2024 21:00:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 21096588 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '澳洲幸运10开奖历史表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of azxy10
-- ----------------------------

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
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否已经开奖（0已经开奖 1未开奖）',
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
) ENGINE = InnoDB AUTO_INCREMENT = 21096590 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '澳洲幸运10开奖表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of azxy10kj
-- ----------------------------

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
  `count_money` int(11) NULL DEFAULT 0 COMMENT '下注金额',
  `win_money` float(13, 2) NULL DEFAULT 0.00 COMMENT '中奖金额',
  `type1_big` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和大的金额',
  `type1_small` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和小的金额',
  `type1_single` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和单的金额',
  `type1_double` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和双的金额',
  `type1_num3` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和3的金额',
  `type1_num4` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和4的金额',
  `type1_num5` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和5的金额',
  `type1_num6` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和6的金额',
  `type1_num7` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和7的金额',
  `type1_num8` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和8的金额',
  `type1_num9` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和9的金额',
  `type1_num10` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和10的金额',
  `type1_num11` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和11的金额',
  `type1_num12` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和12的金额',
  `type1_num13` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和13的金额',
  `type1_num14` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和14的金额',
  `type1_num15` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和15的金额',
  `type1_num16` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和16的金额',
  `type1_num17` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和17的金额',
  `type1_num18` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和18的金额',
  `type1_num19` int(11) NULL DEFAULT 0 COMMENT '下注冠亚和19的金额',
  `type2_big` int(11) NULL DEFAULT 0 COMMENT '下注冠军大的金额',
  `type2_small` int(11) NULL DEFAULT 0 COMMENT '下注冠军小的金额',
  `type2_single` int(11) NULL DEFAULT 0 COMMENT '下注冠军单的金额',
  `type2_double` int(11) NULL DEFAULT 0 COMMENT '下注冠军双的金额',
  `type2_loong` int(11) NULL DEFAULT 0 COMMENT '下注冠军龙的金额',
  `type2_tiger` int(11) NULL DEFAULT 0 COMMENT '下注冠军虎的金额',
  `type2_num1` int(11) NULL DEFAULT 0 COMMENT '下注冠军1的金额',
  `type2_num2` int(11) NULL DEFAULT 0 COMMENT '下注冠军2的金额',
  `type2_num3` int(11) NULL DEFAULT 0 COMMENT '下注冠军3的金额',
  `type2_num4` int(11) NULL DEFAULT 0 COMMENT '下注冠军4的金额',
  `type2_num5` int(11) NULL DEFAULT 0 COMMENT '下注冠军5的金额',
  `type2_num6` int(11) NULL DEFAULT 0 COMMENT '下注冠军6的金额',
  `type2_num7` int(11) NULL DEFAULT 0 COMMENT '下注冠军7的金额',
  `type2_num8` int(11) NULL DEFAULT 0 COMMENT '下注冠军8的金额',
  `type2_num9` int(11) NULL DEFAULT 0 COMMENT '下注冠军9的金额',
  `type2_num10` int(11) NULL DEFAULT 0 COMMENT '下注冠军10的金额',
  `type3_big` int(11) NULL DEFAULT 0 COMMENT '下注亚军大的金额',
  `type3_small` int(11) NULL DEFAULT 0 COMMENT '下注亚军小的金额',
  `type3_single` int(11) NULL DEFAULT 0 COMMENT '下注亚军单的金额',
  `type3_double` int(11) NULL DEFAULT 0 COMMENT '下注亚军双的金额',
  `type3_loong` int(11) NULL DEFAULT 0 COMMENT '下注亚军龙的金额',
  `type3_tiger` int(11) NULL DEFAULT 0 COMMENT '下注亚军虎的金额',
  `type3_num1` int(11) NULL DEFAULT 0 COMMENT '下注亚军1的金额',
  `type3_num2` int(11) NULL DEFAULT 0 COMMENT '下注亚军2的金额',
  `type3_num3` int(11) NULL DEFAULT 0 COMMENT '下注亚军3的金额',
  `type3_num4` int(11) NULL DEFAULT 0 COMMENT '下注亚军4的金额',
  `type3_num5` int(11) NULL DEFAULT 0 COMMENT '下注亚军5的金额',
  `type3_num6` int(11) NULL DEFAULT 0 COMMENT '下注亚军6的金额',
  `type3_num7` int(11) NULL DEFAULT 0 COMMENT '下注亚军7的金额',
  `type3_num8` int(11) NULL DEFAULT 0 COMMENT '下注亚军8的金额',
  `type3_num9` int(11) NULL DEFAULT 0 COMMENT '下注亚军9的金额',
  `type3_num10` int(11) NULL DEFAULT 0 COMMENT '下注亚军10的金额',
  `type4_big` int(11) NULL DEFAULT 0 COMMENT '下注第三名大的金额',
  `type4_small` int(11) NULL DEFAULT 0 COMMENT '下注第三名小的金额',
  `type4_single` int(11) NULL DEFAULT 0 COMMENT '下注第三名单的金额',
  `type4_double` int(11) NULL DEFAULT 0 COMMENT '下注第三名双的金额',
  `type4_loong` int(11) NULL DEFAULT 0 COMMENT '下注第三名龙的金额',
  `type4_tiger` int(11) NULL DEFAULT 0 COMMENT '下注第三名虎的金额',
  `type4_num1` int(11) NULL DEFAULT 0 COMMENT '下注第三名1的金额',
  `type4_num2` int(11) NULL DEFAULT 0 COMMENT '下注第三名2的金额',
  `type4_num3` int(11) NULL DEFAULT 0 COMMENT '下注第三名3的金额',
  `type4_num4` int(11) NULL DEFAULT 0 COMMENT '下注第三名4的金额',
  `type4_num5` int(11) NULL DEFAULT 0 COMMENT '下注第三名5的金额',
  `type4_num6` int(11) NULL DEFAULT 0 COMMENT '下注第三名6的金额',
  `type4_num7` int(11) NULL DEFAULT 0 COMMENT '下注第三名7的金额',
  `type4_num8` int(11) NULL DEFAULT 0 COMMENT '下注第三名8的金额',
  `type4_num9` int(11) NULL DEFAULT 0 COMMENT '下注第三名9的金额',
  `type4_num10` int(11) NULL DEFAULT 0 COMMENT '下注第三名10的金额',
  `type5_big` int(11) NULL DEFAULT 0 COMMENT '下注第四名大的金额',
  `type5_small` int(11) NULL DEFAULT 0 COMMENT '下注第四名小的金额',
  `type5_single` int(11) NULL DEFAULT 0 COMMENT '下注第四名单的金额',
  `type5_double` int(11) NULL DEFAULT 0 COMMENT '下注第四名双的金额',
  `type5_loong` int(11) NULL DEFAULT 0 COMMENT '下注第四名龙的金额',
  `type5_tiger` int(11) NULL DEFAULT 0 COMMENT '下注第四名虎的金额',
  `type5_num1` int(11) NULL DEFAULT 0 COMMENT '下注第四名1的金额',
  `type5_num2` int(11) NULL DEFAULT 0 COMMENT '下注第四名2的金额',
  `type5_num3` int(11) NULL DEFAULT 0 COMMENT '下注第四名3的金额',
  `type5_num4` int(11) NULL DEFAULT 0 COMMENT '下注第四名4的金额',
  `type5_num5` int(11) NULL DEFAULT 0 COMMENT '下注第四名5的金额',
  `type5_num6` int(11) NULL DEFAULT 0 COMMENT '下注第四名6的金额',
  `type5_num7` int(11) NULL DEFAULT 0 COMMENT '下注第四名7的金额',
  `type5_num8` int(11) NULL DEFAULT 0 COMMENT '下注第四名8的金额',
  `type5_num9` int(11) NULL DEFAULT 0 COMMENT '下注第四名9的金额',
  `type5_num10` int(11) NULL DEFAULT 0 COMMENT '下注第四名10的金额',
  `type6_big` int(11) NULL DEFAULT 0 COMMENT '下注第五名大的金额',
  `type6_small` int(11) NULL DEFAULT 0 COMMENT '下注第五名小的金额',
  `type6_single` int(11) NULL DEFAULT 0 COMMENT '下注第五名单的金额',
  `type6_double` int(11) NULL DEFAULT 0 COMMENT '下注第五名双的金额',
  `type6_loong` int(11) NULL DEFAULT 0 COMMENT '下注第五名龙的金额',
  `type6_tiger` int(11) NULL DEFAULT 0 COMMENT '下注第五名虎的金额',
  `type6_num1` int(11) NULL DEFAULT 0 COMMENT '下注第五名1的金额',
  `type6_num2` int(11) NULL DEFAULT 0 COMMENT '下注第五名2的金额',
  `type6_num3` int(11) NULL DEFAULT 0 COMMENT '下注第五名3的金额',
  `type6_num4` int(11) NULL DEFAULT 0 COMMENT '下注第五名4的金额',
  `type6_num5` int(11) NULL DEFAULT 0 COMMENT '下注第五名5的金额',
  `type6_num6` int(11) NULL DEFAULT 0 COMMENT '下注第五名6的金额',
  `type6_num7` int(11) NULL DEFAULT 0 COMMENT '下注第五名7的金额',
  `type6_num8` int(11) NULL DEFAULT 0 COMMENT '下注第五名8的金额',
  `type6_num9` int(11) NULL DEFAULT 0 COMMENT '下注第五名9的金额',
  `type6_num10` int(11) NULL DEFAULT 0 COMMENT '下注第五名10的金额',
  `type7_big` int(11) NULL DEFAULT 0 COMMENT '下注第六名大的金额',
  `type7_small` int(11) NULL DEFAULT 0 COMMENT '下注第六名小的金额',
  `type7_single` int(11) NULL DEFAULT 0 COMMENT '下注第六名单的金额',
  `type7_double` int(11) NULL DEFAULT 0 COMMENT '下注第六名双的金额',
  `type7_loong` int(11) NULL DEFAULT 0 COMMENT '下注第六名龙的金额',
  `type7_tiger` int(11) NULL DEFAULT 0 COMMENT '下注第六名虎的金额',
  `type7_num1` int(11) NULL DEFAULT 0 COMMENT '下注第六名1的金额',
  `type7_num2` int(11) NULL DEFAULT 0 COMMENT '下注第六名2的金额',
  `type7_num3` int(11) NULL DEFAULT 0 COMMENT '下注第六名3的金额',
  `type7_num4` int(11) NULL DEFAULT 0 COMMENT '下注第六名4的金额',
  `type7_num5` int(11) NULL DEFAULT 0 COMMENT '下注第六名5的金额',
  `type7_num6` int(11) NULL DEFAULT 0 COMMENT '下注第六名6的金额',
  `type7_num7` int(11) NULL DEFAULT 0 COMMENT '下注第六名7的金额',
  `type7_num8` int(11) NULL DEFAULT 0 COMMENT '下注第六名8的金额',
  `type7_num9` int(11) NULL DEFAULT 0 COMMENT '下注第六名9的金额',
  `type7_num10` int(11) NULL DEFAULT 0 COMMENT '下注第六名10的金额',
  `type8_big` int(11) NULL DEFAULT 0 COMMENT '下注第七名大的金额',
  `type8_small` int(11) NULL DEFAULT 0 COMMENT '下注第七名小的金额',
  `type8_single` int(11) NULL DEFAULT 0 COMMENT '下注第七名单的金额',
  `type8_double` int(11) NULL DEFAULT 0 COMMENT '下注第七名双的金额',
  `type8_loong` int(11) NULL DEFAULT 0 COMMENT '下注第七名龙的金额',
  `type8_tiger` int(11) NULL DEFAULT 0 COMMENT '下注第七名虎的金额',
  `type8_num1` int(11) NULL DEFAULT 0 COMMENT '下注第七名1的金额',
  `type8_num2` int(11) NULL DEFAULT 0 COMMENT '下注第七名2的金额',
  `type8_num3` int(11) NULL DEFAULT 0 COMMENT '下注第七名3的金额',
  `type8_num4` int(11) NULL DEFAULT 0 COMMENT '下注第七名4的金额',
  `type8_num5` int(11) NULL DEFAULT 0 COMMENT '下注第七名5的金额',
  `type8_num6` int(11) NULL DEFAULT 0 COMMENT '下注第七名6的金额',
  `type8_num7` int(11) NULL DEFAULT 0 COMMENT '下注第七名7的金额',
  `type8_num8` int(11) NULL DEFAULT 0 COMMENT '下注第七名8的金额',
  `type8_num9` int(11) NULL DEFAULT 0 COMMENT '下注第七名9的金额',
  `type8_num10` int(11) NULL DEFAULT 0 COMMENT '下注第七名10的金额',
  `type9_big` int(11) NULL DEFAULT 0 COMMENT '下注第八名大的金额',
  `type9_small` int(11) NULL DEFAULT 0 COMMENT '下注第八名小的金额',
  `type9_single` int(11) NULL DEFAULT 0 COMMENT '下注第八名单的金额',
  `type9_double` int(11) NULL DEFAULT 0 COMMENT '下注第八名双的金额',
  `type9_loong` int(11) NULL DEFAULT 0 COMMENT '下注第八名龙的金额',
  `type9_tiger` int(11) NULL DEFAULT 0 COMMENT '下注第八名虎的金额',
  `type9_num1` int(11) NULL DEFAULT 0 COMMENT '下注第八名1的金额',
  `type9_num2` int(11) NULL DEFAULT 0 COMMENT '下注第八名2的金额',
  `type9_num3` int(11) NULL DEFAULT 0 COMMENT '下注第八名3的金额',
  `type9_num4` int(11) NULL DEFAULT 0 COMMENT '下注第八名4的金额',
  `type9_num5` int(11) NULL DEFAULT 0 COMMENT '下注第八名5的金额',
  `type9_num6` int(11) NULL DEFAULT 0 COMMENT '下注第八名6的金额',
  `type9_num7` int(11) NULL DEFAULT 0 COMMENT '下注第八名7的金额',
  `type9_num8` int(11) NULL DEFAULT 0 COMMENT '下注第八名8的金额',
  `type9_num9` int(11) NULL DEFAULT 0 COMMENT '下注第八名9的金额',
  `type9_num10` int(11) NULL DEFAULT 0 COMMENT '下注第八名10的金额',
  `type10_big` int(11) NULL DEFAULT 0 COMMENT '下注第九名大的金额',
  `type10_small` int(11) NULL DEFAULT 0 COMMENT '下注第九名小的金额',
  `type10_single` int(11) NULL DEFAULT 0 COMMENT '下注第九名单的金额',
  `type10_double` int(11) NULL DEFAULT 0 COMMENT '下注第九名双的金额',
  `type10_loong` int(11) NULL DEFAULT 0 COMMENT '下注第九名龙的金额',
  `type10_tiger` int(11) NULL DEFAULT 0 COMMENT '下注第九名虎的金额',
  `type10_num1` int(11) NULL DEFAULT 0 COMMENT '下注第九名1的金额',
  `type10_num2` int(11) NULL DEFAULT 0 COMMENT '下注第九名2的金额',
  `type10_num3` int(11) NULL DEFAULT 0 COMMENT '下注第九名3的金额',
  `type10_num4` int(11) NULL DEFAULT 0 COMMENT '下注第九名4的金额',
  `type10_num5` int(11) NULL DEFAULT 0 COMMENT '下注第九名5的金额',
  `type10_num6` int(11) NULL DEFAULT 0 COMMENT '下注第九名6的金额',
  `type10_num7` int(11) NULL DEFAULT 0 COMMENT '下注第九名7的金额',
  `type10_num8` int(11) NULL DEFAULT 0 COMMENT '下注第九名8的金额',
  `type10_num9` int(11) NULL DEFAULT 0 COMMENT '下注第九名9的金额',
  `type10_num10` int(11) NULL DEFAULT 0 COMMENT '下注第九名10的金额',
  `type11_big` int(11) NULL DEFAULT 0 COMMENT '下注第十名大的金额',
  `type11_small` int(11) NULL DEFAULT 0 COMMENT '下注第十名小的金额',
  `type11_single` int(11) NULL DEFAULT 0 COMMENT '下注第十名单的金额',
  `type11_double` int(11) NULL DEFAULT 0 COMMENT '下注第十名双的金额',
  `type11_loong` int(11) NULL DEFAULT 0 COMMENT '下注第十名龙的金额',
  `type11_tiger` int(11) NULL DEFAULT 0 COMMENT '下注第十名虎的金额',
  `type11_num1` int(11) NULL DEFAULT 0 COMMENT '下注第十名1的金额',
  `type11_num2` int(11) NULL DEFAULT 0 COMMENT '下注第十名2的金额',
  `type11_num3` int(11) NULL DEFAULT 0 COMMENT '下注第十名3的金额',
  `type11_num4` int(11) NULL DEFAULT 0 COMMENT '下注第十名4的金额',
  `type11_num5` int(11) NULL DEFAULT 0 COMMENT '下注第十名5的金额',
  `type11_num6` int(11) NULL DEFAULT 0 COMMENT '下注第十名6的金额',
  `type11_num7` int(11) NULL DEFAULT 0 COMMENT '下注第十名7的金额',
  `type11_num8` int(11) NULL DEFAULT 0 COMMENT '下注第十名8的金额',
  `type11_num9` int(11) NULL DEFAULT 0 COMMENT '下注第十名9的金额',
  `type11_num10` int(11) NULL DEFAULT 0 COMMENT '下注第十名10的金额',
  `big_single` int(11) NULL DEFAULT 0 COMMENT '下注大单的金额',
  `big_double` int(11) NULL DEFAULT 0 COMMENT '下注大双的金额',
  `small_single` int(11) NULL DEFAULT 0 COMMENT '下注小单的金额',
  `small_double` int(11) NULL DEFAULT 0 COMMENT '下注小双的金额',
  `house` int(4) NOT NULL DEFAULT 0,
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
  `sum_num` int(11) NULL DEFAULT NULL COMMENT '开奖合算数字',
  `hz_id` int(10) NOT NULL DEFAULT 0 COMMENT '是否合庄模式',
  `hz_user` int(255) NULL DEFAULT NULL COMMENT '是否用户',
  `is_deduct` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否扣除',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `user_id_2`(`user_id`, `periods`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '澳洲幸运10下注表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of azxy10record
-- ----------------------------

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
  `money` int(10) UNSIGNED NOT NULL COMMENT '投注金额',
  `balance` double(10, 2) NOT NULL DEFAULT 0.00 COMMENT '投注后用户余额',
  `account_result` double(10, 2) NOT NULL DEFAULT 0.00 COMMENT '输赢结果',
  `settle_flg` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '结算区分（0未结算 1已结算）',
  `game_result` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '开奖结果',
  `is_delete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投注单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bet_record
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (2, 'sys_bet_item', '游戏投注项表', NULL, NULL, 'SysBetItem', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'betItem', '游戏投注项', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-06 21:19:29', '', '2024-03-06 21:38:45', NULL);
INSERT INTO `gen_table` VALUES (5, 'sys_game', '游戏表', NULL, NULL, 'SysGame', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'game', '游戏', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-06 22:13:29', '', '2024-03-06 22:17:26', NULL);
INSERT INTO `gen_table` VALUES (6, 'sys_bet_type', '游戏玩法表', NULL, NULL, 'SysBetType', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'betType', '游戏玩法', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-10 21:13:57', '', '2024-03-10 21:14:44', NULL);
INSERT INTO `gen_table` VALUES (7, 'azxy10', '澳洲幸运10开奖历史表', NULL, NULL, 'Azxy10', 'crud', '', 'com.ruoyi.system', 'system', 'azxy10', '澳洲幸运10开奖历史', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-17 16:40:34', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (8, 'azxy10kj', '澳洲幸运10开奖表', NULL, NULL, 'Azxy10kj', 'crud', '', 'com.ruoyi.system', 'system', 'azxy10kj', '澳洲幸运10开奖', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-17 16:40:34', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (9, 'azxy10record', '澳洲幸运10下注表', NULL, NULL, 'Azxy10record', 'crud', '', 'com.ruoyi.system', 'system', 'azxy10record', '澳洲幸运10下注', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-17 16:40:34', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (11, 'jnd', '加拿大开奖历史表', NULL, NULL, 'Jnd', 'crud', '', 'com.ruoyi.system', 'system', 'jnd', '加拿大开奖历史', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-17 16:40:35', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (12, 'jnd28', '加拿大开奖表', NULL, NULL, 'Jnd28', 'crud', '', 'com.ruoyi.system', 'system', 'jnd28', '加拿大开奖', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-17 16:40:35', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (14, 'jsssc', '极速时时彩开奖历史表', NULL, NULL, 'Jsssc', 'crud', '', 'com.ruoyi.system', 'system', 'jsssc', '极速时时彩开奖历史', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-17 16:40:35', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (15, 'jsssckj', '极速时时彩开奖表', NULL, NULL, 'Jsssckj', 'crud', '', 'com.ruoyi.system', 'system', 'jsssckj', '极速时时彩开奖', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-17 16:40:35', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (16, 'jssscrecord', '极速时时彩下注表', NULL, NULL, 'Jssscrecord', 'crud', '', 'com.ruoyi.system', 'system', 'jssscrecord', '极速时时彩下注', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-17 16:40:35', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (17, 'bet_record', '投注单', NULL, NULL, 'BetRecord', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'betRecord', '投注单', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-17 17:16:48', '', '2024-03-17 17:17:13', NULL);
INSERT INTO `gen_table` VALUES (18, 'false_user', '投注机器人', NULL, NULL, 'FalseUser', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'falseUser', '投注机器人', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-17 17:16:48', '', '2024-03-17 18:35:45', NULL);
INSERT INTO `gen_table` VALUES (19, 'jndrecord', '加拿大下注表', NULL, NULL, 'Jndrecord', 'crud', '', 'com.ruoyi.system', 'system', 'jndrecord', '加拿大下注', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-17 18:44:12', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (21, 'sys_replace', '广告轮播图', NULL, NULL, 'SysReplace', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'replace', '广告轮播图', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 808 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `gen_table_column` VALUES (140, 8, 'id', '期数', 'bigint(20) unsigned', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (141, 8, 'num1', '开奖号码1', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (142, 8, 'num2', '开奖号码2', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (143, 8, 'num3', '开奖号码3', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (144, 8, 'num4', '开奖号码4', 'int(11)', 'Long', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (145, 8, 'num5', '开奖号码5', 'int(11)', 'Long', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (146, 8, 'num6', '开奖号码6', 'int(11)', 'Long', 'num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (147, 8, 'num7', '开奖号码7', 'int(11)', 'Long', 'num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (148, 8, 'num8', '开奖号码8', 'int(11)', 'Long', 'num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (149, 8, 'num9', '开奖号码9', 'int(11)', 'Long', 'num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (150, 8, 'num10', '开奖号码10', 'int(11)', 'Long', 'num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (151, 8, 'bet_time', '封盘投注截止时间', 'datetime', 'Date', 'betTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 12, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (152, 8, 'pre_time', '预计开奖时间', 'datetime', 'Date', 'preTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 13, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (153, 8, 'status', '是否已经开奖（0已经开奖 1未开奖）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 14, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (154, 8, 'the_time', '开奖时间', 'datetime', 'Date', 'theTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 15, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (155, 8, 'count_money', '总下注金额', 'int(11)', 'Long', 'countMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (156, 8, 'win_money', '总中奖金额', 'int(11)', 'Long', 'winMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (157, 8, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (158, 8, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 19, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (159, 8, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 20, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (160, 8, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 21, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (161, 8, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 22, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (162, 9, 'id', '下注表ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (163, 9, 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (164, 9, 'periods', '期数', 'bigint(20)', 'Long', 'periods', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (165, 9, 'status', '投注状态（0投注 1撤单）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (166, 9, 'record_time', '投注时间', 'datetime', 'Date', 'recordTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (167, 9, 'check_time', NULL, 'timestamp', 'Date', 'checkTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (168, 9, 'count_money', '下注金额', 'int(11)', 'Long', 'countMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (169, 9, 'win_money', '中奖金额', 'float(13,2)', 'BigDecimal', 'winMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (170, 9, 'type1_big', '下注冠亚和大的金额', 'int(11)', 'Long', 'type1Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (171, 9, 'type1_small', '下注冠亚和小的金额', 'int(11)', 'Long', 'type1Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (172, 9, 'type1_single', '下注冠亚和单的金额', 'int(11)', 'Long', 'type1Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (173, 9, 'type1_double', '下注冠亚和双的金额', 'int(11)', 'Long', 'type1Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (174, 9, 'type1_num3', '下注冠亚和3的金额', 'int(11)', 'Long', 'type1Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (175, 9, 'type1_num4', '下注冠亚和4的金额', 'int(11)', 'Long', 'type1Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (176, 9, 'type1_num5', '下注冠亚和5的金额', 'int(11)', 'Long', 'type1Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (177, 9, 'type1_num6', '下注冠亚和6的金额', 'int(11)', 'Long', 'type1Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (178, 9, 'type1_num7', '下注冠亚和7的金额', 'int(11)', 'Long', 'type1Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (179, 9, 'type1_num8', '下注冠亚和8的金额', 'int(11)', 'Long', 'type1Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (180, 9, 'type1_num9', '下注冠亚和9的金额', 'int(11)', 'Long', 'type1Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (181, 9, 'type1_num10', '下注冠亚和10的金额', 'int(11)', 'Long', 'type1Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (182, 9, 'type1_num11', '下注冠亚和11的金额', 'int(11)', 'Long', 'type1Num11', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (183, 9, 'type1_num12', '下注冠亚和12的金额', 'int(11)', 'Long', 'type1Num12', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (184, 9, 'type1_num13', '下注冠亚和13的金额', 'int(11)', 'Long', 'type1Num13', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (185, 9, 'type1_num14', '下注冠亚和14的金额', 'int(11)', 'Long', 'type1Num14', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (186, 9, 'type1_num15', '下注冠亚和15的金额', 'int(11)', 'Long', 'type1Num15', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (187, 9, 'type1_num16', '下注冠亚和16的金额', 'int(11)', 'Long', 'type1Num16', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (188, 9, 'type1_num17', '下注冠亚和17的金额', 'int(11)', 'Long', 'type1Num17', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (189, 9, 'type1_num18', '下注冠亚和18的金额', 'int(11)', 'Long', 'type1Num18', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (190, 9, 'type1_num19', '下注冠亚和19的金额', 'int(11)', 'Long', 'type1Num19', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (191, 9, 'type2_big', '下注冠军大的金额', 'int(11)', 'Long', 'type2Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 30, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (192, 9, 'type2_small', '下注冠军小的金额', 'int(11)', 'Long', 'type2Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 31, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (193, 9, 'type2_single', '下注冠军单的金额', 'int(11)', 'Long', 'type2Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 32, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (194, 9, 'type2_double', '下注冠军双的金额', 'int(11)', 'Long', 'type2Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 33, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (195, 9, 'type2_loong', '下注冠军龙的金额', 'int(11)', 'Long', 'type2Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 34, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (196, 9, 'type2_tiger', '下注冠军虎的金额', 'int(11)', 'Long', 'type2Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 35, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (197, 9, 'type2_num1', '下注冠军1的金额', 'int(11)', 'Long', 'type2Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 36, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (198, 9, 'type2_num2', '下注冠军2的金额', 'int(11)', 'Long', 'type2Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 37, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (199, 9, 'type2_num3', '下注冠军3的金额', 'int(11)', 'Long', 'type2Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 38, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (200, 9, 'type2_num4', '下注冠军4的金额', 'int(11)', 'Long', 'type2Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 39, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (201, 9, 'type2_num5', '下注冠军5的金额', 'int(11)', 'Long', 'type2Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 40, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (202, 9, 'type2_num6', '下注冠军6的金额', 'int(11)', 'Long', 'type2Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 41, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (203, 9, 'type2_num7', '下注冠军7的金额', 'int(11)', 'Long', 'type2Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 42, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (204, 9, 'type2_num8', '下注冠军8的金额', 'int(11)', 'Long', 'type2Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 43, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (205, 9, 'type2_num9', '下注冠军9的金额', 'int(11)', 'Long', 'type2Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 44, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (206, 9, 'type2_num10', '下注冠军10的金额', 'int(11)', 'Long', 'type2Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 45, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (207, 9, 'type3_big', '下注亚军大的金额', 'int(11)', 'Long', 'type3Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 46, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (208, 9, 'type3_small', '下注亚军小的金额', 'int(11)', 'Long', 'type3Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 47, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (209, 9, 'type3_single', '下注亚军单的金额', 'int(11)', 'Long', 'type3Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 48, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (210, 9, 'type3_double', '下注亚军双的金额', 'int(11)', 'Long', 'type3Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 49, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (211, 9, 'type3_loong', '下注亚军龙的金额', 'int(11)', 'Long', 'type3Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 50, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (212, 9, 'type3_tiger', '下注亚军虎的金额', 'int(11)', 'Long', 'type3Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 51, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (213, 9, 'type3_num1', '下注亚军1的金额', 'int(11)', 'Long', 'type3Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 52, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (214, 9, 'type3_num2', '下注亚军2的金额', 'int(11)', 'Long', 'type3Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 53, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (215, 9, 'type3_num3', '下注亚军3的金额', 'int(11)', 'Long', 'type3Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 54, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (216, 9, 'type3_num4', '下注亚军4的金额', 'int(11)', 'Long', 'type3Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 55, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (217, 9, 'type3_num5', '下注亚军5的金额', 'int(11)', 'Long', 'type3Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 56, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (218, 9, 'type3_num6', '下注亚军6的金额', 'int(11)', 'Long', 'type3Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 57, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (219, 9, 'type3_num7', '下注亚军7的金额', 'int(11)', 'Long', 'type3Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 58, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (220, 9, 'type3_num8', '下注亚军8的金额', 'int(11)', 'Long', 'type3Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 59, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (221, 9, 'type3_num9', '下注亚军9的金额', 'int(11)', 'Long', 'type3Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 60, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (222, 9, 'type3_num10', '下注亚军10的金额', 'int(11)', 'Long', 'type3Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 61, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (223, 9, 'type4_big', '下注第三名大的金额', 'int(11)', 'Long', 'type4Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 62, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (224, 9, 'type4_small', '下注第三名小的金额', 'int(11)', 'Long', 'type4Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 63, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (225, 9, 'type4_single', '下注第三名单的金额', 'int(11)', 'Long', 'type4Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 64, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (226, 9, 'type4_double', '下注第三名双的金额', 'int(11)', 'Long', 'type4Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 65, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (227, 9, 'type4_loong', '下注第三名龙的金额', 'int(11)', 'Long', 'type4Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 66, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (228, 9, 'type4_tiger', '下注第三名虎的金额', 'int(11)', 'Long', 'type4Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 67, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (229, 9, 'type4_num1', '下注第三名1的金额', 'int(11)', 'Long', 'type4Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 68, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (230, 9, 'type4_num2', '下注第三名2的金额', 'int(11)', 'Long', 'type4Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 69, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (231, 9, 'type4_num3', '下注第三名3的金额', 'int(11)', 'Long', 'type4Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 70, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (232, 9, 'type4_num4', '下注第三名4的金额', 'int(11)', 'Long', 'type4Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 71, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (233, 9, 'type4_num5', '下注第三名5的金额', 'int(11)', 'Long', 'type4Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 72, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (234, 9, 'type4_num6', '下注第三名6的金额', 'int(11)', 'Long', 'type4Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 73, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (235, 9, 'type4_num7', '下注第三名7的金额', 'int(11)', 'Long', 'type4Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 74, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (236, 9, 'type4_num8', '下注第三名8的金额', 'int(11)', 'Long', 'type4Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 75, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (237, 9, 'type4_num9', '下注第三名9的金额', 'int(11)', 'Long', 'type4Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 76, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (238, 9, 'type4_num10', '下注第三名10的金额', 'int(11)', 'Long', 'type4Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 77, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (239, 9, 'type5_big', '下注第四名大的金额', 'int(11)', 'Long', 'type5Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 78, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (240, 9, 'type5_small', '下注第四名小的金额', 'int(11)', 'Long', 'type5Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 79, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (241, 9, 'type5_single', '下注第四名单的金额', 'int(11)', 'Long', 'type5Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 80, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (242, 9, 'type5_double', '下注第四名双的金额', 'int(11)', 'Long', 'type5Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 81, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (243, 9, 'type5_loong', '下注第四名龙的金额', 'int(11)', 'Long', 'type5Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 82, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (244, 9, 'type5_tiger', '下注第四名虎的金额', 'int(11)', 'Long', 'type5Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 83, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (245, 9, 'type5_num1', '下注第四名1的金额', 'int(11)', 'Long', 'type5Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 84, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (246, 9, 'type5_num2', '下注第四名2的金额', 'int(11)', 'Long', 'type5Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 85, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (247, 9, 'type5_num3', '下注第四名3的金额', 'int(11)', 'Long', 'type5Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 86, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (248, 9, 'type5_num4', '下注第四名4的金额', 'int(11)', 'Long', 'type5Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 87, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (249, 9, 'type5_num5', '下注第四名5的金额', 'int(11)', 'Long', 'type5Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 88, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (250, 9, 'type5_num6', '下注第四名6的金额', 'int(11)', 'Long', 'type5Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 89, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (251, 9, 'type5_num7', '下注第四名7的金额', 'int(11)', 'Long', 'type5Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 90, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (252, 9, 'type5_num8', '下注第四名8的金额', 'int(11)', 'Long', 'type5Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 91, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (253, 9, 'type5_num9', '下注第四名9的金额', 'int(11)', 'Long', 'type5Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 92, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (254, 9, 'type5_num10', '下注第四名10的金额', 'int(11)', 'Long', 'type5Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 93, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (255, 9, 'type6_big', '下注第五名大的金额', 'int(11)', 'Long', 'type6Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 94, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (256, 9, 'type6_small', '下注第五名小的金额', 'int(11)', 'Long', 'type6Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 95, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (257, 9, 'type6_single', '下注第五名单的金额', 'int(11)', 'Long', 'type6Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 96, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (258, 9, 'type6_double', '下注第五名双的金额', 'int(11)', 'Long', 'type6Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 97, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (259, 9, 'type6_loong', '下注第五名龙的金额', 'int(11)', 'Long', 'type6Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 98, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (260, 9, 'type6_tiger', '下注第五名虎的金额', 'int(11)', 'Long', 'type6Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 99, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (261, 9, 'type6_num1', '下注第五名1的金额', 'int(11)', 'Long', 'type6Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 100, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (262, 9, 'type6_num2', '下注第五名2的金额', 'int(11)', 'Long', 'type6Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 101, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (263, 9, 'type6_num3', '下注第五名3的金额', 'int(11)', 'Long', 'type6Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 102, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (264, 9, 'type6_num4', '下注第五名4的金额', 'int(11)', 'Long', 'type6Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 103, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (265, 9, 'type6_num5', '下注第五名5的金额', 'int(11)', 'Long', 'type6Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 104, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (266, 9, 'type6_num6', '下注第五名6的金额', 'int(11)', 'Long', 'type6Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 105, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (267, 9, 'type6_num7', '下注第五名7的金额', 'int(11)', 'Long', 'type6Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 106, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (268, 9, 'type6_num8', '下注第五名8的金额', 'int(11)', 'Long', 'type6Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 107, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (269, 9, 'type6_num9', '下注第五名9的金额', 'int(11)', 'Long', 'type6Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 108, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (270, 9, 'type6_num10', '下注第五名10的金额', 'int(11)', 'Long', 'type6Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 109, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (271, 9, 'type7_big', '下注第六名大的金额', 'int(11)', 'Long', 'type7Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 110, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (272, 9, 'type7_small', '下注第六名小的金额', 'int(11)', 'Long', 'type7Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 111, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (273, 9, 'type7_single', '下注第六名单的金额', 'int(11)', 'Long', 'type7Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 112, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (274, 9, 'type7_double', '下注第六名双的金额', 'int(11)', 'Long', 'type7Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 113, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (275, 9, 'type7_loong', '下注第六名龙的金额', 'int(11)', 'Long', 'type7Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 114, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (276, 9, 'type7_tiger', '下注第六名虎的金额', 'int(11)', 'Long', 'type7Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 115, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (277, 9, 'type7_num1', '下注第六名1的金额', 'int(11)', 'Long', 'type7Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 116, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (278, 9, 'type7_num2', '下注第六名2的金额', 'int(11)', 'Long', 'type7Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 117, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (279, 9, 'type7_num3', '下注第六名3的金额', 'int(11)', 'Long', 'type7Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 118, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (280, 9, 'type7_num4', '下注第六名4的金额', 'int(11)', 'Long', 'type7Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 119, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (281, 9, 'type7_num5', '下注第六名5的金额', 'int(11)', 'Long', 'type7Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 120, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (282, 9, 'type7_num6', '下注第六名6的金额', 'int(11)', 'Long', 'type7Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 121, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (283, 9, 'type7_num7', '下注第六名7的金额', 'int(11)', 'Long', 'type7Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 122, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (284, 9, 'type7_num8', '下注第六名8的金额', 'int(11)', 'Long', 'type7Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 123, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (285, 9, 'type7_num9', '下注第六名9的金额', 'int(11)', 'Long', 'type7Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 124, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (286, 9, 'type7_num10', '下注第六名10的金额', 'int(11)', 'Long', 'type7Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 125, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (287, 9, 'type8_big', '下注第七名大的金额', 'int(11)', 'Long', 'type8Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 126, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (288, 9, 'type8_small', '下注第七名小的金额', 'int(11)', 'Long', 'type8Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 127, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (289, 9, 'type8_single', '下注第七名单的金额', 'int(11)', 'Long', 'type8Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 128, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (290, 9, 'type8_double', '下注第七名双的金额', 'int(11)', 'Long', 'type8Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 129, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (291, 9, 'type8_loong', '下注第七名龙的金额', 'int(11)', 'Long', 'type8Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 130, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (292, 9, 'type8_tiger', '下注第七名虎的金额', 'int(11)', 'Long', 'type8Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 131, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (293, 9, 'type8_num1', '下注第七名1的金额', 'int(11)', 'Long', 'type8Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 132, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (294, 9, 'type8_num2', '下注第七名2的金额', 'int(11)', 'Long', 'type8Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 133, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (295, 9, 'type8_num3', '下注第七名3的金额', 'int(11)', 'Long', 'type8Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 134, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (296, 9, 'type8_num4', '下注第七名4的金额', 'int(11)', 'Long', 'type8Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 135, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (297, 9, 'type8_num5', '下注第七名5的金额', 'int(11)', 'Long', 'type8Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 136, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (298, 9, 'type8_num6', '下注第七名6的金额', 'int(11)', 'Long', 'type8Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 137, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (299, 9, 'type8_num7', '下注第七名7的金额', 'int(11)', 'Long', 'type8Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 138, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (300, 9, 'type8_num8', '下注第七名8的金额', 'int(11)', 'Long', 'type8Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 139, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (301, 9, 'type8_num9', '下注第七名9的金额', 'int(11)', 'Long', 'type8Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 140, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (302, 9, 'type8_num10', '下注第七名10的金额', 'int(11)', 'Long', 'type8Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 141, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (303, 9, 'type9_big', '下注第八名大的金额', 'int(11)', 'Long', 'type9Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 142, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (304, 9, 'type9_small', '下注第八名小的金额', 'int(11)', 'Long', 'type9Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 143, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (305, 9, 'type9_single', '下注第八名单的金额', 'int(11)', 'Long', 'type9Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 144, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (306, 9, 'type9_double', '下注第八名双的金额', 'int(11)', 'Long', 'type9Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 145, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (307, 9, 'type9_loong', '下注第八名龙的金额', 'int(11)', 'Long', 'type9Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 146, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (308, 9, 'type9_tiger', '下注第八名虎的金额', 'int(11)', 'Long', 'type9Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 147, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (309, 9, 'type9_num1', '下注第八名1的金额', 'int(11)', 'Long', 'type9Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 148, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (310, 9, 'type9_num2', '下注第八名2的金额', 'int(11)', 'Long', 'type9Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 149, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (311, 9, 'type9_num3', '下注第八名3的金额', 'int(11)', 'Long', 'type9Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 150, 'admin', '2024-03-17 16:40:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (312, 9, 'type9_num4', '下注第八名4的金额', 'int(11)', 'Long', 'type9Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 151, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (313, 9, 'type9_num5', '下注第八名5的金额', 'int(11)', 'Long', 'type9Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 152, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (314, 9, 'type9_num6', '下注第八名6的金额', 'int(11)', 'Long', 'type9Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 153, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (315, 9, 'type9_num7', '下注第八名7的金额', 'int(11)', 'Long', 'type9Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 154, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (316, 9, 'type9_num8', '下注第八名8的金额', 'int(11)', 'Long', 'type9Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 155, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (317, 9, 'type9_num9', '下注第八名9的金额', 'int(11)', 'Long', 'type9Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 156, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (318, 9, 'type9_num10', '下注第八名10的金额', 'int(11)', 'Long', 'type9Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 157, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (319, 9, 'type10_big', '下注第九名大的金额', 'int(11)', 'Long', 'type10Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 158, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (320, 9, 'type10_small', '下注第九名小的金额', 'int(11)', 'Long', 'type10Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 159, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (321, 9, 'type10_single', '下注第九名单的金额', 'int(11)', 'Long', 'type10Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 160, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (322, 9, 'type10_double', '下注第九名双的金额', 'int(11)', 'Long', 'type10Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 161, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (323, 9, 'type10_loong', '下注第九名龙的金额', 'int(11)', 'Long', 'type10Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 162, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (324, 9, 'type10_tiger', '下注第九名虎的金额', 'int(11)', 'Long', 'type10Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 163, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (325, 9, 'type10_num1', '下注第九名1的金额', 'int(11)', 'Long', 'type10Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 164, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (326, 9, 'type10_num2', '下注第九名2的金额', 'int(11)', 'Long', 'type10Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 165, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (327, 9, 'type10_num3', '下注第九名3的金额', 'int(11)', 'Long', 'type10Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 166, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (328, 9, 'type10_num4', '下注第九名4的金额', 'int(11)', 'Long', 'type10Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 167, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (329, 9, 'type10_num5', '下注第九名5的金额', 'int(11)', 'Long', 'type10Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 168, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (330, 9, 'type10_num6', '下注第九名6的金额', 'int(11)', 'Long', 'type10Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 169, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (331, 9, 'type10_num7', '下注第九名7的金额', 'int(11)', 'Long', 'type10Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 170, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (332, 9, 'type10_num8', '下注第九名8的金额', 'int(11)', 'Long', 'type10Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 171, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (333, 9, 'type10_num9', '下注第九名9的金额', 'int(11)', 'Long', 'type10Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 172, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (334, 9, 'type10_num10', '下注第九名10的金额', 'int(11)', 'Long', 'type10Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 173, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (335, 9, 'type11_big', '下注第十名大的金额', 'int(11)', 'Long', 'type11Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 174, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (336, 9, 'type11_small', '下注第十名小的金额', 'int(11)', 'Long', 'type11Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 175, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (337, 9, 'type11_single', '下注第十名单的金额', 'int(11)', 'Long', 'type11Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 176, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (338, 9, 'type11_double', '下注第十名双的金额', 'int(11)', 'Long', 'type11Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 177, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (339, 9, 'type11_loong', '下注第十名龙的金额', 'int(11)', 'Long', 'type11Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 178, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (340, 9, 'type11_tiger', '下注第十名虎的金额', 'int(11)', 'Long', 'type11Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 179, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (341, 9, 'type11_num1', '下注第十名1的金额', 'int(11)', 'Long', 'type11Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 180, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (342, 9, 'type11_num2', '下注第十名2的金额', 'int(11)', 'Long', 'type11Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 181, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (343, 9, 'type11_num3', '下注第十名3的金额', 'int(11)', 'Long', 'type11Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 182, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (344, 9, 'type11_num4', '下注第十名4的金额', 'int(11)', 'Long', 'type11Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 183, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (345, 9, 'type11_num5', '下注第十名5的金额', 'int(11)', 'Long', 'type11Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 184, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (346, 9, 'type11_num6', '下注第十名6的金额', 'int(11)', 'Long', 'type11Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 185, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (347, 9, 'type11_num7', '下注第十名7的金额', 'int(11)', 'Long', 'type11Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 186, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (348, 9, 'type11_num8', '下注第十名8的金额', 'int(11)', 'Long', 'type11Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 187, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (349, 9, 'type11_num9', '下注第十名9的金额', 'int(11)', 'Long', 'type11Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 188, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (350, 9, 'type11_num10', '下注第十名10的金额', 'int(11)', 'Long', 'type11Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 189, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (351, 9, 'big_single', '下注大单的金额', 'int(11)', 'Long', 'bigSingle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 190, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (352, 9, 'big_double', '下注大双的金额', 'int(11)', 'Long', 'bigDouble', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 191, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (353, 9, 'small_single', '下注小单的金额', 'int(11)', 'Long', 'smallSingle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 192, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (354, 9, 'small_double', '下注小双的金额', 'int(11)', 'Long', 'smallDouble', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 193, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (355, 9, 'house', NULL, 'int(4)', 'Integer', 'house', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 194, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (356, 9, 'num1', '开奖号码1', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 195, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (357, 9, 'num2', '开奖号码2', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 196, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (358, 9, 'num3', '开奖号码3', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 197, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (359, 9, 'num4', '开奖号码4', 'int(11)', 'Long', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 198, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (360, 9, 'num5', '开奖号码5', 'int(11)', 'Long', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 199, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (361, 9, 'num6', '开奖号码6', 'int(11)', 'Long', 'num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 200, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (362, 9, 'num7', '开奖号码7', 'int(11)', 'Long', 'num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 201, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (363, 9, 'num8', '开奖号码8', 'int(11)', 'Long', 'num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 202, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (364, 9, 'num9', '开奖号码9', 'int(11)', 'Long', 'num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 203, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (365, 9, 'num10', '开奖号码10', 'int(11)', 'Long', 'num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 204, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (366, 9, 'sum_num', '开奖合算数字', 'int(11)', 'Long', 'sumNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 205, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (367, 9, 'hz_id', '是否合庄模式', 'int(10)', 'Integer', 'hzId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 206, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (368, 9, 'hz_user', '是否用户', 'int(255)', 'Long', 'hzUser', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 207, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (369, 9, 'is_deduct', '是否扣除', 'tinyint(4)', 'Integer', 'isDeduct', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 208, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (370, 9, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 209, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (371, 9, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 210, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (372, 9, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 211, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (373, 9, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 212, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (374, 9, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 213, 'admin', '2024-03-17 16:40:35', '', NULL);
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
INSERT INTO `gen_table_column` VALUES (564, 16, 'id', '下注表ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (565, 16, 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (566, 16, 'periods', '期数', 'bigint(20)', 'Long', 'periods', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (567, 16, 'status', '投注状态（0投注 1撤单）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (568, 16, 'record_time', '投注时间', 'datetime', 'Date', 'recordTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (569, 16, 'check_time', NULL, 'timestamp', 'Date', 'checkTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (570, 16, 'count_money', '下注金额', 'int(11)', 'Long', 'countMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (571, 16, 'win_money', '中奖金额', 'float(13,2)', 'BigDecimal', 'winMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (572, 16, 'sum_big', '下注和值大的金额', 'int(11)', 'Long', 'sumBig', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (573, 16, 'sum_small', '下注和值小的金额', 'int(11)', 'Long', 'sumSmall', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (574, 16, 'sum_single', '下注和值单的金额', 'int(11)', 'Long', 'sumSingle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (575, 16, 'sum_double', '下注和值双的金额', 'int(11)', 'Long', 'sumDouble', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (576, 16, 'sum_loong', '下注和值龙的金额', 'int(11)', 'Long', 'sumLoong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (577, 16, 'sum_tiger', '下注和值虎的金额', 'int(11)', 'Long', 'sumTiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (578, 16, 'sum_sum', '下注和值和的金额', 'int(11)', 'Long', 'sumSum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (579, 16, 'num1_big', '下注买1号球大的金额', 'int(11)', 'Long', 'num1Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (580, 16, 'num1_small', '下注买1号球小的金额', 'int(11)', 'Long', 'num1Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (581, 16, 'num1_single', '下注买1号球单的金额', 'int(11)', 'Long', 'num1Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (582, 16, 'num1_double', '下注买1号球双的金额', 'int(11)', 'Long', 'num1Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (583, 16, 'num1_0', '下注买1号球0的金额', 'int(11)', 'Long', 'num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (584, 16, 'num1_1', '下注买1号球1的金额', 'int(11)', 'Long', 'num11', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (585, 16, 'num1_2', '下注买1号球2的金额', 'int(11)', 'Long', 'num12', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (586, 16, 'num1_3', '下注买1号球3的金额', 'int(11)', 'Long', 'num13', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (587, 16, 'num1_4', '下注买1号球4的金额', 'int(11)', 'Long', 'num14', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (588, 16, 'num1_5', '下注买1号球5的金额', 'int(11)', 'Long', 'num15', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (589, 16, 'num1_6', '下注买1号球6的金额', 'int(11)', 'Long', 'num16', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (590, 16, 'num1_7', '下注买1号球7的金额', 'int(11)', 'Long', 'num17', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (591, 16, 'num1_8', '下注买1号球8的金额', 'int(11)', 'Long', 'num18', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (592, 16, 'num1_9', '下注买1号球9的金额', 'int(11)', 'Long', 'num19', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (593, 16, 'num2_big', '下注买2号球大的金额', 'int(11)', 'Long', 'num2Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 30, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (594, 16, 'num2_small', '下注买2号球小的金额', 'int(11)', 'Long', 'num2Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 31, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (595, 16, 'num2_single', '下注买2号球单的金额', 'int(11)', 'Long', 'num2Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 32, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (596, 16, 'num2_double', '下注买2号球双的金额', 'int(11)', 'Long', 'num2Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 33, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (597, 16, 'num2_0', '下注买2号球0的金额', 'int(11)', 'Long', 'num20', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 34, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (598, 16, 'num2_1', '下注买2号球1的金额', 'int(11)', 'Long', 'num21', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 35, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (599, 16, 'num2_2', '下注买2号球2的金额', 'int(11)', 'Long', 'num22', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 36, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (600, 16, 'num2_3', '下注买2号球3的金额', 'int(11)', 'Long', 'num23', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 37, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (601, 16, 'num2_4', '下注买2号球4的金额', 'int(11)', 'Long', 'num24', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 38, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (602, 16, 'num2_5', '下注买2号球5的金额', 'int(11)', 'Long', 'num25', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 39, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (603, 16, 'num2_6', '下注买2号球6的金额', 'int(11)', 'Long', 'num26', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 40, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (604, 16, 'num2_7', '下注买2号球7的金额', 'int(11)', 'Long', 'num27', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 41, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (605, 16, 'num2_8', '下注买2号球8的金额', 'int(11)', 'Long', 'num28', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 42, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (606, 16, 'num2_9', '下注买2号球9的金额', 'int(11)', 'Long', 'num29', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 43, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (607, 16, 'num3_big', '下注买3号球大的金额', 'int(11)', 'Long', 'num3Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 44, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (608, 16, 'num3_small', '下注买3号球小的金额', 'int(11)', 'Long', 'num3Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 45, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (609, 16, 'num3_single', '下注买3号球单的金额', 'int(11)', 'Long', 'num3Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 46, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (610, 16, 'num3_double', '下注买3号球双的金额', 'int(11)', 'Long', 'num3Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 47, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (611, 16, 'num3_0', '下注买3号球0的金额', 'int(11)', 'Long', 'num30', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 48, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (612, 16, 'num3_1', '下注买3号球1的金额', 'int(11)', 'Long', 'num31', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 49, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (613, 16, 'num3_2', '下注买3号球2的金额', 'int(11)', 'Long', 'num32', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 50, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (614, 16, 'num3_3', '下注买3号球3的金额', 'int(11)', 'Long', 'num33', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 51, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (615, 16, 'num3_4', '下注买3号球4的金额', 'int(11)', 'Long', 'num34', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 52, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (616, 16, 'num3_5', '下注买3号球5的金额', 'int(11)', 'Long', 'num35', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 53, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (617, 16, 'num3_6', '下注买3号球6的金额', 'int(11)', 'Long', 'num36', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 54, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (618, 16, 'num3_7', '下注买3号球7的金额', 'int(11)', 'Long', 'num37', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 55, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (619, 16, 'num3_8', '下注买3号球8的金额', 'int(11)', 'Long', 'num38', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 56, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (620, 16, 'num3_9', '下注买3号球9的金额', 'int(11)', 'Long', 'num39', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 57, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (621, 16, 'num4_big', '下注买4号球大的金额', 'int(11)', 'Long', 'num4Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 58, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (622, 16, 'num4_small', '下注买4号球小的金额', 'int(11)', 'Long', 'num4Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 59, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (623, 16, 'num4_single', '下注买4号球单的金额', 'int(11)', 'Long', 'num4Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 60, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (624, 16, 'num4_double', '下注买4号球双的金额', 'int(11)', 'Long', 'num4Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 61, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (625, 16, 'num4_0', '下注买4号球0的金额', 'int(11)', 'Long', 'num40', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 62, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (626, 16, 'num4_1', '下注买4号球1的金额', 'int(11)', 'Long', 'num41', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 63, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (627, 16, 'num4_2', '下注买4号球2的金额', 'int(11)', 'Long', 'num42', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 64, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (628, 16, 'num4_3', '下注买4号球3的金额', 'int(11)', 'Long', 'num43', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 65, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (629, 16, 'num4_4', '下注买4号球4的金额', 'int(11)', 'Long', 'num44', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 66, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (630, 16, 'num4_5', '下注买4号球5的金额', 'int(11)', 'Long', 'num45', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 67, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (631, 16, 'num4_6', '下注买4号球6的金额', 'int(11)', 'Long', 'num46', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 68, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (632, 16, 'num4_7', '下注买4号球7的金额', 'int(11)', 'Long', 'num47', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 69, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (633, 16, 'num4_8', '下注买4号球8的金额', 'int(11)', 'Long', 'num48', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 70, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (634, 16, 'num4_9', '下注买4号球9的金额', 'int(11)', 'Long', 'num49', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 71, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (635, 16, 'num5_big', '下注买5号球大的金额', 'int(11)', 'Long', 'num5Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 72, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (636, 16, 'num5_small', '下注买5号球小的金额', 'int(11)', 'Long', 'num5Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 73, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (637, 16, 'num5_single', '下注买5号球单的金额', 'int(11)', 'Long', 'num5Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 74, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (638, 16, 'num5_double', '下注买5号球双的金额', 'int(11)', 'Long', 'num5Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 75, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (639, 16, 'num5_0', '下注买5号球0的金额', 'int(11)', 'Long', 'num50', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 76, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (640, 16, 'num5_1', '下注买5号球1的金额', 'int(11)', 'Long', 'num51', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 77, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (641, 16, 'num5_2', '下注买5号球2的金额', 'int(11)', 'Long', 'num52', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 78, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (642, 16, 'num5_3', '下注买5号球3的金额', 'int(11)', 'Long', 'num53', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 79, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (643, 16, 'num5_4', '下注买5号球4的金额', 'int(11)', 'Long', 'num54', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 80, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (644, 16, 'num5_5', '下注买5号球5的金额', 'int(11)', 'Long', 'num55', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 81, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (645, 16, 'num5_6', '下注买5号球6的金额', 'int(11)', 'Long', 'num56', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 82, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (646, 16, 'num5_7', '下注买5号球7的金额', 'int(11)', 'Long', 'num57', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 83, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (647, 16, 'num5_8', '下注买5号球8的金额', 'int(11)', 'Long', 'num58', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 84, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (648, 16, 'num5_9', '下注买5号球9的金额', 'int(11)', 'Long', 'num59', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 85, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (649, 16, 'first_bao', '下注买前三豹的金额', 'int(11)', 'Long', 'firstBao', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 86, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (650, 16, 'first_dui', '下注买前三对的金额', 'int(11)', 'Long', 'firstDui', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 87, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (651, 16, 'first_sun', '下注买前三顺的金额', 'int(11)', 'Long', 'firstSun', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 88, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (652, 16, 'first_ban', '下注买前三半的金额', 'int(11)', 'Long', 'firstBan', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 89, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (653, 16, 'first_za', '下注买前三杂的金额', 'int(11)', 'Long', 'firstZa', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 90, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (654, 16, 'mid_bao', '下注买中三豹的的金额', 'int(11)', 'Long', 'midBao', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 91, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (655, 16, 'mid_dui', '下注买中三对的的金额', 'int(11)', 'Long', 'midDui', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 92, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (656, 16, 'mid_sun', '下注买中三顺的的金额', 'int(11)', 'Long', 'midSun', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 93, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (657, 16, 'mid_ban', '下注买中三半的的金额', 'int(11)', 'Long', 'midBan', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 94, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (658, 16, 'mid_za', '下注买中三杂的的金额', 'int(11)', 'Long', 'midZa', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 95, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (659, 16, 'back_bao', '下注买后三豹的的金额', 'int(11)', 'Long', 'backBao', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 96, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (660, 16, 'back_dui', '下注买后三对的的金额', 'int(11)', 'Long', 'backDui', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 97, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (661, 16, 'back_sun', '下注买后三顺的的金额', 'int(11)', 'Long', 'backSun', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 98, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (662, 16, 'back_ban', '下注买后三半的的金额', 'int(11)', 'Long', 'backBan', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 99, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (663, 16, 'back_za', '下注买后三杂的的金额', 'int(11)', 'Long', 'backZa', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 100, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (664, 16, 'num1', '开奖号码1', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 101, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (665, 16, 'num2', '开奖号码2', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 102, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (666, 16, 'num3', '开奖号码3', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 103, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (667, 16, 'num4', '开奖号码4', 'int(11)', 'Long', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 104, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (668, 16, 'num5', '开奖号码5', 'int(11)', 'Long', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 105, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (669, 16, 'sum', '开奖合算数字', 'int(11)', 'Long', 'sum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 106, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (670, 16, 'is_delete', NULL, 'tinyint(4)', 'Integer', 'isDelete', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 107, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (671, 16, 'house', NULL, 'int(4)', 'Integer', 'house', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 108, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (672, 16, 'hz_id', '是否合庄模式', 'int(10)', 'Integer', 'hzId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 109, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (673, 16, 'hz_user', '是否用户', 'int(255)', 'Long', 'hzUser', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 110, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (674, 16, 'is_deduct', '是否扣除', 'tinyint(4)', 'Integer', 'isDeduct', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 111, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (675, 16, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 112, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (676, 16, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 113, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (677, 16, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 114, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (678, 16, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 115, 'admin', '2024-03-17 16:40:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (679, 16, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 116, 'admin', '2024-03-17 16:40:35', '', NULL);
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
INSERT INTO `gen_table_column` VALUES (722, 19, 'id', '下注表ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (723, 19, 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (724, 19, 'periods', '期数', 'bigint(20)', 'Long', 'periods', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (725, 19, 'status', '投注状态（0投注 1撤单）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (726, 19, 'record_time', '投注时间', 'datetime', 'Date', 'recordTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (727, 19, 'check_time', NULL, 'timestamp', 'Date', 'checkTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (728, 19, 'count_money', '下注金额', 'int(11)', 'Long', 'countMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (729, 19, 'win_money', '中奖金额', 'float(13,2)', 'BigDecimal', 'winMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (730, 19, 'big', '下注大的金额', 'int(11)', 'Long', 'big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (731, 19, 'small', '下注小的金额', 'int(11)', 'Long', 'small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (732, 19, 'single', '下注单的金额', 'int(11)', 'Long', 'single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (733, 19, 'double_amount', '下注双的金额', 'int(11)', 'Long', 'doubleAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (734, 19, 'much_Big', '下注极大的金额', 'int(11)', 'Long', 'muchBig', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (735, 19, 'big_Single', '下注大单的金额', 'int(11)', 'Long', 'bigSingle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (736, 19, 'small_Single', '下注小单的金额', 'int(11)', 'Long', 'smallSingle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (737, 19, 'big_Double', '下注大双的金额', 'int(11)', 'Long', 'bigDouble', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (738, 19, 'small_Double', '下注小双的金额', 'int(11)', 'Long', 'smallDouble', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (739, 19, 'much_Small', '下注极小的金额', 'int(11)', 'Long', 'muchSmall', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (740, 19, 'num0', '下注数字0的金额', 'int(11)', 'Long', 'num0', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-03-17 18:44:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (741, 19, 'num1', '下注数字1的金额', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (742, 19, 'num2', '下注数字2的金额', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (743, 19, 'num3', '下注数字3的金额', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (744, 19, 'num4', '下注数字4的金额', 'int(11)', 'Long', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (745, 19, 'num5', '下注数字5的金额', 'int(11)', 'Long', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (746, 19, 'num6', '下注数字6的金额', 'int(11)', 'Long', 'num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (747, 19, 'num7', '下注数字7的金额', 'int(11)', 'Long', 'num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (748, 19, 'num8', '下注数字8的金额', 'int(11)', 'Long', 'num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (749, 19, 'num9', '下注数字9的金额', 'int(11)', 'Long', 'num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (750, 19, 'num10', '下注数字10的金额', 'int(11)', 'Long', 'num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (751, 19, 'num11', '下注数字11的金额', 'int(11)', 'Long', 'num11', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 30, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (752, 19, 'num12', '下注数字12的金额', 'int(11)', 'Long', 'num12', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 31, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (753, 19, 'num13', '下注数字13的金额', 'int(11)', 'Long', 'num13', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 32, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (754, 19, 'num14', '下注数字14的金额', 'int(11)', 'Long', 'num14', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 33, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (755, 19, 'num15', '下注数字15的金额', 'int(11)', 'Long', 'num15', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 34, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (756, 19, 'num16', '下注数字16的金额', 'int(11)', 'Long', 'num16', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 35, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (757, 19, 'num17', '下注数字17的金额', 'int(11)', 'Long', 'num17', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 36, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (758, 19, 'num18', '下注数字18的金额', 'int(11)', 'Long', 'num18', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 37, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (759, 19, 'num19', '下注数字19的金额', 'int(11)', 'Long', 'num19', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 38, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (760, 19, 'num20', '下注数字20的金额', 'int(11)', 'Long', 'num20', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 39, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (761, 19, 'num21', '下注数字21的金额', 'int(11)', 'Long', 'num21', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 40, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (762, 19, 'num22', '下注数字22的金额', 'int(11)', 'Long', 'num22', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 41, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (763, 19, 'num23', '下注数字23的金额', 'int(11)', 'Long', 'num23', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 42, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (764, 19, 'num24', '下注数字24的金额', 'int(11)', 'Long', 'num24', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 43, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (765, 19, 'num25', '下注数字25的金额', 'int(11)', 'Long', 'num25', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 44, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (766, 19, 'num26', '下注数字26的金额', 'int(11)', 'Long', 'num26', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 45, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (767, 19, 'num27', '下注数字27的金额', 'int(11)', 'Long', 'num27', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 46, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (768, 19, 'red', '下注红的金额', 'int(11)', 'Long', 'red', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 47, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (769, 19, 'green', '下注绿的金额', 'int(11)', 'Long', 'green', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 48, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (770, 19, 'blue', '下注蓝的金额', 'int(11)', 'Long', 'blue', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 49, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (771, 19, 'loong', '下注龙的金额', 'int(11)', 'Long', 'loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 50, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (772, 19, 'tiger', '下注虎的金额', 'int(11)', 'Long', 'tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 51, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (773, 19, 'close', '下注合的金额', 'int(11)', 'Long', 'close', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 52, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (774, 19, 'leopard', '下注豹子的金额', 'int(11)', 'Long', 'leopard', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 53, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (775, 19, 'pairs', '下注对子的金额', 'int(11)', 'Long', 'pairs', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 54, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (776, 19, 'shun', '下注顺子的金额', 'int(11)', 'Long', 'shun', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 55, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (777, 19, 'vip', 'VIP房间', 'int(4)', 'Integer', 'vip', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 56, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (778, 19, 'n1', '开奖号码1', 'int(11)', 'Long', 'n1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 57, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (779, 19, 'n2', '开奖号码2', 'int(11)', 'Long', 'n2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 58, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (780, 19, 'n3', '开奖号码3', 'int(11)', 'Long', 'n3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 59, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (781, 19, 'sum_num', '开奖合算数字', 'int(11)', 'Long', 'sumNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 60, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (782, 19, 'hz_id', '是否合庄模式', 'int(10)', 'Integer', 'hzId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 61, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (783, 19, 'hz_user', '是否用户', 'int(255)', 'Long', 'hzUser', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 62, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (784, 19, 'is_delete', NULL, 'tinyint(1)', 'Integer', 'isDelete', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 63, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (785, 19, 'is_deduct', '是否扣除', 'tinyint(4)', 'Integer', 'isDeduct', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 64, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (786, 19, 'house', NULL, 'int(4)', 'Integer', 'house', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 65, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (787, 19, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 66, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (788, 19, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 67, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (789, 19, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 68, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (790, 19, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 69, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (791, 19, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 70, 'admin', '2024-03-17 18:44:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (800, 21, 'replace_id', '广告轮播图ID', 'int(11)', 'Long', 'replaceId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47');
INSERT INTO `gen_table_column` VALUES (801, 21, 'replace_pic', '广告轮播图图片', 'varchar(200)', 'String', 'replacePic', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'imageUpload', '', 2, 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47');
INSERT INTO `gen_table_column` VALUES (802, 21, 'status', '广告轮播图状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_replace_status', 3, 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47');
INSERT INTO `gen_table_column` VALUES (803, 21, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47');
INSERT INTO `gen_table_column` VALUES (804, 21, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47');
INSERT INTO `gen_table_column` VALUES (805, 21, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47');
INSERT INTO `gen_table_column` VALUES (806, 21, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47');
INSERT INTO `gen_table_column` VALUES (807, 21, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 8, 'admin', '2024-03-17 19:27:35', '', '2024-03-17 19:29:47');

-- ----------------------------
-- Table structure for jnd
-- ----------------------------
DROP TABLE IF EXISTS `jnd`;
CREATE TABLE `jnd`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '期数',
  `time` datetime NULL DEFAULT NULL COMMENT '开奖时间',
  `num1` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num2` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num3` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num4` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num5` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num6` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num7` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num8` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num9` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num10` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num11` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num12` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num13` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num14` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num15` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num16` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num17` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num18` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num19` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `num20` int(11) NULL DEFAULT NULL COMMENT '无效字段',
  `sum_1` int(11) NULL DEFAULT NULL COMMENT '开奖号码1',
  `sum_2` int(11) NULL DEFAULT NULL COMMENT '开奖号码2',
  `sum_3` int(11) NULL DEFAULT NULL COMMENT '开奖号码3',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3116237 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '加拿大开奖历史表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jnd
-- ----------------------------

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
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否已经开奖（0已经开奖 1未开奖）',
  `the_time` datetime NULL DEFAULT NULL COMMENT '开奖时间',
  `count_money` int(11) NULL DEFAULT 0 COMMENT '总下注金额',
  `win_money` int(11) NULL DEFAULT 0 COMMENT '总中奖金额',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3116239 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '加拿大开奖表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jnd28
-- ----------------------------

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
  `check_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `count_money` int(11) NULL DEFAULT 0 COMMENT '下注金额',
  `win_money` float(13, 2) NULL DEFAULT 0.00 COMMENT '中奖金额',
  `big` int(11) NULL DEFAULT 0 COMMENT '下注大的金额',
  `small` int(11) NULL DEFAULT 0 COMMENT '下注小的金额',
  `single` int(11) NULL DEFAULT 0 COMMENT '下注单的金额',
  `double_amount` int(11) NULL DEFAULT 0 COMMENT '下注双的金额',
  `much_Big` int(11) NULL DEFAULT 0 COMMENT '下注极大的金额',
  `big_Single` int(11) NULL DEFAULT 0 COMMENT '下注大单的金额',
  `small_Single` int(11) NULL DEFAULT 0 COMMENT '下注小单的金额',
  `big_Double` int(11) NULL DEFAULT 0 COMMENT '下注大双的金额',
  `small_Double` int(11) NULL DEFAULT 0 COMMENT '下注小双的金额',
  `much_Small` int(11) NULL DEFAULT 0 COMMENT '下注极小的金额',
  `num0` int(11) NULL DEFAULT 0 COMMENT '下注数字0的金额',
  `num1` int(11) NULL DEFAULT 0 COMMENT '下注数字1的金额',
  `num2` int(11) NULL DEFAULT 0 COMMENT '下注数字2的金额',
  `num3` int(11) NULL DEFAULT 0 COMMENT '下注数字3的金额',
  `num4` int(11) NULL DEFAULT 0 COMMENT '下注数字4的金额',
  `num5` int(11) NULL DEFAULT 0 COMMENT '下注数字5的金额',
  `num6` int(11) NULL DEFAULT 0 COMMENT '下注数字6的金额',
  `num7` int(11) NULL DEFAULT 0 COMMENT '下注数字7的金额',
  `num8` int(11) NULL DEFAULT 0 COMMENT '下注数字8的金额',
  `num9` int(11) NULL DEFAULT 0 COMMENT '下注数字9的金额',
  `num10` int(11) NULL DEFAULT 0 COMMENT '下注数字10的金额',
  `num11` int(11) NULL DEFAULT 0 COMMENT '下注数字11的金额',
  `num12` int(11) NULL DEFAULT 0 COMMENT '下注数字12的金额',
  `num13` int(11) NULL DEFAULT 0 COMMENT '下注数字13的金额',
  `num14` int(11) NULL DEFAULT 0 COMMENT '下注数字14的金额',
  `num15` int(11) NULL DEFAULT 0 COMMENT '下注数字15的金额',
  `num16` int(11) NULL DEFAULT 0 COMMENT '下注数字16的金额',
  `num17` int(11) NULL DEFAULT 0 COMMENT '下注数字17的金额',
  `num18` int(11) NULL DEFAULT 0 COMMENT '下注数字18的金额',
  `num19` int(11) NULL DEFAULT 0 COMMENT '下注数字19的金额',
  `num20` int(11) NULL DEFAULT 0 COMMENT '下注数字20的金额',
  `num21` int(11) NULL DEFAULT 0 COMMENT '下注数字21的金额',
  `num22` int(11) NULL DEFAULT 0 COMMENT '下注数字22的金额',
  `num23` int(11) NULL DEFAULT 0 COMMENT '下注数字23的金额',
  `num24` int(11) NULL DEFAULT 0 COMMENT '下注数字24的金额',
  `num25` int(11) NULL DEFAULT 0 COMMENT '下注数字25的金额',
  `num26` int(11) NULL DEFAULT 0 COMMENT '下注数字26的金额',
  `num27` int(11) NULL DEFAULT 0 COMMENT '下注数字27的金额',
  `red` int(11) NULL DEFAULT 0 COMMENT '下注红的金额',
  `green` int(11) NULL DEFAULT 0 COMMENT '下注绿的金额',
  `blue` int(11) NULL DEFAULT 0 COMMENT '下注蓝的金额',
  `loong` int(11) NULL DEFAULT 0 COMMENT '下注龙的金额',
  `tiger` int(11) NULL DEFAULT 0 COMMENT '下注虎的金额',
  `close` int(11) NULL DEFAULT 0 COMMENT '下注合的金额',
  `leopard` int(11) NULL DEFAULT 0 COMMENT '下注豹子的金额',
  `pairs` int(11) NULL DEFAULT 0 COMMENT '下注对子的金额',
  `shun` int(11) NULL DEFAULT 0 COMMENT '下注顺子的金额',
  `vip` int(4) NOT NULL COMMENT 'VIP房间',
  `n1` int(11) NULL DEFAULT NULL COMMENT '开奖号码1',
  `n2` int(11) NULL DEFAULT NULL COMMENT '开奖号码2',
  `n3` int(11) NULL DEFAULT NULL COMMENT '开奖号码3',
  `sum_num` int(11) NULL DEFAULT NULL COMMENT '开奖合算数字',
  `hz_id` int(10) NOT NULL DEFAULT 0 COMMENT '是否合庄模式',
  `hz_user` int(255) NULL DEFAULT NULL COMMENT '是否用户',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `is_deduct` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否扣除',
  `house` int(4) NOT NULL DEFAULT 0,
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
) ENGINE = InnoDB AUTO_INCREMENT = 5112728 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '极速时时彩开奖历史表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jsssc
-- ----------------------------

-- ----------------------------
-- Table structure for jsssckj
-- ----------------------------
DROP TABLE IF EXISTS `jsssckj`;
CREATE TABLE `jsssckj`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '期数',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否已经开奖（0已经开奖 1未开奖）',
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
) ENGINE = InnoDB AUTO_INCREMENT = 5112730 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '极速时时彩开奖表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jsssckj
-- ----------------------------

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
  `check_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `count_money` int(11) NULL DEFAULT 0 COMMENT '下注金额',
  `win_money` float(13, 2) NULL DEFAULT 0.00 COMMENT '中奖金额',
  `sum_big` int(11) NULL DEFAULT 0 COMMENT '下注和值大的金额',
  `sum_small` int(11) NULL DEFAULT 0 COMMENT '下注和值小的金额',
  `sum_single` int(11) NULL DEFAULT 0 COMMENT '下注和值单的金额',
  `sum_double` int(11) NULL DEFAULT 0 COMMENT '下注和值双的金额',
  `sum_loong` int(11) NULL DEFAULT 0 COMMENT '下注和值龙的金额',
  `sum_tiger` int(11) NULL DEFAULT 0 COMMENT '下注和值虎的金额',
  `sum_sum` int(11) NULL DEFAULT 0 COMMENT '下注和值和的金额',
  `num1_big` int(11) NULL DEFAULT 0 COMMENT '下注买1号球大的金额',
  `num1_small` int(11) NULL DEFAULT 0 COMMENT '下注买1号球小的金额',
  `num1_single` int(11) NULL DEFAULT 0 COMMENT '下注买1号球单的金额',
  `num1_double` int(11) NULL DEFAULT 0 COMMENT '下注买1号球双的金额',
  `num1_0` int(11) NULL DEFAULT 0 COMMENT '下注买1号球0的金额',
  `num1_1` int(11) NULL DEFAULT 0 COMMENT '下注买1号球1的金额',
  `num1_2` int(11) NULL DEFAULT 0 COMMENT '下注买1号球2的金额',
  `num1_3` int(11) NULL DEFAULT 0 COMMENT '下注买1号球3的金额',
  `num1_4` int(11) NULL DEFAULT 0 COMMENT '下注买1号球4的金额',
  `num1_5` int(11) NULL DEFAULT 0 COMMENT '下注买1号球5的金额',
  `num1_6` int(11) NULL DEFAULT 0 COMMENT '下注买1号球6的金额',
  `num1_7` int(11) NULL DEFAULT 0 COMMENT '下注买1号球7的金额',
  `num1_8` int(11) NULL DEFAULT 0 COMMENT '下注买1号球8的金额',
  `num1_9` int(11) NULL DEFAULT 0 COMMENT '下注买1号球9的金额',
  `num2_big` int(11) NULL DEFAULT 0 COMMENT '下注买2号球大的金额',
  `num2_small` int(11) NULL DEFAULT 0 COMMENT '下注买2号球小的金额',
  `num2_single` int(11) NULL DEFAULT 0 COMMENT '下注买2号球单的金额',
  `num2_double` int(11) NULL DEFAULT 0 COMMENT '下注买2号球双的金额',
  `num2_0` int(11) NULL DEFAULT 0 COMMENT '下注买2号球0的金额',
  `num2_1` int(11) NULL DEFAULT 0 COMMENT '下注买2号球1的金额',
  `num2_2` int(11) NULL DEFAULT 0 COMMENT '下注买2号球2的金额',
  `num2_3` int(11) NULL DEFAULT 0 COMMENT '下注买2号球3的金额',
  `num2_4` int(11) NULL DEFAULT 0 COMMENT '下注买2号球4的金额',
  `num2_5` int(11) NULL DEFAULT 0 COMMENT '下注买2号球5的金额',
  `num2_6` int(11) NULL DEFAULT 0 COMMENT '下注买2号球6的金额',
  `num2_7` int(11) NULL DEFAULT 0 COMMENT '下注买2号球7的金额',
  `num2_8` int(11) NULL DEFAULT 0 COMMENT '下注买2号球8的金额',
  `num2_9` int(11) NULL DEFAULT 0 COMMENT '下注买2号球9的金额',
  `num3_big` int(11) NULL DEFAULT 0 COMMENT '下注买3号球大的金额',
  `num3_small` int(11) NULL DEFAULT 0 COMMENT '下注买3号球小的金额',
  `num3_single` int(11) NULL DEFAULT 0 COMMENT '下注买3号球单的金额',
  `num3_double` int(11) NULL DEFAULT 0 COMMENT '下注买3号球双的金额',
  `num3_0` int(11) NULL DEFAULT 0 COMMENT '下注买3号球0的金额',
  `num3_1` int(11) NULL DEFAULT 0 COMMENT '下注买3号球1的金额',
  `num3_2` int(11) NULL DEFAULT 0 COMMENT '下注买3号球2的金额',
  `num3_3` int(11) NULL DEFAULT 0 COMMENT '下注买3号球3的金额',
  `num3_4` int(11) NULL DEFAULT 0 COMMENT '下注买3号球4的金额',
  `num3_5` int(11) NULL DEFAULT 0 COMMENT '下注买3号球5的金额',
  `num3_6` int(11) NULL DEFAULT 0 COMMENT '下注买3号球6的金额',
  `num3_7` int(11) NULL DEFAULT 0 COMMENT '下注买3号球7的金额',
  `num3_8` int(11) NULL DEFAULT 0 COMMENT '下注买3号球8的金额',
  `num3_9` int(11) NULL DEFAULT 0 COMMENT '下注买3号球9的金额',
  `num4_big` int(11) NULL DEFAULT 0 COMMENT '下注买4号球大的金额',
  `num4_small` int(11) NULL DEFAULT 0 COMMENT '下注买4号球小的金额',
  `num4_single` int(11) NULL DEFAULT 0 COMMENT '下注买4号球单的金额',
  `num4_double` int(11) NULL DEFAULT 0 COMMENT '下注买4号球双的金额',
  `num4_0` int(11) NULL DEFAULT 0 COMMENT '下注买4号球0的金额',
  `num4_1` int(11) NULL DEFAULT 0 COMMENT '下注买4号球1的金额',
  `num4_2` int(11) NULL DEFAULT 0 COMMENT '下注买4号球2的金额',
  `num4_3` int(11) NULL DEFAULT 0 COMMENT '下注买4号球3的金额',
  `num4_4` int(11) NULL DEFAULT 0 COMMENT '下注买4号球4的金额',
  `num4_5` int(11) NULL DEFAULT 0 COMMENT '下注买4号球5的金额',
  `num4_6` int(11) NULL DEFAULT 0 COMMENT '下注买4号球6的金额',
  `num4_7` int(11) NULL DEFAULT 0 COMMENT '下注买4号球7的金额',
  `num4_8` int(11) NULL DEFAULT 0 COMMENT '下注买4号球8的金额',
  `num4_9` int(11) NULL DEFAULT 0 COMMENT '下注买4号球9的金额',
  `num5_big` int(11) NULL DEFAULT 0 COMMENT '下注买5号球大的金额',
  `num5_small` int(11) NULL DEFAULT 0 COMMENT '下注买5号球小的金额',
  `num5_single` int(11) NULL DEFAULT 0 COMMENT '下注买5号球单的金额',
  `num5_double` int(11) NULL DEFAULT 0 COMMENT '下注买5号球双的金额',
  `num5_0` int(11) NULL DEFAULT 0 COMMENT '下注买5号球0的金额',
  `num5_1` int(11) NULL DEFAULT 0 COMMENT '下注买5号球1的金额',
  `num5_2` int(11) NULL DEFAULT 0 COMMENT '下注买5号球2的金额',
  `num5_3` int(11) NULL DEFAULT 0 COMMENT '下注买5号球3的金额',
  `num5_4` int(11) NULL DEFAULT 0 COMMENT '下注买5号球4的金额',
  `num5_5` int(11) NULL DEFAULT 0 COMMENT '下注买5号球5的金额',
  `num5_6` int(11) NULL DEFAULT 0 COMMENT '下注买5号球6的金额',
  `num5_7` int(11) NULL DEFAULT 0 COMMENT '下注买5号球7的金额',
  `num5_8` int(11) NULL DEFAULT 0 COMMENT '下注买5号球8的金额',
  `num5_9` int(11) NULL DEFAULT 0 COMMENT '下注买5号球9的金额',
  `first_bao` int(11) NULL DEFAULT 0 COMMENT '下注买前三豹的金额',
  `first_dui` int(11) NULL DEFAULT 0 COMMENT '下注买前三对的金额',
  `first_sun` int(11) NULL DEFAULT 0 COMMENT '下注买前三顺的金额',
  `first_ban` int(11) NULL DEFAULT 0 COMMENT '下注买前三半的金额',
  `first_za` int(11) NULL DEFAULT 0 COMMENT '下注买前三杂的金额',
  `mid_bao` int(11) NULL DEFAULT 0 COMMENT '下注买中三豹的的金额',
  `mid_dui` int(11) NULL DEFAULT 0 COMMENT '下注买中三对的的金额',
  `mid_sun` int(11) NULL DEFAULT 0 COMMENT '下注买中三顺的的金额',
  `mid_ban` int(11) NULL DEFAULT 0 COMMENT '下注买中三半的的金额',
  `mid_za` int(11) NULL DEFAULT 0 COMMENT '下注买中三杂的的金额',
  `back_bao` int(11) NULL DEFAULT 0 COMMENT '下注买后三豹的的金额',
  `back_dui` int(11) NULL DEFAULT 0 COMMENT '下注买后三对的的金额',
  `back_sun` int(11) NULL DEFAULT 0 COMMENT '下注买后三顺的的金额',
  `back_ban` int(11) NULL DEFAULT 0 COMMENT '下注买后三半的的金额',
  `back_za` int(11) NULL DEFAULT 0 COMMENT '下注买后三杂的的金额',
  `num1` int(11) NULL DEFAULT NULL COMMENT '开奖号码1',
  `num2` int(11) NULL DEFAULT NULL COMMENT '开奖号码2',
  `num3` int(11) NULL DEFAULT NULL COMMENT '开奖号码3',
  `num4` int(11) NULL DEFAULT NULL COMMENT '开奖号码4',
  `num5` int(11) NULL DEFAULT NULL COMMENT '开奖号码5',
  `sum` int(11) NULL DEFAULT NULL COMMENT '开奖合算数字',
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  `house` int(4) NOT NULL DEFAULT 0,
  `hz_id` int(10) NOT NULL DEFAULT 0 COMMENT '是否合庄模式',
  `hz_user` int(255) NULL DEFAULT NULL COMMENT '是否用户',
  `is_deduct` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否扣除',
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
  `bet_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '游戏投注项ID',
  `game_id` bigint(20) NOT NULL COMMENT '游戏ID',
  `bet_item_type` bigint(20) NULL DEFAULT NULL COMMENT '投注项类别',
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
INSERT INTO `sys_bet_item` VALUES (2, 1, 1, '大', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (3, 1, 1, '小', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.01, 9999.99, 2.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (4, 1, 1, '单', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (5, 1, 1, '双', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.00, 9999.99, 5.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (6, 1, 1, '极大', '', 15.00, 500.00, 2.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (7, 1, 1, '大单', '', 4.20, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (8, 1, 1, '小单', 0xE5BC805B31335DE7BB84E59088E5B08FE58D95E999AA5B315DE5808DEFBC8CE5BC80E7BB84E590885B31345DE5A4A7E58F8CE999AA5B315DE5808D, 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (9, 1, 1, '大双', 0xE5BC805B31335DE7BB84E59088E5B08FE58D95E999AA5B315DE5808DEFBC8CE5BC80E7BB84E590885B31345DE5A4A7E58F8CE999AA5B315DE5808D, 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (10, 1, 1, '小双', '', 4.20, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (11, 1, 1, '极小', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (12, 1, 2, '0 ', '', 500.01, 1000.00, 5.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:03:41', '');
INSERT INTO `sys_bet_item` VALUES (13, 1, 2, '1 ', '', 188.00, 9999.99, 5.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:08', '');
INSERT INTO `sys_bet_item` VALUES (14, 1, 2, '2 ', '', 120.00, 1000.00, 5.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:19', '');
INSERT INTO `sys_bet_item` VALUES (15, 1, 2, '3 ', '', 72.00, 1000.00, 5.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:40', '');
INSERT INTO `sys_bet_item` VALUES (16, 1, 2, '4 ', '', 38.00, 1000.00, 5.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:54', '');
INSERT INTO `sys_bet_item` VALUES (17, 1, 2, '5 ', '', 30.00, 1000.00, 5.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:07', '');
INSERT INTO `sys_bet_item` VALUES (18, 1, 2, '6 ', '', 24.00, 1000.00, 5.00, 18, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:24', '');
INSERT INTO `sys_bet_item` VALUES (19, 1, 2, '7 ', '', 19.00, 10000.00, 5.00, 19, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:39', '');
INSERT INTO `sys_bet_item` VALUES (20, 1, 2, '8 ', '', 17.00, 10000.00, 5.00, 20, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:19:02', '');
INSERT INTO `sys_bet_item` VALUES (21, 1, 2, '9 ', '', 15.00, 9999.99, 5.00, 21, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (22, 1, 2, '10', '', 14.00, 9999.99, 5.00, 22, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (23, 1, 2, '11', '', 13.00, 9999.99, 5.00, 23, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (24, 1, 2, '12', '', 12.00, 9999.99, 5.00, 24, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (25, 1, 2, '13', '', 12.00, 9999.99, 5.00, 25, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (26, 1, 2, '14', '', 12.00, 9999.99, 5.00, 26, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (27, 1, 2, '15', '', 12.00, 9999.99, 5.00, 27, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (28, 1, 2, '16', '', 13.00, 9999.99, 5.00, 28, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (29, 1, 2, '17', '', 14.00, 9999.99, 5.00, 29, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (30, 1, 2, '18', '', 15.00, 9999.99, 5.00, 30, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (31, 1, 2, '19', '', 17.00, 9999.99, 5.00, 31, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (32, 1, 2, '20', '', 19.00, 9999.99, 5.00, 32, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (33, 1, 2, '21', '', 24.00, 9999.99, 5.00, 33, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (34, 1, 2, '22', '', 30.00, 9999.99, 5.00, 34, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (35, 1, 2, '23', '', 38.00, 9999.99, 5.00, 35, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (36, 1, 2, '24', '', 72.00, 9999.99, 5.00, 36, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (37, 1, 2, '25', '', 120.00, 9999.99, 5.00, 37, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (38, 1, 2, '26', '', 188.00, 9999.99, 5.00, 38, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (39, 1, 2, '27', '', 500.00, 9999.99, 2.00, 39, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (40, 1, 3, '红', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 40, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (41, 1, 3, '绿', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 41, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (42, 1, 3, '蓝', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 42, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (43, 1, 3, '龙', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 43, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (44, 1, 3, '虎', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 44, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (45, 1, 3, '合', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 45, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (46, 1, 3, '豹子', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 46, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (47, 1, 3, '对子', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 47, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (48, 1, 3, '顺子', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 48, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (49, 2, 4, '大', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (50, 2, 4, '小', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.01, 9999.99, 2.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (51, 2, 4, '单', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (52, 2, 4, '双', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.00, 9999.99, 5.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (53, 2, 4, '极大', '', 15.00, 500.00, 2.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (54, 2, 4, '大单', '', 4.20, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (55, 2, 4, '小单', 0xE5BC805B31335DE7BB84E59088E5B08FE58D95E999AA5B315DE5808DEFBC8CE5BC80E7BB84E590885B31345DE5A4A7E58F8CE999AA5B315DE5808D, 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (56, 2, 4, '大双', 0xE5BC805B31335DE7BB84E59088E5B08FE58D95E999AA5B315DE5808DEFBC8CE5BC80E7BB84E590885B31345DE5A4A7E58F8CE999AA5B315DE5808D, 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (57, 2, 4, '小双', '', 4.20, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (58, 2, 4, '极小', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (59, 2, 5, '0 ', '', 500.01, 1000.00, 5.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:03:41', '');
INSERT INTO `sys_bet_item` VALUES (60, 2, 5, '1 ', '', 188.00, 9999.99, 5.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:08', '');
INSERT INTO `sys_bet_item` VALUES (61, 2, 5, '2 ', '', 120.00, 1000.00, 5.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:19', '');
INSERT INTO `sys_bet_item` VALUES (62, 2, 5, '3 ', '', 72.00, 1000.00, 5.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:40', '');
INSERT INTO `sys_bet_item` VALUES (63, 2, 5, '4 ', '', 38.00, 1000.00, 5.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:54', '');
INSERT INTO `sys_bet_item` VALUES (64, 2, 5, '5 ', '', 30.00, 1000.00, 5.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:07', '');
INSERT INTO `sys_bet_item` VALUES (65, 2, 5, '6 ', '', 24.00, 1000.00, 5.00, 18, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:24', '');
INSERT INTO `sys_bet_item` VALUES (66, 2, 5, '7 ', '', 19.00, 10000.00, 5.00, 19, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:39', '');
INSERT INTO `sys_bet_item` VALUES (67, 2, 5, '8 ', '', 17.00, 10000.00, 5.00, 20, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:19:02', '');
INSERT INTO `sys_bet_item` VALUES (68, 2, 5, '9 ', '', 15.00, 9999.99, 5.00, 21, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (69, 2, 5, '10', '', 14.00, 9999.99, 5.00, 22, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (70, 2, 5, '11', '', 13.00, 9999.99, 5.00, 23, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (71, 2, 5, '12', '', 12.00, 9999.99, 5.00, 24, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (72, 2, 5, '13', '', 12.00, 9999.99, 5.00, 25, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (73, 2, 5, '14', '', 12.00, 9999.99, 5.00, 26, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (74, 2, 5, '15', '', 12.00, 9999.99, 5.00, 27, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (75, 2, 5, '16', '', 13.00, 9999.99, 5.00, 28, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (76, 2, 5, '17', '', 14.00, 9999.99, 5.00, 29, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (77, 2, 5, '18', '', 15.00, 9999.99, 5.00, 30, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (78, 2, 5, '19', '', 17.00, 9999.99, 5.00, 31, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (79, 2, 5, '20', '', 19.00, 9999.99, 5.00, 32, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (80, 2, 5, '21', '', 24.00, 9999.99, 5.00, 33, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (81, 2, 5, '22', '', 30.00, 9999.99, 5.00, 34, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (82, 2, 5, '23', '', 38.00, 9999.99, 5.00, 35, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (83, 2, 5, '24', '', 72.00, 9999.99, 5.00, 36, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (84, 2, 5, '25', '', 120.00, 9999.99, 5.00, 37, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (85, 2, 5, '26', '', 188.00, 9999.99, 5.00, 38, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (86, 2, 5, '27', '', 500.00, 9999.99, 2.00, 39, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (87, 2, 6, '红', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 40, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (88, 2, 6, '绿', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 41, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (89, 2, 6, '蓝', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 42, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (90, 2, 6, '龙', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 43, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (91, 2, 6, '虎', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 44, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (92, 2, 6, '合', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 45, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (93, 2, 6, '豹子', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 46, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (94, 2, 6, '对子', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 47, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (95, 2, 6, '顺子', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 48, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (96, 9, 7, '大', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.04, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (97, 9, 7, '小', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.01, 9999.99, 2.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (98, 9, 7, '单', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (99, 9, 7, '双', 0xE5BC805B31335D5B31345DE8B5945B312E355DE5808D, 2.00, 9999.99, 5.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (100, 9, 7, '3 ', '', 15.00, 500.00, 2.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (101, 9, 7, '4 ', '', 4.20, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (102, 9, 7, '5 ', '', 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (103, 9, 7, '6 ', '', 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (104, 9, 7, '7 ', '', 4.20, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (105, 9, 7, '8 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (106, 9, 7, '9 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (107, 9, 7, '10', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (108, 9, 7, '11', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (109, 9, 7, '12', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (110, 9, 7, '13', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (111, 9, 7, '14', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (112, 9, 7, '15', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (113, 9, 7, '16', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (114, 9, 7, '17', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (115, 9, 7, '18', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (116, 9, 7, '19', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (117, 9, 8, '大', '', 2.04, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (118, 9, 8, '小', '', 2.01, 9999.99, 2.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (119, 9, 8, '单', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (120, 9, 8, '双', '', 2.00, 9999.99, 5.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (121, 9, 8, '龙', '', 15.00, 500.00, 2.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (122, 9, 8, '虎', '', 4.20, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (123, 9, 8, '1 ', '', 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (124, 9, 8, '2 ', '', 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (125, 9, 8, '3 ', '', 4.20, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (126, 9, 8, '4 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (127, 9, 8, '5 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (128, 9, 8, '6 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (129, 9, 8, '7 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (130, 9, 8, '8 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (131, 9, 8, '9 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (132, 9, 8, '10', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (133, 9, 9, '大', '', 2.04, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (134, 9, 9, '小', '', 2.01, 9999.99, 2.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (135, 9, 9, '单', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (136, 9, 9, '双', '', 2.00, 9999.99, 5.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (137, 9, 9, '龙', '', 15.00, 500.00, 2.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (138, 9, 9, '虎', '', 4.20, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (139, 9, 9, '1 ', '', 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (140, 9, 9, '2 ', '', 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (141, 9, 9, '3 ', '', 4.20, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (142, 9, 9, '4 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (143, 9, 9, '5 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (144, 9, 9, '6 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (145, 9, 9, '7 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (146, 9, 9, '8 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (147, 9, 9, '9 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (148, 9, 9, '10', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (149, 9, 10, '大', '', 2.04, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (150, 9, 10, '小', '', 2.01, 9999.99, 2.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (151, 9, 10, '单', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (152, 9, 10, '双', '', 2.00, 9999.99, 5.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (153, 9, 10, '龙', '', 15.00, 500.00, 2.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (154, 9, 10, '虎', '', 4.20, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (155, 9, 10, '1 ', '', 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (156, 9, 10, '2 ', '', 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (157, 9, 10, '3 ', '', 4.20, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (158, 9, 10, '4 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (159, 9, 10, '5 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (160, 9, 10, '6 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (161, 9, 10, '7 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (162, 9, 10, '8 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (163, 9, 10, '9 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (164, 9, 10, '10', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (165, 9, 11, '大', '', 2.04, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (166, 9, 11, '小', '', 2.01, 9999.99, 2.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (167, 9, 11, '单', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (168, 9, 11, '双', '', 2.00, 9999.99, 5.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (169, 9, 11, '龙', '', 15.00, 500.00, 2.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (170, 9, 11, '虎', '', 4.20, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (171, 9, 11, '1 ', '', 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (172, 9, 11, '2 ', '', 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (173, 9, 11, '3 ', '', 4.20, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (174, 9, 11, '4 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (175, 9, 11, '5 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (176, 9, 11, '6 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (177, 9, 11, '7 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (178, 9, 11, '8 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (179, 9, 11, '9 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (180, 9, 11, '10', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (181, 9, 12, '大', '', 2.04, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (182, 9, 12, '小', '', 2.01, 9999.99, 2.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (183, 9, 12, '单', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (184, 9, 12, '双', '', 2.00, 9999.99, 5.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (185, 9, 12, '龙', '', 15.00, 500.00, 2.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (186, 9, 12, '虎', '', 4.20, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (187, 9, 12, '1 ', '', 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (188, 9, 12, '2 ', '', 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (189, 9, 12, '3 ', '', 4.20, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (190, 9, 12, '4 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (191, 9, 12, '5 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (192, 9, 12, '6 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (193, 9, 12, '7 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (194, 9, 12, '8 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (195, 9, 12, '9 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (196, 9, 12, '10', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (197, 9, 13, '大', '', 2.04, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (198, 9, 13, '小', '', 2.01, 9999.99, 2.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (199, 9, 13, '单', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (200, 9, 13, '双', '', 2.00, 9999.99, 5.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (201, 9, 13, '龙', '', 15.00, 500.00, 2.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (202, 9, 13, '虎', '', 4.20, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (203, 9, 13, '1 ', '', 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (204, 9, 13, '2 ', '', 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (205, 9, 13, '3 ', '', 4.20, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (206, 9, 13, '4 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (207, 9, 13, '5 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (208, 9, 13, '6 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (209, 9, 13, '7 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (210, 9, 13, '8 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (211, 9, 13, '9 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (212, 9, 13, '10', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (213, 9, 14, '大', '', 2.04, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (214, 9, 14, '小', '', 2.01, 9999.99, 2.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (215, 9, 14, '单', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (216, 9, 14, '双', '', 2.00, 9999.99, 5.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (217, 9, 14, '龙', '', 15.00, 500.00, 2.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (218, 9, 14, '虎', '', 4.20, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (219, 9, 14, '1 ', '', 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (220, 9, 14, '2 ', '', 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (221, 9, 14, '3 ', '', 4.20, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (222, 9, 14, '4 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (223, 9, 14, '5 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (224, 9, 14, '6 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (225, 9, 14, '7 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (226, 9, 14, '8 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (227, 9, 14, '9 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (228, 9, 14, '10', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (229, 9, 15, '大', '', 2.04, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (230, 9, 15, '小', '', 2.01, 9999.99, 2.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (231, 9, 15, '单', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (232, 9, 15, '双', '', 2.00, 9999.99, 5.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (233, 9, 15, '龙', '', 15.00, 500.00, 2.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (234, 9, 15, '虎', '', 4.20, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (235, 9, 15, '1 ', '', 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (236, 9, 15, '2 ', '', 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (237, 9, 15, '3 ', '', 4.20, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (238, 9, 15, '4 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (239, 9, 15, '5 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (240, 9, 15, '6 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (241, 9, 15, '7 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (242, 9, 15, '8 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (243, 9, 15, '9 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (244, 9, 15, '10', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (245, 9, 16, '大', '', 2.04, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (246, 9, 16, '小', '', 2.01, 9999.99, 2.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (247, 9, 16, '单', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (248, 9, 16, '双', '', 2.00, 9999.99, 5.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (249, 9, 16, '龙', '', 15.00, 500.00, 2.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (250, 9, 16, '虎', '', 4.20, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (251, 9, 16, '1 ', '', 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (252, 9, 16, '2 ', '', 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (253, 9, 16, '3 ', '', 4.20, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (254, 9, 16, '4 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (255, 9, 16, '5 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (256, 9, 16, '6 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (257, 9, 16, '7 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (258, 9, 16, '8 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (259, 9, 16, '9 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (260, 9, 16, '10', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (261, 9, 17, '大', '', 2.04, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (262, 9, 17, '小', '', 2.01, 9999.99, 2.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (263, 9, 17, '单', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (264, 9, 17, '双', '', 2.00, 9999.99, 5.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (265, 9, 17, '龙', '', 15.00, 500.00, 2.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (266, 9, 17, '虎', '', 4.20, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (267, 9, 17, '1 ', '', 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (268, 9, 17, '2 ', '', 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (269, 9, 17, '3 ', '', 4.20, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (270, 9, 17, '4 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (271, 9, 17, '5 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (272, 9, 17, '6 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (273, 9, 17, '7 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (274, 9, 17, '8 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (275, 9, 17, '9 ', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (276, 9, 17, '10', '', 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (277, 15, 18, '大', '', 2.04, 9999.99, 2.00, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (278, 15, 18, '小', '', 2.01, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (279, 15, 18, '单', '', 2.00, 9999.99, 5.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (280, 15, 18, '双', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (281, 15, 18, '龙', '', 15.00, 500.00, 2.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (282, 15, 18, '虎', '', 4.20, 9999.99, 5.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (283, 15, 18, '和', '', 4.60, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (284, 15, 19, '0 ', '', 2.04, 9999.99, 2.00, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (285, 15, 19, '1 ', '', 2.01, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (286, 15, 19, '2 ', '', 2.00, 9999.99, 5.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (287, 15, 19, '3 ', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (288, 15, 19, '4 ', '', 15.00, 500.00, 2.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (289, 15, 19, '5 ', '', 4.20, 9999.99, 5.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (290, 15, 19, '6 ', '', 4.60, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (291, 15, 19, '7 ', '', 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (292, 15, 19, '8 ', '', 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (293, 15, 19, '9 ', '', 4.60, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (294, 15, 19, '大', '', 4.60, 9999.99, 5.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (295, 15, 19, '小', '', 4.60, 9999.99, 5.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (296, 15, 19, '单', '', 4.60, 9999.99, 5.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (297, 15, 19, '双', '', 4.60, 9999.99, 5.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (298, 15, 20, '0 ', '', 2.04, 9999.99, 2.00, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (299, 15, 20, '1 ', '', 2.01, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (300, 15, 20, '2 ', '', 2.00, 9999.99, 5.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (301, 15, 20, '3 ', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (302, 15, 20, '4 ', '', 15.00, 500.00, 2.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (303, 15, 20, '5 ', '', 4.20, 9999.99, 5.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (304, 15, 20, '6 ', '', 4.60, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (305, 15, 20, '7 ', '', 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (306, 15, 20, '8 ', '', 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (307, 15, 20, '9 ', '', 4.60, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (308, 15, 20, '大', '', 4.60, 9999.99, 5.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (309, 15, 20, '小', '', 4.60, 9999.99, 5.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (310, 15, 20, '单', '', 4.60, 9999.99, 5.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (311, 15, 20, '双', '', 4.60, 9999.99, 5.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (312, 15, 21, '0 ', '', 2.04, 9999.99, 2.00, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (313, 15, 21, '1 ', '', 2.01, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (314, 15, 21, '2 ', '', 2.00, 9999.99, 5.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (315, 15, 21, '3 ', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (316, 15, 21, '4 ', '', 15.00, 500.00, 2.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (317, 15, 21, '5 ', '', 4.20, 9999.99, 5.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (318, 15, 21, '6 ', '', 4.60, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (319, 15, 21, '7 ', '', 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (320, 15, 21, '8 ', '', 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (321, 15, 21, '9 ', '', 4.60, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (322, 15, 21, '大', '', 4.60, 9999.99, 5.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (323, 15, 21, '小', '', 4.60, 9999.99, 5.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (324, 15, 21, '单', '', 4.60, 9999.99, 5.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (325, 15, 21, '双', '', 4.60, 9999.99, 5.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (326, 15, 22, '0 ', '', 2.04, 9999.99, 2.00, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (327, 15, 22, '1 ', '', 2.01, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (328, 15, 22, '2 ', '', 2.00, 9999.99, 5.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (329, 15, 22, '3 ', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (330, 15, 22, '4 ', '', 15.00, 500.00, 2.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (331, 15, 22, '5 ', '', 4.20, 9999.99, 5.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (332, 15, 22, '6 ', '', 4.60, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (333, 15, 22, '7 ', '', 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (334, 15, 22, '8 ', '', 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (335, 15, 22, '9 ', '', 4.60, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (336, 15, 22, '大', '', 4.60, 9999.99, 5.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (337, 15, 22, '小', '', 4.60, 9999.99, 5.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (338, 15, 22, '单', '', 4.60, 9999.99, 5.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (339, 15, 22, '双', '', 4.60, 9999.99, 5.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (340, 15, 23, '0 ', '', 2.04, 9999.99, 2.00, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (341, 15, 23, '1 ', '', 2.01, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (342, 15, 23, '2 ', '', 2.00, 9999.99, 5.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (343, 15, 23, '3 ', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (344, 15, 23, '4 ', '', 15.00, 500.00, 2.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (345, 15, 23, '5 ', '', 4.20, 9999.99, 5.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (346, 15, 23, '6 ', '', 4.60, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (347, 15, 23, '7 ', '', 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (348, 15, 23, '8 ', '', 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (349, 15, 23, '9 ', '', 4.60, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (350, 15, 23, '大', '', 4.60, 9999.99, 5.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (351, 15, 23, '小', '', 4.60, 9999.99, 5.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (352, 15, 23, '单', '', 4.60, 9999.99, 5.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (353, 15, 23, '双', '', 4.60, 9999.99, 5.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (354, 15, 24, '豹', '', 2.04, 9999.99, 2.00, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (355, 15, 24, '对', '', 2.01, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (356, 15, 24, '顺', '', 2.00, 9999.99, 5.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (357, 15, 24, '半', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (358, 15, 24, '杂', '', 15.00, 500.00, 2.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (359, 15, 25, '豹', '', 2.04, 9999.99, 2.00, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (360, 15, 25, '对', '', 2.01, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (361, 15, 25, '顺', '', 2.00, 9999.99, 5.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (362, 15, 25, '半', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (363, 15, 25, '杂', '', 15.00, 500.00, 2.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (364, 15, 26, '豹', '', 2.04, 9999.99, 2.00, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (365, 15, 26, '对', '', 2.01, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (366, 15, 26, '顺', '', 2.00, 9999.99, 5.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (367, 15, 26, '半', '', 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (368, 15, 26, '杂', '', 15.00, 500.00, 2.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');

-- ----------------------------
-- Table structure for sys_bet_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_bet_type`;
CREATE TABLE `sys_bet_type`  (
  `bet_type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '游戏玩法ID',
  `game_id` bigint(20) NOT NULL COMMENT '游戏ID',
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
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_game` VALUES (1, '/profile/upload/2024/03/06/jnd2.0_20240306222925A002.jpg', 3, 'jnd20', '加拿大2.0', '加拿大28', 0xE38090E58AA0E68BBFE5A4A7322E30E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A322E30E5808DEFBC88E5BC8031332F3134E8B594312E35E5808DEFBC89E5B08FE58D952FE5A4A7E58F8CEFBC9A342E36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A342E32E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3135E5808DE38090E789B9E6AE8AE8B594E78E87E38091E4B9B0E5B08FE68896E58D95EFBC8CE5BC80E5A596E4B8BA3133E4B894E8B594EFBC9A312E35E5808DE4B9B0E5A4A7E68896E58F8CEFBC8CE5BC80E5A596E4B8BA3134E4B894E8B594EFBC9A312E35E5808DE4B88BE6B3A8E5B08FE58D95E5BC80E5A596E4B8BA3133E4B8ADE5A596E59B9EE69CAC266E6273703BE4B88BE6B3A8E5A4A7E58F8CE5BC80E5A596E4B8BA3134E4B8ADE5A596E59B9EE69CAC266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E58F8DE58D83E58886E4B98B3135E38091E38090E6999AE4B88A30303A3135E5898DE7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, 'Jnd28', 'jndrecord', 'jnd28', 3.00, NULL, NULL, 0.00, 2.00, 10000.00, 60, 20, NULL, 1, '0', 'N', 0, '', '2024-03-06 22:34:06', '', '2024-03-11 19:19:01', '');
INSERT INTO `sys_game` VALUES (2, '/profile/upload/2024/03/09/jnd28_20240309200723A001.jpg', 3, 'jnd28', '加拿大2.8', '加拿大2.8', 0xE38090E58AA0E68BBFE5A4A7322E38E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A322E38E5808DE5B08FE58D952FE5A4A7E58F8CEFBC9A36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A36E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3136E5808DE5AFB9E5AD902F33266E6273703B20266E6273703BE9A1BAE5AD902F3132266E6273703B20266E6273703BE8B1B9E5AD902F3630266E6273703BE38090E789B9E6AE8AE8B594E78E87E38091E5BC80E695B0E5AD9731332F31342FE5AFB9E5AD902FE9A1BAE5AD902FE8B1B9E5AD902F20E4B8ADE5A596E58D95E6B3A8E7BB84E59088E59B9EE69CAC266E6273703BE695B0E5AD97EFBC8830302F3237EFBC89EFBC9A353230E5808DE695B0E5AD97EFBC8830312F3236EFBC89EFBC9A323430E5808DE695B0E5AD97EFBC8830322F3235EFBC89EFBC9A313230E5808DE695B0E5AD97EFBC8830332F3234EFBC89EFBC9A3732E5808DE695B0E5AD97EFBC8830342F3233EFBC89EFBC9A3438E5808DE695B0E5AD97EFBC8830352F3232EFBC89EFBC9A3330E5808DE695B0E5AD97EFBC8830362F3231EFBC89EFBC9A3234E5808DE695B0E5AD97EFBC8830372F3230EFBC89EFBC9A3139E5808DE695B0E5AD97EFBC8830382F3139EFBC89EFBC9A3137E5808DE695B0E5AD97EFBC8830392F3138EFBC89EFBC9A3135E5808DE695B0E5AD97EFBC8831302F3137EFBC89EFBC9A3134E5808DE695B0E5AD97EFBC8831312F3136EFBC89EFBC9A3133E5808DE695B0E5AD97EFBC8831322F3135EFBC89EFBC9A3132E5808DE695B0E5AD97EFBC8831332F3134EFBC89EFBC9A3132E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E58C85E590ABE69CACE98791EFBC81266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE7BB84E59088EFBC9A3130303030E5B081E9A1B6266E6273703BE69E81E5A4A72FE69E81E5B08FEFBC9A3130303030E5B081E9A1B6266E6273703BE695B0E5AD9730302F3237EFBC9A31303030E5B081E9A1B6E695B0E5AD97312F3236EFBC9A33303030E5B081E9A1B6E5AFB9E9A1BAE5AD90EFBC9A3130303030E5B081E9A1B6E8B1B9E5AD90EFBC9A35303030E5B081E9A1B6E58D95E782B9E695B0E5AD97E69C80E9AB98E8B594E4BB98353030303030E38090E4BA8FE68D9FE58F8DE6B0B4E38091E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3135E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, 'Jnd28_28', 'jnd28bei_record', 'jnd28_28bei', 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 75, 20, NULL, 2, '0', 'N', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:07:58', '');
INSERT INTO `sys_game` VALUES (3, '/profile/upload/2024/03/09/jnd32_20240309200821A002.jpg', 3, 'jnd32', '加拿大3.2', '加拿大3.2', 0xE38090E58AA0E68BBFE5A4A7332E32E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A332E32E5808DE5B08FE58D952FE5A4A7E58F8CEFBC9A362E36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A362E36E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3135E5808DE38090E789B9E6AE8AE8B594E78E87E38091E5A4A7E5B08FE58D95E58F8C20E6ADA3E5B8B8E8B594E78E87332E32E5808DEFBC8CE5BC80E5A596E7BB93E69E9CE98187E5BC80E5A596E58CBAE4B889E4B8AAE695B0E5AD97E585B6E4B8ADE4B880E4B8AAE5B8A630E6889639E4B88EE5BC80E5A596E7BB93E69E9C3133E688963134EFBC8CE4B8ADE5A596E59B9EE69CACE98791E38082E7BB84E59088EFBC8CE6ADA3E5B8B8E8B594E78E87362E36E5808DEFBC8CE5BC80E5A596E7BB93E69E9CE98187E5BC80E5A596E58CBAE4B889E4B8AAE695B0E5AD97E585B6E4B8ADE4B880E4B8AAE5B8A630E6889639E4B88EE5BC80E5A596E7BB93E69E9C3133E688963134EFBC8CE4B8ADE5A596E59B9EE69CACE98791E38082E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B35E38091E38090E6B581E6B0B4E58F8DE58D83E58886E4B98B35E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 15.00, 5.00, 20000.00, 75, 20, NULL, 3, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:08:45', '');
INSERT INTO `sys_game` VALUES (4, '/profile/upload/2024/03/09/jspc28_20240309200907A003.png', 3, 'jspc28', '比特2.0', '比特28', 0xE38090E6BEB3E6B4B2E69E81E9809F322E30E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A322E30E5808DEFBC88E5BC8031332F3134E8B594312E36E5808DEFBC89E5B08FE58D952FE5A4A7E58F8CEFBC9A342E36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A342E32E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3135E5808DE38090E789B9E6AE8AE8B594E78E87E38091E4B9B0E5B08FE68896E58D95EFBC8CE5BC80E5A596E4B8BA3133E4B894E8B594EFBC9A312E36E5808DE4B9B0E5A4A7E68896E58F8CEFBC8CE5BC80E5A596E4B8BA3134E4B894E8B594EFBC9A312E36E5808DE4B88BE6B3A8E5B08FE58D95E5BC80E5A596E4B8BA3133E4B8ADE5A596E59B9EE69CAC266E6273703BE4B88BE6B3A8E5A4A7E58F8CE5BC80E5A596E4B8BA3134E4B8ADE5A596E59B9EE69CAC266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E58F8DE58D83E58886E4B98B3230E38091E38090E6999AE4B88A30303A3135E5898DE7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 10.00, NULL, NULL, 20.00, 2.00, 20000.00, 20, 20, NULL, 4, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:09:59', '');
INSERT INTO `sys_game` VALUES (5, '/profile/upload/2024/03/09/bt28_20240309201046A004.png', 3, 'bt28', '比特2.8', '比特2.8', 0xE38090E6BEB3E6B4B2E69E81E9809F322E38E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A322E38E5808DE5B08FE58D952FE5A4A7E58F8CEFBC9A36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A36E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3135E5808DE5AFB9E5AD902F33266E6273703B20266E6273703BE9A1BAE5AD902F3132266E6273703B20266E6273703BE8B1B9E5AD902F3530266E6273703BE38090E789B9E6AE8AE8B594E78E87E38091E5BC80E695B0E5AD9731332F31342FE5AFB9E5AD902FE9A1BAE5AD902FE8B1B9E5AD902F20E4B8ADE5A596E58D95E6B3A8E7BB84E59088E59B9EE69CAC266E6273703BE695B0E5AD97EFBC8830302F3237EFBC89EFBC9A353030E5808DE695B0E5AD97EFBC8830312F3236EFBC89EFBC9A323430E5808DE695B0E5AD97EFBC8830322F3235EFBC89EFBC9A313230E5808DE695B0E5AD97EFBC8830332F3234EFBC89EFBC9A3732E5808DE695B0E5AD97EFBC8830342F3233EFBC89EFBC9A3438E5808DE695B0E5AD97EFBC8830352F3232EFBC89EFBC9A3333E5808DE695B0E5AD97EFBC8830362F3231EFBC89EFBC9A3235E5808DE695B0E5AD97EFBC8830372F3230EFBC89EFBC9A3230E5808DE695B0E5AD97EFBC8830382F3139EFBC89EFBC9A3137E5808DE695B0E5AD97EFBC8830392F3138EFBC89EFBC9A3135E5808DE695B0E5AD97EFBC8831302F3137EFBC89EFBC9A3134E5808DE695B0E5AD97EFBC8831312F3136EFBC89EFBC9A3134E5808DE695B0E5AD97EFBC8831322F3135EFBC89EFBC9A3133E5808DE695B0E5AD97EFBC8831332F3134EFBC89EFBC9A3132E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E58C85E590ABE69CACE98791EFBC81266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE7BB84E59088EFBC9A3130303030E5B081E9A1B6266E6273703BE69E81E5A4A72FE69E81E5B08FEFBC9A3130303030E5B081E9A1B6266E6273703BE695B0E5AD9730302F3237EFBC9A31303030E5B081E9A1B6E695B0E5AD97312F3236EFBC9A33303030E5B081E9A1B6E5AFB9E9A1BAE5AD90EFBC9A3130303030E5B081E9A1B6E8B1B9E5AD90EFBC9A35303030E5B081E9A1B6E58D95E782B9E695B0E5AD97E69C80E9AB98E8B594E4BB98353030303030E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3135E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 5.00, NULL, NULL, 5.00, 5.00, 50000.00, 20, 20, NULL, 5, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:11:14', '');
INSERT INTO `sys_game` VALUES (6, '/profile/upload/2024/03/09/mssc_20240309201138A005.png', 10, 'mssc', '极速赛车', '极速赛车', 0xE38090E6BEB3E6B4B2E69E81E9809FE8B59BE8BDA6E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E7A68FE588A9E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3135E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 10.00, NULL, NULL, 5.00, 5.00, 50000.00, 20, 20, NULL, 6, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:12:38', '');
INSERT INTO `sys_game` VALUES (7, '/profile/upload/2024/03/09/azxy52_20240309201631A006.jpg', 5, 'azxy52', '澳洲幸运5高赔率', '澳洲幸运5高赔率', 0xE38090E6BEB3E6B4B2E5B9B8E8BF9035266E6273703B392E39E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D302D39E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 100000.00, 70, 20, NULL, 7, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:17:06', '');
INSERT INTO `sys_game` VALUES (8, '/profile/upload/2024/03/09/azxy5_20240309201732A007.jpg', 5, 'azxy5', '澳洲幸运5', '澳洲幸运5', 0xE38090E6BEB3E6B4B2E5B9B8E8BF9035266E6273703B392E39E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D302D39E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, 'Azxy5', 'azxy5record', 'azxy5kj', 0.00, NULL, NULL, 5.00, 5.00, 100000.00, 70, 20, NULL, 8, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:18:04', '');
INSERT INTO `sys_game` VALUES (9, '/profile/upload/2024/03/09/azxy10_20240309201831A008.jpg', 10, 'azxy10', '澳洲幸运10', '澳洲幸运10', 0xE38090E6BEB3E6B4B2E5B9B8E8BF903130266E6273703B20392E39E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, 'Azxy10', 'azxy10record', 'azxy10kj', 0.00, NULL, NULL, 0.00, 5.00, 300000.00, 70, 20, NULL, 9, '0', 'N', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:19:19', '');
INSERT INTO `sys_game` VALUES (10, '/profile/upload/2024/03/09/azxy10_20240309201934A009.jpg', 10, 'azxy102', '澳洲幸运10高赔率', '澳洲幸运10高赔率', 0xE38090E6BEB3E6B4B2E5B9B8E8BF903130266E6273703B20392E39E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 300000.00, 70, 20, NULL, 10, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:20:07', '');
INSERT INTO `sys_game` VALUES (11, '/profile/upload/2024/03/09/xyft_20240309202028A010.jpg', 10, 'xyft', '幸运飞艇', '幸运飞艇', 0xE38090E5B9B8E8BF90E9A39EE88987392E39E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808DEFBC88E590ABE69CACE98791EFBC893130E8BDA6E58FB7EFBC9A392E39E5808DEFBC88E590ABE69CACE98791EFBC89E9BE992FE8998EEFBC9A312E3938E5808DEFBC88E590ABE69CACE98791EFBC89E586A0E4BA9AE5928CE5A4A72FE58F8CEFBC9A322E31E5808DEFBC88E590ABE69CACE98791EFBC89E5B08F2FE58D95EFBC9A312E37E5808DEFBC88E590ABE69CACE98791EFBC89332F342F31382F3139EFBC9AE590ABE69CAC3431E5808D352F362F31362F3137EFBC9AE590ABE69CAC3230E5808D372F382F31342F3135EFBC9AE590ABE69CAC3133E5808D392F31302F31322F3133EFBC9AE590ABE69CAC39E5808D3131EFBC9AE590ABE69CAC37E5808D317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E2062722FE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 110, 20, NULL, 11, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:20:59', '');
INSERT INTO `sys_game` VALUES (12, '/profile/upload/2024/03/09/jssc_20240309202124A011.jpg', 10, 'jssc', '168极速赛车', '168极速赛车', 0xE38090E69E81E9809FE8B59BE8BDA6392E39E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4BA8FE68D9FE697A0E58F8DE6B0B4E38091E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3030E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, 'Jssc', 'jsscrecord', 'jssc10', 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 35, 20, NULL, 12, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:21:54', '');
INSERT INTO `sys_game` VALUES (13, '/profile/upload/2024/03/09/jsft_20240309202548A012.jpg', 10, 'jsft', '168极速飞艇', '168极速飞艇', 0xE38090E69E81E9809FE9A39EE88987E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3030E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, 'Jsfei', 'jsfeirecord', 'jsfei10', 0.00, NULL, NULL, 5.00, 5.00, 50000.00, 5, 20, NULL, 13, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:26:22', '');
INSERT INTO `sys_game` VALUES (14, '/profile/upload/2024/03/09/jssc2_20240309202640A013.jpg', 10, 'jssc2', '168极速赛车高赔率', '168极速赛车高赔率', 0xE38090E69E81E9809FE8B59BE8BDA6392E39E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4BA8FE68D9FE697A0E58F8DE6B0B4E38091E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3030E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, NULL, NULL, 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 35, 20, NULL, 14, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:27:07', '');
INSERT INTO `sys_game` VALUES (15, '/profile/upload/2024/03/09/jsssc_20240309202724A014.jpg', 5, 'jsssc', '168极速时时彩', '168极速时时彩', 0xE38090E69E81E9809FE697B6E697B6E5BDA9E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D302D39E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4BA8FE68D9FE697A0E58F8DE6B0B4E38091E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3030E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, 'Jsssc', 'jssscrecord', 'jsssckj', 0.00, NULL, NULL, 5.00, 5.00, 100000.00, 35, 30, NULL, 15, '0', 'N', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:27:57', '');
INSERT INTO `sys_game` VALUES (16, '/profile/upload/2024/03/09/xyft2_20240309202820A015.jpg', 10, 'xyft2', '幸运飞艇高赔率', '幸运飞艇高赔率', 0xE38090E5B9B8E8BF90E9A39EE88987392E39E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808DEFBC88E590ABE69CACE98791EFBC893130E8BDA6E58FB7EFBC9A392E39E5808DEFBC88E590ABE69CACE98791EFBC89E9BE992FE8998EEFBC9A312E3938E5808DEFBC88E590ABE69CACE98791EFBC89E586A0E4BA9AE5928CE5A4A72FE58F8CEFBC9A322E31E5808DEFBC88E590ABE69CACE98791EFBC89E5B08F2FE58D95EFBC9A312E37E5808DEFBC88E590ABE69CACE98791EFBC89332F342F31382F3139EFBC9AE590ABE69CAC3431E5808D352F362F31362F3137EFBC9AE590ABE69CAC3230E5808D372F382F31342F3135EFBC9AE590ABE69CAC3133E5808D392F31302F31322F3133EFBC9AE590ABE69CAC39E5808D3131EFBC9AE590ABE69CAC37E5808D317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E2062722FE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, 'Fei', 'feirecord', 'fei10', 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 110, 20, NULL, 16, '1', 'Y', 0, '', '2024-03-06 22:34:06', '', '2024-03-09 20:28:48', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2021 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 261 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_oper_log` VALUES (224, '游戏', 2, 'com.ruoyi.web.controller.system.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":60,\"gameAliasName\":\"加拿大281\",\"gameCashback\":0,\"gameCommission\":3,\"gameDescribe\":\"【加拿大2.0赔率说明】大/小/单/双：2.0倍（开13/14赔1.5倍）小单/大双：4.6倍小双/大单：4.2倍极大/极小：15倍【特殊赔率】买小或单，开奖为13且赔：1.5倍买大或双，开奖为14且赔：1.5倍下注小单开奖为13中奖回本&nbsp;下注大双开奖为14中奖回本&nbsp;以上所有赔率都包含本金！【上级佣金千分之3】【流水反千分之15】【晚上00:15前系统自动反入账单，个人帐变记录查询】\",\"gameId\":1,\"gameImg\":\"/profile/upload/2024/03/06/jnd2.0_20240306222925A002.jpg\",\"gameMarkId\":\"jnd20\",\"gameName\":\"加拿大2.0\",\"gameType\":3,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":10000,\"minBetAmount\":2,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-11 19:18:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-11 19:18:14', 21);
INSERT INTO `sys_oper_log` VALUES (225, '游戏', 2, 'com.ruoyi.web.controller.system.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":60,\"gameAliasName\":\"加拿大28\",\"gameCashback\":0,\"gameCommission\":3,\"gameDescribe\":\"【加拿大2.0赔率说明】大/小/单/双：2.0倍（开13/14赔1.5倍）小单/大双：4.6倍小双/大单：4.2倍极大/极小：15倍【特殊赔率】买小或单，开奖为13且赔：1.5倍买大或双，开奖为14且赔：1.5倍下注小单开奖为13中奖回本&nbsp;下注大双开奖为14中奖回本&nbsp;以上所有赔率都包含本金！【上级佣金千分之3】【流水反千分之15】【晚上00:15前系统自动反入账单，个人帐变记录查询】\",\"gameId\":1,\"gameImg\":\"/profile/upload/2024/03/06/jnd2.0_20240306222925A002.jpg\",\"gameMarkId\":\"jnd20\",\"gameName\":\"加拿大2.0\",\"gameType\":3,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":10000,\"minBetAmount\":2,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-11 19:18:42\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-11 19:18:42', 6);
INSERT INTO `sys_oper_log` VALUES (226, '游戏', 2, 'com.ruoyi.web.controller.system.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":60,\"gameAliasName\":\"加拿大28\",\"gameCashback\":0,\"gameCommission\":3,\"gameDescribe\":\"【加拿大2.0赔率说明】大/小/单/双：2.0倍（开13/14赔1.5倍）小单/大双：4.6倍小双/大单：4.2倍极大/极小：15倍【特殊赔率】买小或单，开奖为13且赔：1.5倍买大或双，开奖为14且赔：1.5倍下注小单开奖为13中奖回本&nbsp;下注大双开奖为14中奖回本&nbsp;以上所有赔率都包含本金！【上级佣金千分之3】【流水反千分之15】【晚上00:15前系统自动反入账单，个人帐变记录查询】\",\"gameId\":1,\"gameImg\":\"/profile/upload/2024/03/06/jnd2.0_20240306222925A002.jpg\",\"gameMarkId\":\"jnd20\",\"gameName\":\"加拿大2.0\",\"gameType\":3,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":10000,\"minBetAmount\":2,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-11 19:18:50\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-11 19:18:50', 6);
INSERT INTO `sys_oper_log` VALUES (227, '游戏', 2, 'com.ruoyi.web.controller.system.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":60,\"gameAliasName\":\"加拿大281\",\"gameCashback\":0,\"gameCommission\":3,\"gameDescribe\":\"【加拿大2.0赔率说明】大/小/单/双：2.0倍（开13/14赔1.5倍）小单/大双：4.6倍小双/大单：4.2倍极大/极小：15倍【特殊赔率】买小或单，开奖为13且赔：1.5倍买大或双，开奖为14且赔：1.5倍下注小单开奖为13中奖回本&nbsp;下注大双开奖为14中奖回本&nbsp;以上所有赔率都包含本金！【上级佣金千分之3】【流水反千分之15】【晚上00:15前系统自动反入账单，个人帐变记录查询】\",\"gameId\":1,\"gameImg\":\"/profile/upload/2024/03/06/jnd2.0_20240306222925A002.jpg\",\"gameMarkId\":\"jnd20\",\"gameName\":\"加拿大2.0\",\"gameType\":3,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":10000,\"minBetAmount\":2,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-11 19:18:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-11 19:18:56', 6);
INSERT INTO `sys_oper_log` VALUES (228, '游戏', 2, 'com.ruoyi.web.controller.system.SysGameController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/game', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-06 22:34:06\",\"endTime\":60,\"gameAliasName\":\"加拿大28\",\"gameCashback\":0,\"gameCommission\":3,\"gameDescribe\":\"【加拿大2.0赔率说明】大/小/单/双：2.0倍（开13/14赔1.5倍）小单/大双：4.6倍小双/大单：4.2倍极大/极小：15倍【特殊赔率】买小或单，开奖为13且赔：1.5倍买大或双，开奖为14且赔：1.5倍下注小单开奖为13中奖回本&nbsp;下注大双开奖为14中奖回本&nbsp;以上所有赔率都包含本金！【上级佣金千分之3】【流水反千分之15】【晚上00:15前系统自动反入账单，个人帐变记录查询】\",\"gameId\":1,\"gameImg\":\"/profile/upload/2024/03/06/jnd2.0_20240306222925A002.jpg\",\"gameMarkId\":\"jnd20\",\"gameName\":\"加拿大2.0\",\"gameType\":3,\"houseOpen\":0,\"isHidden\":\"N\",\"maxBetAmount\":10000,\"minBetAmount\":2,\"params\":{},\"remark\":\"\",\"robotRate\":20,\"sort\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2024-03-11 19:19:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-11 19:19:01', 7);
INSERT INTO `sys_oper_log` VALUES (229, '游戏玩法', 1, 'com.ruoyi.web.controller.system.SysBetTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/betType', '127.0.0.1', '内网IP', '{\"betTypeId\":7,\"betTypeName\":\"冠亚和值\",\"createTime\":\"2024-03-16 20:38:37\",\"gameId\":9,\"params\":{},\"sort\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-16 20:38:37', 23);
INSERT INTO `sys_oper_log` VALUES (230, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"azxy10,azxy10kj,azxy10record,jsssc,jssscrecord,jsssckj,jnd,jnd28,jndrecord,betrecord\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 16:40:35', 718);
INSERT INTO `sys_oper_log` VALUES (231, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"azxy10,azxy10kj,azxy10record,betrecord,jnd,jnd28,jndrecord,jsssc,jsssckj,jssscrecord\"}', NULL, 0, NULL, '2024-03-17 16:42:45', 1448);
INSERT INTO `sys_oper_log` VALUES (232, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 17:15:55', 13);
INSERT INTO `sys_oper_log` VALUES (233, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"false_user,bet_record\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 17:16:48', 52);
INSERT INTO `sys_oper_log` VALUES (234, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"falseUser\",\"className\":\"FalseUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":707,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 17:16:48\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"机器人昵称\",\"columnId\":708,\"columnName\":\"user_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 17:16:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"User\",\"columnComment\":\"机器人账号\",\"columnId\":709,\"columnName\":\"user\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 17:16:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"user\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RobotPic\",\"columnComment\":\"机器人头像\",\"columnId\":710,\"columnName\":\"robot_pic\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 17:16:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"robotPic\",\"ja', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 17:17:03', 27);
INSERT INTO `sys_oper_log` VALUES (235, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"betRecord\",\"className\":\"BetRecord\",\"columns\":[{\"capJavaField\":\"BetId\",\"columnComment\":\"投注单ID\",\"columnId\":680,\"columnName\":\"bet_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 17:16:48\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"betId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":681,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 17:16:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Periods\",\"columnComment\":\"期数\",\"columnId\":682,\"columnName\":\"periods\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 17:16:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"periods\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecordTime\",\"columnComment\":\"投注时间\",\"columnId\":683,\"columnName\":\"record_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 17:16:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 17:17:13', 36);
INSERT INTO `sys_oper_log` VALUES (236, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"false_user,bet_record,jssscrecord,jsssckj,jsssc,jndrecord,jnd28,jnd,azxy10record,azxy10kj,azxy10\"}', NULL, 0, NULL, '2024-03-17 17:17:30', 1317);
INSERT INTO `sys_oper_log` VALUES (237, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"false_user,bet_record,jssscrecord,jsssckj,jsssc,jndrecord,jnd28,jnd,azxy10record,azxy10kj,azxy10\"}', NULL, 0, NULL, '2024-03-17 17:21:45', 1304);
INSERT INTO `sys_oper_log` VALUES (238, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"false_user,bet_record,jssscrecord,jsssckj,jsssc,jndrecord,jnd28,jnd,azxy10record,azxy10kj,azxy10\"}', NULL, 0, NULL, '2024-03-17 17:22:43', 1349);
INSERT INTO `sys_oper_log` VALUES (239, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"falseUser\",\"className\":\"FalseUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":707,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 17:16:48\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"updateTime\":\"2024-03-17 17:17:03\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"机器人昵称\",\"columnId\":708,\"columnName\":\"user_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 17:16:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"updateTime\":\"2024-03-17 17:17:03\",\"usableColumn\":false},{\"capJavaField\":\"User\",\"columnComment\":\"机器人账号\",\"columnId\":709,\"columnName\":\"user\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 17:16:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"user\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"updateTime\":\"2024-03-17 17:17:03\",\"usableColumn\":false},{\"capJavaField\":\"RobotPic\",\"columnComment\":\"机器人头像\",\"columnId\":710,\"columnName\":\"robot_pic\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 17:16:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 18:35:45', 25);
INSERT INTO `sys_oper_log` VALUES (240, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"false_user\"}', NULL, 0, NULL, '2024-03-17 18:35:50', 64);
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/falseUser/index\",\"createTime\":\"2024-03-17 18:39:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"投注机器人\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":1,\"path\":\"falseUser\",\"perms\":\"system:falseUser:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 18:41:04', 14);
INSERT INTO `sys_oper_log` VALUES (242, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/13', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 18:44:09', 16);
INSERT INTO `sys_oper_log` VALUES (243, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"jndrecord\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 18:44:13', 113);
INSERT INTO `sys_oper_log` VALUES (244, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"jndrecord\"}', NULL, 0, NULL, '2024-03-17 18:44:27', 204);
INSERT INTO `sys_oper_log` VALUES (245, '投注机器人', 2, 'com.ruoyi.system.controller.FalseUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/falseUser', '127.0.0.1', '内网IP', '{\"gameId\":1,\"groupId\":4,\"id\":232,\"params\":{},\"playType\":0,\"robotBetMoney\":\"1088|1500|2000|1800|2500|280|290|2800|2900\",\"robotBetNum\":\"大|小|单|双|大双|大单|小单|小双|豹子|12\",\"robotBetTime\":\"5\",\"robotPic\":\"/profile/upload/2024/03/17/20231121003517_20240317185234A001.jpg\",\"updateTime\":\"2024-03-17 18:52:36\",\"user\":\"pc001\",\"userName\":\"疯狂\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'robot_pic\' at row 1\r\n### The error may exist in file [D:\\project\\sharkpay\\ruoyi-system\\target\\classes\\mapper\\system\\FalseUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FalseUserMapper.updateFalseUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update false_user          SET user_name = ?,             user = ?,             robot_pic = ?,             robot_bet_money = ?,             robot_bet_num = ?,             robot_bet_time = ?,             game_id = ?,             group_id = ?,             play_type = ?,                                                    update_time = ?          where id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'robot_pic\' at row 1\n; Data truncation: Data too long for column \'robot_pic\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'robot_pic\' at row 1', '2024-03-17 18:52:37', 42);
INSERT INTO `sys_oper_log` VALUES (246, '投注机器人', 2, 'com.ruoyi.system.controller.FalseUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/falseUser', '127.0.0.1', '内网IP', '{\"gameId\":1,\"groupId\":4,\"id\":232,\"params\":{},\"playType\":0,\"robotBetMoney\":\"1088|1500|2000|1800|2500|280|290|2800|2900\",\"robotBetNum\":\"大|小|单|双|大双|大单|小单|小双|豹子|12\",\"robotBetTime\":\"5\",\"robotPic\":\"/profile/upload/2024/03/17/20231121003517_20240317185234A001.jpg\",\"updateTime\":\"2024-03-17 18:52:51\",\"user\":\"pc001\",\"userName\":\"疯狂\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 18:52:51', 5);
INSERT INTO `sys_oper_log` VALUES (247, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/falseUser/index\",\"createTime\":\"2024-03-17 18:39:55\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"投注机器人\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":1,\"path\":\"falseUser\",\"perms\":\"system:falseUser:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 19:18:18', 20);
INSERT INTO `sys_oper_log` VALUES (248, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_replace\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 19:25:55', 51);
INSERT INTO `sys_oper_log` VALUES (249, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/20', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 19:27:31', 14);
INSERT INTO `sys_oper_log` VALUES (250, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_replace\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 19:27:35', 20);
INSERT INTO `sys_oper_log` VALUES (251, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"轮播图状态\",\"dictType\":\"sys_replace_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 19:28:42', 8);
INSERT INTO `sys_oper_log` VALUES (252, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"正常\",\"dictSort\":1,\"dictType\":\"sys_replace_status\",\"dictValue\":\"0\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 19:29:07', 10);
INSERT INTO `sys_oper_log` VALUES (253, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"停用\",\"dictSort\":2,\"dictType\":\"sys_replace_status\",\"dictValue\":\"1\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 19:29:18', 10);
INSERT INTO `sys_oper_log` VALUES (254, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"replace\",\"className\":\"SysReplace\",\"columns\":[{\"capJavaField\":\"ReplaceId\",\"columnComment\":\"广告轮播图ID\",\"columnId\":800,\"columnName\":\"replace_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 19:27:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"replaceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":21,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ReplacePic\",\"columnComment\":\"广告轮播图图片\",\"columnId\":801,\"columnName\":\"replace_pic\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 19:27:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"replacePic\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":21,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"广告轮播图状态（0正常 1停用）\",\"columnId\":802,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 19:27:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"status\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":21,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":803,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 19:27:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 19:29:32', 20);
INSERT INTO `sys_oper_log` VALUES (255, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"replace\",\"className\":\"SysReplace\",\"columns\":[{\"capJavaField\":\"ReplaceId\",\"columnComment\":\"广告轮播图ID\",\"columnId\":800,\"columnName\":\"replace_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 19:27:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"replaceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":21,\"updateBy\":\"\",\"updateTime\":\"2024-03-17 19:29:32\",\"usableColumn\":false},{\"capJavaField\":\"ReplacePic\",\"columnComment\":\"广告轮播图图片\",\"columnId\":801,\"columnName\":\"replace_pic\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 19:27:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"replacePic\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":21,\"updateBy\":\"\",\"updateTime\":\"2024-03-17 19:29:32\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"广告轮播图状态（0正常 1停用）\",\"columnId\":802,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 19:27:35\",\"dictType\":\"sys_replace_status\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"status\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":21,\"updateBy\":\"\",\"updateTime\":\"2024-03-17 19:29:32\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":803,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-17 19:27:35\",\"dictType\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 19:29:47', 22);
INSERT INTO `sys_oper_log` VALUES (256, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_replace\"}', NULL, 0, NULL, '2024-03-17 19:29:50', 146);
INSERT INTO `sys_oper_log` VALUES (257, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/replace/index\",\"createTime\":\"2024-03-17 19:30:19\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"广告轮播图\",\"menuType\":\"C\",\"orderNum\":11,\"params\":{},\"parentId\":1,\"path\":\"replace\",\"perms\":\"system:replace:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 19:32:51', 25);
INSERT INTO `sys_oper_log` VALUES (258, '广告轮播图', 1, 'com.ruoyi.system.controller.SysReplaceController.add()', 'POST', 1, 'admin', '研发部门', '/system/replace', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-17 19:36:11\",\"params\":{},\"replaceId\":1,\"replacePic\":\"/profile/upload/2024/03/17/61c77275304d0_20240317193610A001.png\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 19:36:11', 11);
INSERT INTO `sys_oper_log` VALUES (259, '广告轮播图', 1, 'com.ruoyi.system.controller.SysReplaceController.add()', 'POST', 1, 'admin', '研发部门', '/system/replace', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-17 19:36:16\",\"params\":{},\"replaceId\":2,\"replacePic\":\"/profile/upload/2024/03/17/61c6efb753fa0_20240317193615A002.jpg\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 19:36:16', 5);
INSERT INTO `sys_oper_log` VALUES (260, '广告轮播图', 1, 'com.ruoyi.system.controller.SysReplaceController.add()', 'POST', 1, 'admin', '研发部门', '/system/replace', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-17 19:36:20\",\"params\":{},\"replaceId\":3,\"replacePic\":\"/profile/upload/2024/03/17/61c6efac98f1e_20240317193619A003.jpg\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 19:36:20', 7);

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
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-03-17 16:40:02', 'admin', '2024-03-05 21:03:10', '', '2024-03-17 16:40:02', '管理员');
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
