package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.JssscMapper;
import com.ruoyi.system.domain.Jsssc;
import com.ruoyi.system.service.IJssscService;

/**
 * 极速时时彩开奖历史Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@Service
public class JssscServiceImpl implements IJssscService 
{
    @Autowired
    private JssscMapper jssscMapper;

    /**
     * 查询极速时时彩开奖历史
     * 
     * @param id 极速时时彩开奖历史主键
     * @return 极速时时彩开奖历史
     */
    @Override
    public Jsssc selectJssscById(Long id)
    {
        return jssscMapper.selectJssscById(id);
    }

    /**
     * 查询极速时时彩开奖历史列表
     * 
     * @param jsssc 极速时时彩开奖历史
     * @return 极速时时彩开奖历史
     */
    @Override
    public List<Jsssc> selectJssscList(Jsssc jsssc)
    {
        return jssscMapper.selectJssscList(jsssc);
    }

    /**
     * 新增极速时时彩开奖历史
     * 
     * @param jsssc 极速时时彩开奖历史
     * @return 结果
     */
    @Override
    public int insertJsssc(Jsssc jsssc)
    {
        jsssc.setCreateTime(DateUtils.getNowDate());
        return jssscMapper.insertJsssc(jsssc);
    }

    /**
     * 修改极速时时彩开奖历史
     * 
     * @param jsssc 极速时时彩开奖历史
     * @return 结果
     */
    @Override
    public int updateJsssc(Jsssc jsssc)
    {
        jsssc.setUpdateTime(DateUtils.getNowDate());
        return jssscMapper.updateJsssc(jsssc);
    }

    /**
     * 批量删除极速时时彩开奖历史
     * 
     * @param ids 需要删除的极速时时彩开奖历史主键
     * @return 结果
     */
    @Override
    public int deleteJssscByIds(Long[] ids)
    {
        return jssscMapper.deleteJssscByIds(ids);
    }

    /**
     * 删除极速时时彩开奖历史信息
     * 
     * @param id 极速时时彩开奖历史主键
     * @return 结果
     */
    @Override
    public int deleteJssscById(Long id)
    {
        return jssscMapper.deleteJssscById(id);
    }

    @Override
    public Jsssc selectLastRecord() {
        return jssscMapper.selectLastRecord();
    }

    @Override
    public List<Jsssc> selectJssscListByParam(String idDescFlg, Integer limitNumber) {
        return jssscMapper.selectJssscListByParam(idDescFlg,limitNumber);
    }
}
