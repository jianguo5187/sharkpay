package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.SysCommissionTransferApprove;
import com.ruoyi.system.domain.SysUserCommission;
import com.ruoyi.system.domain.Usermoney;
import com.ruoyi.system.domain.vo.ChildUserCommissionRespVO;
import com.ruoyi.system.mapper.SysUserCommissionMapper;
import com.ruoyi.system.mapper.UsermoneyMapper;
import com.ruoyi.system.service.ISysCommissionTransferApproveService;
import com.ruoyi.system.service.ISysUserCommissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户佣金Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-11-14
 */
@Service
public class SysUserCommissionServiceImpl implements ISysUserCommissionService 
{
    @Autowired
    private ISysCommissionTransferApproveService sysCommissionTransferApproveService;

    @Autowired
    private SysUserCommissionMapper sysUserCommissionMapper;

    @Autowired
    private UsermoneyMapper usermoneyMapper;

    /**
     * 查询用户佣金
     * 
     * @param id 用户佣金主键
     * @return 用户佣金
     */
    @Override
    public SysUserCommission selectSysUserCommissionById(Long id)
    {
        return sysUserCommissionMapper.selectSysUserCommissionById(id);
    }

    /**
     * 查询用户佣金列表
     * 
     * @param sysUserCommission 用户佣金
     * @return 用户佣金
     */
    @Override
    public List<SysUserCommission> selectSysUserCommissionList(SysUserCommission sysUserCommission)
    {
        return sysUserCommissionMapper.selectSysUserCommissionList(sysUserCommission);
    }

    /**
     * 新增用户佣金
     * 
     * @param sysUserCommission 用户佣金
     * @return 结果
     */
    @Override
    public int insertSysUserCommission(SysUserCommission sysUserCommission)
    {
        sysUserCommission.setCreateTime(DateUtils.getNowDate());
        return sysUserCommissionMapper.insertSysUserCommission(sysUserCommission);
    }

    /**
     * 修改用户佣金
     * 
     * @param sysUserCommission 用户佣金
     * @return 结果
     */
    @Override
    public int updateSysUserCommission(SysUserCommission sysUserCommission)
    {
        sysUserCommission.setUpdateTime(DateUtils.getNowDate());
        return sysUserCommissionMapper.updateSysUserCommission(sysUserCommission);
    }

    /**
     * 批量删除用户佣金
     * 
     * @param ids 需要删除的用户佣金主键
     * @return 结果
     */
    @Override
    public int deleteSysUserCommissionByIds(Long[] ids)
    {
        return sysUserCommissionMapper.deleteSysUserCommissionByIds(ids);
    }

    /**
     * 删除用户佣金信息
     * 
     * @param id 用户佣金主键
     * @return 结果
     */
    @Override
    public int deleteSysUserCommissionById(Long id)
    {
        return sysUserCommissionMapper.deleteSysUserCommissionById(id);
    }

    @Override
    public SysUserCommission selectUserCommissionByParentId(Long parentUserId, Long commissionUserId) {
        return sysUserCommissionMapper.selectUserCommissionByParentId(parentUserId,commissionUserId);
    }

    @Override
    public List<ChildUserCommissionRespVO> getChildUserCommissionList(Long parentUserId) {
        return sysUserCommissionMapper.getChildUserCommissionList(parentUserId);
    }

    @Override
    public void applyCommissionTransfer(SysUser parentUser) {
//        SysCommissionTransferApprove searchCommissionTransferApprove = new SysCommissionTransferApprove();
//        searchCommissionTransferApprove.setTransferUserId(parentUser.getUserId());
//        searchCommissionTransferApprove.setStatus("0"); //提出转出中
//        List<SysCommissionTransferApprove> commissionTransferApproveList = sysCommissionTransferApproveService.selectSysCommissionTransferApproveList(searchCommissionTransferApprove);

        Usermoney searchUsermoney = new Usermoney();
        searchUsermoney.setType("17"); //佣金转出申请中
        searchUsermoney.setUserId(parentUser.getUserId());
        List<Usermoney> usermoneyList = usermoneyMapper.selectUsermoneyList(searchUsermoney);

        //存在未审核数据
        if(usermoneyList != null && usermoneyList.size() > 0){
            throw new ServiceException("你已经有一笔佣金转出申请数据，请联系管理员审核通过后，才可以继续申请！");
        }

        // 获取所有未转出佣金列表
        SysUserCommission searchUserCommission = new SysUserCommission();
        searchUserCommission.setParentUserId(parentUser.getUserId());
        searchUserCommission.setStatus("0");//未转出
        List<SysUserCommission> noTransferUserCommissionList = sysUserCommissionMapper.selectSysUserCommissionList(searchUserCommission);

        //不存在未转出佣金
        if(noTransferUserCommissionList == null || noTransferUserCommissionList.size() == 0){
            throw new ServiceException("你没有可转出的佣金！");
        }

        Float totalWithoutTransferAmount = 0f;
        for(SysUserCommission noTransferUserCommission : noTransferUserCommissionList){
            totalWithoutTransferAmount += noTransferUserCommission.getGenerateAmount();
        }
//
//        SysCommissionTransferApprove commissionTransferApprove = new SysCommissionTransferApprove();
//        commissionTransferApprove.setTransferUserId(parentUser.getUserId());
//        commissionTransferApprove.setTransferAmount(totalWithoutTransferAmount);
//        commissionTransferApprove.setStatus("0"); //转出申请中
//        sysCommissionTransferApproveService.insertSysCommissionTransferApprove(commissionTransferApprove);

        Usermoney usermoney = new Usermoney();
        usermoney.setUserId(parentUser.getUserId());
        usermoney.setUserAccount("佣金充值余额");
        usermoney.setRemark("佣金转余额");
        usermoney.setUserBalance(parentUser.getAmount());
        usermoney.setCashMoney(totalWithoutTransferAmount);
        usermoney.setType("17");
        usermoneyMapper.insertUsermoney(usermoney);

        for(SysUserCommission noTransferUserCommission : noTransferUserCommissionList){
            noTransferUserCommission.setStatus("1"); //转出中
            noTransferUserCommission.setTransferApproveId(usermoney.getId());
            sysUserCommissionMapper.updateSysUserCommission(noTransferUserCommission);
        }

//        for(ChildUserCommissionRespVO respVO : childUserCommissionList){
//            SysCommissionTransferHistory commissionTransferHistory = new SysCommissionTransferHistory();
//            commissionTransferHistory.setTransferApproveId(commissionTransferApprove.getId());
//            commissionTransferHistory.setUserCommissionId(respVO.getUserId());
//            commissionTransferHistory.setTransferUserId(respVO.getUserId());
//            commissionTransferHistory.setCommissionUserId(respVO.getUserCommissionId());
//            commissionTransferHistory.setTransferAmount(respVO.getWithoutTransferAmount());
//            commissionTransferHistory.setStatus("0");
//            sysCommissionTransferHistoryService.insertSysCommissionTransferHistory(commissionTransferHistory);
//        }
    }
}
