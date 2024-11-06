package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GameSystemOpenDataMapper;
import com.ruoyi.system.domain.GameSystemOpenData;
import com.ruoyi.system.service.IGameSystemOpenDataService;

/**
 * 系统开奖开奖历史Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-11-06
 */
@Service
public class GameSystemOpenDataServiceImpl implements IGameSystemOpenDataService 
{
    @Autowired
    private GameSystemOpenDataMapper gameSystemOpenDataMapper;

    /**
     * 查询系统开奖开奖历史
     * 
     * @param id 系统开奖开奖历史主键
     * @return 系统开奖开奖历史
     */
    @Override
    public GameSystemOpenData selectGameSystemOpenDataById(Long id)
    {
        return gameSystemOpenDataMapper.selectGameSystemOpenDataById(id);
    }

    /**
     * 查询系统开奖开奖历史列表
     * 
     * @param gameSystemOpenData 系统开奖开奖历史
     * @return 系统开奖开奖历史
     */
    @Override
    public List<GameSystemOpenData> selectGameSystemOpenDataList(GameSystemOpenData gameSystemOpenData)
    {
        return gameSystemOpenDataMapper.selectGameSystemOpenDataList(gameSystemOpenData);
    }

    /**
     * 新增系统开奖开奖历史
     * 
     * @param gameSystemOpenData 系统开奖开奖历史
     * @return 结果
     */
    @Override
    public int insertGameSystemOpenData(GameSystemOpenData gameSystemOpenData)
    {
        gameSystemOpenData.setCreateTime(DateUtils.getNowDate());
        return gameSystemOpenDataMapper.insertGameSystemOpenData(gameSystemOpenData);
    }

    /**
     * 修改系统开奖开奖历史
     * 
     * @param gameSystemOpenData 系统开奖开奖历史
     * @return 结果
     */
    @Override
    public int updateGameSystemOpenData(GameSystemOpenData gameSystemOpenData)
    {
        gameSystemOpenData.setUpdateTime(DateUtils.getNowDate());
        return gameSystemOpenDataMapper.updateGameSystemOpenData(gameSystemOpenData);
    }

    /**
     * 批量删除系统开奖开奖历史
     * 
     * @param ids 需要删除的系统开奖开奖历史主键
     * @return 结果
     */
    @Override
    public int deleteGameSystemOpenDataByIds(Long[] ids)
    {
        return gameSystemOpenDataMapper.deleteGameSystemOpenDataByIds(ids);
    }

    /**
     * 删除系统开奖开奖历史信息
     * 
     * @param id 系统开奖开奖历史主键
     * @return 结果
     */
    @Override
    public int deleteGameSystemOpenDataById(Long id)
    {
        return gameSystemOpenDataMapper.deleteGameSystemOpenDataById(id);
    }

    @Override
    public Long selectMaxPeriodsByGameSystemMark(String gameSystemMark){
        return gameSystemOpenDataMapper.selectMaxPeriodsByGameSystemMark(gameSystemMark);
    }

    @Override
    public GameSystemOpenData selectLastRecordByGameSystemMark(String gameSystemMark) {
        return gameSystemOpenDataMapper.selectLastRecordByGameSystemMark(gameSystemMark);
    }

    @Override
    public GameSystemOpenData selectGamelOpenDataByGameSystemMarkAndPeriods(String gameSystemMark, Long periods, String status) {
        return gameSystemOpenDataMapper.selectGamelOpenDataByGameSystemMarkAndPeriods(gameSystemMark,periods,status);
    }

    @Override
    public List<GameSystemOpenData> selectNotOpenSystemOpenDataByGameSystemMark(String gameSystemMark) {
        return null;
    }
}
