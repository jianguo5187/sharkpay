package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysBetType;

/**
 * 游戏玩法Service接口
 * 
 * @author ruoyi
 * @date 2024-03-10
 */
public interface ISysBetTypeService 
{
    /**
     * 查询游戏玩法
     * 
     * @param betTypeId 游戏玩法主键
     * @return 游戏玩法
     */
    public SysBetType selectSysBetTypeByBetTypeId(Long betTypeId);

    /**
     * 查询游戏玩法列表
     * 
     * @param sysBetType 游戏玩法
     * @return 游戏玩法集合
     */
    public List<SysBetType> selectSysBetTypeList(SysBetType sysBetType);

    /**
     * 新增游戏玩法
     * 
     * @param sysBetType 游戏玩法
     * @return 结果
     */
    public int insertSysBetType(SysBetType sysBetType);

    /**
     * 修改游戏玩法
     * 
     * @param sysBetType 游戏玩法
     * @return 结果
     */
    public int updateSysBetType(SysBetType sysBetType);

    /**
     * 批量删除游戏玩法
     * 
     * @param betTypeIds 需要删除的游戏玩法主键集合
     * @return 结果
     */
    public int deleteSysBetTypeByBetTypeIds(Long[] betTypeIds);

    /**
     * 删除游戏玩法信息
     * 
     * @param betTypeId 游戏玩法主键
     * @return 结果
     */
    public int deleteSysBetTypeByBetTypeId(Long betTypeId);
}
