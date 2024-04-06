package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.GameThreeballKj;

/**
 * 3球开奖Service接口
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public interface IGameThreeballKjService 
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
     * 批量删除3球开奖
     * 
     * @param ids 需要删除的3球开奖主键集合
     * @return 结果
     */
    public int deleteGameThreeballKjByIds(Long[] ids);

    /**
     * 删除3球开奖信息
     * 
     * @param id 3球开奖主键
     * @return 结果
     */
    public int deleteGameThreeballKjById(Long id);

    public GameThreeballKj selectLastRecord(Long gameId,  String status);

    public List<GameThreeballKj> selectGameThreeballKjListWithStatusZeroAndLimit(Long gameId, Long periods, String status, String idAscFlg, String idDescFlg, Integer limitNumber);

    public int updateGameThreeballKjTotalAmountByPeriodId(GameThreeballKj gameThreeballKj);
}
