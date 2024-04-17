package com.chq.hms.service;

import com.chq.hms.domain.HotelOrder;
import com.chq.hms.domain.vo.PageBean;

import java.util.Date;

/**
 * 酒店订单管理Service接口
 */
public interface HotelOrderService {

    /**
     * 预订酒店房间
     *
     * @param hotelOrder 酒店订单信息
     */
    void reserveHotelRoom(HotelOrder hotelOrder);

    /**
     * 办理入住
     *
     * @param hotelOrder 酒店订单信息
     */
    void checkinHotelRoom(HotelOrder hotelOrder);

    /**
     * 办理退房
     *
     * @param orderId 订单ID
     */
    void checkoutHotelRoom(Integer orderId);

    /**
     * 取消订单
     *
     * @param orderId 订单ID
     */
    void cancelHotelOrder(Integer orderId);

    /**
     * 查询酒店订单列表
     *
     * @param userId       用户ID(可选)
     * @param roomId       房间ID(可选)
     * @param orderNum     订单号(可选)
     * @param status       订单状态(可选)
     * @param reserveDate  预订日期(可选)
     * @param checkoutDate 退房日期(可选)
     * @param pageNum      页码(可选,默认为1)
     * @param pageSize     每页条数(可选,默认为10)
     * @param orderBy      排序字段(可选,默认为create_time)
     * @param orderType    排序方式(可选,默认为desc)
     * @return 酒店订单列表
     */
    PageBean<HotelOrder> getHotelOrders(Integer userId, Integer roomId, String orderNum, String status,
                                        Date reserveDate, Date checkoutDate,
                                        Integer pageNum, Integer pageSize,
                                        String orderBy, String orderType);
}
