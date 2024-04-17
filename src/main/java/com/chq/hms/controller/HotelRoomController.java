package com.chq.hms.controller;

import com.chq.hms.domain.HotelRoom;
import com.chq.hms.domain.Result;
import com.chq.hms.domain.vo.PageBean;
import com.chq.hms.service.HotelRoomService;
import com.chq.hms.service.HotelRoomTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 酒店房间管理
 */
@RestController
@RequestMapping("/hotelRoom")
public class HotelRoomController {
    @SuppressWarnings("all")
    @Autowired
    private HotelRoomService hotelRoomService;
    @Autowired
    private HotelRoomTypeService hotelRoomTypeService;

    /**
     * 添加酒店房间
     *
     * @param hotelRoom 酒店房间信息
     * @return 操作结果
     */
    @PostMapping
    public Result<Void> addHotelRoom(@RequestBody HotelRoom hotelRoom) {
        hotelRoomService.addHotelRoom(hotelRoom);
        return Result.success();
    }

    /**
     * 更新酒店房间
     *
     * @param hotelRoom 酒店房间信息
     * @return 操作结果
     */
    @PutMapping
    public Result<Void> updateHotelRoom(@RequestBody HotelRoom hotelRoom) {
        hotelRoomService.updateHotelRoom(hotelRoom);
        return Result.success();
    }

    /**
     * 删除酒店房间(软删除)
     *
     * @param roomId 房间ID
     * @return 操作结果
     */
    @DeleteMapping("/{roomId}")
    public Result<Void> deleteHotelRoom(@PathVariable Integer roomId) {
        hotelRoomService.deleteHotelRoom(roomId);
        return Result.success();
    }

    /**
     * 查询酒店房间列表
     *
     * @param roomNumber  房间号(可选)
     * @param floorNumber 楼层号(可选)
     * @param roomTypeId  房型ID(可选)
     * @param status      房间状态(可选)
     * @param pageNum     页码(可选,默认为1)
     * @param pageSize    每页条数(可选,默认为10)
     * @param orderBy     排序字段(可选,默认为room_id)
     * @param orderType   排序方式(可选,默认为asc)
     * @return 酒店房间列表
     */
    @GetMapping
    public Result<PageBean<HotelRoom>> getHotelRooms(
            @RequestParam(required = false) Integer roomNumber,
            @RequestParam(required = false) Integer floorNumber,
            @RequestParam(required = false) Integer roomTypeId,
            @RequestParam(required = false) String status,
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "8") Integer pageSize,
            @RequestParam(defaultValue = "room_id") String orderBy,
            @RequestParam(defaultValue = "asc") String orderType) {
        PageBean<HotelRoom> pageInfo = hotelRoomService.getHotelRooms(roomNumber, floorNumber, roomTypeId, status, pageNum, pageSize, orderBy, orderType);
        // 遍历Bean里的roomTypeId，查询roomTypeName，并重新替换封装
        pageInfo.getItems().forEach(hotelRoom -> hotelRoom.setRoomTypeName(hotelRoomTypeService.getHotelRoomTypeById(hotelRoom.getRoomTypeId()).getTypeName()));
        return Result.success(pageInfo);
    }
}
