package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.GameFiveballKj;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 5球开奖Mapper接口
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public interface GameFiveballKjMapper 
{
    /**
     * 查询5球开奖
     * 
     * @param id 5球开奖主键
     * @return 5球开奖
     */
    public GameFiveballKj selectGameFiveballKjById(Long id);

    /**
     * 查询5球开奖列表
     * 
     * @param gameFiveballKj 5球开奖
     * @return 5球开奖集合
     */
    public List<GameFiveballKj> selectGameFiveballKjList(GameFiveballKj gameFiveballKj);

    /**
     * 新增5球开奖
     * 
     * @param gameFiveballKj 5球开奖
     * @return 结果
     */
    public int insertGameFiveballKj(GameFiveballKj gameFiveballKj);

    /**
     * 修改5球开奖
     * 
     * @param gameFiveballKj 5球开奖
     * @return 结果
     */
    public int updateGameFiveballKj(GameFiveballKj gameFiveballKj);

    /**
     * 删除5球开奖
     * 
     * @param id 5球开奖主键
     * @return 结果
     */
    public int deleteGameFiveballKjById(Long id);

    /**
     * 批量删除5球开奖
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGameFiveballKjByIds(Long[] ids);

    public GameFiveballKj selectLastRecord(@Param("gameId") Long gameId, @Param("status") String status);

    public List<GameFiveballKj> selectGameFiveballKjListWithStatusZeroAndLimit(@Param("gameId") Long gameId, @Param("periods") Long periods, @Param("status") String status, @Param("idAscFlg") String idAscFlg, @Param("idDescFlg") String idDescFlg, @Param("limitNumber") Integer limitNumber);

    public int updateGameFiveballKjTotalAmountByPeriodId(GameFiveballKj gameFiveballKj);

    public GameFiveballKj selectGameFiveballKjByPeriods(@Param("gameId") Long gameId, @Param("periods")Long periods);

    public List<GameFiveballKj> selectFiveBallsGameResult(@Param("gameId") Long gameId, @Param("pageNumber") Integer pageNumber, @Param("pageRowCount") Integer pageRowCount, @Param("filterDate") String filterDate);

    public List<GameFiveballKj> selectKajiangPeriods(Long gameId);
}
