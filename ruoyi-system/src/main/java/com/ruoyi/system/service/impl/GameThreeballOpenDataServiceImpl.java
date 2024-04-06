package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GameThreeballOpenDataMapper;
import com.ruoyi.system.domain.GameThreeballOpenData;
import com.ruoyi.system.service.IGameThreeballOpenDataService;

/**
 * 3球开奖历史Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@Service
public class GameThreeballOpenDataServiceImpl implements IGameThreeballOpenDataService 
{
    @Autowired
    private GameThreeballOpenDataMapper gameThreeballOpenDataMapper;

    /**
     * 查询3球开奖历史
     * 
     * @param id 3球开奖历史主键
     * @return 3球开奖历史
     */
    @Override
    public GameThreeballOpenData selectGameThreeballOpenDataById(Long id)
    {
        return gameThreeballOpenDataMapper.selectGameThreeballOpenDataById(id);
    }

    /**
     * 查询3球开奖历史列表
     * 
     * @param gameThreeballOpenData 3球开奖历史
     * @return 3球开奖历史
     */
    @Override
    public List<GameThreeballOpenData> selectGameThreeballOpenDataList(GameThreeballOpenData gameThreeballOpenData)
    {
        return gameThreeballOpenDataMapper.selectGameThreeballOpenDataList(gameThreeballOpenData);
    }

    /**
     * 新增3球开奖历史
     * 
     * @param gameThreeballOpenData 3球开奖历史
     * @return 结果
     */
    @Override
    public int insertGameThreeballOpenData(GameThreeballOpenData gameThreeballOpenData)
    {
        gameThreeballOpenData.setCreateTime(DateUtils.getNowDate());
        return gameThreeballOpenDataMapper.insertGameThreeballOpenData(gameThreeballOpenData);
    }

    /**
     * 修改3球开奖历史
     * 
     * @param gameThreeballOpenData 3球开奖历史
     * @return 结果
     */
    @Override
    public int updateGameThreeballOpenData(GameThreeballOpenData gameThreeballOpenData)
    {
        gameThreeballOpenData.setUpdateTime(DateUtils.getNowDate());
        return gameThreeballOpenDataMapper.updateGameThreeballOpenData(gameThreeballOpenData);
    }

    /**
     * 批量删除3球开奖历史
     * 
     * @param ids 需要删除的3球开奖历史主键
     * @return 结果
     */
    @Override
    public int deleteGameThreeballOpenDataByIds(Long[] ids)
    {
        return gameThreeballOpenDataMapper.deleteGameThreeballOpenDataByIds(ids);
    }

    /**
     * 删除3球开奖历史信息
     * 
     * @param id 3球开奖历史主键
     * @return 结果
     */
    @Override
    public int deleteGameThreeballOpenDataById(Long id)
    {
        return gameThreeballOpenDataMapper.deleteGameThreeballOpenDataById(id);
    }

    @Override
    public GameThreeballOpenData selectLastRecord(Long gameId) {
        return gameThreeballOpenDataMapper.selectLastRecord(gameId);
    }

    @Override
    public List<GameThreeballOpenData> selectGameThreeballOpenDataListByParam(Long gameId, String idDescFlg, Integer limitNumber) {
        return gameThreeballOpenDataMapper.selectGameThreeballOpenDataListByParam(gameId,idDescFlg,limitNumber);
    }

    @Override
    public GameThreeballOpenData selectGameThreeballOpenDataByPeriods(Long gameId, Long periods) {
        return gameThreeballOpenDataMapper.selectGameThreeballOpenDataByPeriods(gameId,periods);
    }
}
