package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Jsssc;

/**
 * 极速时时彩开奖历史Service接口
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public interface IJssscService 
{
    /**
     * 查询极速时时彩开奖历史
     * 
     * @param id 极速时时彩开奖历史主键
     * @return 极速时时彩开奖历史
     */
    public Jsssc selectJssscById(Long id);

    /**
     * 查询极速时时彩开奖历史列表
     * 
     * @param jsssc 极速时时彩开奖历史
     * @return 极速时时彩开奖历史集合
     */
    public List<Jsssc> selectJssscList(Jsssc jsssc);

    /**
     * 新增极速时时彩开奖历史
     * 
     * @param jsssc 极速时时彩开奖历史
     * @return 结果
     */
    public int insertJsssc(Jsssc jsssc);

    /**
     * 修改极速时时彩开奖历史
     * 
     * @param jsssc 极速时时彩开奖历史
     * @return 结果
     */
    public int updateJsssc(Jsssc jsssc);

    /**
     * 批量删除极速时时彩开奖历史
     * 
     * @param ids 需要删除的极速时时彩开奖历史主键集合
     * @return 结果
     */
    public int deleteJssscByIds(Long[] ids);

    /**
     * 删除极速时时彩开奖历史信息
     * 
     * @param id 极速时时彩开奖历史主键
     * @return 结果
     */
    public int deleteJssscById(Long id);

    public Jsssc selectLastRecord();
}
