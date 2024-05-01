package com.chq.hms.controller.client;

import cn.hutool.core.convert.Convert;
import com.chq.hms.anno.OperationLog;
import com.chq.hms.domain.HotelOrder;
import com.chq.hms.domain.Result;
import com.chq.hms.domain.vo.HotelOrderVO;
import com.chq.hms.domain.vo.PageBean;
import com.chq.hms.service.HotelOrderService;
import com.chq.hms.service.SysUserService;
import com.chq.hms.util.ThreadLocalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 酒店订单
 */
@RestController
@RequestMapping("/client")
public class ClientOrderController {

    @Autowired
    private HotelOrderService hotelOrderService;
    @Autowired
    private SysUserService sysUserService;

    /**
     * 预订酒店房间(必须提供入住和退房日期)
     *
     * @param hotelOrder 酒店订单信息
     * @return 操作结果
     */
    @OperationLog("业务处理：房间预订")
    @PostMapping("/reserve")
    public Result<Void> reserveHotelRoom(@RequestBody HotelOrder hotelOrder) {
        hotelOrderService.reserveHotelRoom(hotelOrder);
        return Result.success();
    }

    /**
     * 取消订单
     *
     * @param orderId 订单ID
     * @return 操作结果
     */
    @OperationLog("业务处理：取消订单")
    @PutMapping("/cancel/{orderId}")
    public Result<Void> cancelHotelOrder(@PathVariable Integer orderId) {
        hotelOrderService.cancelHotelOrder(orderId);
        return Result.success();
    }

    /**
     * 获取酒店订单列表(VO)
     *
     * @param createTimeRange 订单创建时间范围
     * @param reserveDate     预定日期
     * @param checkinDate     入住日期
     * @param checkoutDate    退房日期
     * @param status          订单状态
     * @param orderNum        订单号
     * @param roomNumber      房间号
     * @param pageNum         当前页码
     * @param pageSize        每页记录数
     * @return 酒店订单列表分页数据
     */
    @OperationLog("数据获取：酒店订单列表")
    @GetMapping("/orderList")
    public Result<PageBean<HotelOrderVO>> getHotelOrders(@RequestParam(required = false) List<String> createTimeRange,
                                                         @RequestParam(required = false) String reserveDate,
                                                         @RequestParam(required = false) String checkinDate,
                                                         @RequestParam(required = false) String checkoutDate,
                                                         @RequestParam(required = false) String status,
                                                         @RequestParam(required = false) String orderNum,
                                                         @RequestParam(required = false) Integer roomNumber,
                                                         @RequestParam(defaultValue = "1") Integer pageNum,
                                                         @RequestParam(defaultValue = "10") Integer pageSize,
                                                         @RequestParam(defaultValue = "create_time") String orderBy,
                                                         @RequestParam(defaultValue = "desc") String orderType) {
        // 固定为会员自身的订单
        Map<String, Object> data = ThreadLocalUtil.get();
        Integer userId = Convert.toInt(data.get("id"));
        String currtentUser = sysUserService.findByUserId(userId).getUsername();
        PageBean<HotelOrderVO> pageInfo = hotelOrderService.getHotelOrders(createTimeRange, reserveDate, checkinDate,
                checkoutDate, status, orderNum, currtentUser, null, roomNumber, pageNum, pageSize, orderBy, orderType);
        return Result.success(pageInfo);
    }
}
