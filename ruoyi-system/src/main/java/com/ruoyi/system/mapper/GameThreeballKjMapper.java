package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.GameThreeballKj;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 3球开奖Mapper接口
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public interface GameThreeballKjMapper 
{
    /**
     * 查询3球开奖
     * 
     * @param id 3球开奖主键
     * @return 3球开奖
     */
    public GameThreeballKj selectGameThreeballKjById(Long id);

    /**
     * 查询3球开奖列表
     * 
     * @param gameThreeballKj 3球开奖
     * @return 3球开奖集合
     */
    public List<GameThreeballKj> selectGameThreeballKjList(GameThreeballKj gameThreeballKj);

    /**
     * 新增3球开奖
     * 
     * @param gameThreeballKj 3球开奖
     * @return 结果
     */
    public int insertGameThreeballKj(GameThreeballKj gameThreeballKj);

    /**
     * 修改3球开奖
     * 
     * @param gameThreeballKj 3球开奖
     * @return 结果
     */
    public int updateGameThreeballKj(GameThreeballKj gameThreeballKj);

    /**
     * 删除3球开奖
     * 
     * @param id 3球开奖主键
     * @return 结果
     */
    public int deleteGameThreeballKjById(Long id);

    /**
     * 批量删除3球开奖
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGameThreeballKjByIds(Long[] ids);

    public GameThreeballKj selectLastRecord(@Param("gameId") Long gameId, @Param("status") String status);

    public List<GameThreeballKj> selectGameThreeballKjListWithStatusZeroAndLimit(@Param("gameId") Long gameId, @Param("periods") Long periods, @Param("status") String status, @Param("idAscFlg") String idAscFlg, @Param("idDescFlg") String idDescFlg, @Param("limitNumber") Integer limitNumber);

    public int updateGameThreeballKjTotalAmountByPeriodId(GameThreeballKj gameThreeballKj);

    public GameThreeballKj selectGameThreeballKjByPeriods(@Param("gameId") Long gameId, @Param("periods")Long periods);

    public List<GameThreeballKj> selectThreeBallsGameResult(@Param("gameId") Long gameId, @Param("pageNumber") Integer pageNumber, @Param("pageRowCount") Integer pageRowCount);

}
