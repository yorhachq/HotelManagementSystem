package com.chq.hms.service.impl;

import cn.hutool.core.date.DateTime;
import com.chq.hms.domain.HotelMember;
import com.chq.hms.domain.HotelOrder;
import com.chq.hms.domain.HotelRoom;
import com.chq.hms.domain.HotelRoomType;
import com.chq.hms.domain.vo.PageBean;
import com.chq.hms.mapper.HotelMemberMapper;
import com.chq.hms.mapper.HotelOrderMapper;
import com.chq.hms.mapper.HotelRoomMapper;
import com.chq.hms.mapper.HotelRoomTypeMapper;
import com.chq.hms.service.HotelOrderService;
import com.chq.hms.util.OrderNumberGenerateUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * 酒店订单管理Service实现类
 */
@Service
public class HotelOrderServiceImpl implements HotelOrderService {

    @Autowired
    private HotelOrderMapper hotelOrderMapper;

    @Autowired
    private HotelRoomMapper hotelRoomMapper;

    @Autowired
    private HotelRoomTypeMapper hotelRoomTypeMapper;

    @Autowired
    private HotelMemberMapper hotelMemberMapper;

    /**
     * 预订酒店房间
     *
     * @param hotelOrder 酒店订单信息
     */
    @Override
    @Transactional
    public void reserveHotelRoom(HotelOrder hotelOrder) {
        // 查询房间信息,获取房型价格
        HotelRoom hotelRoom = hotelRoomMapper.selectHotelRoomById(hotelOrder.getRoomId());
        HotelRoomType hotelRoomType = hotelRoomTypeMapper.selectHotelRoomTypeById(hotelRoom.getRoomTypeId());
        Double payment = hotelRoomType.getPrice();
        // 查询会员账户余额
        HotelMember hotelMember = hotelMemberMapper.selectHotelMemberByUserId(hotelOrder.getUserId());
        Double balance = hotelMember.getBalance();
        // 检查余额是否足够
        if (balance.compareTo(payment) < 0) {
            throw new RuntimeException("会员账户余额不足,无法完成预订");
        }
        // 扣除账户余额
        hotelMember.setBalance(balance - payment);
        hotelMemberMapper.updateHotelMember(hotelMember);
        // 设置订单状态为已预订,设置支付金额
        hotelOrder.setStatus("已预订");
        hotelOrder.setPayment(payment);
        // 生成订单号
        hotelOrder.setOrderNum(OrderNumberGenerateUtil.generateOrderNumber());
        // 插入订单信息
        hotelOrderMapper.insertHotelOrder(hotelOrder);
        // 更新房间状态为已预订
        hotelRoom.setStatus("已预订");
        hotelRoomMapper.updateHotelRoom(hotelRoom);
    }

    /**
     * 办理入住
     *
     * @param hotelOrder 酒店订单信息
     */
    @Override
    @Transactional
    public void checkinHotelRoom(HotelOrder hotelOrder) {
        // 订单生命周期控制
        if ("已退房".equals(hotelOrder.getStatus()) || "已取消".equals(hotelOrder.getStatus())) {
            throw new RuntimeException("该订单流程已结束,不接受操作");
        }
        // 查询房间信息,获取房型价格
        HotelRoom hotelRoom = hotelRoomMapper.selectHotelRoomById(hotelOrder.getRoomId());
        HotelRoomType hotelRoomType = hotelRoomTypeMapper.selectHotelRoomTypeById(hotelRoom.getRoomTypeId());
        Double payment = hotelRoomType.getPrice();
        // 如果没有入住日期,则设置为当前日期
        if (hotelOrder.getCheckinDate() == null) {
            hotelOrder.setCheckinDate(new DateTime().toSqlDate().toLocalDate());
        }
        // 如果没有预订,则设置预订日期为入住日期,并执行支付
        if (hotelOrder.getReserveDate() == null) {
            // 查询会员账户余额
            HotelMember hotelMember = hotelMemberMapper.selectHotelMemberByUserId(hotelOrder.getUserId());
            Double balance = hotelMember.getBalance();
            // 检查余额是否足够
            if (balance.compareTo(payment) < 0) {
                throw new RuntimeException("会员账户余额不足,无法办理入住");
            }
            // 扣除账户余额
            hotelMember.setBalance(balance - payment);
            hotelMemberMapper.updateHotelMember(hotelMember);
            // 设置预订日期为入住日期
            hotelOrder.setReserveDate(hotelOrder.getCheckinDate());
            // 生成订单号
            hotelOrder.setOrderNum(OrderNumberGenerateUtil.generateOrderNumber());
            hotelOrder.setPayment(payment);
            hotelOrder.setStatus("入住中");
            // 插入订单信息
            hotelOrderMapper.insertHotelOrder(hotelOrder);
        } else {
            if (hotelOrder.getCheckinDate().isBefore(hotelOrder.getReserveDate())) {
                throw new RuntimeException("入住日期不能早于预订日期");
            }
            // 设置订单状态为入住中
            hotelOrder.setStatus("入住中");
            // 避免更新预定时间
            hotelOrder.setReserveDate(null);
            // 已有预定，办理入住
            hotelOrderMapper.updateHotelOrder(hotelOrder);
        }
        // 更新房间状态为已入住
        hotelRoom.setStatus("已入住");
        hotelRoomMapper.updateHotelRoom(hotelRoom);
    }

    /**
     * 办理退房
     *
     * @param orderId 订单ID
     */
    @Override
    @Transactional
    public void checkoutHotelRoom(Integer orderId) {
        // 查询订单信息
        HotelOrder hotelOrder = hotelOrderMapper.selectHotelOrderById(orderId);
        // 订单生命周期控制
        if ("已退房".equals(hotelOrder.getStatus()) || "已取消".equals(hotelOrder.getStatus())) {
            throw new RuntimeException("该订单流程已结束,无法进行操作");
        }
        // 设置订单状态为已退房,并添加退房时间
        hotelOrder.setStatus("已退房");
        hotelOrder.setCheckoutDate(new DateTime().toSqlDate().toLocalDate());
        hotelOrderMapper.updateHotelOrder(hotelOrder);

        // 更新房间状态为空闲
        HotelRoom hotelRoom = hotelRoomMapper.selectHotelRoomById(hotelOrder.getRoomId());
        hotelRoom.setStatus("空闲");
        hotelRoomMapper.updateHotelRoom(hotelRoom);
    }

    /**
     * 取消订单（退款）
     *
     * @param orderId 订单ID
     */
    @Override
    @Transactional
    public void cancelHotelOrder(Integer orderId) {
        // 查询订单信息
        HotelOrder hotelOrder = hotelOrderMapper.selectHotelOrderById(orderId);
        // 订单生命周期控制
        if ("已退房".equals(hotelOrder.getStatus()) || "已取消".equals(hotelOrder.getStatus())) {
            throw new RuntimeException("该订单流程已结束,不接受操作");
        }
        // 检查订单状态是否为已预订
        if (!"已预订".equals(hotelOrder.getStatus()) && !"入住中".equals(hotelOrder.getStatus())) {
            throw new RuntimeException("只有已预订或入住中的订单可以取消");
        }

        // 设置订单状态为已取消
        hotelOrder.setStatus("已取消");
        hotelOrderMapper.updateHotelOrder(hotelOrder);

        // 更新房间状态为空闲
        HotelRoom hotelRoom = hotelRoomMapper.selectHotelRoomById(hotelOrder.getRoomId());
        hotelRoom.setStatus("空闲");
        hotelRoomMapper.updateHotelRoom(hotelRoom);

        // 将支付金额返还到会员账户
        HotelMember hotelMember = hotelMemberMapper.selectHotelMemberByUserId(hotelOrder.getUserId());
        hotelMember.setBalance(hotelMember.getBalance() + hotelOrder.getPayment());
        hotelMemberMapper.updateHotelMember(hotelMember);
    }

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
    @Override
    public PageBean<HotelOrder> getHotelOrders(Integer userId, Integer roomId, String orderNum, String status,
                                               Date reserveDate, Date checkoutDate,
                                               Integer pageNum, Integer pageSize,
                                               String orderBy, String orderType) {
        // 创建PageBean对象
        PageBean<HotelOrder> pageBean = new PageBean<>();
        // 开启分页查询
        try (Page<HotelOrder> page = PageHelper.startPage(pageNum, pageSize, orderBy + " " + orderType)) {
            // 调用Mapper完成查询
            List<HotelOrder> roomTypeList = hotelOrderMapper.selectHotelOrders(userId, roomId, orderNum, status, reserveDate, checkoutDate);
            // 把数据填充到PageBean对象中
            pageBean.setTotal(page.getTotal());
            pageBean.setItems(roomTypeList);
        }
        return pageBean;
    }
}
