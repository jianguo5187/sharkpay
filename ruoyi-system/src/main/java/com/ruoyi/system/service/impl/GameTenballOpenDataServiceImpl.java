package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GameTenballOpenDataMapper;
import com.ruoyi.system.domain.GameTenballOpenData;
import com.ruoyi.system.service.IGameTenballOpenDataService;

/**
 * 10球开奖历史Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
@Service
public class GameTenballOpenDataServiceImpl implements IGameTenballOpenDataService 
{
    @Autowired
    private GameTenballOpenDataMapper gameTenballOpenDataMapper;

    /**
     * 查询10球开奖历史
     * 
     * @param id 10球开奖历史主键
     * @return 10球开奖历史
     */
    @Override
    public GameTenballOpenData selectGameTenballOpenDataById(Long id)
    {
        return gameTenballOpenDataMapper.selectGameTenballOpenDataById(id);
    }

    /**
     * 查询10球开奖历史列表
     * 
     * @param gameTenballOpenData 10球开奖历史
     * @return 10球开奖历史
     */
    @Override
    public List<GameTenballOpenData> selectGameTenballOpenDataList(GameTenballOpenData gameTenballOpenData)
    {
        return gameTenballOpenDataMapper.selectGameTenballOpenDataList(gameTenballOpenData);
    }

    /**
     * 新增10球开奖历史
     * 
     * @param gameTenballOpenData 10球开奖历史
     * @return 结果
     */
    @Override
    public int insertGameTenballOpenData(GameTenballOpenData gameTenballOpenData)
    {
        gameTenballOpenData.setCreateTime(DateUtils.getNowDate());
        return gameTenballOpenDataMapper.insertGameTenballOpenData(gameTenballOpenData);
    }

    /**
     * 修改10球开奖历史
     * 
     * @param gameTenballOpenData 10球开奖历史
     * @return 结果
     */
    @Override
    public int updateGameTenballOpenData(GameTenballOpenData gameTenballOpenData)
    {
        gameTenballOpenData.setUpdateTime(DateUtils.getNowDate());
        return gameTenballOpenDataMapper.updateGameTenballOpenData(gameTenballOpenData);
    }

    /**
     * 批量删除10球开奖历史
     * 
     * @param ids 需要删除的10球开奖历史主键
     * @return 结果
     */
    @Override
    public int deleteGameTenballOpenDataByIds(Long[] ids)
    {
        return gameTenballOpenDataMapper.deleteGameTenballOpenDataByIds(ids);
    }

    /**
     * 删除10球开奖历史信息
     * 
     * @param id 10球开奖历史主键
     * @return 结果
     */
    @Override
    public int deleteGameTenballOpenDataById(Long id)
    {
        return gameTenballOpenDataMapper.deleteGameTenballOpenDataById(id);
    }

    @Override
    public GameTenballOpenData selectLastRecord(Long gameId) {
        return gameTenballOpenDataMapper.selectLastRecord(gameId);
    }

    @Override
    public List<GameTenballOpenData> selectGameTenballOpenDataListByParam(Long gameId, String idDescFlg, Integer limitNumber) {
        return gameTenballOpenDataMapper.selectGameTenballOpenDataListByParam(gameId,idDescFlg,limitNumber);
    }

    @Override
    public GameTenballOpenData selectGameTenballOpenDataByPeriods(Long gameId, Long periods) {
        return gameTenballOpenDataMapper.selectGameTenballOpenDataByPeriods(gameId,periods);
    }
}
