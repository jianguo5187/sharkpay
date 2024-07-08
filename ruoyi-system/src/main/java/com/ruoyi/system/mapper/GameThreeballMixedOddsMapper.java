package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.GameThreeballMixedOdds;

/**
 * 3球特殊赔率Mapper接口
 * 
 * @author ruoyi
 * @date 2024-07-08
 */
public interface GameThreeballMixedOddsMapper 
{
    /**
     * 查询3球特殊赔率
     * 
     * @param mixedOddsId 3球特殊赔率主键
     * @return 3球特殊赔率
     */
    public GameThreeballMixedOdds selectGameThreeballMixedOddsByMixedOddsId(Long mixedOddsId);

    /**
     * 查询3球特殊赔率列表
     * 
     * @param gameThreeballMixedOdds 3球特殊赔率
     * @return 3球特殊赔率集合
     */
    public List<GameThreeballMixedOdds> selectGameThreeballMixedOddsList(GameThreeballMixedOdds gameThreeballMixedOdds);

    /**
     * 新增3球特殊赔率
     * 
     * @param gameThreeballMixedOdds 3球特殊赔率
     * @return 结果
     */
    public int insertGameThreeballMixedOdds(GameThreeballMixedOdds gameThreeballMixedOdds);

    /**
     * 修改3球特殊赔率
     * 
     * @param gameThreeballMixedOdds 3球特殊赔率
     * @return 结果
     */
    public int updateGameThreeballMixedOdds(GameThreeballMixedOdds gameThreeballMixedOdds);

    /**
     * 删除3球特殊赔率
     * 
     * @param mixedOddsId 3球特殊赔率主键
     * @return 结果
     */
    public int deleteGameThreeballMixedOddsByMixedOddsId(Long mixedOddsId);

    /**
     * 批量删除3球特殊赔率
     * 
     * @param mixedOddsIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGameThreeballMixedOddsByMixedOddsIds(Long[] mixedOddsIds);

    public GameThreeballMixedOdds selectGameThreeballMixedOddsByGameId(GameThreeballMixedOdds gameThreeballMixedOdds);
}
