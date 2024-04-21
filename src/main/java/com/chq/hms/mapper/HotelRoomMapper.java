package com.chq.hms.mapper;

import com.chq.hms.domain.HotelRoom;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface HotelRoomMapper {
    /**
     * 添加酒店房间
     *
     * @param hotelRoom 酒店房间信息
     */
    void insertHotelRoom(HotelRoom hotelRoom);

    /**
     * 更新酒店房间
     *
     * @param hotelRoom 酒店房间信息
     */
    void updateHotelRoom(HotelRoom hotelRoom);

    /**
     * 根据ID查询酒店房间
     *
     * @param roomId 房间ID
     * @return 酒店房间信息
     */
    HotelRoom selectHotelRoomById(Integer roomId);

    /**
     * 查询酒店房间列表
     *
     * @param roomNumber  房间号(可选)
     * @param floorNumber 楼层号(可选)
     * @param roomTypeId  房型ID(可选)
     * @param status      房间状态(可选)
     * @return 酒店房间列表
     */
    List<HotelRoom> selectHotelRooms(@Param("roomNumber") Integer roomNumber,
                                     @Param("floorNumber") Integer floorNumber,
                                     @Param("roomTypeId") Integer roomTypeId,
                                     @Param("status") String status);

    /**
     * 查询酒店房间总数
     *
     * @return 酒店房间总数
     */
    int selectCount();

    /**
     * 查询所有房间
     *
     * @return 所有房间列表
     */
    List<HotelRoom> selectAll();

}
