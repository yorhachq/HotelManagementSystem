package com.chq.hms.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
@ConfigurationProperties(prefix = "env.qweather")
public class QWeatherProperties {
    private String geoApi;
    private String devApi;
    private String apiKey;
}
