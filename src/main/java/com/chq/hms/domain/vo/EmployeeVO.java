package com.chq.hms.domain.vo;

import com.chq.hms.domain.SysUser;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 员工列表视图
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class EmployeeVO extends SysUser {
    private String roleName;
    private String roleCode;
}
