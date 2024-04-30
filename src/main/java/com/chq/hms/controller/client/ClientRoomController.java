package com.chq.hms.controller.client;

import com.chq.hms.anno.OperationLog;
import com.chq.hms.domain.Result;
import com.chq.hms.domain.vo.AvailableRoomVO;
import com.chq.hms.service.HotelRoomCalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/client")
public class ClientRoomController {
    @Autowired
    private HotelRoomCalendarService hotelRoomCalendarService;

    /**
     * 获取指定日期的可用房间列表
     *
     * @param checkinDate  开始日期(yyyy-MM-dd)
     * @param checkoutDate 结束日期(yyyy-MM-dd)
     * @param roomNumber   房间号(可选)
     * @param floorNumber  楼层(可选)
     * @param roomTypeId   房型ID(可选)
     * @return 可用房间列表
     */
    @OperationLog("数据获取：房间列表")
    @GetMapping("/availableRooms")
    public Result<List<AvailableRoomVO>> getAvailableRooms(@RequestParam String checkinDate,
                                                           @RequestParam String checkoutDate,
                                                           @RequestParam(required = false) Integer roomNumber,
                                                           @RequestParam(required = false) Integer floorNumber,
                                                           @RequestParam(required = false) Integer roomTypeId) {
        List<AvailableRoomVO> availableRooms = hotelRoomCalendarService.getAvailableRooms(checkinDate, checkoutDate);

        // 根据房间号、楼层、房型进行筛选
        if (roomNumber != null) {
            availableRooms = availableRooms.stream()
                    .filter(room -> room.getRoomNumber().equals(roomNumber))
                    .collect(Collectors.toList());
        }
        if (floorNumber != null) {
            availableRooms = availableRooms.stream()
                    .filter(room -> room.getFloorNumber().equals(floorNumber))
                    .collect(Collectors.toList());
        }
        if (roomTypeId != null) {
            availableRooms = availableRooms.stream()
                    .filter(room -> room.getRoomType().getRoomTypeId().equals(roomTypeId))
                    .collect(Collectors.toList());
        }

        return Result.success(availableRooms);
    }

}
