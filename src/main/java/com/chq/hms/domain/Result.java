package com.chq.hms.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 适配Pure Admin的响应结果
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Result<T> {
    private Boolean success;
    private String message;
    private T data;

    //返回操作成功响应结果(带响应数据)
    public static <E> Result<E> success(E data) {
        return new Result<>(true, "操作成功", data);
    }

    //返回操作成功响应结果(无响应数据)
    public static <E> Result<E> success() {
        return new Result<>(true, "操作成功", null);
    }

    //返回操作失败响应结果
    public static <E> Result<E> error(String message) {
        return new Result<>(false, message, null);
    }
}
