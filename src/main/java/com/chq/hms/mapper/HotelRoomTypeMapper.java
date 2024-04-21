package com.chq.hms.mapper;

import com.chq.hms.domain.HotelRoomType;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface HotelRoomTypeMapper {

    void insertHotelRoomType(HotelRoomType hotelRoomType);

    void updateHotelRoomType(HotelRoomType hotelRoomType);

    HotelRoomType selectHotelRoomTypeById(Integer roomTypeId);

    List<HotelRoomType> selectHotelRoomTypes(String keyword);

    /**
     * 批量查询房型信息
     * @param roomTypeIds 房型ID列表
     * @return 房型信息列表
     */
    List<HotelRoomType> selectBatchIds(@Param("roomTypeIds") List<Integer> roomTypeIds);

}
