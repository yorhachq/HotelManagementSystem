package com.chq.hms.mapper;

import com.chq.hms.domain.SysRole;
import com.chq.hms.domain.SysUser;
import com.chq.hms.domain.vo.EmployeeVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface SysUserMapper {
    //根据用户名查询用户
    @Select("SELECT * FROM sys_user WHERE username=#{username}")
    SysUser findByUserName(String username);

    //根据用户id查询用户
    @Select("SELECT * FROM sys_user WHERE user_id=#{id}")
    SysUser findByUserId(Integer userId);

    //添加用户(username、password、create_time、create_time字段非空)
    @Insert("INSERT INTO sys_user(username, password, avatar, role_id, status,create_time, update_time)" +
            " VALUES(#{username},#{password}," +
            "'https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/default_admin.png',#{roleId},'正常',NOW(),NOW())")
    void add(String username, String password, Integer roleId);

    //更新用户基本信息
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

    /**
     * 插入系统用户
     *
     * @param sysUser 系统用户信息
     */
    void insertSysUser(SysUser sysUser);

    /**
     * 更新系统用户
     *
     * @param sysUser 系统用户信息
     */
    void updateSysUser(SysUser sysUser);

    /**
     * 根据ID查询系统用户
     *
     * @param userId 用户ID
     * @return 系统用户信息
     */
    SysUser selectSysUserById(Integer userId);

    /**
     * 根据角色代号查询角色ID
     *
     * @param role 角色编码
     * @return 角色ID
     */
    @Select("SELECT role_id FROM sys_role WHERE role_code=#{role}")
    Integer findRoleByCode(String role);

    /**
     * 查询员工列表
     *
     * @param selfId   当前登录的用户ID(排除自身)
     * @param username 用户名,用于模糊查询
     * @param phone    手机号,用于模糊查询
     * @param email    邮箱,用于模糊查询
     * @param roleCode 角色代号
     * @param gender   性别
     * @param status   账户状态
     * @return 员工列表
     */
    List<EmployeeVO> selectEmployeeList(@Param("selfId") Integer selfId,
                                        @Param("username") String username,
                                        @Param("phone") String phone,
                                        @Param("email") String email,
                                        @Param("roleCode") String roleCode,
                                        @Param("gender") String gender,
                                        @Param("status") String status);

    /**
     * 查询所有角色
     *
     * @return 角色列表
     */
    List<SysRole> listRoles();
}
