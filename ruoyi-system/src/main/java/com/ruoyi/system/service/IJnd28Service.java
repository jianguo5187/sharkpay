package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Jnd28;

/**
 * 加拿大开奖Service接口
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public interface IJnd28Service 
{
    /**
     * 查询加拿大开奖
     * 
     * @param id 加拿大开奖主键
     * @return 加拿大开奖
     */
    public Jnd28 selectJnd28ById(Long id);

    /**
     * 查询加拿大开奖列表
     * 
     * @param jnd28 加拿大开奖
     * @return 加拿大开奖集合
     */
    public List<Jnd28> selectJnd28List(Jnd28 jnd28);

    /**
     * 新增加拿大开奖
     * 
     * @param jnd28 加拿大开奖
     * @return 结果
     */
    public int insertJnd28(Jnd28 jnd28);

    /**
     * 修改加拿大开奖
     * 
     * @param jnd28 加拿大开奖
     * @return 结果
     */
    public int updateJnd28(Jnd28 jnd28);

    /**
     * 批量删除加拿大开奖
     * 
     * @param ids 需要删除的加拿大开奖主键集合
     * @return 结果
     */
    public int deleteJnd28ByIds(Long[] ids);

    /**
     * 删除加拿大开奖信息
     * 
     * @param id 加拿大开奖主键
     * @return 结果
     */
    public int deleteJnd28ById(Long id);

    public Jnd28 selectLastRecord(String status);

    public List<Jnd28> selectJnd28ListWithStatusZeroAndLimit(Long id,String status,String idAscFlg,String idDescFlg,Integer limitNumber);

    public int updateJnd28TotalAmountByPeriodId(Jnd28 jnd28);
}
