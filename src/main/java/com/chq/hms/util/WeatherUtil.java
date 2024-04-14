package com.chq.hms.util;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONUtil;
import cn.hutool.log.StaticLog;
import com.chq.hms.config.QWeatherProperties;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * 天气信息工具类(和风天气)
 */
@Component
public class WeatherUtil {
    private static String KEY;
    private static String GEO_API;
    private static String DEV_API;

    @SuppressWarnings("all")
    @Autowired
    private QWeatherProperties properties;

    // 被 @PostConstruct 注解标记的方法会在依赖注入完成后、对象实例化后、且在任何 @Autowired 注解的方法之前被调用
    @PostConstruct
    public void init() {
        QWeatherProperties qWeatherProperties = properties;
        KEY = qWeatherProperties.getApiKey();
        GEO_API = qWeatherProperties.getGeoApi();
        DEV_API = qWeatherProperties.getDevApi();
    }

    /**
     * 城市搜索
     *
     * @param location 城市名称
     * @return locationId
     */
    public static String cityLookup(String location) {
        String url = StrUtil.format("{}v2/city/lookup?key={}&location={}", GEO_API, KEY, location);
        StaticLog.info("城市搜索API: {}", url);
        return HttpUtil.get(url);
    }

    /**
     * 实时天气
     *
     * @param locationId 城市ID
     * @return JSON String
     */
    public static String realtimeWeather(String locationId) {
        String url = StrUtil.format("{}v7/weather/now?key={}&location={}", DEV_API, KEY, locationId);
        StaticLog.info("实时天气API: {}", url);
        return HttpUtil.get(url);
    }

    /**
     * 天气指数
     *
     * @param locationId 城市ID
     * @return JSON String
     */
    public static String weatherIndices(String locationId) {
        String url = StrUtil.format("{}v7/indices/1d?key={}&location={}&type=0", DEV_API, KEY, locationId);
        StaticLog.info("天气指数API: {}", url);
        return HttpUtil.get(url);
    }

    /**
     * 实时空气质量
     *
     * @param locationId 城市ID
     * @return JSON String
     */
    public static String airNow(String locationId) {
        String url = StrUtil.format("{}v7/air/now?key={}&location={}", DEV_API, KEY, locationId);
        StaticLog.info("实时空气质量API: {}", url);
        return HttpUtil.get(url);
    }

    /**
     * 封装前端需要展示的主要天气信息
     *
     * @param location 城市名称
     * @return Map
     */
    public static Map<String, String> weatherInfo(String location) {
        // 获取城市ID
        String locationId = getLocationId(location);
        // 获取实时天气
        Map<String, Object> realtimeWeather = JSONUtil.parseObj(realtimeWeather(locationId));
        // 获取实时空气质量
        Map<String, Object> airQuality = JSONUtil.parseObj(airNow(locationId));
        if (realtimeWeather.get("code").equals("200") && airQuality.get("code").equals("200")) {
            Map<String, Object> weatherNow = Convert.toMap(String.class, Object.class, realtimeWeather.get("now"));
            Map<String, Object> airNow = Convert.toMap(String.class, Object.class, airQuality.get("now"));
            // 摘取主要天气信息
            return Map.of(
                    "location", location,
                    "temperature", weatherNow.get("temp").toString(), // 当前温度
                    "feelsLike", weatherNow.get("feelsLike").toString(), // 体感温度
                    "weather", weatherNow.get("text").toString(), // 天气状况
                    "air", airNow.get("category").toString(), // 空气质量
                    "windDirection", weatherNow.get("windDir").toString(), // 风向
                    "icon", weatherNow.get("icon").toString() // 天气图标
            );
        } else {
            StaticLog.error("天气接口出错！");
        }
        return null;
    }

    private static String getLocationId(String location) {
        // 获取LocationId
        Map<String, Object> result = JSONUtil.parseObj(cityLookup(location));
        Map<String, Object> cityInfo = Convert.toMap(String.class, Object.class, Convert.toList(result.get("location")).get(0));
        return cityInfo.get("id").toString();
    }
}
