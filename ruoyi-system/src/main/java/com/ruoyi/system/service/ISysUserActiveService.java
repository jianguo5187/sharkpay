package com.ruoyi.system.service;

import java.util.List;

import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.system.domain.SysUserActive;

/**
 * 用户存活状况Service接口
 * 
 * @author ruoyi
 * @date 2024-07-05
 */
public interface ISysUserActiveService 
{
    /**
     * 查询用户存活状况
     * 
     * @param activeId 用户存活状况主键
     * @return 用户存活状况
     */
    public SysUserActive selectSysUserActiveByActiveId(Long activeId);

    /**
     * 查询用户存活状况列表
     * 
     * @param sysUserActive 用户存活状况
     * @return 用户存活状况集合
     */
    public List<SysUserActive> selectSysUserActiveList(SysUserActive sysUserActive);

    /**
     * 新增用户存活状况
     * 
     * @param sysUserActive 用户存活状况
     * @return 结果
     */
    public int insertSysUserActive(SysUserActive sysUserActive);

    /**
     * 修改用户存活状况
     * 
     * @param sysUserActive 用户存活状况
     * @return 结果
     */
    public int updateSysUserActive(SysUserActive sysUserActive);

    /**
     * 批量删除用户存活状况
     * 
     * @param activeIds 需要删除的用户存活状况主键集合
     * @return 结果
     */
    public int deleteSysUserActiveByActiveIds(Long[] activeIds);

    /**
     * 删除用户存活状况信息
     * 
     * @param activeId 用户存活状况主键
     * @return 结果
     */
    public int deleteSysUserActiveByActiveId(Long activeId);

    public SysUserActive selectUserActiveByUserId(Long userId);

    public SysUserActive checkUserActive(Long userId);

    public void updateActiveUser(LoginUser loginUser);
}
