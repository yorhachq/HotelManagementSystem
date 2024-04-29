package com.chq.hms.mapper;

import com.chq.hms.domain.SysLog;
import com.chq.hms.domain.vo.SysLogVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 系统日志Mapper接口
 */
@Mapper
public interface SysLogMapper {

    /**
     * 插入操作日志
     *
     * @param sysLog 操作日志对象
     */
    void insert(SysLog sysLog);

    /**
     * 分页查询操作日志
     *
     * @param action   操作描述
     * @param address  请求来源地址
     * @param username 操作人用户名
     * @param roleCode 操作人角色
     * @return 操作日志列表
     */
    List<SysLogVO> selectPage(@Param("action") String action, @Param("address") String address, @Param("username") String username, String roleCode);
}
