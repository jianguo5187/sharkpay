package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.SysWechatAuth;
import com.ruoyi.system.mapper.SysWechatAuthMapper;
import com.ruoyi.system.service.ISysWechatAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 授权域名Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-12-31
 */
@Service
public class SysWechatAuthServiceImpl implements ISysWechatAuthService 
{
    @Autowired
    private SysWechatAuthMapper sysWechatAuthMapper;

    /**
     * 查询授权域名
     * 
     * @param wechatAuthId 授权域名主键
     * @return 授权域名
     */
    @Override
    public SysWechatAuth selectSysWechatAuthByWechatAuthId(Long wechatAuthId)
    {
        return sysWechatAuthMapper.selectSysWechatAuthByWechatAuthId(wechatAuthId);
    }

    /**
     * 查询授权域名列表
     * 
     * @param sysWechatAuth 授权域名
     * @return 授权域名
     */
    @Override
    public List<SysWechatAuth> selectSysWechatAuthList(SysWechatAuth sysWechatAuth)
    {
        return sysWechatAuthMapper.selectSysWechatAuthList(sysWechatAuth);
    }

    /**
     * 新增授权域名
     * 
     * @param sysWechatAuth 授权域名
     * @return 结果
     */
    @Override
    public int insertSysWechatAuth(SysWechatAuth sysWechatAuth)
    {
        sysWechatAuth.setCreateTime(DateUtils.getNowDate());
        int rowId = sysWechatAuthMapper.insertSysWechatAuth(sysWechatAuth);
        setOneRecordValid();
        return  rowId;
    }

    /**
     * 修改授权域名
     * 
     * @param sysWechatAuth 授权域名
     * @return 结果
     */
    @Override
    public int updateSysWechatAuth(SysWechatAuth sysWechatAuth)
    {
        sysWechatAuth.setUpdateTime(DateUtils.getNowDate());
        int rowId = sysWechatAuthMapper.updateSysWechatAuth(sysWechatAuth);
        setOneRecordValid();
        return  rowId;
    }

    /**
     * 批量删除授权域名
     * 
     * @param wechatAuthIds 需要删除的授权域名主键
     * @return 结果
     */
    @Override
    public int deleteSysWechatAuthByWechatAuthIds(Long[] wechatAuthIds)
    {
        int rowId = sysWechatAuthMapper.deleteSysWechatAuthByWechatAuthIds(wechatAuthIds);
        setOneRecordValid();
        return  rowId;
    }

    /**
     * 删除授权域名信息
     * 
     * @param wechatAuthId 授权域名主键
     * @return 结果
     */
    @Override
    public int deleteSysWechatAuthByWechatAuthId(Long wechatAuthId)
    {
        return sysWechatAuthMapper.deleteSysWechatAuthByWechatAuthId(wechatAuthId);
    }

    public void setOneRecordValid(){
        SysWechatAuth searchSysWechatAuth = new SysWechatAuth();
        searchSysWechatAuth.setStatus("0"); //正常
        searchSysWechatAuth.setDelFlag("0"); //未删除
        List<SysWechatAuth> validDomainList = selectSysWechatAuthList(searchSysWechatAuth);
        if(validDomainList.size() == 0){
            SysWechatAuth searchNoDeleteLandingDomain = new SysWechatAuth();
            searchNoDeleteLandingDomain.setDelFlag("0"); //未删除
            List<SysWechatAuth> noDeleteDomainList = selectSysWechatAuthList(searchNoDeleteLandingDomain);
            if(noDeleteDomainList.size() == 0){
                SysWechatAuth searchNoValidLandingDomain = new SysWechatAuth();
                searchNoValidLandingDomain.setStatus("0"); //正常
                List<SysWechatAuth> noValidDomainList = selectSysWechatAuthList(searchNoValidLandingDomain);
                if(noValidDomainList.size() > 0){
                    SysWechatAuth landingDomain = noValidDomainList.get(noValidDomainList.size() - 1);
                    landingDomain.setStatus("0"); //正常
                    landingDomain.setDelFlag("0"); //未删除
                    updateSysWechatAuth(landingDomain);
                }
            }else{
                SysWechatAuth noDeleteLandingDomain = noDeleteDomainList.get(0);
                noDeleteLandingDomain.setStatus("0"); //正常
                noDeleteLandingDomain.setDelFlag("0"); //未删除
                updateSysWechatAuth(noDeleteLandingDomain);
            }
        }
    }
}
