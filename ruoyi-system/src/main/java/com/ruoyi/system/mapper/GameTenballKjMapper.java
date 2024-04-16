package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.GameTenballKj;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 10球开奖开奖Mapper接口
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public interface GameTenballKjMapper 
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
     * 删除10球开奖开奖
     * 
     * @param id 10球开奖开奖主键
     * @return 结果
     */
    public int deleteGameTenballKjById(Long id);

    /**
     * 批量删除10球开奖开奖
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGameTenballKjByIds(Long[] ids);

    public GameTenballKj selectLastRecord(@Param("gameId") Long gameId, @Param("status") String status);

    public List<GameTenballKj> selectGameTenballKjListWithStatusZeroAndLimit(@Param("gameId") Long gameId, @Param("periods") Long periods, @Param("status") String status, @Param("idAscFlg") String idAscFlg, @Param("idDescFlg") String idDescFlg, @Param("limitNumber") Integer limitNumber);

    public int updateGameTenballKjTotalAmountByPeriodId(GameTenballKj gameTenballKj);

    public GameTenballKj selectGameTenballKjByPeriods(@Param("gameId") Long gameId, @Param("periods")Long periods);

    public List<GameTenballKj> selectTenBallsGameResult(@Param("gameId") Long gameId, @Param("pageNumber") Integer pageNumber, @Param("pageRowCount") Integer pageRowCount);

}
