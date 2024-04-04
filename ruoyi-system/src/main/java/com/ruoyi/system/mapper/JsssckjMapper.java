package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Jsssckj;
import org.apache.ibatis.annotations.Param;

/**
 * 极速时时彩开奖Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public interface JsssckjMapper 
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
     * 删除极速时时彩开奖
     * 
     * @param id 极速时时彩开奖主键
     * @return 结果
     */
    public int deleteJsssckjById(Long id);

    /**
     * 批量删除极速时时彩开奖
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteJsssckjByIds(Long[] ids);

    public Jsssckj selectLastRecord(String status);

    public List<Jsssckj> selectJsssckjListWithStatusZeroAndLimit(@Param("id") Long id, @Param("status") String status, @Param("idAscFlg") String idAscFlg, @Param("idDescFlg") String idDescFlg, @Param("limitNumber") Integer limitNumber);

    public int updateJsssckjTotalAmountByPeriodId(Jsssckj jsssckj);
}
