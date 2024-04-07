package com.chq.hms.controller;

import cn.hutool.log.StaticLog;
import com.chq.hms.domain.Result;
import com.chq.hms.domain.SysRole;
import com.chq.hms.domain.vo.Route;
import com.chq.hms.service.SysRoleService;
import com.chq.hms.util.JwtUtil;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 动态路由
 * 供后台管理系统动态生成菜单
 */
@RestController
@RequestMapping("/get-async-routes")
@SuppressWarnings("rawtypes")
public class AsyncRoutesController {
    @Autowired
    private SysRoleService sysRoleService;
    private static final String FLAG = "Redirect:";

    @Value("${env.frontend.ui-url}")
    private String GUEST_REDIRECTING_URL;

    @GetMapping
    public Result getAsyncRoutes(HttpServletRequest request) {
        // 对guset角色进行重定向
        if (guestRedirect(request)) {
            return Result.error(FLAG + GUEST_REDIRECTING_URL);
        }
        List<SysRole> sysRoleList = sysRoleService.listAllSysRoles();
        List<Route> routeList = Route.buildAsyncRoute(sysRoleList);

        // 注意返回的data是一个列表
        return Result.success(routeList);
    }

    private boolean guestRedirect(HttpServletRequest request) {
        // 从浏览器请求头获取token并解析角色
        String token = request.getHeader("Authorization");
        token = token.replace("Bearer ", "");
        // 获取当前请求用户的 role 信息
        Map<String, Object> claims = JwtUtil.parseToken(token);
        String role = claims.get("role").toString();
        // 若role为guest,重定向页面到系统前台
        boolean flag = role.equals("guest");
        if (flag) {
            StaticLog.info("[304]Redirecting: {}", claims);
        }
        return flag;
    }
}
