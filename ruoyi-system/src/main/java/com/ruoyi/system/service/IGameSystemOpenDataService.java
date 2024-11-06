package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.GameSystemOpenData;

/**
 * 系统开奖开奖历史Service接口
 * 
 * @author ruoyi
 * @date 2024-11-06
 */
public interface IGameSystemOpenDataService 
{
    /**
     * 查询系统开奖开奖历史
     * 
     * @param id 系统开奖开奖历史主键
     * @return 系统开奖开奖历史
     */
    public GameSystemOpenData selectGameSystemOpenDataById(Long id);

    /**
     * 查询系统开奖开奖历史列表
     * 
     * @param gameSystemOpenData 系统开奖开奖历史
     * @return 系统开奖开奖历史集合
     */
    public List<GameSystemOpenData> selectGameSystemOpenDataList(GameSystemOpenData gameSystemOpenData);

    /**
     * 新增系统开奖开奖历史
     * 
     * @param gameSystemOpenData 系统开奖开奖历史
     * @return 结果
     */
    public int insertGameSystemOpenData(GameSystemOpenData gameSystemOpenData);

    /**
     * 修改系统开奖开奖历史
     * 
     * @param gameSystemOpenData 系统开奖开奖历史
     * @return 结果
     */
    public int updateGameSystemOpenData(GameSystemOpenData gameSystemOpenData);

    /**
     * 批量删除系统开奖开奖历史
     * 
     * @param ids 需要删除的系统开奖开奖历史主键集合
     * @return 结果
     */
    public int deleteGameSystemOpenDataByIds(Long[] ids);

    /**
     * 删除系统开奖开奖历史信息
     * 
     * @param id 系统开奖开奖历史主键
     * @return 结果
     */
    public int deleteGameSystemOpenDataById(Long id);


    public Long selectMaxPeriodsByGameSystemMark(String gameSystemMark);

    public GameSystemOpenData selectLastRecordByGameSystemMark(String gameSystemMark);

    public GameSystemOpenData selectGamelOpenDataByGameSystemMarkAndPeriods(String gameSystemMark,Long periods, String status);

    // 获取预期开奖时间小于当前系统时间未开奖数据
    public List<GameSystemOpenData> selectNotOpenSystemOpenDataByGameSystemMark(String gameSystemMark);
}
