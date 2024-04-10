package com.chq.hms.service.impl;

import com.chq.hms.mapper.DataStatisticsMapper;
import com.chq.hms.service.DataStatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DataStatisticsServiceImpl implements DataStatisticsService {
    @Autowired
    private DataStatisticsMapper dataStatisticsMapper;
    @Override
    public Map<String, Object> getTodayData() {
        return dataStatisticsMapper.getTodayData();
    }

    @Override
    public Map<String, Object> getYesterdayData() {
        return dataStatisticsMapper.getYesterdayData();
    }

    @Override
    public List<Map<String, Object>> getThisWeekData() {
        return dataStatisticsMapper.getThisWeekData();
    }

    @Override
    public List<Map<String, Object>> getLastWeekData() {
        return dataStatisticsMapper.getLastWeekData();
    }
}
