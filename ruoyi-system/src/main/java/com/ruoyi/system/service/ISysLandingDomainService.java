package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysLandingDomain;

/**
 * 落地域名Service接口
 * 
 * @author ruoyi
 * @date 2024-06-09
 */
public interface ISysLandingDomainService 
{
    /**
     * 查询落地域名
     * 
     * @param landingDomainId 落地域名主键
     * @return 落地域名
     */
    public SysLandingDomain selectSysLandingDomainByLandingDomainId(Long landingDomainId);

    /**
     * 查询落地域名列表
     * 
     * @param sysLandingDomain 落地域名
     * @return 落地域名集合
     */
    public List<SysLandingDomain> selectSysLandingDomainList(SysLandingDomain sysLandingDomain);

    /**
     * 新增落地域名
     * 
     * @param sysLandingDomain 落地域名
     * @return 结果
     */
    public int insertSysLandingDomain(SysLandingDomain sysLandingDomain);

    /**
     * 修改落地域名
     * 
     * @param sysLandingDomain 落地域名
     * @return 结果
     */
    public int updateSysLandingDomain(SysLandingDomain sysLandingDomain);

    /**
     * 批量删除落地域名
     * 
     * @param landingDomainIds 需要删除的落地域名主键集合
     * @return 结果
     */
    public int deleteSysLandingDomainByLandingDomainIds(Long[] landingDomainIds);

    /**
     * 删除落地域名信息
     * 
     * @param landingDomainId 落地域名主键
     * @return 结果
     */
    public int deleteSysLandingDomainByLandingDomainId(Long landingDomainId);
}
