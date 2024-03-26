package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysBetItem;

import java.util.List;

/**
 * 游戏投注项Service接口
 * 
 * @author ruoyi
 * @date 2024-03-06
 */
public interface ISysBetItemService 
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
     * 批量删除游戏投注项
     * 
     * @param betItemIds 需要删除的游戏投注项主键集合
     * @return 结果
     */
    public int deleteSysBetItemByBetItemIds(Long[] betItemIds);

    /**
     * 删除游戏投注项信息
     * 
     * @param betItemId 游戏投注项主键
     * @return 结果
     */
    public int deleteSysBetItemByBetItemId(Long betItemId);

    public boolean checkBetItemCodeUnique(SysBetItem sysBetItem);
}
