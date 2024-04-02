package com.chq.hms.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

/**
 * 动态路由
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Route {
    private String path;
    private Map<String, Object> meta;
    private List<Object> children;

    // 将子路由定义为内部类
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class Children {
        private String path;
        private String name;
        private Map<String, Object> meta;
    }
}

