package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysPayment;

/**
 * 支付方式Service接口
 * 
 * @author ruoyi
 * @date 2024-04-07
 */
public interface ISysPaymentService 
{
    /**
     * 查询支付方式
     * 
     * @param id 支付方式主键
     * @return 支付方式
     */
    public SysPayment selectSysPaymentById(Long id);

    /**
     * 查询支付方式列表
     * 
     * @param sysPayment 支付方式
     * @return 支付方式集合
     */
    public List<SysPayment> selectSysPaymentList(SysPayment sysPayment);

    /**
     * 新增支付方式
     * 
     * @param sysPayment 支付方式
     * @return 结果
     */
    public int insertSysPayment(SysPayment sysPayment);

    /**
     * 修改支付方式
     * 
     * @param sysPayment 支付方式
     * @return 结果
     */
    public int updateSysPayment(SysPayment sysPayment);

    /**
     * 批量删除支付方式
     * 
     * @param ids 需要删除的支付方式主键集合
     * @return 结果
     */
    public int deleteSysPaymentByIds(Long[] ids);

    /**
     * 删除支付方式信息
     * 
     * @param id 支付方式主键
     * @return 结果
     */
    public int deleteSysPaymentById(Long id);
}
