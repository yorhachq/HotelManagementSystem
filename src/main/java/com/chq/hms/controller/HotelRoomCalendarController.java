package com.chq.hms.controller;

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
import java.util.Map;

/**
 * 日历房态管理Controller
 */
@RestController
@RequestMapping("/hotelRoomCalendar")
public class HotelRoomCalendarController {
    @SuppressWarnings("all")
    @Autowired
    private HotelRoomCalendarService hotelRoomCalendarService;

    /**
     * 获取一个月的房态数据
     *
     * @param date 日期(yyyy-MM-dd)
     * @return 一个月的房态数据
     */
    @OperationLog("数据获取：日历房态")
    @GetMapping("/monthData")
    public Result<Map<String, Integer>> getMonthData(@RequestParam String date) {
        Map<String, Integer> data = hotelRoomCalendarService.getRecentWeeksData(date);
        return Result.success(data);
    }

    /**
     * 获取指定日期的可用房间列表
     *
     * @param checkinDate 开始日期(yyyy-MM-dd)
     * @param checkoutDate   结束日期(yyyy-MM-dd)
     * @return 可用房间列表
     */
    @OperationLog("数据获取：房间可用状态列表")
    @GetMapping("/availableRooms")
    public Result<List<AvailableRoomVO>> getAvailableRooms(@RequestParam String checkinDate, @RequestParam String checkoutDate) {
        List<AvailableRoomVO> availableRooms = hotelRoomCalendarService.getAvailableRooms(checkinDate, checkoutDate);
        return Result.success(availableRooms);
    }
}
