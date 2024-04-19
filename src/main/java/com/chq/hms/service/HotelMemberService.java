package com.chq.hms.service;

import com.chq.hms.domain.HotelRechargeRecord;
import com.chq.hms.domain.SysUser;
import com.chq.hms.domain.vo.HotelMemberVO;
import com.chq.hms.domain.vo.PageBean;

/**
 * 酒店会员模块
 */
public interface HotelMemberService {

    /**
     * 会员注册
     *
     * @param sysUser 系统用户信息
     */
    void registerMember(SysUser sysUser);

    /**
     * 检查会员是否存在
     * @param username 用户名
     */
    boolean checkMemberExists(String username);

    /**
     * 会员充值
     *
     * @param rechargeRecord 充值记录
     */
    void rechargeMember(HotelRechargeRecord rechargeRecord);


    /**
     * 删除会员(软删除)
     *
     * @param userId 用户ID
     */
    void deleteMember(Integer userId);

    /**
     * 查询会员列表
     *
     * @param username    用户名(可选)
     * @param phone       手机号(可选)
     * @param memberLevel 会员等级(可选)
     * @param pageNum     页码(可选,默认为1)
     * @param pageSize    每页条数(可选,默认为10)
     * @param orderBy     排序字段(可选,默认为create_time)
     * @param orderType   排序方式(可选,默认为desc)
     * @return 会员列表
     */
    PageBean<HotelMemberVO> getMembers(String username, String phone, String memberLevel,
                                       Integer pageNum, Integer pageSize,
                                       String orderBy, String orderType);
}
