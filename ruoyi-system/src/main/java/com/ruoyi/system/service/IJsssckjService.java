package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Jsssckj;

/**
 * 极速时时彩开奖Service接口
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public interface IJsssckjService 
{
    /**
     * 查询极速时时彩开奖
     * 
     * @param id 极速时时彩开奖主键
     * @return 极速时时彩开奖
     */
    public Jsssckj selectJsssckjById(Long id);

    /**
     * 查询极速时时彩开奖列表
     * 
     * @param jsssckj 极速时时彩开奖
     * @return 极速时时彩开奖集合
     */
    public List<Jsssckj> selectJsssckjList(Jsssckj jsssckj);

    /**
     * 新增极速时时彩开奖
     * 
     * @param jsssckj 极速时时彩开奖
     * @return 结果
     */
    public int insertJsssckj(Jsssckj jsssckj);

    /**
     * 修改极速时时彩开奖
     * 
     * @param jsssckj 极速时时彩开奖
     * @return 结果
     */
    public int updateJsssckj(Jsssckj jsssckj);

    /**
     * 批量删除极速时时彩开奖
     * 
     * @param ids 需要删除的极速时时彩开奖主键集合
     * @return 结果
     */
    public int deleteJsssckjByIds(Long[] ids);

    /**
     * 删除极速时时彩开奖信息
     * 
     * @param id 极速时时彩开奖主键
     * @return 结果
     */
    public int deleteJsssckjById(Long id);

    public Jsssckj selectLastRecord(String status);

    public List<Jsssckj> selectJsssckjListWithStatusZeroAndLimit(Long id, String status, String idAscFlg, String idDescFlg, Integer limitNumber);
}
