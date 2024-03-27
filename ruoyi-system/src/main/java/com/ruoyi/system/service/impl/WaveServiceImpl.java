package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.WaveMapper;
import com.ruoyi.system.domain.Wave;
import com.ruoyi.system.service.IWaveService;

/**
 * 数字红绿蓝属性Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-27
 */
@Service
public class WaveServiceImpl implements IWaveService 
{
    @Autowired
    private WaveMapper waveMapper;

    /**
     * 查询数字红绿蓝属性
     * 
     * @param id 数字红绿蓝属性主键
     * @return 数字红绿蓝属性
     */
    @Override
    public Wave selectWaveById(Long id)
    {
        return waveMapper.selectWaveById(id);
    }

    /**
     * 查询数字红绿蓝属性列表
     * 
     * @param wave 数字红绿蓝属性
     * @return 数字红绿蓝属性
     */
    @Override
    public List<Wave> selectWaveList(Wave wave)
    {
        return waveMapper.selectWaveList(wave);
    }

    /**
     * 新增数字红绿蓝属性
     * 
     * @param wave 数字红绿蓝属性
     * @return 结果
     */
    @Override
    public int insertWave(Wave wave)
    {
        wave.setCreateTime(DateUtils.getNowDate());
        return waveMapper.insertWave(wave);
    }

    /**
     * 修改数字红绿蓝属性
     * 
     * @param wave 数字红绿蓝属性
     * @return 结果
     */
    @Override
    public int updateWave(Wave wave)
    {
        wave.setUpdateTime(DateUtils.getNowDate());
        return waveMapper.updateWave(wave);
    }

    /**
     * 批量删除数字红绿蓝属性
     * 
     * @param ids 需要删除的数字红绿蓝属性主键
     * @return 结果
     */
    @Override
    public int deleteWaveByIds(Long[] ids)
    {
        return waveMapper.deleteWaveByIds(ids);
    }

    /**
     * 删除数字红绿蓝属性信息
     * 
     * @param id 数字红绿蓝属性主键
     * @return 结果
     */
    @Override
    public int deleteWaveById(Long id)
    {
        return waveMapper.deleteWaveById(id);
    }

    @Override
    public Wave selectWaveByGameId(Long gameId) {
        return waveMapper.selectWaveByGameId(gameId);
    }
}
