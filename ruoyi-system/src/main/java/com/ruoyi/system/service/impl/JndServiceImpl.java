package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.JndMapper;
import com.ruoyi.system.domain.Jnd;
import com.ruoyi.system.service.IJndService;

/**
 * 加拿大开奖历史Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@Service
public class JndServiceImpl implements IJndService 
{
    @Autowired
    private JndMapper jndMapper;

    /**
     * 查询加拿大开奖历史
     * 
     * @param id 加拿大开奖历史主键
     * @return 加拿大开奖历史
     */
    @Override
    public Jnd selectJndById(Long id)
    {
        return jndMapper.selectJndById(id);
    }

    /**
     * 查询加拿大开奖历史列表
     * 
     * @param jnd 加拿大开奖历史
     * @return 加拿大开奖历史
     */
    @Override
    public List<Jnd> selectJndList(Jnd jnd)
    {
        return jndMapper.selectJndList(jnd);
    }

    /**
     * 新增加拿大开奖历史
     * 
     * @param jnd 加拿大开奖历史
     * @return 结果
     */
    @Override
    public int insertJnd(Jnd jnd)
    {
        jnd.setCreateTime(DateUtils.getNowDate());
        return jndMapper.insertJnd(jnd);
    }

    /**
     * 修改加拿大开奖历史
     * 
     * @param jnd 加拿大开奖历史
     * @return 结果
     */
    @Override
    public int updateJnd(Jnd jnd)
    {
        jnd.setUpdateTime(DateUtils.getNowDate());
        return jndMapper.updateJnd(jnd);
    }

    /**
     * 批量删除加拿大开奖历史
     * 
     * @param ids 需要删除的加拿大开奖历史主键
     * @return 结果
     */
    @Override
    public int deleteJndByIds(Long[] ids)
    {
        return jndMapper.deleteJndByIds(ids);
    }

    /**
     * 删除加拿大开奖历史信息
     * 
     * @param id 加拿大开奖历史主键
     * @return 结果
     */
    @Override
    public int deleteJndById(Long id)
    {
        return jndMapper.deleteJndById(id);
    }
}
