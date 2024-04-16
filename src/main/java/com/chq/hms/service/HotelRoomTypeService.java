package com.chq.hms.service;

import com.chq.hms.domain.HotelRoomType;
import com.chq.hms.domain.vo.PageBean;

public interface HotelRoomTypeService {

    void addHotelRoomType(HotelRoomType hotelRoomType);

    void updateHotelRoomType(HotelRoomType hotelRoomType);

    void deleteHotelRoomType(Integer roomTypeId);

    PageBean<HotelRoomType> getHotelRoomTypes(Integer pageNum, Integer pageSize, String keyword, String orderBy, String orderType);
}
