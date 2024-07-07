package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysUserActive;

/**
 * 用户存活状况Mapper接口
 * 
 * @author ruoyi
 * @date 2024-07-05
 */
public interface SysUserActiveMapper 
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
     * 删除用户存活状况
     * 
     * @param activeId 用户存活状况主键
     * @return 结果
     */
    public int deleteSysUserActiveByActiveId(Long activeId);

    /**
     * 批量删除用户存活状况
     * 
     * @param activeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysUserActiveByActiveIds(Long[] activeIds);

    public SysUserActive selectUserActiveByUserId(Long userId);

    public SysUserActive checkUserActive(Long userId);
}
