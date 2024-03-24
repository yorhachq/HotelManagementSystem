package com.chq.hms.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 统一响应结果
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Result<T> {
    private Integer code; //业务状态码  0-成功  1-失败
    private String msg; //提示信息
    private T data; //响应数据

    //返回操作成功响应结果(带响应数据)
    public static <E> Result<E> success(E data) {
        return new Result<>(0, "操作成功", data);
    }

    //返回操作成功响应结果(无响应数据)
    public static <E> Result<E> success() {
        return new Result<>(0, "操作成功", null);
    }

    //返回操作失败响应结果
    public static <E> Result<E> error(String message) {
        return new Result<>(1, message, null);
    }
}
