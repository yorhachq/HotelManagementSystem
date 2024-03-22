-- 删除已存在的表
DROP TABLE IF EXISTS data_statistics;
DROP TABLE IF EXISTS hotel_order;
DROP TABLE IF EXISTS hotel_member;
DROP TABLE IF EXISTS hotel_recharge_record;
DROP TABLE IF EXISTS hotel_room_type;
DROP TABLE IF EXISTS hotel_room;
DROP TABLE IF EXISTS hotel_floor;
DROP TABLE IF EXISTS sys_log;
DROP TABLE IF EXISTS sys_role;
DROP TABLE IF EXISTS sys_user;

-- 创建系统角色表
CREATE TABLE sys_role (
    role_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '角色ID',
    role_name VARCHAR(50) NOT NULL COMMENT '角色名称',
    role_code VARCHAR(50) NOT NULL COMMENT '角色代号',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间'
) COMMENT = '系统角色表';

-- 创建系统用户表
CREATE TABLE sys_user (
    user_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
    username VARCHAR(255) NOT NULL COMMENT '用户名',
    password VARCHAR(255) NOT NULL COMMENT '密码',
    gender VARCHAR(10) COMMENT '性别',
    email VARCHAR(255) COMMENT '电子邮箱',
    phone VARCHAR(20) COMMENT '手机号码',
    avatar VARCHAR(255) COMMENT '用户头像',
    role_id INT COMMENT '角色ID，关联系统角色表',
    status VARCHAR(20) COMMENT '账户状态（正常/封禁）',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    FOREIGN KEY (role_id) REFERENCES sys_role(role_id)
) COMMENT = '系统用户表';

-- 创建系统日志表
CREATE TABLE sys_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '日志ID',
    user_id INT COMMENT '用户ID，关联系统用户表',
    action VARCHAR(255) COMMENT '操作行为',
    remark VARCHAR(255) COMMENT '备注',
    log_time DATETIME COMMENT '日志记录时间'
) COMMENT = '系统日志表';

-- 创建酒店楼层表
CREATE TABLE hotel_floor (
    floor_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '楼层ID',
    floor_number INT COMMENT '楼层号',
    description VARCHAR(255) COMMENT '描述',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间'
) COMMENT = '酒店楼层表';

-- 创建酒店房型表
CREATE TABLE hotel_room_type (
    room_type_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '房型ID',
    type_name VARCHAR(50) COMMENT '房型名称',
    description VARCHAR(255) COMMENT '描述',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间'
) COMMENT = '酒店房型表';

-- 创建酒店房间表
CREATE TABLE hotel_room (
    room_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '房间ID',
    room_number VARCHAR(20) COMMENT '房间号',
    floor_id INT COMMENT '楼层ID，关联酒店楼层表',
    room_type_id INT COMMENT '房型ID，关联酒店房型表',
    status VARCHAR(20) COMMENT '房间状态（已入住/未入住）',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    FOREIGN KEY (floor_id) REFERENCES hotel_floor(floor_id),
    FOREIGN KEY (room_type_id) REFERENCES hotel_room_type(room_type_id)
) COMMENT = '酒店房间表';

-- 创建酒店会员信息表
CREATE TABLE hotel_member (
    member_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '会员ID',
    user_id INT COMMENT '用户ID，关联系统用户表',
    member_level VARCHAR(50) COMMENT '会员等级',
    member_points INT COMMENT '会员积分',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    FOREIGN KEY (user_id) REFERENCES sys_user(user_id)
) COMMENT = '酒店会员信息表';

-- 创建酒店订单信息表
CREATE TABLE hotel_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '订单ID',
    member_id INT COMMENT '会员ID，关联酒店会员信息表',
    room_id INT COMMENT '房间ID，关联酒店房间表',
    order_num VARCHAR(50) COMMENT '订单号',
    reserve_date DATE COMMENT '预订日期',
    checkin_date DATE COMMENT '入住日期',
    checkout_date DATE COMMENT '退房日期',
    status VARCHAR(20) COMMENT '订单状态（已预订/入住中/已退房/已退款）',
    payment DECIMAL(10,2) COMMENT '支付金额',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    FOREIGN KEY (member_id) REFERENCES hotel_member(member_id),
    FOREIGN KEY (room_id) REFERENCES hotel_room(room_id)
) COMMENT = '酒店订单信息表';

-- 创建酒店会员充值记录表
CREATE TABLE hotel_recharge_record (
    recharge_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '充值记录ID',
    member_id INT COMMENT '会员ID，关联酒店会员信息表',
    amount DECIMAL(10,2) COMMENT '充值金额',
    payment_method VARCHAR(50) COMMENT '支付方式（支付宝/微信/现金）',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    FOREIGN KEY (member_id) REFERENCES hotel_member(member_id)
) COMMENT = '酒店会员充值记录表';

-- 创建酒店经营数据统计表
CREATE TABLE data_statistics (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '统计ID',
    date DATE COMMENT '日期',
    checkin_count INT COMMENT '今日预入住人数',
    checkout_count INT COMMENT '今日预退房人数',
    order_count INT COMMENT '今日订单笔数',
    revenue DECIMAL(10,2) COMMENT '今日营业额'
) COMMENT = '酒店经营数据统计表';
