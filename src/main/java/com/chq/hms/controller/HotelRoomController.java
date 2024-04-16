package com.chq.hms.controller;

import com.chq.hms.domain.HotelRoom;
import com.chq.hms.domain.Result;
import com.chq.hms.service.HotelRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/hotelRoom")
public class HotelRoomController {
    @SuppressWarnings("all")
    @Autowired
    private HotelRoomService hotelRoomService;

    @PostMapping
    public Result<Void> addHotelRoom(@RequestBody HotelRoom hotelRoom) {
        hotelRoomService.addHotelRoom(hotelRoom);
        return Result.success();
    }

    @PutMapping
    public Result<Void> updateHotelRoom(@RequestBody HotelRoom hotelRoom) {
        hotelRoomService.updateHotelRoom(hotelRoom);
        return Result.success();
    }

    @DeleteMapping("/{roomId}")
    public Result<Void> deleteHotelRoom(@PathVariable Integer roomId) {
        hotelRoomService.deleteHotelRoom(roomId);
        return Result.success();
    }

    @GetMapping
    public Result<List<HotelRoom>> getAllHotelRooms() {
        List<HotelRoom> hotelRooms = hotelRoomService.getAllHotelRooms();
        return Result.success(hotelRooms);
    }

}
