package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GameTenballKjMapper;
import com.ruoyi.system.domain.GameTenballKj;
import com.ruoyi.system.service.IGameTenballKjService;

/**
 * 10球开奖开奖Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@Service
public class GameTenballKjServiceImpl implements IGameTenballKjService 
{
    @Autowired
    private GameTenballKjMapper gameTenballKjMapper;

    /**
     * 查询10球开奖开奖
     * 
     * @param id 10球开奖开奖主键
     * @return 10球开奖开奖
     */
    @Override
    public GameTenballKj selectGameTenballKjById(Long id)
    {
        return gameTenballKjMapper.selectGameTenballKjById(id);
    }

    /**
     * 查询10球开奖开奖列表
     * 
     * @param gameTenballKj 10球开奖开奖
     * @return 10球开奖开奖
     */
    @Override
    public List<GameTenballKj> selectGameTenballKjList(GameTenballKj gameTenballKj)
    {
        return gameTenballKjMapper.selectGameTenballKjList(gameTenballKj);
    }

    /**
     * 新增10球开奖开奖
     * 
     * @param gameTenballKj 10球开奖开奖
     * @return 结果
     */
    @Override
    public int insertGameTenballKj(GameTenballKj gameTenballKj)
    {
        gameTenballKj.setCreateTime(DateUtils.getNowDate());
        return gameTenballKjMapper.insertGameTenballKj(gameTenballKj);
    }

    /**
     * 修改10球开奖开奖
     * 
     * @param gameTenballKj 10球开奖开奖
     * @return 结果
     */
    @Override
    public int updateGameTenballKj(GameTenballKj gameTenballKj)
    {
        gameTenballKj.setUpdateTime(DateUtils.getNowDate());
        return gameTenballKjMapper.updateGameTenballKj(gameTenballKj);
    }

    /**
     * 批量删除10球开奖开奖
     * 
     * @param ids 需要删除的10球开奖开奖主键
     * @return 结果
     */
    @Override
    public int deleteGameTenballKjByIds(Long[] ids)
    {
        return gameTenballKjMapper.deleteGameTenballKjByIds(ids);
    }

    /**
     * 删除10球开奖开奖信息
     * 
     * @param id 10球开奖开奖主键
     * @return 结果
     */
    @Override
    public int deleteGameTenballKjById(Long id)
    {
        return gameTenballKjMapper.deleteGameTenballKjById(id);
    }

    @Override
    public GameTenballKj selectLastRecord(Long gameId, String status) {
        return gameTenballKjMapper.selectLastRecord(gameId,status);
    }

    @Override
    public List<GameTenballKj> selectGameTenballKjListWithStatusZeroAndLimit(Long gameId, Long periods, String status, String idAscFlg, String idDescFlg, Integer limitNumber) {
        return gameTenballKjMapper.selectGameTenballKjListWithStatusZeroAndLimit(gameId,periods,status,idAscFlg,idDescFlg,limitNumber);
    }

    @Override
    public int updateGameTenballKjTotalAmountByPeriodId(GameTenballKj gameTenballKj) {
        return gameTenballKjMapper.updateGameTenballKjTotalAmountByPeriodId(gameTenballKj);
    }

    @Override
    public GameTenballKj selectGameTenballKjByPeriods(Long gameId, Long periods) {
        return gameTenballKjMapper.selectGameTenballKjByPeriods(gameId,periods);
    }
}
