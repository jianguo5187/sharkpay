package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysPaymentMapper;
import com.ruoyi.system.domain.SysPayment;
import com.ruoyi.system.service.ISysPaymentService;

/**
 * 支付方式Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-04-07
 */
@Service
public class SysPaymentServiceImpl implements ISysPaymentService 
{
    @Autowired
    private SysPaymentMapper sysPaymentMapper;

    /**
     * 查询支付方式
     * 
     * @param id 支付方式主键
     * @return 支付方式
     */
    @Override
    public SysPayment selectSysPaymentById(Long id)
    {
        return sysPaymentMapper.selectSysPaymentById(id);
    }

    /**
     * 查询支付方式列表
     * 
     * @param sysPayment 支付方式
     * @return 支付方式
     */
    @Override
    public List<SysPayment> selectSysPaymentList(SysPayment sysPayment)
    {
        return sysPaymentMapper.selectSysPaymentList(sysPayment);
    }

    /**
     * 新增支付方式
     * 
     * @param sysPayment 支付方式
     * @return 结果
     */
    @Override
    public int insertSysPayment(SysPayment sysPayment)
    {
        sysPayment.setCreateTime(DateUtils.getNowDate());
        return sysPaymentMapper.insertSysPayment(sysPayment);
    }

    /**
     * 修改支付方式
     * 
     * @param sysPayment 支付方式
     * @return 结果
     */
    @Override
    public int updateSysPayment(SysPayment sysPayment)
    {
        sysPayment.setUpdateTime(DateUtils.getNowDate());
        return sysPaymentMapper.updateSysPayment(sysPayment);
    }

    /**
     * 批量删除支付方式
     * 
     * @param ids 需要删除的支付方式主键
     * @return 结果
     */
    @Override
    public int deleteSysPaymentByIds(Long[] ids)
    {
        return sysPaymentMapper.deleteSysPaymentByIds(ids);
    }

    /**
     * 删除支付方式信息
     * 
     * @param id 支付方式主键
     * @return 结果
     */
    @Override
    public int deleteSysPaymentById(Long id)
    {
        return sysPaymentMapper.deleteSysPaymentById(id);
    }
}
