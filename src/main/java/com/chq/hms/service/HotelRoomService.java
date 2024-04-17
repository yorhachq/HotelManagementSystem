package com.chq.hms.service;

import com.chq.hms.domain.HotelRoom;
import com.chq.hms.domain.vo.PageBean;

public interface HotelRoomService {
    /**
     * 添加酒店房间
     *
     * @param hotelRoom 酒店房间信息
     */
    void addHotelRoom(HotelRoom hotelRoom);

    /**
     * 更新酒店房间
     *
     * @param hotelRoom 酒店房间信息
     */
    void updateHotelRoom(HotelRoom hotelRoom);

    /**
     * 删除酒店房间(软删除)
     *
     * @param roomId 房间ID
     */
    void deleteHotelRoom(Integer roomId);

    /**
     * 查询酒店房间列表
     *
     * @param roomNumber  房间号(可选)
     * @param floorNumber 楼层号(可选)
     * @param roomTypeId  房型ID(可选)
     * @param status      房间状态(可选)
     * @param pageNum     页码(可选,默认为1)
     * @param pageSize    每页条数(可选,默认为10)
     * @param orderBy     排序字段(可选,默认为create_time)
     * @param orderType   排序方式(可选,默认为desc)
     * @return 酒店房间列表
     */
    PageBean<HotelRoom> getHotelRooms(Integer roomNumber, Integer floorNumber, Integer roomTypeId, String status,
                                      Integer pageNum, Integer pageSize, String orderBy, String orderType);
}
