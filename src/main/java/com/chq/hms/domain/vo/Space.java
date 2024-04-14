package com.chq.hms.domain.vo;

import lombok.Data;

/**
 * 数据统计
 */
@Data
public class Space {
    private Integer id;
    // 统计数据所属的日期
    private Integer date;
    // 当日预入住人数
    private Integer checkinCount;
    // 当日预退房人数
    private Integer checkoutCount;
    // 当日订单笔数
    private Integer orderCount;
    // 当日营业额
    private Double revenue;
}
