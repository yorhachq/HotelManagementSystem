package com.chq.hms.service.impl;

import com.chq.hms.domain.HotelRoomType;
import com.chq.hms.domain.vo.PageBean;
import com.chq.hms.mapper.HotelRoomTypeMapper;
import com.chq.hms.service.HotelRoomTypeService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HotelRoomTypeServiceImpl implements HotelRoomTypeService {

    @Autowired
    private HotelRoomTypeMapper hotelRoomTypeMapper;

    @Override
    public HotelRoomType getHotelRoomTypeById(Integer roomTypeId) {
        return hotelRoomTypeMapper.selectHotelRoomTypeById(roomTypeId);
    }

    @Override
    public void addHotelRoomType(HotelRoomType hotelRoomType) {
        hotelRoomType.setStatus("正常");
        hotelRoomTypeMapper.insertHotelRoomType(hotelRoomType);
    }

    @Override
    public void updateHotelRoomType(HotelRoomType hotelRoomType) {
        hotelRoomTypeMapper.updateHotelRoomType(hotelRoomType);
    }

    @Override
    public void deleteHotelRoomType(Integer roomTypeId) {
        HotelRoomType hotelRoomType = hotelRoomTypeMapper.selectHotelRoomTypeById(roomTypeId);
        hotelRoomType.setStatus("冻结");
        hotelRoomTypeMapper.updateHotelRoomType(hotelRoomType);
    }

    @Override
    public PageBean<HotelRoomType> getHotelRoomTypes(Integer pageNum, Integer pageSize, String keyword, String orderBy, String orderType) {
        // 创建PageBean对象
        PageBean<HotelRoomType> pageBean = new PageBean<>();
        // 开启分页查询
        try (Page<HotelRoomType> page = PageHelper.startPage(pageNum, pageSize, orderBy + " " + orderType)) {
            // 调用Mapper完成查询
            List<HotelRoomType> roomTypeList = hotelRoomTypeMapper.selectHotelRoomTypes(keyword);
            // 把数据填充到PageBean对象中
            pageBean.setTotal(page.getTotal());
            pageBean.setItems(roomTypeList);
        }
        return pageBean;
    }

}
