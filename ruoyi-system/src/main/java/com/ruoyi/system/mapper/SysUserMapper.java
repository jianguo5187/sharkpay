package com.ruoyi.system.mapper;

import java.util.List;

import com.ruoyi.system.domain.vo.AgentUserListRespVo;
import com.ruoyi.system.domain.vo.ParentUserListRespVO;
import org.apache.ibatis.annotations.Param;
import com.ruoyi.common.core.domain.entity.SysUser;

/**
 * 用户表 数据层
 * 
 * @author ruoyi
 */
public interface SysUserMapper
{
    /**
     * 根据条件分页查询用户列表
     * 
     * @param sysUser 用户信息
     * @return 用户信息集合信息
     */
    public List<SysUser> selectUserList(SysUser sysUser);

    /**
     * 根据条件分页查询已配用户角色列表
     * 
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    public List<SysUser> selectAllocatedList(SysUser user);

    /**
     * 根据条件分页查询未分配用户角色列表
     * 
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    public List<SysUser> selectUnallocatedList(SysUser user);

    /**
     * 通过用户名查询用户
     * 
     * @param userName 用户名
     * @return 用户对象信息
     */
    public SysUser selectUserByUserName(String userName);

    /**
     * 通过用户ID查询用户
     * 
     * @param userId 用户ID
     * @return 用户对象信息
     */
    public SysUser selectUserById(Long userId);

    /**
     * 新增用户信息
     * 
     * @param user 用户信息
     * @return 结果
     */
    public int insertUser(SysUser user);

    /**
     * 修改用户信息
     * 
     * @param user 用户信息
     * @return 结果
     */
    public int updateUser(SysUser user);

    /**
     * 修改用户状态
     *
     * @param user 用户信息
     * @return 结果
     */
    public int updateUserStatus(SysUser user);

    /**
     * 修改用户头像
     * 
     * @param userName 用户名
     * @param avatar 头像地址
     * @return 结果
     */
    public int updateUserAvatar(@Param("userName") String userName, @Param("avatar") String avatar);

    /**
     * 重置用户密码
     * 
     * @param userName 用户名
     * @param password 密码
     * @return 结果
     */
    public int resetUserPwd(@Param("userName") String userName, @Param("password") String password);

    /**
     * 重置用户支付密码
     *
     * @param userId 用户ID
     * @param payPassword 支付密码
     * @return 结果
     */
    public int resetUserPayPwd(@Param("userId")Long userId, @Param("payPassword") String payPassword);

    /**
     * 通过用户ID删除用户
     * 
     * @param userId 用户ID
     * @return 结果
     */
    public int deleteUserById(Long userId);

    /**
     * 批量删除用户信息
     * 
     * @param userIds 需要删除的用户ID
     * @return 结果
     */
    public int deleteUserByIds(Long[] userIds);

    /**
     * 校验用户名称是否唯一
     * 
     * @param userName 用户名称
     * @return 结果
     */
    public SysUser checkUserNameUnique(String userName);

    /**
     * 校验手机号码是否唯一
     *
     * @param phonenumber 手机号码
     * @return 结果
     */
    public SysUser checkPhoneUnique(String phonenumber);

    /**
     * 校验email是否唯一
     *
     * @param email 用户邮箱
     * @return 结果
     */
    public SysUser checkEmailUnique(String email);

    /**
     * 校验身份证号码是否唯一
     *
     * @param idcardNo 身份证号码
     * @return 结果
     */
    public SysUser checkIdcardUnique(String idcardNo);

    /**
     * 根据邀请码查询用户
     *
     * @param inviteCode 邀请码
     * @return 结果
     */
    public SysUser selectUserByInviteCode(String inviteCode);

    public int updateUserAmount(SysUser user);

    public List<SysUser> selectChildUserList(Long parentUserId);

    public List<ParentUserListRespVO> selectParentUserList(SysUser user);

    public List<AgentUserListRespVo> selectAgentUserList(SysUser user);

    public Integer selectEffectiveUsersCount();

    public SysUser selectUserByOpenId(String openId);

    public int updateUserRemarkName(@Param("userId")Long userId, @Param("remarkName") String remarkName);

    public int mergeChildUser(@Param("mainUserId")Long mainUserId, @Param("mergeUserId") Long mergeUserId);

    public Float getUserTotalAmount();

    public int updateUserParent(@Param("userId")Long userId, @Param("parentUserId") Long parentUserId);
}
