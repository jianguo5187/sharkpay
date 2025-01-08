package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GameZfbKjMapper;
import com.ruoyi.system.domain.GameZfbKj;
import com.ruoyi.system.service.IGameZfbKjService;

/**
 * 动物运动会开奖Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-01-07
 */
@Service
public class GameZfbKjServiceImpl implements IGameZfbKjService 
{
    @Autowired
    private GameZfbKjMapper gameZfbKjMapper;

    /**
     * 查询动物运动会开奖
     * 
     * @param id 动物运动会开奖主键
     * @return 动物运动会开奖
     */
    @Override
    public GameZfbKj selectGameZfbKjById(Long id)
    {
        return gameZfbKjMapper.selectGameZfbKjById(id);
    }

    /**
     * 查询动物运动会开奖列表
     * 
     * @param gameZfbKj 动物运动会开奖
     * @return 动物运动会开奖
     */
    @Override
    public List<GameZfbKj> selectGameZfbKjList(GameZfbKj gameZfbKj)
    {
        return gameZfbKjMapper.selectGameZfbKjList(gameZfbKj);
    }

    /**
     * 新增动物运动会开奖
     * 
     * @param gameZfbKj 动物运动会开奖
     * @return 结果
     */
    @Override
    public int insertGameZfbKj(GameZfbKj gameZfbKj)
    {
        gameZfbKj.setCreateTime(DateUtils.getNowDate());
        return gameZfbKjMapper.insertGameZfbKj(gameZfbKj);
    }

    /**
     * 修改动物运动会开奖
     * 
     * @param gameZfbKj 动物运动会开奖
     * @return 结果
     */
    @Override
    public int updateGameZfbKj(GameZfbKj gameZfbKj)
    {
        gameZfbKj.setUpdateTime(DateUtils.getNowDate());
        return gameZfbKjMapper.updateGameZfbKj(gameZfbKj);
    }

    /**
     * 批量删除动物运动会开奖
     * 
     * @param ids 需要删除的动物运动会开奖主键
     * @return 结果
     */
    @Override
    public int deleteGameZfbKjByIds(Long[] ids)
    {
        return gameZfbKjMapper.deleteGameZfbKjByIds(ids);
    }

    /**
     * 删除动物运动会开奖信息
     * 
     * @param id 动物运动会开奖主键
     * @return 结果
     */
    @Override
    public int deleteGameZfbKjById(Long id)
    {
        return gameZfbKjMapper.deleteGameZfbKjById(id);
    }
}
