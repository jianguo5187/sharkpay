package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.GameFiveballOpenData;

/**
 * 5球开奖历史Service接口
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public interface IGameFiveballOpenDataService 
{
    /**
     * 查询5球开奖历史
     * 
     * @param id 5球开奖历史主键
     * @return 5球开奖历史
     */
    public GameFiveballOpenData selectGameFiveballOpenDataById(Long id);

    /**
     * 查询5球开奖历史列表
     * 
     * @param gameFiveballOpenData 5球开奖历史
     * @return 5球开奖历史集合
     */
    public List<GameFiveballOpenData> selectGameFiveballOpenDataList(GameFiveballOpenData gameFiveballOpenData);

    /**
     * 新增5球开奖历史
     * 
     * @param gameFiveballOpenData 5球开奖历史
     * @return 结果
     */
    public int insertGameFiveballOpenData(GameFiveballOpenData gameFiveballOpenData);

    /**
     * 修改5球开奖历史
     * 
     * @param gameFiveballOpenData 5球开奖历史
     * @return 结果
     */
    public int updateGameFiveballOpenData(GameFiveballOpenData gameFiveballOpenData);

    /**
     * 批量删除5球开奖历史
     * 
     * @param ids 需要删除的5球开奖历史主键集合
     * @return 结果
     */
    public int deleteGameFiveballOpenDataByIds(Long[] ids);

    /**
     * 删除5球开奖历史信息
     * 
     * @param id 5球开奖历史主键
     * @return 结果
     */
    public int deleteGameFiveballOpenDataById(Long id);

    public GameFiveballOpenData selectLastRecord(Long gameId);

    public List<GameFiveballOpenData> selectGameFiveballOpenDataListByParam(Long gameId, String idDescFlg, Integer limitNumber);

    public GameFiveballOpenData selectGameFiveballOpenDataByPeriods(Long gameId, Long periods, String status);

    public List<GameFiveballOpenData> selectFiveballPreOpenData();

    public GameFiveballOpenData selectLastOpenDataByMinPeriods(Long gameId, Long periods, String status);
}
