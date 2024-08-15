package com.ruoyi.quartz.service;

import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.domain.vo.GameOpenDataDto;

import java.util.List;
import java.util.Map;

public interface IGameTaskService {

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

    // 定时3球开奖结算
    public void lotteryThreeBallBalance(String gameCode);

    // 定时5球开奖结算
    public void lotteryFiveBallBalance(String gameCode);

    // 定时10球开奖结算
    public void lotteryTenBallBalance(String gameCode);

    public void insertRobotBet();

    public void autoKajiangLottery();

    public void autoAllRepairLottery();
//
//    // 定时保存澳洲幸运10官方开奖结果
//    public void saveAzxy10InfoFromOfficial(List<GameOpenDataDto> openDataList, Map<Long , GameOpenDataDto> gameOpenDataDtoMap);
//
//    // 定时澳洲幸运10开奖结算
//    public void lotteryAzxy10Balance(String gameCode);
//
//    // 定时保存加拿大2.8官方开奖结果
//    public void saveJndInfoFromOfficial(List<GameOpenDataDto> openDataList, Map<Long , GameOpenDataDto> gameOpenDataDtoMap);
//
//    // 定时加拿大2.8开奖结算
//    public void lotteryJndBalance(String gameCode);
//
//    // 定时保存急速时时彩官方开奖结果
//    public void saveJssscInfoFromOfficial(List<GameOpenDataDto> openDataList, Map<Long , GameOpenDataDto> gameOpenDataDtoMap);
//
//    // 定时急速时时彩开奖结算
//    public void lotteryJssscBalance(String gameCode);
}
