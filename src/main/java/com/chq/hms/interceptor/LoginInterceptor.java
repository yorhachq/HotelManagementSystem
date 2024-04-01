package com.chq.hms.interceptor;

import com.chq.hms.util.JwtUtil;
import com.chq.hms.util.ThreadLocalUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.util.Map;

@SuppressWarnings("all")
@Component
public class LoginInterceptor implements HandlerInterceptor {
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    /**
     * preHandle:请求到达接口前执行
     *
     * @return 通过boolean返回值决定是否放行-true:放行;false:不放行
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取来自浏览器请求头的token，进行令牌验证
        String token = request.getHeader("Authorization");
        //验证token
        try {
            //尝试从Redis中获取相同的token
            if (stringRedisTemplate.opsForValue().get(token) == null) {
                //如果token不存在,抛出运行异常
                throw new RuntimeException("认证失败：token不存在或已过期！");
            }
            Map<String, Object> claims = JwtUtil.parseToken(token);
            if (claims.get("refreshToken") != null && claims.get("refreshToken").equals(true)) {
                //不允许使用refreshToken进行业务请求
                throw new RuntimeException("认证失败：非法的refreshToken用途！");
            }
            //解析完成后把业务数据存储到ThreadLocal中
            ThreadLocalUtil.set(claims);
            return true;
        } catch (Exception e) {
            //设置http响应状态码为401 Unauthorized
            response.setStatus(401);
            System.out.println("LoninIntercpter:" + e.getMessage());
            return false;
        }
    }

    /**
     * afterCompletion:请求结束后执行
     * 在此及时清除ThreadLocal,防止内存泄漏
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        //清空ThreadLocal中的数据
        ThreadLocalUtil.remove();
    }
}
