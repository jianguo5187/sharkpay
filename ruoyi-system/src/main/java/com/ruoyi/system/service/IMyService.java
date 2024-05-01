package com.ruoyi.system.service;

import com.ruoyi.system.domain.Usermoney;
import com.ruoyi.system.domain.vo.*;

import java.util.List;

public interface IMyService {

    public YkInfoRespVO getTodayYkInfo(Long userId);

    public YkInfoRespVO getYesdayYkInfo(Long userId);

    public FyRespVO getFyList(Long userId, FyListReqVO vo);

    public FxRespVO getFxList(Long userId, FyListReqVO vo);

    public List<Usermoney> getUserMoneylList(Long userId, ChangeListReqVO vo);

    public void clearUsermoneyInfo(Long userId);
}
