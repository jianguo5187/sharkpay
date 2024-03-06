package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysBetItem;

/**
 * 游戏投注项Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-06
 */
public interface SysBetItemMapper 
{
    /**
     * 查询游戏投注项
     * 
     * @param betItemId 游戏投注项主键
     * @return 游戏投注项
     */
    public SysBetItem selectSysBetItemByBetItemId(Long betItemId);

    /**
     * 查询游戏投注项列表
     * 
     * @param sysBetItem 游戏投注项
     * @return 游戏投注项集合
     */
    public List<SysBetItem> selectSysBetItemList(SysBetItem sysBetItem);

    /**
     * 新增游戏投注项
     * 
     * @param sysBetItem 游戏投注项
     * @return 结果
     */
    public int insertSysBetItem(SysBetItem sysBetItem);

    /**
     * 修改游戏投注项
     * 
     * @param sysBetItem 游戏投注项
     * @return 结果
     */
    public int updateSysBetItem(SysBetItem sysBetItem);

    /**
     * 删除游戏投注项
     * 
     * @param betItemId 游戏投注项主键
     * @return 结果
     */
    public int deleteSysBetItemByBetItemId(Long betItemId);

    /**
     * 批量删除游戏投注项
     * 
     * @param betItemIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysBetItemByBetItemIds(Long[] betItemIds);
}
