package com.chq.hms.domain.vo;

import com.chq.hms.domain.SysLog;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 系统日志
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SysLogVO extends SysLog {
    private String usrName;
    private String roleName;
    private String roleCode;
}
