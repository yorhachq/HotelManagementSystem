package com.chq.hms.service.impl;

import com.chq.hms.mapper.SysUserMapper;
import com.chq.hms.pojo.SysRole;
import com.chq.hms.pojo.SysUser;
import com.chq.hms.service.SysUserService;
import com.chq.hms.util.Md5Util;
import com.chq.hms.util.ThreadLocalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Map;

@Service
public class SysUserServiceImpl implements SysUserService {
    @Autowired
    private SysUserMapper userMapper;

    @Override
    public SysUser findByUserName(String username) {
        return userMapper.findByUserName(username);
    }

    @Override
    public void register(String username, String password) {
        //MD5加密
        String md5String = Md5Util.getMD5String(password);
        //添加用户
        userMapper.add(username, md5String);
    }

    @Override
    public void update(SysUser user) {
        //将更新时间设为系统当前时间
        user.setUpdateTime(LocalDateTime.now());
        userMapper.update(user);
    }

    @Override
    public void updateAvatar(String avatarUrl) {
        Map<String, Object> map = ThreadLocalUtil.get();
        Integer id = (Integer) map.get("id");
        userMapper.updateAvatar(avatarUrl, id);
    }

    @Override
    public void updatePwd(String newPwd) {
        Map<String, Object> map = ThreadLocalUtil.get();
        Integer id = (Integer) map.get("id");
        userMapper.updatePwd(Md5Util.getMD5String(newPwd), id);
    }

    @Override
    public void updatePwd(Integer id, String newPwd) {
        userMapper.updatePwd(Md5Util.getMD5String(newPwd), id);
    }

    @Override
    public SysRole findRoleById(Integer roleId) {
        return userMapper.findRoleById(roleId);
    }

}
