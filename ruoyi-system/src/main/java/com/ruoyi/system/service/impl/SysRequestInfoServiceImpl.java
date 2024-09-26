package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysRequestInfoMapper;
import com.ruoyi.system.domain.SysRequestInfo;
import com.ruoyi.system.service.ISysRequestInfoService;

/**
 * 请求信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-09-13
 */
@Service
public class SysRequestInfoServiceImpl implements ISysRequestInfoService 
{
    @Autowired
    private SysRequestInfoMapper sysRequestInfoMapper;

    /**
     * 查询请求信息
     * 
     * @param requestInfoId 请求信息主键
     * @return 请求信息
     */
    @Override
    public SysRequestInfo selectSysRequestInfoByRequestInfoId(Long requestInfoId)
    {
        return sysRequestInfoMapper.selectSysRequestInfoByRequestInfoId(requestInfoId);
    }

    /**
     * 查询请求信息列表
     * 
     * @param sysRequestInfo 请求信息
     * @return 请求信息
     */
    @Override
    public List<SysRequestInfo> selectSysRequestInfoList(SysRequestInfo sysRequestInfo)
    {
        return sysRequestInfoMapper.selectSysRequestInfoList(sysRequestInfo);
    }

    /**
     * 新增请求信息
     * 
     * @param sysRequestInfo 请求信息
     * @return 结果
     */
    @Override
    public int insertSysRequestInfo(SysRequestInfo sysRequestInfo)
    {
        sysRequestInfo.setCreateTime(DateUtils.getNowDate());
        return sysRequestInfoMapper.insertSysRequestInfo(sysRequestInfo);
    }

    /**
     * 修改请求信息
     * 
     * @param sysRequestInfo 请求信息
     * @return 结果
     */
    @Override
    public int updateSysRequestInfo(SysRequestInfo sysRequestInfo)
    {
        sysRequestInfo.setUpdateTime(DateUtils.getNowDate());
        return sysRequestInfoMapper.updateSysRequestInfo(sysRequestInfo);
    }

    /**
     * 批量删除请求信息
     * 
     * @param requestInfoIds 需要删除的请求信息主键
     * @return 结果
     */
    @Override
    public int deleteSysRequestInfoByRequestInfoIds(Long[] requestInfoIds)
    {
        return sysRequestInfoMapper.deleteSysRequestInfoByRequestInfoIds(requestInfoIds);
    }

    /**
     * 删除请求信息信息
     * 
     * @param requestInfoId 请求信息主键
     * @return 结果
     */
    @Override
    public int deleteSysRequestInfoByRequestInfoId(Long requestInfoId)
    {
        return sysRequestInfoMapper.deleteSysRequestInfoByRequestInfoId(requestInfoId);
    }
}
