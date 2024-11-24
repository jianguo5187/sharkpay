package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.GameTenballKj;

/**
 * 10球开奖开奖Service接口
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public interface IGameTenballKjService 
{
    /**
     * 查询10球开奖开奖
     * 
     * @param id 10球开奖开奖主键
     * @return 10球开奖开奖
     */
    public GameTenballKj selectGameTenballKjById(Long id);

    /**
     * 查询10球开奖开奖列表
     * 
     * @param gameTenballKj 10球开奖开奖
     * @return 10球开奖开奖集合
     */
    public List<GameTenballKj> selectGameTenballKjList(GameTenballKj gameTenballKj);

    /**
     * 新增10球开奖开奖
     * 
     * @param gameTenballKj 10球开奖开奖
     * @return 结果
     */
    public int insertGameTenballKj(GameTenballKj gameTenballKj);

    /**
     * 修改10球开奖开奖
     * 
     * @param gameTenballKj 10球开奖开奖
     * @return 结果
     */
    public int updateGameTenballKj(GameTenballKj gameTenballKj);

    /**
     * 批量删除10球开奖开奖
     * 
     * @param ids 需要删除的10球开奖开奖主键集合
     * @return 结果
     */
    public int deleteGameTenballKjByIds(Long[] ids);

    /**
     * 删除10球开奖开奖信息
     * 
     * @param id 10球开奖开奖主键
     * @return 结果
     */
    public int deleteGameTenballKjById(Long id);

    public GameTenballKj selectLastRecord(Long gameId,  String status);

    public List<GameTenballKj> selectGameTenballKjListWithStatusZeroAndLimit(Long gameId, Long periods, String status, String idAscFlg, String idDescFlg, Integer limitNumber);

    public int updateGameTenballKjTotalAmountByPeriodId(GameTenballKj gameTenballKj);

    public GameTenballKj selectGameTenballKjByPeriods(Long gameId, Long periods);

    public List<GameTenballKj> selectTenBallsGameResult(Long gameId,Integer pageNumber,Integer pageRowCount,String filterDate);

    public List<GameTenballKj> selectKajiangPeriods(Long gameId);
}
