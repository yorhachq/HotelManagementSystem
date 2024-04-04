package com.chq.hms.mapper;

import com.chq.hms.domain.SysRole;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysRoleMapper {
    // 获取所有系统角色
    List<SysRole> listAllSysRoles();
}
