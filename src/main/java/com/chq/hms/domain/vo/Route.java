package com.chq.hms.domain.vo;

import cn.hutool.log.StaticLog;
import com.chq.hms.domain.SysRole;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 动态路由
 * 使用@JsonProperty注解，方便同步调整前端对应字段名称
 */
@Data
@AllArgsConstructor
public class Route {
    @JsonProperty("path")
    private String path;

    @JsonProperty("meta")
    private Map<String, Object> meta;

    @JsonProperty("children")
    private List<Children> children;

    // 将子路由定义为内部类
    @Data
    @AllArgsConstructor
    private static class Children {
        @JsonProperty("path")
        private String path;

        @JsonProperty("name")
        private String name;

        @JsonProperty("meta")
        private Map<String, Object> meta;
    }

    // 创建静态工厂方法来简化 Route 和 Children 对象的构建
    private static Route createParentRoute(String path, Map<String, Object> meta) {
        return new Route(path, meta, null);
    }

    private static Children createChildRoute(String path, String name, Map<String, Object> meta) {
        return new Children(path, name, meta);
    }

    // 将子路由添加到父路由中
    private void addChild(Children child) {
        if (this.children == null) {
            this.children = new ArrayList<>();
        }
        this.children.add(child);
    }

    // 对构建动态路由的方法进行高度封装，返回完整的路由列表
    public static List<Route> buildAsyncRoute(List<SysRole> sysRoleList) {
        // 完整的路由权限集合，格式：{路由名称：[角色1，角色2]}
        Map<String, List<String>> allRouteRoles = getAllRouteRoles(sysRoleList);
        StaticLog.info("Full routing permissions loaded\n{}", allRouteRoles);

        // 构建各个路由
//        Route permissionRoute = getPermissionRoute(allRouteRoles);
        Route personnelRoute = getPersonnelRoute(allRouteRoles);
        Route systemRoute = getSystemRoute(allRouteRoles);

        return List.of(/*permissionRoute,*/ personnelRoute, systemRoute);
    }

    // 读取SysRole表所有数据，从而设置每个路由项的roles列表
    private static Map<String, List<String>> getAllRouteRoles(List<SysRole> sysRoleList) {
        String role;
        List<String> permission;

        // 完整的路由权限集合，格式：{路由名称：[角色1，角色2]}
        Map<String, List<String>> allRouteRoles = new LinkedHashMap<>();

        // 定义所有的路由名称(与前端的路由name字段对应，该name字段在前端具有唯一性)
        List<String> routeNameList = List.of(
//                "PermissionPage",
//                "PermissionButton",
                "Member",
                "Staff",
                "Role",
                "System"
        );

        // 遍历路由名称列表，填充路由权限集合
        for (String routeName : routeNameList) {
            // 当前路由项的roles
            List<String> roles = new ArrayList<>();
            // 遍历sysRoleList，并判断角色是否拥有该路由的权限
            for (SysRole sysRole : sysRoleList) {
                // 获取角色代码
                role = sysRole.getRoleCode();
                // 获取角色权限列表
                permission = sysRole.getPermission();
                if (permission.contains(routeName)) {
                    // 如果角色拥有该路由的权限，则将角色代码添加到roles列表中
                    roles.add(role);
                }
            }
            // 将遍历添加完成后roles列表添加到allRouteRoles集合中
            allRouteRoles.put(routeName, roles);
        }
        return allRouteRoles;
    }

//    private static Route getPermissionRoute(Map<String, List<String>> allRouteRoles) {
//        // 权限管理父路由
//        Route permissionRoute = Route.createParentRoute(
//                "/permission",
//                Map.of(
//                        "title", "menus.permission",
//                        "icon", "ep:lollipop",
//                        "rank", 10
//                ));
//        // 权限管理子路由
//        Children permissionChildPage = Route.createChildRoute(
//                "/permission/page/index",
//                "PermissionPage",
//                Map.of(
//                        "title", "menus.permissionPage",
//                        "roles", allRouteRoles.get("PermissionPage")
//                ));
//        Children permissionChildButton = Route.createChildRoute(
//                "/permission/button/index",
//                "PermissionButton",
//                Map.of(
//                        "title", "menus.permissionButton",
//                        "roles", allRouteRoles.get("PermissionButton"),
//                        "auths", List.of(
//                                "permission:btn:add",
//                                "permission:btn:edit",
//                                "permission:btn:delete"
//                        )
//                ));
//        permissionRoute.addChild(permissionChildPage);
//        permissionRoute.addChild(permissionChildButton);
//        return permissionRoute;
//    }

    private static Route getPersonnelRoute(Map<String, List<String>> allRouteRoles) {
        // 人员管理父路由
        Route personnelRoute = Route.createParentRoute(
                "/personnel",
                Map.of(
                        "title", "menus.personnelManagement",
                        "icon", "ic:baseline-manage-accounts",
                        "rank", 4
                ));
        // 人员管理子路由
        Children personnelChildrenMember = Route.createChildRoute(
                "/personnel/member",
                "Member",
                Map.of(
                        "title", "menus.member",
                        "icon", "icon-park-outline:vip-one",
                        "roles", allRouteRoles.get("Member")
                ));
        Children personnelChildrenStaff = Route.createChildRoute(
                "/personnel/staff",
                "Staff",
                Map.of(
                        "title", "menus.staff",
                        "icon", "raphael:employee",
                        "roles", allRouteRoles.get("Staff")
                ));
//        Children personnelChildrenRole = Route.createChildRoute(
//                "/personnel/role",
//                "Role",
//                Map.of(
//                        "title", "menus.role",
//                        "icon", "ri:key-2-line",
//                        "roles", allRouteRoles.get("Role")
//                ));
        personnelRoute.addChild(personnelChildrenMember);
        personnelRoute.addChild(personnelChildrenStaff);
//        personnelRoute.addChild(personnelChildrenRole);
        return personnelRoute;
    }

    private static Route getSystemRoute(Map<String, List<String>> allRouteRoles) {
        // 系统管理父路由
        Route systemRoute = Route.createParentRoute(
                "/system",
                Map.of(
                        "title", "menus.systemManagement",
                        "icon", "ri:shield-keyhole-line",
                        "rank", 5
                ));
        // 系统管理子路由
        Children systemChildLog = Route.createChildRoute(
                "/system/sysLog",
                "SysLog",
                Map.of(
                        "title", "系统日志",
                        "icon", "icon-park-outline:log",
                        "roles", allRouteRoles.get("System")
                ));
        Children systemChildRechargeLog = Route.createChildRoute(
                "/system/rechargeLog",
                "RechargeLog",
                Map.of(
                        "title", "充值记录",
                        "icon", "ic:outline-monetization-on",
                        "roles", allRouteRoles.get("System")
                ));
        systemRoute.addChild(systemChildLog);
        systemRoute.addChild(systemChildRechargeLog);
        return systemRoute;
    }
}

