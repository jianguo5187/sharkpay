package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysUserCommission;
import com.ruoyi.system.domain.vo.ChildUserCommissionRespVO;
import org.apache.ibatis.annotations.Param;

/**
 * 用户佣金Mapper接口
 * 
 * @author ruoyi
 * @date 2024-11-14
 */
public interface SysUserCommissionMapper 
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
     * 删除用户佣金
     * 
     * @param id 用户佣金主键
     * @return 结果
     */
    public int deleteSysUserCommissionById(Long id);

    /**
     * 批量删除用户佣金
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysUserCommissionByIds(Long[] ids);

    public SysUserCommission selectUserCommissionByParentId(@Param("parentUserId") Long parentUserId,@Param("commissionUserId") Long commissionUserId);

    public List<ChildUserCommissionRespVO> getChildUserCommissionList(@Param("parentUserId") Long parentUserId, @Param("pageNumber") Integer pageNumber, @Param("pageRowCount") Integer pageRowCount);
}
