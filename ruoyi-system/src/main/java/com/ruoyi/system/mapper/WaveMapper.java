package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Wave;

/**
 * 数字红绿蓝属性Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-27
 */
public interface WaveMapper 
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
     * 删除数字红绿蓝属性
     * 
     * @param id 数字红绿蓝属性主键
     * @return 结果
     */
    public int deleteWaveById(Long id);

    /**
     * 批量删除数字红绿蓝属性
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWaveByIds(Long[] ids);

    public Wave selectWaveByGameId(Long gameId);
}
