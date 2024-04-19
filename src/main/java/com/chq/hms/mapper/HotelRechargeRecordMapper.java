package com.chq.hms.mapper;

import com.chq.hms.domain.HotelRechargeRecord;
import org.apache.ibatis.annotations.Mapper;

/**
 * 酒店会员充值记录Mapper接口
 */
@Mapper
public interface HotelRechargeRecordMapper {

    /**
     * 插入酒店会员充值记录
     *
     * @param rechargeRecord 充值记录
     */
    void insertHotelRechargeRecord(HotelRechargeRecord rechargeRecord);
}
