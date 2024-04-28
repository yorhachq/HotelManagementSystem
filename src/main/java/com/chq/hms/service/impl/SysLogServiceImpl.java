package com.chq.hms.service.impl;

import com.chq.hms.domain.vo.PageBean;
import com.chq.hms.domain.SysLog;
import com.chq.hms.mapper.SysLogMapper;
import com.chq.hms.service.SysLogService;
import com.chq.hms.domain.vo.SysLogVO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 系统日志Service实现类
 */
@Service
public class SysLogServiceImpl implements SysLogService {

    @Autowired
    private SysLogMapper sysLogMapper;

    @Override
    public void save(SysLog sysLog) {
        sysLogMapper.insert(sysLog);
    }

    @Override
    public PageBean<SysLogVO> findPage(Integer pageNum, Integer pageSize, String action, String username, String roleCode, String orderBy, String orderType) {
        PageBean<SysLogVO> pageBean = new PageBean<>();
        try (Page<SysLogVO> page = PageHelper.startPage(pageNum, pageSize, orderBy + " " + orderType)) {
            sysLogMapper.selectPage(action, username, roleCode);
            pageBean.setTotal(page.getTotal());
            pageBean.setItems(page.getResult());
        }
        return pageBean;
    }
}
