package com.chq.hms.service;

import com.chq.hms.domain.SysRole;

import java.util.List;

public interface SysRoleService {
    // 获取所有系统角色
    List<SysRole> listAllSysRoles();
}
