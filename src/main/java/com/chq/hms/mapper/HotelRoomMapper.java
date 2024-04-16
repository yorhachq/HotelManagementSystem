package com.chq.hms.mapper;

import com.chq.hms.domain.HotelRoom;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HotelRoomMapper {
    void insertHotelRoom(HotelRoom hotelRoom);

    void updateHotelRoom(HotelRoom hotelRoom);

    HotelRoom selectHotelRoomById(Integer roomId);

    List<HotelRoom> selectAllHotelRooms();
}
