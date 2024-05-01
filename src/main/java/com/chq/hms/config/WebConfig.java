package com.chq.hms.config;

import com.chq.hms.interceptor.AdminLoginInterceptor;
import com.chq.hms.interceptor.GuestLoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Web配置类
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Autowired
    private AdminLoginInterceptor adminLoginInterceptor;
    @Autowired
    private GuestLoginInterceptor guestLoginInterceptor;

    // m注册拦截器使其生效，这样每次请求都需要在请求头携带有效token才能通过
    // 注意拦截器在处理请求时通常是按照注册顺序依次执行的，一旦某个拦截器拦截并终止了请求的处理流程，后续的拦截器就不会再介入处理这个请求了
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //添加拦截器
        registry.addInterceptor(adminLoginInterceptor)
                //拦截白名单
                .excludePathPatterns(
                        "/sysUser/login",
                        "/sysUser/register",
                        "/sysUser/sendVerifyEmail",
                        "/sysUser/resetPwd",
                        "/sysUser/logout",
                        "/hotelMember/login",
                        "/hotelMember/register",
                        "/get-async-routes",
                        //下面的是放行给GuestLoginInterceptor处理的白名单
                        "/hotelMember/recharge",
                        "/hotelMember/update",
                        "/hotelMember/delete/*",
                        "/hotelMember/getmembers",
                        "/hotelMember/registerMember",
                        "/hotelMember/sendVerifyEmail",
                        "/client/*",
                        "/client/memberInfo/*",
                        "/client/cancel/*"
                );

        registry.addInterceptor(guestLoginInterceptor)
                //拦截白名单
                .excludePathPatterns(
                        "/hotelMember/registerMember",
                        "/hotelMember/sendVerifyEmail",
                        //下面对AdminLoginInterceptor放行的白名单同样进行放行
                        "/sysUser/login",
                        "/sysUser/register",
                        "/sysUser/sendVerifyEmail",
                        "/sysUser/resetPwd",
                        "/sysUser/logout",
                        "/hotelMember/login",
                        "/hotelMember/register",
                        "/get-async-routes"
                );
    }
}
