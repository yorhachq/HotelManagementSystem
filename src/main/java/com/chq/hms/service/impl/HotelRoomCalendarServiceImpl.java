package com.chq.hms.service.impl;

import com.chq.hms.domain.HotelOrder;
import com.chq.hms.domain.HotelRoom;
import com.chq.hms.domain.HotelRoomType;
import com.chq.hms.domain.vo.AvailableRoomVO;
import com.chq.hms.mapper.HotelOrderMapper;
import com.chq.hms.mapper.HotelRoomMapper;
import com.chq.hms.mapper.HotelRoomTypeMapper;
import com.chq.hms.service.HotelRoomCalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 日历房态管理Service实现类
 */
@Service
public class HotelRoomCalendarServiceImpl implements HotelRoomCalendarService {

    @Autowired
    private HotelRoomMapper hotelRoomMapper;

    @Autowired
    private HotelRoomTypeMapper hotelRoomTypeMapper;

    @Autowired
    private HotelOrderMapper hotelOrderMapper;

    /**
     * 获取一个月的房态数据(第一个周一至最后一个周日)
     *
     * @param date 日期(yyyy-MM-dd)
     * @return 一个月的房态数据
     */
    @Override
    public Map<String, Integer> getMonthData(String date) {
        // 解析日期
        LocalDate localDate = LocalDate.parse(date);

        // 获取当月的第一天和最后一天
        LocalDate firstDay = localDate.with(TemporalAdjusters.firstDayOfMonth());
        LocalDate lastDay = localDate.with(TemporalAdjusters.lastDayOfMonth());

        // 获取当月的第一个周一和最后一个周日
        LocalDate firstMonday = firstDay.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
        LocalDate lastSunday = lastDay.with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));

        // 查询酒店房间总数
        int totalRooms = hotelRoomMapper.selectCount();

        // 查询一个月的订单数据
        List<HotelOrder> orders = hotelOrderMapper.selectOrdersBetweenDates(firstMonday, lastSunday);

        // 初始化房态数据
        Map<String, Integer> data = new LinkedHashMap<>();
        LocalDate currentDate = firstMonday;
        while (!currentDate.isAfter(lastSunday)) {
            data.put(currentDate.toString(), totalRooms);
            currentDate = currentDate.plusDays(1);
        }

        // 处理订单数据,更新房态
        for (HotelOrder order : orders) {
            LocalDate checkinDate = order.getCheckinDate();
            LocalDate checkoutDate = order.getCheckoutDate();
            LocalDate date1 = checkinDate;
            while (!date1.isAfter(checkoutDate)) {
                String key = date1.toString();
                if (data.containsKey(key)) {
                    data.put(key, data.get(key) - 1);
                }
                date1 = date1.plusDays(1);
            }
        }

        return data;
    }

    /**
     * 获取当前日期前一周和后三周的房态数据
     *
     * @param date 日期(yyyy-MM-dd)
     * @return 房态数据
     */
    @Override
    public Map<String, Integer> getRecentWeeksData(String date) {
        // 解析日期
        LocalDate currentDate = LocalDate.parse(date);

        // 获取前一周的周一
        LocalDate previousMonday = currentDate.with(TemporalAdjusters.previous(DayOfWeek.MONDAY));

        // 获取后三周的周日
        LocalDate nextSunday = currentDate.plusWeeks(3).with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));

        // 查询酒店房间总数
        int totalRooms = hotelRoomMapper.selectCount();

        // 查询指定日期范围内的订单数据
        List<HotelOrder> orders = hotelOrderMapper.selectOrdersBetweenDates(previousMonday, nextSunday);

        // 初始化房态数据
        Map<String, Integer> data = new LinkedHashMap<>();
        LocalDate date1 = previousMonday;
        while (!date1.isAfter(nextSunday)) {
            data.put(date1.toString(), totalRooms);
            date1 = date1.plusDays(1);
        }

        // 处理订单数据,更新房态
        for (HotelOrder order : orders) {
            LocalDate checkinDate = order.getCheckinDate();
            LocalDate checkoutDate = order.getCheckoutDate();
            LocalDate date2 = checkinDate;
            while (!date2.isAfter(checkoutDate)) {
                String key = date2.toString();
                if (data.containsKey(key)) {
                    data.put(key, data.get(key) - 1);
                }
                date2 = date2.plusDays(1);
            }
        }

        return data;
    }

    /**
     * 获取指定日期的可用房间列表
     *
     * @param startDate 开始日期(yyyy-MM-dd)
     * @param endDate   结束日期(yyyy-MM-dd)
     * @return 可用房间列表
     */
    @Override
    public List<AvailableRoomVO> getAvailableRooms(String startDate, String endDate) {
        // 查询指定日期的入住订单
        List<HotelOrder> checkinOrders = hotelOrderMapper.selectCheckinOrdersBetweenDates(startDate, endDate);

        // 查询所有房间
        List<HotelRoom> rooms = hotelRoomMapper.selectAll();

        // 获取指定日期区间内已预订的房间ID列表
        List<Integer> bookedRoomIds = checkinOrders.stream()
                .map(HotelOrder::getRoomId)
                .toList();

        // 过滤出可用房间
        List<HotelRoom> availableRooms = rooms.stream()
                .filter(room -> checkinOrders.stream().noneMatch(order -> order.getRoomId().equals(room.getRoomId())))
                .filter(room -> !bookedRoomIds.contains(room.getRoomId()))
                .toList();

        // 查询房型信息
        List<Integer> roomTypeIds = availableRooms.stream().map(HotelRoom::getRoomTypeId).collect(Collectors.toList());
        List<HotelRoomType> roomTypes = hotelRoomTypeMapper.selectBatchIds(roomTypeIds);
        Map<Integer, HotelRoomType> roomTypeMap = roomTypes.stream().collect(Collectors.toMap(HotelRoomType::getRoomTypeId, Function.identity()));

        // 组装VO对象
        List<AvailableRoomVO> availableRoomVOs = new ArrayList<>();
        for (HotelRoom room : availableRooms) {
            AvailableRoomVO vo = new AvailableRoomVO();
            vo.setRoomId(room.getRoomId());
            vo.setRoomNumber(room.getRoomNumber());
            vo.setFloorNumber(room.getFloorNumber());
            vo.setRoomType(roomTypeMap.get(room.getRoomTypeId()));
            availableRoomVOs.add(vo);
        }

        return availableRoomVOs;
    }
}
