package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysAdminRecord;

/**
 * 管理员记录Service接口
 * 
 * @author ruoyi
 * @date 2024-05-07
 */
public interface ISysAdminRecordService 
{
    /**
     * 查询管理员记录
     * 
     * @param id 管理员记录主键
     * @return 管理员记录
     */
    public SysAdminRecord selectSysAdminRecordById(Long id);

    /**
     * 查询管理员记录列表
     * 
     * @param sysAdminRecord 管理员记录
     * @return 管理员记录集合
     */
    public List<SysAdminRecord> selectSysAdminRecordList(SysAdminRecord sysAdminRecord);

    /**
     * 新增管理员记录
     * 
     * @param sysAdminRecord 管理员记录
     * @return 结果
     */
    public int insertSysAdminRecord(SysAdminRecord sysAdminRecord);

    /**
     * 修改管理员记录
     * 
     * @param sysAdminRecord 管理员记录
     * @return 结果
     */
    public int updateSysAdminRecord(SysAdminRecord sysAdminRecord);

    /**
     * 批量删除管理员记录
     * 
     * @param ids 需要删除的管理员记录主键集合
     * @return 结果
     */
    public int deleteSysAdminRecordByIds(Long[] ids);

    /**
     * 删除管理员记录信息
     * 
     * @param id 管理员记录主键
     * @return 结果
     */
    public int deleteSysAdminRecordById(Long id);
}