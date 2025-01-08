package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.GameZfbOpenData;

/**
 * 动物运动会开奖历史Service接口
 * 
 * @author ruoyi
 * @date 2025-01-07
 */
public interface IGameZfbOpenDataService 
{
    /**
     * 查询动物运动会开奖历史
     * 
     * @param id 动物运动会开奖历史主键
     * @return 动物运动会开奖历史
     */
    public GameZfbOpenData selectGameZfbOpenDataById(Long id);

    /**
     * 查询动物运动会开奖历史列表
     * 
     * @param gameZfbOpenData 动物运动会开奖历史
     * @return 动物运动会开奖历史集合
     */
    public List<GameZfbOpenData> selectGameZfbOpenDataList(GameZfbOpenData gameZfbOpenData);

    /**
     * 新增动物运动会开奖历史
     * 
     * @param gameZfbOpenData 动物运动会开奖历史
     * @return 结果
     */
    public int insertGameZfbOpenData(GameZfbOpenData gameZfbOpenData);

    /**
     * 修改动物运动会开奖历史
     * 
     * @param gameZfbOpenData 动物运动会开奖历史
     * @return 结果
     */
    public int updateGameZfbOpenData(GameZfbOpenData gameZfbOpenData);

    /**
     * 批量删除动物运动会开奖历史
     * 
     * @param ids 需要删除的动物运动会开奖历史主键集合
     * @return 结果
     */
    public int deleteGameZfbOpenDataByIds(Long[] ids);

    /**
     * 删除动物运动会开奖历史信息
     * 
     * @param id 动物运动会开奖历史主键
     * @return 结果
     */
    public int deleteGameZfbOpenDataById(Long id);
}
