package com.chq.hms.controller;

import com.chq.hms.domain.HotelOrder;
import com.chq.hms.domain.Result;
import com.chq.hms.domain.vo.PageBean;
import com.chq.hms.service.HotelOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * 酒店订单
 */
@RestController
@RequestMapping("/hotelOrder")
public class HotelOrderController {

    @Autowired
    private HotelOrderService hotelOrderService;

    /**
     * 预订酒店房间
     * @param hotelOrder 酒店订单信息
     * @return 操作结果
     */
    @PostMapping("/reserve")
    public Result<Void> reserveHotelRoom(@RequestBody HotelOrder hotelOrder) {
        hotelOrderService.reserveHotelRoom(hotelOrder);
        return Result.success();
    }

    /**
     * 办理入住
     * @param hotelOrder 酒店订单信息
     * @return 操作结果
     */
    @PostMapping("/checkin")
    public Result<Void> checkinHotelRoom(@RequestBody HotelOrder hotelOrder) {
        hotelOrderService.checkinHotelRoom(hotelOrder);
        return Result.success();
    }

    /**
     * 办理退房
     * @param orderId 订单ID
     * @return 操作结果
     */
    @PutMapping("/checkout/{orderId}")
    public Result<Void> checkoutHotelRoom(@PathVariable Integer orderId) {
        hotelOrderService.checkoutHotelRoom(orderId);
        return Result.success();
    }

    /**
     * 取消订单
     * @param orderId 订单ID
     * @return 操作结果
     */
    @PutMapping("/cancel/{orderId}")
    public Result<Void> cancelHotelOrder(@PathVariable Integer orderId) {
        hotelOrderService.cancelHotelOrder(orderId);
        return Result.success();
    }

    /**
     * 查询酒店订单列表
     * @param userId 用户ID(可选)
     * @param roomId 房间ID(可选)
     * @param orderNum 订单号(可选)
     * @param status 订单状态(可选)
     * @param reserveDate 预订日期(可选)
     * @param checkoutDate 退房日期(可选)
     * @param pageNum 页码(可选,默认为1)
     * @param pageSize 每页条数(可选,默认为10)
     * @param orderBy 排序字段(可选,默认为create_time)
     * @param orderType 排序方式(可选,默认为desc)
     * @return 酒店订单列表
     */
    @GetMapping
    public Result<PageBean<HotelOrder>> getHotelOrders(
            @RequestParam(required = false) Integer userId,
            @RequestParam(required = false) Integer roomId,
            @RequestParam(required = false) String orderNum,
            @RequestParam(required = false) String status,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date reserveDate,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date checkoutDate,
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(defaultValue = "create_time") String orderBy,
            @RequestParam(defaultValue = "desc") String orderType) {
        PageBean<HotelOrder> pageInfo = hotelOrderService.getHotelOrders(userId, roomId, orderNum, status, reserveDate, checkoutDate, pageNum, pageSize, orderBy, orderType);
        return Result.success(pageInfo);
    }
}
