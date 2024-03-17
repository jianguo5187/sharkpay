package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.JsssckjMapper;
import com.ruoyi.system.domain.Jsssckj;
import com.ruoyi.system.service.IJsssckjService;

/**
 * 极速时时彩开奖Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@Service
public class JsssckjServiceImpl implements IJsssckjService 
{
    @Autowired
    private JsssckjMapper jsssckjMapper;

    /**
     * 查询极速时时彩开奖
     * 
     * @param id 极速时时彩开奖主键
     * @return 极速时时彩开奖
     */
    @Override
    public Jsssckj selectJsssckjById(Long id)
    {
        return jsssckjMapper.selectJsssckjById(id);
    }

    /**
     * 查询极速时时彩开奖列表
     * 
     * @param jsssckj 极速时时彩开奖
     * @return 极速时时彩开奖
     */
    @Override
    public List<Jsssckj> selectJsssckjList(Jsssckj jsssckj)
    {
        return jsssckjMapper.selectJsssckjList(jsssckj);
    }

    /**
     * 新增极速时时彩开奖
     * 
     * @param jsssckj 极速时时彩开奖
     * @return 结果
     */
    @Override
    public int insertJsssckj(Jsssckj jsssckj)
    {
        jsssckj.setCreateTime(DateUtils.getNowDate());
        return jsssckjMapper.insertJsssckj(jsssckj);
    }

    /**
     * 修改极速时时彩开奖
     * 
     * @param jsssckj 极速时时彩开奖
     * @return 结果
     */
    @Override
    public int updateJsssckj(Jsssckj jsssckj)
    {
        jsssckj.setUpdateTime(DateUtils.getNowDate());
        return jsssckjMapper.updateJsssckj(jsssckj);
    }

    /**
     * 批量删除极速时时彩开奖
     * 
     * @param ids 需要删除的极速时时彩开奖主键
     * @return 结果
     */
    @Override
    public int deleteJsssckjByIds(Long[] ids)
    {
        return jsssckjMapper.deleteJsssckjByIds(ids);
    }

    /**
     * 删除极速时时彩开奖信息
     * 
     * @param id 极速时时彩开奖主键
     * @return 结果
     */
    @Override
    public int deleteJsssckjById(Long id)
    {
        return jsssckjMapper.deleteJsssckjById(id);
    }
}
