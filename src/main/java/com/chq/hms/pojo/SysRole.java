package com.chq.hms.pojo;

import lombok.Data;

import java.time.LocalDateTime;

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
    // 角色描述(可在此说明角色的权限)
    private String Description;
    // 角色状态(启用|冻结)
    private String status;

    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
