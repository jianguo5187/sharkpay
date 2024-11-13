package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysAdminActionLog;

/**
 * 管理员操作记录Service接口
 * 
 * @author ruoyi
 * @date 2024-11-13
 */
public interface ISysAdminActionLogService 
{
    /**
     * 查询管理员操作记录
     * 
     * @param id 管理员操作记录主键
     * @return 管理员操作记录
     */
    public SysAdminActionLog selectSysAdminActionLogById(Long id);

    /**
     * 查询管理员操作记录列表
     * 
     * @param sysAdminActionLog 管理员操作记录
     * @return 管理员操作记录集合
     */
    public List<SysAdminActionLog> selectSysAdminActionLogList(SysAdminActionLog sysAdminActionLog);

    /**
     * 新增管理员操作记录
     * 
     * @param sysAdminActionLog 管理员操作记录
     * @return 结果
     */
    public int insertSysAdminActionLog(SysAdminActionLog sysAdminActionLog);

    /**
     * 修改管理员操作记录
     * 
     * @param sysAdminActionLog 管理员操作记录
     * @return 结果
     */
    public int updateSysAdminActionLog(SysAdminActionLog sysAdminActionLog);

    /**
     * 批量删除管理员操作记录
     * 
     * @param ids 需要删除的管理员操作记录主键集合
     * @return 结果
     */
    public int deleteSysAdminActionLogByIds(Long[] ids);

    /**
     * 删除管理员操作记录信息
     * 
     * @param id 管理员操作记录主键
     * @return 结果
     */
    public int deleteSysAdminActionLogById(Long id);
}
