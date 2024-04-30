package com.chq.hms.aspect;

import cn.hutool.log.StaticLog;
import com.chq.hms.anno.OperationLog;
import com.chq.hms.domain.SysLog;
import com.chq.hms.service.SysLogService;
import com.chq.hms.service.SysUserService;
import com.chq.hms.util.IpAddrUtil;
import com.chq.hms.util.JwtUtil;
import com.chq.hms.util.ThreadLocalUtil;
import jakarta.servlet.http.HttpServletRequest;
import lombok.SneakyThrows;
import net.dreamlu.mica.ip2region.core.Ip2regionSearcher;
import net.dreamlu.mica.ip2region.core.IpInfo;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.lang.reflect.Method;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.Objects;

/**
 * 操作日志切面
 */
@Aspect
@Component
public class LogAspect {
    @SuppressWarnings("all")
    @Autowired
    private SysLogService sysLogService;
    @SuppressWarnings("all")
    @Autowired
    private SysUserService sysUserService;
    @SuppressWarnings("all")
    @Autowired
    private Ip2regionSearcher ip2regionSearcher;

    /**
     * 定义切点
     */
    @Pointcut("@annotation(com.chq.hms.anno.OperationLog)")
    public void logPointCut() {
    }

    /**
     * 处理完请求后执行
     *
     * @param joinPoint 切点
     */
    @AfterReturning(pointcut = "logPointCut()", returning = "jsonResult")
    public void doAfterReturning(JoinPoint joinPoint, Object jsonResult) {
        OperationLog operationLog = getAnnotationLog(joinPoint);
        if (operationLog == null) {
            return;
        }
        // 特殊处理登录和登出操作
        if (isLoginOrLogoutMethod(joinPoint)) {
            handleLoginLogoutLog(joinPoint, operationLog);
        } else {
            handleGeneralLog(joinPoint, jsonResult);
        }
    }

    // 判断是否为登录或登出操作
    private boolean isLoginOrLogoutMethod(JoinPoint joinPoint) {
        String methodName = joinPoint.getSignature().getName();
        return methodName.equals("login") || methodName.equals("logout");
    }

    @SneakyThrows
    private void handleLoginLogoutLog(JoinPoint joinPoint, OperationLog operationLog) {
        HttpServletRequest request = ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
        // 获取IP及归属地
        String ip = IpAddrUtil.getIpAddr(request);
        IpInfo ipInfo = ip2regionSearcher.memorySearch(ip);
        String address = ipInfo != null ? ipInfo.getAddress() : null;
        // 直接从方法参数获取用户信息
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        String simpleMethodName;
        if (className.contains(".client")) {
            simpleMethodName = className.split("com.chq.hms.controller.client.")[1] + "." + methodName + "()";
        } else {
            simpleMethodName = className.split("com.chq.hms.controller.")[1] + "." + methodName + "()";
        }
        SysLog sysLog = new SysLog();
        sysLog.setAction(operationLog.value());
        sysLog.setIp(ip);
        sysLog.setAddress(address);
        sysLog.setRemark(simpleMethodName);
        sysLog.setCreateTime(LocalDateTime.now());

        // 对于登录，可以尝试从返回的结果中获取用户
        if ("login".equals(methodName)) {
            String userName = joinPoint.getArgs()[0].toString();
            Integer userId = sysUserService.findByUserName(userName).getUserId();
            if (userId != null) {
                sysLog.setUserId(userId);
            }
        }

        sysLogService.save(sysLog);
    }

    protected void handleGeneralLog(final JoinPoint joinPoint, @SuppressWarnings("unused") Object jsonResult) {
        try {
            // 获得注解
            OperationLog controllerLog = getAnnotationLog(joinPoint);
            if (controllerLog == null) {
                return;
            }

            // 获取当前的用户
            HttpServletRequest request = ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
            String token = request.getHeader("Authorization");
            Integer userId;
            if (token != null) {
                token = token.replace("Bearer ", "");
                Map<String, Object> claims = JwtUtil.parseToken(token);
                userId = (Integer) claims.get("id");
            } else {
                Map<String, Object> claims = ThreadLocalUtil.get();
                userId = (Integer) claims.get("id");
            }

            // 获取IP及归属地
            String ip = IpAddrUtil.getIpAddr(request);
            IpInfo ipInfo = ip2regionSearcher.memorySearch(ip);
            String address = ipInfo != null ? ipInfo.getAddress() : null;

            // 设置方法名称
            String className = joinPoint.getTarget().getClass().getName();
            String methodName = joinPoint.getSignature().getName();
            String simpleMethodName;
            if (className.contains(".client")) {
                simpleMethodName = className.split("com.chq.hms.controller.client.")[1] + "." + methodName + "()";
            } else {
                simpleMethodName = className.split("com.chq.hms.controller.")[1] + "." + methodName + "()";
            }
            SysLog sysLog = new SysLog();
            sysLog.setUserId(userId);
            sysLog.setAction(controllerLog.value());
            sysLog.setIp(ip);
            sysLog.setAddress(address);
            sysLog.setRemark(simpleMethodName);
            sysLog.setCreateTime(LocalDateTime.now());

            // 保存数据库
            sysLogService.save(sysLog);
        } catch (Exception exp) {
            // 记录本地异常日志
            StaticLog.error(exp);
        }
    }

    /**
     * 是否存在注解，如果存在就获取
     */
    private OperationLog getAnnotationLog(JoinPoint joinPoint) {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();

        if (method != null) {
            return method.getAnnotation(OperationLog.class);
        }
        return null;
    }
}
