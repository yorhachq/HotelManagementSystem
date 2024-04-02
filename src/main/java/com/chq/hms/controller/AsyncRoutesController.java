package com.chq.hms.controller;

import com.chq.hms.pojo.Result;
import com.chq.hms.pojo.Route;
import com.chq.hms.util.AsyncRoutesUtil;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/get-async-routes")
@SuppressWarnings("rawtypes")
public class AsyncRoutesController {
    private List<String> roles = new ArrayList<>();

    @PostMapping
    public void setPermission(@RequestBody List<String> roles) {
        // 后面要同步到数据库，再从数据库中获取
        this.roles = roles;
    }

    @GetMapping
    public Result getAsyncRoutes() {
        List<Route> routeList = new ArrayList<>();

        // 权限管理父路由
        Route permissionRoute = AsyncRoutesUtil.getParent(
                "/permission",
                "menus.permission",
                "ep:lollipop",
                10
        );
        // 权限管理子路由列表
        setPermission(List.of("admin", "common")); //参数后面要从数据库获取
        List<Object> permissionChildrenList = new ArrayList<>();
        Map<String, Object> permissionChildrenPage = AsyncRoutesUtil.getChildren(
                "/permission/page/index",
                "PermissionPage",
                "menus.permissionPage",
                "ep:lollipop",
                roles
        );
        permissionChildrenList.add(permissionChildrenPage);
        Map<String, Object> permissionChildrenButton = AsyncRoutesUtil.getChildren(
                "/permission/button/index",
                "PermissionButton",
                "menus.permissionButton",
                roles,
                List.of(
                        "permission:btn:add",
                        "permission:btn:edit",
                        "permission:btn:delete")
        );
        permissionChildrenList.add(permissionChildrenButton);
        permissionRoute.setChildren(permissionChildrenList);

        // 人员管理父路由
        Route personnelRoute = AsyncRoutesUtil.getParent(
                "/personnel",
                "menus.personnelManagement",
                "ic:baseline-manage-accounts",
                4
        );
        // 人员管理子路由列表
        setPermission(List.of("admin", "common")); //参数后面要从数据库获取
        List<Object> personnelChildrenList = new ArrayList<>();
        Map<String, Object> personnelChildrenMember = AsyncRoutesUtil.getChildren(
                "/personnel/member",
                "Member",
                "menus.member",
                "icon-park-outline:vip-one",
                roles
        );
        personnelChildrenList.add(personnelChildrenMember);

        setPermission(List.of("admin"));
        Map<String, Object> personnelChildrenStaff = AsyncRoutesUtil.getChildren(
                "/personnel/staff",
                "Staff",
                "menus.staff",
                "raphael:employee",
                roles
        );
        personnelChildrenList.add(personnelChildrenStaff);

        Map<String, Object> personnelChildrenRole = AsyncRoutesUtil.getChildren(
                "/personnel/role",
                "Role",
                "menus.role",
                "ri:key-2-line",
                roles
        );
        personnelChildrenList.add(personnelChildrenRole);

        personnelRoute.setChildren(personnelChildrenList);

        // 系统管理父路由
        Route systemRoute = AsyncRoutesUtil.getParent(
                "/system",
                "menus.systemManagement",
                "ri:shield-keyhole-line",
                5
        );
        // 系统管理子路由列表
        setPermission(List.of("admin"));
        List<Object> systemChildrenList = new ArrayList<>();
        Map<String, Object> systemChildrenLog = AsyncRoutesUtil.getChildren(
                "/system/index",
                "System",
                "menus.systemManagement",
                "ri:shield-keyhole-line",
                roles
        );
        systemChildrenList.add(systemChildrenLog);
        systemRoute.setChildren(systemChildrenList);

        // 将所有节点添加到路由列表
        routeList.add(permissionRoute);
        routeList.add(personnelRoute);
        routeList.add(systemRoute);

        // 最后一定要以列表形式返回！！！
        return Result.success(routeList);
    }
}
