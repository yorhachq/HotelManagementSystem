package com.chq.hms.domain;

import com.chq.hms.anno.RoomStatus;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.groups.Default;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 酒店房间
 */
@Data
public class HotelRoom {
    @NotNull(groups = Update.class)
    private Integer roomId;
    // 房间号,如601
    @NotEmpty
    private Integer roomNumber;
    // 房间所在的楼层ID
    private Integer floorNumber;
    // 房间类型ID(实际的房间类型名字段是typeName)
    @NotNull
    private Integer roomTypeId;
    // 房间状态(空闲,已预订,已入住,冻结)
    @RoomStatus
    private String status;

    private LocalDateTime createTime;
    private LocalDateTime updateTime;

    public interface Update extends Default {
    }
}
