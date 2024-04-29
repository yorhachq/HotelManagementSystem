package com.chq.hms.controller;

import com.chq.hms.domain.Result;
import com.chq.hms.domain.vo.PageBean;
import com.chq.hms.domain.vo.SysLogVO;
import com.chq.hms.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 系统日志Controller
 */
@RestController
@RequestMapping("/sysLog")
public class SysLogController {
    @SuppressWarnings("all")
    @Autowired
    private SysLogService sysLogService;

    /**
     * 分页查询操作日志
     *
     * @param pageNum  当前页码
     * @param pageSize 每页记录数
     * @param action   操作描述
     * @param username 操作人用户名
     * @return 操作日志分页数据
     */
//    @OperationLog("数据获取：系统日志")
    @GetMapping
    public Result<PageBean<SysLogVO>> findPage(@RequestParam(defaultValue = "1") Integer pageNum,
                                               @RequestParam(defaultValue = "10") Integer pageSize,
                                               @RequestParam(required = false) String action,
                                               @RequestParam(required = false) String address,
                                               @RequestParam(required = false) String username,
                                               @RequestParam(required = false) String roleCode,
                                               @RequestParam(defaultValue = "create_time") String orderBy,
                                               @RequestParam(defaultValue = "desc") String orderType) {
        PageBean<SysLogVO> pageBean = sysLogService.findPage(pageNum, pageSize, action, address, username, roleCode, orderBy, orderType);
        return Result.success(pageBean);
    }
}
