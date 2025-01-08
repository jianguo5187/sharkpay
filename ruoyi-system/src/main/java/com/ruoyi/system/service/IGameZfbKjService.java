package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.GameZfbKj;

/**
 * 动物运动会开奖Service接口
 * 
 * @author ruoyi
 * @date 2025-01-07
 */
public interface IGameZfbKjService 
{
    /**
     * 查询动物运动会开奖
     * 
     * @param id 动物运动会开奖主键
     * @return 动物运动会开奖
     */
    public GameZfbKj selectGameZfbKjById(Long id);

    /**
     * 查询动物运动会开奖列表
     * 
     * @param gameZfbKj 动物运动会开奖
     * @return 动物运动会开奖集合
     */
    public List<GameZfbKj> selectGameZfbKjList(GameZfbKj gameZfbKj);

    /**
     * 新增动物运动会开奖
     * 
     * @param gameZfbKj 动物运动会开奖
     * @return 结果
     */
    public int insertGameZfbKj(GameZfbKj gameZfbKj);

    /**
     * 修改动物运动会开奖
     * 
     * @param gameZfbKj 动物运动会开奖
     * @return 结果
     */
    public int updateGameZfbKj(GameZfbKj gameZfbKj);

    /**
     * 批量删除动物运动会开奖
     * 
     * @param ids 需要删除的动物运动会开奖主键集合
     * @return 结果
     */
    public int deleteGameZfbKjByIds(Long[] ids);

    /**
     * 删除动物运动会开奖信息
     * 
     * @param id 动物运动会开奖主键
     * @return 结果
     */
    public int deleteGameZfbKjById(Long id);
}
