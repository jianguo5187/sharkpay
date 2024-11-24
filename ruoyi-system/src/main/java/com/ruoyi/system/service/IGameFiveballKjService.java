package com.ruoyi.system.service;

import com.ruoyi.system.domain.GameFiveballKj;

import java.util.List;

/**
 * 5球开奖Service接口
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public interface IGameFiveballKjService 
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
     * 批量删除5球开奖
     * 
     * @param ids 需要删除的5球开奖主键集合
     * @return 结果
     */
    public int deleteGameFiveballKjByIds(Long[] ids);

    /**
     * 删除5球开奖信息
     * 
     * @param id 5球开奖主键
     * @return 结果
     */
    public int deleteGameFiveballKjById(Long id);

    public GameFiveballKj selectLastRecord(Long gameId,  String status);

    public List<GameFiveballKj> selectGameFiveballKjListWithStatusZeroAndLimit(Long gameId, Long periods, String status, String idAscFlg, String idDescFlg, Integer limitNumber);

    public int updateGameFiveballKjTotalAmountByPeriodId(GameFiveballKj gameFiveballKj);

    public GameFiveballKj selectGameFiveballKjByPeriods(Long gameId, Long periods);

    public List<GameFiveballKj> selectFiveBallsGameResult(Long gameId,Integer pageNumber,Integer pageRowCount,String filterDate);

    public List<GameFiveballKj> selectKajiangPeriods(Long gameId);
}
