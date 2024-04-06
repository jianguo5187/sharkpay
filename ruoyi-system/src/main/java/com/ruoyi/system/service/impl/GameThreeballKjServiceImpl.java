package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GameThreeballKjMapper;
import com.ruoyi.system.domain.GameThreeballKj;
import com.ruoyi.system.service.IGameThreeballKjService;

/**
 * 3球开奖Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@Service
public class GameThreeballKjServiceImpl implements IGameThreeballKjService 
{
    @Autowired
    private GameThreeballKjMapper gameThreeballKjMapper;

    /**
     * 查询3球开奖
     * 
     * @param id 3球开奖主键
     * @return 3球开奖
     */
    @Override
    public GameThreeballKj selectGameThreeballKjById(Long id)
    {
        return gameThreeballKjMapper.selectGameThreeballKjById(id);
    }

    /**
     * 查询3球开奖列表
     * 
     * @param gameThreeballKj 3球开奖
     * @return 3球开奖
     */
    @Override
    public List<GameThreeballKj> selectGameThreeballKjList(GameThreeballKj gameThreeballKj)
    {
        return gameThreeballKjMapper.selectGameThreeballKjList(gameThreeballKj);
    }

    /**
     * 新增3球开奖
     * 
     * @param gameThreeballKj 3球开奖
     * @return 结果
     */
    @Override
    public int insertGameThreeballKj(GameThreeballKj gameThreeballKj)
    {
        gameThreeballKj.setCreateTime(DateUtils.getNowDate());
        return gameThreeballKjMapper.insertGameThreeballKj(gameThreeballKj);
    }

    /**
     * 修改3球开奖
     * 
     * @param gameThreeballKj 3球开奖
     * @return 结果
     */
    @Override
    public int updateGameThreeballKj(GameThreeballKj gameThreeballKj)
    {
        gameThreeballKj.setUpdateTime(DateUtils.getNowDate());
        return gameThreeballKjMapper.updateGameThreeballKj(gameThreeballKj);
    }

    /**
     * 批量删除3球开奖
     * 
     * @param ids 需要删除的3球开奖主键
     * @return 结果
     */
    @Override
    public int deleteGameThreeballKjByIds(Long[] ids)
    {
        return gameThreeballKjMapper.deleteGameThreeballKjByIds(ids);
    }

    /**
     * 删除3球开奖信息
     * 
     * @param id 3球开奖主键
     * @return 结果
     */
    @Override
    public int deleteGameThreeballKjById(Long id)
    {
        return gameThreeballKjMapper.deleteGameThreeballKjById(id);
    }

    @Override
    public GameThreeballKj selectLastRecord(Long gameId, String status) {
        return gameThreeballKjMapper.selectLastRecord(gameId,status);
    }

    @Override
    public List<GameThreeballKj> selectGameThreeballKjListWithStatusZeroAndLimit(Long gameId, Long periods, String status, String idAscFlg, String idDescFlg, Integer limitNumber) {
        return gameThreeballKjMapper.selectGameThreeballKjListWithStatusZeroAndLimit(gameId,periods,status,idAscFlg,idDescFlg,limitNumber);
    }

    @Override
    public int updateGameThreeballKjTotalAmountByPeriodId(GameThreeballKj gameThreeballKj) {
        return gameThreeballKjMapper.updateGameThreeballKjTotalAmountByPeriodId(gameThreeballKj);
    }
}
