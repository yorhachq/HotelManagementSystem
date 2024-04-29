package com.chq.hms.controller;

import com.chq.hms.domain.Result;
import com.chq.hms.domain.vo.HotelRechargeRecordVO;
import com.chq.hms.domain.vo.PageBean;
import com.chq.hms.service.HotelRechargeRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 酒店充值记录Controller
 */
@RestController
@RequestMapping("/hotelRechargeRecords")
public class HotelRechargeRecordController {
    @SuppressWarnings("all")
    @Autowired
    private HotelRechargeRecordService hotelRechargeRecordService;

    /**
     * 分页查询充值记录
     *
     * @param pageNum       当前页码
     * @param pageSize      每页记录数
     * @param username      用户名
     * @param phone         手机号
     * @param email         邮箱
     * @param paymentMethod 支付方式
     * @return 充值记录分页数据
     */
    @GetMapping
    public Result<PageBean<HotelRechargeRecordVO>> findPage(@RequestParam(defaultValue = "1") Integer pageNum,
                                                            @RequestParam(defaultValue = "10") Integer pageSize,
                                                            @RequestParam(required = false) String username,
                                                            @RequestParam(required = false) String phone,
                                                            @RequestParam(required = false) String email,
                                                            @RequestParam(required = false) String paymentMethod) {
        PageBean<HotelRechargeRecordVO> pageBean = hotelRechargeRecordService.findPage(pageNum, pageSize, username, phone, email, paymentMethod);
        return Result.success(pageBean);
    }
}
