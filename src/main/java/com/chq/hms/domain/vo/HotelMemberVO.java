package com.chq.hms.domain.vo;

import com.chq.hms.domain.HotelMember;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 酒店会员视图对象
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class HotelMemberVO extends HotelMember {
    // 用户名
    private String username;
    // 性别
    private String gender;
    // 手机号
    private String phone;
    private String email;
    private String avatar;
    private String status;
}
