package com.chq.hms.domain;

import com.chq.hms.anno.AvailableStatus;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.groups.Default;
import lombok.Data;

import java.time.LocalDateTime;

/**
 *  酒店房间类型
 */
@Data
public class HotelRoomType {
    @NotNull(groups = Update.class)
    private Integer roomTypeId;
    // 房型名称
    private String typeName;
    // 房型价格
    private Double price;
    // 房型图片
    private String image;
    // 房型描述
    private String description;
    // 房型状态(启用|冻结)
    @AvailableStatus
    private String status;

    private LocalDateTime createTime;
    private LocalDateTime updateTime;

    public interface Update extends Default {
    }
}
