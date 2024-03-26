package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysBetItemMapper;
import com.ruoyi.system.domain.SysBetItem;
import com.ruoyi.system.service.ISysBetItemService;

/**
 * 游戏投注项Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-06
 */
@Service
public class SysBetItemServiceImpl implements ISysBetItemService 
{
    @Autowired
    private SysBetItemMapper sysBetItemMapper;

    /**
     * 查询游戏投注项
     * 
     * @param betItemId 游戏投注项主键
     * @return 游戏投注项
     */
    @Override
    public SysBetItem selectSysBetItemByBetItemId(Long betItemId)
    {
        return sysBetItemMapper.selectSysBetItemByBetItemId(betItemId);
    }

    /**
     * 查询游戏投注项列表
     * 
     * @param sysBetItem 游戏投注项
     * @return 游戏投注项
     */
    @Override
    public List<SysBetItem> selectSysBetItemList(SysBetItem sysBetItem)
    {
        return sysBetItemMapper.selectSysBetItemList(sysBetItem);
    }

    /**
     * 新增游戏投注项
     * 
     * @param sysBetItem 游戏投注项
     * @return 结果
     */
    @Override
    public int insertSysBetItem(SysBetItem sysBetItem)
    {
        sysBetItem.setCreateTime(DateUtils.getNowDate());
        return sysBetItemMapper.insertSysBetItem(sysBetItem);
    }

    /**
     * 修改游戏投注项
     * 
     * @param sysBetItem 游戏投注项
     * @return 结果
     */
    @Override
    public int updateSysBetItem(SysBetItem sysBetItem)
    {
        sysBetItem.setUpdateTime(DateUtils.getNowDate());
        return sysBetItemMapper.updateSysBetItem(sysBetItem);
    }

    /**
     * 批量删除游戏投注项
     * 
     * @param betItemIds 需要删除的游戏投注项主键
     * @return 结果
     */
    @Override
    public int deleteSysBetItemByBetItemIds(Long[] betItemIds)
    {
        return sysBetItemMapper.deleteSysBetItemByBetItemIds(betItemIds);
    }

    /**
     * 删除游戏投注项信息
     * 
     * @param betItemId 游戏投注项主键
     * @return 结果
     */
    @Override
    public int deleteSysBetItemByBetItemId(Long betItemId)
    {
        return sysBetItemMapper.deleteSysBetItemByBetItemId(betItemId);
    }

    @Override
    public boolean checkBetItemCodeUnique(SysBetItem sysBetItem) {
        SysBetItem betItem = sysBetItemMapper.checkBetItemCodeUnique(sysBetItem.getGameId(), sysBetItem.getBetItemCode());

        if (StringUtils.isNotNull(betItem))
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }
}
