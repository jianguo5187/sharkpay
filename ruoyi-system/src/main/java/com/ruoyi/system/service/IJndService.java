package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Jnd;

/**
 * 加拿大开奖历史Service接口
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public interface IJndService 
{
    /**
     * 查询加拿大开奖历史
     * 
     * @param id 加拿大开奖历史主键
     * @return 加拿大开奖历史
     */
    public Jnd selectJndById(Long id);

    /**
     * 查询加拿大开奖历史列表
     * 
     * @param jnd 加拿大开奖历史
     * @return 加拿大开奖历史集合
     */
    public List<Jnd> selectJndList(Jnd jnd);

    /**
     * 新增加拿大开奖历史
     * 
     * @param jnd 加拿大开奖历史
     * @return 结果
     */
    public int insertJnd(Jnd jnd);

    /**
     * 修改加拿大开奖历史
     * 
     * @param jnd 加拿大开奖历史
     * @return 结果
     */
    public int updateJnd(Jnd jnd);

    /**
     * 批量删除加拿大开奖历史
     * 
     * @param ids 需要删除的加拿大开奖历史主键集合
     * @return 结果
     */
    public int deleteJndByIds(Long[] ids);

    /**
     * 删除加拿大开奖历史信息
     * 
     * @param id 加拿大开奖历史主键
     * @return 结果
     */
    public int deleteJndById(Long id);

    public Jnd selectLastRecord();
}