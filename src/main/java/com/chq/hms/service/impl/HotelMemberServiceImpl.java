package com.chq.hms.service.impl;

import com.chq.hms.domain.HotelMember;
import com.chq.hms.domain.HotelRechargeRecord;
import com.chq.hms.domain.SysUser;
import com.chq.hms.domain.vo.HotelMemberVO;
import com.chq.hms.domain.vo.PageBean;
import com.chq.hms.mapper.HotelMemberMapper;
import com.chq.hms.mapper.HotelRechargeRecordMapper;
import com.chq.hms.mapper.SysUserMapper;
import com.chq.hms.service.HotelMemberService;
import com.chq.hms.util.Md5Util;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 酒店会员管理Service实现类
 */
@Service
public class HotelMemberServiceImpl implements HotelMemberService {

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private HotelMemberMapper hotelMemberMapper;

    @Autowired
    private HotelRechargeRecordMapper hotelRechargeRecordMapper;

    /**
     * 会员注册
     *
     * @param sysUser 系统用户信息
     */
    @Override
    @Transactional
    public void registerMember(SysUser sysUser) {
        //MD5加密
        sysUser.setPassword(Md5Util.getMD5String(sysUser.getPassword()));
        // 设置用户角色为guest
        sysUser.setRoleId(3);
        sysUser.setStatus("正常");
        // 注册为系统用户
        sysUserMapper.insertSysUser(sysUser);
        // 获取刚刚注册用户的ID
        sysUser = sysUserMapper.findByUserName(sysUser.getUsername());
        // 初始化会员信息
        HotelMember hotelMember = new HotelMember();
        hotelMember.setUserId(sysUser.getUserId());
        hotelMember.setMemberLevel("Lv.1");
        hotelMember.setMemberPoints(0);
        hotelMember.setBalance(0.0);
        hotelMemberMapper.insertHotelMember(hotelMember);
    }

    /**
     * 试图登录的用户是否为会员
     *
     * @param username 用户名
     * @return true表示用户为会员，false表示用户不是会员
     */
    @Override
    public boolean checkMemberExists(String username) {
        HotelMember hotelMember = hotelMemberMapper.selectMemberByUsername(username);
        return hotelMember != null;
    }

    /**
     * 会员充值
     *
     * @param rechargeRecord 充值记录
     */
    @Override
    @Transactional
    public void rechargeMember(HotelRechargeRecord rechargeRecord) {
        // 插入充值记录
        hotelRechargeRecordMapper.insertHotelRechargeRecord(rechargeRecord);

        // 更新会员余额和积分
        HotelMember hotelMember = hotelMemberMapper.selectHotelMemberById(rechargeRecord.getMemberId());
        Double newBalance = hotelMember.getBalance() + rechargeRecord.getAmount();
        Integer newPoints = hotelMember.getMemberPoints() + rechargeRecord.getAmount().intValue();
        hotelMember.setBalance(newBalance);
        hotelMember.setMemberPoints(newPoints);

        // 检查是否达到升级条件
        String newLevel = checkMemberLevel(newPoints);
        if (!newLevel.equals(hotelMember.getMemberLevel())) {
            hotelMember.setMemberLevel(newLevel);
        }

        hotelMemberMapper.updateHotelMember(hotelMember);
    }

    /**
     * 删除会员(软删除)
     *
     * @param userId 用户ID
     */
    @Override
    @Transactional
    public void deleteMember(Integer userId) {
        SysUser sysUser = sysUserMapper.selectSysUserById(userId);
        sysUser.setStatus("冻结");
        sysUserMapper.update(sysUser);
    }

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
    @Override
    public PageBean<HotelMemberVO> getMembers(String username, String phone, String memberLevel,
                                              Integer pageNum, Integer pageSize,
                                              String orderBy, String orderType) {
        // 创建PageBean对象
        PageBean<HotelMemberVO> pageBean = new PageBean<>();
        // 开启分页查询
        try (Page<HotelMemberVO> page = PageHelper.startPage(pageNum, pageSize, orderBy + " " + orderType)) {
            // 调用Mapper完成查询
            List<HotelMemberVO> memberVOList = hotelMemberMapper.selectMemberVOs(username, phone, memberLevel);
            // 把数据填充到PageBean对象中
            pageBean.setTotal(page.getTotal());
            pageBean.setItems(memberVOList);
        }
        return pageBean;
    }

    /**
     * 检查会员等级
     *
     * @param points 会员积分
     * @return 对应的会员等级
     */
    private String checkMemberLevel(Integer points) {
        if (points >= 10000) {
            return "Lv.6";
        } else if (points >= 5000) {
            return "Lv.5";
        } else if (points >= 3000) {
            return "Lv.4";
        } else if (points >= 1500) {
            return "Lv.3";
        } else if (points >= 500) {
            return "Lv.2";
        } else {
            return "Lv.1";
        }
    }
}
