package com.chq.hms.service;

import com.chq.hms.domain.HotelOrder;
import com.chq.hms.domain.vo.CheckinVO;
import com.chq.hms.domain.vo.HotelOrderVO;
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
    PageBean<HotelOrder> getHotelOrders(Integer userId, Integer roomId, Integer roomNumber,
                                        String orderNum, String status, Date reserveDate,
                                        Date checkinDate, Date checkoutDate, Integer pageNum,
                                        Integer pageSize, String orderBy, String orderType);

    /**
     * 获取酒店订单列表(VO)
     *
     * @param createTimeRange 订单创建时间范围
     * @param reserveDate     预定日期
     * @param checkinDate     入住日期
     * @param checkoutDate    退房日期
     * @param status          订单状态
     * @param orderNum        订单号
     * @param username        用户名
     * @param phone           用户手机号
     * @param roomNumber      房间号
     * @param pageNum         当前页码
     * @param pageSize        每页记录数
     * @return 酒店订单列表分页数据
     */
    PageBean<HotelOrderVO> getHotelOrders(String createTimeRange, Date reserveDate, Date checkinDate,
                                       Date checkoutDate, String status, String orderNum,
                                       String username, String phone, Integer roomNumber,
                                       Integer pageNum, Integer pageSize, String orderBy, String orderType);


    /**
     * 获取入住管理列表
     *
     * @param orderNum     订单号
     * @param roomNumber   房间号
     * @param checkinDate  入住日期
     * @param checkoutDate 退房日期
     * @param pageNum      当前页码
     * @param pageSize     每页记录数
     * @param status       订单状态
     * @param orderBy      排序字段(可选,默认为checkin_date)
     * @param orderType    排序方式(可选,默认为desc)
     * @return 入住管理列表分页数据
     */
    PageBean<CheckinVO> getCheckinList(String orderNum, Integer roomNumber, String checkinDate, String checkoutDate, Integer pageNum, Integer pageSize, String status, String orderBy, String orderType);

}
