package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysCommissionTransferApprove;

/**
 * 佣金转出审核Mapper接口
 * 
 * @author ruoyi
 * @date 2024-11-14
 */
public interface SysCommissionTransferApproveMapper 
{
    /**
     * 查询佣金转出审核
     * 
     * @param id 佣金转出审核主键
     * @return 佣金转出审核
     */
    public SysCommissionTransferApprove selectSysCommissionTransferApproveById(Long id);

    /**
     * 查询佣金转出审核列表
     * 
     * @param sysCommissionTransferApprove 佣金转出审核
     * @return 佣金转出审核集合
     */
    public List<SysCommissionTransferApprove> selectSysCommissionTransferApproveList(SysCommissionTransferApprove sysCommissionTransferApprove);

    /**
     * 新增佣金转出审核
     * 
     * @param sysCommissionTransferApprove 佣金转出审核
     * @return 结果
     */
    public int insertSysCommissionTransferApprove(SysCommissionTransferApprove sysCommissionTransferApprove);

    /**
     * 修改佣金转出审核
     * 
     * @param sysCommissionTransferApprove 佣金转出审核
     * @return 结果
     */
    public int updateSysCommissionTransferApprove(SysCommissionTransferApprove sysCommissionTransferApprove);

    /**
     * 删除佣金转出审核
     * 
     * @param id 佣金转出审核主键
     * @return 结果
     */
    public int deleteSysCommissionTransferApproveById(Long id);

    /**
     * 批量删除佣金转出审核
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysCommissionTransferApproveByIds(Long[] ids);
}
