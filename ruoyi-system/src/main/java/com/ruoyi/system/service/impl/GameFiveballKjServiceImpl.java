package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GameFiveballKjMapper;
import com.ruoyi.system.domain.GameFiveballKj;
import com.ruoyi.system.service.IGameFiveballKjService;

/**
 * 5球开奖Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@Service
public class GameFiveballKjServiceImpl implements IGameFiveballKjService 
{
    @Autowired
    private GameFiveballKjMapper gameFiveballKjMapper;

    /**
     * 查询5球开奖
     * 
     * @param id 5球开奖主键
     * @return 5球开奖
     */
    @Override
    public GameFiveballKj selectGameFiveballKjById(Long id)
    {
        return gameFiveballKjMapper.selectGameFiveballKjById(id);
    }

    /**
     * 查询5球开奖列表
     * 
     * @param gameFiveballKj 5球开奖
     * @return 5球开奖
     */
    @Override
    public List<GameFiveballKj> selectGameFiveballKjList(GameFiveballKj gameFiveballKj)
    {
        return gameFiveballKjMapper.selectGameFiveballKjList(gameFiveballKj);
    }

    /**
     * 新增5球开奖
     * 
     * @param gameFiveballKj 5球开奖
     * @return 结果
     */
    @Override
    public int insertGameFiveballKj(GameFiveballKj gameFiveballKj)
    {
        gameFiveballKj.setCreateTime(DateUtils.getNowDate());
        return gameFiveballKjMapper.insertGameFiveballKj(gameFiveballKj);
    }

    /**
     * 修改5球开奖
     * 
     * @param gameFiveballKj 5球开奖
     * @return 结果
     */
    @Override
    public int updateGameFiveballKj(GameFiveballKj gameFiveballKj)
    {
        gameFiveballKj.setUpdateTime(DateUtils.getNowDate());
        return gameFiveballKjMapper.updateGameFiveballKj(gameFiveballKj);
    }

    /**
     * 批量删除5球开奖
     * 
     * @param ids 需要删除的5球开奖主键
     * @return 结果
     */
    @Override
    public int deleteGameFiveballKjByIds(Long[] ids)
    {
        return gameFiveballKjMapper.deleteGameFiveballKjByIds(ids);
    }

    /**
     * 删除5球开奖信息
     * 
     * @param id 5球开奖主键
     * @return 结果
     */
    @Override
    public int deleteGameFiveballKjById(Long id)
    {
        return gameFiveballKjMapper.deleteGameFiveballKjById(id);
    }

    @Override
    public GameFiveballKj selectLastRecord(Long gameId, String status) {
        return gameFiveballKjMapper.selectLastRecord(gameId,status);
    }

    @Override
    public List<GameFiveballKj> selectGameFiveballKjListWithStatusZeroAndLimit(Long gameId, Long periods, String status, String idAscFlg, String idDescFlg, Integer limitNumber) {
        return gameFiveballKjMapper.selectGameFiveballKjListWithStatusZeroAndLimit(gameId,periods,status,idAscFlg,idDescFlg,limitNumber);
    }

    @Override
    public int updateGameFiveballKjTotalAmountByPeriodId(GameFiveballKj gameFiveballKj) {
        return gameFiveballKjMapper.updateGameFiveballKjTotalAmountByPeriodId(gameFiveballKj);
    }

    @Override
    public GameFiveballKj selectGameFiveballKjByPeriods(Long gameId, Long periods) {
        return gameFiveballKjMapper.selectGameFiveballKjByPeriods(gameId,periods);
    }

    @Override
    public List<GameFiveballKj> selectFiveBallsGameResult(Long gameId, Integer pageNumber, Integer pageRowCount) {
        return gameFiveballKjMapper.selectFiveBallsGameResult(gameId,pageNumber,pageRowCount);
    }
}
