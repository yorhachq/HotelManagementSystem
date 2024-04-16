package com.chq.hms.service.impl;

import com.chq.hms.domain.HotelRoom;
import com.chq.hms.mapper.HotelRoomMapper;
import com.chq.hms.service.HotelRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HotelRoomServiceImpl implements HotelRoomService {
    @Autowired
    private HotelRoomMapper hotelRoomMapper;

    @Override
    public void addHotelRoom(HotelRoom hotelRoom) {
        hotelRoom.setStatus("空闲");
        hotelRoomMapper.insertHotelRoom(hotelRoom);
    }

    @Override
    public void updateHotelRoom(HotelRoom hotelRoom) {
        hotelRoomMapper.updateHotelRoom(hotelRoom);
    }

    @Override
    public void deleteHotelRoom(Integer roomId) {
        HotelRoom hotelRoom = hotelRoomMapper.selectHotelRoomById(roomId);
        hotelRoom.setStatus("冻结");
        hotelRoomMapper.updateHotelRoom(hotelRoom);
    }

    @Override
    public List<HotelRoom> getAllHotelRooms() {
        return hotelRoomMapper.selectAllHotelRooms();
    }
}
