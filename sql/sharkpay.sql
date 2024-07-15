/*
 Navicat Premium Data Transfer

 Source Server         : localhost(sharkpay_bak)
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26)
 Source Host           : localhost:3306
 Source Schema         : sharkpay_bak

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26)
 File Encoding         : 65001

 Date: 15/07/2024 22:30:51
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
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员盈亏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adminwin
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
  `money` float(11, 2) UNSIGNED NOT NULL COMMENT '投注金额',
  `balance` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '投注后用户余额',
  `account_result` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '输赢结果',
  `settle_flg` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '结算区分（0未结算 1已结算）',
  `game_result` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '开奖结果',
  `is_delete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否删除(0否 1是)',
  `is_robot` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否机器人下注',
  `robot_nick_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机器人下注昵称',
  `robot_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机器人下注头像',
  `robot_img` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机器人下注图片',
  `house_id` int(11) NOT NULL DEFAULT 1 COMMENT '房间号',
  `record_lottery_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投注结算Key',
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
) ENGINE = InnoDB AUTO_INCREMENT = 197562 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投注单' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `false_user` VALUES (232, '疯狂', 'pc001', '/profile/upload/2024/03/17/20231121003517_20240317185234A001.jpg', '1088|1500|2000|1800|2500|280|290|2800|2900', '大|小|单|双|大双|大单|小单|小双|豹子|12', '5', 2, 4, 0, NULL, NULL, NULL, '2024-03-17 18:52:52', NULL);
INSERT INTO `false_user` VALUES (233, 'MISS', 'a1', '/profile/upload/user/61c6ffe59e065.png', '5000|6000|8000|10000|12000|12500', '大单|大|大双|小单|小双|小|12|15', '5', 2, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (234, '传仁', 'a2', '/profile/upload/user/61c6ffd621405.png', '100|200|300|500|1000|1500|1800|1900|2000|2500|3000', '大|小|单|双|大双|小双|小单|大单', '5', 2, 4, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (235, '只是。。。。', 'a3', '/profile/upload/user/61c6ffc13f50e.png', '5000|6000|8000|10000|12000|12500', '大|小|单|双|大单|大双|小单|小双', '5', 2, 4, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (236, '贷款找我', 'a4', '/profile/upload/user/61c6fe0e22eda.png', '1000|1500|1800|1900|2000|2500|3000', '大|小|单|双|大单|大双|小单|小双', '5', 2, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (237, '一颗颗', 'a5', '/profile/upload/user/61c6fdf2ee58b.png', '1000|1500|1800|1900|2000|2500|3000', '小|单|双|大|大单|大双|小单|小双', '5', 2, 3, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (240, '湖广会馆', 'a8', '/profile/upload/user/61c6fde19a091.png', '100|200|300|500|1000|2000', '大|小|单|双|大单|大双|小单|小双', '5', 2, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (241, '汉库克', 'a9', '/profile/upload/user/61c6fdd1048d5.png', '1000|2000|3000', '大|小|单|双|大单|小双|', '5', 2, 4, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (242, 'LOL', 's1', '/profile/upload/user/60560725ed40c.jpeg', '1500|2000|1800|2500|280|290|2800|2900|3000|3500|4000', '大双|小单|小双|大单|大|小|单|双', '5', 2, 6, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (243, '快乐过', 's2', '/profile/upload/user/61c6fdbfde965.png', '5000|2000|3000|8000', '大|小|单| 双|大单|小双|大双|小单', '5', 2, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (244, '网贷秒出款', 's3', '/profile/upload/user/61c6fdacee297.png', '1088|1500|2000|1800|2500|280|290|2800|2900', '大|小|单|双|10|12|11|13|14', '5', 2, 6, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (246, '地毯18659596269', 's4', '/profile/upload/user/61c6fd9444338.png', '5000|10000|12000|15000|20000|15000|18000', '大|小|单|双|大双|大单', '5', 2, 6, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (247, '豪迪有限公司', 's5', '/profile/upload/user/61c6fd73ed6ee.png', '5000|10000|12000|15000|20000', '大双|小单|大单|小双', '5', 2, 7, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (248, '可欧非', 's6', '/profile/upload/user/61c6fd614c930.png', '1500|2000|1800|2500|280|290|2800|2900|3000|3500|4000', '大|小|单|双|大双|小单|大单|小双', '5', 2, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (249, '知足常', 's7', '/profile/upload/user/61c6fd54e073e.png', '2000|3000|4000|5000|4500|6000|6500', '大|小|单|双|绿|蓝|红|大双|大单|小单|小双', '5', 2, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (252, '未秀达', 's8', '/profile/upload/user/61c6fd45c6b84.png', '100|200|500|800|66|88|100|50|120|150|180|200|288|300|500|688', '大|小|单|双|豹子|13|14|龙|虎|合|绿|蓝|红|大双|大单|小单|小双', '5', 2, 2, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (254, '通过', 's9', '/profile/upload/user/61c6fd3534024.png', '500|1000|2000|66|88|100|50|120|150|180|200|288|300|500|688', '大|小|单|双|豹子|13|14|龙|虎|合|绿|蓝|红|大双|大单|小单|小双', '5', 2, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (255, '美人机', 'd1', '/profile/upload/user/61c6fd2834bfb.png', '200|500|800|600|700|150|1500|1800|2000|2500|2800|3300|3200', '大|小|单|双||豹子|13|14|龙|虎|合|绿|蓝|红|大双|大单|小单|小双', '5', 2, 3, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (256, '辉哥ll', 'd2', '/profile/upload/user/61c6fd1b4e7fe.png', '500|300|380|450|600|1200|3000|2500|3600|4000', '大|小|单|双|大双|大单|小单', '5', 2, 3, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (257, '王子金', 'ads1', '/profile/upload/user/61c6fd0ed93a4.png', '100|200|300|400|500|600|700|800', '1|2|3|4|5|6|7|8|9|10', '5', 11, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (259, '品牌加', 'asd1', '/profile/upload/user/61c6fd0231eda.png', '100|200|500|800|600|120|110|1000|1200', '1|2|3|4|5|6|7|8|9|10', '5', 11, 5, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (260, '85发', 'ds1', '/profile/upload/user/61c6fcf364253.png', '50|100|80|99|128|168|200|220|250|300|400', '1|2|3|4|5|6|7|8|9|10', '5', 11, 3, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (261, '长安jj', 'a123', '/profile/upload/user/61c6fce491345.png', '1000|2000|3000|5000', '1|2|3|4|5|6|7|8|9|10', '5', 11, 6, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (262, '阿里看到', 'dsf1', '/profile/upload/user/61c6fcd91f72b.png', '66|88|100|50|120|150|180|200|288|300|500|688', '3|4|5|6|7|8', '5', 9, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (264, '美好好', 'zxc123', '/profile/upload/user/605607637879e.jpeg', '100|200|300|400|500|600|700|800|900|1000', '大|小|双|单|大单|大双|小单|小双', '5', 2, 2, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (266, '水产品招商', 'q1', '/profile/upload/user/61c6fcc454284.png', '2000|3000|5000', '1|2|3|4|5|6|7|8|9|10', '5', 11, 5, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (267, '北冰洋', 'q2', '/profile/upload/user/61c6fb113bdf9.png', '200|300|500|600|1000|800|900|1200|1300', '1|2|3|4|5|6|7|8|9|10', '5', 11, 3, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (268, '胡一好', 'q3', '/profile/upload/user/61c6fafaf0884.png', '1500|2000|1800|2500|280|290|2800|2900|3000|3500|4000', '1|2|3|4|5|6|7|8|9|10', '5', 11, 3, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (269, '继续会', 'q5', '/profile/upload/user/61c6faeed4d8d.png', '200|300|500|100|400|450|600|700', '1|2|3|4|5|6|7|8|9|10', '5', 11, 3, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (270, '卜卜贝', 'q6', '/profile/upload/user/61c6fae098fae.png', '66|88|100|50|120|150|180|200|288|300|500|688', '1|2|3|4|5|6|7|8|9|10', '5', 11, 3, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (271, '高规格', 'q8', '/profile/upload/user/61c6fad484d35.png', '10|50|30|80|100|200|88|150|180', '大|小|单|双|对子|顺子|豹子|13|14|龙|虎|合|绿|蓝|红|大双|大单|小单|小双', '5', 2, 4, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (272, '关二爷', 'q9', '/profile/upload/user/61c6fac4b5a04.png', '1000|2000|3000|1500|2500|3200|3500|3800|4000', '大|小|单|双|豹子|13|14|龙|虎|合|绿|蓝|红|大双|大单|小单|小双', '5', 2, 4, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (273, '不要推塔', 'w1', '/profile/upload/user/61c6fa9148503.png', '1000|2000|3000|5000', '大|小|单|双|豹子|13|14|龙|虎|合|绿|蓝|红|大双|大单|小单|小双', '5', 2, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (274, '欧啦放', 'w3', '/profile/upload/user/61c6fa85f3216.png', '100|200|300|500|600|700|800|900|1000|1200', '大|小|单|双|豹子|13|14|龙|虎|合|绿|蓝|红|大双|大单|小单|小双', '5', 2, 3, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (275, '记忆中', 'w4', '/profile/upload/user/6056058331151.jpeg', '100|200|50|120|88|300|400|380|500|600|', '大|小|单|双|豹子|13|14|龙|虎|合|绿|蓝|红|大双|大单|小单|小双', '5', 2, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (276, '育德急', 'w6', '/profile/upload/user/61c6fa7714726.png', '1500|2000|1800|2500|280|290|2800|2900|3000|3500|4000', '大|小|单|双|大双|大单|小单|小双', '5', 2, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (277, '漂亮了', 'w4', '/profile/upload/user/61c6fa6b8ebc8.png', '10|50|100|200|300', '大|小|单|双|1|2|3|4|5|6|7|8|9|10', '5', 11, 2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (278, '解放军', 'shuaishuai', '/profile/upload/user/61c6fa61e3c67.png', '50|20|30|10|60|66|88|68|100|1000|120|100|10|12|12|120|200|500|600', '1|2|3|4|5|6|7|8|9|10|大|双', '5', 11, 5, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (282, '寂寞的也', 'woshi94', '/profile/upload/user/61c6fa53f38a6.png', '50|100|60|1000|800|10|20|200|500|300|600|400|88|80|120|250|5000|2000|3333|3000', '1|2|3|4|5|6|7|8|9|10|小|双', '5', 11, 4, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (283, '车返点', 'yeyeyey', '/profile/upload/user/61c6fa491c9a1.png', '50|100|60|1000|800|10|20|200|500|300|600|400|88|80|120|250', '1|2|3|4|5|6|7|8|9|10', '5', 11, 3, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (287, '大宝贝', 'qqweryhh988', '/profile/upload/user/61c6fa38b7f52.png', '400|500|600|700|800|1000|1200|1400|1500|1600|1800|2000|2500', '大单|大双|小单|小双|大|小|单|双', '5', 2, 4, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (288, '辉煌国际', 'qqweryhh98800', '/profile/upload/user/61c6fa224371e.png', '450|500|800|900|300|700|688|1200|1100|1500|1800', '大|小|单|双|大|大双|小|小单|单|大单|双|小双', '5', 2, 3, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (289, '有几个看过', 'qqweryhh98866', '/profile/upload/user/61c6fa11d76d2.png', '100|200|300|400|500|600|700|800|900|1000', '大|小|单|双|大双|小单|大单|小双', '5', 2, 3, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (293, '煤化工', 'qqweryhh99955', '/profile/upload/user/61c6fa0845792.png', '100|200|300|400|500|600|700|800|900|1000', '大单|大|大双|小单|小双|小|12|15', '5', 2, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (294, '快乐规范', 'qqweryhh9886611', '/profile/upload/user/61c6f9fa392ac.png', '2000|3000|4000|5000|4500|6000|6500', '大|大单|单|大|双|大|大双|小单|双|双|小单|单|双|大', '5', 2, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (295, '健康卡', 'qqweryhh9882222', '/profile/upload/user/61c6f76d1c0e4.png', '2000|3000|4000|5000|4500|6000|6500', '大|大单|小|小双|双|大双|小单|小双|大双|小双|大单|小单', '5', 2, 5, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `false_user` VALUES (296, '万事不', 'qqweryhh988662222', '/profile/upload/user/61c6f76092de8.png', '100|200|300|400|500|600|700|800|900|1000', '大|大单|大|大双|大双|双|单|小单|小双|小|12|15', '5', 2, 4, 0, NULL, NULL, NULL, NULL, NULL);
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
-- Table structure for game_fiveball_kj
-- ----------------------------
DROP TABLE IF EXISTS `game_fiveball_kj`;
CREATE TABLE `game_fiveball_kj`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '5球开奖历史ID',
  `periods` bigint(20) NOT NULL COMMENT '期数',
  `game_id` bigint(20) NOT NULL COMMENT '游戏ID',
  `game_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏名',
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
  INDEX `Id_2`(`id`, `status`, `game_id`) USING BTREE,
  INDEX `periods`(`periods`, `game_id`) USING BTREE,
  INDEX `status`(`periods`, `status`, `game_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71026 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '5球开奖表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of game_fiveball_kj
-- ----------------------------

-- ----------------------------
-- Table structure for game_fiveball_open_data
-- ----------------------------
DROP TABLE IF EXISTS `game_fiveball_open_data`;
CREATE TABLE `game_fiveball_open_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '5球开奖历史ID',
  `periods` bigint(20) NOT NULL COMMENT '期数',
  `game_id` bigint(20) NOT NULL COMMENT '游戏ID',
  `game_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏名',
  `time` datetime NULL DEFAULT NULL COMMENT '开奖时间',
  `num1` int(11) NULL DEFAULT NULL COMMENT '开奖号码1',
  `num2` int(11) NULL DEFAULT NULL COMMENT '开奖号码2',
  `num3` int(11) NULL DEFAULT NULL COMMENT '开奖号码3',
  `num4` int(11) NULL DEFAULT NULL COMMENT '开奖号码4',
  `num5` int(11) NULL DEFAULT NULL COMMENT '开奖号码5',
  `pre_time` datetime NULL DEFAULT NULL COMMENT '预开奖时间',
  `pre_num1` int(11) NULL DEFAULT NULL COMMENT '预开奖号码1',
  `pre_num2` int(11) NULL DEFAULT NULL COMMENT '预开奖号码2',
  `pre_num3` int(11) NULL DEFAULT NULL COMMENT '预开奖号码3',
  `pre_num4` int(11) NULL DEFAULT NULL COMMENT '预开奖号码4',
  `pre_num5` int(11) NULL DEFAULT NULL COMMENT '预开奖号码5',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '开奖数据状态(0已开奖,1预开奖号码)',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `periods`(`periods`, `game_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71283 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '5球开奖历史表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of game_fiveball_open_data
-- ----------------------------

-- ----------------------------
-- Table structure for game_fiveball_record
-- ----------------------------
DROP TABLE IF EXISTS `game_fiveball_record`;
CREATE TABLE `game_fiveball_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '下注表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `periods` bigint(20) NOT NULL COMMENT '期数',
  `game_id` bigint(20) NOT NULL COMMENT '游戏ID',
  `game_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏名',
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
  INDEX `user_id_2`(`user_id`, `periods`, `game_id`, `status`) USING BTREE,
  INDEX `periods`(`periods`, `game_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '5球下注表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of game_fiveball_record
-- ----------------------------

-- ----------------------------
-- Table structure for game_option
-- ----------------------------
DROP TABLE IF EXISTS `game_option`;
CREATE TABLE `game_option`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '转化表ID',
  `game_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `key` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '投注字段KEY',
  `title` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '投注字段名称',
  `play_group` tinyint(3) NULL DEFAULT 0 COMMENT '投注类型',
  `play_group_title` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '投注类型名称',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 189 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '转化表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of game_option
-- ----------------------------
INSERT INTO `game_option` VALUES (1, 2, 'num0', '0', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (2, 2, 'num1', '1', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (3, 2, 'num2', '2', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (4, 2, 'num3', '3', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (5, 2, 'num4', '4', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (6, 2, 'num5', '5', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (7, 2, 'num6', '6', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (8, 2, 'num7', '7', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (9, 2, 'num8', '8', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (10, 2, 'num9', '9', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (11, 2, 'num10', '10', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (12, 2, 'num11', '11', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (13, 2, 'num12', '12', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (14, 2, 'num13', '13', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (15, 2, 'num14', '14', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (16, 2, 'num15', '15', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (17, 2, 'num16', '16', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (18, 2, 'num17', '17', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (19, 2, 'num18', '18', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (20, 2, 'num19', '19', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (21, 2, 'num20', '20', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (22, 2, 'num21', '21', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (23, 2, 'num22', '22', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (24, 2, 'num23', '23', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (25, 2, 'num24', '24', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (26, 2, 'num25', '25', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (27, 2, 'num26', '26', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (28, 2, 'num27', '27', 1, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (29, 2, 'single', '单', 2, '大小单双', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (30, 2, 'doubleAmount', '双', 2, '大小单双', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (31, 2, 'big', '大', 2, '大小单双', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (32, 2, 'small', '小', 2, '大小单双', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (33, 2, 'muchBig', '极大', 3, '极值', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (34, 2, 'muchSmall', '极小', 3, '极值', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (35, 2, 'bigSingle', '大单', 4, '混合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (36, 2, 'bigDouble', '大双', 4, '混合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (37, 2, 'smallSingle', '小单', 4, '混合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (38, 2, 'smallDouble', '小双', 4, '混合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (39, 2, 'red', '红', 5, '波色', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (40, 2, 'green', '绿', 5, '波色', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (41, 2, 'blue', '蓝', 5, '波色', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (42, 2, 'leopard', '豹子', 6, '特殊玩法', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (43, 2, 'loong', '龙', 8, '龙虎合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (44, 2, 'tiger', '虎', 8, '龙虎合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (45, 2, 'Close', '合', 8, '龙虎合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (46, 2, 'pairs', '对子', 6, '特殊玩法', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (47, 2, 'shun', '顺子', 6, '特殊玩法', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (48, 1, 'num0', '0', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (49, 1, 'num1', '1', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (50, 1, 'num2', '2', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (51, 1, 'num3', '3', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (52, 1, 'num4', '4', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (53, 1, 'num5', '5', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (54, 1, 'num6', '6', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (55, 1, 'num7', '7', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (56, 1, 'num8', '8', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (57, 1, 'num9', '9', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (58, 1, 'num10', '10', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (59, 1, 'num11', '11', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (60, 1, 'num12', '12', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (61, 1, 'num13', '13', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (62, 1, 'num14', '14', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (63, 1, 'num15', '15', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (64, 1, 'num16', '16', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (65, 1, 'num17', '17', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (66, 1, 'num18', '18', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (67, 1, 'num19', '19', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (68, 1, 'num20', '20', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (69, 1, 'num21', '21', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (70, 1, 'num22', '22', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (71, 1, 'num23', '23', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (72, 1, 'num24', '24', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (73, 1, 'num25', '25', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (74, 1, 'num26', '26', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (75, 1, 'num27', '27', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (76, 1, 'single', '单', 0, '大小单双', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (77, 1, 'doubleAmount', '双', 0, '大小单双', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (78, 1, 'big', '大', 0, '大小单双', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (79, 1, 'small', '小', 0, '大小单双', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (80, 1, 'muchBig', '极大', 0, '极值', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (81, 1, 'muchSmall', '极小', 0, '极值', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (82, 1, 'bigSingle', '大单', 0, '混合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (83, 1, 'bigDouble', '大双', 0, '混合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (84, 1, 'smallSingle', '小单', 0, '混合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (85, 1, 'smallDouble', '小双', 0, '混合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (86, 1, 'red', '红', 0, '波色', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (87, 1, 'green', '绿', 0, '波色', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (88, 1, 'blue', '蓝', 0, '波色', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (89, 1, 'leopard', '豹子', 0, '特殊玩法', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (90, 1, 'loong', '龙', 0, '龙虎合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (91, 1, 'tiger', '虎', 0, '龙虎合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (92, 1, 'Close', '合', 0, '龙虎合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (93, 1, 'pairs', '对子', 0, '特殊玩法', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (94, 1, 'shun', '顺子', 0, '特殊玩法', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (95, 3, 'num0', '0', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (96, 3, 'num1', '1', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (97, 3, 'num2', '2', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (98, 3, 'num3', '3', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (99, 3, 'num4', '4', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (100, 3, 'num5', '5', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (101, 3, 'num6', '6', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (102, 3, 'num7', '7', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (103, 3, 'num8', '8', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (104, 3, 'num9', '9', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (105, 3, 'num10', '10', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (106, 3, 'num11', '11', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (107, 3, 'num12', '12', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (108, 3, 'num13', '13', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (109, 3, 'num14', '14', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (110, 3, 'num15', '15', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (111, 3, 'num16', '16', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (112, 3, 'num17', '17', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (113, 3, 'num18', '18', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (114, 3, 'num19', '19', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (115, 3, 'num20', '20', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (116, 3, 'num21', '21', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (117, 3, 'num22', '22', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (118, 3, 'num23', '23', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (119, 3, 'num24', '24', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (120, 3, 'num25', '25', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (121, 3, 'num26', '26', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (122, 3, 'num27', '27', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (123, 3, 'single', '单', 0, '大小单双', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (124, 3, 'doubleAmount', '双', 0, '大小单双', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (125, 3, 'big', '大', 0, '大小单双', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (126, 3, 'small', '小', 0, '大小单双', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (127, 3, 'muchBig', '极大', 0, '极值', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (128, 3, 'muchSmall', '极小', 0, '极值', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (129, 3, 'bigSingle', '大单', 0, '混合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (130, 3, 'bigDouble', '大双', 0, '混合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (131, 3, 'smallSingle', '小单', 0, '混合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (132, 3, 'smallDouble', '小双', 0, '混合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (133, 3, 'red', '红', 0, '波色', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (134, 3, 'green', '绿', 0, '波色', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (135, 3, 'blue', '蓝', 0, '波色', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (136, 3, 'leopard', '豹子', 0, '特殊玩法', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (137, 3, 'loong', '龙', 0, '龙虎合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (138, 3, 'tiger', '虎', 0, '龙虎合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (139, 3, 'Close', '合', 0, '龙虎合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (140, 3, 'pairs', '对子', 0, '特殊玩法', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (141, 3, 'shun', '顺子', 0, '特殊玩法', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (142, 4, 'num0', '0', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (143, 4, 'num1', '1', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (144, 4, 'num2', '2', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (145, 4, 'num3', '3', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (146, 4, 'num4', '4', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (147, 4, 'num5', '5', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (148, 4, 'num6', '6', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (149, 4, 'num7', '7', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (150, 4, 'num8', '8', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (151, 4, 'num9', '9', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (152, 4, 'num10', '10', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (153, 4, 'num11', '11', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (154, 4, 'num12', '12', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (155, 4, 'num13', '13', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (156, 4, 'num14', '14', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (157, 4, 'num15', '15', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (158, 4, 'num16', '16', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (159, 4, 'num17', '17', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (160, 4, 'num18', '18', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (161, 4, 'num19', '19', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (162, 4, 'num20', '20', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (163, 4, 'num21', '21', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (164, 4, 'num22', '22', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (165, 4, 'num23', '23', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (166, 4, 'num24', '24', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (167, 4, 'num25', '25', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (168, 4, 'num26', '26', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (169, 4, 'num27', '27', 0, '猜数字', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (170, 4, 'single', '单', 0, '大小单双', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (171, 4, 'doubleAmount', '双', 0, '大小单双', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (172, 4, 'big', '大', 0, '大小单双', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (173, 4, 'small', '小', 0, '大小单双', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (174, 4, 'muchBig', '极大', 0, '极值', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (175, 4, 'muchSmall', '极小', 0, '极值', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (176, 4, 'bigSingle', '大单', 0, '混合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (177, 4, 'bigDouble', '大双', 0, '混合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (178, 4, 'smallSingle', '小单', 0, '混合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (179, 4, 'smallDouble', '小双', 0, '混合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (180, 4, 'red', '红', 0, '波色', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (181, 4, 'green', '绿', 0, '波色', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (182, 4, 'blue', '蓝', 0, '波色', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (183, 4, 'leopard', '豹子', 0, '特殊玩法', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (184, 4, 'loong', '龙', 0, '龙虎合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (185, 4, 'tiger', '虎', 0, '龙虎合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (186, 4, 'Close', '合', 0, '龙虎合', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (187, 4, 'pairs', '对子', 0, '特殊玩法', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `game_option` VALUES (188, 4, 'shun', '顺子', 0, '特殊玩法', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for game_tenball_kj
-- ----------------------------
DROP TABLE IF EXISTS `game_tenball_kj`;
CREATE TABLE `game_tenball_kj`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '10球开奖开奖表ID',
  `periods` bigint(20) NOT NULL COMMENT '期数',
  `game_id` bigint(20) NOT NULL COMMENT '游戏ID',
  `game_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏名',
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
  INDEX `periods`(`periods`, `game_id`) USING BTREE,
  INDEX `status`(`periods`, `status`, `game_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97017 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '10球开奖开奖表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of game_tenball_kj
-- ----------------------------

-- ----------------------------
-- Table structure for game_tenball_open_data
-- ----------------------------
DROP TABLE IF EXISTS `game_tenball_open_data`;
CREATE TABLE `game_tenball_open_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '期数',
  `periods` bigint(20) NOT NULL COMMENT '期数',
  `game_id` bigint(20) NOT NULL COMMENT '游戏ID',
  `game_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏名',
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
  `pre_time` datetime NULL DEFAULT NULL COMMENT '预开奖时间',
  `pre_num1` int(11) NULL DEFAULT NULL COMMENT '预开奖号码1',
  `pre_num2` int(11) NULL DEFAULT NULL COMMENT '预开奖号码2',
  `pre_num3` int(11) NULL DEFAULT NULL COMMENT '预开奖号码3',
  `pre_num4` int(11) NULL DEFAULT NULL COMMENT '预开奖号码4',
  `pre_num5` int(11) NULL DEFAULT NULL COMMENT '预开奖号码5',
  `pre_num6` int(11) NULL DEFAULT NULL COMMENT '预开奖号码6',
  `pre_num7` int(11) NULL DEFAULT NULL COMMENT '预开奖号码7',
  `pre_num8` int(11) NULL DEFAULT NULL COMMENT '预开奖号码8',
  `pre_num9` int(11) NULL DEFAULT NULL COMMENT '预开奖号码9',
  `pre_num10` int(11) NULL DEFAULT NULL COMMENT '预开奖号码10',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `periods`(`periods`, `game_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97421 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '10球开奖历史表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of game_tenball_open_data
-- ----------------------------

-- ----------------------------
-- Table structure for game_tenball_record
-- ----------------------------
DROP TABLE IF EXISTS `game_tenball_record`;
CREATE TABLE `game_tenball_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '10球下注表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `periods` bigint(20) NOT NULL COMMENT '期数',
  `game_id` bigint(20) NOT NULL COMMENT '游戏ID',
  `game_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏名',
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
  INDEX `user_id_2`(`user_id`, `periods`, `game_id`, `status`) USING BTREE,
  INDEX `periods`(`periods`, `game_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '10球下注表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of game_tenball_record
-- ----------------------------

-- ----------------------------
-- Table structure for game_threeball_kj
-- ----------------------------
DROP TABLE IF EXISTS `game_threeball_kj`;
CREATE TABLE `game_threeball_kj`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '10球开奖开奖表ID',
  `periods` bigint(20) NOT NULL COMMENT '期数',
  `game_id` bigint(20) NOT NULL COMMENT '游戏ID',
  `game_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏名',
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
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `periods`(`periods`, `game_id`) USING BTREE,
  INDEX `status`(`periods`, `status`, `game_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40828 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '3球开奖表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of game_threeball_kj
-- ----------------------------

-- ----------------------------
-- Table structure for game_threeball_mixed_odds
-- ----------------------------
DROP TABLE IF EXISTS `game_threeball_mixed_odds`;
CREATE TABLE `game_threeball_mixed_odds`  (
  `mixed_odds_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '赔率表ID',
  `game_id` bigint(20) NOT NULL COMMENT '游戏ID',
  `number_min_quota` float(11, 2) NULL DEFAULT 0.00 COMMENT '13,14大小单双额度下限',
  `number_max_quota` float(11, 2) NULL DEFAULT 0.00 COMMENT '13,14大小单双额度上限',
  `less_number_odd` float(10, 2) NULL DEFAULT 0.00 COMMENT '13,14大小单双小于下限赔率',
  `center_number_odd` float(10, 2) NULL DEFAULT 0.00 COMMENT '13,14大小单双中间赔率',
  `greater_number_odd` float(10, 2) NULL DEFAULT 0.00 COMMENT '13,14大小单双大于下限赔率',
  `sdb_min_quota` float(11, 2) NULL DEFAULT 0.00 COMMENT '顺对豹额度下限',
  `sdb_max_quota` float(11, 2) NULL DEFAULT 0.00 COMMENT '顺对豹额度上限',
  `less_sdb_odd` float(10, 2) NULL DEFAULT 0.00 COMMENT '顺对豹小于下限赔率',
  `center_sdb_odd` float(10, 2) NULL DEFAULT 0.00 COMMENT '顺对豹中间赔率',
  `greater_sdb_odd` float(10, 2) NULL DEFAULT 0.00 COMMENT '顺对豹大于下限赔率',
  `zero_nine_min_quota` float(11, 2) NULL DEFAULT 0.00 COMMENT '0,9额度下限',
  `zero_nine_max_quota` float(11, 2) NULL DEFAULT 0.00 COMMENT '0,9额度上限',
  `less_zero_nine_odd` float(10, 2) NULL DEFAULT 0.00 COMMENT '0,9小于下限赔率',
  `center_zero_nine_odd` float(10, 2) NULL DEFAULT 0.00 COMMENT '0,9中间赔率',
  `greater_zero_nine_odd` float(10, 2) NULL DEFAULT 0.00 COMMENT '0,9大于下限赔率',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`mixed_odds_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '3球特殊赔率表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of game_threeball_mixed_odds
-- ----------------------------
INSERT INTO `game_threeball_mixed_odds` VALUES (1, 1, 1000.00, 10000.00, 1.20, 1.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', NULL, '', '2024-07-15 20:02:40', '');
INSERT INTO `game_threeball_mixed_odds` VALUES (2, 3, 0.00, 0.00, 100.00, 100.00, 100.00, 0.00, 0.00, 100.00, 100.00, 100.00, 0.00, 0.00, 100.00, 100.00, 100.00, '', NULL, '', '2024-07-15 20:02:44', '');
INSERT INTO `game_threeball_mixed_odds` VALUES (3, 4, 0.00, 0.00, 100.00, 100.00, 100.00, 0.00, 0.00, 100.00, 100.00, 100.00, 0.00, 0.00, 100.00, 100.00, 100.00, '', NULL, '', NULL, '');
INSERT INTO `game_threeball_mixed_odds` VALUES (4, 2, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '2024-07-15 20:02:42', '', NULL, '');

-- ----------------------------
-- Table structure for game_threeball_open_data
-- ----------------------------
DROP TABLE IF EXISTS `game_threeball_open_data`;
CREATE TABLE `game_threeball_open_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '3球开奖历史ID',
  `periods` bigint(20) NOT NULL COMMENT '期数',
  `game_id` bigint(20) NOT NULL COMMENT '游戏ID',
  `game_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏名',
  `time` datetime NULL DEFAULT NULL COMMENT '开奖时间',
  `sum_1` int(11) NULL DEFAULT NULL COMMENT '开奖号码1',
  `sum_2` int(11) NULL DEFAULT NULL COMMENT '开奖号码2',
  `sum_3` int(11) NULL DEFAULT NULL COMMENT '开奖号码3',
  `pre_time` datetime NULL DEFAULT NULL COMMENT '预开奖时间',
  `pre_sum_1` int(11) NULL DEFAULT NULL COMMENT '预开奖号码1',
  `pre_sum_2` int(11) NULL DEFAULT NULL COMMENT '预开奖号码2',
  `pre_sum_3` int(11) NULL DEFAULT NULL COMMENT '预开奖号码3',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `periods`(`periods`, `game_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41117 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '3球开奖历史表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of game_threeball_open_data
-- ----------------------------

-- ----------------------------
-- Table structure for game_threeball_record
-- ----------------------------
DROP TABLE IF EXISTS `game_threeball_record`;
CREATE TABLE `game_threeball_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '下注表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `periods` bigint(20) NOT NULL COMMENT '期数',
  `game_id` bigint(20) NOT NULL COMMENT '游戏ID',
  `game_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏名',
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
  `vip` int(4) NOT NULL DEFAULT 0 COMMENT 'VIP房间',
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
  INDEX `user_id_2`(`user_id`, `periods`, `status`, `game_id`) USING BTREE,
  INDEX `periods`(`periods`, `game_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '3球下注表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of game_threeball_record
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `gen_table` VALUES (30, 'userwin', '用户盈亏表', NULL, NULL, 'Userwin', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'userwin', '用户盈亏', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-24 22:51:56', '', '2024-05-18 22:10:25', NULL);
INSERT INTO `gen_table` VALUES (31, 'sys_bet_item', '游戏投注项表', NULL, NULL, 'SysBetItem', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'betItem', '游戏投注项', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-25 19:52:44', '', '2024-03-25 19:53:28', NULL);
INSERT INTO `gen_table` VALUES (33, 'wave', '数字红绿蓝属性表', NULL, NULL, 'Wave', 'crud', '', 'com.ruoyi.system', 'system', 'wave', '数字红绿蓝属性', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-27 20:56:32', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (34, 'jssscrecord', '极速时时彩下注表', NULL, NULL, 'Jssscrecord', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'jssscrecord', '极速时时彩下注', 'ruoyi', '0', '/', '{}', 'admin', '2024-03-27 22:59:12', '', '2024-03-27 23:02:25', NULL);
INSERT INTO `gen_table` VALUES (35, 'game_fiveball_kj', '5球开奖表', NULL, NULL, 'GameFiveballKj', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'fiveBallKj', '5球开奖', 'ruoyi', '0', '/', '{}', 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59', NULL);
INSERT INTO `gen_table` VALUES (36, 'game_fiveball_open_data', '5球开奖历史表', NULL, NULL, 'GameFiveballOpenData', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'fiveBallData', '5球开奖历史', 'ruoyi', '0', '/', '{}', 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:23', NULL);
INSERT INTO `gen_table` VALUES (37, 'game_fiveball_record', '5球下注表', NULL, NULL, 'GameFiveballRecord', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'fiveBallRecord', '5球下注', 'ruoyi', '0', '/', '{}', 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42', NULL);
INSERT INTO `gen_table` VALUES (38, 'game_tenball_kj', '10球开奖开奖表', NULL, NULL, 'GameTenballKj', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'tenBallKj', '10球开奖开奖', 'ruoyi', '0', '/', '{}', 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18', NULL);
INSERT INTO `gen_table` VALUES (39, 'game_tenball_open_data', '10球开奖历史表', NULL, NULL, 'GameTenballOpenData', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'tenBallData', '10球开奖历史', 'ruoyi', '0', '/', '{}', 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32', NULL);
INSERT INTO `gen_table` VALUES (40, 'game_tenball_record', '10球下注表', NULL, NULL, 'GameTenballRecord', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'tenBallRecord', '10球下注', 'ruoyi', '0', '/', '{}', 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52', NULL);
INSERT INTO `gen_table` VALUES (41, 'game_threeball_kj', '3球开奖表', NULL, NULL, 'GameThreeballKj', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'threeBallKj', '3球开奖', 'ruoyi', '0', '/', '{}', 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05', NULL);
INSERT INTO `gen_table` VALUES (42, 'game_threeball_open_data', '3球开奖历史表', NULL, NULL, 'GameThreeballOpenData', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'threeBallData', '3球开奖历史', 'ruoyi', '0', '/', '{}', 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:15', NULL);
INSERT INTO `gen_table` VALUES (43, 'game_threeball_record', '3球下注表', NULL, NULL, 'GameThreeballRecord', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'threeBallRecord', '3球下注', 'ruoyi', '0', '/', '{}', 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05', NULL);
INSERT INTO `gen_table` VALUES (46, 'sys_payment', '支付方式表', NULL, NULL, 'SysPayment', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'payment', '支付方式', 'ruoyi', '0', '/', '{}', 'admin', '2024-04-07 19:14:23', '', '2024-04-07 19:15:10', NULL);
INSERT INTO `gen_table` VALUES (47, 'game_option', '转化表', NULL, NULL, 'GameOption', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'gameOption', '转化', 'ruoyi', '0', '/', '{}', 'admin', '2024-04-22 18:59:46', '', '2024-04-22 19:00:00', NULL);
INSERT INTO `gen_table` VALUES (49, 'sys_admin_record', '管理员记录表', NULL, NULL, 'SysAdminRecord', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'adminRecord', '管理员记录', 'ruoyi', '0', '/', '{}', 'admin', '2024-05-07 18:59:15', '', '2024-05-07 18:59:31', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2099 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `gen_table_column` VALUES (1283, 30, 'id', '用户盈亏ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-24 22:51:56', '', '2024-05-18 22:10:25');
INSERT INTO `gen_table_column` VALUES (1284, 30, 'win_time', '盈亏时间(YMD)', 'datetime', 'Date', 'winTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 2, 'admin', '2024-03-24 22:51:56', '', '2024-05-18 22:10:25');
INSERT INTO `gen_table_column` VALUES (1285, 30, 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-24 22:51:56', '', '2024-05-18 22:10:25');
INSERT INTO `gen_table_column` VALUES (1286, 30, 'game_id', '游戏ID', 'bigint(20)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-24 22:51:56', '', '2024-05-18 22:10:25');
INSERT INTO `gen_table_column` VALUES (1287, 30, 'game_name', '游戏名', 'varchar(25)', 'String', 'gameName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-03-24 22:51:56', '', '2024-05-18 22:10:25');
INSERT INTO `gen_table_column` VALUES (1288, 30, 'win_money', '今日盈亏金额', 'float(11,2)', 'Float', 'winMoney', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-03-24 22:51:56', '', '2024-05-18 22:10:25');
INSERT INTO `gen_table_column` VALUES (1289, 30, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2024-03-24 22:51:56', '', '2024-05-18 22:10:25');
INSERT INTO `gen_table_column` VALUES (1290, 30, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2024-03-24 22:51:56', '', '2024-05-18 22:10:25');
INSERT INTO `gen_table_column` VALUES (1291, 30, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2024-03-24 22:51:56', '', '2024-05-18 22:10:25');
INSERT INTO `gen_table_column` VALUES (1292, 30, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2024-03-24 22:51:56', '', '2024-05-18 22:10:25');
INSERT INTO `gen_table_column` VALUES (1293, 30, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 18, 'admin', '2024-03-24 22:51:56', '', '2024-05-18 22:10:25');
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
INSERT INTO `gen_table_column` VALUES (1495, 35, 'id', '5球开奖历史ID', 'bigint(20) unsigned', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1496, 35, 'periods', '期数', 'bigint(20)', 'Long', 'periods', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1497, 35, 'game_id', '游戏ID', 'bigint(20)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1498, 35, 'game_name', '游戏名', 'varchar(25)', 'String', 'gameName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1499, 35, 'status', '是否已经开奖（0未开奖 1已开奖）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1500, 35, 'bet_time', '封盘投注截止时间', 'datetime', 'Date', 'betTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1501, 35, 'pre_time', '预计开奖时间', 'datetime', 'Date', 'preTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1502, 35, 'the_time', '开奖时间', 'datetime', 'Date', 'theTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1503, 35, 'count_money', '总下注金额', 'int(11)', 'Long', 'countMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1504, 35, 'win_money', '总中奖金额', 'int(11)', 'Long', 'winMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1505, 35, 'num1', '开奖号码1', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1506, 35, 'num2', '开奖号码2', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1507, 35, 'num3', '开奖号码3', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1508, 35, 'num4', '开奖号码4', 'int(11)', 'Long', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1509, 35, 'num5', '开奖号码5', 'int(11)', 'Long', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1510, 35, 'sum', '开奖合计号码', 'int(11)', 'Long', 'sum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1511, 35, 'num1_bs', '开奖号码1大小', 'int(11)', 'Long', 'num1Bs', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1512, 35, 'num1_sd', '开奖号码1单双', 'int(11)', 'Long', 'num1Sd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1513, 35, 'num2_bs', '开奖号码2大小', 'int(11)', 'Long', 'num2Bs', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1514, 35, 'num2_sd', '开奖号码2单双', 'int(11)', 'Long', 'num2Sd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1515, 35, 'num3_bs', '开奖号码3大小', 'int(11)', 'Long', 'num3Bs', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1516, 35, 'num3_sd', '开奖号码3单双', 'int(11)', 'Long', 'num3Sd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1517, 35, 'num4_bs', '开奖号码4大小', 'int(11)', 'Long', 'num4Bs', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1518, 35, 'num4_sd', '开奖号码4单双', 'int(11)', 'Long', 'num4Sd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1519, 35, 'num5_bs', '开奖号码5大小', 'int(11)', 'Long', 'num5Bs', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1520, 35, 'num5_sd', '开奖号码5单双', 'int(11)', 'Long', 'num5Sd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1521, 35, 'sum_bs', '开奖合计号码大小', 'int(11)', 'Long', 'sumBs', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1522, 35, 'sum_sd', '开奖合计号码单双', 'int(11)', 'Long', 'sumSd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1523, 35, 'sum_lts', '开奖合计号码和虎龙', 'int(11)', 'Long', 'sumLts', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1524, 35, 'num_f', '开奖号码(123)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂]', 'int(11)', 'Long', 'numF', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 30, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1525, 35, 'num_m', '开奖号码(234)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂]', 'int(11)', 'Long', 'numM', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 31, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1526, 35, 'num_b', '开奖号码(345)豹对顺半杂[0:豹子 1:对 2:顺 3:半 4:杂]', 'int(11)', 'Long', 'numB', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 32, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1527, 35, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 33, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1528, 35, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 34, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1529, 35, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 35, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1530, 35, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 36, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1531, 35, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 37, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:14:59');
INSERT INTO `gen_table_column` VALUES (1532, 36, 'id', '5球开奖历史ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:23');
INSERT INTO `gen_table_column` VALUES (1533, 36, 'periods', '期数', 'bigint(20)', 'Long', 'periods', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:23');
INSERT INTO `gen_table_column` VALUES (1534, 36, 'game_id', '游戏ID', 'bigint(20)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:23');
INSERT INTO `gen_table_column` VALUES (1535, 36, 'game_name', '游戏名', 'varchar(25)', 'String', 'gameName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:23');
INSERT INTO `gen_table_column` VALUES (1536, 36, 'time', '开奖时间', 'datetime', 'Date', 'time', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:23');
INSERT INTO `gen_table_column` VALUES (1537, 36, 'num1', '开奖号码1', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:23');
INSERT INTO `gen_table_column` VALUES (1538, 36, 'num2', '开奖号码2', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:23');
INSERT INTO `gen_table_column` VALUES (1539, 36, 'num3', '开奖号码3', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:23');
INSERT INTO `gen_table_column` VALUES (1540, 36, 'num4', '开奖号码4', 'int(11)', 'Long', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:23');
INSERT INTO `gen_table_column` VALUES (1541, 36, 'num5', '开奖号码5', 'int(11)', 'Long', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:23');
INSERT INTO `gen_table_column` VALUES (1542, 36, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:23');
INSERT INTO `gen_table_column` VALUES (1543, 36, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:23');
INSERT INTO `gen_table_column` VALUES (1544, 36, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:23');
INSERT INTO `gen_table_column` VALUES (1545, 36, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:23');
INSERT INTO `gen_table_column` VALUES (1546, 36, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 15, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:23');
INSERT INTO `gen_table_column` VALUES (1547, 37, 'id', '下注表ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1548, 37, 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1549, 37, 'periods', '期数', 'bigint(20)', 'Long', 'periods', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1550, 37, 'game_id', '游戏ID', 'bigint(20)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1551, 37, 'game_name', '游戏名', 'varchar(25)', 'String', 'gameName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1552, 37, 'status', '投注状态（0投注 1撤单）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1553, 37, 'record_time', '投注时间', 'datetime', 'Date', 'recordTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1554, 37, 'check_time', '确认时间', 'timestamp', 'Date', 'checkTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1555, 37, 'count_money', '下注金额', 'float(11,2)', 'BigDecimal', 'countMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1556, 37, 'win_money', '中奖金额', 'float(11,2)', 'BigDecimal', 'winMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1557, 37, 'sum_big', '下注和值大的金额', 'float(11,2)', 'BigDecimal', 'sumBig', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1558, 37, 'sum_small', '下注和值小的金额', 'float(11,2)', 'BigDecimal', 'sumSmall', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1559, 37, 'sum_single', '下注和值单的金额', 'float(11,2)', 'BigDecimal', 'sumSingle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1560, 37, 'sum_double', '下注和值双的金额', 'float(11,2)', 'BigDecimal', 'sumDouble', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1561, 37, 'sum_loong', '下注和值龙的金额', 'float(11,2)', 'BigDecimal', 'sumLoong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1562, 37, 'sum_tiger', '下注和值虎的金额', 'float(11,2)', 'BigDecimal', 'sumTiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1563, 37, 'sum_sum', '下注和值和的金额', 'float(11,2)', 'BigDecimal', 'sumSum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1564, 37, 'num1_big', '下注买1号球大的金额', 'float(11,2)', 'BigDecimal', 'num1Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1565, 37, 'num1_small', '下注买1号球小的金额', 'float(11,2)', 'BigDecimal', 'num1Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1566, 37, 'num1_single', '下注买1号球单的金额', 'float(11,2)', 'BigDecimal', 'num1Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1567, 37, 'num1_double', '下注买1号球双的金额', 'float(11,2)', 'BigDecimal', 'num1Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1568, 37, 'num1_ball0', '下注买1号球0的金额', 'float(11,2)', 'BigDecimal', 'num1Ball0', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1569, 37, 'num1_ball1', '下注买1号球1的金额', 'float(11,2)', 'BigDecimal', 'num1Ball1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1570, 37, 'num1_ball2', '下注买1号球2的金额', 'float(11,2)', 'BigDecimal', 'num1Ball2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1571, 37, 'num1_ball3', '下注买1号球3的金额', 'float(11,2)', 'BigDecimal', 'num1Ball3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1572, 37, 'num1_ball4', '下注买1号球4的金额', 'float(11,2)', 'BigDecimal', 'num1Ball4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1573, 37, 'num1_ball5', '下注买1号球5的金额', 'float(11,2)', 'BigDecimal', 'num1Ball5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1574, 37, 'num1_ball6', '下注买1号球6的金额', 'float(11,2)', 'BigDecimal', 'num1Ball6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1575, 37, 'num1_ball7', '下注买1号球7的金额', 'float(11,2)', 'BigDecimal', 'num1Ball7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1576, 37, 'num1_ball8', '下注买1号球8的金额', 'float(11,2)', 'BigDecimal', 'num1Ball8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 30, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1577, 37, 'num1_ball9', '下注买1号球9的金额', 'float(11,2)', 'BigDecimal', 'num1Ball9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 31, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1578, 37, 'num2_big', '下注买2号球大的金额', 'float(11,2)', 'BigDecimal', 'num2Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 32, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1579, 37, 'num2_small', '下注买2号球小的金额', 'float(11,2)', 'BigDecimal', 'num2Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 33, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1580, 37, 'num2_single', '下注买2号球单的金额', 'float(11,2)', 'BigDecimal', 'num2Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 34, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1581, 37, 'num2_double', '下注买2号球双的金额', 'float(11,2)', 'BigDecimal', 'num2Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 35, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1582, 37, 'num2_ball0', '下注买2号球0的金额', 'float(11,2)', 'BigDecimal', 'num2Ball0', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 36, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1583, 37, 'num2_ball1', '下注买2号球1的金额', 'float(11,2)', 'BigDecimal', 'num2Ball1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 37, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1584, 37, 'num2_ball2', '下注买2号球2的金额', 'float(11,2)', 'BigDecimal', 'num2Ball2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 38, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1585, 37, 'num2_ball3', '下注买2号球3的金额', 'float(11,2)', 'BigDecimal', 'num2Ball3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 39, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1586, 37, 'num2_ball4', '下注买2号球4的金额', 'float(11,2)', 'BigDecimal', 'num2Ball4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 40, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1587, 37, 'num2_ball5', '下注买2号球5的金额', 'float(11,2)', 'BigDecimal', 'num2Ball5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 41, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1588, 37, 'num2_ball6', '下注买2号球6的金额', 'float(11,2)', 'BigDecimal', 'num2Ball6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 42, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1589, 37, 'num2_ball7', '下注买2号球7的金额', 'float(11,2)', 'BigDecimal', 'num2Ball7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 43, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1590, 37, 'num2_ball8', '下注买2号球8的金额', 'float(11,2)', 'BigDecimal', 'num2Ball8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 44, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1591, 37, 'num2_ball9', '下注买2号球9的金额', 'float(11,2)', 'BigDecimal', 'num2Ball9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 45, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1592, 37, 'num3_big', '下注买3号球大的金额', 'float(11,2)', 'BigDecimal', 'num3Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 46, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1593, 37, 'num3_small', '下注买3号球小的金额', 'float(11,2)', 'BigDecimal', 'num3Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 47, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1594, 37, 'num3_single', '下注买3号球单的金额', 'float(11,2)', 'BigDecimal', 'num3Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 48, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1595, 37, 'num3_double', '下注买3号球双的金额', 'float(11,2)', 'BigDecimal', 'num3Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 49, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1596, 37, 'num3_ball0', '下注买3号球0的金额', 'float(11,2)', 'BigDecimal', 'num3Ball0', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 50, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1597, 37, 'num3_ball1', '下注买3号球1的金额', 'float(11,2)', 'BigDecimal', 'num3Ball1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 51, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1598, 37, 'num3_ball2', '下注买3号球2的金额', 'float(11,2)', 'BigDecimal', 'num3Ball2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 52, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1599, 37, 'num3_ball3', '下注买3号球3的金额', 'float(11,2)', 'BigDecimal', 'num3Ball3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 53, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1600, 37, 'num3_ball4', '下注买3号球4的金额', 'float(11,2)', 'BigDecimal', 'num3Ball4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 54, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1601, 37, 'num3_ball5', '下注买3号球5的金额', 'float(11,2)', 'BigDecimal', 'num3Ball5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 55, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1602, 37, 'num3_ball6', '下注买3号球6的金额', 'float(11,2)', 'BigDecimal', 'num3Ball6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 56, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1603, 37, 'num3_ball7', '下注买3号球7的金额', 'float(11,2)', 'BigDecimal', 'num3Ball7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 57, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1604, 37, 'num3_ball8', '下注买3号球8的金额', 'float(11,2)', 'BigDecimal', 'num3Ball8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 58, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1605, 37, 'num3_ball9', '下注买3号球9的金额', 'float(11,2)', 'BigDecimal', 'num3Ball9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 59, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1606, 37, 'num4_big', '下注买4号球大的金额', 'float(11,2)', 'BigDecimal', 'num4Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 60, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1607, 37, 'num4_small', '下注买4号球小的金额', 'float(11,2)', 'BigDecimal', 'num4Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 61, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1608, 37, 'num4_single', '下注买4号球单的金额', 'float(11,2)', 'BigDecimal', 'num4Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 62, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1609, 37, 'num4_double', '下注买4号球双的金额', 'float(11,2)', 'BigDecimal', 'num4Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 63, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1610, 37, 'num4_ball0', '下注买4号球0的金额', 'float(11,2)', 'BigDecimal', 'num4Ball0', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 64, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1611, 37, 'num4_ball1', '下注买4号球1的金额', 'float(11,2)', 'BigDecimal', 'num4Ball1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 65, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1612, 37, 'num4_ball2', '下注买4号球2的金额', 'float(11,2)', 'BigDecimal', 'num4Ball2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 66, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1613, 37, 'num4_ball3', '下注买4号球3的金额', 'float(11,2)', 'BigDecimal', 'num4Ball3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 67, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1614, 37, 'num4_ball4', '下注买4号球4的金额', 'float(11,2)', 'BigDecimal', 'num4Ball4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 68, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1615, 37, 'num4_ball5', '下注买4号球5的金额', 'float(11,2)', 'BigDecimal', 'num4Ball5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 69, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1616, 37, 'num4_ball6', '下注买4号球6的金额', 'float(11,2)', 'BigDecimal', 'num4Ball6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 70, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1617, 37, 'num4_ball7', '下注买4号球7的金额', 'float(11,2)', 'BigDecimal', 'num4Ball7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 71, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1618, 37, 'num4_ball8', '下注买4号球8的金额', 'float(11,2)', 'BigDecimal', 'num4Ball8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 72, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1619, 37, 'num4_ball9', '下注买4号球9的金额', 'float(11,2)', 'BigDecimal', 'num4Ball9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 73, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1620, 37, 'num5_big', '下注买5号球大的金额', 'float(11,2)', 'BigDecimal', 'num5Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 74, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1621, 37, 'num5_small', '下注买5号球小的金额', 'float(11,2)', 'BigDecimal', 'num5Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 75, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1622, 37, 'num5_single', '下注买5号球单的金额', 'float(11,2)', 'BigDecimal', 'num5Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 76, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1623, 37, 'num5_double', '下注买5号球双的金额', 'float(11,2)', 'BigDecimal', 'num5Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 77, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1624, 37, 'num5_ball0', '下注买5号球0的金额', 'float(11,2)', 'BigDecimal', 'num5Ball0', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 78, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1625, 37, 'num5_ball1', '下注买5号球1的金额', 'float(11,2)', 'BigDecimal', 'num5Ball1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 79, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1626, 37, 'num5_ball2', '下注买5号球2的金额', 'float(11,2)', 'BigDecimal', 'num5Ball2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 80, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1627, 37, 'num5_ball3', '下注买5号球3的金额', 'float(11,2)', 'BigDecimal', 'num5Ball3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 81, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1628, 37, 'num5_ball4', '下注买5号球4的金额', 'float(11,2)', 'BigDecimal', 'num5Ball4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 82, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1629, 37, 'num5_ball5', '下注买5号球5的金额', 'float(11,2)', 'BigDecimal', 'num5Ball5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 83, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1630, 37, 'num5_ball6', '下注买5号球6的金额', 'float(11,2)', 'BigDecimal', 'num5Ball6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 84, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1631, 37, 'num5_ball7', '下注买5号球7的金额', 'float(11,2)', 'BigDecimal', 'num5Ball7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 85, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1632, 37, 'num5_ball8', '下注买5号球8的金额', 'float(11,2)', 'BigDecimal', 'num5Ball8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 86, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1633, 37, 'num5_ball9', '下注买5号球9的金额', 'float(11,2)', 'BigDecimal', 'num5Ball9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 87, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1634, 37, 'first_bao', '下注买前三豹的金额', 'float(11,2)', 'BigDecimal', 'firstBao', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 88, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1635, 37, 'first_dui', '下注买前三对的金额', 'float(11,2)', 'BigDecimal', 'firstDui', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 89, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1636, 37, 'first_sun', '下注买前三顺的金额', 'float(11,2)', 'BigDecimal', 'firstSun', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 90, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1637, 37, 'first_ban', '下注买前三半的金额', 'float(11,2)', 'BigDecimal', 'firstBan', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 91, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1638, 37, 'first_za', '下注买前三杂的金额', 'float(11,2)', 'BigDecimal', 'firstZa', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 92, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1639, 37, 'mid_bao', '下注买中三豹的的金额', 'float(11,2)', 'BigDecimal', 'midBao', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 93, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1640, 37, 'mid_dui', '下注买中三对的的金额', 'float(11,2)', 'BigDecimal', 'midDui', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 94, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1641, 37, 'mid_sun', '下注买中三顺的的金额', 'float(11,2)', 'BigDecimal', 'midSun', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 95, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1642, 37, 'mid_ban', '下注买中三半的的金额', 'float(11,2)', 'BigDecimal', 'midBan', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 96, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1643, 37, 'mid_za', '下注买中三杂的的金额', 'float(11,2)', 'BigDecimal', 'midZa', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 97, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1644, 37, 'back_bao', '下注买后三豹的的金额', 'float(11,2)', 'BigDecimal', 'backBao', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 98, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1645, 37, 'back_dui', '下注买后三对的的金额', 'float(11,2)', 'BigDecimal', 'backDui', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 99, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1646, 37, 'back_sun', '下注买后三顺的的金额', 'float(11,2)', 'BigDecimal', 'backSun', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 100, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1647, 37, 'back_ban', '下注买后三半的的金额', 'float(11,2)', 'BigDecimal', 'backBan', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 101, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1648, 37, 'back_za', '下注买后三杂的的金额', 'float(11,2)', 'BigDecimal', 'backZa', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 102, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1649, 37, 'num1', '开奖号码1', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 103, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1650, 37, 'num2', '开奖号码2', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 104, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1651, 37, 'num3', '开奖号码3', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 105, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1652, 37, 'num4', '开奖号码4', 'int(11)', 'Long', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 106, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1653, 37, 'num5', '开奖号码5', 'int(11)', 'Long', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 107, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1654, 37, 'sum', '开奖合算数字', 'int(11)', 'Long', 'sum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 108, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1655, 37, 'is_delete', '是否扣除(0否 1是)', 'char(1)', 'String', 'isDelete', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 109, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1656, 37, 'is_deduct', '是否扣除', 'char(1)', 'String', 'isDeduct', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 110, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1657, 37, 'house', '房间号', 'int(4)', 'Integer', 'house', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 111, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1658, 37, 'hz_id', '是否合庄模式', 'char(1)', 'String', 'hzId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 112, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1659, 37, 'hz_user', '是否用户(0否 1是)', 'char(1)', 'String', 'hzUser', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 113, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1660, 37, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 114, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1661, 37, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 115, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1662, 37, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 116, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1663, 37, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 117, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1664, 37, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 118, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:15:42');
INSERT INTO `gen_table_column` VALUES (1665, 38, 'id', '10球开奖开奖表ID', 'bigint(20) unsigned', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1666, 38, 'periods', '期数', 'bigint(20)', 'Long', 'periods', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1667, 38, 'game_id', '游戏ID', 'bigint(20)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1668, 38, 'game_name', '游戏名', 'varchar(25)', 'String', 'gameName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1669, 38, 'num1', '开奖号码1', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1670, 38, 'num2', '开奖号码2', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1671, 38, 'num3', '开奖号码3', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1672, 38, 'num4', '开奖号码4', 'int(11)', 'Long', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1673, 38, 'num5', '开奖号码5', 'int(11)', 'Long', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1674, 38, 'num6', '开奖号码6', 'int(11)', 'Long', 'num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1675, 38, 'num7', '开奖号码7', 'int(11)', 'Long', 'num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1676, 38, 'num8', '开奖号码8', 'int(11)', 'Long', 'num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1677, 38, 'num9', '开奖号码9', 'int(11)', 'Long', 'num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1678, 38, 'num10', '开奖号码10', 'int(11)', 'Long', 'num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1679, 38, 'bet_time', '封盘投注截止时间', 'datetime', 'Date', 'betTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 15, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1680, 38, 'pre_time', '预计开奖时间', 'datetime', 'Date', 'preTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 16, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1681, 38, 'status', '是否已经开奖（0未开奖 1已开奖）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 17, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1682, 38, 'the_time', '开奖时间', 'datetime', 'Date', 'theTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 18, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1683, 38, 'count_money', '总下注金额', 'int(11)', 'Long', 'countMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1684, 38, 'win_money', '总中奖金额', 'int(11)', 'Long', 'winMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1685, 38, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 21, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1686, 38, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 22, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1687, 38, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 23, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1688, 38, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 24, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1689, 38, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 25, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:18');
INSERT INTO `gen_table_column` VALUES (1690, 39, 'id', '期数', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1691, 39, 'periods', '期数', 'bigint(20)', 'Long', 'periods', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1692, 39, 'game_id', '游戏ID', 'bigint(20)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1693, 39, 'game_name', '游戏名', 'varchar(25)', 'String', 'gameName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1694, 39, 'time', '开奖时间', 'datetime', 'Date', 'time', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1695, 39, 'num1', '开奖号码1', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1696, 39, 'num2', '开奖号码2', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1697, 39, 'num3', '开奖号码3', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1698, 39, 'num4', '开奖号码4', 'int(11)', 'Long', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1699, 39, 'num5', '开奖号码5', 'int(11)', 'Long', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1700, 39, 'num6', '开奖号码6', 'int(11)', 'Long', 'num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1701, 39, 'num7', '开奖号码7', 'int(11)', 'Long', 'num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1702, 39, 'num8', '开奖号码8', 'int(11)', 'Long', 'num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1703, 39, 'num9', '开奖号码9', 'int(11)', 'Long', 'num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1704, 39, 'num10', '开奖号码10', 'int(11)', 'Long', 'num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1705, 39, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1706, 39, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1707, 39, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1708, 39, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 19, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1709, 39, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 20, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:32');
INSERT INTO `gen_table_column` VALUES (1710, 40, 'id', '10球下注表ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1711, 40, 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1712, 40, 'periods', '期数', 'bigint(20)', 'Long', 'periods', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1713, 40, 'game_id', '游戏ID', 'bigint(20)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1714, 40, 'game_name', '游戏名', 'varchar(25)', 'String', 'gameName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1715, 40, 'status', '投注状态（0投注 1撤单）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1716, 40, 'record_time', '投注时间', 'datetime', 'Date', 'recordTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1717, 40, 'check_time', NULL, 'timestamp', 'Date', 'checkTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1718, 40, 'count_money', '下注金额', 'float(11,2)', 'BigDecimal', 'countMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1719, 40, 'win_money', '中奖金额', 'float(11,2)', 'BigDecimal', 'winMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1720, 40, 'type1_big', '下注冠亚和大的金额', 'float(11,2)', 'BigDecimal', 'type1Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1721, 40, 'type1_small', '下注冠亚和小的金额', 'float(11,2)', 'BigDecimal', 'type1Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1722, 40, 'type1_single', '下注冠亚和单的金额', 'float(11,2)', 'BigDecimal', 'type1Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1723, 40, 'type1_double', '下注冠亚和双的金额', 'float(11,2)', 'BigDecimal', 'type1Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1724, 40, 'type1_num3', '下注冠亚和3的金额', 'float(11,2)', 'BigDecimal', 'type1Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1725, 40, 'type1_num4', '下注冠亚和4的金额', 'float(11,2)', 'BigDecimal', 'type1Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1726, 40, 'type1_num5', '下注冠亚和5的金额', 'float(11,2)', 'BigDecimal', 'type1Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1727, 40, 'type1_num6', '下注冠亚和6的金额', 'float(11,2)', 'BigDecimal', 'type1Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1728, 40, 'type1_num7', '下注冠亚和7的金额', 'float(11,2)', 'BigDecimal', 'type1Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1729, 40, 'type1_num8', '下注冠亚和8的金额', 'float(11,2)', 'BigDecimal', 'type1Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1730, 40, 'type1_num9', '下注冠亚和9的金额', 'float(11,2)', 'BigDecimal', 'type1Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1731, 40, 'type1_num10', '下注冠亚和10的金额', 'float(11,2)', 'BigDecimal', 'type1Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1732, 40, 'type1_num11', '下注冠亚和11的金额', 'float(11,2)', 'BigDecimal', 'type1Num11', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1733, 40, 'type1_num12', '下注冠亚和12的金额', 'float(11,2)', 'BigDecimal', 'type1Num12', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1734, 40, 'type1_num13', '下注冠亚和13的金额', 'float(11,2)', 'BigDecimal', 'type1Num13', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1735, 40, 'type1_num14', '下注冠亚和14的金额', 'float(11,2)', 'BigDecimal', 'type1Num14', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1736, 40, 'type1_num15', '下注冠亚和15的金额', 'float(11,2)', 'BigDecimal', 'type1Num15', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1737, 40, 'type1_num16', '下注冠亚和16的金额', 'float(11,2)', 'BigDecimal', 'type1Num16', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1738, 40, 'type1_num17', '下注冠亚和17的金额', 'float(11,2)', 'BigDecimal', 'type1Num17', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1739, 40, 'type1_num18', '下注冠亚和18的金额', 'float(11,2)', 'BigDecimal', 'type1Num18', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 30, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1740, 40, 'type1_num19', '下注冠亚和19的金额', 'float(11,2)', 'BigDecimal', 'type1Num19', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 31, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1741, 40, 'type2_big', '下注冠军大的金额', 'float(11,2)', 'BigDecimal', 'type2Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 32, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1742, 40, 'type2_small', '下注冠军小的金额', 'float(11,2)', 'BigDecimal', 'type2Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 33, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1743, 40, 'type2_single', '下注冠军单的金额', 'float(11,2)', 'BigDecimal', 'type2Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 34, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1744, 40, 'type2_double', '下注冠军双的金额', 'float(11,2)', 'BigDecimal', 'type2Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 35, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1745, 40, 'type2_loong', '下注冠军龙的金额', 'float(11,2)', 'BigDecimal', 'type2Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 36, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1746, 40, 'type2_tiger', '下注冠军虎的金额', 'float(11,2)', 'BigDecimal', 'type2Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 37, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1747, 40, 'type2_num1', '下注冠军1的金额', 'float(11,2)', 'BigDecimal', 'type2Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 38, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1748, 40, 'type2_num2', '下注冠军2的金额', 'float(11,2)', 'BigDecimal', 'type2Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 39, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1749, 40, 'type2_num3', '下注冠军3的金额', 'float(11,2)', 'BigDecimal', 'type2Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 40, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1750, 40, 'type2_num4', '下注冠军4的金额', 'float(11,2)', 'BigDecimal', 'type2Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 41, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1751, 40, 'type2_num5', '下注冠军5的金额', 'float(11,2)', 'BigDecimal', 'type2Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 42, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1752, 40, 'type2_num6', '下注冠军6的金额', 'float(11,2)', 'BigDecimal', 'type2Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 43, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1753, 40, 'type2_num7', '下注冠军7的金额', 'float(11,2)', 'BigDecimal', 'type2Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 44, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1754, 40, 'type2_num8', '下注冠军8的金额', 'float(11,2)', 'BigDecimal', 'type2Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 45, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1755, 40, 'type2_num9', '下注冠军9的金额', 'float(11,2)', 'BigDecimal', 'type2Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 46, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1756, 40, 'type2_num10', '下注冠军10的金额', 'float(11,2)', 'BigDecimal', 'type2Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 47, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1757, 40, 'type3_big', '下注亚军大的金额', 'float(11,2)', 'BigDecimal', 'type3Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 48, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1758, 40, 'type3_small', '下注亚军小的金额', 'float(11,2)', 'BigDecimal', 'type3Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 49, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1759, 40, 'type3_single', '下注亚军单的金额', 'float(11,2)', 'BigDecimal', 'type3Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 50, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1760, 40, 'type3_double', '下注亚军双的金额', 'float(11,2)', 'BigDecimal', 'type3Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 51, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1761, 40, 'type3_loong', '下注亚军龙的金额', 'float(11,2)', 'BigDecimal', 'type3Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 52, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1762, 40, 'type3_tiger', '下注亚军虎的金额', 'float(11,2)', 'BigDecimal', 'type3Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 53, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1763, 40, 'type3_num1', '下注亚军1的金额', 'float(11,2)', 'BigDecimal', 'type3Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 54, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1764, 40, 'type3_num2', '下注亚军2的金额', 'float(11,2)', 'BigDecimal', 'type3Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 55, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1765, 40, 'type3_num3', '下注亚军3的金额', 'float(11,2)', 'BigDecimal', 'type3Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 56, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1766, 40, 'type3_num4', '下注亚军4的金额', 'float(11,2)', 'BigDecimal', 'type3Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 57, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1767, 40, 'type3_num5', '下注亚军5的金额', 'float(11,2)', 'BigDecimal', 'type3Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 58, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1768, 40, 'type3_num6', '下注亚军6的金额', 'float(11,2)', 'BigDecimal', 'type3Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 59, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1769, 40, 'type3_num7', '下注亚军7的金额', 'float(11,2)', 'BigDecimal', 'type3Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 60, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1770, 40, 'type3_num8', '下注亚军8的金额', 'float(11,2)', 'BigDecimal', 'type3Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 61, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1771, 40, 'type3_num9', '下注亚军9的金额', 'float(11,2)', 'BigDecimal', 'type3Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 62, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1772, 40, 'type3_num10', '下注亚军10的金额', 'float(11,2)', 'BigDecimal', 'type3Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 63, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1773, 40, 'type4_big', '下注第三名大的金额', 'float(11,2)', 'BigDecimal', 'type4Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 64, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1774, 40, 'type4_small', '下注第三名小的金额', 'float(11,2)', 'BigDecimal', 'type4Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 65, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1775, 40, 'type4_single', '下注第三名单的金额', 'float(11,2)', 'BigDecimal', 'type4Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 66, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1776, 40, 'type4_double', '下注第三名双的金额', 'float(11,2)', 'BigDecimal', 'type4Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 67, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1777, 40, 'type4_loong', '下注第三名龙的金额', 'float(11,2)', 'BigDecimal', 'type4Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 68, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1778, 40, 'type4_tiger', '下注第三名虎的金额', 'float(11,2)', 'BigDecimal', 'type4Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 69, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1779, 40, 'type4_num1', '下注第三名1的金额', 'float(11,2)', 'BigDecimal', 'type4Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 70, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1780, 40, 'type4_num2', '下注第三名2的金额', 'float(11,2)', 'BigDecimal', 'type4Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 71, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1781, 40, 'type4_num3', '下注第三名3的金额', 'float(11,2)', 'BigDecimal', 'type4Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 72, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1782, 40, 'type4_num4', '下注第三名4的金额', 'float(11,2)', 'BigDecimal', 'type4Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 73, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1783, 40, 'type4_num5', '下注第三名5的金额', 'float(11,2)', 'BigDecimal', 'type4Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 74, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1784, 40, 'type4_num6', '下注第三名6的金额', 'float(11,2)', 'BigDecimal', 'type4Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 75, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1785, 40, 'type4_num7', '下注第三名7的金额', 'float(11,2)', 'BigDecimal', 'type4Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 76, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1786, 40, 'type4_num8', '下注第三名8的金额', 'float(11,2)', 'BigDecimal', 'type4Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 77, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1787, 40, 'type4_num9', '下注第三名9的金额', 'float(11,2)', 'BigDecimal', 'type4Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 78, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1788, 40, 'type4_num10', '下注第三名10的金额', 'float(11,2)', 'BigDecimal', 'type4Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 79, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1789, 40, 'type5_big', '下注第四名大的金额', 'float(11,2)', 'BigDecimal', 'type5Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 80, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1790, 40, 'type5_small', '下注第四名小的金额', 'float(11,2)', 'BigDecimal', 'type5Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 81, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1791, 40, 'type5_single', '下注第四名单的金额', 'float(11,2)', 'BigDecimal', 'type5Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 82, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1792, 40, 'type5_double', '下注第四名双的金额', 'float(11,2)', 'BigDecimal', 'type5Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 83, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1793, 40, 'type5_loong', '下注第四名龙的金额', 'float(11,2)', 'BigDecimal', 'type5Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 84, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1794, 40, 'type5_tiger', '下注第四名虎的金额', 'float(11,2)', 'BigDecimal', 'type5Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 85, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1795, 40, 'type5_num1', '下注第四名1的金额', 'float(11,2)', 'BigDecimal', 'type5Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 86, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1796, 40, 'type5_num2', '下注第四名2的金额', 'float(11,2)', 'BigDecimal', 'type5Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 87, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1797, 40, 'type5_num3', '下注第四名3的金额', 'float(11,2)', 'BigDecimal', 'type5Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 88, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1798, 40, 'type5_num4', '下注第四名4的金额', 'float(11,2)', 'BigDecimal', 'type5Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 89, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1799, 40, 'type5_num5', '下注第四名5的金额', 'float(11,2)', 'BigDecimal', 'type5Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 90, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1800, 40, 'type5_num6', '下注第四名6的金额', 'float(11,2)', 'BigDecimal', 'type5Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 91, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1801, 40, 'type5_num7', '下注第四名7的金额', 'float(11,2)', 'BigDecimal', 'type5Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 92, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1802, 40, 'type5_num8', '下注第四名8的金额', 'float(11,2)', 'BigDecimal', 'type5Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 93, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1803, 40, 'type5_num9', '下注第四名9的金额', 'float(11,2)', 'BigDecimal', 'type5Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 94, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1804, 40, 'type5_num10', '下注第四名10的金额', 'float(11,2)', 'BigDecimal', 'type5Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 95, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1805, 40, 'type6_big', '下注第五名大的金额', 'float(11,2)', 'BigDecimal', 'type6Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 96, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1806, 40, 'type6_small', '下注第五名小的金额', 'float(11,2)', 'BigDecimal', 'type6Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 97, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1807, 40, 'type6_single', '下注第五名单的金额', 'float(11,2)', 'BigDecimal', 'type6Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 98, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1808, 40, 'type6_double', '下注第五名双的金额', 'float(11,2)', 'BigDecimal', 'type6Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 99, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1809, 40, 'type6_loong', '下注第五名龙的金额', 'float(11,2)', 'BigDecimal', 'type6Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 100, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1810, 40, 'type6_tiger', '下注第五名虎的金额', 'float(11,2)', 'BigDecimal', 'type6Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 101, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1811, 40, 'type6_num1', '下注第五名1的金额', 'float(11,2)', 'BigDecimal', 'type6Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 102, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1812, 40, 'type6_num2', '下注第五名2的金额', 'float(11,2)', 'BigDecimal', 'type6Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 103, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1813, 40, 'type6_num3', '下注第五名3的金额', 'float(11,2)', 'BigDecimal', 'type6Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 104, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1814, 40, 'type6_num4', '下注第五名4的金额', 'float(11,2)', 'BigDecimal', 'type6Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 105, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1815, 40, 'type6_num5', '下注第五名5的金额', 'float(11,2)', 'BigDecimal', 'type6Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 106, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1816, 40, 'type6_num6', '下注第五名6的金额', 'float(11,2)', 'BigDecimal', 'type6Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 107, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1817, 40, 'type6_num7', '下注第五名7的金额', 'float(11,2)', 'BigDecimal', 'type6Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 108, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1818, 40, 'type6_num8', '下注第五名8的金额', 'float(11,2)', 'BigDecimal', 'type6Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 109, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1819, 40, 'type6_num9', '下注第五名9的金额', 'float(11,2)', 'BigDecimal', 'type6Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 110, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1820, 40, 'type6_num10', '下注第五名10的金额', 'float(11,2)', 'BigDecimal', 'type6Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 111, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1821, 40, 'type7_big', '下注第六名大的金额', 'float(11,2)', 'BigDecimal', 'type7Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 112, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1822, 40, 'type7_small', '下注第六名小的金额', 'float(11,2)', 'BigDecimal', 'type7Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 113, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1823, 40, 'type7_single', '下注第六名单的金额', 'float(11,2)', 'BigDecimal', 'type7Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 114, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1824, 40, 'type7_double', '下注第六名双的金额', 'float(11,2)', 'BigDecimal', 'type7Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 115, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1825, 40, 'type7_loong', '下注第六名龙的金额', 'float(11,2)', 'BigDecimal', 'type7Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 116, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1826, 40, 'type7_tiger', '下注第六名虎的金额', 'float(11,2)', 'BigDecimal', 'type7Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 117, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1827, 40, 'type7_num1', '下注第六名1的金额', 'float(11,2)', 'BigDecimal', 'type7Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 118, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1828, 40, 'type7_num2', '下注第六名2的金额', 'float(11,2)', 'BigDecimal', 'type7Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 119, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1829, 40, 'type7_num3', '下注第六名3的金额', 'float(11,2)', 'BigDecimal', 'type7Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 120, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1830, 40, 'type7_num4', '下注第六名4的金额', 'float(11,2)', 'BigDecimal', 'type7Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 121, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1831, 40, 'type7_num5', '下注第六名5的金额', 'float(11,2)', 'BigDecimal', 'type7Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 122, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1832, 40, 'type7_num6', '下注第六名6的金额', 'float(11,2)', 'BigDecimal', 'type7Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 123, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1833, 40, 'type7_num7', '下注第六名7的金额', 'float(11,2)', 'BigDecimal', 'type7Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 124, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1834, 40, 'type7_num8', '下注第六名8的金额', 'float(11,2)', 'BigDecimal', 'type7Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 125, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1835, 40, 'type7_num9', '下注第六名9的金额', 'float(11,2)', 'BigDecimal', 'type7Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 126, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1836, 40, 'type7_num10', '下注第六名10的金额', 'float(11,2)', 'BigDecimal', 'type7Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 127, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1837, 40, 'type8_big', '下注第七名大的金额', 'float(11,2)', 'BigDecimal', 'type8Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 128, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1838, 40, 'type8_small', '下注第七名小的金额', 'float(11,2)', 'BigDecimal', 'type8Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 129, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1839, 40, 'type8_single', '下注第七名单的金额', 'float(11,2)', 'BigDecimal', 'type8Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 130, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1840, 40, 'type8_double', '下注第七名双的金额', 'float(11,2)', 'BigDecimal', 'type8Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 131, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1841, 40, 'type8_loong', '下注第七名龙的金额', 'float(11,2)', 'BigDecimal', 'type8Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 132, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1842, 40, 'type8_tiger', '下注第七名虎的金额', 'float(11,2)', 'BigDecimal', 'type8Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 133, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1843, 40, 'type8_num1', '下注第七名1的金额', 'float(11,2)', 'BigDecimal', 'type8Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 134, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1844, 40, 'type8_num2', '下注第七名2的金额', 'float(11,2)', 'BigDecimal', 'type8Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 135, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1845, 40, 'type8_num3', '下注第七名3的金额', 'float(11,2)', 'BigDecimal', 'type8Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 136, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1846, 40, 'type8_num4', '下注第七名4的金额', 'float(11,2)', 'BigDecimal', 'type8Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 137, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1847, 40, 'type8_num5', '下注第七名5的金额', 'float(11,2)', 'BigDecimal', 'type8Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 138, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1848, 40, 'type8_num6', '下注第七名6的金额', 'float(11,2)', 'BigDecimal', 'type8Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 139, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1849, 40, 'type8_num7', '下注第七名7的金额', 'float(11,2)', 'BigDecimal', 'type8Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 140, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1850, 40, 'type8_num8', '下注第七名8的金额', 'float(11,2)', 'BigDecimal', 'type8Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 141, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1851, 40, 'type8_num9', '下注第七名9的金额', 'float(11,2)', 'BigDecimal', 'type8Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 142, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1852, 40, 'type8_num10', '下注第七名10的金额', 'float(11,2)', 'BigDecimal', 'type8Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 143, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1853, 40, 'type9_big', '下注第八名大的金额', 'float(11,2)', 'BigDecimal', 'type9Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 144, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1854, 40, 'type9_small', '下注第八名小的金额', 'float(11,2)', 'BigDecimal', 'type9Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 145, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1855, 40, 'type9_single', '下注第八名单的金额', 'float(11,2)', 'BigDecimal', 'type9Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 146, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1856, 40, 'type9_double', '下注第八名双的金额', 'float(11,2)', 'BigDecimal', 'type9Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 147, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1857, 40, 'type9_loong', '下注第八名龙的金额', 'float(11,2)', 'BigDecimal', 'type9Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 148, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1858, 40, 'type9_tiger', '下注第八名虎的金额', 'float(11,2)', 'BigDecimal', 'type9Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 149, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1859, 40, 'type9_num1', '下注第八名1的金额', 'float(11,2)', 'BigDecimal', 'type9Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 150, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1860, 40, 'type9_num2', '下注第八名2的金额', 'float(11,2)', 'BigDecimal', 'type9Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 151, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1861, 40, 'type9_num3', '下注第八名3的金额', 'float(11,2)', 'BigDecimal', 'type9Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 152, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1862, 40, 'type9_num4', '下注第八名4的金额', 'float(11,2)', 'BigDecimal', 'type9Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 153, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1863, 40, 'type9_num5', '下注第八名5的金额', 'float(11,2)', 'BigDecimal', 'type9Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 154, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1864, 40, 'type9_num6', '下注第八名6的金额', 'float(11,2)', 'BigDecimal', 'type9Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 155, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1865, 40, 'type9_num7', '下注第八名7的金额', 'float(11,2)', 'BigDecimal', 'type9Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 156, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1866, 40, 'type9_num8', '下注第八名8的金额', 'float(11,2)', 'BigDecimal', 'type9Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 157, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1867, 40, 'type9_num9', '下注第八名9的金额', 'float(11,2)', 'BigDecimal', 'type9Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 158, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1868, 40, 'type9_num10', '下注第八名10的金额', 'float(11,2)', 'BigDecimal', 'type9Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 159, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1869, 40, 'type10_big', '下注第九名大的金额', 'float(11,2)', 'BigDecimal', 'type10Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 160, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1870, 40, 'type10_small', '下注第九名小的金额', 'float(11,2)', 'BigDecimal', 'type10Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 161, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1871, 40, 'type10_single', '下注第九名单的金额', 'float(11,2)', 'BigDecimal', 'type10Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 162, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1872, 40, 'type10_double', '下注第九名双的金额', 'float(11,2)', 'BigDecimal', 'type10Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 163, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1873, 40, 'type10_loong', '下注第九名龙的金额', 'float(11,2)', 'BigDecimal', 'type10Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 164, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1874, 40, 'type10_tiger', '下注第九名虎的金额', 'float(11,2)', 'BigDecimal', 'type10Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 165, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1875, 40, 'type10_num1', '下注第九名1的金额', 'float(11,2)', 'BigDecimal', 'type10Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 166, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1876, 40, 'type10_num2', '下注第九名2的金额', 'float(11,2)', 'BigDecimal', 'type10Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 167, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1877, 40, 'type10_num3', '下注第九名3的金额', 'float(11,2)', 'BigDecimal', 'type10Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 168, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1878, 40, 'type10_num4', '下注第九名4的金额', 'float(11,2)', 'BigDecimal', 'type10Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 169, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1879, 40, 'type10_num5', '下注第九名5的金额', 'float(11,2)', 'BigDecimal', 'type10Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 170, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1880, 40, 'type10_num6', '下注第九名6的金额', 'float(11,2)', 'BigDecimal', 'type10Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 171, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1881, 40, 'type10_num7', '下注第九名7的金额', 'float(11,2)', 'BigDecimal', 'type10Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 172, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1882, 40, 'type10_num8', '下注第九名8的金额', 'float(11,2)', 'BigDecimal', 'type10Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 173, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1883, 40, 'type10_num9', '下注第九名9的金额', 'float(11,2)', 'BigDecimal', 'type10Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 174, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1884, 40, 'type10_num10', '下注第九名10的金额', 'float(11,2)', 'BigDecimal', 'type10Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 175, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1885, 40, 'type11_big', '下注第十名大的金额', 'float(11,2)', 'BigDecimal', 'type11Big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 176, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1886, 40, 'type11_small', '下注第十名小的金额', 'float(11,2)', 'BigDecimal', 'type11Small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 177, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1887, 40, 'type11_single', '下注第十名单的金额', 'float(11,2)', 'BigDecimal', 'type11Single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 178, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1888, 40, 'type11_double', '下注第十名双的金额', 'float(11,2)', 'BigDecimal', 'type11Double', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 179, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1889, 40, 'type11_loong', '下注第十名龙的金额', 'float(11,2)', 'BigDecimal', 'type11Loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 180, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1890, 40, 'type11_tiger', '下注第十名虎的金额', 'float(11,2)', 'BigDecimal', 'type11Tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 181, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1891, 40, 'type11_num1', '下注第十名1的金额', 'float(11,2)', 'BigDecimal', 'type11Num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 182, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1892, 40, 'type11_num2', '下注第十名2的金额', 'float(11,2)', 'BigDecimal', 'type11Num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 183, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1893, 40, 'type11_num3', '下注第十名3的金额', 'float(11,2)', 'BigDecimal', 'type11Num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 184, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1894, 40, 'type11_num4', '下注第十名4的金额', 'float(11,2)', 'BigDecimal', 'type11Num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 185, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1895, 40, 'type11_num5', '下注第十名5的金额', 'float(11,2)', 'BigDecimal', 'type11Num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 186, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1896, 40, 'type11_num6', '下注第十名6的金额', 'float(11,2)', 'BigDecimal', 'type11Num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 187, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1897, 40, 'type11_num7', '下注第十名7的金额', 'float(11,2)', 'BigDecimal', 'type11Num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 188, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1898, 40, 'type11_num8', '下注第十名8的金额', 'float(11,2)', 'BigDecimal', 'type11Num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 189, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1899, 40, 'type11_num9', '下注第十名9的金额', 'float(11,2)', 'BigDecimal', 'type11Num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 190, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1900, 40, 'type11_num10', '下注第十名10的金额', 'float(11,2)', 'BigDecimal', 'type11Num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 191, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1901, 40, 'big_single', '下注大单的金额', 'float(11,2)', 'BigDecimal', 'bigSingle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 192, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1902, 40, 'big_double', '下注大双的金额', 'float(11,2)', 'BigDecimal', 'bigDouble', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 193, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1903, 40, 'small_single', '下注小单的金额', 'float(11,2)', 'BigDecimal', 'smallSingle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 194, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1904, 40, 'small_double', '下注小双的金额', 'float(11,2)', 'BigDecimal', 'smallDouble', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 195, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1905, 40, 'num1', '开奖号码1', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 196, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1906, 40, 'num2', '开奖号码2', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 197, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1907, 40, 'num3', '开奖号码3', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 198, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1908, 40, 'num4', '开奖号码4', 'int(11)', 'Long', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 199, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1909, 40, 'num5', '开奖号码5', 'int(11)', 'Long', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 200, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1910, 40, 'num6', '开奖号码6', 'int(11)', 'Long', 'num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 201, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1911, 40, 'num7', '开奖号码7', 'int(11)', 'Long', 'num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 202, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1912, 40, 'num8', '开奖号码8', 'int(11)', 'Long', 'num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 203, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1913, 40, 'num9', '开奖号码9', 'int(11)', 'Long', 'num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 204, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1914, 40, 'num10', '开奖号码10', 'int(11)', 'Long', 'num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 205, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1915, 40, 'sum_num', '开奖合算数字', 'int(11)', 'Long', 'sumNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 206, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1916, 40, 'is_delete', '是否扣除(0否 1是)', 'char(1)', 'String', 'isDelete', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 207, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1917, 40, 'is_deduct', '是否扣除', 'char(1)', 'String', 'isDeduct', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 208, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1918, 40, 'house', '房间号', 'int(4)', 'Integer', 'house', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 209, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1919, 40, 'hz_id', '是否合庄模式', 'char(1)', 'String', 'hzId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 210, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1920, 40, 'hz_user', '是否用户(0否 1是)', 'char(1)', 'String', 'hzUser', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 211, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1921, 40, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 212, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1922, 40, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 213, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1923, 40, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 214, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1924, 40, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 215, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1925, 40, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 216, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:16:52');
INSERT INTO `gen_table_column` VALUES (1926, 41, 'id', '10球开奖开奖表ID', 'bigint(20) unsigned', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1927, 41, 'periods', '期数', 'bigint(20)', 'Long', 'periods', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1928, 41, 'game_id', '游戏ID', 'bigint(20)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1929, 41, 'game_name', '游戏名', 'varchar(25)', 'String', 'gameName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1930, 41, 'num1', '开奖号码1', 'int(11)', 'Long', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1931, 41, 'num2', '开奖号码2', 'int(11)', 'Long', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1932, 41, 'num3', '开奖号码3', 'int(11)', 'Long', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1933, 41, 'sum_num', '开奖合计号码', 'int(11)', 'Long', 'sumNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1934, 41, 'bet_time', '封盘投注截止时间', 'datetime', 'Date', 'betTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1935, 41, 'pre_time', '预计开奖时间', 'datetime', 'Date', 'preTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1936, 41, 'status', '是否已经开奖（0未开奖 1已开奖）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1937, 41, 'the_time', '开奖时间', 'datetime', 'Date', 'theTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 12, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1938, 41, 'count_money', '总下注金额', 'int(11)', 'Long', 'countMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1939, 41, 'win_money', '总中奖金额', 'int(11)', 'Long', 'winMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1940, 41, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1941, 41, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1942, 41, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1943, 41, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1944, 41, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 19, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:05');
INSERT INTO `gen_table_column` VALUES (1945, 42, 'id', '3球开奖历史ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:15');
INSERT INTO `gen_table_column` VALUES (1946, 42, 'periods', '期数', 'bigint(20)', 'Long', 'periods', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:15');
INSERT INTO `gen_table_column` VALUES (1947, 42, 'game_id', '游戏ID', 'bigint(20)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:15');
INSERT INTO `gen_table_column` VALUES (1948, 42, 'game_name', '游戏名', 'varchar(25)', 'String', 'gameName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:15');
INSERT INTO `gen_table_column` VALUES (1949, 42, 'time', '开奖时间', 'datetime', 'Date', 'time', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:15');
INSERT INTO `gen_table_column` VALUES (1950, 42, 'sum_1', '开奖号码1', 'int(11)', 'Long', 'sum1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:15');
INSERT INTO `gen_table_column` VALUES (1951, 42, 'sum_2', '开奖号码2', 'int(11)', 'Long', 'sum2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:15');
INSERT INTO `gen_table_column` VALUES (1952, 42, 'sum_3', '开奖号码3', 'int(11)', 'Long', 'sum3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:15');
INSERT INTO `gen_table_column` VALUES (1953, 42, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:15');
INSERT INTO `gen_table_column` VALUES (1954, 42, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:15');
INSERT INTO `gen_table_column` VALUES (1955, 42, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:15');
INSERT INTO `gen_table_column` VALUES (1956, 42, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:15');
INSERT INTO `gen_table_column` VALUES (1957, 42, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 13, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:17:15');
INSERT INTO `gen_table_column` VALUES (1958, 43, 'id', '下注表ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1959, 43, 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1960, 43, 'periods', '期数', 'bigint(20)', 'Long', 'periods', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1961, 43, 'game_id', '游戏ID', 'bigint(20)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1962, 43, 'game_name', '游戏名', 'varchar(25)', 'String', 'gameName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1963, 43, 'status', '投注状态（0投注 1撤单）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1964, 43, 'record_time', '投注时间', 'datetime', 'Date', 'recordTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1965, 43, 'check_time', '确认时间', 'timestamp', 'Date', 'checkTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1966, 43, 'count_money', '下注金额', 'float(11,2)', 'BigDecimal', 'countMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1967, 43, 'win_money', '中奖金额', 'float(11,2)', 'BigDecimal', 'winMoney', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1968, 43, 'big', '下注大的金额', 'float(11,2)', 'BigDecimal', 'big', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1969, 43, 'small', '下注小的金额', 'float(11,2)', 'BigDecimal', 'small', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1970, 43, 'single', '下注单的金额', 'float(11,2)', 'BigDecimal', 'single', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1971, 43, 'double_amount', '下注双的金额', 'float(11,2)', 'BigDecimal', 'doubleAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1972, 43, 'much_Big', '下注极大的金额', 'float(11,2)', 'BigDecimal', 'muchBig', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1973, 43, 'big_Single', '下注大单的金额', 'float(11,2)', 'BigDecimal', 'bigSingle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1974, 43, 'small_Single', '下注小单的金额', 'float(11,2)', 'BigDecimal', 'smallSingle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1975, 43, 'big_Double', '下注大双的金额', 'float(11,2)', 'BigDecimal', 'bigDouble', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1976, 43, 'small_Double', '下注小双的金额', 'float(11,2)', 'BigDecimal', 'smallDouble', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1977, 43, 'much_Small', '下注极小的金额', 'float(11,2)', 'BigDecimal', 'muchSmall', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1978, 43, 'num0', '下注数字0的金额', 'float(11,2)', 'BigDecimal', 'num0', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1979, 43, 'num1', '下注数字1的金额', 'float(11,2)', 'BigDecimal', 'num1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1980, 43, 'num2', '下注数字2的金额', 'float(11,2)', 'BigDecimal', 'num2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1981, 43, 'num3', '下注数字3的金额', 'float(11,2)', 'BigDecimal', 'num3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1982, 43, 'num4', '下注数字4的金额', 'float(11,2)', 'BigDecimal', 'num4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1983, 43, 'num5', '下注数字5的金额', 'float(11,2)', 'BigDecimal', 'num5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1984, 43, 'num6', '下注数字6的金额', 'float(11,2)', 'BigDecimal', 'num6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1985, 43, 'num7', '下注数字7的金额', 'float(11,2)', 'BigDecimal', 'num7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1986, 43, 'num8', '下注数字8的金额', 'float(11,2)', 'BigDecimal', 'num8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1987, 43, 'num9', '下注数字9的金额', 'float(11,2)', 'BigDecimal', 'num9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 30, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1988, 43, 'num10', '下注数字10的金额', 'float(11,2)', 'BigDecimal', 'num10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 31, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1989, 43, 'num11', '下注数字11的金额', 'float(11,2)', 'BigDecimal', 'num11', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 32, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1990, 43, 'num12', '下注数字12的金额', 'float(11,2)', 'BigDecimal', 'num12', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 33, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1991, 43, 'num13', '下注数字13的金额', 'float(11,2)', 'BigDecimal', 'num13', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 34, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1992, 43, 'num14', '下注数字14的金额', 'float(11,2)', 'BigDecimal', 'num14', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 35, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1993, 43, 'num15', '下注数字15的金额', 'float(11,2)', 'BigDecimal', 'num15', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 36, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1994, 43, 'num16', '下注数字16的金额', 'float(11,2)', 'BigDecimal', 'num16', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 37, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1995, 43, 'num17', '下注数字17的金额', 'float(11,2)', 'BigDecimal', 'num17', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 38, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1996, 43, 'num18', '下注数字18的金额', 'float(11,2)', 'BigDecimal', 'num18', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 39, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1997, 43, 'num19', '下注数字19的金额', 'float(11,2)', 'BigDecimal', 'num19', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 40, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1998, 43, 'num20', '下注数字20的金额', 'float(11,2)', 'BigDecimal', 'num20', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 41, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (1999, 43, 'num21', '下注数字21的金额', 'float(11,2)', 'BigDecimal', 'num21', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 42, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2000, 43, 'num22', '下注数字22的金额', 'float(11,2)', 'BigDecimal', 'num22', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 43, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2001, 43, 'num23', '下注数字23的金额', 'float(11,2)', 'BigDecimal', 'num23', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 44, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2002, 43, 'num24', '下注数字24的金额', 'float(11,2)', 'BigDecimal', 'num24', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 45, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2003, 43, 'num25', '下注数字25的金额', 'float(11,2)', 'BigDecimal', 'num25', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 46, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2004, 43, 'num26', '下注数字26的金额', 'float(11,2)', 'BigDecimal', 'num26', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 47, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2005, 43, 'num27', '下注数字27的金额', 'float(11,2)', 'BigDecimal', 'num27', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 48, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2006, 43, 'red', '下注红的金额', 'float(11,2)', 'BigDecimal', 'red', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 49, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2007, 43, 'green', '下注绿的金额', 'float(11,2)', 'BigDecimal', 'green', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 50, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2008, 43, 'blue', '下注蓝的金额', 'float(11,2)', 'BigDecimal', 'blue', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 51, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2009, 43, 'loong', '下注龙的金额', 'float(11,2)', 'BigDecimal', 'loong', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 52, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2010, 43, 'tiger', '下注虎的金额', 'float(11,2)', 'BigDecimal', 'tiger', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 53, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2011, 43, 'close', '下注合的金额', 'float(11,2)', 'BigDecimal', 'close', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 54, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2012, 43, 'leopard', '下注豹子的金额', 'float(11,2)', 'BigDecimal', 'leopard', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 55, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2013, 43, 'pairs', '下注对子的金额', 'float(11,2)', 'BigDecimal', 'pairs', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 56, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2014, 43, 'shun', '下注顺子的金额', 'float(11,2)', 'BigDecimal', 'shun', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 57, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2015, 43, 'vip', 'VIP房间', 'int(4)', 'Integer', 'vip', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 58, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2016, 43, 'n1', '开奖号码1', 'int(11)', 'Long', 'n1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 59, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2017, 43, 'n2', '开奖号码2', 'int(11)', 'Long', 'n2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 60, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2018, 43, 'n3', '开奖号码3', 'int(11)', 'Long', 'n3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 61, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2019, 43, 'sum_num', '开奖合算数字', 'int(11)', 'Long', 'sumNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 62, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2020, 43, 'is_delete', '是否扣除(0否 1是)', 'char(1)', 'String', 'isDelete', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 63, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2021, 43, 'is_deduct', '是否扣除', 'char(1)', 'String', 'isDeduct', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 64, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2022, 43, 'house', '房间号', 'int(4)', 'Integer', 'house', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 65, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2023, 43, 'hz_id', '是否合庄模式', 'char(1)', 'String', 'hzId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 66, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2024, 43, 'hz_user', '是否用户(0否 1是)', 'char(1)', 'String', 'hzUser', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 67, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2025, 43, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 68, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2026, 43, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 69, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2027, 43, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 70, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2028, 43, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 71, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2029, 43, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 72, 'admin', '2024-04-06 11:14:30', '', '2024-04-06 11:20:05');
INSERT INTO `gen_table_column` VALUES (2050, 46, 'id', '支付方式id', 'int(11) unsigned', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-07 19:14:23', '', '2024-04-07 19:15:10');
INSERT INTO `gen_table_column` VALUES (2051, 46, 'payment_account', '收款账号', 'varchar(255)', 'String', 'paymentAccount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-07 19:14:23', '', '2024-04-07 19:15:10');
INSERT INTO `gen_table_column` VALUES (2052, 46, 'payment_name', '收款姓名', 'varchar(255)', 'String', 'paymentName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-04-07 19:14:23', '', '2024-04-07 19:15:10');
INSERT INTO `gen_table_column` VALUES (2053, 46, 'payment_type', '收款类型（0：微信、1：支付宝、2：银联）', 'varchar(255)', 'String', 'paymentType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'sys_payment_type', 4, 'admin', '2024-04-07 19:14:23', '', '2024-04-07 19:15:10');
INSERT INTO `gen_table_column` VALUES (2054, 46, 'payment_pic', '收款码图片地址', 'varchar(255)', 'String', 'paymentPic', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'imageUpload', '', 5, 'admin', '2024-04-07 19:14:23', '', '2024-04-07 19:15:10');
INSERT INTO `gen_table_column` VALUES (2055, 46, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_common_status', 6, 'admin', '2024-04-07 19:14:23', '', '2024-04-07 19:15:10');
INSERT INTO `gen_table_column` VALUES (2056, 46, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-04-07 19:14:23', '', '2024-04-07 19:15:10');
INSERT INTO `gen_table_column` VALUES (2057, 46, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-04-07 19:14:23', '', '2024-04-07 19:15:10');
INSERT INTO `gen_table_column` VALUES (2058, 46, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-04-07 19:14:23', '', '2024-04-07 19:15:10');
INSERT INTO `gen_table_column` VALUES (2059, 46, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-04-07 19:14:23', '', '2024-04-07 19:15:10');
INSERT INTO `gen_table_column` VALUES (2060, 46, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '0', NULL, 'EQ', 'textarea', '', 11, 'admin', '2024-04-07 19:14:23', '', '2024-04-07 19:15:10');
INSERT INTO `gen_table_column` VALUES (2061, 47, 'id', '转化表ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-22 18:59:46', '', '2024-04-22 19:00:00');
INSERT INTO `gen_table_column` VALUES (2062, 47, 'game_id', '游戏ID', 'bigint(20)', 'Long', 'gameId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-22 18:59:46', '', '2024-04-22 19:00:00');
INSERT INTO `gen_table_column` VALUES (2063, 47, 'key', '投注字段KEY', 'varchar(24)', 'String', 'key', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-04-22 18:59:46', '', '2024-04-22 19:00:00');
INSERT INTO `gen_table_column` VALUES (2064, 47, 'title', '投注字段名称', 'varchar(24)', 'String', 'title', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-04-22 18:59:46', '', '2024-04-22 19:00:00');
INSERT INTO `gen_table_column` VALUES (2065, 47, 'play_group', '投注类型', 'tinyint(3)', 'Integer', 'playGroup', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-04-22 18:59:46', '', '2024-04-22 19:00:00');
INSERT INTO `gen_table_column` VALUES (2066, 47, 'play_group_title', '投注类型名称', 'varchar(24)', 'String', 'playGroupTitle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-04-22 18:59:46', '', '2024-04-22 19:00:00');
INSERT INTO `gen_table_column` VALUES (2067, 47, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-04-22 18:59:46', '', '2024-04-22 19:00:00');
INSERT INTO `gen_table_column` VALUES (2068, 47, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-04-22 18:59:46', '', '2024-04-22 19:00:00');
INSERT INTO `gen_table_column` VALUES (2069, 47, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-04-22 18:59:46', '', '2024-04-22 19:00:00');
INSERT INTO `gen_table_column` VALUES (2070, 47, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-04-22 18:59:46', '', '2024-04-22 19:00:00');
INSERT INTO `gen_table_column` VALUES (2071, 47, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2024-04-22 18:59:46', '', '2024-04-22 19:00:00');
INSERT INTO `gen_table_column` VALUES (2072, 30, 'big_small_money', '大小单双盈亏金额', 'float(11,2)', 'Float', 'bigSmallMoney', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, '', '2024-04-29 21:48:29', '', '2024-05-18 22:10:25');
INSERT INTO `gen_table_column` VALUES (2073, 30, 'other_money', '其他盈亏金额', 'float(11,2)', 'Float', 'otherMoney', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, '', '2024-04-29 21:48:29', '', '2024-05-18 22:10:25');
INSERT INTO `gen_table_column` VALUES (2074, 30, 'deduct_money', '扣除金额', 'float(11,2)', 'Float', 'deductMoney', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, '', '2024-04-29 21:48:29', '', '2024-05-18 22:10:25');
INSERT INTO `gen_table_column` VALUES (2075, 30, 'is_delete', '是否扣除(0否 1是)', 'char(1)', 'String', 'isDelete', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, '', '2024-04-29 21:48:29', '', '2024-05-18 22:10:25');
INSERT INTO `gen_table_column` VALUES (2076, 30, 'combination_money', '混合盈亏金额', 'float(11,2)', 'Float', 'combinationMoney', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, '', '2024-04-29 21:54:44', '', '2024-05-18 22:10:25');
INSERT INTO `gen_table_column` VALUES (2087, 49, 'id', '管理员记录表ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-05-07 18:59:15', '', '2024-05-07 18:59:31');
INSERT INTO `gen_table_column` VALUES (2088, 49, 'type', '记录类型 1-上分 2-下分 3-手动上分 4-手动下分 5-返水处理 6-VIP佣金发放 7-冻结', 'int(10)', 'Integer', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2024-05-07 18:59:15', '', '2024-05-07 18:59:31');
INSERT INTO `gen_table_column` VALUES (2089, 49, 'is_agree', '是否是同意操作 0-同意 1-拒绝', 'varchar(1)', 'String', 'isAgree', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-05-07 18:59:15', '', '2024-05-07 18:59:31');
INSERT INTO `gen_table_column` VALUES (2090, 49, 'origin_id', '对应的原始记录表的id type123456对应usermoney表 7对应被冻结的UserId', 'bigint(20)', 'Long', 'originId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-05-07 18:59:15', '', '2024-05-07 18:59:31');
INSERT INTO `gen_table_column` VALUES (2091, 49, 'admin_user_id', '操作的管理员id', 'bigint(20)', 'Long', 'adminUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-05-07 18:59:15', '', '2024-05-07 18:59:31');
INSERT INTO `gen_table_column` VALUES (2092, 49, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-05-07 18:59:15', '', '2024-05-07 18:59:31');
INSERT INTO `gen_table_column` VALUES (2093, 49, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-05-07 18:59:15', '', '2024-05-07 18:59:31');
INSERT INTO `gen_table_column` VALUES (2094, 49, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-05-07 18:59:15', '', '2024-05-07 18:59:31');
INSERT INTO `gen_table_column` VALUES (2095, 49, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-05-07 18:59:15', '', '2024-05-07 18:59:31');
INSERT INTO `gen_table_column` VALUES (2096, 49, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2024-05-07 18:59:15', '', '2024-05-07 18:59:31');
INSERT INTO `gen_table_column` VALUES (2097, 30, 'cash_back_money', '反水金额', 'float(11,2)', 'Float', 'cashBackMoney', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, '', '2024-05-11 17:03:18', '', '2024-05-18 22:10:25');
INSERT INTO `gen_table_column` VALUES (2098, 30, 'commission_money', '佣金金额', 'float(11,2)', 'Float', 'commissionMoney', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 12, '', '2024-05-18 22:10:02', '', '2024-05-18 22:10:25');

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
-- Table structure for sys_admin_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin_record`;
CREATE TABLE `sys_admin_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '管理员记录表ID',
  `type` int(10) NOT NULL DEFAULT 0 COMMENT '记录类型 1-上分 2-下分 3-手动上分 4-手动下分 5-返水处理 6-VIP佣金发放 7-冻结',
  `is_agree` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '是否是同意操作 0-同意 1-拒绝',
  `origin_id` bigint(20) NULL DEFAULT NULL COMMENT '对应的原始记录表的id type123456对应usermoney表 7对应被冻结的UserId',
  `admin_user_id` bigint(20) NOT NULL COMMENT '操作的管理员id',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '管理员记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_admin_record
-- ----------------------------
INSERT INTO `sys_admin_record` VALUES (1, 8, '0', 38, 1, NULL, '2024-05-07 19:14:11', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (2, 8, '0', 41, 1, NULL, '2024-05-07 19:22:23', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (3, 2, '0', 31, 1, NULL, '2024-05-08 21:02:49', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (4, 2, '1', 33, 1, NULL, '2024-05-08 21:05:48', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (5, 2, '1', 18, 1, NULL, '2024-05-08 21:25:30', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (6, 2, '0', 18, 1, NULL, '2024-05-08 21:30:37', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (7, 1, '1', 18, 1, NULL, '2024-05-08 21:44:55', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (8, 1, '0', 34, 1, NULL, '2024-05-08 21:45:35', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (9, 3, '0', 35, 1, NULL, '2024-05-09 18:42:07', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (10, 3, '0', 36, 1, NULL, '2024-05-09 18:43:22', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (11, 4, '0', 37, 1, NULL, '2024-05-09 18:43:46', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (12, 5, '0', 70, 1, NULL, '2024-05-18 15:24:35', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (13, 5, '0', 71, 1, NULL, '2024-05-18 16:32:20', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (14, 5, '0', 72, 1, NULL, '2024-05-18 16:35:37', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (15, 5, '0', 73, 1, NULL, '2024-05-19 19:45:31', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (16, 5, '0', 74, 1, NULL, '2024-05-19 19:47:58', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (17, 5, '0', 75, 1, NULL, '2024-05-19 19:48:23', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (18, 6, '0', 77, 1, NULL, '2024-05-19 19:53:24', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (19, 6, '0', 78, 1, NULL, '2024-05-19 19:57:08', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (20, 6, '0', 79, 1, NULL, '2024-05-19 19:57:08', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (21, 1, '0', 126, 4, NULL, '2024-06-05 11:48:21', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (22, 2, '1', 148, 2, NULL, '2024-06-08 21:43:50', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (23, 1, '0', 254, 2, NULL, '2024-06-25 15:32:30', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (24, 2, '0', 273, 2, NULL, '2024-06-25 15:58:01', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (25, 1, '0', 274, 2, NULL, '2024-06-25 15:59:14', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (26, 2, '0', 275, 2, NULL, '2024-06-25 16:03:19', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (27, 3, '0', 276, 1, NULL, '2024-06-25 20:07:14', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (28, 1, '1', 277, 2, NULL, '2024-07-02 22:46:05', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (29, 1, '0', 278, 2, NULL, '2024-07-02 22:46:12', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (30, 2, '0', 337, 2, NULL, '2024-07-02 22:58:16', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (31, 1, '0', 505, 3, NULL, '2024-07-04 22:34:00', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (32, 3, '0', 588, 1, NULL, '2024-07-04 23:49:48', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (33, 1, '0', 683, 2, NULL, '2024-07-09 15:43:27', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (34, 2, '0', 684, 2, NULL, '2024-07-09 15:44:21', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (35, 1, '0', 750, 3, NULL, '2024-07-10 21:35:10', NULL, NULL, NULL);
INSERT INTO `sys_admin_record` VALUES (36, 1, '0', 1470, 2, NULL, '2024-07-15 19:38:01', NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1189 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏投注项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_bet_item
-- ----------------------------
INSERT INTO `sys_bet_item` VALUES (2, 1, 1, 'big', '大', NULL, 2.00, 9999.99, 2.00, 2, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 15:58:37', '');
INSERT INTO `sys_bet_item` VALUES (3, 1, 1, 'small', '小', NULL, 2.00, 9999.99, 2.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 15:57:22', '');
INSERT INTO `sys_bet_item` VALUES (4, 1, 1, 'single', '单', NULL, 2.00, 9999.99, 5.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (5, 1, 1, 'doubleFlg', '双', NULL, 2.00, 9999.99, 5.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (6, 1, 1, 'muchbig', '极大', NULL, 15.00, 500.00, 2.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (7, 1, 1, 'bigsingle', '大单', NULL, 4.20, 9999.99, 5.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (8, 1, 1, 'smallsingle', '小单', NULL, 4.60, 9999.99, 5.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (9, 1, 1, 'bigdouble', '大双', NULL, 4.60, 9999.99, 5.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:43', '');
INSERT INTO `sys_bet_item` VALUES (10, 1, 1, 'smalldouble', '小双', NULL, 4.20, 9999.99, 5.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:20', '');
INSERT INTO `sys_bet_item` VALUES (11, 1, 1, 'muchsmall', '极小', NULL, 15.00, 1000.00, 2.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (12, 1, 2, 'num0', '0', NULL, 500.00, 5.00, 50.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:40:08', '');
INSERT INTO `sys_bet_item` VALUES (13, 1, 2, 'num1', '1', NULL, 240.00, 5.00, 500.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:40:30', '');
INSERT INTO `sys_bet_item` VALUES (14, 1, 2, 'num2', '2', NULL, 120.00, 5.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:42:57', '');
INSERT INTO `sys_bet_item` VALUES (15, 1, 2, 'num3', '3', NULL, 72.00, 5.00, 2000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:43:09', '');
INSERT INTO `sys_bet_item` VALUES (16, 1, 2, 'num4', '4', NULL, 38.00, 5.00, 3000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:43:22', '');
INSERT INTO `sys_bet_item` VALUES (17, 1, 2, 'num5', '5', NULL, 30.00, 5.00, 3000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:43:30', '');
INSERT INTO `sys_bet_item` VALUES (18, 1, 2, 'num6', '6', NULL, 24.00, 5.00, 3000.00, 18, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:43:41', '');
INSERT INTO `sys_bet_item` VALUES (19, 1, 2, 'num7', '7', NULL, 19.00, 5.00, 3000.00, 19, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:43:50', '');
INSERT INTO `sys_bet_item` VALUES (20, 1, 2, 'num8', '8', NULL, 17.00, 5.00, 3000.00, 20, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:43:59', '');
INSERT INTO `sys_bet_item` VALUES (21, 1, 2, 'num9', '9', NULL, 15.00, 5.00, 3000.00, 21, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:44:09', '');
INSERT INTO `sys_bet_item` VALUES (22, 1, 2, 'num10', '10', NULL, 14.00, 5.00, 3000.00, 22, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:45:21', '');
INSERT INTO `sys_bet_item` VALUES (23, 1, 2, 'num11', '11', NULL, 13.00, 5.00, 3000.00, 23, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:45:14', '');
INSERT INTO `sys_bet_item` VALUES (24, 1, 2, 'num12', '12', NULL, 12.00, 5.00, 3000.00, 24, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:45:05', '');
INSERT INTO `sys_bet_item` VALUES (25, 1, 2, 'num13', '13', NULL, 12.00, 5.00, 2000.00, 25, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:44:41', '');
INSERT INTO `sys_bet_item` VALUES (26, 1, 2, 'num14', '14', NULL, 12.00, 5.00, 2000.00, 26, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:44:53', '');
INSERT INTO `sys_bet_item` VALUES (27, 1, 2, 'num15', '15', NULL, 12.00, 5.00, 3000.00, 27, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:45:34', '');
INSERT INTO `sys_bet_item` VALUES (28, 1, 2, 'num16', '16', NULL, 13.00, 5.00, 2000.00, 28, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:44:19', '');
INSERT INTO `sys_bet_item` VALUES (29, 1, 2, 'num17', '17', NULL, 14.00, 5.00, 3000.00, 29, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:45:47', '');
INSERT INTO `sys_bet_item` VALUES (30, 1, 2, 'num18', '18', NULL, 15.00, 5.00, 3000.00, 30, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:45:55', '');
INSERT INTO `sys_bet_item` VALUES (31, 1, 2, 'num19', '19', NULL, 17.00, 5.00, 3000.00, 31, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:46:04', '');
INSERT INTO `sys_bet_item` VALUES (32, 1, 2, 'num20', '20', NULL, 19.00, 5.00, 3000.00, 32, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:46:11', '');
INSERT INTO `sys_bet_item` VALUES (33, 1, 2, 'num21', '21', NULL, 24.00, 5.00, 3000.00, 33, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:46:19', '');
INSERT INTO `sys_bet_item` VALUES (34, 1, 2, 'num22', '22', NULL, 30.00, 5.00, 3000.00, 34, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:46:27', '');
INSERT INTO `sys_bet_item` VALUES (35, 1, 2, 'num23', '23', NULL, 38.00, 5.00, 3000.00, 35, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:46:35', '');
INSERT INTO `sys_bet_item` VALUES (36, 1, 2, 'num24', '24', NULL, 72.00, 5.00, 1000.00, 36, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:47:19', '');
INSERT INTO `sys_bet_item` VALUES (37, 1, 2, 'num25', '25', NULL, 120.00, 5.00, 1000.00, 37, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:47:27', '');
INSERT INTO `sys_bet_item` VALUES (38, 1, 2, 'num26', '26', NULL, 240.00, 5.00, 300.00, 38, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:47:35', '');
INSERT INTO `sys_bet_item` VALUES (39, 1, 2, 'num27', '27', NULL, 500.00, 5.00, 50.00, 39, '0', '', '2024-03-09 22:05:44', '', '2024-07-10 21:47:40', '');
INSERT INTO `sys_bet_item` VALUES (40, 1, 3, 'red', '红', NULL, 2.04, 9999.99, 2.00, 40, '0', '', '2024-03-09 22:05:44', '', '2024-07-05 09:29:57', '');
INSERT INTO `sys_bet_item` VALUES (41, 1, 3, 'green', '绿', NULL, 2.04, 9999.99, 2.00, 41, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (42, 1, 3, 'blue', '蓝', NULL, 2.04, 9999.99, 2.00, 42, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (43, 1, 3, 'loong', '龙', NULL, 2.04, 9999.99, 2.00, 43, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (44, 1, 3, 'tiger', '虎', NULL, 2.04, 9999.99, 2.00, 44, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (45, 1, 3, 'close', '合', NULL, 2.04, 9999.99, 2.00, 45, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (46, 1, 3, 'leopard', '豹子', NULL, 2.04, 9999.99, 2.00, 46, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (47, 1, 3, 'pairs', '对子', NULL, 2.04, 9999.99, 2.00, 47, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (48, 1, 3, 'shun', '顺子', NULL, 2.04, 9999.99, 2.00, 48, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (49, 2, 4, 'big', '大', '', 2.80, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 16:00:19', '');
INSERT INTO `sys_bet_item` VALUES (50, 2, 4, 'small', '小', NULL, 2.80, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 16:00:25', '');
INSERT INTO `sys_bet_item` VALUES (51, 2, 4, 'single', '单', NULL, 2.80, 5.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 16:00:31', '');
INSERT INTO `sys_bet_item` VALUES (52, 2, 4, 'doubleFlg', '双', NULL, 2.80, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 16:00:37', '');
INSERT INTO `sys_bet_item` VALUES (53, 2, 4, 'muchbig', '极大', NULL, 15.00, 2.00, 500.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (54, 2, 4, 'bigsingle', '大单', NULL, 6.00, 5.00, 9999.99, 6, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 16:04:27', '');
INSERT INTO `sys_bet_item` VALUES (55, 2, 4, 'smallsingle', '小单', NULL, 6.00, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 16:04:32', '');
INSERT INTO `sys_bet_item` VALUES (56, 2, 4, 'bigdouble', '大双', NULL, 6.00, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 16:04:38', '');
INSERT INTO `sys_bet_item` VALUES (57, 2, 4, 'smalldouble', '小双', NULL, 6.00, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 16:04:43', '');
INSERT INTO `sys_bet_item` VALUES (58, 2, 4, 'muchsmall', '极小', NULL, 15.00, 2.00, 1000.00, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (59, 2, 5, 'num0', '0', NULL, 500.00, 5.00, 1000.00, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:03:41', '');
INSERT INTO `sys_bet_item` VALUES (60, 2, 5, 'num1', '1', NULL, 188.00, 5.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:08', '');
INSERT INTO `sys_bet_item` VALUES (61, 2, 5, 'num2', '2', NULL, 128.00, 5.00, 1000.00, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:19', '');
INSERT INTO `sys_bet_item` VALUES (62, 2, 5, 'num3', '3', NULL, 68.00, 5.00, 1000.00, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:40', '');
INSERT INTO `sys_bet_item` VALUES (63, 2, 5, 'num4', '4', NULL, 46.00, 5.00, 1000.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:17:54', '');
INSERT INTO `sys_bet_item` VALUES (64, 2, 5, 'num5', '5', NULL, 30.00, 5.00, 1000.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:07', '');
INSERT INTO `sys_bet_item` VALUES (65, 2, 5, 'num6', '6', NULL, 18.00, 5.00, 1000.00, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:24', '');
INSERT INTO `sys_bet_item` VALUES (66, 2, 5, 'num7', '7', NULL, 16.00, 5.00, 10000.00, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:18:39', '');
INSERT INTO `sys_bet_item` VALUES (67, 2, 5, 'num8', '8', NULL, 15.00, 5.00, 10000.00, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 23:19:02', '');
INSERT INTO `sys_bet_item` VALUES (68, 2, 5, 'num9', '9', NULL, 14.00, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
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
INSERT INTO `sys_bet_item` VALUES (93, 2, 6, 'leopard', '豹子', NULL, 50.00, 2.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 16:01:41', '');
INSERT INTO `sys_bet_item` VALUES (94, 2, 6, 'pairs', '对子', NULL, 3.00, 2.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 16:01:31', '');
INSERT INTO `sys_bet_item` VALUES (95, 2, 6, 'shun', '顺子', NULL, 12.00, 2.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 16:01:22', '');
INSERT INTO `sys_bet_item` VALUES (96, 9, 7, 'big', '大', NULL, 2.10, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:13:18', '');
INSERT INTO `sys_bet_item` VALUES (97, 9, 7, 'small', '小', NULL, 1.70, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:13:27', '');
INSERT INTO `sys_bet_item` VALUES (98, 9, 7, 'single', '单', NULL, 1.70, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:13:32', '');
INSERT INTO `sys_bet_item` VALUES (99, 9, 7, 'doubleFlg', '双', NULL, 2.10, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:13:39', '');
INSERT INTO `sys_bet_item` VALUES (100, 9, 7, 'num3', '3', NULL, 41.00, 2.00, 500.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:11:59', '');
INSERT INTO `sys_bet_item` VALUES (101, 9, 7, 'num4', '4', NULL, 41.00, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:12:03', '');
INSERT INTO `sys_bet_item` VALUES (102, 9, 7, 'num5', '5', NULL, 20.00, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:12:05', '');
INSERT INTO `sys_bet_item` VALUES (103, 9, 7, 'num6', '6', NULL, 20.00, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:12:08', '');
INSERT INTO `sys_bet_item` VALUES (104, 9, 7, 'num7', '7', NULL, 12.00, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:12:10', '');
INSERT INTO `sys_bet_item` VALUES (105, 9, 7, 'num8', '8', NULL, 12.00, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:12:13', '');
INSERT INTO `sys_bet_item` VALUES (106, 9, 7, 'num9', '9', NULL, 9.00, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:12:15', '');
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
INSERT INTO `sys_bet_item` VALUES (123, 9, 8, 'num1Under1', '1', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (124, 9, 8, 'num2Under1', '2', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:12:52', '');
INSERT INTO `sys_bet_item` VALUES (125, 9, 8, 'num3Under1', '3', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:12:50', '');
INSERT INTO `sys_bet_item` VALUES (126, 9, 8, 'num4Under1', '4', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:12:47', '');
INSERT INTO `sys_bet_item` VALUES (127, 9, 8, 'num5Under1', '5', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:12:44', '');
INSERT INTO `sys_bet_item` VALUES (128, 9, 8, 'num6Under1', '6', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:12:42', '');
INSERT INTO `sys_bet_item` VALUES (129, 9, 8, 'num7Under1', '7', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:12:39', '');
INSERT INTO `sys_bet_item` VALUES (130, 9, 8, 'num8Under1', '8', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:12:37', '');
INSERT INTO `sys_bet_item` VALUES (131, 9, 8, 'num9Under1', '9', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:12:34', '');
INSERT INTO `sys_bet_item` VALUES (132, 9, 8, 'num10Under1', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (133, 9, 9, 'big2', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:11:55', '');
INSERT INTO `sys_bet_item` VALUES (134, 9, 9, 'small2', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:11:58', '');
INSERT INTO `sys_bet_item` VALUES (135, 9, 9, 'single2', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:12:00', '');
INSERT INTO `sys_bet_item` VALUES (136, 9, 9, 'double2', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:12:04', '');
INSERT INTO `sys_bet_item` VALUES (137, 9, 9, 'loong2', '龙', NULL, 1.98, 2.00, 500.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (138, 9, 9, 'tiger2', '虎', NULL, 1.98, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (139, 9, 9, 'num1Under2', '1', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (140, 9, 9, 'num2Under2', '2', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:13:04', '');
INSERT INTO `sys_bet_item` VALUES (141, 9, 9, 'num3Under2', '3', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:13:07', '');
INSERT INTO `sys_bet_item` VALUES (142, 9, 9, 'num4Under2', '4', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:13:09', '');
INSERT INTO `sys_bet_item` VALUES (143, 9, 9, 'num5Under2', '5', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:13:11', '');
INSERT INTO `sys_bet_item` VALUES (144, 9, 9, 'num6Under2', '6', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:13:15', '');
INSERT INTO `sys_bet_item` VALUES (145, 9, 9, 'num7Under2', '7', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:13:17', '');
INSERT INTO `sys_bet_item` VALUES (146, 9, 9, 'num8Under2', '8', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:13:20', '');
INSERT INTO `sys_bet_item` VALUES (147, 9, 9, 'num9Under2', '9', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:13:22', '');
INSERT INTO `sys_bet_item` VALUES (148, 9, 9, 'num10Under2', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (149, 9, 10, 'big3', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:12:30', '');
INSERT INTO `sys_bet_item` VALUES (150, 9, 10, 'small3', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:12:33', '');
INSERT INTO `sys_bet_item` VALUES (151, 9, 10, 'single3', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:12:35', '');
INSERT INTO `sys_bet_item` VALUES (152, 9, 10, 'double3', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:12:38', '');
INSERT INTO `sys_bet_item` VALUES (153, 9, 10, 'loong3', '龙', NULL, 1.98, 2.00, 500.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:12:44', '');
INSERT INTO `sys_bet_item` VALUES (154, 9, 10, 'tiger3', '虎', NULL, 1.98, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:12:46', '');
INSERT INTO `sys_bet_item` VALUES (155, 9, 10, 'num1Under3', '1', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (156, 9, 10, 'num2Under3', '2', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:14:10', '');
INSERT INTO `sys_bet_item` VALUES (157, 9, 10, 'num3Under3', '3', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:14:13', '');
INSERT INTO `sys_bet_item` VALUES (158, 9, 10, 'num4Under3', '4', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:14:16', '');
INSERT INTO `sys_bet_item` VALUES (159, 9, 10, 'num5Under3', '5', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:14:18', '');
INSERT INTO `sys_bet_item` VALUES (160, 9, 10, 'num6Under3', '6', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:14:21', '');
INSERT INTO `sys_bet_item` VALUES (161, 9, 10, 'num7Under3', '7', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:14:24', '');
INSERT INTO `sys_bet_item` VALUES (162, 9, 10, 'num8Under3', '8', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:14:26', '');
INSERT INTO `sys_bet_item` VALUES (163, 9, 10, 'num9Under3', '9', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:14:29', '');
INSERT INTO `sys_bet_item` VALUES (164, 9, 10, 'num10Under3', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (165, 9, 11, 'big4', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (166, 9, 11, 'small4', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (167, 9, 11, 'single4', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (168, 9, 11, 'double4', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (169, 9, 11, 'loong4', '龙', NULL, 1.98, 2.00, 500.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (170, 9, 11, 'tiger4', '虎', NULL, 1.98, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (171, 9, 11, 'num1Under4', '1', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (172, 9, 11, 'num2Under4', '2', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:14:53', '');
INSERT INTO `sys_bet_item` VALUES (173, 9, 11, 'num3Under4', '3', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:14:55', '');
INSERT INTO `sys_bet_item` VALUES (174, 9, 11, 'num4Under4', '4', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:14:58', '');
INSERT INTO `sys_bet_item` VALUES (175, 9, 11, 'num5Under4', '5', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:15:00', '');
INSERT INTO `sys_bet_item` VALUES (176, 9, 11, 'num6Under4', '6', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:15:03', '');
INSERT INTO `sys_bet_item` VALUES (177, 9, 11, 'num7Under4', '7', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:15:05', '');
INSERT INTO `sys_bet_item` VALUES (178, 9, 11, 'num8Under4', '8', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:15:08', '');
INSERT INTO `sys_bet_item` VALUES (179, 9, 11, 'num9Under4', '9', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:15:10', '');
INSERT INTO `sys_bet_item` VALUES (180, 9, 11, 'num10Under4', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (181, 9, 12, 'big5', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (182, 9, 12, 'small5', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (183, 9, 12, 'single5', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (184, 9, 12, 'double5', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (185, 9, 12, 'loong5', '龙', NULL, 1.98, 2.00, 500.00, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (186, 9, 12, 'tiger5', '虎', NULL, 1.98, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (187, 9, 12, 'num1Under5', '1', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (188, 9, 12, 'num2Under5', '2', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:15:38', '');
INSERT INTO `sys_bet_item` VALUES (189, 9, 12, 'num3Under5', '3', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:15:42', '');
INSERT INTO `sys_bet_item` VALUES (190, 9, 12, 'num4Under5', '4', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:15:44', '');
INSERT INTO `sys_bet_item` VALUES (191, 9, 12, 'num5Under5', '5', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:15:46', '');
INSERT INTO `sys_bet_item` VALUES (192, 9, 12, 'num6Under5', '6', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:15:49', '');
INSERT INTO `sys_bet_item` VALUES (193, 9, 12, 'num7Under5', '7', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:15:51', '');
INSERT INTO `sys_bet_item` VALUES (194, 9, 12, 'num8Under5', '8', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:15:53', '');
INSERT INTO `sys_bet_item` VALUES (195, 9, 12, 'num9Under5', '9', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:15:56', '');
INSERT INTO `sys_bet_item` VALUES (196, 9, 12, 'num10Under5', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (197, 9, 13, 'big6', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (198, 9, 13, 'small6', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (199, 9, 13, 'single6', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (200, 9, 13, 'double6', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (203, 9, 13, 'num1Under6', '1', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:07', '');
INSERT INTO `sys_bet_item` VALUES (204, 9, 13, 'num2Under6', '2', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:04', '');
INSERT INTO `sys_bet_item` VALUES (205, 9, 13, 'num3Under6', '3', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:01', '');
INSERT INTO `sys_bet_item` VALUES (206, 9, 13, 'num4Under6', '4', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:10', '');
INSERT INTO `sys_bet_item` VALUES (207, 9, 13, 'num5Under6', '5', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:13', '');
INSERT INTO `sys_bet_item` VALUES (208, 9, 13, 'num6Under6', '6', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:15', '');
INSERT INTO `sys_bet_item` VALUES (209, 9, 13, 'num7Under6', '7', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:18', '');
INSERT INTO `sys_bet_item` VALUES (210, 9, 13, 'num8Under6', '8', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:20', '');
INSERT INTO `sys_bet_item` VALUES (211, 9, 13, 'num9Under6', '9', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:22', '');
INSERT INTO `sys_bet_item` VALUES (212, 9, 13, 'num10Under6', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (213, 9, 14, 'big7', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (214, 9, 14, 'small7', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (215, 9, 14, 'single7', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (216, 9, 14, 'double7', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (219, 9, 14, 'num1Under7', '1', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:29', '');
INSERT INTO `sys_bet_item` VALUES (220, 9, 14, 'num2Under7', '2', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:32', '');
INSERT INTO `sys_bet_item` VALUES (221, 9, 14, 'num3Under7', '3', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:34', '');
INSERT INTO `sys_bet_item` VALUES (222, 9, 14, 'num4Under7', '4', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:37', '');
INSERT INTO `sys_bet_item` VALUES (223, 9, 14, 'num5Under7', '5', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:43', '');
INSERT INTO `sys_bet_item` VALUES (224, 9, 14, 'num6Under7', '6', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:40', '');
INSERT INTO `sys_bet_item` VALUES (225, 9, 14, 'num7Under7', '7', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:48', '');
INSERT INTO `sys_bet_item` VALUES (226, 9, 14, 'num8Under7', '8', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:51', '');
INSERT INTO `sys_bet_item` VALUES (227, 9, 14, 'num9Under7', '9', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:16:53', '');
INSERT INTO `sys_bet_item` VALUES (228, 9, 14, 'num10Under7', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (229, 9, 15, 'big8', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (230, 9, 15, 'small8', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (231, 9, 15, 'single8', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (232, 9, 15, 'double8', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (235, 9, 15, 'num1Under8', '1', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:00', '');
INSERT INTO `sys_bet_item` VALUES (236, 9, 15, 'num2Under8', '2', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:02', '');
INSERT INTO `sys_bet_item` VALUES (237, 9, 15, 'num3Under8', '3', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:05', '');
INSERT INTO `sys_bet_item` VALUES (238, 9, 15, 'num4Under8', '4', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:08', '');
INSERT INTO `sys_bet_item` VALUES (239, 9, 15, 'num5Under8', '5', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:10', '');
INSERT INTO `sys_bet_item` VALUES (240, 9, 15, 'num6Under8', '6', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:13', '');
INSERT INTO `sys_bet_item` VALUES (241, 9, 15, 'num7Under8', '7', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:15', '');
INSERT INTO `sys_bet_item` VALUES (242, 9, 15, 'num8Under8', '8', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:17', '');
INSERT INTO `sys_bet_item` VALUES (243, 9, 15, 'num9Under8', '9', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:19', '');
INSERT INTO `sys_bet_item` VALUES (244, 9, 15, 'num10Under8', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (245, 9, 16, 'big9', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (246, 9, 16, 'small9', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (247, 9, 16, 'single9', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (248, 9, 16, 'double9', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (251, 9, 16, 'num1Under9', '1', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:25', '');
INSERT INTO `sys_bet_item` VALUES (252, 9, 16, 'num2Under9', '2', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:27', '');
INSERT INTO `sys_bet_item` VALUES (253, 9, 16, 'num3Under9', '3', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:30', '');
INSERT INTO `sys_bet_item` VALUES (254, 9, 16, 'num4Under9', '4', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:32', '');
INSERT INTO `sys_bet_item` VALUES (255, 9, 16, 'num5Under9', '5', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:35', '');
INSERT INTO `sys_bet_item` VALUES (256, 9, 16, 'num6Under9', '6', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:37', '');
INSERT INTO `sys_bet_item` VALUES (257, 9, 16, 'num7Under9', '7', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:40', '');
INSERT INTO `sys_bet_item` VALUES (258, 9, 16, 'num8Under9', '8', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:42', '');
INSERT INTO `sys_bet_item` VALUES (259, 9, 16, 'num9Under9', '9', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:17:45', '');
INSERT INTO `sys_bet_item` VALUES (260, 9, 16, 'num10Under9', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:59:37', '');
INSERT INTO `sys_bet_item` VALUES (261, 9, 17, 'big10', '大', NULL, 1.98, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (262, 9, 17, 'small10', '小', NULL, 1.98, 2.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (263, 9, 17, 'single10', '单', NULL, 1.98, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (264, 9, 17, 'double10', '双', NULL, 1.98, 5.00, 9999.99, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (267, 9, 17, 'num1Under10', '1', NULL, 9.90, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:34:56', '');
INSERT INTO `sys_bet_item` VALUES (268, 9, 17, 'num2Under10', '2', NULL, 9.90, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:34:59', '');
INSERT INTO `sys_bet_item` VALUES (269, 9, 17, 'num3Under10', '3', NULL, 9.90, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:35:02', '');
INSERT INTO `sys_bet_item` VALUES (270, 9, 17, 'num4Under10', '4', NULL, 9.90, 2.00, 1000.00, 11, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:35:04', '');
INSERT INTO `sys_bet_item` VALUES (271, 9, 17, 'num5Under10', '5', NULL, 9.90, 2.00, 1000.00, 12, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:35:07', '');
INSERT INTO `sys_bet_item` VALUES (272, 9, 17, 'num6Under10', '6', NULL, 9.90, 2.00, 1000.00, 13, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:35:10', '');
INSERT INTO `sys_bet_item` VALUES (273, 9, 17, 'num7Under10', '7', NULL, 9.90, 2.00, 1000.00, 14, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:35:12', '');
INSERT INTO `sys_bet_item` VALUES (274, 9, 17, 'num8Under10', '8', NULL, 9.90, 2.00, 1000.00, 15, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:35:14', '');
INSERT INTO `sys_bet_item` VALUES (275, 9, 17, 'num9Under10', '9', NULL, 9.90, 2.00, 1000.00, 16, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:35:17', '');
INSERT INTO `sys_bet_item` VALUES (276, 9, 17, 'num10Under10', '10', NULL, 9.90, 2.00, 1000.00, 17, '0', '', '2024-03-09 22:05:44', '', '2024-07-09 19:35:20', '');
INSERT INTO `sys_bet_item` VALUES (277, 15, 18, 'sumBig', '大', NULL, 1.96, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:17:39', '');
INSERT INTO `sys_bet_item` VALUES (278, 15, 18, 'sumSmall', '小', NULL, 1.96, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:17:45', '');
INSERT INTO `sys_bet_item` VALUES (279, 15, 18, 'sumSingle', '单', NULL, 1.96, 5.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:17:48', '');
INSERT INTO `sys_bet_item` VALUES (280, 15, 18, 'sumDouble', '双', NULL, 1.96, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:17:51', '');
INSERT INTO `sys_bet_item` VALUES (281, 15, 18, 'sumLoong', '龙', NULL, 1.96, 2.00, 500.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:17:58', '');
INSERT INTO `sys_bet_item` VALUES (282, 15, 18, 'sumTiger', '虎', NULL, 1.96, 5.00, 9999.99, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:18:02', '');
INSERT INTO `sys_bet_item` VALUES (283, 15, 18, 'sumSum', '和', NULL, 8.00, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-28 21:18:06', '');
INSERT INTO `sys_bet_item` VALUES (284, 15, 19, 'num1Big', '大', NULL, 9.80, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (285, 15, 19, 'num1Small', '小', NULL, 9.80, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (286, 15, 19, 'num1Single', '单', NULL, 9.80, 5.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (287, 15, 19, 'num1Double', '双', NULL, 9.80, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (288, 15, 19, 'num1Under0', '0', NULL, 9.80, 2.00, 500.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (289, 15, 19, 'num1Under1', '1', NULL, 9.80, 5.00, 9999.99, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (290, 15, 19, 'num1Under2', '2', NULL, 9.80, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (291, 15, 19, 'num1Under3', '3', NULL, 9.80, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (292, 15, 19, 'num1Under4', '4', NULL, 9.80, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (293, 15, 19, 'num1Under5', '5', NULL, 9.80, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (294, 15, 19, 'num1Under6', '6', NULL, 1.96, 5.00, 9999.99, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (295, 15, 19, 'num1Under7', '7', NULL, 1.96, 5.00, 9999.99, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (296, 15, 19, 'num1Under8', '8', NULL, 1.96, 5.00, 9999.99, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (297, 15, 19, 'num1Under9', '9', NULL, 1.96, 5.00, 9999.99, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (298, 15, 20, 'num2Under0', '0', NULL, 9.80, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (299, 15, 20, 'num2Under1', '1', NULL, 9.80, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (300, 15, 20, 'num2Under2', '2', NULL, 9.80, 5.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (301, 15, 20, 'num2Under3', '3', NULL, 9.80, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (302, 15, 20, 'num2Under4', '4', NULL, 9.80, 2.00, 500.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (303, 15, 20, 'num2Under5', '5', NULL, 9.80, 5.00, 9999.99, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (304, 15, 20, 'num2Under6', '6', NULL, 9.80, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (305, 15, 20, 'num2Under7', '7', NULL, 9.80, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (306, 15, 20, 'num2Under8', '8', NULL, 9.80, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (307, 15, 20, 'num2Under9', '9', NULL, 9.80, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (308, 15, 20, 'num2Big', '大', NULL, 1.96, 5.00, 9999.99, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (309, 15, 20, 'num2Small', '小', NULL, 1.96, 5.00, 9999.99, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (310, 15, 20, 'num2Single', '单', NULL, 1.96, 5.00, 9999.99, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (311, 15, 20, 'num2Double', '双', NULL, 1.96, 5.00, 9999.99, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (312, 15, 21, 'num3Under0', '0', NULL, 9.80, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (313, 15, 21, 'num3Under1', '1', NULL, 9.80, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (314, 15, 21, 'num3Under2', '2', NULL, 9.80, 5.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (315, 15, 21, 'num3Under3', '3', NULL, 9.80, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (316, 15, 21, 'num3Under4', '4', NULL, 9.80, 2.00, 500.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (317, 15, 21, 'num3Under5', '5', NULL, 9.80, 5.00, 9999.99, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (318, 15, 21, 'num3Under6', '6', NULL, 9.80, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (319, 15, 21, 'num3Under7', '7', NULL, 9.80, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (320, 15, 21, 'num3Under8', '8', NULL, 9.80, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (321, 15, 21, 'num3Under9', '9', NULL, 9.80, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (322, 15, 21, 'num3Big', '大', NULL, 1.96, 5.00, 9999.99, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (323, 15, 21, 'num3Small', '小', NULL, 1.96, 5.00, 9999.99, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (324, 15, 21, 'num3Single', '单', NULL, 1.96, 5.00, 9999.99, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (325, 15, 21, 'num3Double', '双', NULL, 1.96, 5.00, 9999.99, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (326, 15, 22, 'num4Under0', '0', NULL, 9.80, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (327, 15, 22, 'num4Under1', '1', NULL, 9.80, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (328, 15, 22, 'num4Under2', '2', NULL, 9.80, 5.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (329, 15, 22, 'num4Under3', '3', NULL, 9.80, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (330, 15, 22, 'num4Under4', '4', NULL, 9.80, 2.00, 500.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (331, 15, 22, 'num4Under5', '5', NULL, 9.80, 5.00, 9999.99, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (332, 15, 22, 'num4Under6', '6', NULL, 9.80, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (333, 15, 22, 'num4Under7', '7', NULL, 9.80, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (334, 15, 22, 'num4Under8', '8', NULL, 9.80, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (335, 15, 22, 'num4Under9', '9', NULL, 9.80, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (336, 15, 22, 'num4Big', '大', NULL, 1.96, 5.00, 9999.99, 11, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (337, 15, 22, 'num4Small', '小', NULL, 1.96, 5.00, 9999.99, 12, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (338, 15, 22, 'num4Single', '单', NULL, 1.96, 5.00, 9999.99, 13, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (339, 15, 22, 'num4Double', '双', NULL, 1.96, 5.00, 9999.99, 14, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (340, 15, 23, 'num5Under0', '0', NULL, 9.80, 2.00, 9999.99, 1, '0', '', '2024-03-09 22:05:44', '', '2024-03-09 22:11:10', '');
INSERT INTO `sys_bet_item` VALUES (341, 15, 23, 'num5Under1', '1', NULL, 9.80, 2.00, 9999.99, 2, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:17', '');
INSERT INTO `sys_bet_item` VALUES (342, 15, 23, 'num5Under2', '2', NULL, 9.80, 5.00, 9999.99, 3, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:41', '');
INSERT INTO `sys_bet_item` VALUES (343, 15, 23, 'num5Under3', '3', NULL, 9.80, 5.00, 9999.99, 4, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:56:57', '');
INSERT INTO `sys_bet_item` VALUES (344, 15, 23, 'num5Under4', '4', NULL, 9.80, 2.00, 500.00, 5, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:58:18', '');
INSERT INTO `sys_bet_item` VALUES (345, 15, 23, 'num5Under5', '5', NULL, 9.80, 5.00, 9999.99, 6, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:35', '');
INSERT INTO `sys_bet_item` VALUES (346, 15, 23, 'num5Under6', '6', NULL, 9.80, 5.00, 9999.99, 7, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (347, 15, 23, 'num5Under7', '7', NULL, 9.80, 5.00, 9999.99, 8, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (348, 15, 23, 'num5Under8', '8', NULL, 9.80, 5.00, 9999.99, 9, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
INSERT INTO `sys_bet_item` VALUES (349, 15, 23, 'num5Under9', '9', NULL, 9.80, 5.00, 9999.99, 10, '0', '', '2024-03-09 22:05:44', '', '2024-03-10 22:57:50', '');
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
INSERT INTO `sys_bet_item` VALUES (369, 3, 27, 'big', '大', NULL, 3.20, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-09 16:02:15', '');
INSERT INTO `sys_bet_item` VALUES (370, 3, 27, 'small', '小', NULL, 3.20, 2.00, 9999.00, 2, '0', '', NULL, '', '2024-07-09 16:02:27', '');
INSERT INTO `sys_bet_item` VALUES (371, 3, 27, 'single', '单', NULL, 3.20, 2.00, 9999.00, 3, '0', '', NULL, '', '2024-07-09 16:02:38', '');
INSERT INTO `sys_bet_item` VALUES (372, 3, 27, 'doubleFlg', '双', NULL, 3.20, 2.00, 9999.00, 4, '0', '', NULL, '', '2024-07-09 16:02:46', '');
INSERT INTO `sys_bet_item` VALUES (373, 3, 27, 'muchbig', '极大', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (374, 3, 27, 'bigsingle', '大单', NULL, 6.60, 2.00, 9999.00, 6, '0', '', NULL, '', '2024-07-09 16:03:05', '');
INSERT INTO `sys_bet_item` VALUES (375, 3, 27, 'smallsingle', '小单', NULL, 6.60, 2.00, 9999.00, 7, '0', '', NULL, '', '2024-07-09 16:03:12', '');
INSERT INTO `sys_bet_item` VALUES (376, 3, 27, 'bigdouble', '大双', NULL, 6.60, 2.00, 9999.00, 8, '0', '', NULL, '', '2024-07-09 16:03:17', '');
INSERT INTO `sys_bet_item` VALUES (377, 3, 27, 'smalldouble', '小双', NULL, 6.60, 2.00, 9999.00, 9, '0', '', NULL, '', '2024-07-09 16:03:24', '');
INSERT INTO `sys_bet_item` VALUES (378, 3, 27, 'muchsmall', '极小', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (379, 3, 28, 'num0', '0', NULL, 500.00, 5.00, 50.00, 1, '0', '', NULL, '', '2024-07-13 23:13:29', '');
INSERT INTO `sys_bet_item` VALUES (380, 3, 28, 'num1', '1', NULL, 240.00, 5.00, 200.00, 2, '0', '', NULL, '', '2024-07-13 23:13:43', '');
INSERT INTO `sys_bet_item` VALUES (381, 3, 28, 'num2', '2', NULL, 120.00, 5.00, 1000.00, 3, '0', '', NULL, '', '2024-07-13 23:13:59', '');
INSERT INTO `sys_bet_item` VALUES (382, 3, 28, 'num3', '3', NULL, 72.00, 5.00, 1000.00, 4, '0', '', NULL, '', '2024-07-13 23:14:13', '');
INSERT INTO `sys_bet_item` VALUES (383, 3, 28, 'num4', '4', NULL, 38.00, 5.00, 1000.00, 5, '0', '', NULL, '', '2024-07-13 23:15:02', '');
INSERT INTO `sys_bet_item` VALUES (384, 3, 28, 'num5', '5', NULL, 30.00, 5.00, 1000.00, 6, '0', '', NULL, '', '2024-07-13 23:15:19', '');
INSERT INTO `sys_bet_item` VALUES (385, 3, 28, 'num6', '6', NULL, 24.00, 5.00, 1000.00, 7, '0', '', NULL, '', '2024-07-13 23:15:32', '');
INSERT INTO `sys_bet_item` VALUES (386, 3, 28, 'num7', '7', NULL, 19.00, 5.00, 1000.00, 8, '0', '', NULL, '', '2024-07-13 23:15:43', '');
INSERT INTO `sys_bet_item` VALUES (387, 3, 28, 'num8', '8', NULL, 17.00, 5.00, 1000.00, 9, '0', '', NULL, '', '2024-07-13 23:15:58', '');
INSERT INTO `sys_bet_item` VALUES (388, 3, 28, 'num9', '9', NULL, 15.00, 5.00, 1000.00, 10, '0', '', NULL, '', '2024-07-13 23:16:19', '');
INSERT INTO `sys_bet_item` VALUES (389, 3, 28, 'num10', '10', NULL, 14.00, 5.00, 1000.00, 10, '0', '', NULL, '', '2024-07-13 23:16:43', '');
INSERT INTO `sys_bet_item` VALUES (390, 3, 28, 'num11', '11', NULL, 13.00, 5.00, 1000.00, 12, '0', '', NULL, '', '2024-07-13 23:17:17', '');
INSERT INTO `sys_bet_item` VALUES (391, 3, 28, 'num12', '12', NULL, 12.00, 5.00, 1000.00, 13, '0', '', NULL, '', '2024-07-13 23:17:37', '');
INSERT INTO `sys_bet_item` VALUES (392, 3, 28, 'num13', '13', NULL, 12.00, 5.00, 1000.00, 14, '0', '', NULL, '', '2024-07-13 23:18:03', '');
INSERT INTO `sys_bet_item` VALUES (393, 3, 28, 'num14', '14', NULL, 12.00, 5.00, 1000.00, 15, '0', '', NULL, '', '2024-07-13 23:18:15', '');
INSERT INTO `sys_bet_item` VALUES (394, 3, 28, 'num15', '15', NULL, 12.00, 5.00, 1000.00, 16, '0', '', NULL, '', '2024-07-13 23:19:09', '');
INSERT INTO `sys_bet_item` VALUES (395, 3, 28, 'num16', '16', NULL, 13.00, 5.00, 1000.00, 17, '0', '', NULL, '', '2024-07-13 23:19:22', '');
INSERT INTO `sys_bet_item` VALUES (396, 3, 28, 'num17', '17', NULL, 14.00, 5.00, 1000.00, 18, '0', '', NULL, '', '2024-07-13 23:19:37', '');
INSERT INTO `sys_bet_item` VALUES (397, 3, 28, 'num18', '18', NULL, 15.00, 5.00, 1000.00, 19, '0', '', NULL, '', '2024-07-13 23:20:11', '');
INSERT INTO `sys_bet_item` VALUES (398, 3, 28, 'num19', '19', NULL, 17.00, 5.00, 1000.00, 20, '0', '', NULL, '', '2024-07-13 23:20:31', '');
INSERT INTO `sys_bet_item` VALUES (399, 3, 28, 'num20', '20', NULL, 19.00, 5.00, 1000.00, 21, '0', '', NULL, '', '2024-07-13 23:20:52', '');
INSERT INTO `sys_bet_item` VALUES (400, 3, 28, 'num21', '21', NULL, 24.00, 5.00, 1000.00, 22, '0', '', NULL, '', '2024-07-13 23:21:13', '');
INSERT INTO `sys_bet_item` VALUES (401, 3, 28, 'num22', '22', NULL, 30.00, 5.00, 1000.00, 23, '0', '', NULL, '', '2024-07-13 23:21:35', '');
INSERT INTO `sys_bet_item` VALUES (402, 3, 28, 'num23', '23', NULL, 38.00, 5.00, 500.00, 24, '0', '', NULL, '', '2024-07-13 23:21:52', '');
INSERT INTO `sys_bet_item` VALUES (403, 3, 28, 'num24', '24', NULL, 72.00, 5.00, 100.00, 25, '0', '', NULL, '', '2024-07-13 23:22:11', '');
INSERT INTO `sys_bet_item` VALUES (404, 3, 28, 'num25', '25', NULL, 120.00, 5.00, 1000.00, 26, '0', '', NULL, '', '2024-07-13 23:22:26', '');
INSERT INTO `sys_bet_item` VALUES (405, 3, 28, 'num26', '26', NULL, 240.00, 5.00, 200.00, 27, '0', '', NULL, '', '2024-07-13 23:22:47', '');
INSERT INTO `sys_bet_item` VALUES (406, 3, 29, 'red', '红', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (407, 3, 29, 'green', '绿', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (408, 3, 29, 'blue', '蓝', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (409, 3, 29, 'loong', '龙', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (410, 3, 29, 'tiger', '虎', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (411, 3, 29, 'close', '合', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (412, 3, 29, 'leopard', '豹子', NULL, 50.00, 5.00, 2000.00, 7, '0', '', NULL, '', '2024-07-13 23:25:21', '');
INSERT INTO `sys_bet_item` VALUES (413, 3, 29, 'pairs', '对子', NULL, 3.00, 5.00, 9999.00, 8, '0', '', NULL, '', '2024-07-13 23:26:03', '');
INSERT INTO `sys_bet_item` VALUES (414, 3, 29, 'shun', '顺子', NULL, 12.00, 5.00, 9999.00, 9, '0', '', NULL, '', '2024-07-13 23:25:32', '');
INSERT INTO `sys_bet_item` VALUES (415, 7, 30, 'sumBig', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (416, 7, 30, 'sumSmall', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (417, 7, 30, 'sumSingle', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (418, 7, 30, 'sumDouble', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (419, 7, 30, 'sumLoong', '龙', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (420, 7, 30, 'sumTiger', '虎', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (421, 7, 30, 'sumSum', '和', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (422, 7, 31, 'num1Big', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (423, 7, 31, 'num1Small', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (424, 7, 31, 'num1Single', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (425, 7, 31, 'num1Double', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (426, 7, 31, 'num1Under0', '0', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (427, 7, 31, 'num1Under1', '1', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (428, 7, 31, 'num1Under2', '2', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (429, 7, 31, 'num1Under3', '3', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (430, 7, 31, 'num1Under4', '4', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (431, 7, 31, 'num1Under5', '5', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (432, 7, 31, 'num1Under6', '6', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (433, 7, 31, 'num1Under7', '7', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (434, 7, 31, 'num1Under8', '8', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (435, 7, 31, 'num1Under9', '9', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (436, 7, 32, 'num2Under0', '0', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (437, 7, 32, 'num2Under1', '1', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (438, 7, 32, 'num2Under2', '2', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (439, 7, 32, 'num2Under3', '3', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (440, 7, 32, 'num2Under4', '4', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (441, 7, 32, 'num2Under5', '5', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (442, 7, 32, 'num2Under6', '6', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (443, 7, 32, 'num2Under7', '7', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (444, 7, 32, 'num2Under8', '8', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (445, 7, 32, 'num2Under9', '9', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (446, 7, 32, 'num2Big', '大', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (447, 7, 32, 'num2Small', '小', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (448, 7, 32, 'num2Single', '单', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (449, 7, 32, 'num2Double', '双', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (450, 7, 33, 'num3Under0', '0', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (451, 7, 33, 'num3Under1', '1', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (452, 7, 33, 'num3Under2', '2', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (453, 7, 33, 'num3Under3', '3', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (454, 7, 33, 'num3Under4', '4', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (455, 7, 33, 'num3Under5', '5', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (456, 7, 33, 'num3Under6', '6', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (457, 7, 33, 'num3Under7', '7', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (458, 7, 33, 'num3Under8', '8', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (459, 7, 33, 'num3Under9', '9', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (460, 7, 33, 'num3Big', '大', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (461, 7, 33, 'num3Small', '小', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (462, 7, 33, 'num3Single', '单', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (463, 7, 33, 'num3Double', '双', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (464, 7, 34, 'num4Under0', '0', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (465, 7, 34, 'num4Under1', '1', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (466, 7, 34, 'num4Under2', '2', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (467, 7, 34, 'num4Under3', '3', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (468, 7, 34, 'num4Under4', '4', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (469, 7, 34, 'num4Under5', '5', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (470, 7, 34, 'num4Under6', '6', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (471, 7, 34, 'num4Under7', '7', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (472, 7, 34, 'num4Under8', '8', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (473, 7, 34, 'num4Under9', '9', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (474, 7, 34, 'num4Big', '大', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (475, 7, 34, 'num4Small', '小', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (476, 7, 34, 'num4Single', '单', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (477, 7, 34, 'num4Double', '双', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (478, 7, 35, 'num5Under0', '0', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (479, 7, 35, 'num5Under1', '1', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (480, 7, 35, 'num5Under2', '2', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (481, 7, 35, 'num5Under3', '3', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (482, 7, 35, 'num5Under4', '4', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (483, 7, 35, 'num5Under5', '5', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (484, 7, 35, 'num5Under6', '6', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (485, 7, 35, 'num5Under7', '7', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (486, 7, 35, 'num5Under8', '8', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (487, 7, 35, 'num5Under9', '9', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (488, 7, 35, 'num5Big', '大', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (489, 7, 35, 'num5Small', '小', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (490, 7, 35, 'num5Single', '单', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (491, 7, 35, 'num5Double', '双', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (492, 7, 36, 'fBao', '豹', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (493, 7, 36, 'fDui', '对', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (494, 7, 36, 'fSun', '顺', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (495, 7, 36, 'fBan', '半', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (496, 7, 36, 'fZa', '杂', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (497, 7, 37, 'mBao', '豹', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (498, 7, 37, 'mDui', '对', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (499, 7, 37, 'mSun', '顺', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (500, 7, 37, 'mBan', '半', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (501, 7, 37, 'mZa', '杂', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (502, 7, 38, 'bBao', '豹', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (503, 7, 38, 'bDui', '对', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (504, 7, 38, 'bSun', '顺', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (505, 7, 38, 'bBan', '半', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (506, 7, 38, 'bZa', '杂', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (507, 13, 39, 'big', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (508, 13, 39, 'small', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (509, 13, 39, 'single', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (510, 13, 39, 'doubleFlg', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (511, 13, 39, 'num3', '3', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (512, 13, 39, 'num4', '4', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (513, 13, 39, 'num5', '5', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (514, 13, 39, 'num6', '6', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (515, 13, 39, 'num7', '7', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (516, 13, 39, 'num8', '8', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (517, 13, 39, 'num9', '9', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (518, 13, 39, 'num10', '10', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (519, 13, 39, 'num11', '11', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (520, 13, 39, 'num12', '12', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (521, 13, 39, 'num13', '13', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (522, 13, 39, 'num14', '14', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (523, 13, 39, 'num15', '15', NULL, 2.00, 2.00, 9999.00, 17, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (524, 13, 39, 'num16', '16', NULL, 2.00, 2.00, 9999.00, 18, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (525, 13, 39, 'num17', '17', NULL, 2.00, 2.00, 9999.00, 19, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (526, 13, 39, 'num18', '18', NULL, 2.00, 2.00, 9999.00, 20, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (527, 13, 39, 'num19', '19', NULL, 2.00, 2.00, 9999.00, 21, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (528, 13, 40, 'big1', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (529, 13, 40, 'small1', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (530, 13, 40, 'single1', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (531, 13, 40, 'double1', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (532, 13, 40, 'loong1', '龙', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (533, 13, 40, 'tiger1', '虎', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (534, 13, 40, 'num1Under1', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (535, 13, 40, 'num2Under1', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (536, 13, 40, 'num3Under1', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (537, 13, 40, 'num4Under1', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (538, 13, 40, 'num5Under1', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (539, 13, 40, 'num6Under1', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (540, 13, 40, 'num7Under1', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (541, 13, 40, 'num8Under1', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (542, 13, 40, 'num9Under1', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (543, 13, 40, 'num10Under1', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (544, 13, 41, 'big2', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (545, 13, 41, 'small2', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (546, 13, 41, 'single2', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (547, 13, 41, 'double2', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (548, 13, 41, 'loong2', '龙', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (549, 13, 41, 'tiger2', '虎', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (550, 13, 41, 'num1Under2', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (551, 13, 41, 'num2Under2', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (552, 13, 41, 'num3Under2', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (553, 13, 41, 'num4Under2', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (554, 13, 41, 'num5Under2', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (555, 13, 41, 'num6Under2', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (556, 13, 41, 'num7Under2', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (557, 13, 41, 'num8Under2', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (558, 13, 41, 'num9Under2', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (559, 13, 41, 'num10Under2', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (560, 13, 42, 'big3', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (561, 13, 42, 'small3', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (562, 13, 42, 'single3', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (563, 13, 42, 'double3', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (564, 13, 42, 'loong3', '龙', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (565, 13, 42, 'tiger3', '虎', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (566, 13, 42, 'num1Under3', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (567, 13, 42, 'num2Under3', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (568, 13, 42, 'num3Under3', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (569, 13, 42, 'num4Under3', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (570, 13, 42, 'num5Under3', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (571, 13, 42, 'num6Under3', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (572, 13, 42, 'num7Under3', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (573, 13, 42, 'num8Under3', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (574, 13, 42, 'num9Under3', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (575, 13, 42, 'num10Under3', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (576, 13, 43, 'big4', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (577, 13, 43, 'small4', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (578, 13, 43, 'single4', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (579, 13, 43, 'double4', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (580, 13, 43, 'loong4', '龙', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (581, 13, 43, 'tiger4', '虎', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (582, 13, 43, 'num1Under4', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (583, 13, 43, 'num2Under4', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (584, 13, 43, 'num3Under4', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (585, 13, 43, 'num4Under4', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (586, 13, 43, 'num5Under4', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (587, 13, 43, 'num6Under4', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (588, 13, 43, 'num7Under4', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (589, 13, 43, 'num8Under4', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (590, 13, 43, 'num9Under4', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (591, 13, 43, 'num10Under4', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (592, 13, 44, 'big5', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (593, 13, 44, 'small5', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (594, 13, 44, 'single5', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (595, 13, 44, 'double5', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (596, 13, 44, 'loong5', '龙', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (597, 13, 44, 'tiger5', '虎', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (598, 13, 44, 'num1Under5', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (599, 13, 44, 'num2Under5', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (600, 13, 44, 'num3Under5', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (601, 13, 44, 'num4Under5', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (602, 13, 44, 'num5Under5', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (603, 13, 44, 'num6Under5', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (604, 13, 44, 'num7Under5', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (605, 13, 44, 'num8Under5', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (606, 13, 44, 'num9Under5', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (607, 13, 44, 'num10Under5', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (608, 13, 45, 'big6', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (609, 13, 45, 'small6', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (610, 13, 45, 'single6', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (611, 13, 45, 'double6', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (614, 13, 45, 'num1Under6', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (615, 13, 45, 'num2Under6', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (616, 13, 45, 'num3Under6', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (617, 13, 45, 'num4Under6', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (618, 13, 45, 'num5Under6', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (619, 13, 45, 'num6Under6', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (620, 13, 45, 'num7Under6', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (621, 13, 45, 'num8Under6', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (622, 13, 45, 'num9Under6', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (623, 13, 45, 'num10Under6', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (624, 13, 46, 'big7', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (625, 13, 46, 'small7', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (626, 13, 46, 'single7', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (627, 13, 46, 'double7', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (630, 13, 46, 'num1Under7', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (631, 13, 46, 'num2Under7', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (632, 13, 46, 'num3Under7', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (633, 13, 46, 'num4Under7', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (634, 13, 46, 'num5Under7', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (635, 13, 46, 'num6Under7', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (636, 13, 46, 'num7Under7', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (637, 13, 46, 'num8Under7', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (638, 13, 46, 'num9Under7', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (639, 13, 46, 'num10Under7', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (640, 13, 47, 'big8', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (641, 13, 47, 'small8', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (642, 13, 47, 'single8', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (643, 13, 47, 'double8', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (646, 13, 47, 'num1Under8', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (647, 13, 47, 'num2Under8', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (648, 13, 47, 'num3Under8', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (649, 13, 47, 'num4Under8', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (650, 13, 47, 'num5Under8', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (651, 13, 47, 'num6Under8', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (652, 13, 47, 'num7Under8', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (653, 13, 47, 'num8Under8', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (654, 13, 47, 'num9Under8', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (655, 13, 47, 'num10Under8', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (656, 13, 48, 'big9', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (657, 13, 48, 'small9', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (658, 13, 48, 'single9', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (659, 13, 48, 'double9', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (662, 13, 48, 'num1Under9', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (663, 13, 48, 'num2Under9', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (664, 13, 48, 'num3Under9', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (665, 13, 48, 'num4Under9', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (666, 13, 48, 'num5Under9', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (667, 13, 48, 'num6Under9', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (668, 13, 48, 'num7Under9', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (669, 13, 48, 'num8Under9', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (670, 13, 48, 'num9Under9', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (671, 13, 48, 'num10Under9', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (672, 13, 49, 'big10', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (673, 13, 49, 'small10', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (674, 13, 49, 'single10', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (675, 13, 49, 'double10', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (678, 13, 49, 'num1Under10', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (679, 13, 49, 'num2Under10', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (680, 13, 49, 'num3Under10', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (681, 13, 49, 'num4Under10', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (682, 13, 49, 'num5Under10', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (683, 13, 49, 'num6Under10', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (684, 13, 49, 'num7Under10', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (685, 13, 49, 'num8Under10', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (686, 13, 49, 'num9Under10', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (687, 13, 49, 'num10Under10', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (688, 6, 50, 'big', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:18:02', '');
INSERT INTO `sys_bet_item` VALUES (689, 6, 50, 'small', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (690, 6, 50, 'single', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (691, 6, 50, 'doubleFlg', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (692, 6, 50, 'num3', '3', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (693, 6, 50, 'num4', '4', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (694, 6, 50, 'num5', '5', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (695, 6, 50, 'num6', '6', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (696, 6, 50, 'num7', '7', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (697, 6, 50, 'num8', '8', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (698, 6, 50, 'num9', '9', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (699, 6, 50, 'num10', '10', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (700, 6, 50, 'num11', '11', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (701, 6, 50, 'num12', '12', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (702, 6, 50, 'num13', '13', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (703, 6, 50, 'num14', '14', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (704, 6, 50, 'num15', '15', NULL, 2.00, 2.00, 9999.00, 17, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (705, 6, 50, 'num16', '16', NULL, 2.00, 2.00, 9999.00, 18, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (706, 6, 50, 'num17', '17', NULL, 2.00, 2.00, 9999.00, 19, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (707, 6, 50, 'num18', '18', NULL, 2.00, 2.00, 9999.00, 20, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (708, 6, 50, 'num19', '19', NULL, 2.00, 2.00, 9999.00, 21, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (709, 6, 51, 'big1', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (710, 6, 51, 'small1', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (711, 6, 51, 'single1', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (712, 6, 51, 'double1', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (713, 6, 51, 'loong1', '龙', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (714, 6, 51, 'tiger1', '虎', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (715, 6, 51, 'num1Under1', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (716, 6, 51, 'num2Under1', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (717, 6, 51, 'num3Under1', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (718, 6, 51, 'num4Under1', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (719, 6, 51, 'num5Under1', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (720, 6, 51, 'num6Under1', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (721, 6, 51, 'num7Under1', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (722, 6, 51, 'num8Under1', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (723, 6, 51, 'num9Under1', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (724, 6, 51, 'num10Under1', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (725, 6, 52, 'big2', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:18:09', '');
INSERT INTO `sys_bet_item` VALUES (726, 6, 52, 'small2', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (727, 6, 52, 'single2', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (728, 6, 52, 'double2', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (729, 6, 52, 'loong2', '龙', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (730, 6, 52, 'tiger2', '虎', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (731, 6, 52, 'num1Under2', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (732, 6, 52, 'num2Under2', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (733, 6, 52, 'num3Under2', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (734, 6, 52, 'num4Under2', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (735, 6, 52, 'num5Under2', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (736, 6, 52, 'num6Under2', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (737, 6, 52, 'num7Under2', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (738, 6, 52, 'num8Under2', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (739, 6, 52, 'num9Under2', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (740, 6, 52, 'num10Under2', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (741, 6, 53, 'big3', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:18:15', '');
INSERT INTO `sys_bet_item` VALUES (742, 6, 53, 'small3', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (743, 6, 53, 'single3', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (744, 6, 53, 'double3', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (745, 6, 53, 'loong3', '龙', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (746, 6, 53, 'tiger3', '虎', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (747, 6, 53, 'num1Under3', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (748, 6, 53, 'num2Under3', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (749, 6, 53, 'num3Under3', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (750, 6, 53, 'num4Under3', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (751, 6, 53, 'num5Under3', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (752, 6, 53, 'num6Under3', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (753, 6, 53, 'num7Under3', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (754, 6, 53, 'num8Under3', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (755, 6, 53, 'num9Under3', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (756, 6, 53, 'num10Under3', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (757, 6, 54, 'big4', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:18:21', '');
INSERT INTO `sys_bet_item` VALUES (758, 6, 54, 'small4', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (759, 6, 54, 'single4', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (760, 6, 54, 'double4', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (761, 6, 54, 'loong4', '龙', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (762, 6, 54, 'tiger4', '虎', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (763, 6, 54, 'num1Under4', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (764, 6, 54, 'num2Under4', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (765, 6, 54, 'num3Under4', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (766, 6, 54, 'num4Under4', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (767, 6, 54, 'num5Under4', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (768, 6, 54, 'num6Under4', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (769, 6, 54, 'num7Under4', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (770, 6, 54, 'num8Under4', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (771, 6, 54, 'num9Under4', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (772, 6, 54, 'num10Under4', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (773, 6, 55, 'big5', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:18:25', '');
INSERT INTO `sys_bet_item` VALUES (774, 6, 55, 'small5', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (775, 6, 55, 'single5', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (776, 6, 55, 'double5', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (777, 6, 55, 'loong5', '龙', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (778, 6, 55, 'tiger5', '虎', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (779, 6, 55, 'num1Under5', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (780, 6, 55, 'num2Under5', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (781, 6, 55, 'num3Under5', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (782, 6, 55, 'num4Under5', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (783, 6, 55, 'num5Under5', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (784, 6, 55, 'num6Under5', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (785, 6, 55, 'num7Under5', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (786, 6, 55, 'num8Under5', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (787, 6, 55, 'num9Under5', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (788, 6, 55, 'num10Under5', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (789, 6, 56, 'big6', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:17:03', '');
INSERT INTO `sys_bet_item` VALUES (790, 6, 56, 'small6', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (791, 6, 56, 'single6', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (792, 6, 56, 'double6', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (795, 6, 56, 'num1Under6', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (796, 6, 56, 'num2Under6', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (797, 6, 56, 'num3Under6', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (798, 6, 56, 'num4Under6', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (799, 6, 56, 'num5Under6', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (800, 6, 56, 'num6Under6', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (801, 6, 56, 'num7Under6', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (802, 6, 56, 'num8Under6', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (803, 6, 56, 'num9Under6', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (804, 6, 56, 'num10Under6', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (805, 6, 57, 'big7', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:16:58', '');
INSERT INTO `sys_bet_item` VALUES (806, 6, 57, 'small7', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (807, 6, 57, 'single7', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (808, 6, 57, 'double7', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (811, 6, 57, 'num1Under7', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (812, 6, 57, 'num2Under7', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (813, 6, 57, 'num3Under7', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (814, 6, 57, 'num4Under7', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (815, 6, 57, 'num5Under7', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (816, 6, 57, 'num6Under7', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (817, 6, 57, 'num7Under7', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (818, 6, 57, 'num8Under7', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (819, 6, 57, 'num9Under7', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (820, 6, 57, 'num10Under7', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (821, 6, 58, 'big8', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:16:52', '');
INSERT INTO `sys_bet_item` VALUES (822, 6, 58, 'small8', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (823, 6, 58, 'single8', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (824, 6, 58, 'double8', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (827, 6, 58, 'num1Under8', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (828, 6, 58, 'num2Under8', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (829, 6, 58, 'num3Under8', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (830, 6, 58, 'num4Under8', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (831, 6, 58, 'num5Under8', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (832, 6, 58, 'num6Under8', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (833, 6, 58, 'num7Under8', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (834, 6, 58, 'num8Under8', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (835, 6, 58, 'num9Under8', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (836, 6, 58, 'num10Under8', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (837, 6, 59, 'big9', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:16:45', '');
INSERT INTO `sys_bet_item` VALUES (838, 6, 59, 'small9', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (839, 6, 59, 'single9', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (840, 6, 59, 'double9', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (843, 6, 59, 'num1Under9', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (844, 6, 59, 'num2Under9', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (845, 6, 59, 'num3Under9', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (846, 6, 59, 'num4Under9', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (847, 6, 59, 'num5Under9', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (848, 6, 59, 'num6Under9', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (849, 6, 59, 'num7Under9', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (850, 6, 59, 'num8Under9', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (851, 6, 59, 'num9Under9', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (852, 6, 59, 'num10Under9', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (853, 6, 60, 'big10', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:16:38', '');
INSERT INTO `sys_bet_item` VALUES (854, 6, 60, 'small10', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (855, 6, 60, 'single10', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (856, 6, 60, 'double10', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (859, 6, 60, 'num1Under10', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (860, 6, 60, 'num2Under10', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (861, 6, 60, 'num3Under10', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (862, 6, 60, 'num4Under10', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (863, 6, 60, 'num5Under10', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (864, 6, 60, 'num6Under10', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (865, 6, 60, 'num7Under10', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (866, 6, 60, 'num8Under10', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (867, 6, 60, 'num9Under10', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (868, 6, 60, 'num10Under10', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (869, 8, 61, 'sumBig', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:42:02', '');
INSERT INTO `sys_bet_item` VALUES (870, 8, 61, 'sumSmall', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (871, 8, 61, 'sumSingle', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (872, 8, 61, 'sumDouble', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (873, 8, 61, 'sumLoong', '龙', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (874, 8, 61, 'sumTiger', '虎', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (875, 8, 61, 'sumSum', '和', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (876, 8, 62, 'num1Big', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (877, 8, 62, 'num1Small', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (878, 8, 62, 'num1Single', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (879, 8, 62, 'num1Double', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (880, 8, 62, 'num1Under0', '0', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (881, 8, 62, 'num1Under1', '1', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (882, 8, 62, 'num1Under2', '2', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (883, 8, 62, 'num1Under3', '3', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (884, 8, 62, 'num1Under4', '4', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (885, 8, 62, 'num1Under5', '5', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (886, 8, 62, 'num1Under6', '6', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (887, 8, 62, 'num1Under7', '7', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (888, 8, 62, 'num1Under8', '8', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (889, 8, 62, 'num1Under9', '9', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (890, 8, 63, 'num2Under0', '0', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:41:57', '');
INSERT INTO `sys_bet_item` VALUES (891, 8, 63, 'num2Under1', '1', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (892, 8, 63, 'num2Under2', '2', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (893, 8, 63, 'num2Under3', '3', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (894, 8, 63, 'num2Under4', '4', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (895, 8, 63, 'num2Under5', '5', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (896, 8, 63, 'num2Under6', '6', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (897, 8, 63, 'num2Under7', '7', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (898, 8, 63, 'num2Under8', '8', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (899, 8, 63, 'num2Under9', '9', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (900, 8, 63, 'num2Big', '大', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (901, 8, 63, 'num2Small', '小', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (902, 8, 63, 'num2Single', '单', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (903, 8, 63, 'num2Double', '双', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (904, 8, 64, 'num3Under0', '0', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:41:51', '');
INSERT INTO `sys_bet_item` VALUES (905, 8, 64, 'num3Under1', '1', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (906, 8, 64, 'num3Under2', '2', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (907, 8, 64, 'num3Under3', '3', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (908, 8, 64, 'num3Under4', '4', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (909, 8, 64, 'num3Under5', '5', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (910, 8, 64, 'num3Under6', '6', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (911, 8, 64, 'num3Under7', '7', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (912, 8, 64, 'num3Under8', '8', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (913, 8, 64, 'num3Under9', '9', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (914, 8, 64, 'num3Big', '大', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (915, 8, 64, 'num3Small', '小', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (916, 8, 64, 'num3Single', '单', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (917, 8, 64, 'num3Double', '双', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (918, 8, 65, 'num4Under0', '0', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:41:46', '');
INSERT INTO `sys_bet_item` VALUES (919, 8, 65, 'num4Under1', '1', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (920, 8, 65, 'num4Under2', '2', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (921, 8, 65, 'num4Under3', '3', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (922, 8, 65, 'num4Under4', '4', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (923, 8, 65, 'num4Under5', '5', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (924, 8, 65, 'num4Under6', '6', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (925, 8, 65, 'num4Under7', '7', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (926, 8, 65, 'num4Under8', '8', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (927, 8, 65, 'num4Under9', '9', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (928, 8, 65, 'num4Big', '大', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (929, 8, 65, 'num4Small', '小', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (930, 8, 65, 'num4Single', '单', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (931, 8, 65, 'num4Double', '双', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (932, 8, 66, 'num5Under0', '0', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:41:41', '');
INSERT INTO `sys_bet_item` VALUES (933, 8, 66, 'num5Under1', '1', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (934, 8, 66, 'num5Under2', '2', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (935, 8, 66, 'num5Under3', '3', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (936, 8, 66, 'num5Under4', '4', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (937, 8, 66, 'num5Under5', '5', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (938, 8, 66, 'num5Under6', '6', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (939, 8, 66, 'num5Under7', '7', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (940, 8, 66, 'num5Under8', '8', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (941, 8, 66, 'num5Under9', '9', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (942, 8, 66, 'num5Big', '大', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (943, 8, 66, 'num5Small', '小', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (944, 8, 66, 'num5Single', '单', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (945, 8, 66, 'num5Double', '双', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (946, 8, 67, 'fBao', '豹', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:41:35', '');
INSERT INTO `sys_bet_item` VALUES (947, 8, 67, 'fDui', '对', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (948, 8, 67, 'fSun', '顺', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (949, 8, 67, 'fBan', '半', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (950, 8, 67, 'fZa', '杂', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (951, 8, 68, 'mBao', '豹', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:41:29', '');
INSERT INTO `sys_bet_item` VALUES (952, 8, 68, 'mDui', '对', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (953, 8, 68, 'mSun', '顺', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (954, 8, 68, 'mBan', '半', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (955, 8, 68, 'mZa', '杂', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (956, 8, 69, 'bBao', '豹', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', '2024-07-05 10:41:21', '');
INSERT INTO `sys_bet_item` VALUES (957, 8, 69, 'bDui', '对', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (958, 8, 69, 'bSun', '顺', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (959, 8, 69, 'bBan', '半', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (960, 8, 69, 'bZa', '杂', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (961, 11, 70, 'big', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (962, 11, 70, 'small', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (963, 11, 70, 'single', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (964, 11, 70, 'doubleFlg', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (965, 11, 70, 'num3', '3', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (966, 11, 70, 'num4', '4', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (967, 11, 70, 'num5', '5', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (968, 11, 70, 'num6', '6', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (969, 11, 70, 'num7', '7', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (970, 11, 70, 'num8', '8', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (971, 11, 70, 'num9', '9', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (972, 11, 70, 'num10', '10', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (973, 11, 70, 'num11', '11', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (974, 11, 70, 'num12', '12', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (975, 11, 70, 'num13', '13', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (976, 11, 70, 'num14', '14', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (977, 11, 70, 'num15', '15', NULL, 2.00, 2.00, 9999.00, 17, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (978, 11, 70, 'num16', '16', NULL, 2.00, 2.00, 9999.00, 18, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (979, 11, 70, 'num17', '17', NULL, 2.00, 2.00, 9999.00, 19, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (980, 11, 70, 'num18', '18', NULL, 2.00, 2.00, 9999.00, 20, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (981, 11, 70, 'num19', '19', NULL, 2.00, 2.00, 9999.00, 21, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (982, 11, 71, 'big1', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (983, 11, 71, 'small1', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (984, 11, 71, 'single1', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (985, 11, 71, 'double1', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (986, 11, 71, 'loong1', '龙', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (987, 11, 71, 'tiger1', '虎', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (988, 11, 71, 'num1Under1', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (989, 11, 71, 'num2Under1', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (990, 11, 71, 'num3Under1', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (991, 11, 71, 'num4Under1', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (992, 11, 71, 'num5Under1', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (993, 11, 71, 'num6Under1', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (994, 11, 71, 'num7Under1', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (995, 11, 71, 'num8Under1', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (996, 11, 71, 'num9Under1', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (997, 11, 71, 'num10Under1', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (998, 11, 72, 'big2', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (999, 11, 72, 'small2', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1000, 11, 72, 'single2', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1001, 11, 72, 'double2', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1002, 11, 72, 'loong2', '龙', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1003, 11, 72, 'tiger2', '虎', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', '2024-07-05 10:57:44', '');
INSERT INTO `sys_bet_item` VALUES (1004, 11, 72, 'num1Under2', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1005, 11, 72, 'num2Under2', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1006, 11, 72, 'num3Under2', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1007, 11, 72, 'num4Under2', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1008, 11, 72, 'num5Under2', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1009, 11, 72, 'num6Under2', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1010, 11, 72, 'num7Under2', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1011, 11, 72, 'num8Under2', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1012, 11, 72, 'num9Under2', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1013, 11, 72, 'num10Under2', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1014, 11, 73, 'big3', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1015, 11, 73, 'small3', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1016, 11, 73, 'single3', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1017, 11, 73, 'double3', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1018, 11, 73, 'loong3', '龙', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1019, 11, 73, 'tiger3', '虎', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1020, 11, 73, 'num1Under3', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1021, 11, 73, 'num2Under3', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1022, 11, 73, 'num3Under3', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1023, 11, 73, 'num4Under3', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1024, 11, 73, 'num5Under3', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1025, 11, 73, 'num6Under3', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1026, 11, 73, 'num7Under3', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1027, 11, 73, 'num8Under3', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1028, 11, 73, 'num9Under3', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1029, 11, 73, 'num10Under3', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1030, 11, 74, 'big4', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1031, 11, 74, 'small4', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1032, 11, 74, 'single4', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1033, 11, 74, 'double4', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1034, 11, 74, 'loong4', '龙', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1035, 11, 74, 'tiger4', '虎', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1036, 11, 74, 'num1Under4', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1037, 11, 74, 'num2Under4', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1038, 11, 74, 'num3Under4', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1039, 11, 74, 'num4Under4', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1040, 11, 74, 'num5Under4', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1041, 11, 74, 'num6Under4', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1042, 11, 74, 'num7Under4', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1043, 11, 74, 'num8Under4', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1044, 11, 74, 'num9Under4', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1045, 11, 74, 'num10Under4', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1046, 11, 75, 'big5', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1047, 11, 75, 'small5', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1048, 11, 75, 'single5', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1049, 11, 75, 'double5', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1050, 11, 75, 'loong5', '龙', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1051, 11, 75, 'tiger5', '虎', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1052, 11, 75, 'num1Under5', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1053, 11, 75, 'num2Under5', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1054, 11, 75, 'num3Under5', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1055, 11, 75, 'num4Under5', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1056, 11, 75, 'num5Under5', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1057, 11, 75, 'num6Under5', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1058, 11, 75, 'num7Under5', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1059, 11, 75, 'num8Under5', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1060, 11, 75, 'num9Under5', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1061, 11, 75, 'num10Under5', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1062, 11, 76, 'big6', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1063, 11, 76, 'small6', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1064, 11, 76, 'single6', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1065, 11, 76, 'double6', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1068, 11, 76, 'num1Under6', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1069, 11, 76, 'num2Under6', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1070, 11, 76, 'num3Under6', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1071, 11, 76, 'num4Under6', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1072, 11, 76, 'num5Under6', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1073, 11, 76, 'num6Under6', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1074, 11, 76, 'num7Under6', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1075, 11, 76, 'num8Under6', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1076, 11, 76, 'num9Under6', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1077, 11, 76, 'num10Under6', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1078, 11, 77, 'big7', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1079, 11, 77, 'small7', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1080, 11, 77, 'single7', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1081, 11, 77, 'double7', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1084, 11, 77, 'num1Under7', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1085, 11, 77, 'num2Under7', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1086, 11, 77, 'num3Under7', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1087, 11, 77, 'num4Under7', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1088, 11, 77, 'num5Under7', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1089, 11, 77, 'num6Under7', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1090, 11, 77, 'num7Under7', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1091, 11, 77, 'num8Under7', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1092, 11, 77, 'num9Under7', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1093, 11, 77, 'num10Under7', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1094, 11, 78, 'big8', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1095, 11, 78, 'small8', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1096, 11, 78, 'single8', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1097, 11, 78, 'double8', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1100, 11, 78, 'num1Under8', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1101, 11, 78, 'num2Under8', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1102, 11, 78, 'num3Under8', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1103, 11, 78, 'num4Under8', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1104, 11, 78, 'num5Under8', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1105, 11, 78, 'num6Under8', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1106, 11, 78, 'num7Under8', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1107, 11, 78, 'num8Under8', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1108, 11, 78, 'num9Under8', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1109, 11, 78, 'num10Under8', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1110, 11, 79, 'big9', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1111, 11, 79, 'small9', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1112, 11, 79, 'single9', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1113, 11, 79, 'double9', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1116, 11, 79, 'num1Under9', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1117, 11, 79, 'num2Under9', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1118, 11, 79, 'num3Under9', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1119, 11, 79, 'num4Under9', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1120, 11, 79, 'num5Under9', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1121, 11, 79, 'num6Under9', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1122, 11, 79, 'num7Under9', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1123, 11, 79, 'num8Under9', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1124, 11, 79, 'num9Under9', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1125, 11, 79, 'num10Under9', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1126, 11, 80, 'big10', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1127, 11, 80, 'small10', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1128, 11, 80, 'single10', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1129, 11, 80, 'double10', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1132, 11, 80, 'num1Under10', '1', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1133, 11, 80, 'num2Under10', '2', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1134, 11, 80, 'num3Under10', '3', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1135, 11, 80, 'num4Under10', '4', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1136, 11, 80, 'num5Under10', '5', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1137, 11, 80, 'num6Under10', '6', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1138, 11, 80, 'num7Under10', '7', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1139, 11, 80, 'num8Under10', '8', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1140, 11, 80, 'num9Under10', '9', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1141, 11, 80, 'num10Under10', '10', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1142, 4, 81, 'big', '大', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1143, 4, 81, 'small', '小', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1144, 4, 81, 'single', '单', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1145, 4, 81, 'doubleFlg', '双', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1146, 4, 81, 'muchbig', '极大', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1147, 4, 81, 'bigsingle', '大单', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1148, 4, 81, 'smallsingle', '小单', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1149, 4, 81, 'bigdouble', '大双', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1150, 4, 81, 'smalldouble', '小双', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1151, 4, 81, 'muchsmall', '极小', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1152, 4, 82, 'num0', '0', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1153, 4, 82, 'num1', '1', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1154, 4, 82, 'num2', '2', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1155, 4, 82, 'num3', '3', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1156, 4, 82, 'num4', '4', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1157, 4, 82, 'num5', '5', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1158, 4, 82, 'num6', '6', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1159, 4, 82, 'num7', '7', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1160, 4, 82, 'num8', '8', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1161, 4, 82, 'num9', '9', NULL, 2.00, 2.00, 9999.00, 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1162, 4, 82, 'num10', '10', NULL, 2.00, 2.00, 9999.00, 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1163, 4, 82, 'num11', '11', NULL, 2.00, 2.00, 9999.00, 12, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1164, 4, 82, 'num12', '12', NULL, 2.00, 2.00, 9999.00, 13, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1165, 4, 82, 'num13', '13', NULL, 2.00, 2.00, 9999.00, 14, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1166, 4, 82, 'num14', '14', NULL, 2.00, 2.00, 9999.00, 15, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1167, 4, 82, 'num15', '15', NULL, 2.00, 2.00, 9999.00, 16, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1168, 4, 82, 'num16', '16', NULL, 2.00, 2.00, 9999.00, 17, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1169, 4, 82, 'num17', '17', NULL, 2.00, 2.00, 9999.00, 18, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1170, 4, 82, 'num18', '18', NULL, 2.00, 2.00, 9999.00, 19, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1171, 4, 82, 'num19', '19', NULL, 2.00, 2.00, 9999.00, 20, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1172, 4, 82, 'num20', '20', NULL, 2.00, 2.00, 9999.00, 21, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1173, 4, 82, 'num21', '21', NULL, 2.00, 2.00, 9999.00, 22, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1174, 4, 82, 'num22', '22', NULL, 2.00, 2.00, 9999.00, 23, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1175, 4, 82, 'num23', '23', NULL, 2.00, 2.00, 9999.00, 24, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1176, 4, 82, 'num24', '24', NULL, 2.00, 2.00, 9999.00, 25, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1177, 4, 82, 'num25', '25', NULL, 2.00, 2.00, 9999.00, 26, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1178, 4, 82, 'num26', '26', NULL, 2.00, 2.00, 9999.00, 27, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1179, 4, 83, 'red', '红', NULL, 2.00, 2.00, 9999.00, 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1180, 4, 83, 'green', '绿', NULL, 2.00, 2.00, 9999.00, 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1181, 4, 83, 'blue', '蓝', NULL, 2.00, 2.00, 9999.00, 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1182, 4, 83, 'loong', '龙', NULL, 2.00, 2.00, 9999.00, 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1183, 4, 83, 'tiger', '虎', NULL, 2.00, 2.00, 9999.00, 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1184, 4, 83, 'close', '合', NULL, 2.00, 2.00, 9999.00, 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1185, 4, 83, 'leopard', '豹子', NULL, 2.00, 2.00, 9999.00, 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1186, 4, 83, 'pairs', '对子', NULL, 2.00, 2.00, 9999.00, 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1187, 4, 83, 'shun', '顺子', NULL, 2.00, 2.00, 9999.00, 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_item` VALUES (1188, 3, 28, 'num27', '27', NULL, 500.00, 5.00, 200.00, 28, '0', '', '2024-07-15 19:09:43', '', NULL, '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏玩法表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_bet_type` VALUES (27, 3, '大小单双', 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (28, 3, '猜数字', 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (29, 3, '特殊玩法', 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (30, 7, '和值', 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (31, 7, '球1', 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (32, 7, '球2', 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (33, 7, '球3', 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (34, 7, '球4', 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (35, 7, '球5', 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (36, 7, '前三', 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (37, 7, '中三', 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (38, 7, '后三', 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (39, 13, '冠亚和值', 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (40, 13, '猜冠军', 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (41, 13, '猜亚军', 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (42, 13, '猜第三名', 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (43, 13, '猜第四名', 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (44, 13, '猜第五名', 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (45, 13, '猜第六名', 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (46, 13, '猜第七名', 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (47, 13, '猜第八名', 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (48, 13, '猜第九名', 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (49, 13, '猜第十名', 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (50, 6, '冠亚和值', 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (51, 6, '猜冠军', 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (52, 6, '猜亚军', 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (53, 6, '猜第三名', 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (54, 6, '猜第四名', 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (55, 6, '猜第五名', 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (56, 6, '猜第六名', 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (57, 6, '猜第七名', 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (58, 6, '猜第八名', 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (59, 6, '猜第九名', 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (60, 6, '猜第十名', 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (61, 8, '和值', 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (62, 8, '球1', 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (63, 8, '球2', 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (64, 8, '球3', 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (65, 8, '球4', 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (66, 8, '球5', 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (67, 8, '前三', 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (68, 8, '中三', 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (69, 8, '后三', 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (70, 11, '冠亚和值', 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (71, 11, '猜冠军', 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (72, 11, '猜亚军', 3, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (73, 11, '猜第三名', 4, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (74, 11, '猜第四名', 5, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (75, 11, '猜第五名', 6, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (76, 11, '猜第六名', 7, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (77, 11, '猜第七名', 8, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (78, 11, '猜第八名', 9, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (79, 11, '猜第九名', 10, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (80, 11, '猜第十名', 11, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (81, 4, '大小单双', 1, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (82, 4, '猜数字', 2, '0', '', NULL, '', NULL, '');
INSERT INTO `sys_bet_type` VALUES (83, 4, '特殊玩法', 3, '0', '', NULL, '', NULL, '');

-- ----------------------------
-- Table structure for sys_calendar
-- ----------------------------
DROP TABLE IF EXISTS `sys_calendar`;
CREATE TABLE `sys_calendar`  (
  `calendar_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日历表ID',
  `calendar_date` datetime NULL DEFAULT NULL COMMENT '日历时间',
  PRIMARY KEY (`calendar_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 359 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_calendar
-- ----------------------------
INSERT INTO `sys_calendar` VALUES (162, '2024-01-01 00:00:00');
INSERT INTO `sys_calendar` VALUES (163, '2024-01-02 00:00:00');
INSERT INTO `sys_calendar` VALUES (164, '2024-01-03 00:00:00');
INSERT INTO `sys_calendar` VALUES (165, '2024-01-04 00:00:00');
INSERT INTO `sys_calendar` VALUES (166, '2024-01-05 00:00:00');
INSERT INTO `sys_calendar` VALUES (167, '2024-01-06 00:00:00');
INSERT INTO `sys_calendar` VALUES (168, '2024-01-07 00:00:00');
INSERT INTO `sys_calendar` VALUES (169, '2024-01-08 00:00:00');
INSERT INTO `sys_calendar` VALUES (170, '2024-01-09 00:00:00');
INSERT INTO `sys_calendar` VALUES (171, '2024-01-10 00:00:00');
INSERT INTO `sys_calendar` VALUES (172, '2024-01-11 00:00:00');
INSERT INTO `sys_calendar` VALUES (173, '2024-01-12 00:00:00');
INSERT INTO `sys_calendar` VALUES (174, '2024-01-13 00:00:00');
INSERT INTO `sys_calendar` VALUES (175, '2024-01-14 00:00:00');
INSERT INTO `sys_calendar` VALUES (176, '2024-01-15 00:00:00');
INSERT INTO `sys_calendar` VALUES (177, '2024-01-16 00:00:00');
INSERT INTO `sys_calendar` VALUES (178, '2024-01-17 00:00:00');
INSERT INTO `sys_calendar` VALUES (179, '2024-01-18 00:00:00');
INSERT INTO `sys_calendar` VALUES (180, '2024-01-19 00:00:00');
INSERT INTO `sys_calendar` VALUES (181, '2024-01-20 00:00:00');
INSERT INTO `sys_calendar` VALUES (182, '2024-01-21 00:00:00');
INSERT INTO `sys_calendar` VALUES (183, '2024-01-22 00:00:00');
INSERT INTO `sys_calendar` VALUES (184, '2024-01-23 00:00:00');
INSERT INTO `sys_calendar` VALUES (185, '2024-01-24 00:00:00');
INSERT INTO `sys_calendar` VALUES (186, '2024-01-25 00:00:00');
INSERT INTO `sys_calendar` VALUES (187, '2024-01-26 00:00:00');
INSERT INTO `sys_calendar` VALUES (188, '2024-01-27 00:00:00');
INSERT INTO `sys_calendar` VALUES (189, '2024-01-28 00:00:00');
INSERT INTO `sys_calendar` VALUES (190, '2024-01-29 00:00:00');
INSERT INTO `sys_calendar` VALUES (191, '2024-01-30 00:00:00');
INSERT INTO `sys_calendar` VALUES (192, '2024-01-31 00:00:00');
INSERT INTO `sys_calendar` VALUES (193, '2024-02-01 00:00:00');
INSERT INTO `sys_calendar` VALUES (194, '2024-02-02 00:00:00');
INSERT INTO `sys_calendar` VALUES (195, '2024-02-03 00:00:00');
INSERT INTO `sys_calendar` VALUES (196, '2024-02-04 00:00:00');
INSERT INTO `sys_calendar` VALUES (197, '2024-02-05 00:00:00');
INSERT INTO `sys_calendar` VALUES (198, '2024-02-06 00:00:00');
INSERT INTO `sys_calendar` VALUES (199, '2024-02-07 00:00:00');
INSERT INTO `sys_calendar` VALUES (200, '2024-02-08 00:00:00');
INSERT INTO `sys_calendar` VALUES (201, '2024-02-09 00:00:00');
INSERT INTO `sys_calendar` VALUES (202, '2024-02-10 00:00:00');
INSERT INTO `sys_calendar` VALUES (203, '2024-02-11 00:00:00');
INSERT INTO `sys_calendar` VALUES (204, '2024-02-12 00:00:00');
INSERT INTO `sys_calendar` VALUES (205, '2024-02-13 00:00:00');
INSERT INTO `sys_calendar` VALUES (206, '2024-02-14 00:00:00');
INSERT INTO `sys_calendar` VALUES (207, '2024-02-15 00:00:00');
INSERT INTO `sys_calendar` VALUES (208, '2024-02-16 00:00:00');
INSERT INTO `sys_calendar` VALUES (209, '2024-02-17 00:00:00');
INSERT INTO `sys_calendar` VALUES (210, '2024-02-18 00:00:00');
INSERT INTO `sys_calendar` VALUES (211, '2024-02-19 00:00:00');
INSERT INTO `sys_calendar` VALUES (212, '2024-02-20 00:00:00');
INSERT INTO `sys_calendar` VALUES (213, '2024-02-21 00:00:00');
INSERT INTO `sys_calendar` VALUES (214, '2024-02-22 00:00:00');
INSERT INTO `sys_calendar` VALUES (215, '2024-02-23 00:00:00');
INSERT INTO `sys_calendar` VALUES (216, '2024-02-24 00:00:00');
INSERT INTO `sys_calendar` VALUES (217, '2024-02-25 00:00:00');
INSERT INTO `sys_calendar` VALUES (218, '2024-02-26 00:00:00');
INSERT INTO `sys_calendar` VALUES (219, '2024-02-27 00:00:00');
INSERT INTO `sys_calendar` VALUES (220, '2024-02-28 00:00:00');
INSERT INTO `sys_calendar` VALUES (221, '2024-02-29 00:00:00');
INSERT INTO `sys_calendar` VALUES (222, '2024-03-01 00:00:00');
INSERT INTO `sys_calendar` VALUES (223, '2024-03-02 00:00:00');
INSERT INTO `sys_calendar` VALUES (224, '2024-03-03 00:00:00');
INSERT INTO `sys_calendar` VALUES (225, '2024-03-04 00:00:00');
INSERT INTO `sys_calendar` VALUES (226, '2024-03-05 00:00:00');
INSERT INTO `sys_calendar` VALUES (227, '2024-03-06 00:00:00');
INSERT INTO `sys_calendar` VALUES (228, '2024-03-07 00:00:00');
INSERT INTO `sys_calendar` VALUES (229, '2024-03-08 00:00:00');
INSERT INTO `sys_calendar` VALUES (230, '2024-03-09 00:00:00');
INSERT INTO `sys_calendar` VALUES (231, '2024-03-10 00:00:00');
INSERT INTO `sys_calendar` VALUES (232, '2024-03-11 00:00:00');
INSERT INTO `sys_calendar` VALUES (233, '2024-03-12 00:00:00');
INSERT INTO `sys_calendar` VALUES (234, '2024-03-13 00:00:00');
INSERT INTO `sys_calendar` VALUES (235, '2024-03-14 00:00:00');
INSERT INTO `sys_calendar` VALUES (236, '2024-03-15 00:00:00');
INSERT INTO `sys_calendar` VALUES (237, '2024-03-16 00:00:00');
INSERT INTO `sys_calendar` VALUES (238, '2024-03-17 00:00:00');
INSERT INTO `sys_calendar` VALUES (239, '2024-03-18 00:00:00');
INSERT INTO `sys_calendar` VALUES (240, '2024-03-19 00:00:00');
INSERT INTO `sys_calendar` VALUES (241, '2024-03-20 00:00:00');
INSERT INTO `sys_calendar` VALUES (242, '2024-03-21 00:00:00');
INSERT INTO `sys_calendar` VALUES (243, '2024-03-22 00:00:00');
INSERT INTO `sys_calendar` VALUES (244, '2024-03-23 00:00:00');
INSERT INTO `sys_calendar` VALUES (245, '2024-03-24 00:00:00');
INSERT INTO `sys_calendar` VALUES (246, '2024-03-25 00:00:00');
INSERT INTO `sys_calendar` VALUES (247, '2024-03-26 00:00:00');
INSERT INTO `sys_calendar` VALUES (248, '2024-03-27 00:00:00');
INSERT INTO `sys_calendar` VALUES (249, '2024-03-28 00:00:00');
INSERT INTO `sys_calendar` VALUES (250, '2024-03-29 00:00:00');
INSERT INTO `sys_calendar` VALUES (251, '2024-03-30 00:00:00');
INSERT INTO `sys_calendar` VALUES (252, '2024-03-31 00:00:00');
INSERT INTO `sys_calendar` VALUES (253, '2024-04-01 00:00:00');
INSERT INTO `sys_calendar` VALUES (254, '2024-04-02 00:00:00');
INSERT INTO `sys_calendar` VALUES (255, '2024-04-03 00:00:00');
INSERT INTO `sys_calendar` VALUES (256, '2024-04-04 00:00:00');
INSERT INTO `sys_calendar` VALUES (257, '2024-04-05 00:00:00');
INSERT INTO `sys_calendar` VALUES (258, '2024-04-06 00:00:00');
INSERT INTO `sys_calendar` VALUES (259, '2024-04-07 00:00:00');
INSERT INTO `sys_calendar` VALUES (260, '2024-04-08 00:00:00');
INSERT INTO `sys_calendar` VALUES (261, '2024-04-09 00:00:00');
INSERT INTO `sys_calendar` VALUES (262, '2024-04-10 00:00:00');
INSERT INTO `sys_calendar` VALUES (263, '2024-04-11 00:00:00');
INSERT INTO `sys_calendar` VALUES (264, '2024-04-12 00:00:00');
INSERT INTO `sys_calendar` VALUES (265, '2024-04-13 00:00:00');
INSERT INTO `sys_calendar` VALUES (266, '2024-04-14 00:00:00');
INSERT INTO `sys_calendar` VALUES (267, '2024-04-15 00:00:00');
INSERT INTO `sys_calendar` VALUES (268, '2024-04-16 00:00:00');
INSERT INTO `sys_calendar` VALUES (269, '2024-04-17 00:00:00');
INSERT INTO `sys_calendar` VALUES (270, '2024-04-18 00:00:00');
INSERT INTO `sys_calendar` VALUES (271, '2024-04-19 00:00:00');
INSERT INTO `sys_calendar` VALUES (272, '2024-04-20 00:00:00');
INSERT INTO `sys_calendar` VALUES (273, '2024-04-21 00:00:00');
INSERT INTO `sys_calendar` VALUES (274, '2024-04-22 00:00:00');
INSERT INTO `sys_calendar` VALUES (275, '2024-04-23 00:00:00');
INSERT INTO `sys_calendar` VALUES (276, '2024-04-24 00:00:00');
INSERT INTO `sys_calendar` VALUES (277, '2024-04-25 00:00:00');
INSERT INTO `sys_calendar` VALUES (278, '2024-04-26 00:00:00');
INSERT INTO `sys_calendar` VALUES (279, '2024-04-27 00:00:00');
INSERT INTO `sys_calendar` VALUES (280, '2024-04-28 00:00:00');
INSERT INTO `sys_calendar` VALUES (281, '2024-04-29 00:00:00');
INSERT INTO `sys_calendar` VALUES (282, '2024-04-30 00:00:00');
INSERT INTO `sys_calendar` VALUES (283, '2024-05-01 00:00:00');
INSERT INTO `sys_calendar` VALUES (284, '2024-05-02 00:00:00');
INSERT INTO `sys_calendar` VALUES (285, '2024-05-03 00:00:00');
INSERT INTO `sys_calendar` VALUES (286, '2024-05-04 00:00:00');
INSERT INTO `sys_calendar` VALUES (287, '2024-05-05 00:00:00');
INSERT INTO `sys_calendar` VALUES (288, '2024-05-06 00:00:00');
INSERT INTO `sys_calendar` VALUES (289, '2024-05-07 00:00:00');
INSERT INTO `sys_calendar` VALUES (290, '2024-05-08 00:00:00');
INSERT INTO `sys_calendar` VALUES (291, '2024-05-09 00:00:00');
INSERT INTO `sys_calendar` VALUES (292, '2024-05-10 00:00:00');
INSERT INTO `sys_calendar` VALUES (293, '2024-05-11 00:00:00');
INSERT INTO `sys_calendar` VALUES (294, '2024-05-12 00:00:00');
INSERT INTO `sys_calendar` VALUES (295, '2024-05-13 00:00:00');
INSERT INTO `sys_calendar` VALUES (296, '2024-05-14 00:00:00');
INSERT INTO `sys_calendar` VALUES (297, '2024-05-15 00:00:00');
INSERT INTO `sys_calendar` VALUES (298, '2024-05-16 00:00:00');
INSERT INTO `sys_calendar` VALUES (299, '2024-05-17 00:00:00');
INSERT INTO `sys_calendar` VALUES (300, '2024-05-18 00:00:00');
INSERT INTO `sys_calendar` VALUES (301, '2024-05-19 00:00:00');
INSERT INTO `sys_calendar` VALUES (302, '2024-05-20 00:00:00');
INSERT INTO `sys_calendar` VALUES (303, '2024-05-21 00:00:00');
INSERT INTO `sys_calendar` VALUES (304, '2024-05-22 00:00:00');
INSERT INTO `sys_calendar` VALUES (305, '2024-05-23 00:00:00');
INSERT INTO `sys_calendar` VALUES (306, '2024-05-24 00:00:00');
INSERT INTO `sys_calendar` VALUES (307, '2024-05-25 00:00:00');
INSERT INTO `sys_calendar` VALUES (308, '2024-05-26 00:00:00');
INSERT INTO `sys_calendar` VALUES (309, '2024-05-27 00:00:00');
INSERT INTO `sys_calendar` VALUES (310, '2024-05-28 00:00:00');
INSERT INTO `sys_calendar` VALUES (311, '2024-05-29 00:00:00');
INSERT INTO `sys_calendar` VALUES (312, '2024-05-30 00:00:00');
INSERT INTO `sys_calendar` VALUES (313, '2024-05-31 00:00:00');
INSERT INTO `sys_calendar` VALUES (314, '2024-06-01 00:00:00');
INSERT INTO `sys_calendar` VALUES (315, '2024-06-02 00:00:00');
INSERT INTO `sys_calendar` VALUES (316, '2024-06-03 00:00:00');
INSERT INTO `sys_calendar` VALUES (317, '2024-06-04 00:00:00');
INSERT INTO `sys_calendar` VALUES (318, '2024-06-05 00:00:00');
INSERT INTO `sys_calendar` VALUES (319, '2024-06-06 00:00:00');
INSERT INTO `sys_calendar` VALUES (320, '2024-06-07 00:00:00');
INSERT INTO `sys_calendar` VALUES (321, '2024-06-08 00:00:00');
INSERT INTO `sys_calendar` VALUES (322, '2024-06-09 00:00:00');
INSERT INTO `sys_calendar` VALUES (323, '2024-06-10 00:00:00');
INSERT INTO `sys_calendar` VALUES (324, '2024-06-11 00:00:00');
INSERT INTO `sys_calendar` VALUES (325, '2024-06-12 00:00:00');
INSERT INTO `sys_calendar` VALUES (326, '2024-06-13 00:00:00');
INSERT INTO `sys_calendar` VALUES (327, '2024-06-14 00:00:00');
INSERT INTO `sys_calendar` VALUES (328, '2024-06-15 00:00:00');
INSERT INTO `sys_calendar` VALUES (329, '2024-06-16 00:00:00');
INSERT INTO `sys_calendar` VALUES (330, '2024-06-17 00:00:00');
INSERT INTO `sys_calendar` VALUES (331, '2024-06-18 00:00:00');
INSERT INTO `sys_calendar` VALUES (332, '2024-06-19 00:00:00');
INSERT INTO `sys_calendar` VALUES (333, '2024-06-20 00:00:00');
INSERT INTO `sys_calendar` VALUES (334, '2024-06-21 00:00:00');
INSERT INTO `sys_calendar` VALUES (335, '2024-06-22 00:00:00');
INSERT INTO `sys_calendar` VALUES (336, '2024-06-23 00:00:00');
INSERT INTO `sys_calendar` VALUES (337, '2024-06-24 00:00:00');
INSERT INTO `sys_calendar` VALUES (338, '2024-06-25 00:00:00');
INSERT INTO `sys_calendar` VALUES (339, '2024-06-26 00:00:00');
INSERT INTO `sys_calendar` VALUES (340, '2024-06-27 00:00:00');
INSERT INTO `sys_calendar` VALUES (341, '2024-06-28 00:00:00');
INSERT INTO `sys_calendar` VALUES (342, '2024-06-29 00:00:00');
INSERT INTO `sys_calendar` VALUES (343, '2024-06-30 00:00:00');
INSERT INTO `sys_calendar` VALUES (344, '2024-07-01 00:00:00');
INSERT INTO `sys_calendar` VALUES (345, '2024-07-02 00:00:00');
INSERT INTO `sys_calendar` VALUES (346, '2024-07-03 00:00:00');
INSERT INTO `sys_calendar` VALUES (347, '2024-07-04 00:00:00');
INSERT INTO `sys_calendar` VALUES (348, '2024-07-05 00:00:00');
INSERT INTO `sys_calendar` VALUES (349, '2024-07-06 00:00:00');
INSERT INTO `sys_calendar` VALUES (350, '2024-07-07 00:00:00');
INSERT INTO `sys_calendar` VALUES (351, '2024-07-08 00:00:00');
INSERT INTO `sys_calendar` VALUES (352, '2024-07-09 00:00:00');
INSERT INTO `sys_calendar` VALUES (353, '2024-07-10 00:00:00');
INSERT INTO `sys_calendar` VALUES (354, '2024-07-11 00:00:00');
INSERT INTO `sys_calendar` VALUES (355, '2024-07-12 00:00:00');
INSERT INTO `sys_calendar` VALUES (356, '2024-07-13 00:00:00');
INSERT INTO `sys_calendar` VALUES (357, '2024-07-14 00:00:00');
INSERT INTO `sys_calendar` VALUES (358, '2024-07-15 00:00:00');

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-03-05 21:03:11', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-03-05 21:03:11', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-03-05 21:03:11', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2024-03-05 21:03:11', 'admin', '2024-03-05 21:06:00', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-03-05 21:03:11', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-03-05 21:03:11', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '充值最小金额', 'sys.change.min', '100', 'Y', 'admin', '2024-04-23 20:12:13', 'sharkadmin', '2024-07-10 21:26:08', NULL);
INSERT INTO `sys_config` VALUES (8, '提现最小金额', 'sys.postal.min', '100', 'Y', 'admin', '2024-04-23 21:27:38', 'sharkadmin', '2024-07-10 21:26:14', NULL);
INSERT INTO `sys_config` VALUES (9, '每日提现次数', 'sys.postal.maxCnt', '5', 'Y', 'admin', '2024-04-23 21:29:58', '', NULL, NULL);
INSERT INTO `sys_config` VALUES (11, '客服网站地址', 'sys.im.site', 'http://43.132.168.72:81', 'Y', 'admin', '2024-05-26 19:32:48', 'admin', '2024-05-26 19:47:37', NULL);
INSERT INTO `sys_config` VALUES (12, 'app聊天网站地址', 'sys.im.h5.Site', 'http://43.132.168.72:82', 'Y', 'admin', '2024-05-26 19:59:43', 'sharkadmin', '2024-07-10 21:37:45', '赢利集团，新老玩家推广朋友圈有福利，啦新人充值马上奖励，具体联系客服询问。上下分实名制，上米都从新拿卡号。客服号10分钟内没回复的话请联系下方在线客服,本平台没有旗下任何平台如有冒充说旗下平台，都是骗子');
INSERT INTO `sys_config` VALUES (13, 'app首页公告内容', 'sys.app.home.notice', '本台交易支持，微信，支付宝，银联，USDT,上分前请先私聊台子上的在线客服，不要乱转哦，谢谢配合', 'Y', 'admin', '2024-05-26 20:09:01', 'admin', '2024-05-26 20:10:03', NULL);
INSERT INTO `sys_config` VALUES (14, '获取官方开奖结果的URL', 'sys.opengame.url', 'http://api.htn58.vip/home/api/getCodeData?code=', 'Y', 'admin', '2024-05-27 20:11:29', 'admin', '2024-06-23 23:01:45', NULL);
INSERT INTO `sys_config` VALUES (15, 'LOGO图片地址', 'sys.logo.img', '/profile/upload/2024/06/09/cd7465ff54e52e36926406911e6f9e71_20240609174847A002.jpeg', 'Y', '', '2024-06-09 17:42:34', '', '2024-06-09 17:48:48', NULL);
INSERT INTO `sys_config` VALUES (16, '微信客服图片地址', 'sys.wechat.img', '/profile/upload/2024/06/19/weixin_1_20240619213328A004.png', 'Y', '', '2024-06-19 21:21:09', '', '2024-06-19 21:33:29', NULL);
INSERT INTO `sys_config` VALUES (17, 'LOGO图片地址', 'sys.qqchat.img', '/profile/upload/2024/06/19/qq_1_20240619212108A002.png', 'Y', '', '2024-06-19 21:21:09', '', '2024-06-19 21:33:29', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '游戏管理平台', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-05 21:03:10', 'admin', '2024-04-08 19:35:35');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '代理', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-05 21:03:10', 'admin', '2024-04-08 19:37:50');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '用户', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-05 21:03:10', 'admin', '2024-04-08 19:37:56');

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
) ENGINE = InnoDB AUTO_INCREMENT = 176 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_dict_data` VALUES (103, 1, '显示', '0', 'sys_bet_item_status', NULL, 'primary', 'N', '0', 'admin', '2024-03-06 21:35:32', 'admin', '2024-07-15 18:20:29', NULL);
INSERT INTO `sys_dict_data` VALUES (104, 1, '隐藏', '1', 'sys_bet_item_status', NULL, 'danger', 'N', '0', 'admin', '2024-03-06 21:35:40', 'admin', '2024-07-15 18:20:35', NULL);
INSERT INTO `sys_dict_data` VALUES (105, 1, '正常', '0', 'sys_game_status', NULL, 'primary', 'N', '0', 'admin', '2024-03-06 21:39:22', 'admin', '2024-03-06 21:39:35', NULL);
INSERT INTO `sys_dict_data` VALUES (106, 2, '停用', '1', 'sys_game_status', NULL, 'danger', 'N', '0', 'admin', '2024-03-06 21:39:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 1, '正常', '0', 'sys_replace_status', NULL, 'success', 'N', '0', 'admin', '2024-03-17 19:29:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 2, '停用', '1', 'sys_replace_status', NULL, 'danger', 'N', '0', 'admin', '2024-03-17 19:29:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 1, '未开奖', '0', 'sys_kj_status', NULL, 'warning', 'N', '0', 'admin', '2024-04-04 20:35:13', 'admin', '2024-04-04 20:55:24', NULL);
INSERT INTO `sys_dict_data` VALUES (110, 2, '已开奖', '1', 'sys_kj_status', NULL, 'success', 'N', '0', 'admin', '2024-04-04 20:35:24', 'admin', '2024-04-04 20:55:35', NULL);
INSERT INTO `sys_dict_data` VALUES (111, 2, '开奖中', '2', 'sys_kj_status', NULL, 'info', 'N', '0', 'admin', '2024-04-04 22:05:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 1, '微信', '0', 'sys_payment_type', NULL, 'default', 'N', '0', 'admin', '2024-04-07 19:03:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 2, '支付宝', '1', 'sys_payment_type', NULL, 'default', 'N', '0', 'admin', '2024-04-07 19:03:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 3, '银联', '2', 'sys_payment_type', NULL, 'default', 'N', '0', 'admin', '2024-04-07 19:04:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 1, '正常', '0', 'sys_payment_status', NULL, 'primary', 'N', '0', 'admin', '2024-04-07 19:19:24', 'admin', '2024-04-07 19:19:51', NULL);
INSERT INTO `sys_dict_data` VALUES (116, 2, '停用', '1', 'sys_payment_status', NULL, 'danger', 'N', '0', 'admin', '2024-04-07 19:19:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 1, '超级管理员', '00', 'user_type', NULL, 'default', 'N', '0', 'admin', '2024-04-08 20:31:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 2, '平台管理员', '01', 'user_type', NULL, 'default', 'N', '0', 'admin', '2024-04-08 20:31:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (119, 3, 'APP用户', '02', 'user_type', NULL, 'default', 'N', '0', 'admin', '2024-04-08 20:32:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (120, 1, '10', 'small_num', 'limit_amount_ten', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:20:40', 'admin', '2024-04-18 20:23:31', '最小下注额度');
INSERT INTO `sys_dict_data` VALUES (121, 2, '100000', 'sum_max', 'limit_amount_ten', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:23:25', 'admin', '2024-04-18 20:26:23', '下注总额度');
INSERT INTO `sys_dict_data` VALUES (122, 3, '5000', 'big_num_special', 'limit_amount_ten', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:24:26', 'admin', '2024-04-18 20:24:33', '特殊冠亚和');
INSERT INTO `sys_dict_data` VALUES (123, 4, '30000', 'big_dxds', 'limit_amount_ten', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:25:01', '', NULL, '两面');
INSERT INTO `sys_dict_data` VALUES (124, 5, '5000', 'sum_num_special', 'limit_amount_ten', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:25:34', '', NULL, '其他和值');
INSERT INTO `sys_dict_data` VALUES (125, 6, '10000', 'big_num', 'limit_amount_ten', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:25:55', '', NULL, '赛道号码');
INSERT INTO `sys_dict_data` VALUES (126, 1, '100', 'big_special_he', 'limit_amount_five', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:27:27', '', NULL, '和-限额');
INSERT INTO `sys_dict_data` VALUES (127, 2, '20000', 'big_dxds', 'limit_amount_five', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:27:41', '', NULL, '两面');
INSERT INTO `sys_dict_data` VALUES (128, 3, '3000', 'big_special', 'limit_amount_five', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:27:56', 'admin', '2024-04-18 20:28:01', '前中后三');
INSERT INTO `sys_dict_data` VALUES (129, 4, '10', 'small_num', 'limit_amount_five', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:28:19', '', NULL, '最小下注额度');
INSERT INTO `sys_dict_data` VALUES (130, 5, '50000', 'sum_max', 'limit_amount_five', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:28:38', '', NULL, '下注总额度');
INSERT INTO `sys_dict_data` VALUES (131, 6, '10000', 'big_num', 'limit_amount_five', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:29:04', '', NULL, '号码限额');
INSERT INTO `sys_dict_data` VALUES (132, 1, '500', 'big_special', 'limit_amount_three', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:29:46', '', NULL, '特殊号码限额');
INSERT INTO `sys_dict_data` VALUES (133, 2, '0', 'num_count', 'limit_amount_three', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:30:01', 'admin', '2024-07-09 19:53:36', '号码投注个数（为0不限制投注个数）');
INSERT INTO `sys_dict_data` VALUES (134, 3, '10', 'small_num', 'limit_amount_three', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:30:42', 'admin', '2024-04-18 20:30:47', '最小下注额度');
INSERT INTO `sys_dict_data` VALUES (135, 4, '100000', 'sum_max', 'limit_amount_three', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:31:09', '', NULL, '下注总额度');
INSERT INTO `sys_dict_data` VALUES (136, 6, '10000', 'b_num1', 'limit_amount_three', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:37:48', '', NULL, '号码限额');
INSERT INTO `sys_dict_data` VALUES (137, 6, '20000', 'b_num2', 'limit_amount_three', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:38:15', '', NULL, '大小单双');
INSERT INTO `sys_dict_data` VALUES (138, 7, '10000', 'b_num3', 'limit_amount_three', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:38:38', '', NULL, '极值');
INSERT INTO `sys_dict_data` VALUES (139, 8, '20000', 'b_num4', 'limit_amount_three', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:38:58', 'admin', '2024-04-18 20:39:26', '组合');
INSERT INTO `sys_dict_data` VALUES (140, 9, '10000', 'b_num5', 'limit_amount_three', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:39:20', '', NULL, '波色');
INSERT INTO `sys_dict_data` VALUES (141, 10, '10000', 'b_num6', 'limit_amount_three', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:39:43', '', NULL, '对顺豹');
INSERT INTO `sys_dict_data` VALUES (142, 11, '10000', 'b_num8', 'limit_amount_three', NULL, 'default', 'N', '0', 'admin', '2024-04-18 20:40:29', '', NULL, '龙虎合');
INSERT INTO `sys_dict_data` VALUES (143, 1, '申请提现', '4', 'sys_postal_status', NULL, 'primary', 'N', '0', 'admin', '2024-05-07 20:50:28', 'admin', '2024-05-07 20:51:00', NULL);
INSERT INTO `sys_dict_data` VALUES (144, 2, '提现成功', '5', 'sys_postal_status', NULL, 'success', 'N', '0', 'admin', '2024-05-07 20:50:38', 'admin', '2024-05-07 20:51:04', NULL);
INSERT INTO `sys_dict_data` VALUES (145, 3, '提现失败', '6', 'sys_postal_status', NULL, 'danger', 'N', '0', 'admin', '2024-05-07 20:50:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (146, 1, '申请充值', '1', 'sys_recharge_status', NULL, 'primary', 'N', '0', 'admin', '2024-05-08 21:15:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (147, 2, '充值成功', '2', 'sys_recharge_status', NULL, 'success', 'N', '0', 'admin', '2024-05-08 21:15:42', 'admin', '2024-05-08 21:15:51', NULL);
INSERT INTO `sys_dict_data` VALUES (148, 3, '充值失败', '3', 'sys_recharge_status', NULL, 'danger', 'N', '0', 'admin', '2024-05-08 21:15:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (149, 1, '等待处理', '0', 'sys_cashback_status', NULL, 'primary', 'N', '0', 'admin', '2024-05-16 22:37:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (150, 2, '已经返点', '1', 'sys_cashback_status', NULL, 'success', 'N', '0', 'admin', '2024-05-16 22:37:16', 'admin', '2024-05-16 22:37:23', NULL);
INSERT INTO `sys_dict_data` VALUES (151, 1, '等待处理', '0', 'sys_commission_status', NULL, 'primary', 'N', '0', 'admin', '2024-05-18 22:32:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (152, 2, '返佣完成', '1', 'sys_commission_status', NULL, 'success', 'N', '0', 'admin', '2024-05-18 22:32:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (153, 1, '正常', '0', 'entry_domain_status', NULL, 'success', 'N', '0', 'admin', '2024-06-09 12:24:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (154, 2, '未激活', '1', 'entry_domain_status', NULL, 'warning', 'N', '0', 'admin', '2024-06-09 12:24:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (155, 1, '正常', '0', 'landing_domain_status', NULL, 'success', 'N', '0', 'admin', '2024-06-09 12:24:59', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (156, 2, '未激活', '1', 'landing_domain_status', NULL, 'warning', 'N', '0', 'admin', '2024-06-09 12:26:12', 'admin', '2024-06-09 12:26:17', NULL);
INSERT INTO `sys_dict_data` VALUES (157, 1, '否', 'N', 'sys_game_open_type', NULL, 'default', 'N', '0', 'admin', '2024-06-28 18:04:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (158, 2, '是', 'Y', 'sys_game_open_type', NULL, 'default', 'N', '0', 'admin', '2024-06-28 18:05:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (159, 1, '申请充值', '1', 'sys_user_money_type', NULL, 'default', 'N', '0', 'admin', '2024-06-28 18:05:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (160, 2, '用户充值', '2', 'sys_user_money_type', NULL, 'default', 'N', '0', 'admin', '2024-06-28 18:05:31', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (161, 3, '充值失败', '3', 'sys_user_money_type', NULL, 'default', 'N', '0', 'admin', '2024-06-28 18:05:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (162, 4, '申请提现', '4', 'sys_user_money_type', NULL, 'default', 'N', '0', 'admin', '2024-06-28 18:05:45', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (163, 5, '用户提现', '5', 'sys_user_money_type', NULL, 'default', 'N', '0', 'admin', '2024-06-28 18:05:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (164, 6, '提现失败', '6', 'sys_user_money_type', NULL, 'default', 'N', '0', 'admin', '2024-06-28 18:06:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (165, 7, '投注', '7', 'sys_user_money_type', NULL, 'default', 'N', '0', 'admin', '2024-06-28 18:06:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (166, 8, '中奖', '8', 'sys_user_money_type', NULL, 'default', 'N', '0', 'admin', '2024-06-28 18:06:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (167, 11, '佣金', '11', 'sys_user_money_type', NULL, 'default', 'N', '0', 'admin', '2024-06-28 18:06:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (168, 16, '反水', '16', 'sys_user_money_type', NULL, 'default', 'N', '0', 'admin', '2024-06-28 18:06:48', 'admin', '2024-06-28 18:07:13', NULL);
INSERT INTO `sys_dict_data` VALUES (169, 111, '管理员撤单', '111', 'sys_user_money_type', NULL, 'default', 'N', '0', 'admin', '2024-06-28 18:07:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (170, 1, '正常', '0', 'sys_user_status', '1', 'success', 'N', '0', 'admin', '2024-06-28 23:17:30', 'admin', '2024-06-28 23:17:43', NULL);
INSERT INTO `sys_dict_data` VALUES (171, 2, '封号', '1', 'sys_user_status', NULL, 'danger', 'N', '0', 'admin', '2024-06-28 23:17:39', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (172, 1, '否', '0', 'sys_user_is_test', NULL, 'success', 'N', '0', 'admin', '2024-07-08 19:49:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (173, 2, '是', '1', 'sys_user_is_test', NULL, 'danger', 'N', '0', 'admin', '2024-07-08 19:50:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (174, 1, '正常', '0', 'sys_bet_type_status', NULL, 'primary', 'N', '0', 'admin', '2024-07-15 18:19:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (175, 2, '停用', '1', 'sys_bet_type_status', NULL, 'danger', 'N', '0', 'admin', '2024-07-15 18:19:43', '', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_dict_type` VALUES (105, '支付方式', 'sys_payment_type', '0', 'admin', '2024-04-07 19:03:32', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (106, '支付方式状态', 'sys_payment_status', '0', 'admin', '2024-04-07 19:19:03', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (107, '用户类型', 'user_type', '0', 'admin', '2024-04-08 20:31:24', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (108, '投注限额3球（加拿大类型）', 'limit_amount_three', '0', 'admin', '2024-04-18 20:17:54', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (109, '投注限额5球(时时彩类型)', 'limit_amount_five', '0', 'admin', '2024-04-18 20:18:21', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (110, '投注限额10球(赛车类型)', 'limit_amount_ten', '0', 'admin', '2024-04-18 20:18:37', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (111, '提现状态', 'sys_postal_status', '0', 'admin', '2024-05-07 20:49:45', 'admin', '2024-05-08 21:14:42', NULL);
INSERT INTO `sys_dict_type` VALUES (112, '充值状态', 'sys_recharge_status', '0', 'admin', '2024-05-08 21:14:30', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (113, '反水状态', 'sys_cashback_status', '0', 'admin', '2024-05-16 22:36:40', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (114, '反佣状态', 'sys_commission_status', '0', 'admin', '2024-05-18 22:31:56', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (115, '入口域名状态', 'entry_domain_status', '0', 'admin', '2024-06-09 12:24:04', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (116, '落地域名状态', 'landing_domain_status', '0', 'admin', '2024-06-09 12:24:14', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (117, '游戏开奖区分', 'sys_game_open_type', '0', 'admin', '2024-06-28 18:03:17', 'admin', '2024-06-28 18:03:31', 'N否 Y是');
INSERT INTO `sys_dict_type` VALUES (118, '用户流水状态', 'sys_user_money_type', '0', 'admin', '2024-06-28 18:03:25', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (119, '用户状态', 'sys_user_status', '0', 'admin', '2024-06-28 23:17:16', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (120, '测试用户标识', 'sys_user_is_test', '0', 'admin', '2024-07-08 19:49:12', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (121, '游戏玩法状态', 'sys_bet_type_status', '0', 'admin', '2024-07-15 18:18:39', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_entry_domain
-- ----------------------------
DROP TABLE IF EXISTS `sys_entry_domain`;
CREATE TABLE `sys_entry_domain`  (
  `entry_domain_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '入口域名ID',
  `entry_domain_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入口域名',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '入口域名状态（0正常 1未激活）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`entry_domain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '入口域名表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_entry_domain
-- ----------------------------
INSERT INTO `sys_entry_domain` VALUES (1, 'http://123.sctgxs.cn/?', '0', '0', '若依', '2024-06-09 17:43:02', '', '2024-06-24 23:14:12', '');
INSERT INTO `sys_entry_domain` VALUES (2, 'http://test.evdvul.cn/?inviteCode=', '0', '1', '平台管理员', '2024-06-12 18:52:34', '', '2024-06-12 18:54:25', '');
INSERT INTO `sys_entry_domain` VALUES (3, 'http://43.132.168.72/#/?', '0', '0', '平台管理员', '2024-06-13 00:28:05', '', '2024-06-19 16:02:11', '');

-- ----------------------------
-- Table structure for sys_game
-- ----------------------------
DROP TABLE IF EXISTS `sys_game`;
CREATE TABLE `sys_game`  (
  `game_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '游戏ID',
  `game_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏图片',
  `game_type` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏类别',
  `game_mark_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏标识ID',
  `game_open_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏开奖code',
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
  `valid_open_start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0000' COMMENT '游戏有效开奖开始时间',
  `valid_open_end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2359' COMMENT '游戏有效开奖结束时间',
  `system_open_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否系统开奖区分(N否 Y是)',
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
INSERT INTO `sys_game` VALUES (1, '/profile/upload/2024/03/06/jnd2.0_20240306222925A002.jpg', '3', 'jnd20', 'jnd28', '加拿大2.0', '加拿大28', 0xE38090E58AA0E68BBFE5A4A7322E30E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A322E30E5808DEFBC88E5BC8031332F3134E8B594312E35E5808DEFBC89E5B08FE58D952FE5A4A7E58F8CEFBC9A342E36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A342E32E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3135E5808DE38090E789B9E6AE8AE8B594E78E87E38091E4B9B0E5B08FE68896E58D95EFBC8CE5BC80E5A596E4B8BA3133E4B894E8B594EFBC9A312E35E5808DE4B9B0E5A4A7E68896E58F8CEFBC8CE5BC80E5A596E4B8BA3134E4B894E8B594EFBC9A312E35E5808DE4B88BE6B3A8E5B08FE58D95E5BC80E5A596E4B8BA3133E4B8ADE5A596E59B9EE69CAC266E6273703BE4B88BE6B3A8E5A4A7E58F8CE5BC80E5A596E4B8BA3134E4B8ADE5A596E59B9EE69CAC266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E58F8DE58D83E58886E4B98B3135E38091E38090E6999AE4B88A30303A3135E5898DE7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, 'game_threeball_record', 'game_threeball_kj', 3.00, NULL, NULL, 5.00, 5.00, 10000.00, 10, 55, 210, 40, NULL, 1, '0', 'Y', 0, '0000', '2359', 'N', '', '2024-03-06 22:34:06', '', '2024-07-13 22:58:16', '');
INSERT INTO `sys_game` VALUES (2, '/profile/upload/2024/03/09/jnd28_20240309200723A001.jpg', '3', 'jnd28', 'jnd28', '加拿大2.8', '加拿大2.8', 0xE38090E58AA0E68BBFE5A4A7322E38E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A322E38E5808DE5B08FE58D952FE5A4A7E58F8CEFBC9A36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A36E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3136E5808DE5AFB9E5AD902F33266E6273703B20266E6273703BE9A1BAE5AD902F3132266E6273703B20266E6273703BE8B1B9E5AD902F3630266E6273703BE38090E789B9E6AE8AE8B594E78E87E38091E5BC80E695B0E5AD9731332F31342FE5AFB9E5AD902FE9A1BAE5AD902FE8B1B9E5AD902F20E4B8ADE5A596E58D95E6B3A8E7BB84E59088E59B9EE69CAC266E6273703BE695B0E5AD97EFBC8830302F3237EFBC89EFBC9A353230E5808DE695B0E5AD97EFBC8830312F3236EFBC89EFBC9A323430E5808DE695B0E5AD97EFBC8830322F3235EFBC89EFBC9A313230E5808DE695B0E5AD97EFBC8830332F3234EFBC89EFBC9A3732E5808DE695B0E5AD97EFBC8830342F3233EFBC89EFBC9A3438E5808DE695B0E5AD97EFBC8830352F3232EFBC89EFBC9A3330E5808DE695B0E5AD97EFBC8830362F3231EFBC89EFBC9A3234E5808DE695B0E5AD97EFBC8830372F3230EFBC89EFBC9A3139E5808DE695B0E5AD97EFBC8830382F3139EFBC89EFBC9A3137E5808DE695B0E5AD97EFBC8830392F3138EFBC89EFBC9A3135E5808DE695B0E5AD97EFBC8831302F3137EFBC89EFBC9A3134E5808DE695B0E5AD97EFBC8831312F3136EFBC89EFBC9A3133E5808DE695B0E5AD97EFBC8831322F3135EFBC89EFBC9A3132E5808DE695B0E5AD97EFBC8831332F3134EFBC89EFBC9A3132E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E58C85E590ABE69CACE98791EFBC81266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE7BB84E59088EFBC9A3130303030E5B081E9A1B6266E6273703BE69E81E5A4A72FE69E81E5B08FEFBC9A3130303030E5B081E9A1B6266E6273703BE695B0E5AD9730302F3237EFBC9A31303030E5B081E9A1B6E695B0E5AD97312F3236EFBC9A33303030E5B081E9A1B6E5AFB9E9A1BAE5AD90EFBC9A3130303030E5B081E9A1B6E8B1B9E5AD90EFBC9A35303030E5B081E9A1B6E58D95E782B9E695B0E5AD97E69C80E9AB98E8B594E4BB98353030303030E38090E4BA8FE68D9FE58F8DE6B0B4E38091E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3135E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, 'Jnd28', 'game_threeball_record', 'game_threeball_kj', 5.00, NULL, NULL, 5.00, 5.00, 20000.00, 10, 55, 210, 20, NULL, 2, '0', 'N', 0, '0000', '2359', 'N', '', '2024-03-06 22:34:06', '', '2024-05-25 21:47:12', '');
INSERT INTO `sys_game` VALUES (3, '/profile/upload/2024/03/09/jnd32_20240309200821A002.jpg', '3', 'jnd32', 'jnd28', '加拿大3.2', '加拿大3.2', 0xE38090E58AA0E68BBFE5A4A7332E32E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A332E32E5808DE5B08FE58D952FE5A4A7E58F8CEFBC9A362E36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A362E36E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3135E5808DE38090E789B9E6AE8AE8B594E78E87E38091E5A4A7E5B08FE58D95E58F8C20E6ADA3E5B8B8E8B594E78E87332E32E5808DEFBC8CE5BC80E5A596E7BB93E69E9CE98187E5BC80E5A596E58CBAE4B889E4B8AAE695B0E5AD97E585B6E4B8ADE4B880E4B8AAE5B8A630E6889639E4B88EE5BC80E5A596E7BB93E69E9C3133E688963134EFBC8CE4B8ADE5A596E59B9EE69CACE98791E38082E7BB84E59088EFBC8CE6ADA3E5B8B8E8B594E78E87362E36E5808DEFBC8CE5BC80E5A596E7BB93E69E9CE98187E5BC80E5A596E58CBAE4B889E4B8AAE695B0E5AD97E585B6E4B8ADE4B880E4B8AAE5B8A630E6889639E4B88EE5BC80E5A596E7BB93E69E9C3133E688963134EFBC8CE4B8ADE5A596E59B9EE69CACE98791E38082E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B35E38091E38090E6B581E6B0B4E58F8DE58D83E58886E4B98B35E38091, NULL, 'game_threeball_record', 'game_threeball_kj', 0.00, NULL, NULL, 15.00, 5.00, 20000.00, 10, 55, 210, 20, NULL, 3, '0', 'Y', 0, '0000', '2359', 'N', '', '2024-03-06 22:34:06', '', '2024-07-13 22:58:44', '');
INSERT INTO `sys_game` VALUES (4, '/profile/upload/2024/03/09/jspc28_20240309200907A003.png', '3', 'jspc28', NULL, '比特2.0', '比特28', 0xE38090E6BEB3E6B4B2E69E81E9809F322E30E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A322E30E5808DEFBC88E5BC8031332F3134E8B594312E36E5808DEFBC89E5B08FE58D952FE5A4A7E58F8CEFBC9A342E36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A342E32E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3135E5808DE38090E789B9E6AE8AE8B594E78E87E38091E4B9B0E5B08FE68896E58D95EFBC8CE5BC80E5A596E4B8BA3133E4B894E8B594EFBC9A312E36E5808DE4B9B0E5A4A7E68896E58F8CEFBC8CE5BC80E5A596E4B8BA3134E4B894E8B594EFBC9A312E36E5808DE4B88BE6B3A8E5B08FE58D95E5BC80E5A596E4B8BA3133E4B8ADE5A596E59B9EE69CAC266E6273703BE4B88BE6B3A8E5A4A7E58F8CE5BC80E5A596E4B8BA3134E4B8ADE5A596E59B9EE69CAC266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E58F8DE58D83E58886E4B98B3230E38091E38090E6999AE4B88A30303A3135E5898DE7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, 'game_threeball_record', 'game_threeball_kj', 10.00, NULL, NULL, 20.00, 2.00, 20000.00, 0, 20, 0, 20, NULL, 4, '1', 'Y', 0, '0000', '2359', 'N', '', '2024-03-06 22:34:06', '', '2024-07-13 22:58:58', '');
INSERT INTO `sys_game` VALUES (5, '/profile/upload/2024/03/09/bt28_20240309201046A004.png', '3', 'bt28', NULL, '比特2.8', '比特2.8', 0xE38090E6BEB3E6B4B2E69E81E9809F322E38E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A322E38E5808DE5B08FE58D952FE5A4A7E58F8CEFBC9A36E5808DE5B08FE58F8C2FE5A4A7E58D95EFBC9A36E5808DE69E81E5A4A72FE69E81E5B08FEFBC9A3135E5808DE5AFB9E5AD902F33266E6273703B20266E6273703BE9A1BAE5AD902F3132266E6273703B20266E6273703BE8B1B9E5AD902F3530266E6273703BE38090E789B9E6AE8AE8B594E78E87E38091E5BC80E695B0E5AD9731332F31342FE5AFB9E5AD902FE9A1BAE5AD902FE8B1B9E5AD902F20E4B8ADE5A596E58D95E6B3A8E7BB84E59088E59B9EE69CAC266E6273703BE695B0E5AD97EFBC8830302F3237EFBC89EFBC9A353030E5808DE695B0E5AD97EFBC8830312F3236EFBC89EFBC9A323430E5808DE695B0E5AD97EFBC8830322F3235EFBC89EFBC9A313230E5808DE695B0E5AD97EFBC8830332F3234EFBC89EFBC9A3732E5808DE695B0E5AD97EFBC8830342F3233EFBC89EFBC9A3438E5808DE695B0E5AD97EFBC8830352F3232EFBC89EFBC9A3333E5808DE695B0E5AD97EFBC8830362F3231EFBC89EFBC9A3235E5808DE695B0E5AD97EFBC8830372F3230EFBC89EFBC9A3230E5808DE695B0E5AD97EFBC8830382F3139EFBC89EFBC9A3137E5808DE695B0E5AD97EFBC8830392F3138EFBC89EFBC9A3135E5808DE695B0E5AD97EFBC8831302F3137EFBC89EFBC9A3134E5808DE695B0E5AD97EFBC8831312F3136EFBC89EFBC9A3134E5808DE695B0E5AD97EFBC8831322F3135EFBC89EFBC9A3133E5808DE695B0E5AD97EFBC8831332F3134EFBC89EFBC9A3132E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E58C85E590ABE69CACE98791EFBC81266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE7BB84E59088EFBC9A3130303030E5B081E9A1B6266E6273703BE69E81E5A4A72FE69E81E5B08FEFBC9A3130303030E5B081E9A1B6266E6273703BE695B0E5AD9730302F3237EFBC9A31303030E5B081E9A1B6E695B0E5AD97312F3236EFBC9A33303030E5B081E9A1B6E5AFB9E9A1BAE5AD90EFBC9A3130303030E5B081E9A1B6E8B1B9E5AD90EFBC9A35303030E5B081E9A1B6E58D95E782B9E695B0E5AD97E69C80E9AB98E8B594E4BB98353030303030E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3135E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, 'game_threeball_record', 'game_threeball_kj', 5.00, NULL, NULL, 5.00, 5.00, 50000.00, 0, 20, 0, 20, NULL, 5, '1', 'Y', 0, '0000', '2359', 'N', '', '2024-03-06 22:34:06', '', '2024-03-09 20:11:14', '');
INSERT INTO `sys_game` VALUES (6, '/profile/upload/2024/03/09/mssc_20240309201138A005.png', '10', 'mssc', 'jssc', '极速赛车', '极速赛车', 0xE38090E6BEB3E6B4B2E69E81E9809FE8B59BE8BDA6E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E7A68FE588A9E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3135E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, 'game_tenball_record', 'game_tenball_kj', 10.00, NULL, NULL, 5.00, 5.00, 50000.00, 0, 5, 75, 20, NULL, 6, '0', 'Y', 0, '0000', '2359', 'N', '', '2024-03-06 22:34:06', '', '2024-07-05 00:45:52', '');
INSERT INTO `sys_game` VALUES (7, '/profile/upload/2024/03/09/azxy52_20240309201631A006.jpg', '5', 'azxy52', NULL, '澳洲幸运5高赔率', '澳洲幸运5高赔率', 0xE38090E6BEB3E6B4B2E5B9B8E8BF9035266E6273703B392E39E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D302D39E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, NULL, 'game_fiveball_record', 'game_fiveball_kj', 0.00, NULL, NULL, 5.00, 5.00, 100000.00, 0, 70, 0, 20, NULL, 7, '1', 'Y', 0, '0000', '2359', 'N', '', '2024-03-06 22:34:06', '', '2024-05-25 21:28:29', '');
INSERT INTO `sys_game` VALUES (8, '/profile/upload/2024/03/09/azxy5_20240309201732A007.jpg', '5', 'azxy5', 'azxy5', '澳洲幸运5', '澳洲幸运5', 0xE38090E6BEB3E6B4B2E5B9B8E8BF9035266E6273703B392E39E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D302D39E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, 'Azxy5', 'game_fiveball_record', 'game_fiveball_kj', 0.00, NULL, NULL, 5.00, 5.00, 100000.00, 15, 70, 300, 20, NULL, 8, '0', 'Y', 0, '0000', '2359', 'N', '', '2024-03-06 22:34:06', '', '2024-07-05 00:46:11', '');
INSERT INTO `sys_game` VALUES (9, '/profile/upload/2024/03/09/azxy10_20240309201831A008.jpg', '10', 'azxy10', 'azxy10', '澳洲幸运10', '澳洲幸运10', 0xE38090E6BEB3E6B4B2E5B9B8E8BF903130266E6273703B20392E39E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, 'Azxy10', 'game_tenball_record', 'game_tenball_kj', 15.00, NULL, NULL, 10.00, 5.00, 300000.00, 15, 70, 300, 20, NULL, 9, '0', 'N', 0, '0000', '2359', 'N', '', '2024-03-06 22:34:06', '', '2024-07-05 00:46:28', '');
INSERT INTO `sys_game` VALUES (10, '/profile/upload/2024/03/09/azxy10_20240309201934A009.jpg', '10', 'azxy102', NULL, '澳洲幸运10高赔率', '澳洲幸运10高赔率', 0xE38090E6BEB3E6B4B2E5B9B8E8BF903130266E6273703B20392E39E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703B20266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, NULL, 'game_tenball_record', 'game_tenball_kj', 0.00, NULL, NULL, 5.00, 5.00, 300000.00, 0, 70, 0, 20, NULL, 10, '1', 'Y', 0, '0000', '2359', 'N', '', '2024-03-06 22:34:06', '', '2024-03-09 20:20:07', '');
INSERT INTO `sys_game` VALUES (11, '/profile/upload/2024/03/09/xyft_20240309202028A010.jpg', '10', 'xyft', 'xyft', '幸运飞艇', '幸运飞艇', 0xE38090E5B9B8E8BF90E9A39EE88987392E39E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808DEFBC88E590ABE69CACE98791EFBC893130E8BDA6E58FB7EFBC9A392E39E5808DEFBC88E590ABE69CACE98791EFBC89E9BE992FE8998EEFBC9A312E3938E5808DEFBC88E590ABE69CACE98791EFBC89E586A0E4BA9AE5928CE5A4A72FE58F8CEFBC9A322E31E5808DEFBC88E590ABE69CACE98791EFBC89E5B08F2FE58D95EFBC9A312E37E5808DEFBC88E590ABE69CACE98791EFBC89332F342F31382F3139EFBC9AE590ABE69CAC3431E5808D352F362F31362F3137EFBC9AE590ABE69CAC3230E5808D372F382F31342F3135EFBC9AE590ABE69CAC3133E5808D392F31302F31322F3133EFBC9AE590ABE69CAC39E5808D3131EFBC9AE590ABE69CAC37E5808D317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E2062722FE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, NULL, 'game_tenball_record', 'game_tenball_kj', 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 15, 70, 300, 20, NULL, 11, '0', 'Y', 0, '0000', '2359', 'N', '', '2024-03-06 22:34:06', '', '2024-07-05 00:46:32', '');
INSERT INTO `sys_game` VALUES (12, '/profile/upload/2024/03/09/jssc_20240309202124A011.jpg', '10', 'jssc', NULL, '168极速赛车', '168极速赛车', 0xE38090E69E81E9809FE8B59BE8BDA6392E39E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4BA8FE68D9FE697A0E58F8DE6B0B4E38091E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3030E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, 'Jssc', 'game_tenball_record', 'game_tenball_kj', 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 0, 35, 0, 20, NULL, 12, '1', 'Y', 0, '0000', '2359', 'N', '', '2024-03-06 22:34:06', '', '2024-03-09 20:21:54', '');
INSERT INTO `sys_game` VALUES (13, '/profile/upload/2024/03/09/jsft_20240309202548A012.jpg', '10', 'jsft', 'jsft', '极速飞艇', '极速飞艇', 0xE38090E69E81E9809FE9A39EE88987E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3030E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, 'Jsfei', 'game_tenball_record', 'game_tenball_kj', 0.00, NULL, NULL, 5.00, 5.00, 50000.00, 0, 5, 75, 20, NULL, 13, '0', 'Y', 0, '0000', '2359', 'N', '', '2024-03-06 22:34:06', '', '2024-07-05 00:46:35', '');
INSERT INTO `sys_game` VALUES (14, '/profile/upload/2024/03/09/jssc2_20240309202640A013.jpg', '10', 'jssc2', NULL, '168极速赛车高赔率', '168极速赛车高赔率', 0xE38090E69E81E9809FE8B59BE8BDA6392E39E8B594E78E87E8AFB4E6988EE38091266E6273703B266E6273703BE38090E8B594E78E87E8AFB4E6988EE38091266E6273703BE5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D3130E8BDA6E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE586A0E4BA9AE5928C20E5A4A72FE58F8CEFBC9A322E31E5808D266E6273703B266E6273703B266E6273703B266E6273703B266E6273703B266E6273703BE5B08F2FE58D95EFBC9A312E37E5808D266E6273703B332F342F31382F3139EFBC9A3431E5808D266E6273703B352F362F31362F3137EFBC9A3230E5808D266E6273703B372F382F31342F3135EFBC9A3133E5808D266E6273703B392F31302F31322F3133EFBC9A39E5808D266E6273703B3131EFBC9AE590ABE69CAC37E5808D266E6273703B266E6273703BE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E266E6273703BE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091266E6273703B266E6273703BE680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6266E6273703BE5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6266E6273703BE58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6266E6273703BE9BE992FE8998EEFBC9A3130303030E5B081E9A1B6E38090E4BA8FE68D9FE697A0E58F8DE6B0B4E38091E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3030E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, NULL, 'game_tenball_record', 'game_tenball_kj', 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 0, 35, 0, 20, NULL, 14, '1', 'Y', 0, '0000', '2359', 'N', '', '2024-03-06 22:34:06', '', '2024-03-09 20:27:07', '');
INSERT INTO `sys_game` VALUES (15, '/profile/upload/2024/03/09/jsssc_20240309202724A014.jpg', '5', 'jsssc', 'jsssc', '极速时时彩', '极速时时彩', 0xE38090E69E81E9809FE697B6E697B6E5BDA9E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808D302D39E58FB7EFBC9A392E39E5808DE9BE992FE8998EEFBC9A312E3938E5808DE4BBA5E4B88AE68980E69C89E8B594E78E87E983BDE58C85E590ABE69CACE98791EFBC81E38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4BA8FE68D9FE697A0E58F8DE6B0B4E38091E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091E38090E6999AE4B88A30303A3030E7B3BBE7BB9FE887AAE58AA8E58F8DE585A5E8B4A6E58D95EFBC8CE4B8AAE4BABAE5B890E58F98E8AEB0E5BD95E69FA5E8AFA2E38091, 'Jsssc', 'game_fiveball_record', 'game_fiveball_kj', 10.00, NULL, NULL, 5.00, 5.00, 100000.00, 10, 35, 75, 30, NULL, 15, '0', 'N', 0, '0000', '2359', 'N', '', '2024-03-06 22:34:06', '', '2024-07-05 00:46:38', '');
INSERT INTO `sys_game` VALUES (16, '/profile/upload/2024/03/09/xyft2_20240309202820A015.jpg', '10', 'xyft2', NULL, '幸运飞艇高赔率', '幸运飞艇高赔率', 0xE38090E5B9B8E8BF90E9A39EE88987392E39E8B594E78E87E8AFB4E6988EE38091E38090E8B594E78E87E8AFB4E6988EE38091E5A4A72FE5B08F2FE58D952FE58F8CEFBC9A312E3938E5808DEFBC88E590ABE69CACE98791EFBC893130E8BDA6E58FB7EFBC9A392E39E5808DEFBC88E590ABE69CACE98791EFBC89E9BE992FE8998EEFBC9A312E3938E5808DEFBC88E590ABE69CACE98791EFBC89E586A0E4BA9AE5928CE5A4A72FE58F8CEFBC9A322E31E5808DEFBC88E590ABE69CACE98791EFBC89E5B08F2FE58D95EFBC9A312E37E5808DEFBC88E590ABE69CACE98791EFBC89332F342F31382F3139EFBC9AE590ABE69CAC3431E5808D352F362F31362F3137EFBC9AE590ABE69CAC3230E5808D372F382F31342F3135EFBC9AE590ABE69CAC3133E5808D392F31302F31322F3133EFBC9AE590ABE69CAC39E5808D3131EFBC9AE590ABE69CAC37E5808D317E3130E5908DE78C9CE5A4A7E5B08FE58D95E58F8CE5BC80E587BAE4B98BE58FB7E7A081EFBC9A312F322F332F342F35E4B8BAE5B08FEFBC8C362F372F382F392F3130E4B8BAE5A4A7E38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE78C9CE58FB7E7A081266E6273703BE6AF8FE4B880E58FB7E7A081E4B8BAE4B880E7AB9EE78C9CE7BB84EFBC8CE5BC80E5A596E7BB93E69E9CE38090E7AB9EE78C9CE58FB7E7A081E38091E5AFB9E5BA94E68980E78C9CE38090E8B59BE98193E38091E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E68385E5BDA2E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE78C9CE9BE99E8998E2062722FE7ACAC31E5908D7673E7ACAC3130E5908DEFBC8CE7ACAC32E5908D7673E7ACAC39E5908DEFBC8CE7ACAC33E5908D7673E7ACAC38E5908DEFBC8CE7ACAC34E5908D7673E7ACAC37E5908DEFBC8CE7ACAC35E5908D7673E7ACAC36E5908DEFBC8CE5898DE6AF94E5908EE5A4A7E4B8BAE9BE99EFBC8CE58F8DE4B98BE4B8BAE8998E266E6273703BE78C9CE586A0E4BA9A266E6273703BE78C9CE586A0E5869BE58F8AE4BA9AE5869BE58FB7E7A081EFBC8CE6AF8FE6ACA1E7AB9EE78C9C32E4B8AAE58FB7E7A081EFBC8CE9A1BAE5BA8FE4B88DE99990E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE5A4A7E5B08FE58D95E58F8CEFBC9AE586A0E5869BE58FB7E7A0812BE4BA9AE5869BE58FB7E7A0813DE586A0E4BA9AE5928CE580BC3DE789B9E7A0813DE695B0E5AD97337E3139EFBC8CE586A0E4BA9AE5928CE580BCE5A4A7E4BA8EE68896E7AD89E4BA8E3132E4B8BAE5A4A7EFBC8CE5B08FE4BA8EE68896E7AD89E4BA8E3131E4B8BAE5B08FE38082E5BC80E587BAE79A84E58FB7E7A081E581B6E695B0E4B8BAE58F8CEFBC8CE58FB7E7A081E5A587E695B0E4B8BAE58D95E38082266E6273703BE586A0E4BA9AE5928CE580BCEFBC88E789B9E7A081EFBC89E78C9CE695B0E5AD97EFBC9AE38090E586A0E4BA9AE5928CE580BCE38091E4B8BAE38090E789B9E7A081E38091E58FAFE883BDE587BAE78EB0E79A84E7BB93E69E9CE4B8BA337E3139EFBC8CE7AB9EE78C9CE4B8ADE5AFB9E5BA94E38090E586A0E4BA9AE5928CE580BCE38091E695B0E5AD97E79A84E8A786E4B8BAE4B8ADE5A596EFBC8CE585B6E4BD99E8A786E4B8BAE4B88DE4B8ADE5A596E38082266E6273703BE38090E99990E9A29DE8AFB4E6988EE38091E680BBE4B88BE6B3A8EFBC9A313030303030E5B081E9A1B6E5A4A7E5B08FE58D95E58F8CEFBC9A3430303030E5B081E9A1B6E58D95E58FB7E7A081EFBC9A3130303030E5B081E9A1B6E586A0E4BA9AE59088EFBC9A35303030E5B081E9A1B6E38090E4B88AE7BAA7E4BDA3E98791E58D83E58886E4B98B33E38091E38090E6B581E6B0B4E59B9EE6B0B4E58D83E58886E4B98B35E38091, 'Fei', 'game_tenball_record', 'game_tenball_kj', 0.00, NULL, NULL, 5.00, 5.00, 20000.00, 0, 110, 0, 20, NULL, 16, '1', 'Y', 0, '0000', '2359', 'N', '', '2024-03-06 22:34:06', '', '2024-03-09 20:28:48', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-03-05 21:03:11', '', NULL, '');
INSERT INTO `sys_job` VALUES (4, '10球定时获取开奖数据', 'SYSTEM', 'ryTask.getGameExpectData(\'10\')', '0/10 * * * * ?', '1', '0', '0', 'admin', '2024-03-18 18:39:03', 'admin', '2024-06-14 12:51:55', '');
INSERT INTO `sys_job` VALUES (5, '3球定时开奖数据', 'SYSTEM', 'ryTask.getGameExpectData(\'3\')', '0/10 * * * * ?', '1', '0', '0', 'admin', '2024-03-18 18:51:09', 'admin', '2024-06-14 12:51:59', '');
INSERT INTO `sys_job` VALUES (6, '5球定时开奖数据', 'SYSTEM', 'ryTask.getGameExpectData(\'5\')', '0/10 * * * * ?', '1', '0', '0', 'admin', '2024-03-18 18:39:03', 'admin', '2024-06-14 12:52:03', '');
INSERT INTO `sys_job` VALUES (7, '10球定时开奖结算', 'SYSTEM', 'ryTask.autoLotteryBalance(\'10\')', '2/10 * * * * ?', '1', '0', '0', 'admin', '2024-03-18 18:39:03', 'admin', '2024-06-14 12:52:15', '');
INSERT INTO `sys_job` VALUES (8, '3球定时开奖结算', 'SYSTEM', 'ryTask.autoLotteryBalance(\'3\')', '2/10 * * * * ?', '1', '0', '0', 'admin', '2024-03-18 18:51:09', 'admin', '2024-06-14 12:52:21', '');
INSERT INTO `sys_job` VALUES (9, '5定时开奖结算', 'SYSTEM', 'ryTask.autoLotteryBalance(\'5\')', '2/10 * * * * ?', '1', '0', '0', 'admin', '2024-03-18 18:39:03', 'admin', '2024-06-14 12:52:25', '');
INSERT INTO `sys_job` VALUES (10, '日历数据增加', 'SYSTEM', 'ryTask.insertTodayCalendar()', '0 0 0 * * ?', '1', '1', '0', 'admin', '2024-06-10 23:02:35', '', '2024-06-10 23:02:38', '');
INSERT INTO `sys_job` VALUES (11, '自动增加机器人下注数据', 'SYSTEM', 'ryTask.insertRobotBet()', '0/30 * * * * ?', '1', '1', '0', 'admin', '2024-06-10 23:02:54', 'admin', '2024-06-16 23:54:24', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1939108 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_landing_domain
-- ----------------------------
DROP TABLE IF EXISTS `sys_landing_domain`;
CREATE TABLE `sys_landing_domain`  (
  `landing_domain_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '落地域名ID',
  `landing_domain_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '落地域名',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '落地域名状态（0正常 1未激活）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`landing_domain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '落地域名表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_landing_domain
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
) ENGINE = InnoDB AUTO_INCREMENT = 889 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-06 11:12:43');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-06 20:46:58');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-07 18:39:11');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-04-08 18:24:09');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-08 18:35:03');
INSERT INTO `sys_logininfor` VALUES (141, 'kehu2', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2024-04-08 20:38:25');
INSERT INTO `sys_logininfor` VALUES (142, 'kehu2', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2024-04-08 20:41:20');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-04-15 19:46:09');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-04-15 19:48:12');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-04-16 21:03:02');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-04-17 19:42:05');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 20:15:52');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-04-18 21:59:18');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 22:31:55');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-19 19:03:56');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-22 18:27:26');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-04-22 21:10:42');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-23 20:11:10');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-04-23 20:38:38');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-23 22:16:26');
INSERT INTO `sys_logininfor` VALUES (156, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-23 22:16:53');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-04-25 21:11:06');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-04-28 20:40:02');
INSERT INTO `sys_logininfor` VALUES (159, 'kefu1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-04-28 21:34:30');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-28 21:34:34');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-29 21:48:01');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-04-29 22:11:56');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-01 14:33:55');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-06 18:38:16');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-07 18:58:05');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-07 19:12:44');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-07 21:48:50');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-08 21:01:27');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-08 21:03:15');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-09 18:41:15');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-10 22:31:22');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-10 22:31:47');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-11 15:47:14');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-11 22:02:31');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-11 22:35:59');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-13 18:29:58');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-13 18:46:14');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-13 20:36:28');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-13 22:40:33');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-13 22:45:00');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-14 19:20:14');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-16 20:44:11');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 13:42:21');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-19 19:44:28');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-20 17:51:53');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-21 19:19:07');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-22 19:19:50');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-23 19:14:10');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-24 19:19:30');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 17:00:35');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-25 17:00:43');
INSERT INTO `sys_logininfor` VALUES (192, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 17:00:48');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-25 17:07:21');
INSERT INTO `sys_logininfor` VALUES (194, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-25 17:07:51');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 17:08:12');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-25 17:08:25');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-25 17:09:25');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-25 17:09:39');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 17:09:41');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-25 17:09:45');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 17:09:58');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-25 17:10:01');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 17:10:37');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 17:13:25');
INSERT INTO `sys_logininfor` VALUES (205, 'sharkadmin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-25 17:27:03');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-25 17:29:43');
INSERT INTO `sys_logininfor` VALUES (207, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 17:29:57');
INSERT INTO `sys_logininfor` VALUES (208, 'sharkadmin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-25 17:31:26');
INSERT INTO `sys_logininfor` VALUES (209, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-25 17:31:36');
INSERT INTO `sys_logininfor` VALUES (210, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 17:31:37');
INSERT INTO `sys_logininfor` VALUES (211, 'sharkadmin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-25 17:32:14');
INSERT INTO `sys_logininfor` VALUES (212, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 17:32:22');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 17:33:18');
INSERT INTO `sys_logininfor` VALUES (214, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-25 19:57:44');
INSERT INTO `sys_logininfor` VALUES (215, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 19:57:45');
INSERT INTO `sys_logininfor` VALUES (216, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-25 19:57:51');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 19:57:57');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-25 20:01:43');
INSERT INTO `sys_logininfor` VALUES (219, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 20:01:47');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 20:01:51');
INSERT INTO `sys_logininfor` VALUES (221, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-26 19:22:35');
INSERT INTO `sys_logininfor` VALUES (222, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-26 19:22:49');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-26 19:22:53');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-26 20:10:17');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-26 20:13:13');
INSERT INTO `sys_logininfor` VALUES (226, 'kehu2', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-26 20:15:44');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-26 20:34:09');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-26 20:34:12');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-26 20:44:29');
INSERT INTO `sys_logininfor` VALUES (230, 'sharkadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-26 20:44:35');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '182.239.93.139', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-26 21:23:58');
INSERT INTO `sys_logininfor` VALUES (232, 'sharkadmin', '182.239.93.139', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-26 21:24:02');
INSERT INTO `sys_logininfor` VALUES (233, 'sharkadmin', '120.36.248.222', '福建省 厦门市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-27 09:32:58');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-05-27 09:34:14');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-27 09:34:37');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-27 11:38:16');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-27 11:43:24');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '182.239.93.139', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-27 20:09:23');
INSERT INTO `sys_logininfor` VALUES (239, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 09:28:07');
INSERT INTO `sys_logininfor` VALUES (240, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 10:07:45');
INSERT INTO `sys_logininfor` VALUES (241, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 10:11:12');
INSERT INTO `sys_logininfor` VALUES (242, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-05-28 10:13:29');
INSERT INTO `sys_logininfor` VALUES (243, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 10:13:41');
INSERT INTO `sys_logininfor` VALUES (244, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 10:14:43');
INSERT INTO `sys_logininfor` VALUES (245, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-05-28 10:15:15');
INSERT INTO `sys_logininfor` VALUES (246, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 10:15:25');
INSERT INTO `sys_logininfor` VALUES (247, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 10:16:00');
INSERT INTO `sys_logininfor` VALUES (248, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-05-28 10:17:34');
INSERT INTO `sys_logininfor` VALUES (249, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 10:18:20');
INSERT INTO `sys_logininfor` VALUES (250, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 10:21:55');
INSERT INTO `sys_logininfor` VALUES (251, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-05-28 10:25:31');
INSERT INTO `sys_logininfor` VALUES (252, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 10:27:06');
INSERT INTO `sys_logininfor` VALUES (253, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 10:28:35');
INSERT INTO `sys_logininfor` VALUES (254, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-05-28 10:41:33');
INSERT INTO `sys_logininfor` VALUES (255, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 10:43:57');
INSERT INTO `sys_logininfor` VALUES (256, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 10:44:12');
INSERT INTO `sys_logininfor` VALUES (257, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 11:01:23');
INSERT INTO `sys_logininfor` VALUES (258, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 11:02:55');
INSERT INTO `sys_logininfor` VALUES (259, 'kehu2', '36.249.156.218', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 11:09:41');
INSERT INTO `sys_logininfor` VALUES (260, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 11:36:26');
INSERT INTO `sys_logininfor` VALUES (261, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 11:54:57');
INSERT INTO `sys_logininfor` VALUES (262, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 11:56:28');
INSERT INTO `sys_logininfor` VALUES (263, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-05-28 12:04:58');
INSERT INTO `sys_logininfor` VALUES (264, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 12:06:36');
INSERT INTO `sys_logininfor` VALUES (265, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 12:08:04');
INSERT INTO `sys_logininfor` VALUES (266, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 12:19:52');
INSERT INTO `sys_logininfor` VALUES (267, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 12:23:50');
INSERT INTO `sys_logininfor` VALUES (268, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 12:27:14');
INSERT INTO `sys_logininfor` VALUES (269, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 13:14:57');
INSERT INTO `sys_logininfor` VALUES (270, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 13:26:34');
INSERT INTO `sys_logininfor` VALUES (271, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 13:29:40');
INSERT INTO `sys_logininfor` VALUES (272, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 13:42:52');
INSERT INTO `sys_logininfor` VALUES (273, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 13:45:46');
INSERT INTO `sys_logininfor` VALUES (274, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 13:49:29');
INSERT INTO `sys_logininfor` VALUES (275, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 13:52:42');
INSERT INTO `sys_logininfor` VALUES (276, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 13:54:52');
INSERT INTO `sys_logininfor` VALUES (277, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '1', '用户不存在/密码错误', '2024-05-28 13:57:47');
INSERT INTO `sys_logininfor` VALUES (278, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 13:57:53');
INSERT INTO `sys_logininfor` VALUES (279, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 13:58:42');
INSERT INTO `sys_logininfor` VALUES (280, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 14:11:39');
INSERT INTO `sys_logininfor` VALUES (281, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 14:15:24');
INSERT INTO `sys_logininfor` VALUES (282, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 14:17:03');
INSERT INTO `sys_logininfor` VALUES (283, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 14:33:16');
INSERT INTO `sys_logininfor` VALUES (284, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 14:37:22');
INSERT INTO `sys_logininfor` VALUES (285, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 14:44:36');
INSERT INTO `sys_logininfor` VALUES (286, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 14:46:11');
INSERT INTO `sys_logininfor` VALUES (287, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 14:51:21');
INSERT INTO `sys_logininfor` VALUES (288, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 14:51:48');
INSERT INTO `sys_logininfor` VALUES (289, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 14:56:03');
INSERT INTO `sys_logininfor` VALUES (290, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 14:56:34');
INSERT INTO `sys_logininfor` VALUES (291, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 15:00:34');
INSERT INTO `sys_logininfor` VALUES (292, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 15:00:51');
INSERT INTO `sys_logininfor` VALUES (293, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 15:11:31');
INSERT INTO `sys_logininfor` VALUES (294, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 15:12:17');
INSERT INTO `sys_logininfor` VALUES (295, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 15:17:01');
INSERT INTO `sys_logininfor` VALUES (296, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 15:17:15');
INSERT INTO `sys_logininfor` VALUES (297, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 15:27:42');
INSERT INTO `sys_logininfor` VALUES (298, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 15:30:26');
INSERT INTO `sys_logininfor` VALUES (299, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 15:34:03');
INSERT INTO `sys_logininfor` VALUES (300, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 15:34:59');
INSERT INTO `sys_logininfor` VALUES (301, 'kehu2', '120.36.248.222', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-28 16:03:02');
INSERT INTO `sys_logininfor` VALUES (302, 'sharkadmin', '182.239.115.75', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 18:20:41');
INSERT INTO `sys_logininfor` VALUES (303, 'sharkadmin', '171.10.129.175', '河南省 郑州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-28 19:22:09');
INSERT INTO `sys_logininfor` VALUES (304, 'sharkadmin', '140.243.222.135', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-28 19:34:16');
INSERT INTO `sys_logininfor` VALUES (305, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 19:35:05');
INSERT INTO `sys_logininfor` VALUES (306, 'sharkadmin', '182.239.115.75', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 19:38:08');
INSERT INTO `sys_logininfor` VALUES (307, 'sharkadmin', '182.239.115.169', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 19:39:23');
INSERT INTO `sys_logininfor` VALUES (308, 'kehu2', '182.239.93.202', '香港 ', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 19:50:35');
INSERT INTO `sys_logininfor` VALUES (309, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 19:51:58');
INSERT INTO `sys_logininfor` VALUES (310, 'kehu2', '182.239.93.202', '香港 ', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 19:53:41');
INSERT INTO `sys_logininfor` VALUES (311, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-28 19:54:24');
INSERT INTO `sys_logininfor` VALUES (312, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-29 13:28:35');
INSERT INTO `sys_logininfor` VALUES (313, 'kehu2', '120.36.255.138', '福建省 厦门市', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-29 14:25:32');
INSERT INTO `sys_logininfor` VALUES (314, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-29 14:26:19');
INSERT INTO `sys_logininfor` VALUES (315, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-29 15:39:35');
INSERT INTO `sys_logininfor` VALUES (316, 'sharkadmin', '182.239.115.75', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-29 15:49:40');
INSERT INTO `sys_logininfor` VALUES (317, 'sharkadmin', '182.239.114.173', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-29 16:23:15');
INSERT INTO `sys_logininfor` VALUES (318, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-05-29 16:34:44');
INSERT INTO `sys_logininfor` VALUES (319, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-29 16:43:28');
INSERT INTO `sys_logininfor` VALUES (320, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-29 16:45:02');
INSERT INTO `sys_logininfor` VALUES (321, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-29 16:49:51');
INSERT INTO `sys_logininfor` VALUES (322, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-29 16:51:59');
INSERT INTO `sys_logininfor` VALUES (323, 'kehu2', '182.239.114.173', '香港 ', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-29 17:13:49');
INSERT INTO `sys_logininfor` VALUES (324, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-29 17:19:48');
INSERT INTO `sys_logininfor` VALUES (325, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-29 18:02:15');
INSERT INTO `sys_logininfor` VALUES (326, 'kehu2', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-29 18:07:28');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-29 18:07:39');
INSERT INTO `sys_logininfor` VALUES (328, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-29 18:09:51');
INSERT INTO `sys_logininfor` VALUES (329, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-29 18:13:58');
INSERT INTO `sys_logininfor` VALUES (330, 'kehu2', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-29 18:14:20');
INSERT INTO `sys_logininfor` VALUES (331, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-29 18:16:58');
INSERT INTO `sys_logininfor` VALUES (332, 'kehu2', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-05-29 18:23:08');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-29 19:53:43');
INSERT INTO `sys_logininfor` VALUES (334, 'kehu2', '182.239.93.188', '香港 ', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-29 21:42:43');
INSERT INTO `sys_logininfor` VALUES (335, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-30 09:47:54');
INSERT INTO `sys_logininfor` VALUES (336, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-30 16:17:39');
INSERT INTO `sys_logininfor` VALUES (337, 'kehu2', '182.239.115.29', '香港 ', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-05-30 17:57:47');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '182.239.93.139', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-30 21:03:04');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '182.239.93.139', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-31 20:44:15');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '182.239.93.139', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-31 20:52:17');
INSERT INTO `sys_logininfor` VALUES (341, 'sharkadmin', '182.239.93.139', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-31 20:52:19');
INSERT INTO `sys_logininfor` VALUES (342, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-01 15:48:42');
INSERT INTO `sys_logininfor` VALUES (343, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-01 15:49:24');
INSERT INTO `sys_logininfor` VALUES (344, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-06-01 15:53:17');
INSERT INTO `sys_logininfor` VALUES (345, 'kehu2 ', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-01 16:04:21');
INSERT INTO `sys_logininfor` VALUES (346, 'kehu2', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-01 16:06:52');
INSERT INTO `sys_logininfor` VALUES (347, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-01 18:38:21');
INSERT INTO `sys_logininfor` VALUES (348, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-01 18:38:26');
INSERT INTO `sys_logininfor` VALUES (349, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-01 19:27:25');
INSERT INTO `sys_logininfor` VALUES (350, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-01 21:01:45');
INSERT INTO `sys_logininfor` VALUES (351, 'kehu2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-01 21:08:56');
INSERT INTO `sys_logininfor` VALUES (352, 'kehu2 ', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-01 21:09:27');
INSERT INTO `sys_logininfor` VALUES (353, 'kefu2', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-02 17:54:31');
INSERT INTO `sys_logininfor` VALUES (354, 'kehu2', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-02 18:09:34');
INSERT INTO `sys_logininfor` VALUES (355, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-02 20:41:02');
INSERT INTO `sys_logininfor` VALUES (356, 'kehu2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-02 20:49:52');
INSERT INTO `sys_logininfor` VALUES (357, 'kehu2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-02 21:15:33');
INSERT INTO `sys_logininfor` VALUES (358, 'kehu2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-02 21:15:37');
INSERT INTO `sys_logininfor` VALUES (359, 'kehu2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-02 21:22:54');
INSERT INTO `sys_logininfor` VALUES (360, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-02 21:38:11');
INSERT INTO `sys_logininfor` VALUES (361, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-02 21:55:16');
INSERT INTO `sys_logininfor` VALUES (362, 'kehu2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-02 22:46:14');
INSERT INTO `sys_logininfor` VALUES (363, 'kehu2 ', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-03 09:50:02');
INSERT INTO `sys_logininfor` VALUES (364, 'kehu2', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-03 09:52:22');
INSERT INTO `sys_logininfor` VALUES (365, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-03 09:52:58');
INSERT INTO `sys_logininfor` VALUES (366, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-03 09:57:16');
INSERT INTO `sys_logininfor` VALUES (367, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-03 09:58:13');
INSERT INTO `sys_logininfor` VALUES (368, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-03 10:07:25');
INSERT INTO `sys_logininfor` VALUES (369, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-03 10:08:45');
INSERT INTO `sys_logininfor` VALUES (370, 'kehu2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-03 16:26:02');
INSERT INTO `sys_logininfor` VALUES (371, 'kehu2', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-06-03 16:37:43');
INSERT INTO `sys_logininfor` VALUES (372, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-03 20:02:52');
INSERT INTO `sys_logininfor` VALUES (373, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-03 20:21:47');
INSERT INTO `sys_logininfor` VALUES (374, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-03 20:41:42');
INSERT INTO `sys_logininfor` VALUES (375, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-03 20:43:46');
INSERT INTO `sys_logininfor` VALUES (376, 'sharkadmin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-04 13:09:32');
INSERT INTO `sys_logininfor` VALUES (377, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-04 16:01:39');
INSERT INTO `sys_logininfor` VALUES (378, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-04 17:08:24');
INSERT INTO `sys_logininfor` VALUES (379, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-04 17:22:05');
INSERT INTO `sys_logininfor` VALUES (380, 'admin', '182.239.93.139', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-04 19:06:30');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '182.239.93.139', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-04 19:13:41');
INSERT INTO `sys_logininfor` VALUES (382, 'sharkadmin', '182.239.93.139', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-04 19:13:57');
INSERT INTO `sys_logininfor` VALUES (383, 'sharkadmin', '182.239.93.139', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-04 19:14:08');
INSERT INTO `sys_logininfor` VALUES (384, 'sharkadmin', '182.239.93.139', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-04 19:14:10');
INSERT INTO `sys_logininfor` VALUES (385, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-04 20:58:42');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '182.239.93.139', '香港 ', 'Unknown', 'Unknown', '0', '登录成功', '2024-06-04 21:06:58');
INSERT INTO `sys_logininfor` VALUES (387, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-04 21:16:02');
INSERT INTO `sys_logininfor` VALUES (388, 'kehu2', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-04 22:22:23');
INSERT INTO `sys_logininfor` VALUES (389, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-04 23:00:17');
INSERT INTO `sys_logininfor` VALUES (390, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 03:37:39');
INSERT INTO `sys_logininfor` VALUES (391, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 04:44:49');
INSERT INTO `sys_logininfor` VALUES (392, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 05:09:39');
INSERT INTO `sys_logininfor` VALUES (393, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 05:14:50');
INSERT INTO `sys_logininfor` VALUES (394, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 05:52:19');
INSERT INTO `sys_logininfor` VALUES (395, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 05:52:51');
INSERT INTO `sys_logininfor` VALUES (396, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 05:53:15');
INSERT INTO `sys_logininfor` VALUES (397, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 05:54:27');
INSERT INTO `sys_logininfor` VALUES (398, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 06:03:21');
INSERT INTO `sys_logininfor` VALUES (399, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 06:04:52');
INSERT INTO `sys_logininfor` VALUES (400, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 06:08:28');
INSERT INTO `sys_logininfor` VALUES (401, 'k2hu2', '182.239.115.222', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-05 11:46:29');
INSERT INTO `sys_logininfor` VALUES (402, 'kehu2', '182.239.115.222', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 11:46:42');
INSERT INTO `sys_logininfor` VALUES (403, 'sharkadmin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 14:32:11');
INSERT INTO `sys_logininfor` VALUES (404, 'sharkadmin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 16:21:30');
INSERT INTO `sys_logininfor` VALUES (405, '微信用户_20240605172349128', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-06-05 17:25:21');
INSERT INTO `sys_logininfor` VALUES (406, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 17:25:31');
INSERT INTO `sys_logininfor` VALUES (407, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 17:27:54');
INSERT INTO `sys_logininfor` VALUES (408, 'sharkadmin', '182.239.93.139', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-05 18:01:56');
INSERT INTO `sys_logininfor` VALUES (409, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 18:12:00');
INSERT INTO `sys_logininfor` VALUES (410, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 18:18:26');
INSERT INTO `sys_logininfor` VALUES (411, '123qwe', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '注册成功', '2024-06-05 18:19:22');
INSERT INTO `sys_logininfor` VALUES (412, '123qwe', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 18:19:55');
INSERT INTO `sys_logininfor` VALUES (413, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 18:20:05');
INSERT INTO `sys_logininfor` VALUES (414, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-05 18:30:32');
INSERT INTO `sys_logininfor` VALUES (415, 'sharkadmin', '182.239.93.139', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-05 18:31:17');
INSERT INTO `sys_logininfor` VALUES (416, 'sharkadmin', '182.239.93.139', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-05 18:31:33');
INSERT INTO `sys_logininfor` VALUES (417, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 18:49:33');
INSERT INTO `sys_logininfor` VALUES (418, 'sharkadmin', '165.154.65.8', ' ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-05 21:56:05');
INSERT INTO `sys_logininfor` VALUES (419, 'sharkadmin', '182.239.92.42', '香港 ', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-06 02:01:18');
INSERT INTO `sys_logininfor` VALUES (420, 'sharkadmin', '182.239.92.42', '香港 ', 'Chrome 11', 'Windows 10', '0', '退出成功', '2024-06-06 02:01:51');
INSERT INTO `sys_logininfor` VALUES (421, 'sharkadmin', '182.239.92.42', '香港 ', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-06 02:02:26');
INSERT INTO `sys_logininfor` VALUES (422, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-06 02:03:38');
INSERT INTO `sys_logininfor` VALUES (423, 'sharkadmin', '182.239.92.42', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 02:33:58');
INSERT INTO `sys_logininfor` VALUES (424, '123qwer', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '注册成功', '2024-06-06 17:14:56');
INSERT INTO `sys_logininfor` VALUES (425, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-06 17:17:17');
INSERT INTO `sys_logininfor` VALUES (426, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-06 17:25:53');
INSERT INTO `sys_logininfor` VALUES (427, 'kefu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-06 20:21:11');
INSERT INTO `sys_logininfor` VALUES (428, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-06 20:21:19');
INSERT INTO `sys_logininfor` VALUES (429, 'sharkadmin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-07 08:33:23');
INSERT INTO `sys_logininfor` VALUES (430, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-07 22:08:01');
INSERT INTO `sys_logininfor` VALUES (431, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-07 22:09:55');
INSERT INTO `sys_logininfor` VALUES (432, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-07 22:53:31');
INSERT INTO `sys_logininfor` VALUES (433, 'sharkadmin', '182.239.115.1', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-07 23:16:34');
INSERT INTO `sys_logininfor` VALUES (434, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-07 23:17:09');
INSERT INTO `sys_logininfor` VALUES (435, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-07 23:21:57');
INSERT INTO `sys_logininfor` VALUES (436, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-07 23:41:42');
INSERT INTO `sys_logininfor` VALUES (437, 'kefu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-07 23:49:27');
INSERT INTO `sys_logininfor` VALUES (438, 'kefu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-07 23:55:20');
INSERT INTO `sys_logininfor` VALUES (439, 'kefu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-07 23:55:24');
INSERT INTO `sys_logininfor` VALUES (440, 'kefu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-07 23:55:34');
INSERT INTO `sys_logininfor` VALUES (441, 'sharkadmin', '182.239.93.55', '香港 ', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-06-08 21:31:27');
INSERT INTO `sys_logininfor` VALUES (442, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-08 21:37:40');
INSERT INTO `sys_logininfor` VALUES (443, 'sharkadmin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-08 21:52:52');
INSERT INTO `sys_logininfor` VALUES (444, 'sharkadmin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-08 21:53:59');
INSERT INTO `sys_logininfor` VALUES (445, 'admin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-08 21:54:41');
INSERT INTO `sys_logininfor` VALUES (446, 'sharkadmin', '182.239.93.55', '香港 ', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-06-08 21:54:52');
INSERT INTO `sys_logininfor` VALUES (447, 'admin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-08 22:34:33');
INSERT INTO `sys_logininfor` VALUES (448, 'sharkadmin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-08 22:34:38');
INSERT INTO `sys_logininfor` VALUES (449, 'sharkadmin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-08 22:37:28');
INSERT INTO `sys_logininfor` VALUES (450, 'admin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-08 22:37:30');
INSERT INTO `sys_logininfor` VALUES (451, 'admin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-08 22:49:17');
INSERT INTO `sys_logininfor` VALUES (452, 'sharkadmin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-08 22:49:19');
INSERT INTO `sys_logininfor` VALUES (453, 'sharkadmin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-08 22:51:06');
INSERT INTO `sys_logininfor` VALUES (454, 'admin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-08 22:51:15');
INSERT INTO `sys_logininfor` VALUES (455, 'admin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-09 11:34:39');
INSERT INTO `sys_logininfor` VALUES (456, 'admin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-09 17:45:59');
INSERT INTO `sys_logininfor` VALUES (457, 'admin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-09 17:49:30');
INSERT INTO `sys_logininfor` VALUES (458, 'sharkadmin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-09 17:49:33');
INSERT INTO `sys_logininfor` VALUES (459, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 19:12:56');
INSERT INTO `sys_logininfor` VALUES (460, 'sharkadmin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-09 19:34:35');
INSERT INTO `sys_logininfor` VALUES (461, 'admin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-09 19:34:38');
INSERT INTO `sys_logininfor` VALUES (462, 'admin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-09 19:51:23');
INSERT INTO `sys_logininfor` VALUES (463, 'sharkadmin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-09 19:51:25');
INSERT INTO `sys_logininfor` VALUES (464, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 20:21:09');
INSERT INTO `sys_logininfor` VALUES (465, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 20:22:47');
INSERT INTO `sys_logininfor` VALUES (466, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 20:25:06');
INSERT INTO `sys_logininfor` VALUES (467, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 20:26:23');
INSERT INTO `sys_logininfor` VALUES (468, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 20:28:11');
INSERT INTO `sys_logininfor` VALUES (469, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 20:30:50');
INSERT INTO `sys_logininfor` VALUES (470, 'kehu2', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-09 20:33:37');
INSERT INTO `sys_logininfor` VALUES (471, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 20:34:48');
INSERT INTO `sys_logininfor` VALUES (472, 'kehu2', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:03:39');
INSERT INTO `sys_logininfor` VALUES (473, 'sharkadmin', '182.239.115.1', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:10:19');
INSERT INTO `sys_logininfor` VALUES (474, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:11:11');
INSERT INTO `sys_logininfor` VALUES (475, 'kefu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-09 21:14:49');
INSERT INTO `sys_logininfor` VALUES (476, 'kehu2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-09 21:15:29');
INSERT INTO `sys_logininfor` VALUES (477, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:15:55');
INSERT INTO `sys_logininfor` VALUES (478, 'kehu2', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:23:23');
INSERT INTO `sys_logininfor` VALUES (479, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:28:21');
INSERT INTO `sys_logininfor` VALUES (480, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:28:59');
INSERT INTO `sys_logininfor` VALUES (481, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:29:41');
INSERT INTO `sys_logininfor` VALUES (482, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:34:10');
INSERT INTO `sys_logininfor` VALUES (483, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:37:54');
INSERT INTO `sys_logininfor` VALUES (484, 'sharkadmin', '182.239.92.179', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:41:54');
INSERT INTO `sys_logininfor` VALUES (485, 'kefu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-09 21:42:31');
INSERT INTO `sys_logininfor` VALUES (486, 'sharkadmin', '182.239.92.123', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:43:04');
INSERT INTO `sys_logininfor` VALUES (487, 'sharkadmin', '182.239.92.179', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:44:10');
INSERT INTO `sys_logininfor` VALUES (488, 'sharkadmin', '182.239.92.123', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:44:16');
INSERT INTO `sys_logininfor` VALUES (489, 'sharkadmin', '182.239.92.179', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:46:38');
INSERT INTO `sys_logininfor` VALUES (490, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:47:30');
INSERT INTO `sys_logininfor` VALUES (491, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:49:31');
INSERT INTO `sys_logininfor` VALUES (492, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:56:33');
INSERT INTO `sys_logininfor` VALUES (493, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:57:37');
INSERT INTO `sys_logininfor` VALUES (494, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-09 21:58:04');
INSERT INTO `sys_logininfor` VALUES (495, 'sharkadmin', '106.122.87.11', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-09 22:53:30');
INSERT INTO `sys_logininfor` VALUES (496, 'kehu2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-09 22:56:14');
INSERT INTO `sys_logininfor` VALUES (497, 'sharkadmin', '106.34.192.153', '河南省 郑州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-10 00:00:04');
INSERT INTO `sys_logininfor` VALUES (498, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-10 01:03:34');
INSERT INTO `sys_logininfor` VALUES (499, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-10 03:56:32');
INSERT INTO `sys_logininfor` VALUES (500, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-10 15:20:37');
INSERT INTO `sys_logininfor` VALUES (501, 'sharkadmin', '182.239.115.1', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-10 18:08:01');
INSERT INTO `sys_logininfor` VALUES (502, 'admin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-10 20:05:41');
INSERT INTO `sys_logininfor` VALUES (503, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-10 21:07:54');
INSERT INTO `sys_logininfor` VALUES (504, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-10 21:09:49');
INSERT INTO `sys_logininfor` VALUES (505, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-10 21:12:46');
INSERT INTO `sys_logininfor` VALUES (506, 'admin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-10 23:03:28');
INSERT INTO `sys_logininfor` VALUES (507, 'sharkadmin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-10 23:03:33');
INSERT INTO `sys_logininfor` VALUES (508, 'sharkadmin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-10 23:03:50');
INSERT INTO `sys_logininfor` VALUES (509, 'admin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-10 23:03:52');
INSERT INTO `sys_logininfor` VALUES (510, 'admin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-10 23:21:34');
INSERT INTO `sys_logininfor` VALUES (511, 'sharkadmin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-10 23:21:37');
INSERT INTO `sys_logininfor` VALUES (512, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-11 02:15:24');
INSERT INTO `sys_logininfor` VALUES (513, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-11 02:17:04');
INSERT INTO `sys_logininfor` VALUES (514, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-11 10:21:52');
INSERT INTO `sys_logininfor` VALUES (515, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-11 17:11:14');
INSERT INTO `sys_logininfor` VALUES (516, 'admin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-11 18:20:02');
INSERT INTO `sys_logininfor` VALUES (517, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-12 04:01:07');
INSERT INTO `sys_logininfor` VALUES (518, 'sharkadmin', '182.239.93.159', '香港 ', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-12 05:39:40');
INSERT INTO `sys_logininfor` VALUES (519, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-12 17:41:49');
INSERT INTO `sys_logininfor` VALUES (520, 'sharkadmin', '182.239.92.162', '香港 ', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-12 18:45:41');
INSERT INTO `sys_logininfor` VALUES (521, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-12 18:48:19');
INSERT INTO `sys_logininfor` VALUES (522, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-06-12 18:54:39');
INSERT INTO `sys_logininfor` VALUES (523, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-12 18:54:48');
INSERT INTO `sys_logininfor` VALUES (524, 'kehu2', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-12 19:03:41');
INSERT INTO `sys_logininfor` VALUES (525, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-12 19:06:24');
INSERT INTO `sys_logininfor` VALUES (526, 'admin', '182.239.115.210', '香港 ', 'Unknown', 'Unknown', '0', '登录成功', '2024-06-12 21:45:39');
INSERT INTO `sys_logininfor` VALUES (527, 'sharkadmin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-12 21:50:42');
INSERT INTO `sys_logininfor` VALUES (528, 'sharkadmin', '182.239.92.162', '香港 ', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-12 22:07:59');
INSERT INTO `sys_logininfor` VALUES (529, 'admin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-12 22:08:31');
INSERT INTO `sys_logininfor` VALUES (530, 'admin', '182.239.115.210', '香港 ', 'Unknown', 'Unknown', '0', '登录成功', '2024-06-12 22:12:41');
INSERT INTO `sys_logininfor` VALUES (531, '123qwer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-12 22:20:31');
INSERT INTO `sys_logininfor` VALUES (532, 'admin', '182.239.115.210', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-12 22:45:26');
INSERT INTO `sys_logininfor` VALUES (533, 'kehu2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-13 00:28:48');
INSERT INTO `sys_logininfor` VALUES (534, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-13 01:29:52');
INSERT INTO `sys_logininfor` VALUES (535, 'sharkadmin', '182.239.115.1', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-13 08:24:43');
INSERT INTO `sys_logininfor` VALUES (536, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-13 08:25:29');
INSERT INTO `sys_logininfor` VALUES (537, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-13 08:37:59');
INSERT INTO `sys_logininfor` VALUES (538, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-13 16:03:03');
INSERT INTO `sys_logininfor` VALUES (539, 'kefu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-13 17:42:04');
INSERT INTO `sys_logininfor` VALUES (540, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-13 17:42:15');
INSERT INTO `sys_logininfor` VALUES (541, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-13 20:41:25');
INSERT INTO `sys_logininfor` VALUES (542, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-13 20:41:55');
INSERT INTO `sys_logininfor` VALUES (543, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-13 21:04:26');
INSERT INTO `sys_logininfor` VALUES (544, 'kehu2', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-13 22:49:09');
INSERT INTO `sys_logininfor` VALUES (545, 'kefu2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-06-14 10:35:05');
INSERT INTO `sys_logininfor` VALUES (546, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-14 10:35:22');
INSERT INTO `sys_logininfor` VALUES (547, 'sharkadmin', '182.239.93.62', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-14 10:35:53');
INSERT INTO `sys_logininfor` VALUES (548, 'sharkadmin', '182.239.93.62', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-14 12:51:36');
INSERT INTO `sys_logininfor` VALUES (549, 'admin', '182.239.93.62', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-14 12:51:39');
INSERT INTO `sys_logininfor` VALUES (550, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-14 20:25:27');
INSERT INTO `sys_logininfor` VALUES (551, '53756aaa', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '注册成功', '2024-06-14 23:41:33');
INSERT INTO `sys_logininfor` VALUES (552, '53756aaa', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-14 23:41:43');
INSERT INTO `sys_logininfor` VALUES (553, 'sharkadmin', '182.239.93.62', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-15 12:59:32');
INSERT INTO `sys_logininfor` VALUES (554, 'kehu2', '182.239.93.62', '香港 ', 'Unknown', 'Unknown', '0', '登录成功', '2024-06-15 12:59:54');
INSERT INTO `sys_logininfor` VALUES (555, 'admin', '182.239.93.62', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-16 14:38:27');
INSERT INTO `sys_logininfor` VALUES (556, 'admin', '182.239.93.62', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-16 14:38:37');
INSERT INTO `sys_logininfor` VALUES (557, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-16 19:17:25');
INSERT INTO `sys_logininfor` VALUES (558, 'kehu2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-16 19:59:00');
INSERT INTO `sys_logininfor` VALUES (559, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-16 19:59:23');
INSERT INTO `sys_logininfor` VALUES (560, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-16 20:59:37');
INSERT INTO `sys_logininfor` VALUES (561, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-16 21:01:33');
INSERT INTO `sys_logininfor` VALUES (562, '53756aaa', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-16 21:05:06');
INSERT INTO `sys_logininfor` VALUES (563, '53756111', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-16 21:05:15');
INSERT INTO `sys_logininfor` VALUES (564, '53756999', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '注册成功', '2024-06-16 21:05:31');
INSERT INTO `sys_logininfor` VALUES (565, '53756999', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-16 21:05:39');
INSERT INTO `sys_logininfor` VALUES (566, '53756999', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-16 21:08:16');
INSERT INTO `sys_logininfor` VALUES (567, '53756999', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-16 21:08:22');
INSERT INTO `sys_logininfor` VALUES (568, 'sharkadmin', '8.210.63.236', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-16 21:11:05');
INSERT INTO `sys_logininfor` VALUES (569, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-16 21:18:28');
INSERT INTO `sys_logininfor` VALUES (570, 'sharkadmin', '182.239.115.100', '香港 ', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-16 21:23:35');
INSERT INTO `sys_logininfor` VALUES (571, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-16 21:24:20');
INSERT INTO `sys_logininfor` VALUES (572, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-16 21:35:09');
INSERT INTO `sys_logininfor` VALUES (573, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-16 23:01:31');
INSERT INTO `sys_logininfor` VALUES (574, 'admin', '182.239.93.62', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-16 23:05:00');
INSERT INTO `sys_logininfor` VALUES (575, 'admin', '182.239.93.62', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-16 23:06:57');
INSERT INTO `sys_logininfor` VALUES (576, '123qwer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-16 23:09:48');
INSERT INTO `sys_logininfor` VALUES (577, '123qwe', '182.239.93.62', '香港 ', 'Unknown', 'Unknown', '0', '登录成功', '2024-06-16 23:12:22');
INSERT INTO `sys_logininfor` VALUES (578, '53756999', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-16 23:46:01');
INSERT INTO `sys_logininfor` VALUES (579, '53756aaa', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-16 23:46:07');
INSERT INTO `sys_logininfor` VALUES (580, '53756999', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-16 23:46:16');
INSERT INTO `sys_logininfor` VALUES (581, '53756111', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-17 02:14:51');
INSERT INTO `sys_logininfor` VALUES (582, '53756111', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-17 02:14:59');
INSERT INTO `sys_logininfor` VALUES (583, '53756999', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-17 02:15:05');
INSERT INTO `sys_logininfor` VALUES (584, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-17 03:54:36');
INSERT INTO `sys_logininfor` VALUES (585, 'admin', '111.201.28.62', '北京市 北京市', 'Firefox 11', 'Windows 10', '0', '登录成功', '2024-06-17 13:08:03');
INSERT INTO `sys_logininfor` VALUES (586, 'admin', '117.24.123.237', '福建省 泉州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-17 13:36:15');
INSERT INTO `sys_logininfor` VALUES (587, '啊啊啊啊', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-06-17 13:38:20');
INSERT INTO `sys_logininfor` VALUES (588, '啊啊啊', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-06-17 13:38:27');
INSERT INTO `sys_logininfor` VALUES (589, '123qwe', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-17 13:41:03');
INSERT INTO `sys_logininfor` VALUES (590, '57356888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-17 20:25:14');
INSERT INTO `sys_logininfor` VALUES (591, '57356111', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-17 20:25:20');
INSERT INTO `sys_logininfor` VALUES (592, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-17 21:50:05');
INSERT INTO `sys_logininfor` VALUES (593, '123qwer', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-06-17 22:02:55');
INSERT INTO `sys_logininfor` VALUES (594, 'kefu2', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-17 22:18:01');
INSERT INTO `sys_logininfor` VALUES (595, 'kehu2', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-17 22:18:10');
INSERT INTO `sys_logininfor` VALUES (596, 'kehu2', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-17 22:26:19');
INSERT INTO `sys_logininfor` VALUES (597, 'kehu2', '182.239.93.55', '香港 ', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-06-17 22:35:55');
INSERT INTO `sys_logininfor` VALUES (598, 'kehu2', '182.239.93.55', '香港 ', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-06-17 22:40:03');
INSERT INTO `sys_logininfor` VALUES (599, 'sharkadmin', '182.239.93.55', '香港 ', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-06-17 22:40:21');
INSERT INTO `sys_logininfor` VALUES (600, 'admin', '182.239.93.62', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-17 23:12:50');
INSERT INTO `sys_logininfor` VALUES (601, 'admin', '194.99.79.131', ' ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-18 03:14:12');
INSERT INTO `sys_logininfor` VALUES (602, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '1', '用户不存在/密码错误', '2024-06-19 09:21:01');
INSERT INTO `sys_logininfor` VALUES (603, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-06-19 09:21:06');
INSERT INTO `sys_logininfor` VALUES (604, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-06-19 09:22:05');
INSERT INTO `sys_logininfor` VALUES (605, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-19 15:03:46');
INSERT INTO `sys_logininfor` VALUES (606, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '注册成功', '2024-06-19 15:04:07');
INSERT INTO `sys_logininfor` VALUES (607, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 15:04:22');
INSERT INTO `sys_logininfor` VALUES (608, '53756777', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-19 15:46:28');
INSERT INTO `sys_logininfor` VALUES (609, '53756111', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-19 15:46:34');
INSERT INTO `sys_logininfor` VALUES (610, '53756bbb', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-19 15:46:44');
INSERT INTO `sys_logininfor` VALUES (611, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 15:47:06');
INSERT INTO `sys_logininfor` VALUES (612, 'kehu2', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 15:55:36');
INSERT INTO `sys_logininfor` VALUES (613, 'kefu2', '171.10.129.19', '河南省 郑州市', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-06-19 16:00:00');
INSERT INTO `sys_logininfor` VALUES (614, 'sharkadmin', '171.10.129.19', '河南省 郑州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-19 16:00:32');
INSERT INTO `sys_logininfor` VALUES (615, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 16:01:25');
INSERT INTO `sys_logininfor` VALUES (616, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-19 16:03:39');
INSERT INTO `sys_logininfor` VALUES (617, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 16:03:45');
INSERT INTO `sys_logininfor` VALUES (618, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 16:06:19');
INSERT INTO `sys_logininfor` VALUES (619, 'sharkadmin', '182.239.121.133', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 16:13:09');
INSERT INTO `sys_logininfor` VALUES (620, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 16:14:38');
INSERT INTO `sys_logininfor` VALUES (621, 'sharkadmin', '180.141.113.47', '广西 北海市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-19 16:16:23');
INSERT INTO `sys_logininfor` VALUES (622, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 16:18:17');
INSERT INTO `sys_logininfor` VALUES (623, 'kehu2', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 17:13:51');
INSERT INTO `sys_logininfor` VALUES (624, '123qwer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-19 17:58:28');
INSERT INTO `sys_logininfor` VALUES (625, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 18:53:17');
INSERT INTO `sys_logininfor` VALUES (626, '123qwer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-19 19:36:34');
INSERT INTO `sys_logininfor` VALUES (627, 'admin', '182.239.119.167', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-19 19:47:33');
INSERT INTO `sys_logininfor` VALUES (628, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-19 21:00:02');
INSERT INTO `sys_logininfor` VALUES (629, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 21:00:08');
INSERT INTO `sys_logininfor` VALUES (630, 'kefu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-19 21:02:24');
INSERT INTO `sys_logininfor` VALUES (631, 'kefu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-19 21:02:30');
INSERT INTO `sys_logininfor` VALUES (632, 'sharkadmin', '182.239.93.131', '香港 ', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-19 21:16:11');
INSERT INTO `sys_logininfor` VALUES (633, 'admin', '98.98.195.212', ' ', 'Chrome 9', 'Linux', '1', '用户不存在/密码错误', '2024-06-19 21:48:08');
INSERT INTO `sys_logininfor` VALUES (634, 'admin', '98.98.195.214', ' ', 'Chrome 9', 'Linux', '0', '登录成功', '2024-06-19 21:48:14');
INSERT INTO `sys_logininfor` VALUES (635, '123qwer', '127.0.0.1', '内网IP', 'Chrome 9', 'Linux', '0', '登录成功', '2024-06-19 21:53:12');
INSERT INTO `sys_logininfor` VALUES (636, 'kehu2', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 22:10:26');
INSERT INTO `sys_logininfor` VALUES (637, 'kehu2', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 22:12:06');
INSERT INTO `sys_logininfor` VALUES (638, 'admin', '182.239.119.167', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-19 22:16:15');
INSERT INTO `sys_logininfor` VALUES (639, 'testadmin', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '注册成功', '2024-06-19 22:22:30');
INSERT INTO `sys_logininfor` VALUES (640, 'testadmin', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 22:22:43');
INSERT INTO `sys_logininfor` VALUES (641, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 22:25:57');
INSERT INTO `sys_logininfor` VALUES (642, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-06-19 22:26:14');
INSERT INTO `sys_logininfor` VALUES (643, '123555qwe', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '注册成功', '2024-06-19 22:26:38');
INSERT INTO `sys_logininfor` VALUES (644, '123555qwe5', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '注册成功', '2024-06-19 22:27:22');
INSERT INTO `sys_logininfor` VALUES (645, '123555qwe5', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 22:27:32');
INSERT INTO `sys_logininfor` VALUES (646, '123qwer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-06-19 22:41:53');
INSERT INTO `sys_logininfor` VALUES (647, '123qwe', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-19 22:42:02');
INSERT INTO `sys_logininfor` VALUES (648, 'sharkadmin', '140.243.15.118', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-19 22:44:13');
INSERT INTO `sys_logininfor` VALUES (649, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-19 23:02:48');
INSERT INTO `sys_logininfor` VALUES (650, 'admin', '27.102.118.13', ' ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-20 09:43:15');
INSERT INTO `sys_logininfor` VALUES (651, 'admin', '103.43.162.163', '香港 ', 'Chrome 9', 'Linux', '0', '登录成功', '2024-06-20 12:39:44');
INSERT INTO `sys_logininfor` VALUES (652, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 01:38:12');
INSERT INTO `sys_logininfor` VALUES (653, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 01:47:03');
INSERT INTO `sys_logininfor` VALUES (654, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 01:49:49');
INSERT INTO `sys_logininfor` VALUES (655, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 02:14:40');
INSERT INTO `sys_logininfor` VALUES (656, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 02:23:27');
INSERT INTO `sys_logininfor` VALUES (657, '123456qwe', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-21 02:26:26');
INSERT INTO `sys_logininfor` VALUES (658, '123456qweq', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-21 02:26:31');
INSERT INTO `sys_logininfor` VALUES (659, '123456qwee', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-21 02:26:38');
INSERT INTO `sys_logininfor` VALUES (660, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 03:09:42');
INSERT INTO `sys_logininfor` VALUES (661, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-06-21 03:29:34');
INSERT INTO `sys_logininfor` VALUES (662, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 03:30:51');
INSERT INTO `sys_logininfor` VALUES (663, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-06-21 03:38:32');
INSERT INTO `sys_logininfor` VALUES (664, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 03:39:05');
INSERT INTO `sys_logininfor` VALUES (665, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-06-21 03:40:11');
INSERT INTO `sys_logininfor` VALUES (666, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 03:40:21');
INSERT INTO `sys_logininfor` VALUES (667, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 03:40:53');
INSERT INTO `sys_logininfor` VALUES (668, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 03:41:14');
INSERT INTO `sys_logininfor` VALUES (669, '123456qwe', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-21 03:45:57');
INSERT INTO `sys_logininfor` VALUES (670, '123456qwee', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-21 03:46:11');
INSERT INTO `sys_logininfor` VALUES (671, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 03:46:27');
INSERT INTO `sys_logininfor` VALUES (672, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 03:49:35');
INSERT INTO `sys_logininfor` VALUES (673, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 03:51:09');
INSERT INTO `sys_logininfor` VALUES (674, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 03:54:54');
INSERT INTO `sys_logininfor` VALUES (675, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 03:55:45');
INSERT INTO `sys_logininfor` VALUES (676, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 03:57:46');
INSERT INTO `sys_logininfor` VALUES (677, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 03:59:41');
INSERT INTO `sys_logininfor` VALUES (678, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 04:02:35');
INSERT INTO `sys_logininfor` VALUES (679, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-06-21 04:34:14');
INSERT INTO `sys_logininfor` VALUES (680, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 04:35:29');
INSERT INTO `sys_logininfor` VALUES (681, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-06-21 04:51:43');
INSERT INTO `sys_logininfor` VALUES (682, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 04:51:52');
INSERT INTO `sys_logininfor` VALUES (683, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 11:16:28');
INSERT INTO `sys_logininfor` VALUES (684, 'testadmin', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 20:25:44');
INSERT INTO `sys_logininfor` VALUES (685, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 20:48:29');
INSERT INTO `sys_logininfor` VALUES (686, '53756888', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 21:25:19');
INSERT INTO `sys_logininfor` VALUES (687, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 21:25:52');
INSERT INTO `sys_logininfor` VALUES (688, '53756888', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 21:26:28');
INSERT INTO `sys_logininfor` VALUES (689, '53756888', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 21:31:38');
INSERT INTO `sys_logininfor` VALUES (690, 'kehu2 ', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 21:31:41');
INSERT INTO `sys_logininfor` VALUES (691, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 21:36:52');
INSERT INTO `sys_logininfor` VALUES (692, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 21:42:28');
INSERT INTO `sys_logininfor` VALUES (693, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-06-21 21:44:31');
INSERT INTO `sys_logininfor` VALUES (694, '123654qwe', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '注册成功', '2024-06-21 21:44:58');
INSERT INTO `sys_logininfor` VALUES (695, '123654qwe', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 21:45:08');
INSERT INTO `sys_logininfor` VALUES (696, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 22:18:07');
INSERT INTO `sys_logininfor` VALUES (697, 'kehu2', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-21 22:19:35');
INSERT INTO `sys_logininfor` VALUES (698, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-22 00:46:02');
INSERT INTO `sys_logininfor` VALUES (699, '123654qwe', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-06-22 02:33:43');
INSERT INTO `sys_logininfor` VALUES (700, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-22 02:33:52');
INSERT INTO `sys_logininfor` VALUES (701, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-22 06:54:20');
INSERT INTO `sys_logininfor` VALUES (702, 'admin', '103.97.2.139', '香港 ', 'Chrome 9', 'Linux', '0', '登录成功', '2024-06-22 11:41:19');
INSERT INTO `sys_logininfor` VALUES (703, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-22 17:01:14');
INSERT INTO `sys_logininfor` VALUES (704, '53756888', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-23 07:17:26');
INSERT INTO `sys_logininfor` VALUES (705, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-23 12:03:46');
INSERT INTO `sys_logininfor` VALUES (706, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-23 16:10:00');
INSERT INTO `sys_logininfor` VALUES (707, 'admin', '182.239.119.167', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-23 22:45:24');
INSERT INTO `sys_logininfor` VALUES (708, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-24 22:08:30');
INSERT INTO `sys_logininfor` VALUES (709, 'sharkadmin', '140.243.20.95', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-24 22:59:06');
INSERT INTO `sys_logininfor` VALUES (710, 'sharkadmin', '182.239.85.136', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-24 23:19:49');
INSERT INTO `sys_logininfor` VALUES (711, 'kehu2', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-24 23:24:52');
INSERT INTO `sys_logininfor` VALUES (712, 'sharkadmin', '140.243.20.95', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-24 23:26:32');
INSERT INTO `sys_logininfor` VALUES (713, 'testadmin', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-24 23:31:12');
INSERT INTO `sys_logininfor` VALUES (714, 'sharkadmin', '182.239.85.136', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-25 01:17:41');
INSERT INTO `sys_logininfor` VALUES (715, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-25 14:32:40');
INSERT INTO `sys_logininfor` VALUES (716, 'sharkadmin', '140.243.20.95', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-25 15:14:24');
INSERT INTO `sys_logininfor` VALUES (717, 'Aa123456', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '注册成功', '2024-06-25 15:30:09');
INSERT INTO `sys_logininfor` VALUES (718, 'Aa123456', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-25 15:30:55');
INSERT INTO `sys_logininfor` VALUES (719, '258369', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '注册成功', '2024-06-25 16:31:40');
INSERT INTO `sys_logininfor` VALUES (720, '258369', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-06-25 16:31:57');
INSERT INTO `sys_logininfor` VALUES (721, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-25 16:48:55');
INSERT INTO `sys_logininfor` VALUES (722, 'sharkadmin', '140.243.20.95', '福建省 福州市', 'Chrome', 'Windows 10', '0', '登录成功', '2024-06-25 18:25:07');
INSERT INTO `sys_logininfor` VALUES (723, 'admin', '182.239.119.167', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-25 19:52:39');
INSERT INTO `sys_logininfor` VALUES (724, 'sharkadmin', '140.243.215.172', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-25 22:00:05');
INSERT INTO `sys_logininfor` VALUES (725, 'sharkadmin', '140.243.20.95', '福建省 福州市', 'Chrome', 'Windows 10', '0', '登录成功', '2024-06-25 22:00:14');
INSERT INTO `sys_logininfor` VALUES (726, 'sharkadmin', '140.243.215.172', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-25 22:00:34');
INSERT INTO `sys_logininfor` VALUES (727, 'admin', '182.239.119.167', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-25 22:27:40');
INSERT INTO `sys_logininfor` VALUES (728, 'sharkadmin', '182.239.119.167', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-25 22:27:52');
INSERT INTO `sys_logininfor` VALUES (729, 'sharkadmin', '140.243.215.172', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-25 22:31:41');
INSERT INTO `sys_logininfor` VALUES (730, 'sharkadmin1', '182.239.119.167', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-25 22:41:20');
INSERT INTO `sys_logininfor` VALUES (731, 'sharkadmin1', '182.239.119.167', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-25 22:42:31');
INSERT INTO `sys_logininfor` VALUES (732, 'admin', '182.239.119.167', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-25 22:42:33');
INSERT INTO `sys_logininfor` VALUES (733, 'admin', '182.239.119.167', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-25 22:43:15');
INSERT INTO `sys_logininfor` VALUES (734, 'sharkadmin1', '182.239.119.167', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-25 22:43:20');
INSERT INTO `sys_logininfor` VALUES (735, 'admin', '117.24.122.130', '福建省 泉州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-26 14:19:20');
INSERT INTO `sys_logininfor` VALUES (736, 'admin', '182.239.119.167', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-26 19:45:57');
INSERT INTO `sys_logininfor` VALUES (737, 'sharkadmin', '140.243.215.172', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-26 21:04:39');
INSERT INTO `sys_logininfor` VALUES (738, 'sharkadmin', '140.243.20.95', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-26 23:23:07');
INSERT INTO `sys_logininfor` VALUES (739, 'sharkadmin', '140.243.215.172', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-27 00:36:55');
INSERT INTO `sys_logininfor` VALUES (740, 'admin', '42.203.133.167', '辽宁省 辽阳市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-27 21:34:28');
INSERT INTO `sys_logininfor` VALUES (741, 'jintian', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '注册成功', '2024-06-27 21:39:17');
INSERT INTO `sys_logininfor` VALUES (742, 'jintian', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-27 21:39:27');
INSERT INTO `sys_logininfor` VALUES (743, 'admin', '182.239.119.167', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-27 23:18:13');
INSERT INTO `sys_logininfor` VALUES (744, 'sharkadmin', '140.243.215.172', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-27 23:25:37');
INSERT INTO `sys_logininfor` VALUES (745, 'admin', '182.239.119.167', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-28 18:02:45');
INSERT INTO `sys_logininfor` VALUES (746, '53753888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-29 02:50:55');
INSERT INTO `sys_logininfor` VALUES (747, '53753111', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-29 02:51:00');
INSERT INTO `sys_logininfor` VALUES (748, '53753111', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-29 02:51:05');
INSERT INTO `sys_logininfor` VALUES (749, '53753aaa', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-29 02:51:10');
INSERT INTO `sys_logininfor` VALUES (750, '53753aaa', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-29 02:51:29');
INSERT INTO `sys_logininfor` VALUES (751, '53756aaa', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-29 02:51:36');
INSERT INTO `sys_logininfor` VALUES (752, '53756aaa', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-29 02:51:39');
INSERT INTO `sys_logininfor` VALUES (753, '53756aaa', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-06-29 02:51:51');
INSERT INTO `sys_logininfor` VALUES (754, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-29 02:52:05');
INSERT INTO `sys_logininfor` VALUES (755, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-29 06:33:54');
INSERT INTO `sys_logininfor` VALUES (756, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-29 07:40:17');
INSERT INTO `sys_logininfor` VALUES (757, 'kehu2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-30 09:59:48');
INSERT INTO `sys_logininfor` VALUES (758, 'admin', '182.239.119.167', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-30 19:29:40');
INSERT INTO `sys_logininfor` VALUES (759, 'admin', '38.6.227.139', ' ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-01 19:38:12');
INSERT INTO `sys_logininfor` VALUES (760, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-01 20:05:09');
INSERT INTO `sys_logininfor` VALUES (761, 'admin', '182.239.119.167', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-01 23:04:21');
INSERT INTO `sys_logininfor` VALUES (762, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-07-02 09:34:39');
INSERT INTO `sys_logininfor` VALUES (763, '53756888', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-02 09:34:46');
INSERT INTO `sys_logininfor` VALUES (764, 'sharkadmin', '106.127.69.112', '广西 南宁市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-02 22:38:36');
INSERT INTO `sys_logininfor` VALUES (765, 'Aa123456', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-07-02 22:42:47');
INSERT INTO `sys_logininfor` VALUES (766, 'Aa123456', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-07-02 22:43:22');
INSERT INTO `sys_logininfor` VALUES (767, 'Aa123456', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-07-02 22:43:35');
INSERT INTO `sys_logininfor` VALUES (768, 'Aa123456', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-07-02 22:44:47');
INSERT INTO `sys_logininfor` VALUES (769, 'Aa123456', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-02 22:45:28');
INSERT INTO `sys_logininfor` VALUES (770, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 00:17:51');
INSERT INTO `sys_logininfor` VALUES (771, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-03 00:18:57');
INSERT INTO `sys_logininfor` VALUES (772, 'sharkadmin', '106.127.69.112', '广西 南宁市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 00:38:50');
INSERT INTO `sys_logininfor` VALUES (773, 'sharkadmin', '106.127.69.112', '广西 南宁市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 00:56:34');
INSERT INTO `sys_logininfor` VALUES (774, 'sharkadmin', '106.127.69.112', '广西 南宁市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 00:58:23');
INSERT INTO `sys_logininfor` VALUES (775, '159159', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '注册成功', '2024-07-03 01:03:31');
INSERT INTO `sys_logininfor` VALUES (776, '159159', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 01:03:42');
INSERT INTO `sys_logininfor` VALUES (777, '888777', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '注册成功', '2024-07-03 07:12:25');
INSERT INTO `sys_logininfor` VALUES (778, '888777', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-03 07:24:25');
INSERT INTO `sys_logininfor` VALUES (779, '888777', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-07-03 07:25:25');
INSERT INTO `sys_logininfor` VALUES (780, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-03 07:25:34');
INSERT INTO `sys_logininfor` VALUES (781, 'admin', '43.249.50.140', ' ', 'Chrome 9', 'Linux', '0', '登录成功', '2024-07-03 09:11:46');
INSERT INTO `sys_logininfor` VALUES (782, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 20:03:33');
INSERT INTO `sys_logininfor` VALUES (783, 'kefu', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-03 20:44:58');
INSERT INTO `sys_logininfor` VALUES (784, 'kefu2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-03 20:45:10');
INSERT INTO `sys_logininfor` VALUES (785, '123qwer', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-03 20:45:31');
INSERT INTO `sys_logininfor` VALUES (786, '123555qwe', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 20:45:44');
INSERT INTO `sys_logininfor` VALUES (787, 'kefu2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-03 21:38:29');
INSERT INTO `sys_logininfor` VALUES (788, 'kefu2', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '1', '用户不存在/密码错误', '2024-07-03 21:38:43');
INSERT INTO `sys_logininfor` VALUES (789, 'kefu2', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '1', '用户不存在/密码错误', '2024-07-03 21:38:53');
INSERT INTO `sys_logininfor` VALUES (790, 'kefu2', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '1', '用户不存在/密码错误', '2024-07-03 21:39:00');
INSERT INTO `sys_logininfor` VALUES (791, 'sharkadmin1', '8.210.63.236', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-04 22:29:33');
INSERT INTO `sys_logininfor` VALUES (792, 'kehu2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-04 23:08:21');
INSERT INTO `sys_logininfor` VALUES (793, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-04 23:09:21');
INSERT INTO `sys_logininfor` VALUES (794, '123qwe', '182.239.89.5', '香港 ', 'Unknown', 'Unknown', '0', '登录成功', '2024-07-04 23:10:01');
INSERT INTO `sys_logininfor` VALUES (795, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-04 23:12:18');
INSERT INTO `sys_logininfor` VALUES (796, 'kehu2', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-07-04 23:13:51');
INSERT INTO `sys_logininfor` VALUES (797, 'kehu2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-04 23:27:36');
INSERT INTO `sys_logininfor` VALUES (798, 'lxh', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '注册成功', '2024-07-04 23:49:17');
INSERT INTO `sys_logininfor` VALUES (799, 'lxh', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-07-04 23:49:30');
INSERT INTO `sys_logininfor` VALUES (800, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-07-05 00:38:47');
INSERT INTO `sys_logininfor` VALUES (801, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-05 00:38:58');
INSERT INTO `sys_logininfor` VALUES (802, 'lxh', '182.239.89.5', '香港 ', 'Unknown', 'Unknown', '0', '登录成功', '2024-07-05 00:41:58');
INSERT INTO `sys_logininfor` VALUES (803, 'lxh', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-07-05 00:47:06');
INSERT INTO `sys_logininfor` VALUES (804, 'sharkadmin', '182.239.117.22', '香港 ', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-07-05 09:12:15');
INSERT INTO `sys_logininfor` VALUES (805, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-07-05 09:27:43');
INSERT INTO `sys_logininfor` VALUES (806, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-05 09:27:56');
INSERT INTO `sys_logininfor` VALUES (807, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-05 10:58:48');
INSERT INTO `sys_logininfor` VALUES (808, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-05 11:01:23');
INSERT INTO `sys_logininfor` VALUES (809, 'kehu2', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-07-05 15:39:30');
INSERT INTO `sys_logininfor` VALUES (810, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-05 15:41:51');
INSERT INTO `sys_logininfor` VALUES (811, 'lxh', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 20:41:58');
INSERT INTO `sys_logininfor` VALUES (812, 'sharkadmin1', '8.210.63.236', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-05 21:22:25');
INSERT INTO `sys_logininfor` VALUES (813, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 21:31:24');
INSERT INTO `sys_logininfor` VALUES (814, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-05 21:32:09');
INSERT INTO `sys_logininfor` VALUES (815, 'sharkadmin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 21:32:12');
INSERT INTO `sys_logininfor` VALUES (816, 'sharkadmin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-05 21:32:49');
INSERT INTO `sys_logininfor` VALUES (817, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 21:32:52');
INSERT INTO `sys_logininfor` VALUES (818, 'sharkadmin1', '8.210.63.236', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 21:56:57');
INSERT INTO `sys_logininfor` VALUES (819, 'sharkadmin1', '182.239.89.212', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-05 23:40:03');
INSERT INTO `sys_logininfor` VALUES (820, 'skarkadmin', '182.239.120.6', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2024-07-05 23:47:26');
INSERT INTO `sys_logininfor` VALUES (821, 'sharkadmin', '182.239.120.6', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-05 23:48:15');
INSERT INTO `sys_logininfor` VALUES (822, 'sharkadmin', '106.122.117.173', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 00:26:18');
INSERT INTO `sys_logininfor` VALUES (823, 'sharkadmin', '182.239.88.165', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-06 07:36:19');
INSERT INTO `sys_logininfor` VALUES (824, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-06 10:04:57');
INSERT INTO `sys_logininfor` VALUES (825, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-06 10:37:43');
INSERT INTO `sys_logininfor` VALUES (826, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-06 10:39:02');
INSERT INTO `sys_logininfor` VALUES (827, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-06 10:39:45');
INSERT INTO `sys_logininfor` VALUES (828, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-06 10:50:37');
INSERT INTO `sys_logininfor` VALUES (829, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-06 10:52:42');
INSERT INTO `sys_logininfor` VALUES (830, 'sharkadmin1', '8.210.63.236', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 00:34:24');
INSERT INTO `sys_logininfor` VALUES (831, 'sharkadmin', '182.239.121.240', '香港 ', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-07-07 09:51:45');
INSERT INTO `sys_logininfor` VALUES (832, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-07 09:52:07');
INSERT INTO `sys_logininfor` VALUES (833, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 18:39:43');
INSERT INTO `sys_logininfor` VALUES (834, 'lxh', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-07-07 18:55:14');
INSERT INTO `sys_logininfor` VALUES (835, 'lxh', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-07 18:56:17');
INSERT INTO `sys_logininfor` VALUES (836, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-07 19:08:01');
INSERT INTO `sys_logininfor` VALUES (837, 'kehu2', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-07-07 19:11:06');
INSERT INTO `sys_logininfor` VALUES (838, 'sharkadmin', '182.239.121.240', '香港 ', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-07-07 19:21:28');
INSERT INTO `sys_logininfor` VALUES (839, 'kehu2', '182.239.121.240', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-07 19:21:54');
INSERT INTO `sys_logininfor` VALUES (840, 'sharkadmin1', '8.210.63.236', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-07 22:22:38');
INSERT INTO `sys_logininfor` VALUES (841, 'sharkadmin1', '8.210.63.236', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 22:22:42');
INSERT INTO `sys_logininfor` VALUES (842, 'sharkadmin', '140.243.70.194', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 22:32:55');
INSERT INTO `sys_logininfor` VALUES (843, 'sharkadmin', '140.243.70.194', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 23:48:28');
INSERT INTO `sys_logininfor` VALUES (844, 'sharkadmin', '182.239.121.180', '香港 ', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-08 00:06:44');
INSERT INTO `sys_logininfor` VALUES (845, 'lxh', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 00:40:25');
INSERT INTO `sys_logininfor` VALUES (846, 'sharkadmin', '140.243.70.194', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 00:43:59');
INSERT INTO `sys_logininfor` VALUES (847, 'admin', '38.207.143.120', ' ', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-08 01:08:15');
INSERT INTO `sys_logininfor` VALUES (848, 'admin', '38.207.143.120', ' ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 01:08:18');
INSERT INTO `sys_logininfor` VALUES (849, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 19:48:02');
INSERT INTO `sys_logininfor` VALUES (850, 'sharkadmin', '140.243.192.200', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 21:26:26');
INSERT INTO `sys_logininfor` VALUES (851, 'sharkadmin', '140.243.70.194', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 15:38:21');
INSERT INTO `sys_logininfor` VALUES (852, 'lxh', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 18:24:33');
INSERT INTO `sys_logininfor` VALUES (853, 'kehu2', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 18:49:25');
INSERT INTO `sys_logininfor` VALUES (854, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 18:58:40');
INSERT INTO `sys_logininfor` VALUES (855, 'kehu2', '182.239.121.240', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 21:03:32');
INSERT INTO `sys_logininfor` VALUES (856, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-09 21:04:00');
INSERT INTO `sys_logininfor` VALUES (857, 'sharkadmin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 21:04:02');
INSERT INTO `sys_logininfor` VALUES (858, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 21:04:24');
INSERT INTO `sys_logininfor` VALUES (859, 'sharkadmin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-09 21:04:25');
INSERT INTO `sys_logininfor` VALUES (860, 'sharkadmin', '140.243.70.194', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 21:32:06');
INSERT INTO `sys_logininfor` VALUES (861, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-09 22:11:22');
INSERT INTO `sys_logininfor` VALUES (862, 'sharkadmin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 22:11:34');
INSERT INTO `sys_logininfor` VALUES (863, 'sharkadmin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-09 22:15:31');
INSERT INTO `sys_logininfor` VALUES (864, 'sharkadmin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 22:15:34');
INSERT INTO `sys_logininfor` VALUES (865, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-10 00:59:38');
INSERT INTO `sys_logininfor` VALUES (866, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android Mobile', '1', '用户不存在/密码错误', '2024-07-10 05:02:35');
INSERT INTO `sys_logininfor` VALUES (867, 'test', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android Mobile', '1', '用户不存在/密码错误', '2024-07-10 05:02:42');
INSERT INTO `sys_logininfor` VALUES (868, 'root', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android Mobile', '1', '用户不存在/密码错误', '2024-07-10 05:02:49');
INSERT INTO `sys_logininfor` VALUES (869, 'kehu2', '203.75.191.237', '台湾省 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 18:22:20');
INSERT INTO `sys_logininfor` VALUES (870, 'sharkadmin', '140.243.70.194', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 21:12:31');
INSERT INTO `sys_logininfor` VALUES (871, 'sharkadmin1', '8.210.63.236', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 21:21:35');
INSERT INTO `sys_logininfor` VALUES (872, 'kehu2 ', '127.0.0.1', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-11 00:50:53');
INSERT INTO `sys_logininfor` VALUES (873, 'sharkadmin', '140.243.192.200', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-12 22:20:49');
INSERT INTO `sys_logininfor` VALUES (874, '微信用户_20240613082732353', '36.109.133.13', '新疆 博尔塔拉州', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '退出成功', '2024-07-12 22:59:32');
INSERT INTO `sys_logininfor` VALUES (875, 'sharkadmin', '140.243.192.200', '福建省 福州市', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-13 22:18:09');
INSERT INTO `sys_logininfor` VALUES (876, 'Aa123456', '140.243.205.169', '福建省 福州市', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2024-07-13 23:02:47');
INSERT INTO `sys_logininfor` VALUES (877, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 17:55:25');
INSERT INTO `sys_logininfor` VALUES (878, 'lxh', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 18:10:48');
INSERT INTO `sys_logininfor` VALUES (879, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-15 18:15:34');
INSERT INTO `sys_logininfor` VALUES (880, 'sharkadmin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 18:15:36');
INSERT INTO `sys_logininfor` VALUES (881, 'sharkadmin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-15 18:15:45');
INSERT INTO `sys_logininfor` VALUES (882, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 18:15:54');
INSERT INTO `sys_logininfor` VALUES (883, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-15 19:08:25');
INSERT INTO `sys_logininfor` VALUES (884, 'sharkadmin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 19:08:28');
INSERT INTO `sys_logininfor` VALUES (885, 'sharkadmin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-15 19:08:50');
INSERT INTO `sys_logininfor` VALUES (886, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 19:08:53');
INSERT INTO `sys_logininfor` VALUES (887, 'admin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-15 19:09:53');
INSERT INTO `sys_logininfor` VALUES (888, 'sharkadmin', '182.239.89.5', '香港 ', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 19:09:55');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2057 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_menu` VALUES (2000, '游戏管理', 0, 3, 'game', NULL, NULL, 1, 0, 'M', '0', '0', '', 'guide', 'admin', '2024-03-05 21:39:29', 'admin', '2024-05-06 18:48:06', '');
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
INSERT INTO `sys_menu` VALUES (2019, '投注机器人', 1, 11, 'falseUser', 'system/falseUser/index', NULL, 1, 0, 'C', '0', '0', 'system:falseUser:list', 'people', 'admin', '2024-03-17 18:39:55', 'admin', '2024-05-21 20:49:13', '投注机器人菜单');
INSERT INTO `sys_menu` VALUES (2020, '广告轮播图', 1, 12, 'replace', 'system/replace/index', NULL, 1, 0, 'C', '0', '0', 'system:replace:list', 'documentation', 'admin', '2024-03-17 19:30:19', 'admin', '2024-05-21 20:49:08', '广告轮播图菜单');
INSERT INTO `sys_menu` VALUES (2021, '开奖统计', 0, 4, 'kj', NULL, NULL, 1, 0, 'M', '0', '0', '', 'excel', 'admin', '2024-04-04 20:12:34', 'admin', '2024-05-06 18:48:11', '');
INSERT INTO `sys_menu` VALUES (2022, '开奖结果', 2021, 1, 'betkj', 'system/betkj/index', NULL, 1, 0, 'C', '0', '0', 'system:betkj:list', '#', 'admin', '2024-04-04 20:11:33', '', NULL, '极速时时彩开奖菜单');
INSERT INTO `sys_menu` VALUES (2023, '开奖结果查询', 2022, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:betkj:query', '#', 'admin', '2024-04-04 20:11:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '支付方式', 1, 13, 'payment', 'system/payment/index', NULL, 1, 0, 'C', '0', '0', 'system:payment:list', 'monitor', 'admin', '2024-04-07 19:11:15', 'admin', '2024-05-21 20:49:04', '支付方式菜单');
INSERT INTO `sys_menu` VALUES (2025, '支付方式查询', 2024, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:payment:query', '#', 'admin', '2024-04-07 19:11:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '卡奖结算', 2021, 2, 'repair', 'system/repair/index', NULL, 1, 0, 'C', '0', '0', 'system:repair:index', '#', 'admin', '2024-04-07 21:33:06', 'admin', '2024-04-07 21:35:11', '');
INSERT INTO `sys_menu` VALUES (2027, '常用功能', 0, 2, 'normal', NULL, NULL, 1, 0, 'M', '0', '0', '', 'button', 'admin', '2024-05-06 18:49:36', 'admin', '2024-05-06 18:54:45', '');
INSERT INTO `sys_menu` VALUES (2028, '实时投注', 2027, 1, 'betRealTime', 'system/bet/betRealTime', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-05-06 18:55:32', 'admin', '2024-05-06 20:52:51', '');
INSERT INTO `sys_menu` VALUES (2029, '提现记录', 2027, 2, 'postal', 'system/postal/index', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-05-06 18:55:48', 'admin', '2024-05-07 20:30:05', '');
INSERT INTO `sys_menu` VALUES (2030, '充值记录', 2027, 3, 'recharge', 'system/recharge/index', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-05-06 18:55:57', 'admin', '2024-05-08 21:10:13', '');
INSERT INTO `sys_menu` VALUES (2031, '用户盈利', 2027, 4, 'userTodayRank', 'system/user/userTodayRank', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-05-06 18:56:09', 'admin', '2024-05-11 22:53:54', '');
INSERT INTO `sys_menu` VALUES (2033, '手动上分', 2027, 6, 'handMoneyUp', 'system/recharge/moneyUp', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-05-06 18:56:33', 'admin', '2024-05-08 22:18:07', '');
INSERT INTO `sys_menu` VALUES (2034, '手动下分', 2027, 7, 'handMoneyDown', 'system/postal/moneyDown', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-05-06 18:56:42', 'admin', '2024-05-08 22:20:58', '');
INSERT INTO `sys_menu` VALUES (2035, '用户总上分', 2027, 8, 'moneyUpTotal', 'system/recharge/moneyUpTotal', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-05-06 18:56:55', 'admin', '2024-05-09 18:57:48', '');
INSERT INTO `sys_menu` VALUES (2036, '用户总下分', 2027, 9, 'moneyDownTotal', 'system/postal/moneyDownTotal', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-05-06 18:57:04', 'admin', '2024-05-09 18:57:35', '');
INSERT INTO `sys_menu` VALUES (2037, '反水佣金管理', 0, 5, 'commission', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'example', 'admin', '2024-05-06 19:06:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '反水详情及处理', 2037, 1, 'cashBack', 'system/cashback/index', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-05-06 19:06:45', 'admin', '2024-05-16 20:45:21', '');
INSERT INTO `sys_menu` VALUES (2039, '反水记录', 2037, 2, 'cashBackRecord', 'system/cashback/list', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-05-06 19:07:05', 'admin', '2024-05-16 20:45:29', '');
INSERT INTO `sys_menu` VALUES (2040, '佣金详情及处理', 2037, 3, 'commission', 'system/commission/index', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-05-06 19:07:20', 'admin', '2024-05-16 20:45:48', '');
INSERT INTO `sys_menu` VALUES (2041, '佣金记录', 2037, 4, 'commissionRecord', 'system/commission/list', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-05-06 19:07:28', 'admin', '2024-05-16 20:45:55', '');
INSERT INTO `sys_menu` VALUES (2042, '代理列表', 1, 10, 'agentUser', 'system/user/agentUserList', NULL, 1, 0, 'C', '0', '0', '', 'peoples', 'admin', '2024-05-21 20:48:44', 'admin', '2024-05-21 20:55:06', '');
INSERT INTO `sys_menu` VALUES (2043, '网站参数设置', 1, 14, 'webConfig', 'system/config/webConfig', NULL, 1, 0, 'C', '0', '0', '', 'edit', 'admin', '2024-05-26 20:37:21', 'admin', '2024-05-26 20:37:42', '');
INSERT INTO `sys_menu` VALUES (2044, '域名管理', 0, 6, 'domain', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'redis-list', 'admin', '2024-06-09 12:15:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '入口域名管理', 2044, 1, 'entryDomain', 'system/entryDomain/index', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-06-09 12:16:07', 'admin', '2024-06-09 12:53:57', '');
INSERT INTO `sys_menu` VALUES (2046, '落地域名管理', 2044, 2, 'landingDomain', 'system/landingDomain/index', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-06-09 12:16:26', 'admin', '2024-06-09 12:54:06', '');
INSERT INTO `sys_menu` VALUES (2047, '房间入口', 2027, 10, 'shareQrcode', 'system/qrCode/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2024-06-09 17:48:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '上传logo图片', 2044, 3, 'uploadLogo', 'system/qrCode/uploadImg', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2024-06-09 19:43:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '报表', 0, 7, 'report', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'excel', 'admin', '2024-06-10 20:09:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '总报表', 2049, 1, 'totalReport', 'system/report/totalReport', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-06-10 20:10:48', 'admin', '2024-06-10 21:42:16', '');
INSERT INTO `sys_menu` VALUES (2051, '上传客服图片', 2027, 11, 'uploadChatImg', 'system/chatImg/uploadChatImg', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2024-06-19 21:04:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '用户报表', 2049, 2, 'userReport', 'system/report/userReport', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-06-30 19:33:02', 'admin', '2024-06-30 19:48:14', '');
INSERT INTO `sys_menu` VALUES (2053, '详情报表', 2049, 3, 'detailReport', 'system/userMoney/index', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-06-30 19:33:23', 'admin', '2024-06-30 19:48:04', '');
INSERT INTO `sys_menu` VALUES (2054, '彩种报表', 2049, 4, 'gameReport', 'system/report/gameReport', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-06-30 19:33:41', 'admin', '2024-06-30 19:47:45', '');
INSERT INTO `sys_menu` VALUES (2055, '分类报表', 2049, 5, 'collectReport', 'system/report/collectReport', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-06-30 19:34:37', 'admin', '2024-06-30 19:47:33', '');
INSERT INTO `sys_menu` VALUES (2056, '3球特殊赔率', 2000, 4, 'odds', 'system/odds/index', NULL, 1, 0, 'C', '0', '0', 'system:odds:list', 'input', 'admin', '2024-07-08 22:49:42', '', NULL, '3球特殊赔率菜单');

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
) ENGINE = InnoDB AUTO_INCREMENT = 435 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_payment
-- ----------------------------
DROP TABLE IF EXISTS `sys_payment`;
CREATE TABLE `sys_payment`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '支付方式id',
  `payment_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收款账号',
  `payment_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收款姓名',
  `payment_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收款类型（0：微信、1：支付宝、2：银联）',
  `payment_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收款码图片地址',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '支付方式表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_payment
-- ----------------------------
INSERT INTO `sys_payment` VALUES (1, '350622222222222222', '测试', '2', NULL, '0', '', '2024-04-07 19:18:25', '', NULL, NULL);
INSERT INTO `sys_payment` VALUES (2, '', 'XXXXX', '1', '/profile/upload/2024/04/07/支付宝_20240407192112A001.jpeg', '0', '', '2024-04-07 19:21:14', '', NULL, NULL);
INSERT INTO `sys_payment` VALUES (3, NULL, 'YYYYYYYYYY', '0', '/profile/upload/2024/04/07/微信_20240407192157A002.jpeg', '0', '', '2024-04-07 19:22:00', '', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告轮播图' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_replace
-- ----------------------------
INSERT INTO `sys_replace` VALUES (1, '/profile/upload/2024/06/16/id2521_20240616211531A002.jpg', '0', '', '2024-03-17 19:36:12', '', '2024-06-16 21:15:34', '');
INSERT INTO `sys_replace` VALUES (2, '/profile/upload/2024/06/16/photo_2024-03-11_00-52-38_20240616211549A003.jpg', '0', '', '2024-03-17 19:36:16', '', '2024-06-16 21:15:52', '');
INSERT INTO `sys_replace` VALUES (3, '/profile/upload/2024/06/16/photo_2024-03-11_00-52-38_20240616211629A006.jpg', '0', '', '2024-03-17 19:36:21', '', '2024-06-16 21:16:31', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-03-05 21:03:11', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '平台管理员', 'sharkadmin', 2, '2', 1, 1, '0', '0', 'admin', '2024-03-05 21:03:11', 'admin', '2024-07-09 21:03:56', '平台管理员');
INSERT INTO `sys_role` VALUES (3, '普通用户', 'normalUser', 3, '1', 1, 1, '0', '0', 'admin', '2024-04-08 19:31:54', '', NULL, NULL);

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
INSERT INTO `sys_role_dept` VALUES (2, 103);

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
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
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
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2022);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (2, 2025);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (2, 2028);
INSERT INTO `sys_role_menu` VALUES (2, 2029);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2034);
INSERT INTO `sys_role_menu` VALUES (2, 2035);
INSERT INTO `sys_role_menu` VALUES (2, 2036);
INSERT INTO `sys_role_menu` VALUES (2, 2037);
INSERT INTO `sys_role_menu` VALUES (2, 2038);
INSERT INTO `sys_role_menu` VALUES (2, 2039);
INSERT INTO `sys_role_menu` VALUES (2, 2040);
INSERT INTO `sys_role_menu` VALUES (2, 2041);
INSERT INTO `sys_role_menu` VALUES (2, 2042);
INSERT INTO `sys_role_menu` VALUES (2, 2043);
INSERT INTO `sys_role_menu` VALUES (2, 2044);
INSERT INTO `sys_role_menu` VALUES (2, 2045);
INSERT INTO `sys_role_menu` VALUES (2, 2046);
INSERT INTO `sys_role_menu` VALUES (2, 2047);
INSERT INTO `sys_role_menu` VALUES (2, 2048);
INSERT INTO `sys_role_menu` VALUES (2, 2049);
INSERT INTO `sys_role_menu` VALUES (2, 2050);
INSERT INTO `sys_role_menu` VALUES (2, 2051);
INSERT INTO `sys_role_menu` VALUES (2, 2052);
INSERT INTO `sys_role_menu` VALUES (2, 2053);
INSERT INTO `sys_role_menu` VALUES (2, 2054);
INSERT INTO `sys_role_menu` VALUES (2, 2055);
INSERT INTO `sys_role_menu` VALUES (2, 2056);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `remark_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户备注名',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户,01平台管理员,02APP用户）',
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
  `invite_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `pay_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付密码',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `idcard_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `idcard_front_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证正面图片路径',
  `idcard_back_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证反面图片路径',
  `wallet_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钱包地址',
  `parent_user_id` bigint(20) NULL DEFAULT NULL COMMENT '上级用户ID',
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部OpenId',
  `three_ball_commission` float(5, 2) NULL DEFAULT 100.00 COMMENT '3球佣金比率',
  `five_ball_commission` float(5, 2) NULL DEFAULT 100.00 COMMENT '5球佣金比率',
  `ten_ball_commission` float(5, 2) NULL DEFAULT 100.00 COMMENT '10球佣金比率',
  `three_ball_cashback` float(5, 2) NULL DEFAULT 100.00 COMMENT '3球反水比率',
  `five_ball_cashback` float(5, 2) NULL DEFAULT 100.00 COMMENT '5球反水比率',
  `ten_ball_cashback` float(5, 2) NULL DEFAULT 100.00 COMMENT '10球反水比率',
  `is_test` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否测试用户(0不是,1是)',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 0, 'admin', '若依', NULL, '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '182.239.89.5', '2024-07-15 19:08:53', 535.33, 593.00, 'a12c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 100.00, 100.00, 100.00, 100.00, 100.00, '1', 'admin', '2024-03-05 21:03:10', '', '2024-07-15 19:08:52', '管理员');
INSERT INTO `sys_user` VALUES (2, 100, 'sharkadmin', '平台管理员', NULL, '01', 'ry@qq.com', '15666666666', '1', '', '$2a$10$6AO5Mx33xFDoAJ61aQC8F.Tpyc1W/1zCBh9EdE8RTXiFhlAsRdQmK', '0', '0', '182.239.89.5', '2024-07-15 19:09:55', 38.96, 0.00, '789c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 100.00, 100.00, 100.00, 100.00, 100.00, '1', 'admin', '2024-03-05 21:03:10', 'admin', '2024-07-15 19:09:55', '测试员');
INSERT INTO `sys_user` VALUES (3, 100, 'sharkadmin1', '子管理员', NULL, '01', '', '', '1', '', '$2a$10$6AO5Mx33xFDoAJ61aQC8F.Tpyc1W/1zCBh9EdE8RTXiFhlAsRdQmK', '0', '0', '8.210.63.236', '2024-07-10 21:21:35', 0.00, 0.00, '123c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 100.00, 100.00, 100.00, 100.00, 100.00, '1', 'admin', '2024-03-05 21:03:10', 'admin', '2024-07-10 21:21:34', '测试员');
INSERT INTO `sys_user` VALUES (4, 103, 'kehu2', '测试客户2', NULL, '02', '', '15888888883', '0', '', '$2a$10$2Efk1NlVTGXD29DvC.XQ3OJ8N9a5tkVDyjgNmYjazlmOBQBM2md1i', '0', '0', '127.0.0.1', '2024-07-11 00:50:53', 964.36, 4007.00, '5cf4c7', '$2a$10$0RKOBbXfsDdFqo8LBclK/eLfIZnc0hfBVvBKCZtBRa/w4Dh7rgh6.', '客2', '1231231211', '/profile/upload/2024/04/08/image_20240408204120A001.jpeg', '/profile/upload/2024/04/08/image_20240408204120A002.jpeg', '6fd084fa48a2bfef', 2, NULL, 100.00, 100.00, 100.00, 100.00, 100.00, 100.00, '1', '', '2024-04-08 20:41:20', '', '2024-07-11 00:59:22', NULL);

-- ----------------------------
-- Table structure for sys_user_active
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_active`;
CREATE TABLE `sys_user_active`  (
  `active_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '存活ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `login_date` datetime NULL DEFAULT NULL COMMENT '登录时间',
  `active_date` datetime NULL DEFAULT NULL COMMENT '最后活动时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`active_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户存活状况' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_active
-- ----------------------------
INSERT INTO `sys_user_active` VALUES (1, 1, '2024-07-05 21:31:24', '2024-07-15 19:09:47', '', NULL, '', NULL, '');
INSERT INTO `sys_user_active` VALUES (2, 1, '2024-07-05 21:31:24', '2024-07-05 23:07:01', '', NULL, '', NULL, '');
INSERT INTO `sys_user_active` VALUES (3, 3, '2024-07-04 22:29:33', '2024-07-14 04:16:33', '', NULL, '', NULL, '');
INSERT INTO `sys_user_active` VALUES (4, 3, '2024-07-04 22:29:33', '2024-07-05 23:07:06', '', NULL, '', NULL, '');
INSERT INTO `sys_user_active` VALUES (5, 3, '2024-07-04 22:29:33', '2024-07-05 23:07:06', '', NULL, '', NULL, '');
INSERT INTO `sys_user_active` VALUES (6, 2, '2024-07-05 21:32:12', '2024-07-15 20:09:24', '', NULL, '', NULL, '');
INSERT INTO `sys_user_active` VALUES (7, 4, '2024-07-05 15:41:52', '2024-07-11 00:59:37', '', NULL, '', NULL, '');
INSERT INTO `sys_user_active` VALUES (8, 9, '2024-07-04 22:25:37', '2024-07-11 01:05:05', '', NULL, '', NULL, '');
INSERT INTO `sys_user_active` VALUES (9, 9, '2024-07-04 22:25:37', '2024-07-06 14:32:18', '', NULL, '', NULL, '');
INSERT INTO `sys_user_active` VALUES (10, 27, '2024-07-07 18:55:15', '2024-07-15 20:09:24', '', NULL, '', NULL, '');
INSERT INTO `sys_user_active` VALUES (11, 28, NULL, '2024-07-13 23:00:34', '', NULL, '', NULL, '');
INSERT INTO `sys_user_active` VALUES (12, 28, NULL, '2024-07-09 15:42:25', '', NULL, '', NULL, '');
INSERT INTO `sys_user_active` VALUES (13, 29, NULL, '2024-07-13 23:00:05', '', NULL, '', NULL, '');
INSERT INTO `sys_user_active` VALUES (14, 29, NULL, '2024-07-10 21:29:53', '', NULL, '', NULL, '');
INSERT INTO `sys_user_active` VALUES (15, 11, '2024-06-13 22:57:05', '2024-07-12 22:59:30', '', NULL, '', NULL, '');
INSERT INTO `sys_user_active` VALUES (16, 22, '2024-07-02 22:45:28', '2024-07-13 23:30:30', '', NULL, '', NULL, '');

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
INSERT INTO `sys_user_post` VALUES (3, 2);

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
INSERT INTO `sys_user_role` VALUES (3, 2);
INSERT INTO `sys_user_role` VALUES (4, 3);

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
  `game_id` bigint(20) NULL DEFAULT NULL COMMENT '游戏ID',
  `game_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏名',
  `house` int(4) NOT NULL DEFAULT 0 COMMENT '房间号',
  `is_delete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否删除(0否 1是)',
  `hz_id` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否合庄模式',
  `commission_from_user_id` int(11) NULL DEFAULT NULL COMMENT '佣金来源用户',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `user_id`(`user_id`, `type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1539 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户资金流水表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usermoney
-- ----------------------------

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
  `big_small_money` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '大小单双盈亏金额',
  `other_money` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '其他盈亏金额',
  `combination_money` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '混合盈亏金额',
  `deduct_money` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '扣除金额',
  `cash_back_money` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '反水金额',
  `commission_money` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '佣金金额',
  `is_delete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否扣除(0否 1是)',
  `is_cash_back` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否反水(0否 1是)',
  `is_commission` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否佣金结算(0否 1是)',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `win_time`) USING BTREE,
  INDEX `win_time`(`win_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户盈亏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of userwin
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数字红绿蓝属性表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wave
-- ----------------------------
INSERT INTO `wave` VALUES (1, 2, 0, 1, 3, 2, 1, 3, 2, 1, 3, 2, 1, 3, 2, 0, 0, 2, 1, 3, 2, 1, 3, 2, 1, 3, 2, 1, 3, 2, 'SYSTEM', '2024-03-27 20:59:53', '', NULL, '');

-- ----------------------------
-- Procedure structure for intsertRangeDate
-- ----------------------------
DROP PROCEDURE IF EXISTS `intsertRangeDate`;
delimiter ;;
CREATE PROCEDURE `intsertRangeDate`(IN startTime varchar(10),IN endTime varchar(10))
BEGIN
	DECLARE i INT DEFAULT 0;
        DECLARE beginDate datetime;
	DECLARE endDate datetime;
	DECLARE difDay int DEFAULT 0;
	set beginDate =DATE_FORMAT(CONCAT(startTime,' 00:00:00'),'%Y-%m-%d %H:%i:%s');
	set endDate  = DATE_FORMAT(CONCAT(endTime,' 00:00:00'),'%Y-%m-%d %H:%i:%s');
	select   (to_days(endDate) - to_days(beginDate)) into difDay;
	WHILE i<difDay
	DO
		insert into sys_calendar (calendar_date) values (DATE_ADD(beginDate,INTERVAL i DAY));
		SET i=i+1;
	END WHILE ;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
