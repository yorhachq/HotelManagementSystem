package com.chq.hms.mapper;

import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface DataStatisticsMapper {
    // 获取今日数据
    @Select("SELECT * FROM `data_statistics` WHERE date = CURDATE() LIMIT 1;")
    Map<String, Object> getTodayData();

    // 获取本周数据(自然周)
    @MapKey("id")
    List<Map<String, Object>> getThisWeekData();

    // 获取上周数据(自然周)
    @MapKey("id")
    List<Map<String, Object>> getLastWeekData();
}
