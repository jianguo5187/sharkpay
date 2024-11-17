package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.SysAdminRecord;
import com.ruoyi.system.domain.SysCommissionTransferApprove;
import com.ruoyi.system.domain.SysUserCommission;
import com.ruoyi.system.domain.Usermoney;
import com.ruoyi.system.mapper.SysCommissionTransferApproveMapper;
import com.ruoyi.system.mapper.UserwinMapper;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 佣金转出审核Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-11-14
 */
@Service
public class SysCommissionTransferApproveServiceImpl implements ISysCommissionTransferApproveService 
{
    @Autowired
    private SysCommissionTransferApproveMapper sysCommissionTransferApproveMapper;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysUserCommissionService sysUserCommissionService;

    @Autowired
    private IUsermoneyService usermoneyService;

    @Autowired
    private UserwinMapper userwinMapper;

    @Autowired
    private ISysAdminRecordService sysAdminRecordService;

    /**
     * 查询佣金转出审核
     * 
     * @param id 佣金转出审核主键
     * @return 佣金转出审核
     */
    @Override
    public SysCommissionTransferApprove selectSysCommissionTransferApproveById(Long id)
    {
        return sysCommissionTransferApproveMapper.selectSysCommissionTransferApproveById(id);
    }

    /**
     * 查询佣金转出审核列表
     * 
     * @param sysCommissionTransferApprove 佣金转出审核
     * @return 佣金转出审核
     */
    @Override
    public List<SysCommissionTransferApprove> selectSysCommissionTransferApproveList(SysCommissionTransferApprove sysCommissionTransferApprove)
    {
        return sysCommissionTransferApproveMapper.selectSysCommissionTransferApproveList(sysCommissionTransferApprove);
    }

    /**
     * 新增佣金转出审核
     * 
     * @param sysCommissionTransferApprove 佣金转出审核
     * @return 结果
     */
    @Override
    public int insertSysCommissionTransferApprove(SysCommissionTransferApprove sysCommissionTransferApprove)
    {
        sysCommissionTransferApprove.setCreateTime(DateUtils.getNowDate());
        return sysCommissionTransferApproveMapper.insertSysCommissionTransferApprove(sysCommissionTransferApprove);
    }

    /**
     * 修改佣金转出审核
     * 
     * @param sysCommissionTransferApprove 佣金转出审核
     * @return 结果
     */
    @Override
    public int updateSysCommissionTransferApprove(SysCommissionTransferApprove sysCommissionTransferApprove)
    {
        sysCommissionTransferApprove.setUpdateTime(DateUtils.getNowDate());
        return sysCommissionTransferApproveMapper.updateSysCommissionTransferApprove(sysCommissionTransferApprove);
    }

    /**
     * 批量删除佣金转出审核
     * 
     * @param ids 需要删除的佣金转出审核主键
     * @return 结果
     */
    @Override
    public int deleteSysCommissionTransferApproveByIds(Long[] ids)
    {
        return sysCommissionTransferApproveMapper.deleteSysCommissionTransferApproveByIds(ids);
    }

    /**
     * 删除佣金转出审核信息
     * 
     * @param id 佣金转出审核主键
     * @return 结果
     */
    @Override
    public int deleteSysCommissionTransferApproveById(Long id)
    {
        return sysCommissionTransferApproveMapper.deleteSysCommissionTransferApproveById(id);
    }

    @Override
    public int agreeTransferApply(SysCommissionTransferApprove commissionTransferApprove, SysUser actionUser) {

        SysUser parentUser = userService.selectUserById(commissionTransferApprove.getTransferUserId());

        //直接转到余额表
        Float userMoney = parentUser.getAmount();

        // 获取佣金列表
        SysUserCommission searchUserCommission = new SysUserCommission();
        searchUserCommission.setParentUserId(parentUser.getUserId());
        searchUserCommission.setTransferApproveId(commissionTransferApprove.getId());
        List<SysUserCommission> userCommissionList = sysUserCommissionService.selectSysUserCommissionList(searchUserCommission);
        for(SysUserCommission userCommission : userCommissionList){
            userCommission.setStatus("2"); //已转出
            userCommission.setUpdateBy(actionUser.getNickName());
            sysUserCommissionService.updateSysUserCommission(userCommission);

            userMoney += userCommission.getGenerateAmount();

            //佣金发放
            Usermoney usermoney = new Usermoney();
            usermoney.setUserId(parentUser.getUserId());
            usermoney.setCashContent(userCommission.getGameName() + "投注返佣前金额：" + userCommission.getUserBetAmount().toString());

            usermoney.setCashMoney(userCommission.getGenerateAmount());
            usermoney.setUserBalance(userMoney);
            usermoney.setType("11");
            usermoney.setGameId(userCommission.getGameId());
            usermoney.setGameName(userCommission.getGameName());
            usermoney.setRemark("下线佣金");
            usermoney.setCommissionFromUserId(userCommission.getCommissionUserId());
            usermoneyService.insertUsermoney(usermoney);
        }

        //提取到余额中
        parentUser.setAmount(userMoney);
        userService.updateUserAmount(parentUser);

        SysAdminRecord sysAdminRecord = new SysAdminRecord();
        sysAdminRecord.setType(6);//佣金发放
        sysAdminRecord.setIsAgree("0");
        sysAdminRecord.setOriginId(commissionTransferApprove.getId());
        sysAdminRecord.setAdminUserId(actionUser.getUserId());
        sysAdminRecordService.insertSysAdminRecord(sysAdminRecord);

        //更新审核表
        commissionTransferApprove.setStatus("1");
        commissionTransferApprove.setUpdateBy(actionUser.getNickName());
        return updateSysCommissionTransferApprove(commissionTransferApprove);
    }

    @Override
    public int refuseTransferApply(SysCommissionTransferApprove commissionTransferApprove, SysUser actionUser) {
        SysUser parentUser = userService.selectUserById(commissionTransferApprove.getTransferUserId());

        // 获取佣金列表
        SysUserCommission searchUserCommission = new SysUserCommission();
        searchUserCommission.setParentUserId(parentUser.getUserId());
        searchUserCommission.setTransferApproveId(commissionTransferApprove.getId());
        List<SysUserCommission> userCommissionList = sysUserCommissionService.selectSysUserCommissionList(searchUserCommission);
        for(SysUserCommission userCommission : userCommissionList) {
            userCommission.setStatus("0"); //回退到未转出
            userCommission.setUpdateBy(actionUser.getNickName());
            sysUserCommissionService.updateSysUserCommission(userCommission);
        }

        //更新审核表
        commissionTransferApprove.setStatus("2");//审核失败
        commissionTransferApprove.setUpdateBy(actionUser.getNickName());
        return updateSysCommissionTransferApprove(commissionTransferApprove);
    }
}
