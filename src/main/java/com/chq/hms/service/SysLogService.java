package com.chq.hms.service;

import com.chq.hms.domain.vo.PageBean;
import com.chq.hms.domain.SysLog;
import com.chq.hms.domain.vo.SysLogVO;

/**
 * 系统日志Service接口
 */
public interface SysLogService {

    /**
     * 保存操作日志
     *
     * @param sysLog 操作日志对象
     */
    void save(SysLog sysLog);

    /**
     * 分页查询操作日志
     *
     * @param pageNum   当前页码
     * @param pageSize  每页记录数
     * @param action    操作描述
     * @param address   请求来源地址
     * @param username  操作人用户名
     * @param roleCode  角色代码
     * @param orderBy   排序字段
     * @param orderType 排序方式
     * @return 操作日志分页数据
     */
    PageBean<SysLogVO> findPage(Integer pageNum, Integer pageSize, String action,String address, String username, String roleCode, String orderBy, String orderType);
}
