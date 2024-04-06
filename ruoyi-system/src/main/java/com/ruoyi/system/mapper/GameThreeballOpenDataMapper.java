package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.GameThreeballOpenData;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 3球开奖历史Mapper接口
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public interface GameThreeballOpenDataMapper 
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
     * 删除3球开奖历史
     * 
     * @param id 3球开奖历史主键
     * @return 结果
     */
    public int deleteGameThreeballOpenDataById(Long id);

    /**
     * 批量删除3球开奖历史
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGameThreeballOpenDataByIds(Long[] ids);

    public GameThreeballOpenData selectLastRecord(Long gameId);

    public List<GameThreeballOpenData> selectGameThreeballOpenDataListByParam(@Param("gameId") Long gameId, @Param("idDescFlg") String idDescFlg, @Param("limitNumber") Integer limitNumber);

    public GameThreeballOpenData selectGameThreeballOpenDataByPeriods(@Param("gameId") Long gameId, @Param("periods")Long periods);
}
