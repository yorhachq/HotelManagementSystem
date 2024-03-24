package com.chq.hms.pojo;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.groups.Default;
import lombok.Data;

import java.time.LocalDateTime;

/*
 * 酒店会员类
 */
@Data
public class HotelMember {
    @NotNull(groups = Update.class)
    private Integer memberId;
    // 关联的用户id
    @NotNull
    private Integer userId;
    // 会员等级
    private Integer memberLevel;
    // 会员积分
    private Integer memberPoints;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;

    public interface Update extends Default {
    }
}

