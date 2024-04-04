package com.chq.hms.domain;


import com.chq.hms.anno.AvailableStatus;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.validation.constraints.*;
import jakarta.validation.groups.Default;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import java.time.LocalDateTime;

/**
 * 系统用户
 */
@Data
public class SysUser {
    @NotNull(groups = Update.class)
    private Integer userId; //主键ID
    private String username; //用户名

    //注意别导错包，正确的应为com.fasterxml.jackson.annotation.JsonIgnore
    //在json序列化时将java bean中的对应属性忽略掉,此时返回的json数据中不包含该属性
    @JsonIgnore
    private String password; //密码
    private String gender;

//    @NotEmpty
//    @Pattern(regexp = "^\\S{1,10}$")
//    private String nickname;//昵称

    @NotEmpty
    @Email
    private String email; //邮箱

    @NotBlank(message = "手机号不能为空")
    @Length(min = 11, max = 11, message = "手机号只能为11位")
    //手机号-中国(宽松),只要是 13,14,15,16,17,18,19 开头即可
    @Pattern(regexp = "^(?:(?:\\+|00)86)?1[3-9]\\d{9}$", message = "手机号格式有误")
    private String phone; //手机号码

    private String avatar; //用户头像地址
    private Integer roleId; //角色ID
    // 账户状态(正常,封禁,冻结)
    // 注:冻结仅用于软删除,防止出现外键引用问题
    @AvailableStatus
    private String status;

    private LocalDateTime createTime; //创建时间
    private LocalDateTime updateTime; //更新时间

    public interface Update extends Default {
    }
}
