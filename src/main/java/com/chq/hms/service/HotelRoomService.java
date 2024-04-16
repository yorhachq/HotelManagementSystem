package com.chq.hms.service;

import com.chq.hms.domain.HotelRoom;

import java.util.List;

public interface HotelRoomService {
    void addHotelRoom(HotelRoom hotelRoom);

    void updateHotelRoom(HotelRoom hotelRoom);

    void deleteHotelRoom(Integer roomId);

    List<HotelRoom> getAllHotelRooms();
}
