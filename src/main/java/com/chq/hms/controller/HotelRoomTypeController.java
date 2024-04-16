package com.chq.hms.controller;

import com.chq.hms.domain.HotelRoomType;
import com.chq.hms.domain.Result;
import com.chq.hms.domain.vo.PageBean;
import com.chq.hms.service.HotelRoomTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/hotelRoomType")
public class HotelRoomTypeController {

    @Autowired
    private HotelRoomTypeService hotelRoomTypeService;

    @PostMapping
    public Result<Void> addHotelRoomType(@RequestBody HotelRoomType hotelRoomType) {
        hotelRoomTypeService.addHotelRoomType(hotelRoomType);
        return Result.success();
    }

    @PutMapping
    public Result<Void> updateHotelRoomType(@RequestBody HotelRoomType hotelRoomType) {
        hotelRoomTypeService.updateHotelRoomType(hotelRoomType);
        return Result.success();
    }

    @DeleteMapping("/{roomTypeId}")
    public Result<Void> deleteHotelRoomType(@PathVariable Integer roomTypeId) {
        hotelRoomTypeService.deleteHotelRoomType(roomTypeId);
        return Result.success();
    }

    /**
     * 分页查询
     *
     * @param pageNum  当前页码
     * @param pageSize 每页条数
     * @param keyword  搜索关键词(非必须)
     * @return pageBean
     */
    @GetMapping
    public Result<PageBean<HotelRoomType>> getHotelRoomTypes(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "5") Integer pageSize,
            @RequestParam(required = false) String keyword,
            @RequestParam(defaultValue = "room_type_id") String orderBy,
            @RequestParam(defaultValue = "asc") String orderType
    ) {
        PageBean<HotelRoomType> pageBean = hotelRoomTypeService.getHotelRoomTypes(pageNum, pageSize, keyword, orderBy, orderType);
        return Result.success(pageBean);
    }
}
