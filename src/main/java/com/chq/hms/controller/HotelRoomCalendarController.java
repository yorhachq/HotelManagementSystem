package com.chq.hms.controller;

import com.chq.hms.domain.Result;
import com.chq.hms.domain.vo.AvailableRoomVO;
import com.chq.hms.service.HotelRoomCalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 日历房态管理Controller
 */
@RestController
@RequestMapping("/hotelRoomCalendar")
public class HotelRoomCalendarController {

    @Autowired
    private HotelRoomCalendarService hotelRoomCalendarService;

    /**
     * 获取一个月的房态数据
     * @param date 日期(yyyy-MM-dd)
     * @return 一个月的房态数据
     */
    @GetMapping("/monthData")
    public Result<Map<String, Integer>> getMonthData(@RequestParam String date) {
        Map<String, Integer> data = hotelRoomCalendarService.getRecentWeeksData(date);
        return Result.success(data);
    }

    /**
     * 获取指定日期的可用房间列表
     * @param date 日期(yyyy-MM-dd)
     * @return 可用房间列表
     */
    @GetMapping("/availableRooms")
    public Result<List<AvailableRoomVO>> getAvailableRooms(@RequestParam String date) {
        List<AvailableRoomVO> availableRooms = hotelRoomCalendarService.getAvailableRooms(date);
        return Result.success(availableRooms);
    }
}
