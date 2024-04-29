package com.chq.hms.mapper;

import com.chq.hms.domain.HotelRechargeRecord;
import com.chq.hms.domain.vo.HotelRechargeRecordVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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

    /**
     * 分页查询充值记录
     *
     * @param username      用户名
     * @param phone         手机号
     * @param email         邮箱
     * @param paymentMethod 支付方式
     * @return 充值记录列表
     */
    List<HotelRechargeRecordVO> selectPage(@Param("username") String username,
                                           @Param("phone") String phone,
                                           @Param("email") String email,
                                           @Param("paymentMethod") String paymentMethod);

}
