package com.chq.hms.mapper;

import com.chq.hms.domain.HotelMember;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 酒店会员管理Mapper接口
 */
@Mapper
public interface HotelMemberMapper {

    /**
     * 插入酒店会员
     * @param hotelMember 酒店会员信息
     */
    void insertHotelMember(HotelMember hotelMember);

    /**
     * 更新酒店会员
     * @param hotelMember 酒店会员信息
     */
    void updateHotelMember(HotelMember hotelMember);

    /**
     * 根据ID查询酒店会员
     * @param memberId 会员ID
     * @return 酒店会员信息
     */
    HotelMember selectHotelMemberById(Integer memberId);

    /**
     * 根据用户ID查询酒店会员
     * @param userId 用户ID
     * @return 酒店会员信息
     */
    HotelMember selectHotelMemberByUserId(Integer userId);

    /**
     * 查询酒店会员列表
     * @param userId 用户ID(可选)
     * @param memberLevel 会员等级(可选)
     * @return 酒店会员列表
     */
    List<HotelMember> selectHotelMembers(@Param("userId") Integer userId,
                                         @Param("memberLevel") String memberLevel);
}
