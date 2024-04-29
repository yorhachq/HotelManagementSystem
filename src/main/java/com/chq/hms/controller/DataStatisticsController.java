package com.chq.hms.controller;

import cn.hutool.core.convert.Convert;
import com.chq.hms.anno.OperationLog;
import com.chq.hms.domain.Result;
import com.chq.hms.domain.vo.DataStatistics;
import com.chq.hms.service.DataStatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/dataStatistics")
public class DataStatisticsController {
    @SuppressWarnings("all")
    @Autowired
    private DataStatisticsService dataStatisticsService;

    private static Map<String, Object> allData;

    private void loadDayData() throws NullPointerException {
        Map<String, Object> todayData = dataStatisticsService.getTodayData();
        Map<String, Object> yesterdayData = dataStatisticsService.getYesterdayData();
        allData.putAll(Map.of(
                "todayData", todayData,
                "yesterdayData", yesterdayData));
    }

    private void loadWeekData() throws NullPointerException {
        List<Map<String, Object>> thisWeekData = dataStatisticsService.getThisWeekData();
        List<Map<String, Object>> lastWeekData = dataStatisticsService.getLastWeekData();
        allData.putAll(Map.of(
                "thisWeekData", thisWeekData,
                "lastWeekData", lastWeekData));
    }

    // 一周数据，遍历thisWeekData列表，逐项转换为Map
    private void convertWeekData(List<Map<String, Object>> weekData, String key) {
        Convert.toList(Map.class, allData.get(key)).forEach(map -> weekData.add(Convert.toMap(String.class, Object.class, map)));
    }

    // 获取今日模块数据(需求人数、提问数量、解决数量、用户满意度)
    @OperationLog("数据获取：酒店运营数据总览")
    @GetMapping("/todayData")
    public Result<List<Map<String, Object>>> getTodayData() {
        // 检查空数据
        boolean nullCheck = false;
        try {
            allData = new HashMap<>();
            // 从数据库加载数据
            loadDayData();
            loadWeekData();
        } catch (NullPointerException e) {
            nullCheck = true;
        }
        if (nullCheck) {
            // 返回空数据，交由前端处理
            return Result.success();
        }
        List<Map<String, Object>> thisWeekData = new ArrayList<>();
        convertWeekData(thisWeekData, "thisWeekData");
        List<Map<String, Object>> chartData = new ArrayList<>();
        // 当日数据
        Map<String, Object> todayData = Convert.toMap(String.class, Object.class, allData.get("todayData"));
        // 昨日数据
        Map<String, Object> yesterdayData = Convert.toMap(String.class, Object.class, allData.get("yesterdayData"));
        // 今日入住人数模块数据
        Map<String, Object> todayCheckin = DataStatistics.getTodayData("checkin", todayData, yesterdayData, thisWeekData);
        chartData.add(todayCheckin);
        // 今日退房人数模块数据
        Map<String, Object> todayCheckout = DataStatistics.getTodayData("checkout", todayData, yesterdayData, thisWeekData);
        chartData.add(todayCheckout);
        // 今日订单笔数模块数据
        Map<String, Object> todayOrder = DataStatistics.getTodayData("order", todayData, yesterdayData, thisWeekData);
        chartData.add(todayOrder);
        // 今日营业额模块数据
        Map<String, Object> todayRevenue = DataStatistics.getTodayData("revenue", todayData, yesterdayData, thisWeekData);
        chartData.add(todayRevenue);

        return Result.success(chartData);
    }

    // 获取分析概览柱形图数据(本周/上周 七日 入住/退房量)
    @GetMapping("/weekData")
    public Result<List<Map<String, List<Integer>>>> getWeekData() {
        // 检查空数据
        boolean nullCheck = false;
        try {
            allData = new HashMap<>();
            // 从数据库加载数据
            loadWeekData();
        } catch (NullPointerException e) {
            nullCheck = true;
        }
        if (nullCheck) {
            return Result.success();
        }

        List<Map<String, List<Integer>>> barChartData = new ArrayList<>();
        // 转换数据格式
        List<Map<String, Object>> thisWeekData = new ArrayList<>();
        convertWeekData(thisWeekData, "thisWeekData");
        List<Map<String, Object>> lastWeekData = new ArrayList<>();
        convertWeekData(lastWeekData, "lastWeekData");
        // 本周入住/退房人数集合
        Map<String, List<Integer>> thisWeekMap = DataStatistics.getWeekData("checkin", "checkout", thisWeekData);
        // 上周入住/退房人数集合
        Map<String, List<Integer>> lastWeekMap = DataStatistics.getWeekData("checkin", "checkout", lastWeekData);
        barChartData.add(thisWeekMap);
        barChartData.add(lastWeekMap);
        return Result.success(barChartData);
    }

}
