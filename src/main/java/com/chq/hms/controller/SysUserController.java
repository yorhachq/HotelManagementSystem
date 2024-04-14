package com.chq.hms.controller;

import com.chq.hms.domain.Result;
import com.chq.hms.domain.SysRole;
import com.chq.hms.domain.SysUser;
import com.chq.hms.service.SysUserService;
import com.chq.hms.util.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import net.dreamlu.mica.ip2region.core.Ip2regionSearcher;
import net.dreamlu.mica.ip2region.core.IpInfo;
import org.hibernate.validator.constraints.URL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import static com.chq.hms.util.WeatherUtil.weatherInfo;

@RestController
@RequestMapping("/sysUser")
@Validated //SpringValidation结合形参上的@Pattern注解进行参数校验
@SuppressWarnings("rawtypes")
public class SysUserController {
    @SuppressWarnings("all")
    @Autowired
    private SysUserService userService;
    @SuppressWarnings("all")
    @Autowired
    private StringRedisTemplate stringRedisTemplate;
    @SuppressWarnings("all")
    @Autowired
    private Ip2regionSearcher ip2regionSearcher;
    private static String verifyCode = "";

    //用户注册
    @PostMapping("/register")
    public Result register(@Pattern(regexp = "^\\S{1,16}$") String username, @Pattern(regexp = "^\\S{1,16}$") String password) {
        //查询用户名是否占用
        SysUser user = userService.findByUserName(username);
        if (user == null) {
            //未占用，注册
            userService.register(username, password);
            return Result.success();
        } else {
            //已占用
            return Result.error("用户名已被占用，换一个试试吧");
        }
    }

    //用户登录
    @PostMapping("/login")
    //后端这里参数校验，不符合正则的话会抛异常，用户友好的提示设计在前端触发，此处为了前后端双重校验
    public Result login(@Pattern(regexp = "^\\S{1,16}$") String username, @Pattern(regexp = "^\\S{1,16}$") String password) {
        SysUser loginUser = userService.findByUserName(username);
        if (loginUser == null) {
            //用户不存在
            return Result.error("不存在用户名为" + username + "的用户!");
        } else if (!loginUser.getStatus().equals("正常")) {
            return Result.error("账户状态异常，拒绝操作!");
        }
        if (Md5Util.checkPassword(password, loginUser.getPassword())) {
            //登录成功，使用用户信息生成token
            Map<String, Object> claims = new HashMap<>();
            claims.put("id", loginUser.getUserId());
            claims.put("username", loginUser.getUsername());
            //角色代码也存一份在token里，方便后续处理
            SysRole userRole = userService.findRoleById(loginUser.getRoleId());
            claims.put("role", userRole.getRoleCode());
            // 访问用token
            String accessToken = JwtUtil.genToken(claims, 12);
            // 刷新用token，添加自定义的claim来标识其用途
            claims.put("refreshToken", true);
            String refreshToken = JwtUtil.genToken(claims, 24);
            //把token存储到Redis中
            ValueOperations<String, String> valueOps = stringRedisTemplate.opsForValue();
            valueOps.set(accessToken, accessToken, 12, TimeUnit.HOURS); //登录有效期12小时,与JWT token有效期一致
            valueOps.set(refreshToken, refreshToken, 24, TimeUnit.HOURS); //用于前端刷新accessToken，有效期更长
            // 返回给给前端 token 过期的时间戳(12小时后)
            long expires = System.currentTimeMillis() + 12 * 60 * 60 * 1000;
            // 获取用户角色ID,并通过ID获取角色代码
            SysRole sysRole = userService.findRoleById(loginUser.getRoleId());
            String[] roles = {sysRole.getRoleCode()};
            // 封装登录需要的返回数据
            Map<String, Object> data = new LinkedHashMap<>();
            data.put("username", username);
            data.put("roles", roles);
            data.put("accessToken", accessToken);
            data.put("refreshToken", refreshToken);
            data.put("expires", expires);
            return Result.success(data);
        }
        return Result.error("密码错误!");
    }

    //获取用户详细信息
    @GetMapping("/userInfo")
    public Result<SysUser> userInfo() {
        //根据用户名查询用户(从ThreadLocal中获取数据)
        Map<String, Object> map = ThreadLocalUtil.get();
        String username = (String) map.get("username");
        SysUser user = userService.findByUserName(username);
        return Result.success(user);
    }

    //更新用户信息
    @PutMapping("/update")
    public Result update(@RequestBody @Validated SysUser user) {
        //校验浏览器请求中的用户id是否与当前用户ThreadLocal中的id一致
        if (user.getUserId().equals(((Map) ThreadLocalUtil.get()).get("id"))) {
            userService.update(user);
            return Result.success();
        }
        return Result.error("目标用户与当前已登录用户不一致!");
    }

    /**
     * 更新用户头像
     *
     * @param avatarUrl @URL对参数进行校验，确保是一个合法的URL地址
     */
    @PatchMapping("/updateAvatar")
    public Result updateAvatar(@RequestParam @URL @NotEmpty String avatarUrl) {
        userService.updateAvatar(avatarUrl);
        return Result.success();
    }

    //更新用户密码(已知密码)
    @PatchMapping("/updatePwd")
    public Result updatePwd(@RequestBody Map<String, String> params, @RequestHeader("Authorization") String token) {
        //参数校验
        String oldPwd = params.get("old_pwd");
        String newPwd = params.get("new_pwd");
        String rePwd = params.get("re_pwd");
        if (!(StringUtils.hasLength(oldPwd) && StringUtils.hasLength(newPwd) && StringUtils.hasLength(rePwd))) {
            return Result.error("确少必要的参数!");
        }
        Map<String, Object> map = ThreadLocalUtil.get();
        String username = (String) map.get("username");
        SysUser user = userService.findByUserName(username);
        if (!Md5Util.checkPassword(oldPwd, user.getPassword())) {
            return Result.error("原密码错误!");
        }
        if (!newPwd.matches("^\\S{5,16}$")) {
            return Result.error("密码长度应为5~16位!");
        }
        if (oldPwd.equals(newPwd)) {
            return Result.error("新密码不能与原密码相同!");
        }
        if (!rePwd.equals(newPwd)) {
            return Result.error("确认密码与新密码不一致!");
        }
        //完成密码更新
        userService.updatePwd(newPwd);
        //删除Redis中对应的token
        ValueOperations<String, String> valueOps = stringRedisTemplate.opsForValue();
        valueOps.getOperations().delete(token);
        return Result.success();
    }

    // 发送邮箱验证码
    @PostMapping("/sendVerifyEmail")
    public Result sendVerifyEmail(@RequestBody Map<String, String> params) {
        //参数校验
        String email = params.get("email");
        if (!EmailUtil.checkEmailFormat(email)) {
            return Result.error("请填写有效邮箱!");
        }
        //发送验证码
        verifyCode = EmailUtil.sendVerifyEmail(email, "您正在进行重置密码操作");
        return Result.success();
    }

    // 忘记密码重置(已绑邮箱，忘记密码)
    @PostMapping("/resetPwd")
    public Result resetPwd(@RequestBody Map<String, String> params) {
        //参数校验
        String username = params.get("username");
        String email = params.get("email");
        String code = params.get("verifyCode");
        String password = params.get("password");
        if (!(StringUtils.hasLength(username) && StringUtils.hasLength(email) && StringUtils.hasLength(code) && StringUtils.hasLength(password))) {
            return Result.error("确少必要的参数!");
        }
        if (!password.matches("^\\S{5,16}$")) {
            return Result.error("密码长度应为5~16位!");
        }
        if (!verifyCode.equals(code)) {
            return Result.error("验证码错误!");
        }
        SysUser user = userService.findByUserName(username);
        if (user == null) {
            return Result.error("用户不存在!");
        } else if (!user.getStatus().equals("正常")) {
            return Result.error("账户状态异常，拒绝操作!");
        } else if (user.getEmail() == null || user.getEmail().isEmpty()) {
            return Result.error("用户未绑定邮箱，无法重置密码，请联系超管处理!");
        } else if (!user.getEmail().equals(email)) {
            return Result.error("邮箱与用户绑定邮箱不一致!");
        }
        try {
            userService.updatePwd(user.getUserId(), password);
            // 若成功，使本次验证码失效
            verifyCode = "";
            return Result.success();
        } catch (Exception e) {
            return Result.error("重置密码失败!" + e.getMessage());
        }
    }

    // 刷新token(只有已登录情况下才接受请求,accessToken到期时,会从前端传入带有refreshToken的请求)
    @PostMapping("/refresh-token")
    public Result updateToken(@RequestHeader("Authorization") String accessToken, @RequestParam(value = "refreshToken") String refreshToken) {
        // 从refreshToken中获取用户基本信息
        Map<String, Object> claims = JwtUtil.parseToken(refreshToken);
        // 从Redis中主动销毁旧的Token
        stringRedisTemplate.opsForValue().getOperations().delete(accessToken);
        stringRedisTemplate.opsForValue().getOperations().delete(refreshToken);
        // 重新生成刷新用Token
        refreshToken = JwtUtil.genToken(claims, 24);
        // 重新生成访问用Token
        claims.put("refreshToken", false);
        accessToken = JwtUtil.genToken(claims, 12);
        // 存储新的refreshToken和accessToken到Redis
        ValueOperations<String, String> valueOps = stringRedisTemplate.opsForValue();
        valueOps.set(accessToken, accessToken, 12, TimeUnit.HOURS);
        valueOps.set(refreshToken, refreshToken, 24, TimeUnit.HOURS);
        // 生成过期时间戳
        long expires = System.currentTimeMillis() + 12 * 60 * 60 * 1000;
        // 封装返回数据
        Map<String, Object> data = new LinkedHashMap<>();
        data.put("accessToken", accessToken);
        data.put("refreshToken", refreshToken);
        data.put("expires", expires);
        return Result.success(data);
    }

    // 加载天气信息
    @GetMapping("/weather")
    public Result getWeather(HttpServletRequest request) {
        IpInfo ipInfo = ip2regionSearcher.memorySearch(IpAddrUtil.getIpAddr(request));
        if (ipInfo == null) return Result.error("IP获取失败!");
        Map<String, String> weatherInfo;
        // 使用了JSONUtil.parse(),将JSON字符串直接解析为JSON对象,避免在将JSON字符串作为数据传输时进行不必要的转义
        if (ipInfo.getRegion() != null) {
            weatherInfo = weatherInfo(ipInfo.getRegion());
        } else if (ipInfo.getCity() != null) {
            weatherInfo = weatherInfo(ipInfo.getCity());
        } else if (ipInfo.getProvince() != null) {
            weatherInfo = weatherInfo(ipInfo.getProvince());
        } else if (ipInfo.getCountry() != null) {
            weatherInfo = weatherInfo(ipInfo.getCountry());
        } else {
            return Result.error("获取天气信息失败!");
        }
        return Result.success(weatherInfo);
    }

    // 用户登出(销毁Redis中的token记录)
    @PostMapping("/logout")
    public Result logout(@RequestBody Map<String, String> params) {
        stringRedisTemplate.opsForValue().getOperations().delete(params.get("accessToken"));
        stringRedisTemplate.opsForValue().getOperations().delete(params.get("refreshToken"));
        return Result.success();
    }
}
