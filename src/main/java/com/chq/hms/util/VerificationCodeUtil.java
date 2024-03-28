package com.chq.hms.util;

import cn.hutool.core.util.RandomUtil;

/**
 * 验证码工具类
 */
public class VerificationCodeUtil {
    // 生成随机的字符串验证码
    public static String getTextCode()
    {
        return RandomUtil.randomString(6);
    }
}
