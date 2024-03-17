package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysReplace;

/**
 * 广告轮播图Service接口
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public interface ISysReplaceService 
{
    /**
     * 查询广告轮播图
     * 
     * @param replaceId 广告轮播图主键
     * @return 广告轮播图
     */
    public SysReplace selectSysReplaceByReplaceId(Long replaceId);

    /**
     * 查询广告轮播图列表
     * 
     * @param sysReplace 广告轮播图
     * @return 广告轮播图集合
     */
    public List<SysReplace> selectSysReplaceList(SysReplace sysReplace);

    /**
     * 新增广告轮播图
     * 
     * @param sysReplace 广告轮播图
     * @return 结果
     */
    public int insertSysReplace(SysReplace sysReplace);

    /**
     * 修改广告轮播图
     * 
     * @param sysReplace 广告轮播图
     * @return 结果
     */
    public int updateSysReplace(SysReplace sysReplace);

    /**
     * 批量删除广告轮播图
     * 
     * @param replaceIds 需要删除的广告轮播图主键集合
     * @return 结果
     */
    public int deleteSysReplaceByReplaceIds(Long[] replaceIds);

    /**
     * 删除广告轮播图信息
     * 
     * @param replaceId 广告轮播图主键
     * @return 结果
     */
    public int deleteSysReplaceByReplaceId(Long replaceId);
}
