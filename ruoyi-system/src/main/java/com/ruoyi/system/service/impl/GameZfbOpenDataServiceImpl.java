package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GameZfbOpenDataMapper;
import com.ruoyi.system.domain.GameZfbOpenData;
import com.ruoyi.system.service.IGameZfbOpenDataService;

/**
 * 动物运动会开奖历史Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-01-07
 */
@Service
public class GameZfbOpenDataServiceImpl implements IGameZfbOpenDataService 
{
    @Autowired
    private GameZfbOpenDataMapper gameZfbOpenDataMapper;

    /**
     * 查询动物运动会开奖历史
     * 
     * @param id 动物运动会开奖历史主键
     * @return 动物运动会开奖历史
     */
    @Override
    public GameZfbOpenData selectGameZfbOpenDataById(Long id)
    {
        return gameZfbOpenDataMapper.selectGameZfbOpenDataById(id);
    }

    /**
     * 查询动物运动会开奖历史列表
     * 
     * @param gameZfbOpenData 动物运动会开奖历史
     * @return 动物运动会开奖历史
     */
    @Override
    public List<GameZfbOpenData> selectGameZfbOpenDataList(GameZfbOpenData gameZfbOpenData)
    {
        return gameZfbOpenDataMapper.selectGameZfbOpenDataList(gameZfbOpenData);
    }

    /**
     * 新增动物运动会开奖历史
     * 
     * @param gameZfbOpenData 动物运动会开奖历史
     * @return 结果
     */
    @Override
    public int insertGameZfbOpenData(GameZfbOpenData gameZfbOpenData)
    {
        gameZfbOpenData.setCreateTime(DateUtils.getNowDate());
        return gameZfbOpenDataMapper.insertGameZfbOpenData(gameZfbOpenData);
    }

    /**
     * 修改动物运动会开奖历史
     * 
     * @param gameZfbOpenData 动物运动会开奖历史
     * @return 结果
     */
    @Override
    public int updateGameZfbOpenData(GameZfbOpenData gameZfbOpenData)
    {
        gameZfbOpenData.setUpdateTime(DateUtils.getNowDate());
        return gameZfbOpenDataMapper.updateGameZfbOpenData(gameZfbOpenData);
    }

    /**
     * 批量删除动物运动会开奖历史
     * 
     * @param ids 需要删除的动物运动会开奖历史主键
     * @return 结果
     */
    @Override
    public int deleteGameZfbOpenDataByIds(Long[] ids)
    {
        return gameZfbOpenDataMapper.deleteGameZfbOpenDataByIds(ids);
    }

    /**
     * 删除动物运动会开奖历史信息
     * 
     * @param id 动物运动会开奖历史主键
     * @return 结果
     */
    @Override
    public int deleteGameZfbOpenDataById(Long id)
    {
        return gameZfbOpenDataMapper.deleteGameZfbOpenDataById(id);
    }
}
