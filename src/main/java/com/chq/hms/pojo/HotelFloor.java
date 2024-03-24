package com.chq.hms.pojo;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.groups.Default;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 酒店楼层类
 */
@Data
public class HotelFloor {
    @NotNull(groups = Update.class)
    private Integer floorId;
    // 楼层数
    private Integer floorNumber;
    // 描述
    private String description;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;

    public interface Update extends Default {
    }
}
