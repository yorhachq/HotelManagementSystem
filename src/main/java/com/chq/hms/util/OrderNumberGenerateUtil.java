package com.chq.hms.util;

import cn.hutool.core.util.RandomUtil;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class OrderNumberGenerateUtil {
    public static String generateOrderNumber() {
        // 获取当前日期,格式为yyyyMMdd
        String date = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));

        // 生成6位随机数字
        String randomNum = RandomUtil.randomNumbers(6);

        // 拼接日期和随机数字
        return date + randomNum;
    }
}
