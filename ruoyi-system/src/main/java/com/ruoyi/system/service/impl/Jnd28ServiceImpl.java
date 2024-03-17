package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.Jnd28Mapper;
import com.ruoyi.system.domain.Jnd28;
import com.ruoyi.system.service.IJnd28Service;

/**
 * 加拿大开奖Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@Service
public class Jnd28ServiceImpl implements IJnd28Service 
{
    @Autowired
    private Jnd28Mapper jnd28Mapper;

    /**
     * 查询加拿大开奖
     * 
     * @param id 加拿大开奖主键
     * @return 加拿大开奖
     */
    @Override
    public Jnd28 selectJnd28ById(Long id)
    {
        return jnd28Mapper.selectJnd28ById(id);
    }

    /**
     * 查询加拿大开奖列表
     * 
     * @param jnd28 加拿大开奖
     * @return 加拿大开奖
     */
    @Override
    public List<Jnd28> selectJnd28List(Jnd28 jnd28)
    {
        return jnd28Mapper.selectJnd28List(jnd28);
    }

    /**
     * 新增加拿大开奖
     * 
     * @param jnd28 加拿大开奖
     * @return 结果
     */
    @Override
    public int insertJnd28(Jnd28 jnd28)
    {
        jnd28.setCreateTime(DateUtils.getNowDate());
        return jnd28Mapper.insertJnd28(jnd28);
    }

    /**
     * 修改加拿大开奖
     * 
     * @param jnd28 加拿大开奖
     * @return 结果
     */
    @Override
    public int updateJnd28(Jnd28 jnd28)
    {
        jnd28.setUpdateTime(DateUtils.getNowDate());
        return jnd28Mapper.updateJnd28(jnd28);
    }

    /**
     * 批量删除加拿大开奖
     * 
     * @param ids 需要删除的加拿大开奖主键
     * @return 结果
     */
    @Override
    public int deleteJnd28ByIds(Long[] ids)
    {
        return jnd28Mapper.deleteJnd28ByIds(ids);
    }

    /**
     * 删除加拿大开奖信息
     * 
     * @param id 加拿大开奖主键
     * @return 结果
     */
    @Override
    public int deleteJnd28ById(Long id)
    {
        return jnd28Mapper.deleteJnd28ById(id);
    }
}
