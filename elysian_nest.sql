/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80027 (8.0.27)
 Source Host           : localhost:3306
 Source Schema         : elysian_nest

 Target Server Type    : MySQL
 Target Server Version : 80027 (8.0.27)
 File Encoding         : 65001

 Date: 02/05/2024 18:55:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for data_statistics
-- ----------------------------
DROP TABLE IF EXISTS `data_statistics`;
CREATE TABLE `data_statistics`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '统计ID',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `checkin_count` int NULL DEFAULT NULL COMMENT '今日预入住人数',
  `checkout_count` int NULL DEFAULT NULL COMMENT '今日预退房人数',
  `order_count` int NULL DEFAULT NULL COMMENT '今日订单笔数',
  `revenue` decimal(10, 2) NULL DEFAULT NULL COMMENT '今日营业额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '酒店经营数据统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_statistics
-- ----------------------------
INSERT INTO `data_statistics` VALUES (1, '2024-04-01', 45, 40, 50, 5000.00);
INSERT INTO `data_statistics` VALUES (2, '2024-04-02', 50, 42, 48, 5200.00);
INSERT INTO `data_statistics` VALUES (3, '2024-04-03', 48, 45, 55, 5300.00);
INSERT INTO `data_statistics` VALUES (4, '2024-04-04', 55, 50, 60, 6000.00);
INSERT INTO `data_statistics` VALUES (5, '2024-04-05', 60, 55, 58, 5800.00);
INSERT INTO `data_statistics` VALUES (6, '2024-04-06', 58, 52, 56, 5500.00);
INSERT INTO `data_statistics` VALUES (7, '2024-04-07', 62, 58, 65, 6200.00);
INSERT INTO `data_statistics` VALUES (8, '2024-04-08', 55, 36, 61, 3600.00);
INSERT INTO `data_statistics` VALUES (9, '2024-04-09', 41, 1, 60, 5862.00);
INSERT INTO `data_statistics` VALUES (10, '2024-04-10', 4, 24, 10, 1340.00);
INSERT INTO `data_statistics` VALUES (11, '2024-04-11', 4, 6, 38, 3763.00);
INSERT INTO `data_statistics` VALUES (12, '2024-04-12', 32, 24, 50, 1332.00);
INSERT INTO `data_statistics` VALUES (13, '2024-04-13', 42, 50, 41, 1371.00);
INSERT INTO `data_statistics` VALUES (14, '2024-04-14', 8, 29, 37, 1556.00);
INSERT INTO `data_statistics` VALUES (15, '2024-04-15', 24, 1, 64, 1842.00);
INSERT INTO `data_statistics` VALUES (16, '2024-04-16', 47, 7, 83, 4837.00);
INSERT INTO `data_statistics` VALUES (17, '2024-04-17', 19, 26, 43, 4139.00);
INSERT INTO `data_statistics` VALUES (18, '2024-04-18', 43, 21, 49, 1960.00);
INSERT INTO `data_statistics` VALUES (19, '2024-04-19', 26, 47, 17, 1173.00);
INSERT INTO `data_statistics` VALUES (20, '2024-04-20', 34, 13, 23, 2865.00);
INSERT INTO `data_statistics` VALUES (21, '2024-04-21', 10, 44, 76, 1744.00);
INSERT INTO `data_statistics` VALUES (22, '2024-04-22', 25, 1, 59, 5354.00);
INSERT INTO `data_statistics` VALUES (23, '2024-04-23', 31, 23, 41, 4315.00);
INSERT INTO `data_statistics` VALUES (24, '2024-04-24', 6, 29, 53, 5535.00);
INSERT INTO `data_statistics` VALUES (25, '2024-04-25', 49, 5, 54, 3071.00);
INSERT INTO `data_statistics` VALUES (26, '2024-04-26', 24, 7, 21, 4236.00);
INSERT INTO `data_statistics` VALUES (27, '2024-04-27', 32, 9, 100, 3197.00);
INSERT INTO `data_statistics` VALUES (28, '2024-04-28', 12, 41, 35, 2650.00);
INSERT INTO `data_statistics` VALUES (29, '2024-04-29', 31, 2, 35, 4190.00);
INSERT INTO `data_statistics` VALUES (30, '2024-04-30', 8, 42, 73, 1625.00);
INSERT INTO `data_statistics` VALUES (31, '2024-05-01', 23, 43, 96, 2031.00);
INSERT INTO `data_statistics` VALUES (32, '2024-05-02', 9, 10, 44, 4038.00);

-- ----------------------------
-- Table structure for hotel_member
-- ----------------------------
DROP TABLE IF EXISTS `hotel_member`;
CREATE TABLE `hotel_member`  (
  `member_id` int NOT NULL AUTO_INCREMENT COMMENT '会员ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID，关联系统用户表',
  `member_level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员等级',
  `member_points` int NULL DEFAULT NULL COMMENT '会员积分',
  `balance` decimal(10, 2) NULL DEFAULT NULL COMMENT '会员账户余额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`member_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `hotel_member_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '酒店会员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_member
-- ----------------------------
INSERT INTO `hotel_member` VALUES (1, 3, 'Lv.4', 3201, 18545.00, '2024-04-04 16:51:10', '2024-05-01 13:16:22');
INSERT INTO `hotel_member` VALUES (2, 4, 'Lv.6', 17777, 12377.00, '2024-04-17 17:08:33', '2024-04-30 19:48:54');
INSERT INTO `hotel_member` VALUES (3, 5, 'Lv.1', 100, 100.00, '2024-04-17 17:12:07', '2024-04-25 00:04:13');
INSERT INTO `hotel_member` VALUES (4, 6, 'Lv.3', 1648, 326.00, '2024-04-17 17:14:53', '2024-04-22 11:27:29');
INSERT INTO `hotel_member` VALUES (5, 7, 'Lv.2', 1000, 632.00, '2024-04-24 23:55:38', '2024-04-29 20:57:41');
INSERT INTO `hotel_member` VALUES (6, 8, 'Lv.1', 20, 20.50, '2024-04-25 00:39:05', '2024-04-29 00:38:32');
INSERT INTO `hotel_member` VALUES (7, 13, 'Lv.1', 30, 30.00, '2024-04-28 19:49:45', '2024-04-29 17:15:25');
INSERT INTO `hotel_member` VALUES (8, 16, 'Lv.6', 10008, 8000.00, '2024-04-29 22:56:42', '2024-05-01 13:45:29');

-- ----------------------------
-- Table structure for hotel_order
-- ----------------------------
DROP TABLE IF EXISTS `hotel_order`;
CREATE TABLE `hotel_order`  (
  `order_id` int NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `user_id` int NULL DEFAULT NULL COMMENT '会员ID，关联系统用户表',
  `room_id` int NULL DEFAULT NULL COMMENT '房间ID，关联酒店房间表',
  `order_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单号',
  `reserve_date` date NULL DEFAULT NULL COMMENT '预订日期',
  `checkin_date` date NULL DEFAULT NULL COMMENT '入住日期',
  `checkout_date` date NULL DEFAULT NULL COMMENT '退房日期',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单状态（已预订/入住中/已退房/已取消）',
  `payment` decimal(10, 2) NULL DEFAULT NULL COMMENT '支付金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `member_id`(`user_id` ASC) USING BTREE,
  INDEX `hotel_order_ibfk_1`(`room_id` ASC) USING BTREE,
  CONSTRAINT `hotel_order_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `hotel_room` (`room_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '酒店订单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_order
-- ----------------------------
INSERT INTO `hotel_order` VALUES (1, 3, 1, '20240417350063', '2024-04-16', '2024-04-17', '2024-04-18', '已退房', 280.00, '2024-04-17 11:39:07', '2024-04-18 12:38:58');
INSERT INTO `hotel_order` VALUES (2, 3, 2, '20240417894245', '2024-04-17', '2024-04-17', '2024-04-21', '已退房', 280.00, '2024-04-17 11:42:16', '2024-04-21 16:31:21');
INSERT INTO `hotel_order` VALUES (3, 3, 3, '20240417254392', '2024-04-17', '2024-04-17', '2024-04-21', '已退房', 280.00, '2024-04-17 11:47:35', '2024-04-21 16:32:21');
INSERT INTO `hotel_order` VALUES (4, 3, 4, '20240417798789', '2024-04-17', '2024-04-19', '2024-04-20', '已取消', 360.00, '2024-04-17 12:48:50', '2024-05-01 13:16:22');
INSERT INTO `hotel_order` VALUES (5, 3, 5, '20240417132909', '2024-04-17', '2024-04-18', '2024-04-20', '已取消', 360.00, '2024-04-17 12:49:43', '2024-04-17 12:50:07');
INSERT INTO `hotel_order` VALUES (6, 6, 4, '20240420268035', '2024-04-20', '2024-04-21', '2024-04-23', '已退房', 280.00, '2024-04-20 23:39:56', '2024-04-21 20:51:25');
INSERT INTO `hotel_order` VALUES (7, 3, 3, '20240421814828', '2024-04-21', '2024-04-26', '2024-04-29', '已取消', 2064.00, '2024-04-21 01:29:37', '2024-04-21 16:33:05');
INSERT INTO `hotel_order` VALUES (8, 4, 6, '20240421884798', '2024-04-21', '2024-04-21', '2024-04-24', '入住中', 840.00, '2024-04-21 16:42:35', '2024-04-21 16:42:35');
INSERT INTO `hotel_order` VALUES (9, 6, 2, '20240421008538', '2024-04-21', '2024-04-30', '2024-05-02', '入住中', 720.00, '2024-04-21 16:55:25', '2024-04-22 11:24:37');
INSERT INTO `hotel_order` VALUES (10, 3, 8, '20240421550319', '2024-04-21', '2024-04-21', '2024-04-23', '已取消', 720.00, '2024-04-21 20:50:54', '2024-04-29 00:38:01');
INSERT INTO `hotel_order` VALUES (11, 3, 4, '20240421269741', '2024-04-21', '2024-04-21', '2024-04-22', '已取消', 280.00, '2024-04-21 23:16:10', '2024-04-21 23:24:09');
INSERT INTO `hotel_order` VALUES (12, 3, 4, '20240421025020', '2024-04-21', '2024-04-25', '2024-04-26', '入住中', 280.00, '2024-04-21 23:16:37', '2024-04-21 23:16:37');
INSERT INTO `hotel_order` VALUES (13, 3, 11, '20240422168745', '2024-04-22', '2024-04-22', '2024-04-24', '入住中', 376.00, '2024-04-22 11:26:38', '2024-04-22 11:26:38');
INSERT INTO `hotel_order` VALUES (14, 6, 9, '20240422704560', '2024-04-22', '2024-04-22', '2024-04-23', '入住中', 280.00, '2024-04-22 11:26:54', '2024-04-22 11:26:54');
INSERT INTO `hotel_order` VALUES (15, 4, 1, '20240422593663', '2024-04-22', '2024-04-22', '2024-04-30', '已退房', 188.00, '2024-04-22 11:27:12', '2024-04-30 19:14:15');
INSERT INTO `hotel_order` VALUES (16, 6, 5, '20240422538633', '2024-04-22', '2024-04-22', '2024-04-23', '入住中', 42.00, '2024-04-22 11:27:29', '2024-04-22 11:27:29');
INSERT INTO `hotel_order` VALUES (17, 4, 3, '20240422764849', '2024-04-22', '2024-05-02', '2024-05-07', '已预订', 3440.00, '2024-04-22 12:35:53', '2024-04-22 12:35:53');
INSERT INTO `hotel_order` VALUES (18, 4, 10, '20240429101612', '2024-04-29', '2024-04-29', '2024-05-02', '入住中', 564.00, '2024-04-29 00:35:37', '2024-04-29 00:35:37');
INSERT INTO `hotel_order` VALUES (19, 7, 14, '20240429455749', '2024-04-29', '2024-04-29', '2024-04-30', '已退房', 368.00, '2024-04-29 20:57:41', '2024-04-30 23:13:18');
INSERT INTO `hotel_order` VALUES (20, 4, 2, '20240430085234', '2024-04-30', '2024-05-12', '2024-05-13', '已预订', 368.00, '2024-04-30 19:48:54', '2024-04-30 19:48:54');
INSERT INTO `hotel_order` VALUES (21, 3, 14, '20240430231038', '2024-04-30', '2024-04-30', '2024-05-14', '已取消', 5152.00, '2024-04-30 23:07:04', '2024-04-30 23:11:49');
INSERT INTO `hotel_order` VALUES (22, 3, 14, '20240430618541', '2024-04-30', '2024-04-30', '2024-05-14', '已取消', 5152.00, '2024-04-30 23:07:05', '2024-04-30 23:11:46');

-- ----------------------------
-- Table structure for hotel_recharge_record
-- ----------------------------
DROP TABLE IF EXISTS `hotel_recharge_record`;
CREATE TABLE `hotel_recharge_record`  (
  `recharge_id` int NOT NULL AUTO_INCREMENT COMMENT '充值记录ID',
  `member_id` int NULL DEFAULT NULL COMMENT '会员ID，关联酒店会员信息表',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `payment_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付方式（支付宝/微信/现金）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '充值时间',
  PRIMARY KEY (`recharge_id`) USING BTREE,
  INDEX `member_id`(`member_id` ASC) USING BTREE,
  CONSTRAINT `hotel_recharge_record_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `hotel_member` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '酒店会员充值记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_recharge_record
-- ----------------------------
INSERT INTO `hotel_recharge_record` VALUES (5, 4, 1648.00, '支付宝', '2024-04-19 19:12:04');
INSERT INTO `hotel_recharge_record` VALUES (6, 2, 8888.00, '支付宝', '2024-04-19 19:12:36');
INSERT INTO `hotel_recharge_record` VALUES (7, 2, 8888.00, '支付宝', '2024-04-24 14:08:10');
INSERT INTO `hotel_recharge_record` VALUES (8, 2, 10.00, '现金', '2024-04-24 14:09:05');
INSERT INTO `hotel_recharge_record` VALUES (9, 1, 10.00, '支付宝', '2024-04-24 14:19:14');
INSERT INTO `hotel_recharge_record` VALUES (13, 5, 10.00, '现金', '2024-04-25 00:03:12');
INSERT INTO `hotel_recharge_record` VALUES (14, 3, 100.00, '现金', '2024-04-25 00:04:13');
INSERT INTO `hotel_recharge_record` VALUES (15, 5, 99.00, '现金', '2024-04-25 00:04:18');
INSERT INTO `hotel_recharge_record` VALUES (16, 6, 10.50, '现金', '2024-04-25 00:40:58');
INSERT INTO `hotel_recharge_record` VALUES (17, 6, 10.00, '现金', '2024-04-29 00:38:32');
INSERT INTO `hotel_recharge_record` VALUES (18, 7, 10.00, '现金', '2024-04-29 01:16:02');
INSERT INTO `hotel_recharge_record` VALUES (19, 7, 20.00, '现金', '2024-04-29 17:15:25');
INSERT INTO `hotel_recharge_record` VALUES (20, 5, 900.00, '现金', '2024-04-29 20:56:29');
INSERT INTO `hotel_recharge_record` VALUES (21, 1, 1.00, '支付宝', '2024-05-01 00:41:42');
INSERT INTO `hotel_recharge_record` VALUES (22, 1, 100.00, '支付宝', '2024-05-01 00:42:00');
INSERT INTO `hotel_recharge_record` VALUES (23, 1, 100.00, '微信', '2024-05-01 10:14:52');
INSERT INTO `hotel_recharge_record` VALUES (24, 1, 1000.00, '支付宝', '2024-05-01 10:38:06');
INSERT INTO `hotel_recharge_record` VALUES (25, 1, 1000.00, '支付宝', '2024-05-01 10:46:22');
INSERT INTO `hotel_recharge_record` VALUES (26, 1, 1000.00, '支付宝', '2024-05-01 11:24:33');
INSERT INTO `hotel_recharge_record` VALUES (27, 8, 100.00, '支付宝', '2024-05-01 13:23:38');
INSERT INTO `hotel_recharge_record` VALUES (28, 8, 300.00, '支付宝', '2024-05-01 13:34:19');
INSERT INTO `hotel_recharge_record` VALUES (29, 8, 100.00, '支付宝', '2024-05-01 13:34:27');
INSERT INTO `hotel_recharge_record` VALUES (30, 8, 100.00, '支付宝', '2024-05-01 13:34:32');
INSERT INTO `hotel_recharge_record` VALUES (31, 8, 300.00, '支付宝', '2024-05-01 13:34:44');
INSERT INTO `hotel_recharge_record` VALUES (32, 8, 300.00, '支付宝', '2024-05-01 13:34:51');
INSERT INTO `hotel_recharge_record` VALUES (33, 8, 300.00, '支付宝', '2024-05-01 13:34:57');
INSERT INTO `hotel_recharge_record` VALUES (34, 8, 300.00, '支付宝', '2024-05-01 13:35:01');
INSERT INTO `hotel_recharge_record` VALUES (35, 8, 300.00, '支付宝', '2024-05-01 13:35:04');
INSERT INTO `hotel_recharge_record` VALUES (36, 8, 600.00, '支付宝', '2024-05-01 13:35:10');
INSERT INTO `hotel_recharge_record` VALUES (37, 8, 300.00, '支付宝', '2024-05-01 13:35:15');
INSERT INTO `hotel_recharge_record` VALUES (38, 8, 300.00, '支付宝', '2024-05-01 13:35:19');
INSERT INTO `hotel_recharge_record` VALUES (39, 8, 300.00, '支付宝', '2024-05-01 13:35:22');
INSERT INTO `hotel_recharge_record` VALUES (40, 8, 300.00, '支付宝', '2024-05-01 13:35:23');
INSERT INTO `hotel_recharge_record` VALUES (41, 8, 300.00, '支付宝', '2024-05-01 13:35:26');
INSERT INTO `hotel_recharge_record` VALUES (42, 8, 300.00, '支付宝', '2024-05-01 13:35:30');
INSERT INTO `hotel_recharge_record` VALUES (43, 8, 300.00, '支付宝', '2024-05-01 13:35:32');
INSERT INTO `hotel_recharge_record` VALUES (44, 8, 300.00, '支付宝', '2024-05-01 13:35:35');
INSERT INTO `hotel_recharge_record` VALUES (45, 8, 300.00, '支付宝', '2024-05-01 13:35:39');
INSERT INTO `hotel_recharge_record` VALUES (46, 8, 3300.00, '支付宝', '2024-05-01 13:35:43');
INSERT INTO `hotel_recharge_record` VALUES (47, 8, 1000.00, '支付宝', '2024-05-01 13:35:52');
INSERT INTO `hotel_recharge_record` VALUES (48, 8, 1000.00, '支付宝', '2024-05-01 13:35:55');
INSERT INTO `hotel_recharge_record` VALUES (49, 8, 1000.00, '支付宝', '2024-05-01 13:36:01');
INSERT INTO `hotel_recharge_record` VALUES (50, 8, 10.00, '支付宝', '2024-05-01 13:37:36');
INSERT INTO `hotel_recharge_record` VALUES (51, 8, 100000.00, '微信', '2024-05-01 13:43:16');
INSERT INTO `hotel_recharge_record` VALUES (52, 8, 8000.00, '微信', '2024-05-01 13:44:14');
INSERT INTO `hotel_recharge_record` VALUES (53, 8, 200.00, '微信', '2024-05-01 13:44:24');
INSERT INTO `hotel_recharge_record` VALUES (54, 8, 80.00, '微信', '2024-05-01 13:44:31');
INSERT INTO `hotel_recharge_record` VALUES (55, 8, 10.00, '微信', '2024-05-01 13:44:50');
INSERT INTO `hotel_recharge_record` VALUES (56, 8, 298.00, '支付宝', '2024-05-01 13:45:13');
INSERT INTO `hotel_recharge_record` VALUES (57, 8, 298.00, '支付宝', '2024-05-01 13:45:15');
INSERT INTO `hotel_recharge_record` VALUES (58, 8, 101.00, '支付宝', '2024-05-01 13:45:23');
INSERT INTO `hotel_recharge_record` VALUES (59, 8, 10.00, '支付宝', '2024-05-01 13:45:29');

-- ----------------------------
-- Table structure for hotel_room
-- ----------------------------
DROP TABLE IF EXISTS `hotel_room`;
CREATE TABLE `hotel_room`  (
  `room_id` int NOT NULL AUTO_INCREMENT COMMENT '房间ID',
  `room_number` int NULL DEFAULT NULL COMMENT '房间号',
  `floor_number` int NULL DEFAULT NULL COMMENT '房间楼层',
  `room_type_id` int NULL DEFAULT NULL COMMENT '房型ID，关联酒店房型表',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房间状态（空闲/已预订/已入住/冻结）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`room_id`) USING BTREE,
  INDEX `hotel_room_ibfk_1`(`room_type_id` ASC) USING BTREE,
  CONSTRAINT `hotel_room_ibfk_1` FOREIGN KEY (`room_type_id`) REFERENCES `hotel_room_type` (`room_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '酒店房间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_room
-- ----------------------------
INSERT INTO `hotel_room` VALUES (1, 118, 1, 1, '空闲', '2024-04-16 17:21:35', '2024-04-30 19:14:15');
INSERT INTO `hotel_room` VALUES (2, 221, 2, 4, '已预订', '2024-04-16 17:29:55', '2024-04-30 19:48:54');
INSERT INTO `hotel_room` VALUES (3, 108, 1, 7, '已预订', '2024-04-16 17:30:02', '2024-04-22 12:35:53');
INSERT INTO `hotel_room` VALUES (4, 330, 3, 3, '空闲', '2024-04-16 22:54:43', '2024-05-01 13:16:22');
INSERT INTO `hotel_room` VALUES (5, 466, 4, 6, '已入住', '2024-04-16 23:23:05', '2024-04-22 11:27:29');
INSERT INTO `hotel_room` VALUES (6, 502, 5, 3, '已入住', '2024-04-16 23:56:58', '2024-04-21 16:42:35');
INSERT INTO `hotel_room` VALUES (8, 666, 6, 4, '空闲', '2024-04-17 01:09:56', '2024-04-29 00:38:01');
INSERT INTO `hotel_room` VALUES (9, 916, 9, 3, '已入住', '2024-04-17 08:41:48', '2024-04-22 11:26:54');
INSERT INTO `hotel_room` VALUES (10, 102, 1, 1, '已入住', '2024-04-17 08:46:56', '2024-04-29 00:35:37');
INSERT INTO `hotel_room` VALUES (11, 525, 5, 1, '已入住', '2024-04-17 08:50:00', '2024-04-22 11:26:38');
INSERT INTO `hotel_room` VALUES (12, 212, 2, 1, '空闲', '2024-04-22 12:59:38', '2024-04-22 13:00:57');
INSERT INTO `hotel_room` VALUES (13, 701, 7, 2, '空闲', '2024-04-22 13:04:37', '2024-04-22 13:04:42');
INSERT INTO `hotel_room` VALUES (14, 803, 8, 4, '空闲', '2024-04-22 13:04:53', '2024-04-30 23:13:18');
INSERT INTO `hotel_room` VALUES (15, 705, 7, 1, '空闲', '2024-04-22 13:05:38', '2024-04-22 13:05:57');
INSERT INTO `hotel_room` VALUES (16, 811, 8, 1, '空闲', '2024-04-22 13:06:12', '2024-04-22 13:06:30');
INSERT INTO `hotel_room` VALUES (17, 812, 8, 1, '空闲', '2024-04-22 13:06:37', '2024-04-30 19:22:04');
INSERT INTO `hotel_room` VALUES (18, 721, 7, 7, '空闲', '2024-04-22 13:07:35', '2024-04-29 00:38:14');
INSERT INTO `hotel_room` VALUES (19, 888, 8, 5, '空闲', '2024-05-01 13:22:40', '2024-05-01 13:22:40');

-- ----------------------------
-- Table structure for hotel_room_type
-- ----------------------------
DROP TABLE IF EXISTS `hotel_room_type`;
CREATE TABLE `hotel_room_type`  (
  `room_type_id` int NOT NULL AUTO_INCREMENT COMMENT '房型ID',
  `type_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房型名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '房型价格',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房型图片',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房型状态(正常|冻结)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`room_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '酒店房型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_room_type
-- ----------------------------
INSERT INTO `hotel_room_type` VALUES (1, '标准间', 188.00, 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/293f374b-cdc1-416d-96e6-30dea1eb4d13.jpg', '标准客房宽敞明亮，采用大窗户设计，可欣赏商业区的景致，享有舒适的休闲时光，可使用健身中心和游泳池，提供免费WiFi、迷你冰箱、电热水壶、平板电视和私人入口。', '正常', '2024-04-16 09:50:39', '2024-04-29 20:17:55');
INSERT INTO `hotel_room_type` VALUES (2, '大床房', 288.00, 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/eb8534a4-8715-4564-b1a9-9803f4018b52.jpg', '大床房拥有标准间的全部设施，空间更加宽敞，提供空调、阳台、免费高速WiFi，以及带平板电视、迷你吧、保险箱和沏茶/咖啡设施的休息区。浴室提供吹风机和淋浴。', '正常', '2024-04-16 09:57:29', '2024-04-29 20:22:01');
INSERT INTO `hotel_room_type` VALUES (3, '双床房', 328.00, 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/14bab162-1cd0-4a7f-a8f7-f1bb58811add.jpg', '宽敞的双床间提供空调、私人入口以及带步入式淋浴间和浴缸的私人浴室。双床间铺有地毯，设有带有线电视的休息区、隔音墙、迷你吧以及沏茶/咖啡设施。', '正常', '2024-04-16 09:57:59', '2024-04-29 20:23:23');
INSERT INTO `hotel_room_type` VALUES (4, '豪华双床房', 368.00, 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/f6016931-0bb4-4646-8078-7b7509b67598.jpg', '宽敞的双床间提供空调、私人入口以及带步入式淋浴间和浴缸的私人浴室。双床间铺有地毯，提供带有线电视的休息区、隔音墙、迷你吧以及沏茶/咖啡设施。', '正常', '2024-04-16 09:59:14', '2024-04-29 20:42:28');
INSERT INTO `hotel_room_type` VALUES (5, '行政套房', 1688.00, 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/b4bc70c4-b328-4d25-a10b-5c62e34e8d0f.jpg', '套房享有宽敞的空间，提供客人所需的所有舒适设施，享有一览无余的景致。特大号床提供奢华的枕头、柔软的床单和绒毛毯，供客人感受额外的奢华感。', '正常', '2024-04-16 11:45:34', '2024-04-29 20:42:09');
INSERT INTO `hotel_room_type` VALUES (6, '豪华单间', 328.00, 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/9e3b0fb4-5f79-4015-8692-61c9e47055bc.jpg', '这间双床/双人间提供休息区、迷你吧和平板电视，铺有地毯，提供休息区、隔音墙、迷你吧以及沏茶/咖啡设施。客房位于51层以上，享有壮观的城市全景。', '正常', '2024-04-16 11:57:40', '2024-04-29 20:32:33');
INSERT INTO `hotel_room_type` VALUES (7, '豪华套房', 1288.00, 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/1f7ae341-fea2-4461-82b9-b62355bcd4fe.jpg', '这间豪华套房拥有别致的当代装饰和花瓣设计，客人可以从宽大的窗户欣赏到迷人的城市景观。套房设有入口区，提供各种现代化的设施。浴室配有大浴缸和独立淋浴。', '正常', '2024-04-16 15:10:04', '2024-04-29 20:36:30');
INSERT INTO `hotel_room_type` VALUES (8, '家庭套房', 998.00, 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/910d7685-9a66-4512-953e-408362eedf58.jpg', '度过一个难忘的家庭假期——这里拥有充足的空间和现代化的设施，让您的住宿尽可能无忧无虑、轻松自在。家庭套房配有特殊的儿童设施、舒适的起居室和可选的连通房。', '正常', '2024-04-29 20:41:25', '2024-04-29 20:42:15');
INSERT INTO `hotel_room_type` VALUES (9, '尊享公寓', 3688.00, 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/5cfdb401-e07c-46cc-92c5-677c578109a4.jpg', '享受商务酒廊的使用权，还有咖啡机和免费早餐等其他出色设施，让您开启新的一天。宽敞的一室公寓提供热水浴池、空调、洗衣机以及带步入式淋浴间和浴缸的私人浴室', '正常', '2024-04-29 20:45:37', '2024-04-29 20:45:50');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `log_id` int NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID，关联系统用户表',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作行为',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发出请求的IP',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP归属地',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '日志记录时间',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1412 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 1, '数据获取：酒店运营数据总览', '59.55.32.13', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 00:52:01');
INSERT INTO `sys_log` VALUES (2, 1, '数据获取：酒店运营数据总览', '52.195.195.162', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-04-29 00:56:07');
INSERT INTO `sys_log` VALUES (3, 1, '数据获取：酒店运营数据总览', '104.28.209.183', '美国', 'DataStatisticsController.getTodayData()', '2024-04-29 00:56:54');
INSERT INTO `sys_log` VALUES (4, 1, '数据获取：酒店运营数据总览', '13.212.30.186', '美国康涅狄格', 'DataStatisticsController.getTodayData()', '2024-04-29 00:57:22');
INSERT INTO `sys_log` VALUES (5, 1, '数据获取：酒店运营数据总览', '178.173.238.110', '澳大利亚新南威尔士悉尼', 'DataStatisticsController.getTodayData()', '2024-04-29 00:58:09');
INSERT INTO `sys_log` VALUES (6, 1, '数据获取：酒店运营数据总览', '3.35.164.116', '韩国首尔', 'DataStatisticsController.getTodayData()', '2024-04-29 00:58:31');
INSERT INTO `sys_log` VALUES (7, 1, '数据获取：酒店运营数据总览', '104.28.254.74', '美国', 'DataStatisticsController.getTodayData()', '2024-04-29 00:58:52');
INSERT INTO `sys_log` VALUES (8, 1, '数据获取：酒店运营数据总览', '139.185.35.67', '阿联酋', 'DataStatisticsController.getTodayData()', '2024-04-29 00:59:16');
INSERT INTO `sys_log` VALUES (9, 1, '数据获取：酒店运营数据总览', '94.46.187.244', '英国Coventry', 'DataStatisticsController.getTodayData()', '2024-04-29 01:00:53');
INSERT INTO `sys_log` VALUES (10, 1, '数据获取：酒店运营数据总览', '18.184.43.175', '德国法兰克福', 'DataStatisticsController.getTodayData()', '2024-04-29 01:02:59');
INSERT INTO `sys_log` VALUES (11, 1, '数据获取：酒店运营数据总览', '65.2.188.201', '印度马哈拉施特拉孟买', 'DataStatisticsController.getTodayData()', '2024-04-29 01:03:21');
INSERT INTO `sys_log` VALUES (12, 1, '数据获取：酒店运营数据总览', '185.219.133.128', '土耳其', 'DataStatisticsController.getTodayData()', '2024-04-29 01:03:54');
INSERT INTO `sys_log` VALUES (13, 1, '数据获取：酒店运营数据总览', '31.40.212.184', '保加利亚Sofia', 'DataStatisticsController.getTodayData()', '2024-04-29 01:04:57');
INSERT INTO `sys_log` VALUES (14, 1, '数据获取：酒店运营数据总览', '104.28.246.146', '美国', 'DataStatisticsController.getTodayData()', '2024-04-29 01:06:18');
INSERT INTO `sys_log` VALUES (15, 1, '数据获取：酒店运营数据总览', '155.248.193.129', '美国加利福尼亚', 'DataStatisticsController.getTodayData()', '2024-04-29 01:06:45');
INSERT INTO `sys_log` VALUES (16, 1, '数据获取：员工列表', '52.195.195.162', '日本东京都东京', 'SysUserController.listRoles()', '2024-04-29 02:29:44');
INSERT INTO `sys_log` VALUES (17, 1, '数据获取：日历房态', '52.195.195.162', '日本东京都东京', 'HotelRoomCalendarController.getMonthData()', '2024-04-29 02:29:47');
INSERT INTO `sys_log` VALUES (18, 1, '数据获取：员工列表', '52.195.195.162', '日本东京都东京', 'SysUserController.listRoles()', '2024-04-29 02:29:57');
INSERT INTO `sys_log` VALUES (19, 1, '数据获取：员工列表', '52.195.195.162', '日本东京都东京', 'SysUserController.listRoles()', '2024-04-29 02:38:43');
INSERT INTO `sys_log` VALUES (20, 1, '数据获取：酒店运营数据总览', '52.195.195.162', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-04-29 02:41:07');
INSERT INTO `sys_log` VALUES (21, 1, '数据获取：酒店运营数据总览', '52.195.195.162', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-04-29 02:42:18');
INSERT INTO `sys_log` VALUES (22, 1, '数据获取：酒店运营数据总览', '52.195.195.162', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-04-29 02:43:49');
INSERT INTO `sys_log` VALUES (23, 1, '数据获取：酒店运营数据总览', '52.195.195.162', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-04-29 02:47:34');
INSERT INTO `sys_log` VALUES (24, 1, '数据获取：酒店运营数据总览', '52.195.195.162', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-04-29 02:48:48');
INSERT INTO `sys_log` VALUES (25, 1, '数据获取：酒店运营数据总览', '52.195.195.162', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-04-29 02:54:08');
INSERT INTO `sys_log` VALUES (26, 1, '数据获取：酒店运营数据总览', '52.195.195.162', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-04-29 02:54:20');
INSERT INTO `sys_log` VALUES (27, 1, '数据获取：员工列表', '52.195.195.162', '日本东京都东京', 'SysUserController.listRoles()', '2024-04-29 02:54:26');
INSERT INTO `sys_log` VALUES (28, 1, '数据获取：员工列表', '52.195.195.162', '日本东京都东京', 'SysUserController.listRoles()', '2024-04-29 02:54:55');
INSERT INTO `sys_log` VALUES (29, 1, '数据获取：员工列表', '52.195.195.162', '日本东京都东京', 'SysUserController.listRoles()', '2024-04-29 02:55:20');
INSERT INTO `sys_log` VALUES (30, 1, '数据获取：员工列表', '52.195.195.162', '日本东京都东京', 'SysUserController.listRoles()', '2024-04-29 03:00:17');
INSERT INTO `sys_log` VALUES (31, 1, '数据获取：员工列表', '52.195.195.162', '日本东京都东京', 'SysUserController.listRoles()', '2024-04-29 03:00:47');
INSERT INTO `sys_log` VALUES (32, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 17:10:42');
INSERT INTO `sys_log` VALUES (33, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-29 17:10:47');
INSERT INTO `sys_log` VALUES (34, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-29 17:11:39');
INSERT INTO `sys_log` VALUES (35, 1, '数据获取：用户列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.list()', '2024-04-29 17:11:39');
INSERT INTO `sys_log` VALUES (36, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-29 17:11:39');
INSERT INTO `sys_log` VALUES (37, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-29 17:15:19');
INSERT INTO `sys_log` VALUES (38, 1, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.rechargeMember()', '2024-04-29 17:15:25');
INSERT INTO `sys_log` VALUES (39, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-29 17:15:26');
INSERT INTO `sys_log` VALUES (40, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-29 17:15:30');
INSERT INTO `sys_log` VALUES (41, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-29 17:52:03');
INSERT INTO `sys_log` VALUES (42, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 17:53:08');
INSERT INTO `sys_log` VALUES (43, 1, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getUserInfo()', '2024-04-29 17:53:19');
INSERT INTO `sys_log` VALUES (44, 1, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getWeather()', '2024-04-29 17:53:21');
INSERT INTO `sys_log` VALUES (45, 1, '数据获取：入住信息列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getCheckinList()', '2024-04-29 17:53:25');
INSERT INTO `sys_log` VALUES (46, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-29 17:53:27');
INSERT INTO `sys_log` VALUES (47, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-29 17:53:28');
INSERT INTO `sys_log` VALUES (48, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 17:53:28');
INSERT INTO `sys_log` VALUES (49, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 17:53:30');
INSERT INTO `sys_log` VALUES (50, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 17:53:33');
INSERT INTO `sys_log` VALUES (51, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 17:53:33');
INSERT INTO `sys_log` VALUES (52, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 17:53:35');
INSERT INTO `sys_log` VALUES (53, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-29 17:53:44');
INSERT INTO `sys_log` VALUES (54, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-29 17:53:45');
INSERT INTO `sys_log` VALUES (55, 1, '数据获取：用户列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.list()', '2024-04-29 17:53:45');
INSERT INTO `sys_log` VALUES (56, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-29 17:53:48');
INSERT INTO `sys_log` VALUES (57, 1, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getUserInfo()', '2024-04-29 17:53:51');
INSERT INTO `sys_log` VALUES (58, 1, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getWeather()', '2024-04-29 17:53:51');
INSERT INTO `sys_log` VALUES (59, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-29 17:57:13');
INSERT INTO `sys_log` VALUES (60, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-29 17:58:02');
INSERT INTO `sys_log` VALUES (61, 1, '数据获取：入住信息列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getCheckinList()', '2024-04-29 17:59:48');
INSERT INTO `sys_log` VALUES (62, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-29 18:00:50');
INSERT INTO `sys_log` VALUES (63, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-29 18:03:59');
INSERT INTO `sys_log` VALUES (64, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 18:07:06');
INSERT INTO `sys_log` VALUES (65, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 18:49:42');
INSERT INTO `sys_log` VALUES (66, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 18:50:30');
INSERT INTO `sys_log` VALUES (67, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 18:54:17');
INSERT INTO `sys_log` VALUES (68, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 18:59:26');
INSERT INTO `sys_log` VALUES (69, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:01:20');
INSERT INTO `sys_log` VALUES (70, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:01:22');
INSERT INTO `sys_log` VALUES (71, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:01:35');
INSERT INTO `sys_log` VALUES (72, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:01:38');
INSERT INTO `sys_log` VALUES (73, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:01:49');
INSERT INTO `sys_log` VALUES (74, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:01:53');
INSERT INTO `sys_log` VALUES (75, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:02:08');
INSERT INTO `sys_log` VALUES (76, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:02:14');
INSERT INTO `sys_log` VALUES (77, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:02:51');
INSERT INTO `sys_log` VALUES (78, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:03:14');
INSERT INTO `sys_log` VALUES (79, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:03:15');
INSERT INTO `sys_log` VALUES (80, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:03:23');
INSERT INTO `sys_log` VALUES (81, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:03:30');
INSERT INTO `sys_log` VALUES (82, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:04:39');
INSERT INTO `sys_log` VALUES (83, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:13:37');
INSERT INTO `sys_log` VALUES (84, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:14:12');
INSERT INTO `sys_log` VALUES (85, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:14:39');
INSERT INTO `sys_log` VALUES (86, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:17:11');
INSERT INTO `sys_log` VALUES (87, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:17:42');
INSERT INTO `sys_log` VALUES (88, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:17:52');
INSERT INTO `sys_log` VALUES (89, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:18:10');
INSERT INTO `sys_log` VALUES (90, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:19:39');
INSERT INTO `sys_log` VALUES (91, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:19:55');
INSERT INTO `sys_log` VALUES (92, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:20:02');
INSERT INTO `sys_log` VALUES (93, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:20:21');
INSERT INTO `sys_log` VALUES (94, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:20:34');
INSERT INTO `sys_log` VALUES (95, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:20:41');
INSERT INTO `sys_log` VALUES (96, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:20:47');
INSERT INTO `sys_log` VALUES (97, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:20:54');
INSERT INTO `sys_log` VALUES (98, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:21:00');
INSERT INTO `sys_log` VALUES (99, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:21:30');
INSERT INTO `sys_log` VALUES (100, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:21:39');
INSERT INTO `sys_log` VALUES (101, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:21:43');
INSERT INTO `sys_log` VALUES (102, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:21:58');
INSERT INTO `sys_log` VALUES (103, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:22:09');
INSERT INTO `sys_log` VALUES (104, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:22:48');
INSERT INTO `sys_log` VALUES (105, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:22:51');
INSERT INTO `sys_log` VALUES (106, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 19:23:56');
INSERT INTO `sys_log` VALUES (107, 1, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getUserInfo()', '2024-04-29 19:29:03');
INSERT INTO `sys_log` VALUES (108, 1, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getWeather()', '2024-04-29 19:29:04');
INSERT INTO `sys_log` VALUES (109, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-29 19:29:07');
INSERT INTO `sys_log` VALUES (110, 1, '数据获取：入住信息列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getCheckinList()', '2024-04-29 19:29:08');
INSERT INTO `sys_log` VALUES (111, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-29 19:29:09');
INSERT INTO `sys_log` VALUES (112, 1, '数据获取：入住信息列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getCheckinList()', '2024-04-29 19:29:38');
INSERT INTO `sys_log` VALUES (113, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-29 19:29:41');
INSERT INTO `sys_log` VALUES (114, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 19:29:43');
INSERT INTO `sys_log` VALUES (115, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-29 19:29:43');
INSERT INTO `sys_log` VALUES (116, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 19:29:45');
INSERT INTO `sys_log` VALUES (117, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-29 19:29:47');
INSERT INTO `sys_log` VALUES (118, 1, '数据获取：用户列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.list()', '2024-04-29 19:29:52');
INSERT INTO `sys_log` VALUES (119, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-29 19:29:52');
INSERT INTO `sys_log` VALUES (120, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-29 19:29:54');
INSERT INTO `sys_log` VALUES (121, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-29 19:30:00');
INSERT INTO `sys_log` VALUES (122, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:00:11');
INSERT INTO `sys_log` VALUES (123, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-29 20:00:11');
INSERT INTO `sys_log` VALUES (124, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-29 20:00:13');
INSERT INTO `sys_log` VALUES (125, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:00:14');
INSERT INTO `sys_log` VALUES (126, 1, '系统功能：上传文件', '115.148.108.53', '中国江西省赣州市', 'FileUploadController.upload()', '2024-04-29 20:06:32');
INSERT INTO `sys_log` VALUES (127, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:06:52');
INSERT INTO `sys_log` VALUES (128, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:06:52');
INSERT INTO `sys_log` VALUES (129, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:09:20');
INSERT INTO `sys_log` VALUES (130, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:09:30');
INSERT INTO `sys_log` VALUES (131, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:09:37');
INSERT INTO `sys_log` VALUES (132, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:10:28');
INSERT INTO `sys_log` VALUES (133, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:13:07');
INSERT INTO `sys_log` VALUES (134, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:13:08');
INSERT INTO `sys_log` VALUES (135, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:13:10');
INSERT INTO `sys_log` VALUES (136, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:13:10');
INSERT INTO `sys_log` VALUES (137, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:13:17');
INSERT INTO `sys_log` VALUES (138, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:13:22');
INSERT INTO `sys_log` VALUES (139, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:16:42');
INSERT INTO `sys_log` VALUES (140, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:16:44');
INSERT INTO `sys_log` VALUES (141, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:16:45');
INSERT INTO `sys_log` VALUES (142, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:16:46');
INSERT INTO `sys_log` VALUES (143, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:17:56');
INSERT INTO `sys_log` VALUES (144, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:17:56');
INSERT INTO `sys_log` VALUES (145, 1, '系统功能：上传文件', '115.148.108.53', '中国江西省赣州市', 'FileUploadController.upload()', '2024-04-29 20:19:50');
INSERT INTO `sys_log` VALUES (146, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:20:58');
INSERT INTO `sys_log` VALUES (147, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:20:58');
INSERT INTO `sys_log` VALUES (148, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:21:06');
INSERT INTO `sys_log` VALUES (149, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:21:06');
INSERT INTO `sys_log` VALUES (150, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:21:35');
INSERT INTO `sys_log` VALUES (151, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:21:36');
INSERT INTO `sys_log` VALUES (152, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:21:54');
INSERT INTO `sys_log` VALUES (153, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:21:54');
INSERT INTO `sys_log` VALUES (154, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:22:02');
INSERT INTO `sys_log` VALUES (155, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:22:02');
INSERT INTO `sys_log` VALUES (156, 1, '系统功能：上传文件', '115.148.108.53', '中国江西省赣州市', 'FileUploadController.upload()', '2024-04-29 20:23:00');
INSERT INTO `sys_log` VALUES (157, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:23:17');
INSERT INTO `sys_log` VALUES (158, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:23:17');
INSERT INTO `sys_log` VALUES (159, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:23:17');
INSERT INTO `sys_log` VALUES (160, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:23:17');
INSERT INTO `sys_log` VALUES (161, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:23:23');
INSERT INTO `sys_log` VALUES (162, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:23:23');
INSERT INTO `sys_log` VALUES (163, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:24:13');
INSERT INTO `sys_log` VALUES (164, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:24:18');
INSERT INTO `sys_log` VALUES (165, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:24:31');
INSERT INTO `sys_log` VALUES (166, 1, '系统功能：上传文件', '115.148.108.53', '中国江西省赣州市', 'FileUploadController.upload()', '2024-04-29 20:25:06');
INSERT INTO `sys_log` VALUES (167, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:25:09');
INSERT INTO `sys_log` VALUES (168, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:25:09');
INSERT INTO `sys_log` VALUES (169, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:25:13');
INSERT INTO `sys_log` VALUES (170, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:25:13');
INSERT INTO `sys_log` VALUES (171, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:25:14');
INSERT INTO `sys_log` VALUES (172, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:25:17');
INSERT INTO `sys_log` VALUES (173, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:25:32');
INSERT INTO `sys_log` VALUES (174, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:25:33');
INSERT INTO `sys_log` VALUES (175, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:25:34');
INSERT INTO `sys_log` VALUES (176, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:25:37');
INSERT INTO `sys_log` VALUES (177, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:25:38');
INSERT INTO `sys_log` VALUES (178, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:25:39');
INSERT INTO `sys_log` VALUES (179, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:25:40');
INSERT INTO `sys_log` VALUES (180, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:25:59');
INSERT INTO `sys_log` VALUES (181, 1, '系统功能：上传文件', '115.148.108.53', '中国江西省赣州市', 'FileUploadController.upload()', '2024-04-29 20:28:41');
INSERT INTO `sys_log` VALUES (182, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:29:13');
INSERT INTO `sys_log` VALUES (183, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:29:13');
INSERT INTO `sys_log` VALUES (184, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:30:22');
INSERT INTO `sys_log` VALUES (185, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:30:41');
INSERT INTO `sys_log` VALUES (186, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:30:44');
INSERT INTO `sys_log` VALUES (187, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:30:54');
INSERT INTO `sys_log` VALUES (188, 1, '系统功能：上传文件', '115.148.108.53', '中国江西省赣州市', 'FileUploadController.upload()', '2024-04-29 20:31:01');
INSERT INTO `sys_log` VALUES (189, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:31:23');
INSERT INTO `sys_log` VALUES (190, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:31:23');
INSERT INTO `sys_log` VALUES (191, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:32:16');
INSERT INTO `sys_log` VALUES (192, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:32:16');
INSERT INTO `sys_log` VALUES (193, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:32:34');
INSERT INTO `sys_log` VALUES (194, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:32:34');
INSERT INTO `sys_log` VALUES (195, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:32:41');
INSERT INTO `sys_log` VALUES (196, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:32:42');
INSERT INTO `sys_log` VALUES (197, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:34:46');
INSERT INTO `sys_log` VALUES (198, 1, '系统功能：上传文件', '115.148.108.53', '中国江西省赣州市', 'FileUploadController.upload()', '2024-04-29 20:35:17');
INSERT INTO `sys_log` VALUES (199, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:35:34');
INSERT INTO `sys_log` VALUES (200, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:35:34');
INSERT INTO `sys_log` VALUES (201, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:35:37');
INSERT INTO `sys_log` VALUES (202, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:35:43');
INSERT INTO `sys_log` VALUES (203, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:36:11');
INSERT INTO `sys_log` VALUES (204, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:36:11');
INSERT INTO `sys_log` VALUES (205, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:36:24');
INSERT INTO `sys_log` VALUES (206, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:36:25');
INSERT INTO `sys_log` VALUES (207, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:36:30');
INSERT INTO `sys_log` VALUES (208, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:36:31');
INSERT INTO `sys_log` VALUES (209, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:36:47');
INSERT INTO `sys_log` VALUES (210, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:36:57');
INSERT INTO `sys_log` VALUES (211, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:36:59');
INSERT INTO `sys_log` VALUES (212, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:37:02');
INSERT INTO `sys_log` VALUES (213, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:37:34');
INSERT INTO `sys_log` VALUES (214, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:37:45');
INSERT INTO `sys_log` VALUES (215, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:37:50');
INSERT INTO `sys_log` VALUES (216, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:37:53');
INSERT INTO `sys_log` VALUES (217, 1, '系统功能：上传文件', '115.148.108.53', '中国江西省赣州市', 'FileUploadController.upload()', '2024-04-29 20:41:03');
INSERT INTO `sys_log` VALUES (218, 1, '业务处理：添加酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.addHotelRoomType()', '2024-04-29 20:41:26');
INSERT INTO `sys_log` VALUES (219, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:41:26');
INSERT INTO `sys_log` VALUES (220, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:41:44');
INSERT INTO `sys_log` VALUES (221, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:41:44');
INSERT INTO `sys_log` VALUES (222, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:41:55');
INSERT INTO `sys_log` VALUES (223, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:41:59');
INSERT INTO `sys_log` VALUES (224, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:42:01');
INSERT INTO `sys_log` VALUES (225, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:42:10');
INSERT INTO `sys_log` VALUES (226, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:42:10');
INSERT INTO `sys_log` VALUES (227, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:42:11');
INSERT INTO `sys_log` VALUES (228, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:42:15');
INSERT INTO `sys_log` VALUES (229, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:42:16');
INSERT INTO `sys_log` VALUES (230, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:42:17');
INSERT INTO `sys_log` VALUES (231, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:42:28');
INSERT INTO `sys_log` VALUES (232, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:42:28');
INSERT INTO `sys_log` VALUES (233, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:42:30');
INSERT INTO `sys_log` VALUES (234, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:42:32');
INSERT INTO `sys_log` VALUES (235, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:42:34');
INSERT INTO `sys_log` VALUES (236, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:42:36');
INSERT INTO `sys_log` VALUES (237, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:42:38');
INSERT INTO `sys_log` VALUES (238, 1, '系统功能：上传文件', '115.148.108.53', '中国江西省赣州市', 'FileUploadController.upload()', '2024-04-29 20:44:38');
INSERT INTO `sys_log` VALUES (239, 1, '业务处理：添加酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.addHotelRoomType()', '2024-04-29 20:45:37');
INSERT INTO `sys_log` VALUES (240, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:45:37');
INSERT INTO `sys_log` VALUES (241, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:45:46');
INSERT INTO `sys_log` VALUES (242, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:45:46');
INSERT INTO `sys_log` VALUES (243, 1, '业务处理：更新酒店房间类型', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.updateHotelRoomType()', '2024-04-29 20:45:51');
INSERT INTO `sys_log` VALUES (244, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:45:51');
INSERT INTO `sys_log` VALUES (245, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:47:04');
INSERT INTO `sys_log` VALUES (246, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:47:05');
INSERT INTO `sys_log` VALUES (247, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:47:05');
INSERT INTO `sys_log` VALUES (248, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:47:06');
INSERT INTO `sys_log` VALUES (249, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:47:08');
INSERT INTO `sys_log` VALUES (250, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:47:09');
INSERT INTO `sys_log` VALUES (251, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:47:19');
INSERT INTO `sys_log` VALUES (252, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:47:20');
INSERT INTO `sys_log` VALUES (253, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:47:21');
INSERT INTO `sys_log` VALUES (254, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:47:23');
INSERT INTO `sys_log` VALUES (255, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:47:24');
INSERT INTO `sys_log` VALUES (256, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:47:31');
INSERT INTO `sys_log` VALUES (257, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:47:37');
INSERT INTO `sys_log` VALUES (258, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:47:39');
INSERT INTO `sys_log` VALUES (259, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:47:40');
INSERT INTO `sys_log` VALUES (260, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:47:49');
INSERT INTO `sys_log` VALUES (261, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:47:54');
INSERT INTO `sys_log` VALUES (262, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:48:18');
INSERT INTO `sys_log` VALUES (263, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:48:55');
INSERT INTO `sys_log` VALUES (264, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-29 20:48:55');
INSERT INTO `sys_log` VALUES (265, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-29 20:48:59');
INSERT INTO `sys_log` VALUES (266, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-29 20:49:01');
INSERT INTO `sys_log` VALUES (267, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-29 20:49:08');
INSERT INTO `sys_log` VALUES (268, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-29 20:49:09');
INSERT INTO `sys_log` VALUES (269, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:49:12');
INSERT INTO `sys_log` VALUES (270, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-29 20:49:13');
INSERT INTO `sys_log` VALUES (271, 1, '数据获取：入住信息列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getCheckinList()', '2024-04-29 20:49:15');
INSERT INTO `sys_log` VALUES (272, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-29 20:49:17');
INSERT INTO `sys_log` VALUES (273, 1, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getUserInfo()', '2024-04-29 20:49:19');
INSERT INTO `sys_log` VALUES (274, 1, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getWeather()', '2024-04-29 20:49:19');
INSERT INTO `sys_log` VALUES (275, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 20:49:21');
INSERT INTO `sys_log` VALUES (276, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-29 20:49:24');
INSERT INTO `sys_log` VALUES (277, 1, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getUserInfo()', '2024-04-29 20:55:56');
INSERT INTO `sys_log` VALUES (278, 1, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getWeather()', '2024-04-29 20:55:57');
INSERT INTO `sys_log` VALUES (279, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-29 20:55:58');
INSERT INTO `sys_log` VALUES (280, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-29 20:56:02');
INSERT INTO `sys_log` VALUES (281, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-29 20:56:05');
INSERT INTO `sys_log` VALUES (282, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-29 20:56:15');
INSERT INTO `sys_log` VALUES (283, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-29 20:56:20');
INSERT INTO `sys_log` VALUES (284, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-29 20:56:21');
INSERT INTO `sys_log` VALUES (285, 1, '业务处理：更新用户信息', '115.148.108.53', '中国江西省赣州市', 'SysUserController.updateByAdmin()', '2024-04-29 20:56:22');
INSERT INTO `sys_log` VALUES (286, 1, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.rechargeMember()', '2024-04-29 20:56:29');
INSERT INTO `sys_log` VALUES (287, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-29 20:56:29');
INSERT INTO `sys_log` VALUES (288, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-29 20:56:33');
INSERT INTO `sys_log` VALUES (289, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-29 20:56:34');
INSERT INTO `sys_log` VALUES (290, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-29 20:56:37');
INSERT INTO `sys_log` VALUES (291, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-29 20:57:26');
INSERT INTO `sys_log` VALUES (292, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-29 20:57:28');
INSERT INTO `sys_log` VALUES (293, 1, '业务处理：房间预订', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.reserveHotelRoom()', '2024-04-29 20:57:41');
INSERT INTO `sys_log` VALUES (294, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-29 20:57:41');
INSERT INTO `sys_log` VALUES (295, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-29 20:57:44');
INSERT INTO `sys_log` VALUES (296, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 20:58:14');
INSERT INTO `sys_log` VALUES (297, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-29 20:58:19');
INSERT INTO `sys_log` VALUES (298, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-29 20:58:21');
INSERT INTO `sys_log` VALUES (299, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-29 21:01:22');
INSERT INTO `sys_log` VALUES (300, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-29 21:01:42');
INSERT INTO `sys_log` VALUES (301, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 21:04:44');
INSERT INTO `sys_log` VALUES (302, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-29 21:45:19');
INSERT INTO `sys_log` VALUES (303, 1, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getUserInfo()', '2024-04-29 23:08:01');
INSERT INTO `sys_log` VALUES (304, 1, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getWeather()', '2024-04-29 23:08:01');
INSERT INTO `sys_log` VALUES (305, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-29 23:35:58');
INSERT INTO `sys_log` VALUES (306, 1, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-04-29 23:47:18');
INSERT INTO `sys_log` VALUES (307, 1, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-04-30 00:08:13');
INSERT INTO `sys_log` VALUES (308, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-30 00:08:23');
INSERT INTO `sys_log` VALUES (309, 1, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-04-30 00:22:39');
INSERT INTO `sys_log` VALUES (310, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-30 00:22:43');
INSERT INTO `sys_log` VALUES (311, 1, '系统功能：用户退出登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.logout()', '2024-04-30 00:22:50');
INSERT INTO `sys_log` VALUES (312, 1, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-04-30 00:23:42');
INSERT INTO `sys_log` VALUES (313, 1, '系统功能：用户退出登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.logout()', '2024-04-30 00:23:43');
INSERT INTO `sys_log` VALUES (314, 9, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-04-30 00:24:27');
INSERT INTO `sys_log` VALUES (315, 10, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-04-30 00:24:30');
INSERT INTO `sys_log` VALUES (316, 14, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-04-30 00:24:31');
INSERT INTO `sys_log` VALUES (317, 1, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-04-30 00:48:03');
INSERT INTO `sys_log` VALUES (318, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-30 00:48:03');
INSERT INTO `sys_log` VALUES (319, 1, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-04-30 00:50:13');
INSERT INTO `sys_log` VALUES (320, 1, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-04-30 00:50:53');
INSERT INTO `sys_log` VALUES (321, 1, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-04-30 00:52:33');
INSERT INTO `sys_log` VALUES (322, 1, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-04-30 00:55:47');
INSERT INTO `sys_log` VALUES (323, 1, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-04-30 01:00:10');
INSERT INTO `sys_log` VALUES (324, 1, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-04-30 01:00:26');
INSERT INTO `sys_log` VALUES (325, 1, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-04-30 01:01:43');
INSERT INTO `sys_log` VALUES (326, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-30 01:01:48');
INSERT INTO `sys_log` VALUES (327, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-30 10:15:28');
INSERT INTO `sys_log` VALUES (328, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-30 10:31:12');
INSERT INTO `sys_log` VALUES (329, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-30 10:31:12');
INSERT INTO `sys_log` VALUES (330, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-30 10:31:36');
INSERT INTO `sys_log` VALUES (331, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-30 10:31:46');
INSERT INTO `sys_log` VALUES (332, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-30 10:31:46');
INSERT INTO `sys_log` VALUES (333, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 11:00:40');
INSERT INTO `sys_log` VALUES (334, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 11:13:42');
INSERT INTO `sys_log` VALUES (335, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 11:14:50');
INSERT INTO `sys_log` VALUES (336, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-30 11:18:51');
INSERT INTO `sys_log` VALUES (337, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 11:38:54');
INSERT INTO `sys_log` VALUES (338, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 11:41:44');
INSERT INTO `sys_log` VALUES (339, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 11:41:59');
INSERT INTO `sys_log` VALUES (340, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 11:43:08');
INSERT INTO `sys_log` VALUES (341, NULL, '系统功能：用户退出登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.logout()', '2024-04-30 11:43:13');
INSERT INTO `sys_log` VALUES (342, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 11:43:27');
INSERT INTO `sys_log` VALUES (343, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 11:43:53');
INSERT INTO `sys_log` VALUES (344, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 11:44:00');
INSERT INTO `sys_log` VALUES (345, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 11:44:26');
INSERT INTO `sys_log` VALUES (346, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 11:44:28');
INSERT INTO `sys_log` VALUES (347, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 11:48:33');
INSERT INTO `sys_log` VALUES (348, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 11:48:33');
INSERT INTO `sys_log` VALUES (349, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-30 11:54:47');
INSERT INTO `sys_log` VALUES (350, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 11:55:00');
INSERT INTO `sys_log` VALUES (351, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 11:55:00');
INSERT INTO `sys_log` VALUES (352, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-30 11:55:52');
INSERT INTO `sys_log` VALUES (353, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 11:55:58');
INSERT INTO `sys_log` VALUES (354, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 11:55:58');
INSERT INTO `sys_log` VALUES (355, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-30 11:56:07');
INSERT INTO `sys_log` VALUES (356, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 11:58:02');
INSERT INTO `sys_log` VALUES (357, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 11:58:03');
INSERT INTO `sys_log` VALUES (358, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 11:59:26');
INSERT INTO `sys_log` VALUES (359, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 11:59:27');
INSERT INTO `sys_log` VALUES (360, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 11:59:32');
INSERT INTO `sys_log` VALUES (361, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 11:59:40');
INSERT INTO `sys_log` VALUES (362, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 11:59:53');
INSERT INTO `sys_log` VALUES (363, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 12:14:50');
INSERT INTO `sys_log` VALUES (364, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 12:14:50');
INSERT INTO `sys_log` VALUES (365, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 12:19:57');
INSERT INTO `sys_log` VALUES (366, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 12:20:55');
INSERT INTO `sys_log` VALUES (367, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 13:12:54');
INSERT INTO `sys_log` VALUES (368, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 13:13:17');
INSERT INTO `sys_log` VALUES (369, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 13:31:00');
INSERT INTO `sys_log` VALUES (370, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 13:31:01');
INSERT INTO `sys_log` VALUES (371, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 13:31:01');
INSERT INTO `sys_log` VALUES (372, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 13:36:33');
INSERT INTO `sys_log` VALUES (373, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 13:36:34');
INSERT INTO `sys_log` VALUES (374, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 13:38:24');
INSERT INTO `sys_log` VALUES (375, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 13:57:06');
INSERT INTO `sys_log` VALUES (376, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 13:57:07');
INSERT INTO `sys_log` VALUES (377, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 13:57:07');
INSERT INTO `sys_log` VALUES (378, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 14:06:36');
INSERT INTO `sys_log` VALUES (379, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 14:06:36');
INSERT INTO `sys_log` VALUES (380, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 14:06:36');
INSERT INTO `sys_log` VALUES (381, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 14:14:26');
INSERT INTO `sys_log` VALUES (382, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 14:14:26');
INSERT INTO `sys_log` VALUES (383, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 14:16:36');
INSERT INTO `sys_log` VALUES (384, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 14:16:36');
INSERT INTO `sys_log` VALUES (385, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 14:16:36');
INSERT INTO `sys_log` VALUES (386, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 14:39:44');
INSERT INTO `sys_log` VALUES (387, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 14:39:45');
INSERT INTO `sys_log` VALUES (388, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 14:42:52');
INSERT INTO `sys_log` VALUES (389, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 14:42:52');
INSERT INTO `sys_log` VALUES (390, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 14:42:52');
INSERT INTO `sys_log` VALUES (391, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 14:53:54');
INSERT INTO `sys_log` VALUES (392, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 14:53:55');
INSERT INTO `sys_log` VALUES (393, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 14:54:21');
INSERT INTO `sys_log` VALUES (394, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 14:54:22');
INSERT INTO `sys_log` VALUES (395, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 14:54:22');
INSERT INTO `sys_log` VALUES (396, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 14:55:34');
INSERT INTO `sys_log` VALUES (397, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 14:55:34');
INSERT INTO `sys_log` VALUES (398, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 15:01:44');
INSERT INTO `sys_log` VALUES (399, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 15:01:44');
INSERT INTO `sys_log` VALUES (400, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 15:09:00');
INSERT INTO `sys_log` VALUES (401, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 15:09:01');
INSERT INTO `sys_log` VALUES (402, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 15:16:43');
INSERT INTO `sys_log` VALUES (403, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 15:16:44');
INSERT INTO `sys_log` VALUES (404, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 15:19:01');
INSERT INTO `sys_log` VALUES (405, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 15:19:02');
INSERT INTO `sys_log` VALUES (406, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 15:24:31');
INSERT INTO `sys_log` VALUES (407, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 15:24:31');
INSERT INTO `sys_log` VALUES (408, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 15:24:56');
INSERT INTO `sys_log` VALUES (409, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 15:24:56');
INSERT INTO `sys_log` VALUES (410, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 15:26:25');
INSERT INTO `sys_log` VALUES (411, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 15:26:26');
INSERT INTO `sys_log` VALUES (412, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 15:26:36');
INSERT INTO `sys_log` VALUES (413, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 15:26:42');
INSERT INTO `sys_log` VALUES (414, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 15:26:42');
INSERT INTO `sys_log` VALUES (415, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 15:26:43');
INSERT INTO `sys_log` VALUES (416, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 15:30:38');
INSERT INTO `sys_log` VALUES (417, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 15:30:39');
INSERT INTO `sys_log` VALUES (418, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 15:31:03');
INSERT INTO `sys_log` VALUES (419, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 15:31:03');
INSERT INTO `sys_log` VALUES (420, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 15:31:03');
INSERT INTO `sys_log` VALUES (421, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 15:31:52');
INSERT INTO `sys_log` VALUES (422, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 15:31:53');
INSERT INTO `sys_log` VALUES (423, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 15:32:14');
INSERT INTO `sys_log` VALUES (424, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 15:32:15');
INSERT INTO `sys_log` VALUES (425, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 15:36:43');
INSERT INTO `sys_log` VALUES (426, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 15:36:44');
INSERT INTO `sys_log` VALUES (427, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 15:38:04');
INSERT INTO `sys_log` VALUES (428, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 15:38:04');
INSERT INTO `sys_log` VALUES (429, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 15:46:57');
INSERT INTO `sys_log` VALUES (430, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 15:46:58');
INSERT INTO `sys_log` VALUES (431, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 15:46:58');
INSERT INTO `sys_log` VALUES (432, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 15:55:41');
INSERT INTO `sys_log` VALUES (433, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 15:55:42');
INSERT INTO `sys_log` VALUES (434, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 15:55:42');
INSERT INTO `sys_log` VALUES (435, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 16:06:15');
INSERT INTO `sys_log` VALUES (436, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 16:06:16');
INSERT INTO `sys_log` VALUES (437, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 16:07:49');
INSERT INTO `sys_log` VALUES (438, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 16:07:50');
INSERT INTO `sys_log` VALUES (439, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 16:07:50');
INSERT INTO `sys_log` VALUES (440, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 16:12:42');
INSERT INTO `sys_log` VALUES (441, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 16:12:42');
INSERT INTO `sys_log` VALUES (442, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 16:12:42');
INSERT INTO `sys_log` VALUES (443, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 16:13:12');
INSERT INTO `sys_log` VALUES (444, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 16:13:13');
INSERT INTO `sys_log` VALUES (445, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 16:13:47');
INSERT INTO `sys_log` VALUES (446, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 16:13:48');
INSERT INTO `sys_log` VALUES (447, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 16:16:37');
INSERT INTO `sys_log` VALUES (448, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 16:16:37');
INSERT INTO `sys_log` VALUES (449, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 16:16:37');
INSERT INTO `sys_log` VALUES (450, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 16:17:16');
INSERT INTO `sys_log` VALUES (451, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 16:17:16');
INSERT INTO `sys_log` VALUES (452, 1, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-04-30 16:34:39');
INSERT INTO `sys_log` VALUES (453, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-30 16:34:43');
INSERT INTO `sys_log` VALUES (454, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-30 16:34:52');
INSERT INTO `sys_log` VALUES (455, 1, '数据获取：员工列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-30 16:35:22');
INSERT INTO `sys_log` VALUES (456, 1, '数据获取：角色列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-04-30 16:40:49');
INSERT INTO `sys_log` VALUES (457, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 16:45:05');
INSERT INTO `sys_log` VALUES (458, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 16:45:06');
INSERT INTO `sys_log` VALUES (459, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 16:45:06');
INSERT INTO `sys_log` VALUES (460, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 16:46:13');
INSERT INTO `sys_log` VALUES (461, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 16:46:13');
INSERT INTO `sys_log` VALUES (462, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 16:46:14');
INSERT INTO `sys_log` VALUES (463, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 16:47:45');
INSERT INTO `sys_log` VALUES (464, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 16:47:45');
INSERT INTO `sys_log` VALUES (465, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 16:47:46');
INSERT INTO `sys_log` VALUES (466, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 17:08:29');
INSERT INTO `sys_log` VALUES (467, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 17:08:30');
INSERT INTO `sys_log` VALUES (468, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 17:08:30');
INSERT INTO `sys_log` VALUES (469, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 17:09:43');
INSERT INTO `sys_log` VALUES (470, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 17:09:44');
INSERT INTO `sys_log` VALUES (471, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 17:09:44');
INSERT INTO `sys_log` VALUES (472, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 17:10:52');
INSERT INTO `sys_log` VALUES (473, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 17:10:53');
INSERT INTO `sys_log` VALUES (474, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 17:10:53');
INSERT INTO `sys_log` VALUES (475, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-04-30 18:04:32');
INSERT INTO `sys_log` VALUES (476, 1, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getUserInfo()', '2024-04-30 18:04:39');
INSERT INTO `sys_log` VALUES (477, 1, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getWeather()', '2024-04-30 18:04:40');
INSERT INTO `sys_log` VALUES (478, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-30 18:04:47');
INSERT INTO `sys_log` VALUES (479, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 18:04:50');
INSERT INTO `sys_log` VALUES (480, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 18:05:38');
INSERT INTO `sys_log` VALUES (481, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 18:06:41');
INSERT INTO `sys_log` VALUES (482, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 18:06:44');
INSERT INTO `sys_log` VALUES (483, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 18:07:14');
INSERT INTO `sys_log` VALUES (484, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 18:07:22');
INSERT INTO `sys_log` VALUES (485, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 18:07:36');
INSERT INTO `sys_log` VALUES (486, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 18:07:43');
INSERT INTO `sys_log` VALUES (487, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 18:07:49');
INSERT INTO `sys_log` VALUES (488, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 18:07:51');
INSERT INTO `sys_log` VALUES (489, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 18:07:54');
INSERT INTO `sys_log` VALUES (490, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 18:08:18');
INSERT INTO `sys_log` VALUES (491, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 18:08:20');
INSERT INTO `sys_log` VALUES (492, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 18:08:25');
INSERT INTO `sys_log` VALUES (493, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 18:08:29');
INSERT INTO `sys_log` VALUES (494, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 18:08:30');
INSERT INTO `sys_log` VALUES (495, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 18:08:31');
INSERT INTO `sys_log` VALUES (496, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 18:08:33');
INSERT INTO `sys_log` VALUES (497, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 18:08:35');
INSERT INTO `sys_log` VALUES (498, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 18:08:36');
INSERT INTO `sys_log` VALUES (499, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 18:08:51');
INSERT INTO `sys_log` VALUES (500, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-30 18:13:18');
INSERT INTO `sys_log` VALUES (501, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 18:13:19');
INSERT INTO `sys_log` VALUES (502, 1, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-04-30 19:07:21');
INSERT INTO `sys_log` VALUES (503, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:07:33');
INSERT INTO `sys_log` VALUES (504, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:08:26');
INSERT INTO `sys_log` VALUES (505, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:09:19');
INSERT INTO `sys_log` VALUES (506, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:10:18');
INSERT INTO `sys_log` VALUES (507, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:11:35');
INSERT INTO `sys_log` VALUES (508, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:11:54');
INSERT INTO `sys_log` VALUES (509, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:12:10');
INSERT INTO `sys_log` VALUES (510, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-30 19:12:30');
INSERT INTO `sys_log` VALUES (511, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-30 19:12:30');
INSERT INTO `sys_log` VALUES (512, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 19:12:46');
INSERT INTO `sys_log` VALUES (513, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-30 19:12:47');
INSERT INTO `sys_log` VALUES (514, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-30 19:12:47');
INSERT INTO `sys_log` VALUES (515, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 19:12:49');
INSERT INTO `sys_log` VALUES (516, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 19:12:54');
INSERT INTO `sys_log` VALUES (517, 1, '数据获取：入住信息列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getCheckinList()', '2024-04-30 19:14:09');
INSERT INTO `sys_log` VALUES (518, 1, '业务处理：办理退房', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.checkoutHotelRoom()', '2024-04-30 19:14:16');
INSERT INTO `sys_log` VALUES (519, 1, '数据获取：入住信息列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getCheckinList()', '2024-04-30 19:14:17');
INSERT INTO `sys_log` VALUES (520, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:14:21');
INSERT INTO `sys_log` VALUES (521, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 19:14:45');
INSERT INTO `sys_log` VALUES (522, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 19:15:36');
INSERT INTO `sys_log` VALUES (523, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:21:26');
INSERT INTO `sys_log` VALUES (524, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:21:41');
INSERT INTO `sys_log` VALUES (525, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-30 19:21:54');
INSERT INTO `sys_log` VALUES (526, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-30 19:21:54');
INSERT INTO `sys_log` VALUES (527, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-30 19:21:56');
INSERT INTO `sys_log` VALUES (528, 1, '业务处理：更新酒店房间信息', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.updateHotelRoom()', '2024-04-30 19:22:00');
INSERT INTO `sys_log` VALUES (529, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-30 19:22:01');
INSERT INTO `sys_log` VALUES (530, 1, '业务处理：更新酒店房间信息', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.updateHotelRoom()', '2024-04-30 19:22:05');
INSERT INTO `sys_log` VALUES (531, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-30 19:22:05');
INSERT INTO `sys_log` VALUES (532, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-30 19:22:07');
INSERT INTO `sys_log` VALUES (533, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-30 19:22:11');
INSERT INTO `sys_log` VALUES (534, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-30 19:22:15');
INSERT INTO `sys_log` VALUES (535, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-30 19:29:06');
INSERT INTO `sys_log` VALUES (536, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 19:29:18');
INSERT INTO `sys_log` VALUES (537, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 19:30:29');
INSERT INTO `sys_log` VALUES (538, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-30 19:31:25');
INSERT INTO `sys_log` VALUES (539, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-30 19:31:39');
INSERT INTO `sys_log` VALUES (540, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 19:31:42');
INSERT INTO `sys_log` VALUES (541, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-30 19:32:14');
INSERT INTO `sys_log` VALUES (542, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 19:32:20');
INSERT INTO `sys_log` VALUES (543, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-30 19:33:36');
INSERT INTO `sys_log` VALUES (544, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:35:20');
INSERT INTO `sys_log` VALUES (545, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 19:35:29');
INSERT INTO `sys_log` VALUES (546, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:35:35');
INSERT INTO `sys_log` VALUES (547, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 19:40:03');
INSERT INTO `sys_log` VALUES (548, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:40:28');
INSERT INTO `sys_log` VALUES (549, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 19:44:39');
INSERT INTO `sys_log` VALUES (550, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 19:44:40');
INSERT INTO `sys_log` VALUES (551, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-30 19:45:16');
INSERT INTO `sys_log` VALUES (552, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 19:45:24');
INSERT INTO `sys_log` VALUES (553, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:45:35');
INSERT INTO `sys_log` VALUES (554, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:45:39');
INSERT INTO `sys_log` VALUES (555, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 19:45:47');
INSERT INTO `sys_log` VALUES (556, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 19:46:19');
INSERT INTO `sys_log` VALUES (557, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 19:46:55');
INSERT INTO `sys_log` VALUES (558, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 19:48:01');
INSERT INTO `sys_log` VALUES (559, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:48:05');
INSERT INTO `sys_log` VALUES (560, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:48:13');
INSERT INTO `sys_log` VALUES (561, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:48:23');
INSERT INTO `sys_log` VALUES (562, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 19:48:44');
INSERT INTO `sys_log` VALUES (563, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:48:49');
INSERT INTO `sys_log` VALUES (564, 1, '业务处理：房间预订', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.reserveHotelRoom()', '2024-04-30 19:48:55');
INSERT INTO `sys_log` VALUES (565, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-30 19:48:55');
INSERT INTO `sys_log` VALUES (566, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 19:49:04');
INSERT INTO `sys_log` VALUES (567, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 19:49:50');
INSERT INTO `sys_log` VALUES (568, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 19:49:51');
INSERT INTO `sys_log` VALUES (569, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 19:49:53');
INSERT INTO `sys_log` VALUES (570, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-04-30 19:49:59');
INSERT INTO `sys_log` VALUES (571, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-04-30 19:49:59');
INSERT INTO `sys_log` VALUES (572, 1, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getUserInfo()', '2024-04-30 19:50:20');
INSERT INTO `sys_log` VALUES (573, 1, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getWeather()', '2024-04-30 19:50:20');
INSERT INTO `sys_log` VALUES (574, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-30 19:50:21');
INSERT INTO `sys_log` VALUES (575, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 19:50:28');
INSERT INTO `sys_log` VALUES (576, 1, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getAvailableRooms()', '2024-04-30 19:50:32');
INSERT INTO `sys_log` VALUES (577, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 21:00:39');
INSERT INTO `sys_log` VALUES (578, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 21:00:40');
INSERT INTO `sys_log` VALUES (579, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 21:00:40');
INSERT INTO `sys_log` VALUES (580, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 21:01:21');
INSERT INTO `sys_log` VALUES (581, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 21:01:22');
INSERT INTO `sys_log` VALUES (582, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 21:01:22');
INSERT INTO `sys_log` VALUES (583, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 21:01:25');
INSERT INTO `sys_log` VALUES (584, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 21:01:26');
INSERT INTO `sys_log` VALUES (585, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 21:01:30');
INSERT INTO `sys_log` VALUES (586, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 21:01:31');
INSERT INTO `sys_log` VALUES (587, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 21:02:19');
INSERT INTO `sys_log` VALUES (588, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 21:07:39');
INSERT INTO `sys_log` VALUES (589, 3, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 21:09:45');
INSERT INTO `sys_log` VALUES (590, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 21:12:22');
INSERT INTO `sys_log` VALUES (591, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 21:12:22');
INSERT INTO `sys_log` VALUES (592, 3, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 21:12:32');
INSERT INTO `sys_log` VALUES (593, 3, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 21:12:40');
INSERT INTO `sys_log` VALUES (594, 3, '数据获取：房间可用状态列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 21:17:46');
INSERT INTO `sys_log` VALUES (595, 1, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 21:29:58');
INSERT INTO `sys_log` VALUES (596, 1, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 21:30:07');
INSERT INTO `sys_log` VALUES (597, 1, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 21:30:19');
INSERT INTO `sys_log` VALUES (598, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 21:41:54');
INSERT INTO `sys_log` VALUES (599, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 21:41:59');
INSERT INTO `sys_log` VALUES (600, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 21:43:28');
INSERT INTO `sys_log` VALUES (601, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 21:52:21');
INSERT INTO `sys_log` VALUES (602, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 21:52:59');
INSERT INTO `sys_log` VALUES (603, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 22:02:31');
INSERT INTO `sys_log` VALUES (604, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 22:02:33');
INSERT INTO `sys_log` VALUES (605, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 22:13:08');
INSERT INTO `sys_log` VALUES (606, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 22:13:46');
INSERT INTO `sys_log` VALUES (607, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 22:14:14');
INSERT INTO `sys_log` VALUES (608, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 22:14:14');
INSERT INTO `sys_log` VALUES (609, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 22:14:24');
INSERT INTO `sys_log` VALUES (610, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 22:14:30');
INSERT INTO `sys_log` VALUES (611, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 22:14:36');
INSERT INTO `sys_log` VALUES (612, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 22:21:50');
INSERT INTO `sys_log` VALUES (613, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 22:21:55');
INSERT INTO `sys_log` VALUES (614, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 22:43:12');
INSERT INTO `sys_log` VALUES (615, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 22:43:13');
INSERT INTO `sys_log` VALUES (616, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 22:43:23');
INSERT INTO `sys_log` VALUES (617, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 22:43:32');
INSERT INTO `sys_log` VALUES (618, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 22:46:26');
INSERT INTO `sys_log` VALUES (619, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 22:47:07');
INSERT INTO `sys_log` VALUES (620, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 22:48:44');
INSERT INTO `sys_log` VALUES (621, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 22:51:00');
INSERT INTO `sys_log` VALUES (622, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 22:51:03');
INSERT INTO `sys_log` VALUES (623, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 22:57:15');
INSERT INTO `sys_log` VALUES (624, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 22:57:24');
INSERT INTO `sys_log` VALUES (625, 1, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getUserInfo()', '2024-04-30 23:02:02');
INSERT INTO `sys_log` VALUES (626, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 23:03:53');
INSERT INTO `sys_log` VALUES (627, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 23:03:55');
INSERT INTO `sys_log` VALUES (628, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 23:06:29');
INSERT INTO `sys_log` VALUES (629, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 23:06:37');
INSERT INTO `sys_log` VALUES (630, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-04-30 23:07:04');
INSERT INTO `sys_log` VALUES (631, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-04-30 23:07:05');
INSERT INTO `sys_log` VALUES (632, 3, '业务处理：房间预订', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.reserveHotelRoom()', '2024-04-30 23:07:05');
INSERT INTO `sys_log` VALUES (633, 3, '业务处理：房间预订', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.reserveHotelRoom()', '2024-04-30 23:07:05');
INSERT INTO `sys_log` VALUES (634, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 23:07:17');
INSERT INTO `sys_log` VALUES (635, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 23:08:12');
INSERT INTO `sys_log` VALUES (636, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 23:08:18');
INSERT INTO `sys_log` VALUES (637, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 23:08:59');
INSERT INTO `sys_log` VALUES (638, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 23:10:59');
INSERT INTO `sys_log` VALUES (639, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 23:11:09');
INSERT INTO `sys_log` VALUES (640, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 23:11:12');
INSERT INTO `sys_log` VALUES (641, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 23:11:21');
INSERT INTO `sys_log` VALUES (642, 1, '业务处理：取消订单', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.cancelHotelOrder()', '2024-04-30 23:11:47');
INSERT INTO `sys_log` VALUES (643, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 23:11:47');
INSERT INTO `sys_log` VALUES (644, 1, '业务处理：取消订单', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.cancelHotelOrder()', '2024-04-30 23:11:49');
INSERT INTO `sys_log` VALUES (645, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 23:11:50');
INSERT INTO `sys_log` VALUES (646, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 23:11:56');
INSERT INTO `sys_log` VALUES (647, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 23:11:58');
INSERT INTO `sys_log` VALUES (648, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-04-30 23:12:05');
INSERT INTO `sys_log` VALUES (649, 1, '数据获取：入住信息列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getCheckinList()', '2024-04-30 23:12:08');
INSERT INTO `sys_log` VALUES (650, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-04-30 23:12:14');
INSERT INTO `sys_log` VALUES (651, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 23:12:16');
INSERT INTO `sys_log` VALUES (652, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 23:12:20');
INSERT INTO `sys_log` VALUES (653, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 23:12:22');
INSERT INTO `sys_log` VALUES (654, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-04-30 23:12:44');
INSERT INTO `sys_log` VALUES (655, 1, '业务处理：办理入住', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.checkinHotelRoom()', '2024-04-30 23:13:08');
INSERT INTO `sys_log` VALUES (656, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 23:13:09');
INSERT INTO `sys_log` VALUES (657, 1, '数据获取：入住信息列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getCheckinList()', '2024-04-30 23:13:12');
INSERT INTO `sys_log` VALUES (658, 1, '业务处理：办理退房', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.checkoutHotelRoom()', '2024-04-30 23:13:19');
INSERT INTO `sys_log` VALUES (659, 1, '数据获取：入住信息列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getCheckinList()', '2024-04-30 23:13:19');
INSERT INTO `sys_log` VALUES (660, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 23:13:22');
INSERT INTO `sys_log` VALUES (661, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 23:13:43');
INSERT INTO `sys_log` VALUES (662, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 23:13:44');
INSERT INTO `sys_log` VALUES (663, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-04-30 23:13:45');
INSERT INTO `sys_log` VALUES (664, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 23:14:14');
INSERT INTO `sys_log` VALUES (665, 1, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getUserInfo()', '2024-04-30 23:21:17');
INSERT INTO `sys_log` VALUES (666, 1, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getWeather()', '2024-04-30 23:21:18');
INSERT INTO `sys_log` VALUES (667, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 23:25:27');
INSERT INTO `sys_log` VALUES (668, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 23:26:19');
INSERT INTO `sys_log` VALUES (669, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 23:26:32');
INSERT INTO `sys_log` VALUES (670, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-04-30 23:26:38');
INSERT INTO `sys_log` VALUES (671, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 23:26:38');
INSERT INTO `sys_log` VALUES (672, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-04-30 23:27:52');
INSERT INTO `sys_log` VALUES (673, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 23:27:53');
INSERT INTO `sys_log` VALUES (674, 3, '业务处理：更新个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.update()', '2024-04-30 23:28:09');
INSERT INTO `sys_log` VALUES (675, 3, '业务处理：更新个人头像', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.updateAvatar()', '2024-04-30 23:28:10');
INSERT INTO `sys_log` VALUES (676, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-04-30 23:28:24');
INSERT INTO `sys_log` VALUES (677, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-04-30 23:28:25');
INSERT INTO `sys_log` VALUES (678, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-04-30 23:28:28');
INSERT INTO `sys_log` VALUES (679, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-04-30 23:28:28');
INSERT INTO `sys_log` VALUES (680, 1, '业务处理：更新个人密码', '115.148.108.53', '中国江西省赣州市', 'SysUserController.updatePwd()', '2024-04-30 23:57:19');
INSERT INTO `sys_log` VALUES (681, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 00:07:36');
INSERT INTO `sys_log` VALUES (682, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 00:07:36');
INSERT INTO `sys_log` VALUES (683, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:07:40');
INSERT INTO `sys_log` VALUES (684, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:07:41');
INSERT INTO `sys_log` VALUES (685, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:07:52');
INSERT INTO `sys_log` VALUES (686, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:07:54');
INSERT INTO `sys_log` VALUES (687, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:08:15');
INSERT INTO `sys_log` VALUES (688, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:08:38');
INSERT INTO `sys_log` VALUES (689, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:08:38');
INSERT INTO `sys_log` VALUES (690, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:08:39');
INSERT INTO `sys_log` VALUES (691, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:09:29');
INSERT INTO `sys_log` VALUES (692, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:09:58');
INSERT INTO `sys_log` VALUES (693, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:09:58');
INSERT INTO `sys_log` VALUES (694, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:10:12');
INSERT INTO `sys_log` VALUES (695, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:10:12');
INSERT INTO `sys_log` VALUES (696, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:20:58');
INSERT INTO `sys_log` VALUES (697, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:20:58');
INSERT INTO `sys_log` VALUES (698, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:20:59');
INSERT INTO `sys_log` VALUES (699, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:21:01');
INSERT INTO `sys_log` VALUES (700, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:21:41');
INSERT INTO `sys_log` VALUES (701, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:21:41');
INSERT INTO `sys_log` VALUES (702, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:22:43');
INSERT INTO `sys_log` VALUES (703, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:22:43');
INSERT INTO `sys_log` VALUES (704, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:22:47');
INSERT INTO `sys_log` VALUES (705, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:22:47');
INSERT INTO `sys_log` VALUES (706, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:23:57');
INSERT INTO `sys_log` VALUES (707, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:23:58');
INSERT INTO `sys_log` VALUES (708, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:23:58');
INSERT INTO `sys_log` VALUES (709, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:24:22');
INSERT INTO `sys_log` VALUES (710, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:24:22');
INSERT INTO `sys_log` VALUES (711, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:24:32');
INSERT INTO `sys_log` VALUES (712, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:24:32');
INSERT INTO `sys_log` VALUES (713, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:24:33');
INSERT INTO `sys_log` VALUES (714, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:27:08');
INSERT INTO `sys_log` VALUES (715, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:27:08');
INSERT INTO `sys_log` VALUES (716, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:27:49');
INSERT INTO `sys_log` VALUES (717, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:27:50');
INSERT INTO `sys_log` VALUES (718, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:28:41');
INSERT INTO `sys_log` VALUES (719, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:28:43');
INSERT INTO `sys_log` VALUES (720, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:29:04');
INSERT INTO `sys_log` VALUES (721, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:29:05');
INSERT INTO `sys_log` VALUES (722, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:31:39');
INSERT INTO `sys_log` VALUES (723, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 00:31:39');
INSERT INTO `sys_log` VALUES (724, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:31:40');
INSERT INTO `sys_log` VALUES (725, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:32:23');
INSERT INTO `sys_log` VALUES (726, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 00:32:24');
INSERT INTO `sys_log` VALUES (727, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:32:25');
INSERT INTO `sys_log` VALUES (728, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:32:28');
INSERT INTO `sys_log` VALUES (729, 3, '业务处理：更新个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.update()', '2024-05-01 00:33:35');
INSERT INTO `sys_log` VALUES (730, 3, '业务处理：更新个人头像', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.updateAvatar()', '2024-05-01 00:33:35');
INSERT INTO `sys_log` VALUES (731, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:33:50');
INSERT INTO `sys_log` VALUES (732, 3, '业务处理：更新个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.update()', '2024-05-01 00:34:14');
INSERT INTO `sys_log` VALUES (733, 3, '业务处理：更新个人头像', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.updateAvatar()', '2024-05-01 00:34:14');
INSERT INTO `sys_log` VALUES (734, 3, '业务处理：更新个人密码', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.updatePwd()', '2024-05-01 00:34:33');
INSERT INTO `sys_log` VALUES (735, 3, '业务处理：更新个人密码', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.updatePwd()', '2024-05-01 00:34:39');
INSERT INTO `sys_log` VALUES (736, 3, '业务处理：更新个人密码', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.updatePwd()', '2024-05-01 00:34:56');
INSERT INTO `sys_log` VALUES (737, 3, '业务处理：更新个人密码', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.updatePwd()', '2024-05-01 00:35:02');
INSERT INTO `sys_log` VALUES (738, 3, '业务处理：更新个人密码', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.updatePwd()', '2024-05-01 00:35:16');
INSERT INTO `sys_log` VALUES (739, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:37:00');
INSERT INTO `sys_log` VALUES (740, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 00:37:01');
INSERT INTO `sys_log` VALUES (741, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:37:02');
INSERT INTO `sys_log` VALUES (742, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:37:15');
INSERT INTO `sys_log` VALUES (743, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 00:37:15');
INSERT INTO `sys_log` VALUES (744, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:37:16');
INSERT INTO `sys_log` VALUES (745, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:39:00');
INSERT INTO `sys_log` VALUES (746, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 00:39:01');
INSERT INTO `sys_log` VALUES (747, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:39:02');
INSERT INTO `sys_log` VALUES (748, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:39:15');
INSERT INTO `sys_log` VALUES (749, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 00:39:15');
INSERT INTO `sys_log` VALUES (750, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:39:16');
INSERT INTO `sys_log` VALUES (751, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:39:25');
INSERT INTO `sys_log` VALUES (752, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 00:39:25');
INSERT INTO `sys_log` VALUES (753, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:39:26');
INSERT INTO `sys_log` VALUES (754, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:40:17');
INSERT INTO `sys_log` VALUES (755, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 00:40:17');
INSERT INTO `sys_log` VALUES (756, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:40:18');
INSERT INTO `sys_log` VALUES (757, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:41:34');
INSERT INTO `sys_log` VALUES (758, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 00:41:34');
INSERT INTO `sys_log` VALUES (759, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:41:35');
INSERT INTO `sys_log` VALUES (760, 3, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 00:41:42');
INSERT INTO `sys_log` VALUES (761, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 00:41:43');
INSERT INTO `sys_log` VALUES (762, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:41:49');
INSERT INTO `sys_log` VALUES (763, 3, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 00:42:00');
INSERT INTO `sys_log` VALUES (764, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 00:42:01');
INSERT INTO `sys_log` VALUES (765, 3, '系统功能：上传文件', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.upload()', '2024-05-01 00:45:09');
INSERT INTO `sys_log` VALUES (766, 3, '业务处理：更新个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.update()', '2024-05-01 00:45:14');
INSERT INTO `sys_log` VALUES (767, 3, '业务处理：更新个人头像', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.updateAvatar()', '2024-05-01 00:45:15');
INSERT INTO `sys_log` VALUES (768, 3, '业务处理：更新个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.update()', '2024-05-01 00:45:18');
INSERT INTO `sys_log` VALUES (769, 3, '业务处理：更新个人头像', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.updateAvatar()', '2024-05-01 00:45:19');
INSERT INTO `sys_log` VALUES (770, 3, '业务处理：更新个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.update()', '2024-05-01 00:45:31');
INSERT INTO `sys_log` VALUES (771, 3, '业务处理：更新个人头像', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.updateAvatar()', '2024-05-01 00:45:32');
INSERT INTO `sys_log` VALUES (772, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:45:34');
INSERT INTO `sys_log` VALUES (773, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 00:45:50');
INSERT INTO `sys_log` VALUES (774, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 00:45:50');
INSERT INTO `sys_log` VALUES (775, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:45:53');
INSERT INTO `sys_log` VALUES (776, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 00:45:54');
INSERT INTO `sys_log` VALUES (777, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:45:54');
INSERT INTO `sys_log` VALUES (778, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:48:26');
INSERT INTO `sys_log` VALUES (779, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:48:26');
INSERT INTO `sys_log` VALUES (780, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 00:48:26');
INSERT INTO `sys_log` VALUES (781, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:48:27');
INSERT INTO `sys_log` VALUES (782, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 00:50:54');
INSERT INTO `sys_log` VALUES (783, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 00:50:55');
INSERT INTO `sys_log` VALUES (784, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:51:09');
INSERT INTO `sys_log` VALUES (785, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 00:51:10');
INSERT INTO `sys_log` VALUES (786, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:51:11');
INSERT INTO `sys_log` VALUES (787, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-05-01 00:51:14');
INSERT INTO `sys_log` VALUES (788, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 00:51:28');
INSERT INTO `sys_log` VALUES (789, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 00:51:28');
INSERT INTO `sys_log` VALUES (790, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 00:51:29');
INSERT INTO `sys_log` VALUES (791, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 08:11:10');
INSERT INTO `sys_log` VALUES (792, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 08:11:10');
INSERT INTO `sys_log` VALUES (793, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 08:11:10');
INSERT INTO `sys_log` VALUES (794, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 08:11:11');
INSERT INTO `sys_log` VALUES (795, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-05-01 08:28:21');
INSERT INTO `sys_log` VALUES (796, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 08:29:28');
INSERT INTO `sys_log` VALUES (797, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 08:29:28');
INSERT INTO `sys_log` VALUES (798, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 08:29:29');
INSERT INTO `sys_log` VALUES (799, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-05-01 08:29:34');
INSERT INTO `sys_log` VALUES (800, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 08:36:49');
INSERT INTO `sys_log` VALUES (801, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 08:36:49');
INSERT INTO `sys_log` VALUES (802, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-05-01 08:37:09');
INSERT INTO `sys_log` VALUES (803, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 08:37:11');
INSERT INTO `sys_log` VALUES (804, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 08:37:12');
INSERT INTO `sys_log` VALUES (805, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 08:37:13');
INSERT INTO `sys_log` VALUES (806, 1, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-05-01 08:38:33');
INSERT INTO `sys_log` VALUES (807, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-05-01 08:38:37');
INSERT INTO `sys_log` VALUES (808, 1, '数据获取：用户列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.list()', '2024-05-01 08:38:50');
INSERT INTO `sys_log` VALUES (809, 1, '数据获取：角色列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-05-01 08:38:50');
INSERT INTO `sys_log` VALUES (810, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-05-01 08:38:52');
INSERT INTO `sys_log` VALUES (811, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 09:38:37');
INSERT INTO `sys_log` VALUES (812, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 09:38:37');
INSERT INTO `sys_log` VALUES (813, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 09:38:39');
INSERT INTO `sys_log` VALUES (814, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 09:38:39');
INSERT INTO `sys_log` VALUES (815, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 09:38:40');
INSERT INTO `sys_log` VALUES (816, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 09:43:38');
INSERT INTO `sys_log` VALUES (817, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 09:43:39');
INSERT INTO `sys_log` VALUES (818, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 09:44:54');
INSERT INTO `sys_log` VALUES (819, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 09:44:54');
INSERT INTO `sys_log` VALUES (820, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 09:44:55');
INSERT INTO `sys_log` VALUES (821, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 09:44:56');
INSERT INTO `sys_log` VALUES (822, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 09:44:57');
INSERT INTO `sys_log` VALUES (823, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:05:03');
INSERT INTO `sys_log` VALUES (824, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:05:04');
INSERT INTO `sys_log` VALUES (825, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:05:05');
INSERT INTO `sys_log` VALUES (826, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:07:34');
INSERT INTO `sys_log` VALUES (827, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:07:34');
INSERT INTO `sys_log` VALUES (828, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:07:35');
INSERT INTO `sys_log` VALUES (829, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:09:31');
INSERT INTO `sys_log` VALUES (830, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:09:32');
INSERT INTO `sys_log` VALUES (831, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:11:12');
INSERT INTO `sys_log` VALUES (832, 3, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 10:14:53');
INSERT INTO `sys_log` VALUES (833, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:14:54');
INSERT INTO `sys_log` VALUES (834, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:20:38');
INSERT INTO `sys_log` VALUES (835, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:20:39');
INSERT INTO `sys_log` VALUES (836, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:20:40');
INSERT INTO `sys_log` VALUES (837, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:37:28');
INSERT INTO `sys_log` VALUES (838, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:37:28');
INSERT INTO `sys_log` VALUES (839, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:37:29');
INSERT INTO `sys_log` VALUES (840, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:37:42');
INSERT INTO `sys_log` VALUES (841, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:37:42');
INSERT INTO `sys_log` VALUES (842, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:37:43');
INSERT INTO `sys_log` VALUES (843, 3, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 10:38:07');
INSERT INTO `sys_log` VALUES (844, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:38:07');
INSERT INTO `sys_log` VALUES (845, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:38:18');
INSERT INTO `sys_log` VALUES (846, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:38:18');
INSERT INTO `sys_log` VALUES (847, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:38:18');
INSERT INTO `sys_log` VALUES (848, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:38:19');
INSERT INTO `sys_log` VALUES (849, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:42:38');
INSERT INTO `sys_log` VALUES (850, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:42:39');
INSERT INTO `sys_log` VALUES (851, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:42:40');
INSERT INTO `sys_log` VALUES (852, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:43:17');
INSERT INTO `sys_log` VALUES (853, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:43:26');
INSERT INTO `sys_log` VALUES (854, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:43:28');
INSERT INTO `sys_log` VALUES (855, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:43:29');
INSERT INTO `sys_log` VALUES (856, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:45:22');
INSERT INTO `sys_log` VALUES (857, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:45:22');
INSERT INTO `sys_log` VALUES (858, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:45:23');
INSERT INTO `sys_log` VALUES (859, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:45:29');
INSERT INTO `sys_log` VALUES (860, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:45:29');
INSERT INTO `sys_log` VALUES (861, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:45:30');
INSERT INTO `sys_log` VALUES (862, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:45:31');
INSERT INTO `sys_log` VALUES (863, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:45:31');
INSERT INTO `sys_log` VALUES (864, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:45:32');
INSERT INTO `sys_log` VALUES (865, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:45:38');
INSERT INTO `sys_log` VALUES (866, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:45:38');
INSERT INTO `sys_log` VALUES (867, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:45:39');
INSERT INTO `sys_log` VALUES (868, 3, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 10:46:22');
INSERT INTO `sys_log` VALUES (869, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:46:23');
INSERT INTO `sys_log` VALUES (870, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:50:51');
INSERT INTO `sys_log` VALUES (871, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:50:51');
INSERT INTO `sys_log` VALUES (872, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:50:52');
INSERT INTO `sys_log` VALUES (873, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:51:17');
INSERT INTO `sys_log` VALUES (874, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:51:18');
INSERT INTO `sys_log` VALUES (875, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:51:19');
INSERT INTO `sys_log` VALUES (876, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:52:21');
INSERT INTO `sys_log` VALUES (877, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:52:22');
INSERT INTO `sys_log` VALUES (878, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:52:22');
INSERT INTO `sys_log` VALUES (879, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:52:26');
INSERT INTO `sys_log` VALUES (880, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:52:27');
INSERT INTO `sys_log` VALUES (881, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:52:28');
INSERT INTO `sys_log` VALUES (882, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:52:36');
INSERT INTO `sys_log` VALUES (883, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:52:37');
INSERT INTO `sys_log` VALUES (884, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:52:38');
INSERT INTO `sys_log` VALUES (885, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:53:03');
INSERT INTO `sys_log` VALUES (886, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:53:04');
INSERT INTO `sys_log` VALUES (887, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:53:05');
INSERT INTO `sys_log` VALUES (888, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:54:50');
INSERT INTO `sys_log` VALUES (889, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:54:50');
INSERT INTO `sys_log` VALUES (890, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:54:51');
INSERT INTO `sys_log` VALUES (891, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:54:51');
INSERT INTO `sys_log` VALUES (892, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 10:58:07');
INSERT INTO `sys_log` VALUES (893, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:58:07');
INSERT INTO `sys_log` VALUES (894, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 10:58:08');
INSERT INTO `sys_log` VALUES (895, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 10:58:08');
INSERT INTO `sys_log` VALUES (896, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:00:28');
INSERT INTO `sys_log` VALUES (897, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:00:29');
INSERT INTO `sys_log` VALUES (898, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:00:29');
INSERT INTO `sys_log` VALUES (899, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:06:21');
INSERT INTO `sys_log` VALUES (900, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:06:21');
INSERT INTO `sys_log` VALUES (901, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:06:22');
INSERT INTO `sys_log` VALUES (902, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:06:22');
INSERT INTO `sys_log` VALUES (903, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:07:06');
INSERT INTO `sys_log` VALUES (904, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:07:06');
INSERT INTO `sys_log` VALUES (905, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:07:06');
INSERT INTO `sys_log` VALUES (906, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:07:07');
INSERT INTO `sys_log` VALUES (907, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:07:26');
INSERT INTO `sys_log` VALUES (908, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:07:26');
INSERT INTO `sys_log` VALUES (909, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:07:26');
INSERT INTO `sys_log` VALUES (910, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:07:27');
INSERT INTO `sys_log` VALUES (911, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:07:46');
INSERT INTO `sys_log` VALUES (912, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:07:46');
INSERT INTO `sys_log` VALUES (913, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:07:47');
INSERT INTO `sys_log` VALUES (914, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:07:47');
INSERT INTO `sys_log` VALUES (915, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:10:23');
INSERT INTO `sys_log` VALUES (916, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:10:23');
INSERT INTO `sys_log` VALUES (917, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:10:24');
INSERT INTO `sys_log` VALUES (918, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:10:24');
INSERT INTO `sys_log` VALUES (919, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:10:51');
INSERT INTO `sys_log` VALUES (920, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:10:51');
INSERT INTO `sys_log` VALUES (921, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:10:51');
INSERT INTO `sys_log` VALUES (922, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:10:52');
INSERT INTO `sys_log` VALUES (923, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:11:59');
INSERT INTO `sys_log` VALUES (924, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:12:00');
INSERT INTO `sys_log` VALUES (925, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:12:00');
INSERT INTO `sys_log` VALUES (926, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:12:01');
INSERT INTO `sys_log` VALUES (927, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:13:34');
INSERT INTO `sys_log` VALUES (928, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:13:34');
INSERT INTO `sys_log` VALUES (929, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:13:34');
INSERT INTO `sys_log` VALUES (930, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:13:35');
INSERT INTO `sys_log` VALUES (931, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:15:27');
INSERT INTO `sys_log` VALUES (932, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:15:27');
INSERT INTO `sys_log` VALUES (933, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:15:27');
INSERT INTO `sys_log` VALUES (934, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:15:28');
INSERT INTO `sys_log` VALUES (935, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:19:29');
INSERT INTO `sys_log` VALUES (936, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:19:30');
INSERT INTO `sys_log` VALUES (937, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:19:31');
INSERT INTO `sys_log` VALUES (938, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:19:45');
INSERT INTO `sys_log` VALUES (939, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:19:45');
INSERT INTO `sys_log` VALUES (940, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:19:45');
INSERT INTO `sys_log` VALUES (941, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:19:46');
INSERT INTO `sys_log` VALUES (942, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:20:18');
INSERT INTO `sys_log` VALUES (943, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:20:19');
INSERT INTO `sys_log` VALUES (944, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:20:19');
INSERT INTO `sys_log` VALUES (945, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:22:20');
INSERT INTO `sys_log` VALUES (946, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:22:21');
INSERT INTO `sys_log` VALUES (947, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:22:22');
INSERT INTO `sys_log` VALUES (948, 3, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 11:24:33');
INSERT INTO `sys_log` VALUES (949, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:24:34');
INSERT INTO `sys_log` VALUES (950, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:26:25');
INSERT INTO `sys_log` VALUES (951, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:26:26');
INSERT INTO `sys_log` VALUES (952, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:26:27');
INSERT INTO `sys_log` VALUES (953, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:26:49');
INSERT INTO `sys_log` VALUES (954, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:26:50');
INSERT INTO `sys_log` VALUES (955, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:26:51');
INSERT INTO `sys_log` VALUES (956, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 11:29:56');
INSERT INTO `sys_log` VALUES (957, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 11:29:57');
INSERT INTO `sys_log` VALUES (958, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:30:05');
INSERT INTO `sys_log` VALUES (959, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:30:06');
INSERT INTO `sys_log` VALUES (960, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:30:06');
INSERT INTO `sys_log` VALUES (961, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-05-01 11:33:04');
INSERT INTO `sys_log` VALUES (962, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:33:16');
INSERT INTO `sys_log` VALUES (963, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:33:17');
INSERT INTO `sys_log` VALUES (964, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:33:18');
INSERT INTO `sys_log` VALUES (965, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 11:33:20');
INSERT INTO `sys_log` VALUES (966, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 11:33:21');
INSERT INTO `sys_log` VALUES (967, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:33:55');
INSERT INTO `sys_log` VALUES (968, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:33:55');
INSERT INTO `sys_log` VALUES (969, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:33:56');
INSERT INTO `sys_log` VALUES (970, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:46:56');
INSERT INTO `sys_log` VALUES (971, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:46:56');
INSERT INTO `sys_log` VALUES (972, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:46:57');
INSERT INTO `sys_log` VALUES (973, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:46:57');
INSERT INTO `sys_log` VALUES (974, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:47:42');
INSERT INTO `sys_log` VALUES (975, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:47:43');
INSERT INTO `sys_log` VALUES (976, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:47:43');
INSERT INTO `sys_log` VALUES (977, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:47:43');
INSERT INTO `sys_log` VALUES (978, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:48:22');
INSERT INTO `sys_log` VALUES (979, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:48:22');
INSERT INTO `sys_log` VALUES (980, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:48:22');
INSERT INTO `sys_log` VALUES (981, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:48:23');
INSERT INTO `sys_log` VALUES (982, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:49:23');
INSERT INTO `sys_log` VALUES (983, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:49:23');
INSERT INTO `sys_log` VALUES (984, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:49:23');
INSERT INTO `sys_log` VALUES (985, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:49:24');
INSERT INTO `sys_log` VALUES (986, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 11:51:27');
INSERT INTO `sys_log` VALUES (987, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:51:27');
INSERT INTO `sys_log` VALUES (988, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 11:51:27');
INSERT INTO `sys_log` VALUES (989, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 11:51:28');
INSERT INTO `sys_log` VALUES (990, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 11:51:33');
INSERT INTO `sys_log` VALUES (991, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 11:58:14');
INSERT INTO `sys_log` VALUES (992, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 11:58:17');
INSERT INTO `sys_log` VALUES (993, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 11:58:19');
INSERT INTO `sys_log` VALUES (994, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 11:58:21');
INSERT INTO `sys_log` VALUES (995, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 11:58:21');
INSERT INTO `sys_log` VALUES (996, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 11:59:12');
INSERT INTO `sys_log` VALUES (997, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 11:59:12');
INSERT INTO `sys_log` VALUES (998, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 11:59:14');
INSERT INTO `sys_log` VALUES (999, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 11:59:15');
INSERT INTO `sys_log` VALUES (1000, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 11:59:18');
INSERT INTO `sys_log` VALUES (1001, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 11:59:19');
INSERT INTO `sys_log` VALUES (1002, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:01:21');
INSERT INTO `sys_log` VALUES (1003, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:01:23');
INSERT INTO `sys_log` VALUES (1004, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:01:36');
INSERT INTO `sys_log` VALUES (1005, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:01:37');
INSERT INTO `sys_log` VALUES (1006, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:01:38');
INSERT INTO `sys_log` VALUES (1007, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-05-01 12:01:47');
INSERT INTO `sys_log` VALUES (1008, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 12:01:50');
INSERT INTO `sys_log` VALUES (1009, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 12:01:50');
INSERT INTO `sys_log` VALUES (1010, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:01:51');
INSERT INTO `sys_log` VALUES (1011, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 12:01:53');
INSERT INTO `sys_log` VALUES (1012, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 12:01:54');
INSERT INTO `sys_log` VALUES (1013, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:01:57');
INSERT INTO `sys_log` VALUES (1014, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 12:01:59');
INSERT INTO `sys_log` VALUES (1015, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 12:02:00');
INSERT INTO `sys_log` VALUES (1016, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:02:16');
INSERT INTO `sys_log` VALUES (1017, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:03:47');
INSERT INTO `sys_log` VALUES (1018, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:03:48');
INSERT INTO `sys_log` VALUES (1019, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:04:16');
INSERT INTO `sys_log` VALUES (1020, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:04:17');
INSERT INTO `sys_log` VALUES (1021, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:04:18');
INSERT INTO `sys_log` VALUES (1022, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:05:48');
INSERT INTO `sys_log` VALUES (1023, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:05:48');
INSERT INTO `sys_log` VALUES (1024, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 12:13:04');
INSERT INTO `sys_log` VALUES (1025, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:13:05');
INSERT INTO `sys_log` VALUES (1026, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 12:13:05');
INSERT INTO `sys_log` VALUES (1027, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:13:59');
INSERT INTO `sys_log` VALUES (1028, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:14:00');
INSERT INTO `sys_log` VALUES (1029, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:14:04');
INSERT INTO `sys_log` VALUES (1030, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:14:07');
INSERT INTO `sys_log` VALUES (1031, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-05-01 12:14:14');
INSERT INTO `sys_log` VALUES (1032, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-05-01 12:14:24');
INSERT INTO `sys_log` VALUES (1033, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-05-01 12:14:27');
INSERT INTO `sys_log` VALUES (1034, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-05-01 12:14:28');
INSERT INTO `sys_log` VALUES (1035, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-05-01 12:14:29');
INSERT INTO `sys_log` VALUES (1036, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-05-01 12:14:31');
INSERT INTO `sys_log` VALUES (1037, 1, '数据获取：入住信息列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getCheckinList()', '2024-05-01 12:17:05');
INSERT INTO `sys_log` VALUES (1038, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-05-01 12:17:11');
INSERT INTO `sys_log` VALUES (1039, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-05-01 12:17:11');
INSERT INTO `sys_log` VALUES (1040, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-05-01 12:17:15');
INSERT INTO `sys_log` VALUES (1041, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-05-01 12:17:18');
INSERT INTO `sys_log` VALUES (1042, 1, '数据获取：角色列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-05-01 12:17:22');
INSERT INTO `sys_log` VALUES (1043, 1, '数据获取：用户列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.list()', '2024-05-01 12:17:22');
INSERT INTO `sys_log` VALUES (1044, 1, '数据获取：角色列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-05-01 12:17:33');
INSERT INTO `sys_log` VALUES (1045, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-05-01 12:17:45');
INSERT INTO `sys_log` VALUES (1046, 1, '数据获取：角色列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-05-01 12:17:50');
INSERT INTO `sys_log` VALUES (1047, 1, '数据获取：角色列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-05-01 12:18:47');
INSERT INTO `sys_log` VALUES (1048, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:19:05');
INSERT INTO `sys_log` VALUES (1049, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:19:06');
INSERT INTO `sys_log` VALUES (1050, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 12:19:24');
INSERT INTO `sys_log` VALUES (1051, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 12:19:24');
INSERT INTO `sys_log` VALUES (1052, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 12:26:04');
INSERT INTO `sys_log` VALUES (1053, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:26:04');
INSERT INTO `sys_log` VALUES (1054, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 12:26:05');
INSERT INTO `sys_log` VALUES (1055, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 12:26:48');
INSERT INTO `sys_log` VALUES (1056, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:26:48');
INSERT INTO `sys_log` VALUES (1057, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 12:26:48');
INSERT INTO `sys_log` VALUES (1058, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 12:27:33');
INSERT INTO `sys_log` VALUES (1059, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:27:33');
INSERT INTO `sys_log` VALUES (1060, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 12:27:34');
INSERT INTO `sys_log` VALUES (1061, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:27:46');
INSERT INTO `sys_log` VALUES (1062, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 12:27:48');
INSERT INTO `sys_log` VALUES (1063, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 12:27:48');
INSERT INTO `sys_log` VALUES (1064, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 12:28:35');
INSERT INTO `sys_log` VALUES (1065, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:28:36');
INSERT INTO `sys_log` VALUES (1066, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 12:28:36');
INSERT INTO `sys_log` VALUES (1067, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 12:29:10');
INSERT INTO `sys_log` VALUES (1068, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:29:10');
INSERT INTO `sys_log` VALUES (1069, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 12:29:11');
INSERT INTO `sys_log` VALUES (1070, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 12:29:29');
INSERT INTO `sys_log` VALUES (1071, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:29:29');
INSERT INTO `sys_log` VALUES (1072, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 12:29:30');
INSERT INTO `sys_log` VALUES (1073, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:29:33');
INSERT INTO `sys_log` VALUES (1074, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 12:29:52');
INSERT INTO `sys_log` VALUES (1075, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 12:29:52');
INSERT INTO `sys_log` VALUES (1076, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 12:30:26');
INSERT INTO `sys_log` VALUES (1077, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:30:26');
INSERT INTO `sys_log` VALUES (1078, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 12:30:27');
INSERT INTO `sys_log` VALUES (1079, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:30:28');
INSERT INTO `sys_log` VALUES (1080, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:32:47');
INSERT INTO `sys_log` VALUES (1081, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:32:47');
INSERT INTO `sys_log` VALUES (1082, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:33:14');
INSERT INTO `sys_log` VALUES (1083, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:33:14');
INSERT INTO `sys_log` VALUES (1084, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:33:25');
INSERT INTO `sys_log` VALUES (1085, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:33:25');
INSERT INTO `sys_log` VALUES (1086, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:34:12');
INSERT INTO `sys_log` VALUES (1087, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:34:12');
INSERT INTO `sys_log` VALUES (1088, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:35:33');
INSERT INTO `sys_log` VALUES (1089, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:35:33');
INSERT INTO `sys_log` VALUES (1090, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:35:57');
INSERT INTO `sys_log` VALUES (1091, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:35:58');
INSERT INTO `sys_log` VALUES (1092, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:36:51');
INSERT INTO `sys_log` VALUES (1093, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:36:52');
INSERT INTO `sys_log` VALUES (1094, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:37:09');
INSERT INTO `sys_log` VALUES (1095, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:37:09');
INSERT INTO `sys_log` VALUES (1096, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 12:37:11');
INSERT INTO `sys_log` VALUES (1097, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 12:37:12');
INSERT INTO `sys_log` VALUES (1098, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:37:12');
INSERT INTO `sys_log` VALUES (1099, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:37:39');
INSERT INTO `sys_log` VALUES (1100, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:37:39');
INSERT INTO `sys_log` VALUES (1101, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:37:49');
INSERT INTO `sys_log` VALUES (1102, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:37:49');
INSERT INTO `sys_log` VALUES (1103, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:38:21');
INSERT INTO `sys_log` VALUES (1104, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:38:21');
INSERT INTO `sys_log` VALUES (1105, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:39:42');
INSERT INTO `sys_log` VALUES (1106, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:39:42');
INSERT INTO `sys_log` VALUES (1107, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:44:20');
INSERT INTO `sys_log` VALUES (1108, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:45:25');
INSERT INTO `sys_log` VALUES (1109, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:45:33');
INSERT INTO `sys_log` VALUES (1110, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:47:21');
INSERT INTO `sys_log` VALUES (1111, 1, '数据获取：角色列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-05-01 12:51:04');
INSERT INTO `sys_log` VALUES (1112, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 12:51:09');
INSERT INTO `sys_log` VALUES (1113, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-05-01 12:51:16');
INSERT INTO `sys_log` VALUES (1114, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:51:32');
INSERT INTO `sys_log` VALUES (1115, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:51:49');
INSERT INTO `sys_log` VALUES (1116, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:51:51');
INSERT INTO `sys_log` VALUES (1117, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:53:20');
INSERT INTO `sys_log` VALUES (1118, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:53:22');
INSERT INTO `sys_log` VALUES (1119, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:53:24');
INSERT INTO `sys_log` VALUES (1120, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:53:25');
INSERT INTO `sys_log` VALUES (1121, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:53:27');
INSERT INTO `sys_log` VALUES (1122, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:53:31');
INSERT INTO `sys_log` VALUES (1123, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:53:32');
INSERT INTO `sys_log` VALUES (1124, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:53:41');
INSERT INTO `sys_log` VALUES (1125, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 12:53:44');
INSERT INTO `sys_log` VALUES (1126, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-05-01 12:53:54');
INSERT INTO `sys_log` VALUES (1127, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-05-01 12:53:57');
INSERT INTO `sys_log` VALUES (1128, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 13:16:13');
INSERT INTO `sys_log` VALUES (1129, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:16:13');
INSERT INTO `sys_log` VALUES (1130, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:16:14');
INSERT INTO `sys_log` VALUES (1131, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 13:16:19');
INSERT INTO `sys_log` VALUES (1132, 3, '业务处理：取消订单', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.cancelHotelOrder()', '2024-05-01 13:16:22');
INSERT INTO `sys_log` VALUES (1133, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 13:16:23');
INSERT INTO `sys_log` VALUES (1134, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 13:16:26');
INSERT INTO `sys_log` VALUES (1135, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:16:27');
INSERT INTO `sys_log` VALUES (1136, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:16:28');
INSERT INTO `sys_log` VALUES (1137, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-05-01 13:18:38');
INSERT INTO `sys_log` VALUES (1138, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 13:19:38');
INSERT INTO `sys_log` VALUES (1139, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 13:19:39');
INSERT INTO `sys_log` VALUES (1140, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-05-01 13:19:45');
INSERT INTO `sys_log` VALUES (1141, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 13:19:53');
INSERT INTO `sys_log` VALUES (1142, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-05-01 13:20:43');
INSERT INTO `sys_log` VALUES (1143, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-05-01 13:21:43');
INSERT INTO `sys_log` VALUES (1144, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-05-01 13:21:51');
INSERT INTO `sys_log` VALUES (1145, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-05-01 13:21:53');
INSERT INTO `sys_log` VALUES (1146, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:22:07');
INSERT INTO `sys_log` VALUES (1147, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-05-01 13:22:10');
INSERT INTO `sys_log` VALUES (1148, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-05-01 13:22:20');
INSERT INTO `sys_log` VALUES (1149, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-05-01 13:22:20');
INSERT INTO `sys_log` VALUES (1150, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-05-01 13:22:25');
INSERT INTO `sys_log` VALUES (1151, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-05-01 13:22:40');
INSERT INTO `sys_log` VALUES (1152, 1, '业务处理：添加酒店房间', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.addHotelRoom()', '2024-05-01 13:22:40');
INSERT INTO `sys_log` VALUES (1153, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-05-01 13:22:43');
INSERT INTO `sys_log` VALUES (1154, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-05-01 13:22:45');
INSERT INTO `sys_log` VALUES (1155, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:22:59');
INSERT INTO `sys_log` VALUES (1156, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-05-01 13:23:01');
INSERT INTO `sys_log` VALUES (1157, NULL, '系统功能：用户退出登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.logout()', '2024-05-01 13:23:14');
INSERT INTO `sys_log` VALUES (1158, 16, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 13:23:22');
INSERT INTO `sys_log` VALUES (1159, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:23:22');
INSERT INTO `sys_log` VALUES (1160, 16, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 13:23:22');
INSERT INTO `sys_log` VALUES (1161, 16, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 13:23:25');
INSERT INTO `sys_log` VALUES (1162, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:23:25');
INSERT INTO `sys_log` VALUES (1163, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:23:26');
INSERT INTO `sys_log` VALUES (1164, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:23:39');
INSERT INTO `sys_log` VALUES (1165, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:23:39');
INSERT INTO `sys_log` VALUES (1166, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:34:19');
INSERT INTO `sys_log` VALUES (1167, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:34:20');
INSERT INTO `sys_log` VALUES (1168, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:34:27');
INSERT INTO `sys_log` VALUES (1169, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:34:28');
INSERT INTO `sys_log` VALUES (1170, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:34:33');
INSERT INTO `sys_log` VALUES (1171, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:34:34');
INSERT INTO `sys_log` VALUES (1172, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:34:44');
INSERT INTO `sys_log` VALUES (1173, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:34:45');
INSERT INTO `sys_log` VALUES (1174, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:34:52');
INSERT INTO `sys_log` VALUES (1175, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:34:53');
INSERT INTO `sys_log` VALUES (1176, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:34:57');
INSERT INTO `sys_log` VALUES (1177, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:34:58');
INSERT INTO `sys_log` VALUES (1178, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:35:01');
INSERT INTO `sys_log` VALUES (1179, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:35:02');
INSERT INTO `sys_log` VALUES (1180, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:35:05');
INSERT INTO `sys_log` VALUES (1181, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:35:05');
INSERT INTO `sys_log` VALUES (1182, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:35:10');
INSERT INTO `sys_log` VALUES (1183, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:35:11');
INSERT INTO `sys_log` VALUES (1184, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:35:15');
INSERT INTO `sys_log` VALUES (1185, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:35:16');
INSERT INTO `sys_log` VALUES (1186, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:35:20');
INSERT INTO `sys_log` VALUES (1187, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:35:20');
INSERT INTO `sys_log` VALUES (1188, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:35:22');
INSERT INTO `sys_log` VALUES (1189, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:35:23');
INSERT INTO `sys_log` VALUES (1190, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:35:24');
INSERT INTO `sys_log` VALUES (1191, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:35:25');
INSERT INTO `sys_log` VALUES (1192, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:35:26');
INSERT INTO `sys_log` VALUES (1193, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:35:27');
INSERT INTO `sys_log` VALUES (1194, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:35:30');
INSERT INTO `sys_log` VALUES (1195, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:35:31');
INSERT INTO `sys_log` VALUES (1196, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:35:33');
INSERT INTO `sys_log` VALUES (1197, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:35:34');
INSERT INTO `sys_log` VALUES (1198, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:35:35');
INSERT INTO `sys_log` VALUES (1199, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:35:36');
INSERT INTO `sys_log` VALUES (1200, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:35:40');
INSERT INTO `sys_log` VALUES (1201, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:35:40');
INSERT INTO `sys_log` VALUES (1202, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:35:44');
INSERT INTO `sys_log` VALUES (1203, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:35:44');
INSERT INTO `sys_log` VALUES (1204, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:35:53');
INSERT INTO `sys_log` VALUES (1205, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:35:53');
INSERT INTO `sys_log` VALUES (1206, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:35:56');
INSERT INTO `sys_log` VALUES (1207, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:35:56');
INSERT INTO `sys_log` VALUES (1208, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:36:01');
INSERT INTO `sys_log` VALUES (1209, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:36:02');
INSERT INTO `sys_log` VALUES (1210, 16, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 13:36:57');
INSERT INTO `sys_log` VALUES (1211, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:36:57');
INSERT INTO `sys_log` VALUES (1212, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:36:58');
INSERT INTO `sys_log` VALUES (1213, 16, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 13:37:26');
INSERT INTO `sys_log` VALUES (1214, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:37:26');
INSERT INTO `sys_log` VALUES (1215, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:37:26');
INSERT INTO `sys_log` VALUES (1216, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:37:27');
INSERT INTO `sys_log` VALUES (1217, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:37:37');
INSERT INTO `sys_log` VALUES (1218, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:37:38');
INSERT INTO `sys_log` VALUES (1219, 16, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 13:38:26');
INSERT INTO `sys_log` VALUES (1220, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:38:26');
INSERT INTO `sys_log` VALUES (1221, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:38:27');
INSERT INTO `sys_log` VALUES (1222, 16, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 13:39:06');
INSERT INTO `sys_log` VALUES (1223, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:39:06');
INSERT INTO `sys_log` VALUES (1224, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:39:07');
INSERT INTO `sys_log` VALUES (1225, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:39:08');
INSERT INTO `sys_log` VALUES (1226, 16, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 13:39:54');
INSERT INTO `sys_log` VALUES (1227, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:39:54');
INSERT INTO `sys_log` VALUES (1228, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:39:54');
INSERT INTO `sys_log` VALUES (1229, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:39:55');
INSERT INTO `sys_log` VALUES (1230, 16, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 13:42:31');
INSERT INTO `sys_log` VALUES (1231, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:42:31');
INSERT INTO `sys_log` VALUES (1232, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:42:32');
INSERT INTO `sys_log` VALUES (1233, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:42:33');
INSERT INTO `sys_log` VALUES (1234, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:43:16');
INSERT INTO `sys_log` VALUES (1235, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:43:17');
INSERT INTO `sys_log` VALUES (1236, 16, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 13:43:28');
INSERT INTO `sys_log` VALUES (1237, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:43:29');
INSERT INTO `sys_log` VALUES (1238, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:43:29');
INSERT INTO `sys_log` VALUES (1239, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:43:30');
INSERT INTO `sys_log` VALUES (1240, 16, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 13:44:06');
INSERT INTO `sys_log` VALUES (1241, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:44:06');
INSERT INTO `sys_log` VALUES (1242, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:44:06');
INSERT INTO `sys_log` VALUES (1243, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:44:07');
INSERT INTO `sys_log` VALUES (1244, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:44:15');
INSERT INTO `sys_log` VALUES (1245, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:44:15');
INSERT INTO `sys_log` VALUES (1246, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:44:25');
INSERT INTO `sys_log` VALUES (1247, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:44:25');
INSERT INTO `sys_log` VALUES (1248, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:44:31');
INSERT INTO `sys_log` VALUES (1249, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:44:32');
INSERT INTO `sys_log` VALUES (1250, 16, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 13:44:43');
INSERT INTO `sys_log` VALUES (1251, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:44:43');
INSERT INTO `sys_log` VALUES (1252, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:44:43');
INSERT INTO `sys_log` VALUES (1253, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:44:44');
INSERT INTO `sys_log` VALUES (1254, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:44:51');
INSERT INTO `sys_log` VALUES (1255, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:44:52');
INSERT INTO `sys_log` VALUES (1256, 16, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 13:45:04');
INSERT INTO `sys_log` VALUES (1257, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:45:05');
INSERT INTO `sys_log` VALUES (1258, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:45:05');
INSERT INTO `sys_log` VALUES (1259, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:45:06');
INSERT INTO `sys_log` VALUES (1260, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:45:13');
INSERT INTO `sys_log` VALUES (1261, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:45:14');
INSERT INTO `sys_log` VALUES (1262, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:45:16');
INSERT INTO `sys_log` VALUES (1263, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:45:16');
INSERT INTO `sys_log` VALUES (1264, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:45:23');
INSERT INTO `sys_log` VALUES (1265, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:45:24');
INSERT INTO `sys_log` VALUES (1266, 16, '业务处理：会员充值', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.rechargeMember()', '2024-05-01 13:45:29');
INSERT INTO `sys_log` VALUES (1267, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:45:30');
INSERT INTO `sys_log` VALUES (1268, 16, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 13:45:40');
INSERT INTO `sys_log` VALUES (1269, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:45:40');
INSERT INTO `sys_log` VALUES (1270, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:45:41');
INSERT INTO `sys_log` VALUES (1271, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:45:41');
INSERT INTO `sys_log` VALUES (1272, 16, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 13:48:23');
INSERT INTO `sys_log` VALUES (1273, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:48:23');
INSERT INTO `sys_log` VALUES (1274, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:48:24');
INSERT INTO `sys_log` VALUES (1275, 16, '业务处理：更新个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.update()', '2024-05-01 13:49:22');
INSERT INTO `sys_log` VALUES (1276, 16, '业务处理：更新个人头像', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.updateAvatar()', '2024-05-01 13:49:22');
INSERT INTO `sys_log` VALUES (1277, 16, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-05-01 13:49:54');
INSERT INTO `sys_log` VALUES (1278, 16, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 13:49:56');
INSERT INTO `sys_log` VALUES (1279, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 13:49:57');
INSERT INTO `sys_log` VALUES (1280, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 13:49:58');
INSERT INTO `sys_log` VALUES (1281, 16, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 13:50:07');
INSERT INTO `sys_log` VALUES (1282, 16, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 13:50:41');
INSERT INTO `sys_log` VALUES (1283, 16, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 13:50:42');
INSERT INTO `sys_log` VALUES (1284, NULL, '系统功能：用户退出登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.logout()', '2024-05-01 13:51:25');
INSERT INTO `sys_log` VALUES (1285, 16, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-05-01 14:31:31');
INSERT INTO `sys_log` VALUES (1286, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 14:32:46');
INSERT INTO `sys_log` VALUES (1287, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 14:33:34');
INSERT INTO `sys_log` VALUES (1288, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 14:33:52');
INSERT INTO `sys_log` VALUES (1289, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 14:34:16');
INSERT INTO `sys_log` VALUES (1290, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 14:34:41');
INSERT INTO `sys_log` VALUES (1291, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 14:45:47');
INSERT INTO `sys_log` VALUES (1292, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 14:46:54');
INSERT INTO `sys_log` VALUES (1293, 16, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 14:46:59');
INSERT INTO `sys_log` VALUES (1294, 16, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 14:47:53');
INSERT INTO `sys_log` VALUES (1295, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 14:47:53');
INSERT INTO `sys_log` VALUES (1296, 16, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 14:55:33');
INSERT INTO `sys_log` VALUES (1297, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 14:55:33');
INSERT INTO `sys_log` VALUES (1298, 16, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 15:06:14');
INSERT INTO `sys_log` VALUES (1299, 16, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 15:06:15');
INSERT INTO `sys_log` VALUES (1300, 16, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 15:06:21');
INSERT INTO `sys_log` VALUES (1301, 16, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 15:06:21');
INSERT INTO `sys_log` VALUES (1302, 16, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 15:06:22');
INSERT INTO `sys_log` VALUES (1303, NULL, '系统功能：用户退出登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.logout()', '2024-05-01 15:07:12');
INSERT INTO `sys_log` VALUES (1304, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 15:09:10');
INSERT INTO `sys_log` VALUES (1305, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 15:09:11');
INSERT INTO `sys_log` VALUES (1306, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 15:09:11');
INSERT INTO `sys_log` VALUES (1307, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 15:09:16');
INSERT INTO `sys_log` VALUES (1308, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 15:09:17');
INSERT INTO `sys_log` VALUES (1309, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 15:09:18');
INSERT INTO `sys_log` VALUES (1310, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 15:10:15');
INSERT INTO `sys_log` VALUES (1311, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 15:10:16');
INSERT INTO `sys_log` VALUES (1312, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 15:10:22');
INSERT INTO `sys_log` VALUES (1313, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 15:10:30');
INSERT INTO `sys_log` VALUES (1314, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 15:10:30');
INSERT INTO `sys_log` VALUES (1315, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 15:10:32');
INSERT INTO `sys_log` VALUES (1316, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 15:10:33');
INSERT INTO `sys_log` VALUES (1317, 1, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-05-01 15:28:14');
INSERT INTO `sys_log` VALUES (1318, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-05-01 15:28:18');
INSERT INTO `sys_log` VALUES (1319, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-05-01 15:29:40');
INSERT INTO `sys_log` VALUES (1320, 1, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getUserInfo()', '2024-05-01 15:29:49');
INSERT INTO `sys_log` VALUES (1321, 1, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getWeather()', '2024-05-01 15:29:49');
INSERT INTO `sys_log` VALUES (1322, 1, '数据获取：日历房态', '115.148.108.53', '中国江西省赣州市', 'HotelRoomCalendarController.getMonthData()', '2024-05-01 15:29:53');
INSERT INTO `sys_log` VALUES (1323, 1, '数据获取：入住信息列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getCheckinList()', '2024-05-01 15:29:55');
INSERT INTO `sys_log` VALUES (1324, 1, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'HotelOrderController.getHotelOrders()', '2024-05-01 15:29:56');
INSERT INTO `sys_log` VALUES (1325, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-05-01 15:29:59');
INSERT INTO `sys_log` VALUES (1326, 1, '数据获取：酒店房间列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomController.getHotelRooms()', '2024-05-01 15:29:59');
INSERT INTO `sys_log` VALUES (1327, 1, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-05-01 15:30:01');
INSERT INTO `sys_log` VALUES (1328, 1, '数据获取：会员列表', '115.148.108.53', '中国江西省赣州市', 'HotelMemberController.getMembers()', '2024-05-01 15:30:03');
INSERT INTO `sys_log` VALUES (1329, 1, '数据获取：角色列表', '115.148.108.53', '中国江西省赣州市', 'SysUserController.listRoles()', '2024-05-01 15:30:07');
INSERT INTO `sys_log` VALUES (1330, 1, '系统功能：用户登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.login()', '2024-05-01 15:30:44');
INSERT INTO `sys_log` VALUES (1331, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-05-01 15:30:49');
INSERT INTO `sys_log` VALUES (1332, NULL, '系统功能：用户退出登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.logout()', '2024-05-01 15:30:52');
INSERT INTO `sys_log` VALUES (1333, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 15:32:05');
INSERT INTO `sys_log` VALUES (1334, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 15:32:06');
INSERT INTO `sys_log` VALUES (1335, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 15:32:06');
INSERT INTO `sys_log` VALUES (1336, 3, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getUserInfo()', '2024-05-01 15:33:48');
INSERT INTO `sys_log` VALUES (1337, 3, '数据获取：会员详细信息', '115.148.108.53', '中国江西省赣州市', 'ClientSpaceController.getMemberInfo()', '2024-05-01 15:33:48');
INSERT INTO `sys_log` VALUES (1338, 3, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getWeather()', '2024-05-01 15:33:49');
INSERT INTO `sys_log` VALUES (1339, 3, '数据获取：房间列表', '115.148.108.53', '中国江西省赣州市', 'ClientRoomController.getAvailableRooms()', '2024-05-01 15:33:53');
INSERT INTO `sys_log` VALUES (1340, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 15:33:58');
INSERT INTO `sys_log` VALUES (1341, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 15:34:01');
INSERT INTO `sys_log` VALUES (1342, 3, '数据获取：酒店订单列表', '115.148.108.53', '中国江西省赣州市', 'ClientOrderController.getHotelOrders()', '2024-05-01 15:34:02');
INSERT INTO `sys_log` VALUES (1343, 3, '系统功能：获取酒店首页信息', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelInfo()', '2024-05-01 15:34:07');
INSERT INTO `sys_log` VALUES (1344, 3, '数据获取：酒店房间类型列表', '115.148.108.53', '中国江西省赣州市', 'ClientHomeController.getHotelRoomTypes()', '2024-05-01 15:34:07');
INSERT INTO `sys_log` VALUES (1345, NULL, '系统功能：用户退出登录', '115.148.108.53', '中国江西省赣州市', 'SysUserController.logout()', '2024-05-01 15:34:53');
INSERT INTO `sys_log` VALUES (1346, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-05-01 15:37:27');
INSERT INTO `sys_log` VALUES (1347, 1, '数据获取：个人信息', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getUserInfo()', '2024-05-01 15:37:30');
INSERT INTO `sys_log` VALUES (1348, 1, '系统功能：获取实时天气', '115.148.108.53', '中国江西省赣州市', 'SysUserController.getWeather()', '2024-05-01 15:37:31');
INSERT INTO `sys_log` VALUES (1349, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-05-01 15:37:42');
INSERT INTO `sys_log` VALUES (1350, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-05-01 15:39:59');
INSERT INTO `sys_log` VALUES (1351, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-05-01 15:41:07');
INSERT INTO `sys_log` VALUES (1352, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-05-01 15:41:24');
INSERT INTO `sys_log` VALUES (1353, 1, '数据获取：酒店运营数据总览', '115.148.108.53', '中国江西省赣州市', 'DataStatisticsController.getTodayData()', '2024-05-01 15:41:44');
INSERT INTO `sys_log` VALUES (1354, 1, '系统功能：用户登录', '127.0.0.1', '内网IP', 'SysUserController.login()', '2024-05-02 17:40:39');
INSERT INTO `sys_log` VALUES (1355, 1, '数据获取：酒店运营数据总览', '127.0.0.1', '内网IP', 'DataStatisticsController.getTodayData()', '2024-05-02 17:40:39');
INSERT INTO `sys_log` VALUES (1356, 1, '数据获取：酒店运营数据总览', '127.0.0.1', '内网IP', 'DataStatisticsController.getTodayData()', '2024-05-02 17:40:45');
INSERT INTO `sys_log` VALUES (1357, 1, '数据获取：个人信息', '127.0.0.1', '内网IP', 'SysUserController.getUserInfo()', '2024-05-02 17:40:51');
INSERT INTO `sys_log` VALUES (1358, 1, '系统功能：获取实时天气', '127.0.0.1', '内网IP', 'SysUserController.getWeather()', '2024-05-02 17:40:51');
INSERT INTO `sys_log` VALUES (1359, 1, '数据获取：酒店运营数据总览', '127.0.0.1', '内网IP', 'DataStatisticsController.getTodayData()', '2024-05-02 17:41:01');
INSERT INTO `sys_log` VALUES (1360, 1, '数据获取：酒店运营数据总览', '127.0.0.1', '内网IP', 'DataStatisticsController.getTodayData()', '2024-05-02 17:41:04');
INSERT INTO `sys_log` VALUES (1361, 1, '数据获取：酒店运营数据总览', '127.0.0.1', '内网IP', 'DataStatisticsController.getTodayData()', '2024-05-02 17:41:08');
INSERT INTO `sys_log` VALUES (1362, 1, '数据获取：酒店运营数据总览', '127.0.0.1', '内网IP', 'DataStatisticsController.getTodayData()', '2024-05-02 17:41:21');
INSERT INTO `sys_log` VALUES (1363, 1, '数据获取：酒店运营数据总览', '127.0.0.1', '内网IP', 'DataStatisticsController.getTodayData()', '2024-05-02 17:41:23');
INSERT INTO `sys_log` VALUES (1364, 1, '系统功能：用户登录', '18.179.36.166', '日本东京都东京', 'SysUserController.login()', '2024-05-02 17:41:57');
INSERT INTO `sys_log` VALUES (1365, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:41:58');
INSERT INTO `sys_log` VALUES (1366, 1, '数据获取：日历房态', '18.179.36.166', '日本东京都东京', 'HotelRoomCalendarController.getMonthData()', '2024-05-02 17:42:08');
INSERT INTO `sys_log` VALUES (1367, 1, '数据获取：个人信息', '18.179.36.166', '日本东京都东京', 'SysUserController.getUserInfo()', '2024-05-02 17:42:13');
INSERT INTO `sys_log` VALUES (1368, 1, '系统功能：获取实时天气', '18.179.36.166', '日本东京都东京', 'SysUserController.getWeather()', '2024-05-02 17:42:14');
INSERT INTO `sys_log` VALUES (1369, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:42:41');
INSERT INTO `sys_log` VALUES (1370, 1, '数据获取：个人信息', '18.179.36.166', '日本东京都东京', 'SysUserController.getUserInfo()', '2024-05-02 17:42:44');
INSERT INTO `sys_log` VALUES (1371, 1, '系统功能：获取实时天气', '18.179.36.166', '日本东京都东京', 'SysUserController.getWeather()', '2024-05-02 17:42:44');
INSERT INTO `sys_log` VALUES (1372, 1, '数据获取：个人信息', '18.179.36.166', '日本东京都东京', 'SysUserController.getUserInfo()', '2024-05-02 17:43:03');
INSERT INTO `sys_log` VALUES (1373, 1, '系统功能：获取实时天气', '18.179.36.166', '日本东京都东京', 'SysUserController.getWeather()', '2024-05-02 17:43:04');
INSERT INTO `sys_log` VALUES (1374, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:43:06');
INSERT INTO `sys_log` VALUES (1375, 1, '系统功能：用户登录', '18.179.36.166', '日本东京都东京', 'SysUserController.login()', '2024-05-02 17:45:29');
INSERT INTO `sys_log` VALUES (1376, 1, '数据获取：个人信息', '18.179.36.166', '日本东京都东京', 'SysUserController.getUserInfo()', '2024-05-02 17:45:39');
INSERT INTO `sys_log` VALUES (1377, 1, '系统功能：获取实时天气', '18.179.36.166', '日本东京都东京', 'SysUserController.getWeather()', '2024-05-02 17:45:40');
INSERT INTO `sys_log` VALUES (1378, 1, '数据获取：入住信息列表', '18.179.36.166', '日本东京都东京', 'HotelOrderController.getCheckinList()', '2024-05-02 17:46:07');
INSERT INTO `sys_log` VALUES (1379, 1, '数据获取：酒店房间列表', '18.179.36.166', '日本东京都东京', 'HotelRoomController.getHotelRooms()', '2024-05-02 17:46:10');
INSERT INTO `sys_log` VALUES (1380, 1, '数据获取：酒店房间类型列表', '18.179.36.166', '日本东京都东京', 'HotelRoomTypeController.getHotelRoomTypes()', '2024-05-02 17:46:10');
INSERT INTO `sys_log` VALUES (1381, 1, '数据获取：个人信息', '18.179.36.166', '日本东京都东京', 'SysUserController.getUserInfo()', '2024-05-02 17:46:13');
INSERT INTO `sys_log` VALUES (1382, 1, '系统功能：获取实时天气', '18.179.36.166', '日本东京都东京', 'SysUserController.getWeather()', '2024-05-02 17:46:13');
INSERT INTO `sys_log` VALUES (1383, NULL, '系统功能：用户退出登录', '18.179.36.166', '日本东京都东京', 'SysUserController.logout()', '2024-05-02 17:46:23');
INSERT INTO `sys_log` VALUES (1384, 1, '系统功能：用户登录', '18.179.36.166', '日本东京都东京', 'SysUserController.login()', '2024-05-02 17:46:32');
INSERT INTO `sys_log` VALUES (1385, 1, '数据获取：个人信息', '18.179.36.166', '日本东京都东京', 'SysUserController.getUserInfo()', '2024-05-02 17:46:37');
INSERT INTO `sys_log` VALUES (1386, 1, '系统功能：获取实时天气', '18.179.36.166', '日本东京都东京', 'SysUserController.getWeather()', '2024-05-02 17:46:37');
INSERT INTO `sys_log` VALUES (1387, 1, '数据获取：个人信息', '18.179.36.166', '日本东京都东京', 'SysUserController.getUserInfo()', '2024-05-02 17:46:42');
INSERT INTO `sys_log` VALUES (1388, 1, '系统功能：获取实时天气', '18.179.36.166', '日本东京都东京', 'SysUserController.getWeather()', '2024-05-02 17:46:42');
INSERT INTO `sys_log` VALUES (1389, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:47:34');
INSERT INTO `sys_log` VALUES (1390, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:51:58');
INSERT INTO `sys_log` VALUES (1391, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:52:01');
INSERT INTO `sys_log` VALUES (1392, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:52:02');
INSERT INTO `sys_log` VALUES (1393, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:52:06');
INSERT INTO `sys_log` VALUES (1394, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:52:07');
INSERT INTO `sys_log` VALUES (1395, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:53:31');
INSERT INTO `sys_log` VALUES (1396, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:53:32');
INSERT INTO `sys_log` VALUES (1397, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:53:48');
INSERT INTO `sys_log` VALUES (1398, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:53:49');
INSERT INTO `sys_log` VALUES (1399, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:54:03');
INSERT INTO `sys_log` VALUES (1400, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:54:27');
INSERT INTO `sys_log` VALUES (1401, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:56:18');
INSERT INTO `sys_log` VALUES (1402, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:56:31');
INSERT INTO `sys_log` VALUES (1403, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:56:32');
INSERT INTO `sys_log` VALUES (1404, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:56:59');
INSERT INTO `sys_log` VALUES (1405, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:57:00');
INSERT INTO `sys_log` VALUES (1406, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 17:57:03');
INSERT INTO `sys_log` VALUES (1407, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 18:04:46');
INSERT INTO `sys_log` VALUES (1408, 1, '数据获取：酒店运营数据总览', '18.179.36.166', '日本东京都东京', 'DataStatisticsController.getTodayData()', '2024-05-02 18:30:01');
INSERT INTO `sys_log` VALUES (1409, 1, '数据获取：个人信息', '18.179.36.166', '日本东京都东京', 'SysUserController.getUserInfo()', '2024-05-02 18:30:43');
INSERT INTO `sys_log` VALUES (1410, 1, '系统功能：获取实时天气', '18.179.36.166', '日本东京都东京', 'SysUserController.getWeather()', '2024-05-02 18:30:43');
INSERT INTO `sys_log` VALUES (1411, NULL, '系统功能：用户退出登录', '18.179.36.166', '日本东京都东京', 'SysUserController.logout()', '2024-05-02 18:54:57');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色代号',
  `permission` json NULL COMMENT '角色拥有的路由访问权限',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色描述',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色状态(正常|冻结)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', '[\"PermissionPage\", \"PermissionButton\", \"Member\", \"Staff\", \"Role\", \"System\"]', '拥有完整权限', '正常', '2024-03-28 15:00:31', '2024-03-28 15:06:49');
INSERT INTO `sys_role` VALUES (2, '酒店前台', 'common', '[\"PermissionPage\", \"PermissionButton\", \"Member\"]', '人员管理只拥有对酒店会员的操作权限，且无法访问系统操作日志', '正常', '2024-03-28 15:02:56', '2024-03-28 15:02:59');
INSERT INTO `sys_role` VALUES (3, '酒店顾客', 'guest', '[]', '无权访问后台管理系统', '正常', '2024-03-28 15:05:42', '2024-03-28 15:05:45');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `role_id` int NULL DEFAULT NULL COMMENT '角色ID，关联系统角色表',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账户状态（正常/封禁/冻结）\r\n冻结仅用于软删除，避免出现外键引用问题',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `role_id`(`role_id` ASC) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'CHQ', '3fde6bb0541387e4ebdadf7c2ff31123', 'male', 'yorha_chq@foxmail.com', '19907076878', 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/33408b2d-4055-4a4b-99ec-d1e592cad703.jpg', 1, '正常', '2024-03-26 11:02:12', '2024-04-29 00:35:05');
INSERT INTO `sys_user` VALUES (2, 'Waiter', '3fde6bb0541387e4ebdadf7c2ff31123', 'male', 'yorha_chq@foxmail.com', '15023456789', 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/1a7590f0-d4da-4b89-a21d-43cd67dffe84.png', 2, '正常', '2024-04-02 18:45:05', '2024-04-29 00:39:45');
INSERT INTO `sys_user` VALUES (3, 'Guest', '3fde6bb0541387e4ebdadf7c2ff31123', 'male', 'yorha_chq@foxmail.com', '13734567899', 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/e4e44226-5365-4320-a50a-404ddbc127b2.png', 3, '正常', '2024-04-04 16:47:01', '2024-05-01 00:45:31');
INSERT INTO `sys_user` VALUES (4, 'Member1', '3fde6bb0541387e4ebdadf7c2ff31123', 'male', 'z.byjw@nnpwdxukf.bn', '19101532696', 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/default_user.png', 3, '正常', '2024-04-17 17:08:33', '2024-04-28 17:30:02');
INSERT INTO `sys_user` VALUES (5, 'Member2', '3fde6bb0541387e4ebdadf7c2ff31123', 'male', 'example@org.com', '15289652364', 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/default_user.png', 3, '正常', '2024-04-17 17:12:07', '2024-04-25 00:36:24');
INSERT INTO `sys_user` VALUES (6, 'Member3', '9e99905d8cbba46cca1b0bbdf85ca1bb', 'female', 'example@org.com', '17179526863', 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/default_user.png', 3, '正常', '2024-04-17 17:14:53', '2024-04-26 12:55:40');
INSERT INTO `sys_user` VALUES (7, 'Member4', '4297f44b13955235245b2497399d7a93', 'female', 'example@org.com', '15902123123', 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/default_user.png', 3, '正常', '2024-04-24 23:55:38', '2024-04-29 20:56:21');
INSERT INTO `sys_user` VALUES (8, 'Traveller', '9e99905d8cbba46cca1b0bbdf85ca1bb', 'male', 'example@org.com', '13985267495', 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/7ed843fe-422b-4415-b8ca-bb1497ab90af.png', 3, '正常', '2024-04-25 00:39:05', '2024-04-28 17:50:35');
INSERT INTO `sys_user` VALUES (9, 'Waiter1', '3fde6bb0541387e4ebdadf7c2ff31123', NULL, NULL, NULL, 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/default_admin.png', 2, '封禁', '2024-04-25 10:10:37', '2024-04-29 01:26:06');
INSERT INTO `sys_user` VALUES (10, 'Waiter2', '3fde6bb0541387e4ebdadf7c2ff31123', NULL, NULL, NULL, 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/default_admin.png', 2, '封禁', '2024-04-25 10:21:20', '2024-04-28 19:08:38');
INSERT INTO `sys_user` VALUES (11, 'Admin1', '4297f44b13955235245b2497399d7a93', NULL, NULL, NULL, 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/default_admin.png', 1, '封禁', '2024-04-25 10:21:52', '2024-04-28 20:21:02');
INSERT INTO `sys_user` VALUES (12, 'Admin2', '3fde6bb0541387e4ebdadf7c2ff31123', NULL, NULL, NULL, 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/default_admin.png', 1, '封禁', '2024-04-28 19:48:52', '2024-04-28 20:01:09');
INSERT INTO `sys_user` VALUES (13, 'Guest2', '3fde6bb0541387e4ebdadf7c2ff31123', 'male', 'aaa@example.com', '15968578952', 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/935b5c95-92b9-4b68-a83a-cfcf8760bb79.png', 3, '正常', '2024-04-28 19:49:45', '2024-04-28 20:09:14');
INSERT INTO `sys_user` VALUES (14, 'Waiter3', '3fde6bb0541387e4ebdadf7c2ff31123', NULL, NULL, NULL, 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/default_admin.png', 2, '正常', '2024-04-28 19:58:07', '2024-04-28 19:58:21');
INSERT INTO `sys_user` VALUES (15, 'Waiter4', '3fde6bb0541387e4ebdadf7c2ff31123', NULL, NULL, NULL, 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/default_admin.png', 2, '正常', '2024-04-28 20:00:50', '2024-04-28 20:00:50');
INSERT INTO `sys_user` VALUES (16, 'Guest3', '3fde6bb0541387e4ebdadf7c2ff31123', 'male', 'yorha_chq@foxmail.com', '15986547523', 'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/default_user.png', 3, '正常', '2024-04-29 22:56:42', '2024-05-01 13:49:22');

-- ----------------------------
-- Procedure structure for CleanDeletedRecords
-- ----------------------------
DROP PROCEDURE IF EXISTS `CleanDeletedRecords`;
delimiter ;;
CREATE PROCEDURE `CleanDeletedRecords`()
BEGIN
-- 删除 sys_user 表中标记为冻结状态的记录
DELETE FROM sys_user WHERE status = '冻结';

-- 删除 sys_role 表中标记为冻结状态的记录
DELETE FROM sys_role WHERE status = '冻结';

-- 删除 hotel_room 表中标记为冻结状态的记录
DELETE FROM hotel_room WHERE status = '冻结';

-- 删除 hotel_room_type 表中标记为冻结状态的记录
DELETE FROM hotel_room_type WHERE status = '冻结';

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_update_data_statistics
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_update_data_statistics`;
delimiter ;;
CREATE PROCEDURE `sp_update_data_statistics`(IN p_date DATE)
BEGIN
    DECLARE v_checkin_count INT;
    DECLARE v_checkout_count INT;
    DECLARE v_order_count INT;
    DECLARE v_revenue DECIMAL(10,2);
    
    -- 统计今日预入住人数
    SELECT COUNT(*) INTO v_checkin_count
    FROM hotel_order
    WHERE checkin_date = p_date;
    
    -- 统计今日预退房人数
    SELECT COUNT(*) INTO v_checkout_count
    FROM hotel_order
    WHERE checkout_date = p_date;
    
    -- 统计今日订单笔数
    SELECT COUNT(*) INTO v_order_count
    FROM hotel_order
    WHERE create_time >= CONCAT(p_date, ' 00:00:00') AND create_time < CONCAT(p_date, ' 23:59:59');
    
    -- 统计今日营业额
    SELECT COALESCE(SUM(payment), 0) INTO v_revenue
    FROM hotel_order
    WHERE create_time >= CONCAT(p_date, ' 00:00:00') AND create_time < CONCAT(p_date, ' 23:59:59')
        AND status IN ('入住中', '已退房');
    
    -- 判断是否已存在当天的统计记录
    IF EXISTS(SELECT 1 FROM data_statistics WHERE date = p_date) THEN
        -- 如果存在,则更新记录
        UPDATE data_statistics
        SET checkin_count = v_checkin_count,
            checkout_count = v_checkout_count,
            order_count = v_order_count,
            revenue = v_revenue
        WHERE date = p_date;
    ELSE
        -- 如果不存在,则插入新记录
        INSERT INTO data_statistics (date, checkin_count, checkout_count, order_count, revenue)
        VALUES (p_date, v_checkin_count, v_checkout_count, v_order_count, v_revenue);
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Event structure for CleanDeletedData
-- ----------------------------
DROP EVENT IF EXISTS `CleanDeletedData`;
delimiter ;;
CREATE EVENT `CleanDeletedData`
ON SCHEDULE
EVERY '7' DAY STARTS '2024-03-25 11:36:53'
DO BEGIN
    -- 在这里执行清理脚本
    CALL CleanDeletedRecords();
END
;;
delimiter ;

-- ----------------------------
-- Event structure for ev_daily_statistics
-- ----------------------------
DROP EVENT IF EXISTS `ev_daily_statistics`;
delimiter ;;
CREATE EVENT `ev_daily_statistics`
ON SCHEDULE
EVERY '1' DAY STARTS '2024-04-30 00:00:00'
DO BEGIN
    CALL sp_update_data_statistics(CURRENT_DATE);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table hotel_order
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_hotel_order_after_insert`;
delimiter ;;
CREATE TRIGGER `tr_hotel_order_after_insert` AFTER INSERT ON `hotel_order` FOR EACH ROW BEGIN
    CALL sp_update_data_statistics(CURDATE());
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table hotel_order
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_hotel_order_after_update`;
delimiter ;;
CREATE TRIGGER `tr_hotel_order_after_update` AFTER UPDATE ON `hotel_order` FOR EACH ROW BEGIN
    CALL sp_update_data_statistics(CURDATE());
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table hotel_order
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_hotel_order_after_delete`;
delimiter ;;
CREATE TRIGGER `tr_hotel_order_after_delete` AFTER DELETE ON `hotel_order` FOR EACH ROW BEGIN
    CALL sp_update_data_statistics(CURDATE());
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
