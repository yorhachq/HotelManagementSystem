package com.chq.hms.mapper;

import com.chq.hms.domain.HotelRoomType;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HotelRoomTypeMapper {

    void insertHotelRoomType(HotelRoomType hotelRoomType);

    void updateHotelRoomType(HotelRoomType hotelRoomType);

    HotelRoomType selectHotelRoomTypeById(Integer roomTypeId);

    List<HotelRoomType> selectHotelRoomTypes(String keyword);
}
