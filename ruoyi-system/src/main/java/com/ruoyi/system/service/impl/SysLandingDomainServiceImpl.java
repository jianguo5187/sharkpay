package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysLandingDomainMapper;
import com.ruoyi.system.domain.SysLandingDomain;
import com.ruoyi.system.service.ISysLandingDomainService;

/**
 * 落地域名Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-06-09
 */
@Service
public class SysLandingDomainServiceImpl implements ISysLandingDomainService 
{
    @Autowired
    private SysLandingDomainMapper sysLandingDomainMapper;

    /**
     * 查询落地域名
     * 
     * @param landingDomainId 落地域名主键
     * @return 落地域名
     */
    @Override
    public SysLandingDomain selectSysLandingDomainByLandingDomainId(Long landingDomainId)
    {
        return sysLandingDomainMapper.selectSysLandingDomainByLandingDomainId(landingDomainId);
    }

    /**
     * 查询落地域名列表
     * 
     * @param sysLandingDomain 落地域名
     * @return 落地域名
     */
    @Override
    public List<SysLandingDomain> selectSysLandingDomainList(SysLandingDomain sysLandingDomain)
    {
        return sysLandingDomainMapper.selectSysLandingDomainList(sysLandingDomain);
    }

    /**
     * 新增落地域名
     * 
     * @param sysLandingDomain 落地域名
     * @return 结果
     */
    @Override
    public int insertSysLandingDomain(SysLandingDomain sysLandingDomain)
    {
        sysLandingDomain.setCreateTime(DateUtils.getNowDate());
        return sysLandingDomainMapper.insertSysLandingDomain(sysLandingDomain);
    }

    /**
     * 修改落地域名
     * 
     * @param sysLandingDomain 落地域名
     * @return 结果
     */
    @Override
    public int updateSysLandingDomain(SysLandingDomain sysLandingDomain)
    {
        sysLandingDomain.setUpdateTime(DateUtils.getNowDate());
        return sysLandingDomainMapper.updateSysLandingDomain(sysLandingDomain);
    }

    /**
     * 批量删除落地域名
     * 
     * @param landingDomainIds 需要删除的落地域名主键
     * @return 结果
     */
    @Override
    public int deleteSysLandingDomainByLandingDomainIds(Long[] landingDomainIds)
    {
        return sysLandingDomainMapper.deleteSysLandingDomainByLandingDomainIds(landingDomainIds);
    }

    /**
     * 删除落地域名信息
     * 
     * @param landingDomainId 落地域名主键
     * @return 结果
     */
    @Override
    public int deleteSysLandingDomainByLandingDomainId(Long landingDomainId)
    {
        return sysLandingDomainMapper.deleteSysLandingDomainByLandingDomainId(landingDomainId);
    }
}
