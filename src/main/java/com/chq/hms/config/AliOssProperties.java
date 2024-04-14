package com.chq.hms.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "aliyun.oss")
public class AliOssProperties {
    private String endpoint;
    private String bucketName;
    private String objectPath;
}
