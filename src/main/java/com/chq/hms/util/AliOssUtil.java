package com.chq.hms.util;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.OSSException;
import com.aliyun.oss.common.auth.CredentialsProviderFactory;
import com.aliyun.oss.common.auth.EnvironmentVariableCredentialsProvider;
import com.aliyun.oss.model.PutObjectRequest;
import com.aliyun.oss.model.PutObjectResult;
import com.chq.hms.config.AliOssProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.InputStream;

/**
 * 上传文件流到阿里云OSS
 */
@Component
public class AliOssUtil {
    @SuppressWarnings("all")
    @Autowired
    private AliOssProperties aliOssProperties;

    public String uploadFile(String objectName, InputStream inputStream) throws Exception {
        // 配置信息校验
        validateConfig();

        //通过配置类获取配置信息
        String endpoint = aliOssProperties.getEndpoint();
        String bucketName = aliOssProperties.getBucketName();
        String objectPath = aliOssProperties.getObjectPath();

        // 校验objectName
        objectName = sanitizeObjectName(objectName);
        // 与参数拼接形成完整路径
        objectName = objectPath + objectName;

        // 从环境变量中获取访问凭证。请确保已设置环境变量OSS_ACCESS_KEY_ID和OSS_ACCESS_KEY_SECRET。
        final EnvironmentVariableCredentialsProvider credentialsProvider = CredentialsProviderFactory.newEnvironmentVariableCredentialsProvider();

        // 创建OSSClient实例
        OSS ossClient = new OSSClientBuilder().build(endpoint, credentialsProvider);
        String url = "";
        try {
            // 创建PutObjectRequest对象
            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, objectName, inputStream);
            // 创建PutObject请求
            PutObjectResult result = ossClient.putObject(putObjectRequest);
            // 文件访问路径url
            url = endpoint.split("//")[0] + "//" + bucketName + "." + endpoint.split("//")[1] + "/" + objectName;
        } catch (OSSException oe) {
            System.out.println("Caught an OSSException, which means your request made it to OSS, "
                    + "but was rejected with an error response for some reason.");
            System.out.println("Error Message:" + oe.getErrorMessage());
            System.out.println("Error Code:" + oe.getErrorCode());
            System.out.println("Request ID:" + oe.getRequestId());
            System.out.println("Host ID:" + oe.getHostId());
        } catch (ClientException ce) {
            System.out.println("Caught an ClientException, which means the client encountered "
                    + "a serious internal problem while trying to communicate with OSS, "
                    + "such as not being able to access the network.");
            System.out.println("Error Message:" + ce.getMessage());
        } finally {
            if (ossClient != null) {
                ossClient.shutdown();
            }
        }
        return url;
    }

    private void validateConfig() {
        if (aliOssProperties == null || aliOssProperties.getEndpoint().isEmpty() || aliOssProperties.getBucketName().isEmpty() || aliOssProperties.getObjectPath().isEmpty()) {
            throw new IllegalStateException("OSS configuration is not properly set.");
        }
    }

    private String sanitizeObjectName(String objectName) {
        // 移除可能导致路径遍历或解析问题的字符(\、/、2个及以上连续的.)
        return objectName.replaceAll("\\\\", "_").replaceAll("/", "_").replaceAll("\\.{2,}", "");
    }

}
