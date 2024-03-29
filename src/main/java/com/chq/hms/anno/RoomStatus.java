package com.chq.hms.anno;

import com.chq.hms.validation.RoomStatusValidation;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.*;

/**
 * 自定义校验注解
 */
@Documented //元注解
//元注解，标识本注解能用在哪些地方上(此处FIELD标识用在字段上)
@Target({ElementType.FIELD})
//元注解，标识本注解保留到哪个阶段
@Retention(RetentionPolicy.RUNTIME)
//指定提供校验规则的类
@Constraint(validatedBy = {RoomStatusValidation.class})
public @interface RoomStatus {
    //提供校验失败后的提示信息
    String message() default "RoomStatus: status参数的值只能是“空闲”|“已预订”|“已入住”|“冻结”";

    //指定分组
    Class<?>[] groups() default {};

    //负载，获取到State注解的附加信息
    Class<? extends Payload>[] payload() default {};
}
