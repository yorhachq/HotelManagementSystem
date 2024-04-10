package com.chq.hms.domain.vo;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.StrUtil;
import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * 数据统计
 */
@Data
public class DataStatistics {
    private Integer id;
    // 统计数据所属的日期
    private Integer date;
    // 当日预入住人数
    private Integer checkinCount;
    // 当日预退房人数
    private Integer checkoutCount;
    // 当日订单笔数
    private Integer orderCount;
    // 当日营业额
    private Double revenue;

    /**
     * 获取今日数据(页面顶部四个模块)
     *
     * @param moduleName    模块名称
     * @param todayData     今日数据
     * @param yesterdayData 昨日数据
     * @param thisWeekData  本周数据
     * @return 对应模块的Map集合
     */
    public static Map<String, Object> getTodayData(String moduleName, Map<String, Object> todayData, Map<String, Object> yesterdayData, List<Map<String, Object>> thisWeekData) {
        String name = "";
        String columnName = "";
        String percent;
        // 根据对应模块名称填充相应的数据
        columnName = switch (moduleName) {
            case "checkin" -> {
                name = "今日入住数";
                yield "checkin_count";
            }
            case "checkout" -> {
                name = "今日退房数";
                yield "checkout_count";
            }
            case "order" -> {
                name = "今日订单笔数";
                yield "order_count";
            }
            case "revenue" -> {
                name = "今日营业额";
                yield "revenue";
            }
            default -> columnName;
        };
        Integer value = Convert.toInt(todayData.get(columnName));
        // 计算上日同比增长
        Integer yesterdayCount = Convert.toInt(yesterdayData.get(columnName));
        double increase = (value - yesterdayCount) * 100.0 / yesterdayCount;
        percent = StrUtil.format("{}{}%", increase > 0 ? "+" : "-", String.format("%.2f", increase));

        // 本周数据概览
        String finalColumnName = columnName;
        List<Integer> data = new java.util.ArrayList<>(thisWeekData.stream().map(item -> Convert.toInt(item.get(finalColumnName))).toList());
        // 为了维持模块中折线图的展示，若当日为周一，即本自然周只有一条数据时，将前一日的数据填充为首条，确保data是不少于两个值的列表
        if (data.size() <= 1) {
            data.add(0, yesterdayCount);
        }
        return Map.of(
                "name", name,
                "value", value,
                "percent", percent,
                "data", data
        );
    }

    /**
     * 获取全周数据
     *
     * @param moduleName1 模块1名称
     * @param moduleName2 模块2名称
     * @param weekData    本周数据
     * @return 对应模块的Map集合
     */
    public static Map<String, List<Integer>> getWeekData(String moduleName1, String moduleName2, List<Map<String, Object>> weekData) {
        String columnName1 = "";
        String columnName2 = "";
        // 根据对应模块名称填充相应的数据
        columnName1 = switch (moduleName1) {
            case "checkin" -> "checkin_count";
            case "checkout" -> "checkout_count";
            case "order" -> "order_count";
            case "revenue" -> "revenue";
            default -> columnName1;
        };
        columnName2 = switch (moduleName2) {
            case "checkin" -> "checkin_count";
            case "checkout" -> "checkout_count";
            case "order" -> "order_count";
            case "revenue" -> "revenue";
            default -> columnName2;
        };
        // 全周数据列表
        String finalColumnName1 = columnName1;
        String finalColumnName2 = columnName2;
        List<Integer> data1 = weekData.stream().map(item -> Convert.toInt(item.get(finalColumnName1))).toList();
        List<Integer> data2 = weekData.stream().map(item -> Convert.toInt(item.get(finalColumnName2))).toList();
        return Map.of(moduleName1, data1, moduleName2, data2);
    }

}
