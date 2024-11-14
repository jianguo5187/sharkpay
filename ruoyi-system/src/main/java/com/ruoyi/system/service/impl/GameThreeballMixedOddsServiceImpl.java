package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ip.IpUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.service.ISysAdminActionLogService;
import com.ruoyi.system.service.ISysGameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GameThreeballMixedOddsMapper;
import com.ruoyi.system.service.IGameThreeballMixedOddsService;

/**
 * 3球特殊赔率Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-08
 */
@Service
public class GameThreeballMixedOddsServiceImpl implements IGameThreeballMixedOddsService 
{
    @Autowired
    private GameThreeballMixedOddsMapper gameThreeballMixedOddsMapper;

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private ISysAdminActionLogService sysAdminActionLogService;

    /**
     * 查询3球特殊赔率
     * 
     * @param mixedOddsId 3球特殊赔率主键
     * @return 3球特殊赔率
     */
    @Override
    public GameThreeballMixedOdds selectGameThreeballMixedOddsByMixedOddsId(Long mixedOddsId)
    {
        return gameThreeballMixedOddsMapper.selectGameThreeballMixedOddsByMixedOddsId(mixedOddsId);
    }

    /**
     * 查询3球特殊赔率列表
     * 
     * @param gameThreeballMixedOdds 3球特殊赔率
     * @return 3球特殊赔率
     */
    @Override
    public List<GameThreeballMixedOdds> selectGameThreeballMixedOddsList(GameThreeballMixedOdds gameThreeballMixedOdds)
    {
        return gameThreeballMixedOddsMapper.selectGameThreeballMixedOddsList(gameThreeballMixedOdds);
    }

    /**
     * 新增3球特殊赔率
     * 
     * @param gameThreeballMixedOdds 3球特殊赔率
     * @return 结果
     */
    @Override
    public int insertGameThreeballMixedOdds(GameThreeballMixedOdds gameThreeballMixedOdds)
    {
        gameThreeballMixedOdds.setCreateTime(DateUtils.getNowDate());
        return gameThreeballMixedOddsMapper.insertGameThreeballMixedOdds(gameThreeballMixedOdds);
    }

    /**
     * 修改3球特殊赔率
     * 
     * @param gameThreeballMixedOdds 3球特殊赔率
     * @return 结果
     */
    @Override
    public int updateGameThreeballMixedOdds(GameThreeballMixedOdds gameThreeballMixedOdds, SysUser actionUser)
    {
        GameThreeballMixedOdds oldThreeballMixedOdds = selectGameThreeballMixedOddsByMixedOddsId(gameThreeballMixedOdds.getMixedOddsId());

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
            SysGame gameInfo = sysGameService.selectSysGameByGameId(gameThreeballMixedOdds.getGameId());

            if(oldThreeballMixedOdds.getLessNumberOdd().compareTo(gameThreeballMixedOdds.getLessNumberOdd()) != 0){
                insertAdminActionLog(actionUser.getUserId()
                        ,actionUser.getNickName()
                        ,gameThreeballMixedOdds.getMixedOddsId().toString()
                        ,"[" + actionUser.getNickName() + "],修改游戏[" + gameInfo.getGameName() + "],13,14大小单双小于下限赔率["+ oldThreeballMixedOdds.getLessNumberOdd() + "] ->[" + gameThreeballMixedOdds.getLessNumberOdd() + "],时间：" + DateUtils.getTime()
                );
            }

            if(oldThreeballMixedOdds.getCenterNumberOdd().compareTo(gameThreeballMixedOdds.getCenterNumberOdd()) != 0){
                insertAdminActionLog(actionUser.getUserId()
                        ,actionUser.getNickName()
                        ,gameThreeballMixedOdds.getMixedOddsId().toString()
                        ,"[" + actionUser.getNickName() + "],修改游戏[" + gameInfo.getGameName() + "],13,14大小单双中间赔率["+ oldThreeballMixedOdds.getCenterNumberOdd() + "] ->[" + gameThreeballMixedOdds.getCenterNumberOdd() + "],时间：" + DateUtils.getTime()
                );
            }

            if(oldThreeballMixedOdds.getGreaterNumberOdd().compareTo(gameThreeballMixedOdds.getGreaterNumberOdd()) != 0){
                insertAdminActionLog(actionUser.getUserId()
                        ,actionUser.getNickName()
                        ,gameThreeballMixedOdds.getMixedOddsId().toString()
                        ,"[" + actionUser.getNickName() + "],修改游戏[" + gameInfo.getGameName() + "],13,14大小单双大于下限赔率["+ oldThreeballMixedOdds.getGreaterNumberOdd() + "] ->[" + gameThreeballMixedOdds.getGreaterNumberOdd() + "],时间：" + DateUtils.getTime()
                );
            }

            if(oldThreeballMixedOdds.getComboLessNumberOdd().compareTo(gameThreeballMixedOdds.getComboLessNumberOdd()) != 0){
                insertAdminActionLog(actionUser.getUserId()
                        ,actionUser.getNickName()
                        ,gameThreeballMixedOdds.getMixedOddsId().toString()
                        ,"[" + actionUser.getNickName() + "],修改游戏[" + gameInfo.getGameName() + "],13,14组合小于下限赔率["+ oldThreeballMixedOdds.getComboLessNumberOdd() + "] ->[" + gameThreeballMixedOdds.getComboLessNumberOdd() + "],时间：" + DateUtils.getTime()
                );
            }

            if(oldThreeballMixedOdds.getComboCenterNumberOdd().compareTo(gameThreeballMixedOdds.getComboCenterNumberOdd()) != 0){
                insertAdminActionLog(actionUser.getUserId()
                        ,actionUser.getNickName()
                        ,gameThreeballMixedOdds.getMixedOddsId().toString()
                        ,"[" + actionUser.getNickName() + "],修改游戏[" + gameInfo.getGameName() + "],13,14组合中间赔率["+ oldThreeballMixedOdds.getComboCenterNumberOdd() + "] ->[" + gameThreeballMixedOdds.getComboCenterNumberOdd() + "],时间：" + DateUtils.getTime()
                );
            }

            if(oldThreeballMixedOdds.getComboGreaterNumberOdd().compareTo(gameThreeballMixedOdds.getComboGreaterNumberOdd()) != 0){
                insertAdminActionLog(actionUser.getUserId()
                        ,actionUser.getNickName()
                        ,gameThreeballMixedOdds.getMixedOddsId().toString()
                        ,"[" + actionUser.getNickName() + "],修改游戏[" + gameInfo.getGameName() + "],13,14组合大于下限赔率["+ oldThreeballMixedOdds.getComboGreaterNumberOdd() + "] ->[" + gameThreeballMixedOdds.getComboGreaterNumberOdd() + "],时间：" + DateUtils.getTime()
                );
            }

            if(oldThreeballMixedOdds.getLessSdbOdd().compareTo(gameThreeballMixedOdds.getLessSdbOdd()) != 0){
                insertAdminActionLog(actionUser.getUserId()
                        ,actionUser.getNickName()
                        ,gameThreeballMixedOdds.getMixedOddsId().toString()
                        ,"[" + actionUser.getNickName() + "],修改游戏[" + gameInfo.getGameName() + "],顺对豹小于下限赔率["+ oldThreeballMixedOdds.getLessSdbOdd() + "] ->[" + gameThreeballMixedOdds.getLessSdbOdd() + "],时间：" + DateUtils.getTime()
                );
            }

            if(oldThreeballMixedOdds.getCenterSdbOdd().compareTo(gameThreeballMixedOdds.getCenterSdbOdd()) != 0){
                insertAdminActionLog(actionUser.getUserId()
                        ,actionUser.getNickName()
                        ,gameThreeballMixedOdds.getMixedOddsId().toString()
                        ,"[" + actionUser.getNickName() + "],修改游戏[" + gameInfo.getGameName() + "],顺对豹中间赔率["+ oldThreeballMixedOdds.getCenterSdbOdd() + "] ->[" + gameThreeballMixedOdds.getCenterSdbOdd() + "],时间：" + DateUtils.getTime()
                );
            }

            if(oldThreeballMixedOdds.getGreaterSdbOdd().compareTo(gameThreeballMixedOdds.getGreaterSdbOdd()) != 0){
                insertAdminActionLog(actionUser.getUserId()
                        ,actionUser.getNickName()
                        ,gameThreeballMixedOdds.getMixedOddsId().toString()
                        ,"[" + actionUser.getNickName() + "],修改游戏[" + gameInfo.getGameName() + "],顺对豹大于下限赔率["+ oldThreeballMixedOdds.getGreaterSdbOdd() + "] ->[" + gameThreeballMixedOdds.getGreaterSdbOdd() + "],时间：" + DateUtils.getTime()
                );
            }

            if(oldThreeballMixedOdds.getLessZeroNineOdd().compareTo(gameThreeballMixedOdds.getLessZeroNineOdd()) != 0){
                insertAdminActionLog(actionUser.getUserId()
                        ,actionUser.getNickName()
                        ,gameThreeballMixedOdds.getMixedOddsId().toString()
                        ,"[" + actionUser.getNickName() + "],修改游戏[" + gameInfo.getGameName() + "],0,9小于下限赔["+ oldThreeballMixedOdds.getLessZeroNineOdd() + "] ->[" + gameThreeballMixedOdds.getLessZeroNineOdd() + "],时间：" + DateUtils.getTime()
                );
            }

            if(oldThreeballMixedOdds.getCenterZeroNineOdd().compareTo(gameThreeballMixedOdds.getCenterZeroNineOdd()) != 0){
                insertAdminActionLog(actionUser.getUserId()
                        ,actionUser.getNickName()
                        ,gameThreeballMixedOdds.getMixedOddsId().toString()
                        ,"[" + actionUser.getNickName() + "],修改游戏[" + gameInfo.getGameName() + "],0,9中间赔率["+ oldThreeballMixedOdds.getCenterZeroNineOdd() + "] ->[" + gameThreeballMixedOdds.getCenterZeroNineOdd() + "],时间：" + DateUtils.getTime()
                );
            }

            if(oldThreeballMixedOdds.getGreaterZeroNineOdd().compareTo(gameThreeballMixedOdds.getGreaterZeroNineOdd()) != 0){
                insertAdminActionLog(actionUser.getUserId()
                        ,actionUser.getNickName()
                        ,gameThreeballMixedOdds.getMixedOddsId().toString()
                        ,"[" + actionUser.getNickName() + "],修改游戏[" + gameInfo.getGameName() + "],0,9大于下限赔率["+ oldThreeballMixedOdds.getGreaterZeroNineOdd() + "] ->[" + gameThreeballMixedOdds.getGreaterZeroNineOdd() + "],时间：" + DateUtils.getTime()
                );
            }

        }

        gameThreeballMixedOdds.setUpdateTime(DateUtils.getNowDate());
        return gameThreeballMixedOddsMapper.updateGameThreeballMixedOdds(gameThreeballMixedOdds);
    }

    public void insertAdminActionLog(Long adminUserId, String adminUserName, String targetIp, String remark){

        SysAdminActionLog sysAdminActionLog = new SysAdminActionLog();
        sysAdminActionLog.setType("4");//修改赔率
        sysAdminActionLog.setAdminUserId(adminUserId);
        sysAdminActionLog.setAdminUserName(adminUserName);
        sysAdminActionLog.setActionLoginIp(IpUtils.getIpAddr());
        sysAdminActionLog.setActionTargetIp(targetIp);
        sysAdminActionLog.setCreateBy(adminUserName);
        sysAdminActionLog.setRemark(remark);
        sysAdminActionLogService.insertSysAdminActionLog(sysAdminActionLog);
    }

    /**
     * 批量删除3球特殊赔率
     * 
     * @param mixedOddsIds 需要删除的3球特殊赔率主键
     * @return 结果
     */
    @Override
    public int deleteGameThreeballMixedOddsByMixedOddsIds(Long[] mixedOddsIds)
    {
        return gameThreeballMixedOddsMapper.deleteGameThreeballMixedOddsByMixedOddsIds(mixedOddsIds);
    }

    /**
     * 删除3球特殊赔率信息
     * 
     * @param mixedOddsId 3球特殊赔率主键
     * @return 结果
     */
    @Override
    public int deleteGameThreeballMixedOddsByMixedOddsId(Long mixedOddsId)
    {
        return gameThreeballMixedOddsMapper.deleteGameThreeballMixedOddsByMixedOddsId(mixedOddsId);
    }

    @Override
    public GameThreeballMixedOdds selectGameThreeballMixedOddsByGameId(GameThreeballMixedOdds gameThreeballMixedOdds) {
        return gameThreeballMixedOddsMapper.selectGameThreeballMixedOddsByGameId(gameThreeballMixedOdds);
    }
}
