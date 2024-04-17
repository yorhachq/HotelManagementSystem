package com.chq.hms.mapper;

import com.chq.hms.domain.HotelOrder;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * 酒店订单管理Mapper接口
 */
@Mapper
public interface HotelOrderMapper {

    /**
     * 插入酒店订单
     * @param hotelOrder 酒店订单信息
     */
    void insertHotelOrder(HotelOrder hotelOrder);

    /**
     * 更新酒店订单
     * @param hotelOrder 酒店订单信息
     */
    void updateHotelOrder(HotelOrder hotelOrder);

    /**
     * 根据ID查询酒店订单
     * @param orderId 订单ID
     * @return 酒店订单信息
     */
    HotelOrder selectHotelOrderById(Integer orderId);

    /**
     * 查询酒店订单列表
     * @param userId 用户ID(可选)
     * @param roomId 房间ID(可选)
     * @param orderNum 订单号(可选)
     * @param status 订单状态(可选)
     * @param reserveDate 预订日期(可选)
     * @param checkoutDate 退房日期(可选)
     * @return 酒店订单列表
     */
    List<HotelOrder> selectHotelOrders(@Param("userId") Integer userId,
                                       @Param("roomId") Integer roomId,
                                       @Param("orderNum") String orderNum,
                                       @Param("status") String status,
                                       @Param("reserveDate") Date reserveDate,
                                       @Param("checkoutDate") Date checkoutDate);
}
