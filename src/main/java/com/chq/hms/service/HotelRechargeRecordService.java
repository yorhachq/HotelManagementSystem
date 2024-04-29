package com.chq.hms.service;

import com.chq.hms.domain.vo.HotelRechargeRecordVO;
import com.chq.hms.domain.vo.PageBean;

public interface HotelRechargeRecordService {
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
    PageBean<HotelRechargeRecordVO> findPage(Integer pageNum, Integer pageSize, String username, String phone, String email, String paymentMethod);
}
