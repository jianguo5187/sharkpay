package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GameThreeballMixedOddsMapper;
import com.ruoyi.system.domain.GameThreeballMixedOdds;
import com.ruoyi.system.service.IGameThreeballMixedOddsService;

/**
 * 3球特殊赔率Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-08
 */
@Service
public class GameThreeballMixedOddsServiceImpl implements IGameThreeballMixedOddsService 
{
    @Autowired
    private GameThreeballMixedOddsMapper gameThreeballMixedOddsMapper;

    /**
     * 查询3球特殊赔率
     * 
     * @param mixedOddsId 3球特殊赔率主键
     * @return 3球特殊赔率
     */
    @Override
    public GameThreeballMixedOdds selectGameThreeballMixedOddsByMixedOddsId(Long mixedOddsId)
    {
        return gameThreeballMixedOddsMapper.selectGameThreeballMixedOddsByMixedOddsId(mixedOddsId);
    }

    /**
     * 查询3球特殊赔率列表
     * 
     * @param gameThreeballMixedOdds 3球特殊赔率
     * @return 3球特殊赔率
     */
    @Override
    public List<GameThreeballMixedOdds> selectGameThreeballMixedOddsList(GameThreeballMixedOdds gameThreeballMixedOdds)
    {
        return gameThreeballMixedOddsMapper.selectGameThreeballMixedOddsList(gameThreeballMixedOdds);
    }

    /**
     * 新增3球特殊赔率
     * 
     * @param gameThreeballMixedOdds 3球特殊赔率
     * @return 结果
     */
    @Override
    public int insertGameThreeballMixedOdds(GameThreeballMixedOdds gameThreeballMixedOdds)
    {
        gameThreeballMixedOdds.setCreateTime(DateUtils.getNowDate());
        return gameThreeballMixedOddsMapper.insertGameThreeballMixedOdds(gameThreeballMixedOdds);
    }

    /**
     * 修改3球特殊赔率
     * 
     * @param gameThreeballMixedOdds 3球特殊赔率
     * @return 结果
     */
    @Override
    public int updateGameThreeballMixedOdds(GameThreeballMixedOdds gameThreeballMixedOdds)
    {
        gameThreeballMixedOdds.setUpdateTime(DateUtils.getNowDate());
        return gameThreeballMixedOddsMapper.updateGameThreeballMixedOdds(gameThreeballMixedOdds);
    }

    /**
     * 批量删除3球特殊赔率
     * 
     * @param mixedOddsIds 需要删除的3球特殊赔率主键
     * @return 结果
     */
    @Override
    public int deleteGameThreeballMixedOddsByMixedOddsIds(Long[] mixedOddsIds)
    {
        return gameThreeballMixedOddsMapper.deleteGameThreeballMixedOddsByMixedOddsIds(mixedOddsIds);
    }

    /**
     * 删除3球特殊赔率信息
     * 
     * @param mixedOddsId 3球特殊赔率主键
     * @return 结果
     */
    @Override
    public int deleteGameThreeballMixedOddsByMixedOddsId(Long mixedOddsId)
    {
        return gameThreeballMixedOddsMapper.deleteGameThreeballMixedOddsByMixedOddsId(mixedOddsId);
    }

    @Override
    public GameThreeballMixedOdds selectGameThreeballMixedOddsByGameId(GameThreeballMixedOdds gameThreeballMixedOdds) {
        return gameThreeballMixedOddsMapper.selectGameThreeballMixedOddsByGameId(gameThreeballMixedOdds);
    }
}
