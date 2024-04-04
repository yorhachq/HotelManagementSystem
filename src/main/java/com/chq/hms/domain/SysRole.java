package com.chq.hms.domain;

import com.chq.hms.anno.AvailableStatus;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 系统角色
 */
@Data
public class SysRole {
    private Integer roleId;
    // 角色名称(用于外部展示)
    private String roleName;
    // 角色代码(用于内部处理)
    private String roleCode;
    // 角色拥有的路由访问权限列表(对应前端路由的唯一name)
    private List<String> permission;
    // 角色描述(可在此说明角色的权限)
    private String Description;
    // 角色状态(启用|冻结)
    @AvailableStatus
    private String status;

    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
