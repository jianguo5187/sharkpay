package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.GameThreeballOpenData;

/**
 * 3球开奖历史Service接口
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public interface IGameThreeballOpenDataService 
{
    /**
     * 查询3球开奖历史
     * 
     * @param id 3球开奖历史主键
     * @return 3球开奖历史
     */
    public GameThreeballOpenData selectGameThreeballOpenDataById(Long id);

    /**
     * 查询3球开奖历史列表
     * 
     * @param gameThreeballOpenData 3球开奖历史
     * @return 3球开奖历史集合
     */
    public List<GameThreeballOpenData> selectGameThreeballOpenDataList(GameThreeballOpenData gameThreeballOpenData);

    /**
     * 新增3球开奖历史
     * 
     * @param gameThreeballOpenData 3球开奖历史
     * @return 结果
     */
    public int insertGameThreeballOpenData(GameThreeballOpenData gameThreeballOpenData);

    /**
     * 修改3球开奖历史
     * 
     * @param gameThreeballOpenData 3球开奖历史
     * @return 结果
     */
    public int updateGameThreeballOpenData(GameThreeballOpenData gameThreeballOpenData);

    /**
     * 批量删除3球开奖历史
     * 
     * @param ids 需要删除的3球开奖历史主键集合
     * @return 结果
     */
    public int deleteGameThreeballOpenDataByIds(Long[] ids);

    /**
     * 删除3球开奖历史信息
     * 
     * @param id 3球开奖历史主键
     * @return 结果
     */
    public int deleteGameThreeballOpenDataById(Long id);

    public GameThreeballOpenData selectLastRecord(Long gameId);

    public List<GameThreeballOpenData> selectGameThreeballOpenDataListByParam(Long gameId, String idDescFlg, Integer limitNumber);

    public GameThreeballOpenData selectGameThreeballOpenDataByPeriods(Long gameId, Long periods,String status);

    public List<GameThreeballOpenData> selectThreeballPreOpenData();

    public GameThreeballOpenData selectLastOpenDataByMinPeriods(Long gameId, Long periods, String status);
}
