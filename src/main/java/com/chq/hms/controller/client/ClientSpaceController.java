package com.chq.hms.controller.client;

import com.chq.hms.anno.OperationLog;
import com.chq.hms.domain.Result;
import com.chq.hms.domain.SysUser;
import com.chq.hms.service.SysUserService;
import com.chq.hms.util.ThreadLocalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/client")
public class ClientSpaceController {
    @Autowired
    private SysUserService userService;
    //获取用户详细信息
    @OperationLog("数据获取：个人信息")
    @GetMapping("/userInfo")
    public Result<SysUser> getUserInfo() {
        //根据用户名查询用户(从ThreadLocal中获取数据)
        Map<String, Object> map = ThreadLocalUtil.get();
        String username = (String) map.get("username");
        SysUser user = userService.findByUserName(username);
        return Result.success(user);
    }
}
