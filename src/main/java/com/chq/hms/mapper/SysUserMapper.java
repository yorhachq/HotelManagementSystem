package com.chq.hms.mapper;

import com.chq.hms.domain.SysRole;
import com.chq.hms.domain.SysUser;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface SysUserMapper {
    //根据用户名查询用户
    @Select("SELECT * FROM sys_user WHERE username=#{username}")
    SysUser findByUserName(String username);

    //添加用户(username、password、create_time、create_time字段非空)
    @Insert("INSERT INTO sys_user(username, password, create_time, update_time)" +
            " VALUES(#{username},#{password},NOW(),NOW())")
    void add(String username, String password);

    //更新用户基本信息
    @Update("UPDATE sys_user SET gender=#{gender},email=#{email},phone=#{phone},role_id=#{roleId},status=#{status}," +
            "update_time=#{updateTime} WHERE user_id=#{id}")
    void update(SysUser user);

    //更新用户头像
    @Update("UPDATE sys_user SET avatar=#{avatarUrl},update_time=NOW() WHERE user_id=#{id}")
    void updateAvatar(String avatarUrl, Integer id);

    //更新用户密码
    @Update("UPDATE sys_user SET password=#{md5String},update_time=NOW() WHERE user_id=#{id}")
    void updatePwd(String md5String, Integer id);

    //根据角色id查询角色
    @Select("SELECT * FROM sys_role WHERE role_id=#{roleId}")
    SysRole findRoleById(Integer roleId);
}