package com.chq.hms.controller;

import com.chq.hms.anno.OperationLog;
import com.chq.hms.domain.Result;
import com.chq.hms.util.IpAddrUtil;
import jakarta.servlet.http.HttpServletRequest;
import net.dreamlu.mica.ip2region.core.Ip2regionSearcher;
import net.dreamlu.mica.ip2region.core.IpInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/ip")
public class IpController {
    @SuppressWarnings("all")
    @Autowired
    private Ip2regionSearcher ip2regionSearcher;

    // 获取客户端IP地址
    @OperationLog("系统功能：获取请求来源IP地址")
    @GetMapping("/addr")
    public Result<String> getIp(HttpServletRequest request) {
        String clientIP = IpAddrUtil.getIpAddr(request);
        return Result.success(clientIP);
    }

    // 获取客户端IP地址的归属地
    @OperationLog("系统功能：获取请求来源IP归属地")
    @GetMapping("/region")
    public Result<IpInfo> getIpRegion(HttpServletRequest request) {
        IpInfo ipInfo = ip2regionSearcher.memorySearch(getIp(request).getData());
        return Result.success(ipInfo);
    }
}
