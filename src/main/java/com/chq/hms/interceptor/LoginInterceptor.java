package com.chq.hms.interceptor;

import cn.hutool.json.JSONUtil;
import cn.hutool.log.StaticLog;
import com.chq.hms.domain.Result;
import com.chq.hms.util.JwtUtil;
import com.chq.hms.util.ThreadLocalUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.util.Map;

/**
 * 登录拦截器
 */
@SuppressWarnings("all")
@Component
public class LoginInterceptor implements HandlerInterceptor {
    @Autowired
    private StringRedisTemplate stringRedisTemplate;
    private static final String FLAG = "Redirect:";

    @Value("${env.frontend.ui-url}")
    private String GUEST_REDIRECTING_URL;

    /**
     * preHandle:请求到达接口前执行
     *
     * @return 通过boolean返回值决定是否放行-true:放行;false:不放行
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取来自浏览器请求头的token，进行令牌验证
        String token = request.getHeader("Authorization");
        // 前端指定了token标准前缀，进行对应处理
        if (token != null) {
            token = token.replace("Bearer ", "");
        }

        //验证token
        try {
            //尝试从Redis中获取相同的token
            if (stringRedisTemplate.opsForValue().get(token) == null) {
                //如果token不存在,抛出运行异常
                throw new RuntimeException("认证失败: token不存在或已过期！");
            }
            Map<String, Object> claims = JwtUtil.parseToken(token);
            if (claims.get("refreshToken") != null && claims.get("refreshToken").equals(true)) {
                //不允许使用refreshToken进行业务请求
                throw new RuntimeException("认证失败: 非法的refreshToken用途！");
            }

            // 解析当前请求用户的 role 信息
            String role = claims.get("role").toString();
            // 对于 guest 角色，返回带有重定向标志的拦截结果
            if ("guest".equals(role)) {
                // 创建带有重定向标志的错误结果
                Result redirectResult = Result.error(FLAG + GUEST_REDIRECTING_URL);
                // 将错误结果序列化为JSON字符串
                String jsonRedirectResult = JSONUtil.parseObj(redirectResult).toString();
                // 设置响应内容类型为application/json
                response.setContentType("application/json;charset=UTF-8");
                // 输出错误结果到响应体
                response.getWriter().write(jsonRedirectResult);
                StaticLog.info("[304]Redirecting: {}", GUEST_REDIRECTING_URL);
                return false;
            }

            //解析完成后把业务数据存储到ThreadLocal中
            ThreadLocalUtil.set(claims);
            response.setStatus(HttpServletResponse.SC_OK);
            return true;
        } catch (Exception e) {
            //设置http响应状态码为401 Unauthorized
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            StaticLog.warn("[401]{}", e.getMessage());
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
