package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.GameOption;

/**
 * 转化Mapper接口
 * 
 * @author ruoyi
 * @date 2024-04-22
 */
public interface GameOptionMapper 
{
    /**
     * 查询转化
     * 
     * @param id 转化主键
     * @return 转化
     */
    public GameOption selectGameOptionById(Long id);

    /**
     * 查询转化列表
     * 
     * @param gameOption 转化
     * @return 转化集合
     */
    public List<GameOption> selectGameOptionList(GameOption gameOption);

    /**
     * 新增转化
     * 
     * @param gameOption 转化
     * @return 结果
     */
    public int insertGameOption(GameOption gameOption);

    /**
     * 修改转化
     * 
     * @param gameOption 转化
     * @return 结果
     */
    public int updateGameOption(GameOption gameOption);

    /**
     * 删除转化
     * 
     * @param id 转化主键
     * @return 结果
     */
    public int deleteGameOptionById(Long id);

    /**
     * 批量删除转化
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGameOptionByIds(Long[] ids);
}
