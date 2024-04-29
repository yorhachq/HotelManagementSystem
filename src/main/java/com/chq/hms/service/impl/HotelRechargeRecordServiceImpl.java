package com.chq.hms.service.impl;

import com.chq.hms.domain.vo.PageBean;
import com.chq.hms.mapper.HotelRechargeRecordMapper;
import com.chq.hms.service.HotelRechargeRecordService;
import com.chq.hms.domain.vo.HotelRechargeRecordVO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 酒店充值记录Service实现类
 */
@Service
public class HotelRechargeRecordServiceImpl implements HotelRechargeRecordService {
    @SuppressWarnings("all")
    @Autowired
    private HotelRechargeRecordMapper hotelRechargeRecordMapper;

    @Override
    public PageBean<HotelRechargeRecordVO> findPage(Integer pageNum, Integer pageSize, String username, String phone, String email, String paymentMethod) {
        PageBean<HotelRechargeRecordVO> pageBean = new PageBean<>();
        try (Page<HotelRechargeRecordVO> page = PageHelper.startPage(pageNum, pageSize)) {
            hotelRechargeRecordMapper.selectPage(username, phone, email, paymentMethod);
            pageBean.setTotal(page.getTotal());
            pageBean.setItems(page.getResult());
        }
        return pageBean;
    }
}
