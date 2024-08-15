package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.GameTenballOpenData;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 10球开奖历史Mapper接口
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public interface GameTenballOpenDataMapper 
{
    /**
     * 查询10球开奖历史
     * 
     * @param id 10球开奖历史主键
     * @return 10球开奖历史
     */
    public GameTenballOpenData selectGameTenballOpenDataById(Long id);

    /**
     * 查询10球开奖历史列表
     * 
     * @param gameTenballOpenData 10球开奖历史
     * @return 10球开奖历史集合
     */
    public List<GameTenballOpenData> selectGameTenballOpenDataList(GameTenballOpenData gameTenballOpenData);

    /**
     * 新增10球开奖历史
     * 
     * @param gameTenballOpenData 10球开奖历史
     * @return 结果
     */
    public int insertGameTenballOpenData(GameTenballOpenData gameTenballOpenData);

    /**
     * 修改10球开奖历史
     * 
     * @param gameTenballOpenData 10球开奖历史
     * @return 结果
     */
    public int updateGameTenballOpenData(GameTenballOpenData gameTenballOpenData);

    /**
     * 删除10球开奖历史
     * 
     * @param id 10球开奖历史主键
     * @return 结果
     */
    public int deleteGameTenballOpenDataById(Long id);

    /**
     * 批量删除10球开奖历史
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGameTenballOpenDataByIds(Long[] ids);

    public GameTenballOpenData selectLastRecord(Long gameId);

    public List<GameTenballOpenData> selectGameTenballOpenDataListByParam(@Param("gameId") Long gameId, @Param("idDescFlg") String idDescFlg, @Param("limitNumber") Integer limitNumber);

    public GameTenballOpenData selectGameTenballOpenDataByPeriods(@Param("gameId") Long gameId, @Param("periods")Long periods, @Param("status") String status);

    public List<GameTenballOpenData> selectTenballPreOpenData();

    public GameTenballOpenData selectLastOpenDataByMinPeriods(@Param("gameId") Long gameId, @Param("periods")Long periods, @Param("status") String status);
}
