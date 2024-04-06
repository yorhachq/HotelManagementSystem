package com.chq.hms.domain;

import com.chq.hms.anno.OrderStatus;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.groups.Default;
import lombok.Data;

import java.time.LocalDate;

/**
 * 酒店订单
 */
@Data
public class HotelOrder {
    @NotNull(groups = Update.class)
    private Integer orderId;
    // 创建订单的用户ID(为避免外键引用问题,业务逻辑上规定是系统用户创建的订单,而非酒店会员)
    @NotNull
    private Integer userId;
    // 订单对应的房间ID
    private Integer roomId;
    // 订单号(时间相关+生成规则)
    private String orderNum;
    // 预定日期
    private LocalDate reserveDate;
    // 入住日期
    private LocalDate checkinDate;
    // 退房日期
    private LocalDate checkoutDate;
    // 订单状态(已预订/入住中/已退房/已取消)
    @OrderStatus
    private String status;
    // 支付金额(若已取消订单，前端加删除线处理后显示金额，且该笔订单不纳入营业额统计)
    private Double payment;

    private LocalDate createTime;
    private LocalDate updateTime;

    public interface Update extends Default {
    }
}