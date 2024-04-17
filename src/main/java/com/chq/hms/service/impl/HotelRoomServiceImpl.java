package com.chq.hms.service.impl;

import cn.hutool.core.convert.Convert;
import com.chq.hms.domain.HotelRoom;
import com.chq.hms.domain.vo.PageBean;
import com.chq.hms.mapper.HotelRoomMapper;
import com.chq.hms.service.HotelRoomService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HotelRoomServiceImpl implements HotelRoomService {
    @SuppressWarnings("all")
    @Autowired
    private HotelRoomMapper hotelRoomMapper;

    /**
     * 添加酒店房间
     *
     * @param hotelRoom 酒店房间信息
     */
    @Override
    public void addHotelRoom(HotelRoom hotelRoom) {
        hotelRoom.setStatus("空闲");
        // 拼接房间号(楼层数+房间号)
        hotelRoom.setRoomNumber(Convert.toInt(hotelRoom.getFloorNumber().toString() + hotelRoom.getRoomNumber().toString()));
        hotelRoomMapper.insertHotelRoom(hotelRoom);
    }

    /**
     * 更新酒店房间
     *
     * @param hotelRoom 酒店房间信息
     */
    @Override
    public void updateHotelRoom(HotelRoom hotelRoom) {
        // 拼接房间号(楼层数+房间号)
//        hotelRoom.setRoomNumber(Convert.toInt(hotelRoom.getFloorNumber().toString() + hotelRoom.getRoomNumber().toString()));
        hotelRoomMapper.updateHotelRoom(hotelRoom);
    }

    /**
     * 删除酒店房间(软删除)
     *
     * @param roomId 房间ID
     */
    @Override
    public void deleteHotelRoom(Integer roomId) {
        HotelRoom hotelRoom = hotelRoomMapper.selectHotelRoomById(roomId);
        hotelRoom.setStatus("冻结");
        hotelRoomMapper.updateHotelRoom(hotelRoom);
    }

    /**
     * 查询酒店房间列表
     *
     * @param roomNumber  房间号(可选)
     * @param floorNumber 楼层号(可选)
     * @param roomTypeId  房型ID(可选)
     * @param status      房间状态(可选)
     * @param pageNum     页码(可选,默认为1)
     * @param pageSize    每页条数(可选,默认为10)
     * @param orderBy     排序字段(可选,默认为create_time)
     * @param orderType   排序方式(可选,默认为desc)
     * @return 酒店房间列表
     */
    @Override
    public PageBean<HotelRoom> getHotelRooms(Integer roomNumber, Integer floorNumber, Integer roomTypeId, String status,
                                             Integer pageNum, Integer pageSize, String orderBy, String orderType) {
        // 创建PageBean对象
        PageBean<HotelRoom> pageBean = new PageBean<>();
        // 开启分页查询
        try (Page<HotelRoom> page = PageHelper.startPage(pageNum, pageSize, orderBy + " " + orderType)) {
            // 调用Mapper完成查询
            List<HotelRoom> roomTypeList = hotelRoomMapper.selectHotelRooms(roomNumber, floorNumber, roomTypeId, status);
            // 把数据填充到PageBean对象中
            pageBean.setTotal(page.getTotal());
            pageBean.setItems(roomTypeList);
        }
        return pageBean;
    }
}
