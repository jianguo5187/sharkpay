package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysGame;

public interface ITenBallLotteryService {
    public void lotteryTenBall(String gameCode);

    public void createTenballData(SysGame gameInfo);

    public void lotteryGameTenballOpenData(SysGame gameInfo, Long periodId);
}
