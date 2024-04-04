package com.chq.hms.controller;

import com.chq.hms.domain.Result;
import com.chq.hms.domain.SysRole;
import com.chq.hms.domain.vo.Route;
import com.chq.hms.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/get-async-routes")
@SuppressWarnings("rawtypes")
public class AsyncRoutesController {
    @Autowired
    private SysRoleService sysRoleService;

    @GetMapping
    public Result getAsyncRoutes() {
        List<SysRole> sysRoleList = sysRoleService.listAllSysRoles();
        List<Route> routeList = Route.buildAsyncRoute(sysRoleList);

        // 注意返回的data是一个列表
        return Result.success(routeList);
    }
}
