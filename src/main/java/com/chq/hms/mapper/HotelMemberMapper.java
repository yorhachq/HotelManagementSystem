package com.chq.hms.mapper;

import com.chq.hms.domain.HotelMember;
import com.chq.hms.domain.vo.HotelMemberVO;
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
     *
     * @param hotelMember 酒店会员信息
     */
    void insertHotelMember(HotelMember hotelMember);

    /**
     * 更新酒店会员
     *
     * @param hotelMember 酒店会员信息
     */
    void updateHotelMember(HotelMember hotelMember);

    /**
     * 根据ID查询酒店会员
     *
     * @param memberId 会员ID
     * @return 酒店会员信息
     */
    HotelMember selectHotelMemberById(Integer memberId);

    /**
     * 根据用户ID查询酒店会员
     *
     * @param userId 用户ID
     * @return 酒店会员信息
     */
    HotelMember selectHotelMemberByUserId(Integer userId);

    /**
     * 根据用户名查询酒店会员
     *
     * @param username 用户名
     * @return 酒店会员信息
     */
    HotelMember selectMemberByUsername(String username);

    /**
     * 查询酒店会员列表
     *
     * @param username    用户名(可选)
     * @param gender      性别(可选)
     * @param phone       手机号(可选)
     * @param memberLevel 会员等级(可选)
     * @param status      账户状态(可选)
     * @return 酒店会员列表
     */
    List<HotelMemberVO> selectMemberVOs(@Param("username") String username,
                                        @Param("gender") String gender,
                                        @Param("phone") String phone,
                                        @Param("memberLevel") String memberLevel,
                                        @Param("status") String status);

    /**
     * 获取会员详细信息
     *
     * @param userId 用户ID
     * @return 会员详细信息
     */
    HotelMemberVO selectMemberInfo(Integer userId);
}
