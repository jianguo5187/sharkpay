package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.GameFiveballOpenData;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 5球开奖历史Mapper接口
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public interface GameFiveballOpenDataMapper 
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
     * 删除5球开奖历史
     * 
     * @param id 5球开奖历史主键
     * @return 结果
     */
    public int deleteGameFiveballOpenDataById(Long id);

    /**
     * 批量删除5球开奖历史
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGameFiveballOpenDataByIds(Long[] ids);

    public GameFiveballOpenData selectLastRecord(Long gameId);

    public List<GameFiveballOpenData> selectGameFiveballOpenDataListByParam(@Param("gameId") Long gameId, @Param("idDescFlg") String idDescFlg, @Param("limitNumber") Integer limitNumber);

    public GameFiveballOpenData selectGameFiveballOpenDataByPeriods(@Param("gameId") Long gameId, @Param("periods")Long periods, @Param("status") String status);

    public List<GameFiveballOpenData> selectFiveballPreOpenData();

    public GameFiveballOpenData selectLastOpenDataByMinPeriods(@Param("gameId") Long gameId, @Param("periods")Long periods, @Param("status") String status);
}
