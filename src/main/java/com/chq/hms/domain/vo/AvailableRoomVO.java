package com.chq.hms.domain.vo;

import com.chq.hms.domain.HotelRoomType;
import lombok.Data;

/**
 * 可用房间视图对象
 */
@Data
public class AvailableRoomVO {
    // 房间id
    private Integer roomId;
    // 房间号
    private Integer roomNumber;
    // 房间楼层
    private Integer floorNumber;
    // 房型信息
    private HotelRoomType roomType;
}
