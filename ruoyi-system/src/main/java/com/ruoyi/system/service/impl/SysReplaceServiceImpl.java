package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysReplaceMapper;
import com.ruoyi.system.domain.SysReplace;
import com.ruoyi.system.service.ISysReplaceService;

/**
 * 广告轮播图Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@Service
public class SysReplaceServiceImpl implements ISysReplaceService 
{
    @Autowired
    private SysReplaceMapper sysReplaceMapper;

    /**
     * 查询广告轮播图
     * 
     * @param replaceId 广告轮播图主键
     * @return 广告轮播图
     */
    @Override
    public SysReplace selectSysReplaceByReplaceId(Long replaceId)
    {
        return sysReplaceMapper.selectSysReplaceByReplaceId(replaceId);
    }

    /**
     * 查询广告轮播图列表
     * 
     * @param sysReplace 广告轮播图
     * @return 广告轮播图
     */
    @Override
    public List<SysReplace> selectSysReplaceList(SysReplace sysReplace)
    {
        return sysReplaceMapper.selectSysReplaceList(sysReplace);
    }

    /**
     * 新增广告轮播图
     * 
     * @param sysReplace 广告轮播图
     * @return 结果
     */
    @Override
    public int insertSysReplace(SysReplace sysReplace)
    {
        sysReplace.setCreateTime(DateUtils.getNowDate());
        return sysReplaceMapper.insertSysReplace(sysReplace);
    }

    /**
     * 修改广告轮播图
     * 
     * @param sysReplace 广告轮播图
     * @return 结果
     */
    @Override
    public int updateSysReplace(SysReplace sysReplace)
    {
        sysReplace.setUpdateTime(DateUtils.getNowDate());
        return sysReplaceMapper.updateSysReplace(sysReplace);
    }

    /**
     * 批量删除广告轮播图
     * 
     * @param replaceIds 需要删除的广告轮播图主键
     * @return 结果
     */
    @Override
    public int deleteSysReplaceByReplaceIds(Long[] replaceIds)
    {
        return sysReplaceMapper.deleteSysReplaceByReplaceIds(replaceIds);
    }

    /**
     * 删除广告轮播图信息
     * 
     * @param replaceId 广告轮播图主键
     * @return 结果
     */
    @Override
    public int deleteSysReplaceByReplaceId(Long replaceId)
    {
        return sysReplaceMapper.deleteSysReplaceByReplaceId(replaceId);
    }
}
