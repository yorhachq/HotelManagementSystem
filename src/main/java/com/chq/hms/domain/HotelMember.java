package com.chq.hms.domain;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.groups.Default;
import lombok.Data;

import java.time.LocalDateTime;

/*
 * 酒店会员(通过前台注册的用户即自动成为会员)
 * 只用于会员积分成长体系,账户状态始终与关联的系统用户一致
 */
@Data
public class HotelMember{
    @NotNull(groups = Update.class)
    private Integer memberId;
    // 关联的用户id
    @NotNull
    private Integer userId;
    // 会员等级
    private Integer memberLevel;
    // 会员积分
    private Integer memberPoints;
    // 会员账户余额
    private Double balance;

    private LocalDateTime createTime;
    private LocalDateTime updateTime;

    public interface Update extends Default {
    }
}

