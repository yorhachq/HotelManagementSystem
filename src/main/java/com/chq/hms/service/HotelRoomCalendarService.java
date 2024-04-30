package com.chq.hms.service;

import com.chq.hms.domain.vo.AvailableRoomVO;

import java.util.List;
import java.util.Map;

/**
 * 日历房态Service接口
 */
public interface HotelRoomCalendarService {

    /**
     * 获取一个月的房态数据
     *
     * @param date 日期(yyyy-MM-dd)
     * @return 一个月的房态数据
     */
    Map<String, Integer> getMonthData(String date);

    /**
     * 获取指定日期的可用房间列表

     * @param startDate 开始日期(yyyy-MM-dd)
     * @param endDate   结束日期(yyyy-MM-dd)
     * @return 可用房间列表
     */
    List<AvailableRoomVO> getAvailableRooms(String startDate, String endDate);

    /**
     * 获取当前日期前一周和后三周的房态数据
     *
     * @param date 日期(yyyy-MM-dd)
     * @return 房态数据
     */
    Map<String, Integer> getRecentWeeksData(String date);
}
