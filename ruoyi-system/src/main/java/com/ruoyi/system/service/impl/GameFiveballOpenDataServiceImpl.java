package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GameFiveballOpenDataMapper;
import com.ruoyi.system.domain.GameFiveballOpenData;
import com.ruoyi.system.service.IGameFiveballOpenDataService;

/**
 * 5球开奖历史Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@Service
public class GameFiveballOpenDataServiceImpl implements IGameFiveballOpenDataService 
{
    @Autowired
    private GameFiveballOpenDataMapper gameFiveballOpenDataMapper;

    /**
     * 查询5球开奖历史
     * 
     * @param id 5球开奖历史主键
     * @return 5球开奖历史
     */
    @Override
    public GameFiveballOpenData selectGameFiveballOpenDataById(Long id)
    {
        return gameFiveballOpenDataMapper.selectGameFiveballOpenDataById(id);
    }

    /**
     * 查询5球开奖历史列表
     * 
     * @param gameFiveballOpenData 5球开奖历史
     * @return 5球开奖历史
     */
    @Override
    public List<GameFiveballOpenData> selectGameFiveballOpenDataList(GameFiveballOpenData gameFiveballOpenData)
    {
        return gameFiveballOpenDataMapper.selectGameFiveballOpenDataList(gameFiveballOpenData);
    }

    /**
     * 新增5球开奖历史
     * 
     * @param gameFiveballOpenData 5球开奖历史
     * @return 结果
     */
    @Override
    public int insertGameFiveballOpenData(GameFiveballOpenData gameFiveballOpenData)
    {
        gameFiveballOpenData.setCreateTime(DateUtils.getNowDate());
        return gameFiveballOpenDataMapper.insertGameFiveballOpenData(gameFiveballOpenData);
    }

    /**
     * 修改5球开奖历史
     * 
     * @param gameFiveballOpenData 5球开奖历史
     * @return 结果
     */
    @Override
    public int updateGameFiveballOpenData(GameFiveballOpenData gameFiveballOpenData)
    {
        gameFiveballOpenData.setUpdateTime(DateUtils.getNowDate());
        return gameFiveballOpenDataMapper.updateGameFiveballOpenData(gameFiveballOpenData);
    }

    /**
     * 批量删除5球开奖历史
     * 
     * @param ids 需要删除的5球开奖历史主键
     * @return 结果
     */
    @Override
    public int deleteGameFiveballOpenDataByIds(Long[] ids)
    {
        return gameFiveballOpenDataMapper.deleteGameFiveballOpenDataByIds(ids);
    }

    /**
     * 删除5球开奖历史信息
     * 
     * @param id 5球开奖历史主键
     * @return 结果
     */
    @Override
    public int deleteGameFiveballOpenDataById(Long id)
    {
        return gameFiveballOpenDataMapper.deleteGameFiveballOpenDataById(id);
    }

    @Override
    public GameFiveballOpenData selectLastRecord(Long gameId) {
        return gameFiveballOpenDataMapper.selectLastRecord(gameId);
    }

    @Override
    public List<GameFiveballOpenData> selectGameFiveballOpenDataListByParam(Long gameId, String idDescFlg, Integer limitNumber) {
        return gameFiveballOpenDataMapper.selectGameFiveballOpenDataListByParam(gameId,idDescFlg,limitNumber);
    }

    @Override
    public GameFiveballOpenData selectGameFiveballOpenDataByPeriods(Long gameId, Long periods) {
        return gameFiveballOpenDataMapper.selectGameFiveballOpenDataByPeriods(gameId,periods);
    }
}
