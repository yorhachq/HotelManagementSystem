package com.chq.hms.controller;

import com.chq.hms.domain.HotelRechargeRecord;
import com.chq.hms.domain.Result;
import com.chq.hms.domain.SysRole;
import com.chq.hms.domain.SysUser;
import com.chq.hms.domain.vo.HotelMemberVO;
import com.chq.hms.domain.vo.PageBean;
import com.chq.hms.service.HotelMemberService;
import com.chq.hms.service.SysUserService;
import com.chq.hms.util.JwtUtil;
import com.chq.hms.util.Md5Util;
import jakarta.validation.constraints.Pattern;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * 酒店会员模块
 */
@RestController
@RequestMapping("/hotelMember")
public class HotelMemberController {
    @Autowired
    private SysUserService userService;
    @Autowired
    private HotelMemberService hotelMemberService;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    /**
     * 会员注册
     *
     * @param username 用户名
     * @param password 密码
     * @return 注册结果
     */
    @PostMapping("/register")
    public Result<Void> registerMember(@Pattern(regexp = "^\\S{1,16}$") String username, @Pattern(regexp = "^\\S{1,16}$") String password) {
        //查询用户名是否占用
        if (userService.findByUserName(username) == null) {
            //未占用，注册
            SysUser sysUser = new SysUser();
            sysUser.setUsername(username);
            sysUser.setPassword(password);
            hotelMemberService.registerMember(sysUser);
            return Result.success();
        } else {
            //已占用
            return Result.error("用户名已被占用，换一个试试吧");
        }
    }

    /**
     * 会员登录
     *
     * @param username 用户名
     * @param password 密码
     * @return 登录结果
     */
    @PostMapping("/login")
    public Result<Object> loginMember(@Pattern(regexp = "^\\S{1,16}$") String username, @Pattern(regexp = "^\\S{1,16}$") String password) {
        // 检查会员是否存在
        if (hotelMemberService.checkMemberExists(username)) {
            SysUser loginUser = userService.findByUserName(username);
            if (loginUser == null) {
                //用户不存在
                return Result.error("不存在用户名为[" + username + "]的用户!");
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
                data.put("avatar", loginUser.getAvatar());
                data.put("accessToken", accessToken);
                data.put("refreshToken", refreshToken);
                data.put("expires", expires);
                return Result.success(data);
            }
            return Result.error("密码错误!");
        }
        return Result.error("会员[" + username + "]不存在，请先注册!");
    }

    /**
     * 会员充值
     *
     * @param rechargeRecord 充值记录
     * @return 操作结果
     */
    @PostMapping("/recharge")
    public Result<Void> rechargeMember(@RequestBody HotelRechargeRecord rechargeRecord) {
        hotelMemberService.rechargeMember(rechargeRecord);
        return Result.success();
    }

    /**
     * 更新会员信息
     *
     * @param hotelMember 会员信息
     * @return 操作结果
     */
    @PutMapping("/update")
    public Result<Void> updateMember(@RequestBody SysUser hotelMember) {
        userService.update(hotelMember);
        return Result.success();
    }

    /**
     * 删除会员(软删除)
     *
     * @param userId 用户ID
     * @return 操作结果
     */
    @DeleteMapping("/delete/{userId}")
    public Result<Void> deleteMember(@PathVariable Integer userId) {
        hotelMemberService.deleteMember(userId);
        return Result.success();
    }

    /**
     * 查询会员列表
     *
     * @param username    用户名(可选)
     * @param phone       手机号(可选)
     * @param memberLevel 会员等级(可选)
     * @param pageNum     页码(可选,默认为1)
     * @param pageSize    每页条数(可选,默认为10)
     * @param orderBy     排序字段(可选,默认为create_time)
     * @param orderType   排序方式(可选,默认为desc)
     * @return 会员列表
     */
    @GetMapping("/getmembers")
    public Result<PageBean<HotelMemberVO>> getMembers(
            @RequestParam(required = false) String username,
            @RequestParam(required = false) String phone,
            @RequestParam(required = false) String memberLevel,
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(defaultValue = "member_id") String orderBy,
            @RequestParam(defaultValue = "asc") String orderType) {
        PageBean<HotelMemberVO> pageInfo = hotelMemberService.getMembers(username, phone, memberLevel, pageNum, pageSize, orderBy, orderType);
        return Result.success(pageInfo);
    }
}
