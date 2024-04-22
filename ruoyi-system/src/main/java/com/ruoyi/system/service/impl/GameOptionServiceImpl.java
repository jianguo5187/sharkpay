package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GameOptionMapper;
import com.ruoyi.system.domain.GameOption;
import com.ruoyi.system.service.IGameOptionService;

/**
 * 转化Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-04-22
 */
@Service
public class GameOptionServiceImpl implements IGameOptionService 
{
    @Autowired
    private GameOptionMapper gameOptionMapper;

    /**
     * 查询转化
     * 
     * @param id 转化主键
     * @return 转化
     */
    @Override
    public GameOption selectGameOptionById(Long id)
    {
        return gameOptionMapper.selectGameOptionById(id);
    }

    /**
     * 查询转化列表
     * 
     * @param gameOption 转化
     * @return 转化
     */
    @Override
    public List<GameOption> selectGameOptionList(GameOption gameOption)
    {
        return gameOptionMapper.selectGameOptionList(gameOption);
    }

    /**
     * 新增转化
     * 
     * @param gameOption 转化
     * @return 结果
     */
    @Override
    public int insertGameOption(GameOption gameOption)
    {
        gameOption.setCreateTime(DateUtils.getNowDate());
        return gameOptionMapper.insertGameOption(gameOption);
    }

    /**
     * 修改转化
     * 
     * @param gameOption 转化
     * @return 结果
     */
    @Override
    public int updateGameOption(GameOption gameOption)
    {
        gameOption.setUpdateTime(DateUtils.getNowDate());
        return gameOptionMapper.updateGameOption(gameOption);
    }

    /**
     * 批量删除转化
     * 
     * @param ids 需要删除的转化主键
     * @return 结果
     */
    @Override
    public int deleteGameOptionByIds(Long[] ids)
    {
        return gameOptionMapper.deleteGameOptionByIds(ids);
    }

    /**
     * 删除转化信息
     * 
     * @param id 转化主键
     * @return 结果
     */
    @Override
    public int deleteGameOptionById(Long id)
    {
        return gameOptionMapper.deleteGameOptionById(id);
    }
}
