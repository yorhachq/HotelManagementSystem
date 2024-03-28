package com.chq.hms;

import cn.hutool.core.io.FileUtil;
import cn.hutool.extra.mail.MailUtil;
import com.chq.hms.util.EmailUtil;
import org.junit.jupiter.api.Test;

/**
 * HuTool邮件工具-MailUtil
 * 参数说明:
 * tos: 对方的邮箱地址，可以是单个，也可以是多个（Collection表示）
 * subject：标题
 * content：邮件正文，可以是文本，也可以是HTML内容
 * isHtml： 是否为HTML，如果是，那参数3识别为HTML内容
 * files： 可选：附件，可以为多个或没有，将File对象加在最后一个可变参数中即可
 */
public class MailUtilTests {
    String email = "yorha_chq@foxmail.com";

    @Test
    public void commonText() {
        //发送普通文本邮件，最后一个参数可选是否添加多个附件
        MailUtil.send(email, "普通文本邮件测试", "邮件来自Hutool测试", false);
    }

    @Test
    public void htmlText() {
        //发送HTML邮件，最后一个参数可选是否添加多个附件
        MailUtil.send(email, "HTML格式邮件测试", "<html><body><h1>Hello Hutool</h1></body></html>", true);
    }

    @Test
    public void sendAttachment() {
        //发送带附件的邮件，最后一个参数可选是否添加多个附件
        MailUtil.send(email, "HTML格式带附件的邮件测试", "<html><body><h1>Hello Hutool</h1><br/><strong>With Files</strong></body></html>", true, FileUtil.file("C:\\Users\\CHQ\\图片\\屏幕快照\\屏幕截图 2024-02-11 212811.png"));
    }

    // 自己封装的邮件验证码发送工具
    @Test
    public void sendVerifyEmail() {
        String code = EmailUtil.sendVerifyEmail(email, "您正在进行重置密码操作");
        System.out.println(code);
    }
}
