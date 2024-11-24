package com.ruoyi.system.service;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.SysUserCommission;
import com.ruoyi.system.domain.vo.ChildUserCommissionListReqVO;
import com.ruoyi.system.domain.vo.ChildUserCommissionRespVO;

/**
 * 用户佣金Service接口
 * 
 * @author ruoyi
 * @date 2024-11-14
 */
public interface ISysUserCommissionService 
{
    /**
     * 查询用户佣金
     * 
     * @param id 用户佣金主键
     * @return 用户佣金
     */
    public SysUserCommission selectSysUserCommissionById(Long id);

    /**
     * 查询用户佣金列表
     * 
     * @param sysUserCommission 用户佣金
     * @return 用户佣金集合
     */
    public List<SysUserCommission> selectSysUserCommissionList(SysUserCommission sysUserCommission);

    /**
     * 新增用户佣金
     * 
     * @param sysUserCommission 用户佣金
     * @return 结果
     */
    public int insertSysUserCommission(SysUserCommission sysUserCommission);

    /**
     * 修改用户佣金
     * 
     * @param sysUserCommission 用户佣金
     * @return 结果
     */
    public int updateSysUserCommission(SysUserCommission sysUserCommission);

    /**
     * 批量删除用户佣金
     * 
     * @param ids 需要删除的用户佣金主键集合
     * @return 结果
     */
    public int deleteSysUserCommissionByIds(Long[] ids);

    /**
     * 删除用户佣金信息
     * 
     * @param id 用户佣金主键
     * @return 结果
     */
    public int deleteSysUserCommissionById(Long id);

    public SysUserCommission selectUserCommissionByParentId(Long parentUserId, Long commissionUserId);

    public List<ChildUserCommissionRespVO> getChildUserCommissionList(Long parentUserId, Boolean allFlag, ChildUserCommissionListReqVO vo);

    public void applyCommissionTransfer(SysUser parentUser);
}
