package com.chq.hms.util;

import com.chq.hms.pojo.Route;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class AsyncRoutesUtil {

    /**
     * 获取父路由
     *
     * @param path  路由路径
     * @param title 菜单标题
     * @param icon  菜单项图标
     * @param rank  菜单排序
     * @return 父路由
     */
    public static Route getParent(String path, String title, String icon, Integer rank) {
        Map<String, Object> meta = new LinkedHashMap<>();

        Route parentRoute = new Route();
        parentRoute.setPath(path);
        meta.put("title", title);
        meta.put("icon", icon);
        meta.put("rank", rank);
        parentRoute.setMeta(meta);
        return parentRoute;
    }

    /**
     * 获取子路由(不含按钮权限auths)
     *
     * @param path  路由路径
     * @param name  唯一名称
     * @param title 菜单标题
     * @param icon  菜单项图标
     * @param roles 菜单权限列表
     * @return 单个子路由项
     */
    public static Map<String, Object> getChildren(String path, String name, String title, String icon, List<String> roles) {
        Map<String, Object> meta = new LinkedHashMap<>();
        meta.put("icon", icon);
        meta.put("title", title);
        meta.put("roles", roles);
        Map<String, Object> children = new LinkedHashMap<>();
        children.put("path", path);
        children.put("name", name);
        children.put("meta", meta);
        return children;
    }

    /**
     * 获取子路由(不含按钮权限auths)
     *
     * @param path  路由路径
     * @param name  唯一名称
     * @param title 菜单标题
     * @param roles 菜单权限列表
     * @param auths 按钮权限列表
     * @return 单个子路由项
     */
    public static Map<String, Object> getChildren(String path, String name, String title, List<String> roles, List<String> auths) {
        Map<String, Object> meta = new LinkedHashMap<>();
        meta.put("title", title);
        meta.put("roles", roles);
        meta.put("auths", auths);
        Map<String, Object> children = new LinkedHashMap<>();
        children.put("path", path);
        children.put("name", name);
        children.put("meta", meta);
        return children;
    }
}
