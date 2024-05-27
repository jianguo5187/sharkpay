package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysGame;

public interface IThreeBallLotteryService {
    public void lotteryThreeBall(String gameCode);

    public void createThreeData(SysGame gameInfo);

    public void lotteryGameThreeballOpenData(SysGame gameInfo, Long periodId);
}
