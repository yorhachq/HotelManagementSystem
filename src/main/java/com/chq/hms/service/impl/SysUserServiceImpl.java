package com.chq.hms.service.impl;

import com.chq.hms.domain.SysRole;
import com.chq.hms.domain.SysUser;
import com.chq.hms.domain.vo.EmployeeVO;
import com.chq.hms.domain.vo.PageBean;
import com.chq.hms.mapper.SysUserMapper;
import com.chq.hms.service.SysUserService;
import com.chq.hms.util.Md5Util;
import com.chq.hms.util.ThreadLocalUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
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
    public SysUser findByUserId(Integer id) {
        return userMapper.findByUserId(id);
    }

    @Override
    public void register(String username, String password, Integer roleId) {
        //MD5加密
        String md5String = Md5Util.getMD5String(password);
        //添加用户
        userMapper.add(username, md5String, roleId);
    }

    @Override
    public void update(SysUser user) {
        //将更新时间设为系统当前时间
        user.setUpdateTime(LocalDateTime.now());
        Map<String, Object> map = ThreadLocalUtil.get();
        Integer id = (Integer) map.get("id");
        user.setUserId(id);
        userMapper.update(user);
    }

    @Override
    public void updateByAdmin(SysUser user) {
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

    @Override
    public Integer findRoleByCode(String role) {
        return userMapper.findRoleByCode(role);
    }

    @Override
    public PageBean<EmployeeVO> findEmployeeList(String username, String phone, String email, String roleCode, String gender, String status, Integer pageNum, Integer pageSize, String orderBy, String orderType) {
        // 创建PageBean对象
        PageBean<EmployeeVO> pageBean = new PageBean<>();
        // 开启分页查询
        try (Page<EmployeeVO> page = PageHelper.startPage(pageNum, pageSize, orderBy + " " + orderType)) {
            Map<String, Object> claims = ThreadLocalUtil.get();
            Integer selfId = (Integer) claims.get("id");
            // 调用Mapper完成查询
            List<EmployeeVO> employeeList = userMapper.selectEmployeeList(selfId, username, phone, email, roleCode, gender, status);
            // 把数据填充到PageBean对象中
            pageBean.setTotal(page.getTotal());
            pageBean.setItems(employeeList);
        }
        return pageBean;
    }

    @Override
    public List<SysRole> listRoles() {
        return userMapper.listRoles();
    }

}
