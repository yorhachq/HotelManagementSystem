package com.chq.hms.service;

import com.chq.hms.pojo.SysRole;
import com.chq.hms.pojo.SysUser;

public interface SysUserService {

    //根据用户名查询用户
    SysUser findByUserName(String username);

    //注册
    void register(String username, String password);

    //更新用户基本信息
    void update(SysUser user);

    //更新用户头像
    void updateAvatar(String avatarUrl);

    //更新用户密码
    void updatePwd(String newPwd);

    //获取用户角色
    SysRole findRoleById(Integer roleId);
}
