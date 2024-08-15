package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.domain.vo.*;

import java.util.List;
import java.util.Map;

/**
 * 开奖Service接口
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public interface IBetkjService
{

    /**
     * 查询开奖列表
     * 
     * @param betkjReqVO 开奖
     * @return 开奖集合
     */
    public List<BetkjRespVo> selectBetkjList(SysGame gameInfo, BetkjReqVO betkjReqVO);

    public void BetRepair(BetRepairReqVO vo);

    public void handleLottery(HandleLotteryReqVO vo);

    // 定时保存3球的官方开奖结果
    public void saveThreeBallInfoFromOfficial(String gameCode, List<GameOpenDataDto> openDataList, Map<Long , GameOpenDataDto> gameOpenDataDtoMap);

    // 定时保存3球的系统开奖结果
    public void saveThreeBallInfoFromSystem(SysGame gameInfo);

    // 定时保存5球的官方开奖结果
    public void saveFiveBallInfoFromOfficial(String gameCode, List<GameOpenDataDto> openDataList, Map<Long , GameOpenDataDto> gameOpenDataDtoMap);

    // 定时保存5球的系统开奖结果
    public void saveFiveBallInfoFromSystem(SysGame gameInfo);

    // 定时保存10球的官方开奖结果
    public void saveTenBallInfoFromOfficial(String gameCode, List<GameOpenDataDto> openDataList, Map<Long , GameOpenDataDto> gameOpenDataDtoMap);

    // 定时保存10球的系统开奖结果
    public void saveTenBallInfoFromSystem(SysGame gameInfo);

    public void openThreeBallSystemExpectData(SysGame gameInfo);

    public void openFiveBallSystemExpectData(SysGame gameInfo);

    public void openTenBallSystemExpectData(SysGame gameInfo);

    public List<BetUserWinRespVo> selectUserGameWinBetList(SysGame gameInfo, BetUserWinReqVO betUserWinReqVO);

    public void betUserDeduct(BetUserDeductReqVO vo);

    public void autoKajiangLottery();
}
