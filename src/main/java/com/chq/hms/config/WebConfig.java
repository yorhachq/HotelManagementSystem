package com.chq.hms.config;

import com.chq.hms.interceptor.LoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 配置类
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Autowired
    private LoginInterceptor loginInterceptor;

    //注册拦截器使其生效，这样每次请求都需要在请求头携带有效token才能通过
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //添加拦截器
        registry.addInterceptor(loginInterceptor)
                //拦截白名单
                .excludePathPatterns(
                        "/sysUser/login",
                        "/sysUser/register",
                        "/sysUser/sendVerifyEmail",
                        "/sysUser/resetPwd",
                        "/sysUser/logout",
                        "/get-async-routes"
                );

    }
}
