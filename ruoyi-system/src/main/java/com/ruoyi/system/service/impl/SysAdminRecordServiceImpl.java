package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysAdminRecordMapper;
import com.ruoyi.system.domain.SysAdminRecord;
import com.ruoyi.system.service.ISysAdminRecordService;

/**
 * 管理员记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-05-07
 */
@Service
public class SysAdminRecordServiceImpl implements ISysAdminRecordService 
{
    @Autowired
    private SysAdminRecordMapper sysAdminRecordMapper;

    /**
     * 查询管理员记录
     * 
     * @param id 管理员记录主键
     * @return 管理员记录
     */
    @Override
    public SysAdminRecord selectSysAdminRecordById(Long id)
    {
        return sysAdminRecordMapper.selectSysAdminRecordById(id);
    }

    /**
     * 查询管理员记录列表
     * 
     * @param sysAdminRecord 管理员记录
     * @return 管理员记录
     */
    @Override
    public List<SysAdminRecord> selectSysAdminRecordList(SysAdminRecord sysAdminRecord)
    {
        return sysAdminRecordMapper.selectSysAdminRecordList(sysAdminRecord);
    }

    /**
     * 新增管理员记录
     * 
     * @param sysAdminRecord 管理员记录
     * @return 结果
     */
    @Override
    public int insertSysAdminRecord(SysAdminRecord sysAdminRecord)
    {
        sysAdminRecord.setCreateTime(DateUtils.getNowDate());
        return sysAdminRecordMapper.insertSysAdminRecord(sysAdminRecord);
    }

    /**
     * 修改管理员记录
     * 
     * @param sysAdminRecord 管理员记录
     * @return 结果
     */
    @Override
    public int updateSysAdminRecord(SysAdminRecord sysAdminRecord)
    {
        sysAdminRecord.setUpdateTime(DateUtils.getNowDate());
        return sysAdminRecordMapper.updateSysAdminRecord(sysAdminRecord);
    }

    /**
     * 批量删除管理员记录
     * 
     * @param ids 需要删除的管理员记录主键
     * @return 结果
     */
    @Override
    public int deleteSysAdminRecordByIds(Long[] ids)
    {
        return sysAdminRecordMapper.deleteSysAdminRecordByIds(ids);
    }

    /**
     * 删除管理员记录信息
     * 
     * @param id 管理员记录主键
     * @return 结果
     */
    @Override
    public int deleteSysAdminRecordById(Long id)
    {
        return sysAdminRecordMapper.deleteSysAdminRecordById(id);
    }
}
