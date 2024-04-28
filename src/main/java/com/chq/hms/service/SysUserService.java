package com.chq.hms.service;

import com.chq.hms.domain.SysRole;
import com.chq.hms.domain.SysUser;
import com.chq.hms.domain.vo.EmployeeVO;
import com.chq.hms.domain.vo.PageBean;

import java.util.List;

public interface SysUserService {

    //根据用户名查询用户
    SysUser findByUserName(String username);

    //根据ID查询用户
    SysUser findByUserId(Integer userId);

    //注册
    void register(String username, String password, Integer roleId);

    //更新用户基本信息
    void update(SysUser user);

    //更新用户基本信息(管理员)
    void updateByAdmin(SysUser user);

    //更新用户头像
    void updateAvatar(String avatarUrl);

    //更新用户密码(已登录)
    void updatePwd(String newPwd);

    //更新用户密码(忘记密码，未登录)
    void updatePwd(Integer id, String newPwd);

    //根据角色ID获取用户角色
    SysRole findRoleById(Integer roleId);

    //根据角色代号获取角色ID
    Integer findRoleByCode(String role);

    // 员工列表查询
    PageBean<EmployeeVO> findEmployeeList(String username, String phone, String email, String roleCode, String gender, String status, Integer pageNum, Integer pageSize, String orderBy, String orderType);

    List<SysRole> listRoles();
}
