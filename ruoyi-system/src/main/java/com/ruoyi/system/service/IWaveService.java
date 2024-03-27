package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Wave;

/**
 * 数字红绿蓝属性Service接口
 * 
 * @author ruoyi
 * @date 2024-03-27
 */
public interface IWaveService 
{
    /**
     * 查询数字红绿蓝属性
     * 
     * @param id 数字红绿蓝属性主键
     * @return 数字红绿蓝属性
     */
    public Wave selectWaveById(Long id);

    /**
     * 查询数字红绿蓝属性列表
     * 
     * @param wave 数字红绿蓝属性
     * @return 数字红绿蓝属性集合
     */
    public List<Wave> selectWaveList(Wave wave);

    /**
     * 新增数字红绿蓝属性
     * 
     * @param wave 数字红绿蓝属性
     * @return 结果
     */
    public int insertWave(Wave wave);

    /**
     * 修改数字红绿蓝属性
     * 
     * @param wave 数字红绿蓝属性
     * @return 结果
     */
    public int updateWave(Wave wave);

    /**
     * 批量删除数字红绿蓝属性
     * 
     * @param ids 需要删除的数字红绿蓝属性主键集合
     * @return 结果
     */
    public int deleteWaveByIds(Long[] ids);

    /**
     * 删除数字红绿蓝属性信息
     * 
     * @param id 数字红绿蓝属性主键
     * @return 结果
     */
    public int deleteWaveById(Long id);

    public Wave selectWaveByGameId(Long gameId);
}
