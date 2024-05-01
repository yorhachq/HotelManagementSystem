package com.chq.hms.controller.client;

import com.chq.hms.anno.OperationLog;
import com.chq.hms.domain.HotelRechargeRecord;
import com.chq.hms.domain.Result;
import com.chq.hms.domain.SysRole;
import com.chq.hms.domain.SysUser;
import com.chq.hms.domain.vo.HotelMemberVO;
import com.chq.hms.service.HotelMemberService;
import com.chq.hms.service.SysUserService;
import com.chq.hms.util.AliOssUtil;
import com.chq.hms.util.Md5Util;
import com.chq.hms.util.ThreadLocalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/client")
public class ClientSpaceController {
    @SuppressWarnings("all")
    @Autowired
    private SysUserService userService;
    @SuppressWarnings("all")
    @Autowired
    private HotelMemberService hotelMemberService;
    @SuppressWarnings("all")
    @Autowired
    private StringRedisTemplate stringRedisTemplate;
    @SuppressWarnings("all")
    @Autowired
    private AliOssUtil aliOssUtil;
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

    //更新用户信息
    @OperationLog("业务处理：更新个人信息")
    @PutMapping("/update")
    public Result<Object> update(@RequestBody @Validated SysUser user) {
        //校验浏览器请求中的用户id是否与当前用户ThreadLocal中的id一致
        if (user.getUserId().equals(((Map<?, ?>) ThreadLocalUtil.get()).get("id"))) {
            //修正前端数据
            if (user.getGender().equals("男")) {
                user.setGender("male");
            } else if (user.getGender().equals("女")) {
                user.setGender("female");
            }
            userService.update(user);
            return Result.success();
        }
        return Result.error("目标用户与当前已登录用户不一致!");
    }


    /**
     * 更新用户头像
     *
     * @param params string
     */
    @OperationLog("业务处理：更新个人头像")
    @PostMapping("/updateAvatar")
    public Result<Void> updateAvatar(@RequestBody Map<String, String> params) {
        String avatarUrl = params.get("avatar");
        userService.updateAvatar(avatarUrl);
        return Result.success();
    }

    // 根据角色ID获取用户角色
    @OperationLog("数据获取：用户角色")
    @GetMapping("/getRoleByCode/{roleId}")
    public Result<SysRole> getRoleByCode(@PathVariable Integer roleId) {
        SysRole role = userService.findRoleById(roleId);
        return Result.success(role);
    }

    //更新用户密码(自行更新，已知密码)
    @OperationLog("业务处理：更新个人密码")
    @PatchMapping("/updatePwd")
    public Result<Void> updatePwd(@RequestBody Map<String, String> params, @RequestHeader("Authorization") String token) {
        //参数校验
        String oldPwd = params.get("oldPwd");
        String newPwd = params.get("newPwd");
        if (!(StringUtils.hasLength(oldPwd) && StringUtils.hasLength(newPwd))) {
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
        //完成密码更新
        userService.updatePwd(newPwd);
        //删除Redis中对应的token
        ValueOperations<String, String> valueOps = stringRedisTemplate.opsForValue();
        valueOps.getOperations().delete(token);
        return Result.success();
    }

    /**
     * 会员充值
     *
     * @param rechargeRecord 充值记录
     * @return 操作结果
     */
    @OperationLog("业务处理：会员充值")
    @PostMapping("/recharge")
    public Result<Void> rechargeMember(@RequestBody HotelRechargeRecord rechargeRecord) {
        hotelMemberService.rechargeMember(rechargeRecord);
        return Result.success();
    }

    /**
     * 获取会员详细信息
     *
     * @param userId 用户ID
     * @return 会员详细信息
     */
    @OperationLog("数据获取：会员详细信息")
    @GetMapping("/memberInfo/{userId}")
    public Result<HotelMemberVO> getMemberInfo(@PathVariable Integer userId) {
        HotelMemberVO hotelMemberVO = hotelMemberService.getMemberInfo(userId);
        return Result.success(hotelMemberVO);
    }

    @OperationLog("系统功能：上传文件")
    @PostMapping("/upload")
    public Result<String> upload(MultipartFile file) throws Exception {
        String originalFilename = file.getOriginalFilename();
        ///保证文件的名字是唯一的,防止文件覆盖
        String filename = null;
        if (originalFilename != null) {
            filename = UUID.randomUUID() + originalFilename.substring(originalFilename.indexOf("."));
        }
        String url = aliOssUtil.uploadFile(filename, file.getInputStream());
        return Result.success(url);
    }
}
