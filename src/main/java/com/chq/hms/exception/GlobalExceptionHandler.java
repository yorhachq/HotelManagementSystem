package com.chq.hms.exception;

import cn.hutool.log.Log;
import cn.hutool.log.LogFactory;
import com.chq.hms.domain.Result;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

/**
 * 全局异常类
 * 注意：
 * 全局异常处理应该是最后的防线，用于捕获未被处理的异常。
 * 在应用程序的各个层次中，尽量在局部进行异常处理，以确保能够在发生异常时立即采取适当的措施。
 */
@SuppressWarnings("rawtypes")
@RestControllerAdvice //该注解表示开启了全局异常的捕获
public class GlobalExceptionHandler {
    private static final Log log = LogFactory.get();
//    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @Value("${spring.servlet.multipart.max-file-size}")
    private String fileSize;
    @Value("${spring.servlet.multipart.max-request-size}")
    private String requestSize;

    //@ControllerAdvice+@ExceptionHandler注解确保捕获和处理Controller层的异常
    @ExceptionHandler(Exception.class)
    public Result handleException(Exception e) {
        log.error("全局异常捕获: 执行操作时发生错误", e);
        return Result.error(StringUtils.hasLength(e.getMessage()) ? e.getMessage() : "GlobalExceptionHandler: 操作失败");
    }

    //捕获MaxUploadSizeExceededException异常
    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public Result handleMaxUploadSizeExceededException(
            MaxUploadSizeExceededException ex) {
        log.warn("全局异常捕获: 文件上传大小超过限制", ex);
        return Result.error(String.format("上传文件大小超过限制(单个文件最大:%s;单次请求最大:%s)", fileSize, requestSize));
    }
}
