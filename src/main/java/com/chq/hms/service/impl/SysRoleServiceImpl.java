package com.chq.hms.service.impl;

import com.chq.hms.mapper.SysRoleMapper;
import com.chq.hms.domain.SysRole;
import com.chq.hms.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysRoleServiceImpl implements SysRoleService {
    @Autowired
    private SysRoleMapper sysRoleMapper;
    @Override
    public List<SysRole> listAllSysRoles() {
        return sysRoleMapper.listAllSysRoles();
    }
}
