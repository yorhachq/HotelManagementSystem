package com.chq.hms.domain.vo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 入住管理视图对象
 */
@Data
public class CheckinVO {
    // 订单ID
    private Long orderId;
    // 用户ID
    private Long userId;
    // 用户名
    private String username;
    // 手机号
    private String phone;
    // 用户性别
    private String gender;
    // 房间ID
    private Long roomId;
    // 房间号
    private Integer roomNumber;
    // 房间类型
    private String typeName;
    // 订单号
    private String orderNum;
    // 入住日期
    private String checkinDate;
    // 退房日期
    private String checkoutDate;
    // 支付金额
    private BigDecimal payment;
}
