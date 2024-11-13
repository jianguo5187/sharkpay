package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysAdminActionLogMapper;
import com.ruoyi.system.domain.SysAdminActionLog;
import com.ruoyi.system.service.ISysAdminActionLogService;

/**
 * 管理员操作记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-11-13
 */
@Service
public class SysAdminActionLogServiceImpl implements ISysAdminActionLogService 
{
    @Autowired
    private SysAdminActionLogMapper sysAdminActionLogMapper;

    /**
     * 查询管理员操作记录
     * 
     * @param id 管理员操作记录主键
     * @return 管理员操作记录
     */
    @Override
    public SysAdminActionLog selectSysAdminActionLogById(Long id)
    {
        return sysAdminActionLogMapper.selectSysAdminActionLogById(id);
    }

    /**
     * 查询管理员操作记录列表
     * 
     * @param sysAdminActionLog 管理员操作记录
     * @return 管理员操作记录
     */
    @Override
    public List<SysAdminActionLog> selectSysAdminActionLogList(SysAdminActionLog sysAdminActionLog)
    {
        return sysAdminActionLogMapper.selectSysAdminActionLogList(sysAdminActionLog);
    }

    /**
     * 新增管理员操作记录
     * 
     * @param sysAdminActionLog 管理员操作记录
     * @return 结果
     */
    @Override
    public int insertSysAdminActionLog(SysAdminActionLog sysAdminActionLog)
    {
        sysAdminActionLog.setCreateTime(DateUtils.getNowDate());
        return sysAdminActionLogMapper.insertSysAdminActionLog(sysAdminActionLog);
    }

    /**
     * 修改管理员操作记录
     * 
     * @param sysAdminActionLog 管理员操作记录
     * @return 结果
     */
    @Override
    public int updateSysAdminActionLog(SysAdminActionLog sysAdminActionLog)
    {
        sysAdminActionLog.setUpdateTime(DateUtils.getNowDate());
        return sysAdminActionLogMapper.updateSysAdminActionLog(sysAdminActionLog);
    }

    /**
     * 批量删除管理员操作记录
     * 
     * @param ids 需要删除的管理员操作记录主键
     * @return 结果
     */
    @Override
    public int deleteSysAdminActionLogByIds(Long[] ids)
    {
        return sysAdminActionLogMapper.deleteSysAdminActionLogByIds(ids);
    }

    /**
     * 删除管理员操作记录信息
     * 
     * @param id 管理员操作记录主键
     * @return 结果
     */
    @Override
    public int deleteSysAdminActionLogById(Long id)
    {
        return sysAdminActionLogMapper.deleteSysAdminActionLogById(id);
    }
}
