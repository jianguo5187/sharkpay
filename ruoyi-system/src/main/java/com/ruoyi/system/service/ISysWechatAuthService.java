package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysWechatAuth;

/**
 * 授权域名Service接口
 * 
 * @author ruoyi
 * @date 2024-12-31
 */
public interface ISysWechatAuthService 
{
    /**
     * 查询授权域名
     * 
     * @param wechatAuthId 授权域名主键
     * @return 授权域名
     */
    public SysWechatAuth selectSysWechatAuthByWechatAuthId(Long wechatAuthId);

    /**
     * 查询授权域名列表
     * 
     * @param sysWechatAuth 授权域名
     * @return 授权域名集合
     */
    public List<SysWechatAuth> selectSysWechatAuthList(SysWechatAuth sysWechatAuth);

    /**
     * 新增授权域名
     * 
     * @param sysWechatAuth 授权域名
     * @return 结果
     */
    public int insertSysWechatAuth(SysWechatAuth sysWechatAuth);

    /**
     * 修改授权域名
     * 
     * @param sysWechatAuth 授权域名
     * @return 结果
     */
    public int updateSysWechatAuth(SysWechatAuth sysWechatAuth);

    /**
     * 批量删除授权域名
     * 
     * @param wechatAuthIds 需要删除的授权域名主键集合
     * @return 结果
     */
    public int deleteSysWechatAuthByWechatAuthIds(Long[] wechatAuthIds);

    /**
     * 删除授权域名信息
     * 
     * @param wechatAuthId 授权域名主键
     * @return 结果
     */
    public int deleteSysWechatAuthByWechatAuthId(Long wechatAuthId);
}
