package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysGame;

public interface IFiveBallLotteryService {
    public void lotteryFiveBall(String gameCode);

    public void createFiveBallData(SysGame gameInfo);
}
