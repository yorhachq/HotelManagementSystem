package com.chq.hms.service;

import java.util.List;
import java.util.Map;

public interface DataStatisticsService {
    // 获取今日数据
    Map<String, Object> getTodayData();

    // 获取昨日数据
    Map<String, Object> getYesterdayData();
    // 获取本周数据
    List<Map<String, Object>> getThisWeekData();

    // 获取上周数据
    List<Map<String, Object>> getLastWeekData();

}
