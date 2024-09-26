package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysRequestInfo;

/**
 * 请求信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-09-13
 */
public interface SysRequestInfoMapper 
{
    /**
     * 查询请求信息
     * 
     * @param requestInfoId 请求信息主键
     * @return 请求信息
     */
    public SysRequestInfo selectSysRequestInfoByRequestInfoId(Long requestInfoId);

    /**
     * 查询请求信息列表
     * 
     * @param sysRequestInfo 请求信息
     * @return 请求信息集合
     */
    public List<SysRequestInfo> selectSysRequestInfoList(SysRequestInfo sysRequestInfo);

    /**
     * 新增请求信息
     * 
     * @param sysRequestInfo 请求信息
     * @return 结果
     */
    public int insertSysRequestInfo(SysRequestInfo sysRequestInfo);

    /**
     * 修改请求信息
     * 
     * @param sysRequestInfo 请求信息
     * @return 结果
     */
    public int updateSysRequestInfo(SysRequestInfo sysRequestInfo);

    /**
     * 删除请求信息
     * 
     * @param requestInfoId 请求信息主键
     * @return 结果
     */
    public int deleteSysRequestInfoByRequestInfoId(Long requestInfoId);

    /**
     * 批量删除请求信息
     * 
     * @param requestInfoIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysRequestInfoByRequestInfoIds(Long[] requestInfoIds);
}
