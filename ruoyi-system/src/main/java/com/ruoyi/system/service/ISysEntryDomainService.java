package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysEntryDomain;

/**
 * 入口域名Service接口
 * 
 * @author ruoyi
 * @date 2024-06-09
 */
public interface ISysEntryDomainService 
{
    /**
     * 查询入口域名
     * 
     * @param entryDomainId 入口域名主键
     * @return 入口域名
     */
    public SysEntryDomain selectSysEntryDomainByEntryDomainId(Long entryDomainId);

    /**
     * 查询入口域名列表
     * 
     * @param sysEntryDomain 入口域名
     * @return 入口域名集合
     */
    public List<SysEntryDomain> selectSysEntryDomainList(SysEntryDomain sysEntryDomain);

    /**
     * 新增入口域名
     * 
     * @param sysEntryDomain 入口域名
     * @return 结果
     */
    public int insertSysEntryDomain(SysEntryDomain sysEntryDomain);

    /**
     * 修改入口域名
     * 
     * @param sysEntryDomain 入口域名
     * @return 结果
     */
    public int updateSysEntryDomain(SysEntryDomain sysEntryDomain);

    /**
     * 批量删除入口域名
     * 
     * @param entryDomainIds 需要删除的入口域名主键集合
     * @return 结果
     */
    public int deleteSysEntryDomainByEntryDomainIds(Long[] entryDomainIds);

    /**
     * 删除入口域名信息
     * 
     * @param entryDomainId 入口域名主键
     * @return 结果
     */
    public int deleteSysEntryDomainByEntryDomainId(Long entryDomainId);
}
