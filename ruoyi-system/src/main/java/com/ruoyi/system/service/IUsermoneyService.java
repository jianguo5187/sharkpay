package com.ruoyi.system.service;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.Usermoney;
import com.ruoyi.system.domain.vo.*;

/**
 * 用户资金流水Service接口
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
public interface IUsermoneyService 
{
    /**
     * 查询用户资金流水
     * 
     * @param id 用户资金流水主键
     * @return 用户资金流水
     */
    public Usermoney selectUsermoneyById(Long id);

    /**
     * 查询用户资金流水列表
     * 
     * @param usermoney 用户资金流水
     * @return 用户资金流水集合
     */
    public List<Usermoney> selectUsermoneyList(Usermoney usermoney);

    /**
     * 新增用户资金流水
     * 
     * @param usermoney 用户资金流水
     * @return 结果
     */
    public int insertUsermoney(Usermoney usermoney);

    /**
     * 修改用户资金流水
     * 
     * @param usermoney 用户资金流水
     * @return 结果
     */
    public int updateUsermoney(Usermoney usermoney);

    /**
     * 批量删除用户资金流水
     * 
     * @param ids 需要删除的用户资金流水主键集合
     * @return 结果
     */
    public int deleteUsermoneyByIds(Long[] ids);

    /**
     * 删除用户资金流水信息
     * 
     * @param id 用户资金流水主键
     * @return 结果
     */
    public int deleteUsermoneyById(Long id);

    public List<PostalListRespVO> selectPostalList(PostalListReqVO vo);

    public int agreePostalApply(Usermoney usermoney, SysUser actionUser);

    public int refusePostalApply(Usermoney usermoney, SysUser actionUser);

    public List<RechargeListRespVO> selectRechargeList(RechargeListReqVO vo);

    public int agreeRechargeApply(Usermoney usermoney, SysUser actionUser);

    public int refuseRechargeApply(Usermoney usermoney, SysUser actionUser);

    public int adminRecharge(Usermoney usermoney, SysUser actionUser);

    public int adminPostal(Usermoney usermoney, SysUser actionUser);

    public List<UserMoneyUpTotalListRespVO> selectUserMoneyUpTotalList(Usermoney usermoney);

    public List<UserMoneyDownTotalListRespVO> selectUserMoneyDownTotalList(Usermoney usermoney);

    public List<CommissionListRespVO> selectCommissionList(Usermoney usermoney);

    public int getNoApproveRechargeCnt();

    public int getNoApprovePostalCnt();
    public List<UserMoneyDetailListRespVO> selectUserMoneyDetailList(Usermoney usermoney);

    public int updateUpDownAmount(Usermoney usermoney);
}
