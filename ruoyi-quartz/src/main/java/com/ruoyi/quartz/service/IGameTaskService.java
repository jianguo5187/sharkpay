package com.ruoyi.quartz.service;

import com.ruoyi.quartz.domain.GameOpenDataDto;

import java.util.List;
import java.util.Map;

public interface IGameTaskService {

    // 定时保存澳洲幸运10官方开奖结果
    public void saveAzxy10InfoFromOfficial(List<GameOpenDataDto> openDataList, Map<Long , GameOpenDataDto> gameOpenDataDtoMap);

    // 定时澳洲幸运10开奖结算
    public void lotteryAzxy10Balance(String gameCode);

    // 定时保存加拿大2.8官方开奖结果
    public void saveJndInfoFromOfficial(List<GameOpenDataDto> openDataList, Map<Long , GameOpenDataDto> gameOpenDataDtoMap);

    // 定时加拿大2.8开奖结算
    public void lotteryJndBalance(String gameCode);

    // 定时保存急速时时彩官方开奖结果
    public void saveJssscInfoFromOfficial(List<GameOpenDataDto> openDataList, Map<Long , GameOpenDataDto> gameOpenDataDtoMap);

    // 定时急速时时彩开奖结算
    public void lotteryJssscBalance(String gameCode);
}
