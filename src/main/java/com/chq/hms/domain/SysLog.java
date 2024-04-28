package com.chq.hms.domain;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 系统日志
 */
@Data
public class SysLog {
    private Integer logId;
    // 操作用户的ID
    @NotNull
    private Integer userId;
    // 行为
    @NotEmpty
    private String action;
    //IP
    private String ip;
    // IP归属地
    private String address;
    // 备注
    private String remark;
    // 日志记录时间
    private LocalDateTime createTime;
}
