package com.chq.hms.controller;

import cn.hutool.core.convert.Convert;
import com.chq.hms.domain.Result;
import com.chq.hms.domain.vo.DataStatistics;
import com.chq.hms.service.DataStatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/dataStatistics")
public class DataStatisticsController {
    @Autowired
    private DataStatisticsService dataStatisticsService;

    private static Map<String, Object> allData;

    private void loadAllData() {
        Map<String, Object> todayData = dataStatisticsService.getTodayData();
        List<Map<String, Object>> thisWeekData = dataStatisticsService.getThisWeekData();
        List<Map<String, Object>> lastWeekData = dataStatisticsService.getLastWeekData();
        allData = Map.of("todayData", todayData, "thisWeekData", thisWeekData, "lastWeekData", lastWeekData);
    }

    // 一周数据，遍历thisWeekData列表，逐项转换为Map
    private void convertWeekData(List<Map<String, Object>> weekData, String key) {
        Convert.toList(Map.class, allData.get(key)).forEach(map -> weekData.add(Convert.toMap(String.class, Object.class, map)));
    }

    // 获取今日模块数据(需求人数、提问数量、解决数量、用户满意度)
    @GetMapping("/todayData")
    public Result<List<Map<String, Object>>> getTodayCheckin() {
        List<Map<String, Object>> chartData = new ArrayList<>();
        // 从数据库加载数据
        loadAllData();
        List<Map<String, Object>> thisWeekData = new ArrayList<>();
        convertWeekData(thisWeekData, "thisWeekData");

        // 当日数据
        Map<String, Object> todayData = Convert.toMap(String.class, Object.class, allData.get("todayData"));
        // 今日入住人数模块数据
        Map<String, Object> todayCheckin = DataStatistics.getTodayData("checkin", todayData, thisWeekData);
        chartData.add(todayCheckin);
        // 今日退房人数模块数据
        Map<String, Object> todayCheckout = DataStatistics.getTodayData("checkout", todayData, thisWeekData);
        chartData.add(todayCheckout);
        // 今日订单笔数模块数据
        Map<String, Object> todayOrder = DataStatistics.getTodayData("order", todayData, thisWeekData);
        chartData.add(todayOrder);
        // 今日营业额模块数据
        Map<String, Object> todayRevenue = DataStatistics.getTodayData("revenue", todayData, thisWeekData);
        chartData.add(todayRevenue);

        return Result.success(chartData);
    }

    // 获取分析概览柱形图数据(本周/上周 七日 入住/退房量)
    @GetMapping("/weekData")
    public Result<List<Map<String, List<Integer>>>> getWeekData() {
        List<Map<String, List<Integer>>> barChartData = new ArrayList<>();
        // 从数据库加载数据
        loadAllData();
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
