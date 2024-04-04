package com.chq.hms.domain;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 充值记录
 */
@Data
public class HotelRechargeRecord {
    private Integer rechargeId;
    // 对应的会员ID
    @NotNull
    private Integer memberId;
    // 充值金额
    private Double amount;
    // 支付方式(支付宝/微信/现金)
    private String paymentMethod;
    // 充值时间
    private LocalDateTime createTime;
}
