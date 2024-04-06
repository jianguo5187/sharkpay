package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.GameTenballOpenData;

/**
 * 10球开奖历史Service接口
 * 
 * @author ruoyi
 * @date 2024-04-06
 */
public interface IGameTenballOpenDataService 
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
     * 批量删除10球开奖历史
     * 
     * @param ids 需要删除的10球开奖历史主键集合
     * @return 结果
     */
    public int deleteGameTenballOpenDataByIds(Long[] ids);

    /**
     * 删除10球开奖历史信息
     * 
     * @param id 10球开奖历史主键
     * @return 结果
     */
    public int deleteGameTenballOpenDataById(Long id);

    public GameTenballOpenData selectLastRecord(Long gameId);

    public List<GameTenballOpenData> selectGameTenballOpenDataListByParam(Long gameId, String idDescFlg, Integer limitNumber);

    public GameTenballOpenData selectGameTenballOpenDataByPeriods(Long gameId, Long periods);
}
