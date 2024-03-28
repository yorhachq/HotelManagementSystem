package com.chq.hms.util;

import cn.hutool.core.io.resource.ResourceUtil;
import cn.hutool.extra.mail.MailUtil;

public class EmailUtil {
    // 发送验证码邮件并返回验证码
    public static String sendVerifyEmail(String email, String emailTitle) {
        // 读取HTML模板文件
        String emailContent = ResourceUtil.readUtf8Str("static/VerificationEmail.html");

        // 生成验证码
        String verificationCode = VerificationCodeUtil.getTextCode();

        // 通过自定义的标识符将验证码替换到HTML模板中
        emailContent = emailContent.replace("${verificationCode}", verificationCode);

        // 发送邮件
        MailUtil.send(email, emailTitle, emailContent, true);

        return verificationCode;
    }
}
