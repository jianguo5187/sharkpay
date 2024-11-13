package com.ruoyi.system.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.ip.IpUtils;
import com.ruoyi.system.domain.SysAdminActionLog;
import com.ruoyi.system.domain.SysBetType;
import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.service.ISysAdminActionLogService;
import com.ruoyi.system.service.ISysBetTypeService;
import com.ruoyi.system.service.ISysGameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysBetItemMapper;
import com.ruoyi.system.domain.SysBetItem;
import com.ruoyi.system.service.ISysBetItemService;

/**
 * 游戏投注项Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-06
 */
@Service
public class SysBetItemServiceImpl implements ISysBetItemService 
{
    @Autowired
    private SysBetItemMapper sysBetItemMapper;

    @Autowired
    private ISysBetTypeService sysBetTypeService;

    @Autowired
    private ISysAdminActionLogService sysAdminActionLogService;

    /**
     * 查询游戏投注项
     * 
     * @param betItemId 游戏投注项主键
     * @return 游戏投注项
     */
    @Override
    public SysBetItem selectSysBetItemByBetItemId(Long betItemId)
    {
        return sysBetItemMapper.selectSysBetItemByBetItemId(betItemId);
    }

    /**
     * 查询游戏投注项列表
     * 
     * @param sysBetItem 游戏投注项
     * @return 游戏投注项
     */
    @Override
    public List<SysBetItem> selectSysBetItemList(SysBetItem sysBetItem)
    {
        return sysBetItemMapper.selectSysBetItemList(sysBetItem);
    }

    /**
     * 新增游戏投注项
     * 
     * @param sysBetItem 游戏投注项
     * @return 结果
     */
    @Override
    public int insertSysBetItem(SysBetItem sysBetItem)
    {
        sysBetItem.setCreateTime(DateUtils.getNowDate());
        return sysBetItemMapper.insertSysBetItem(sysBetItem);
    }

    /**
     * 修改游戏投注项
     * 
     * @param sysBetItem 游戏投注项
     * @return 结果
     */
    @Override
    public int updateSysBetItem(SysUser actionUser, SysBetItem sysBetItem)
    {
        sysBetItem.setUpdateTime(DateUtils.getNowDate());
        // 判断是否是管理员登录，如果是记录登录信息
        boolean isAdminFlag = false;
        List<SysRole> roles = actionUser.getRoles();
        for(SysRole role : roles){
            if(role.getRoleId() == 2 || role.getRoleId() == 4){
                isAdminFlag = true;
                break;
            }
        }
        if(isAdminFlag){
            SysBetType betType = sysBetTypeService.selectSysBetTypeByBetTypeId(sysBetItem.getBetItemType());
            SysBetItem oldBetItem = selectSysBetItemByBetItemId(sysBetItem.getBetItemId());
            SysAdminActionLog sysAdminActionLog = new SysAdminActionLog();
            sysAdminActionLog.setType("4");//修改赔率
            sysAdminActionLog.setAdminUserId(actionUser.getUserId());
            sysAdminActionLog.setAdminUserName(actionUser.getNickName());
            sysAdminActionLog.setActionLoginIp(IpUtils.getIpAddr());
            sysAdminActionLog.setActionTargetIp(sysBetItem.getBetItemId().toString());
            sysAdminActionLog.setCreateBy(actionUser.getNickName());
            sysAdminActionLog.setRemark("[" + actionUser.getNickName() + "],修改游戏[" + betType.getGameName() + "],投注类型["+ betType.getBetTypeName() + "],投注选项[" +  sysBetItem.getBetItemName() +"],赔率["+ oldBetItem.getOdd() + "] ->[" + sysBetItem.getOdd() + "],时间：" + DateUtils.getTime());
            sysAdminActionLogService.insertSysAdminActionLog(sysAdminActionLog);
        }

        return sysBetItemMapper.updateSysBetItem(sysBetItem);
    }

    /**
     * 批量删除游戏投注项
     * 
     * @param betItemIds 需要删除的游戏投注项主键
     * @return 结果
     */
    @Override
    public int deleteSysBetItemByBetItemIds(Long[] betItemIds)
    {
        return sysBetItemMapper.deleteSysBetItemByBetItemIds(betItemIds);
    }

    /**
     * 删除游戏投注项信息
     * 
     * @param betItemId 游戏投注项主键
     * @return 结果
     */
    @Override
    public int deleteSysBetItemByBetItemId(Long betItemId)
    {
        return sysBetItemMapper.deleteSysBetItemByBetItemId(betItemId);
    }

    @Override
    public boolean checkBetItemCodeUnique(SysBetItem sysBetItem) {
        SysBetItem betItem = sysBetItemMapper.checkBetItemCodeUnique(sysBetItem.getGameId(), sysBetItem.getBetItemCode());

        if (StringUtils.isNotNull(betItem) && betItem.getBetItemId().compareTo(sysBetItem.getBetItemId()) != 0)
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }
}
