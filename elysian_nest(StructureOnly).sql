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

 Date: 02/05/2024 18:51:28
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
) ENGINE = InnoDB AUTO_INCREMENT = 1411 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

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
