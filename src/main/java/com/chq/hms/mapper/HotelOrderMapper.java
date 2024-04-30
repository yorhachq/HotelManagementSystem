package com.chq.hms.mapper;

import com.chq.hms.domain.HotelOrder;
import com.chq.hms.domain.vo.CheckinVO;
import com.chq.hms.domain.vo.HotelOrderVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

/**
 * 酒店订单管理Mapper接口
 */
@Mapper
public interface HotelOrderMapper {

    /**
     * 插入酒店订单
     *
     * @param hotelOrder 酒店订单信息
     */
    void insertHotelOrder(HotelOrder hotelOrder);

    /**
     * 更新酒店订单
     *
     * @param hotelOrder 酒店订单信息
     */
    void updateHotelOrder(HotelOrder hotelOrder);

    /**
     * 根据ID查询酒店订单
     *
     * @param orderId 订单ID
     * @return 酒店订单信息
     */
    HotelOrder selectHotelOrderById(Integer orderId);

    /**
     * 查询酒店订单列表
     *
     * @param userId       用户ID(可选)
     * @param roomId       房间ID(可选)
     * @param roomNumber   房间号(可选)
     * @param orderNum     订单号(可选)
     * @param status       订单状态(可选)
     * @param reserveDate  预订日期(可选)
     * @param checkinDate  入住日期(可选)
     * @param checkoutDate 退房日期(可选)
     * @return 酒店订单列表
     */
    List<HotelOrder> selectHotelOrders(@Param("userId") Integer userId,
                                       @Param("roomId") Integer roomId,
                                       @Param("roomNumber") Integer roomNumber,
                                       @Param("orderNum") String orderNum,
                                       @Param("status") String status,
                                       @Param("reserveDate") Date reserveDate,
                                       @Param("checkinDate") Date checkinDate,
                                       @Param("checkoutDate") Date checkoutDate);

    /**
     * 获取酒店订单列表(VO)
     *
     * @param startTime    订单创建起始时间
     * @param endTime      订单创建截止时间
     * @param reserveDate  预定日期
     * @param checkinDate  入住日期
     * @param checkoutDate 退房日期
     * @param status       订单状态
     * @param orderNum     订单号
     * @param username     用户名
     * @param phone        用户手机号
     * @param roomNumber   房间号
     * @return 酒店订单列表
     */
    List<HotelOrderVO> selectHotelOrderList(@Param("startTime") String startTime,
                                            @Param("endTime") String endTime,
                                            @Param("reserveDate") String reserveDate,
                                            @Param("checkinDate") String checkinDate,
                                            @Param("checkoutDate") String checkoutDate,
                                            @Param("status") String status,
                                            @Param("orderNum") String orderNum,
                                            @Param("username") String username,
                                            @Param("phone") String phone,
                                            @Param("roomNumber") Integer roomNumber);


    /**
     * 查询指定日期范围内的订单
     *
     * @param startDate 开始日期
     * @param endDate   结束日期
     * @return 订单列表
     */
    List<HotelOrder> selectOrdersBetweenDates(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

    /**
     * 查询指定日期的入住订单
     *
     * @param startDate 开始日期(yyyy-MM-dd)
     * @param endDate   结束日期(yyyy-MM-dd)
     * @return 入住订单列表
     */
    List<HotelOrder> selectCheckinOrdersBetweenDates(@Param("startDate") String startDate,@Param("endDate") String endDate);

    /**
     * 获取入住管理列表
     *
     * @param orderNum     订单号
     * @param roomNumber   房间号
     * @param checkinDate  入住日期
     * @param checkoutDate 退房日期
     * @param status       订单状态
     * @return 入住管理列表分页数据
     */
    List<CheckinVO> getCheckinList(@Param("orderNum") String orderNum, @Param("roomNumber") Integer roomNumber,
                                   @Param("checkinDate") String checkinDate, @Param("checkoutDate") String checkoutDate,
                                   @Param("status") String status);
}

