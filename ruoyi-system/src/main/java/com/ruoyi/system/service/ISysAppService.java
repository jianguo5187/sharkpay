package com.ruoyi.system.service;

import com.ruoyi.system.domain.vo.*;

import java.util.List;

public interface ISysAppService {

    public List<GameListRespVO> gameRecordList(Long userId, GameListReqVO vo);

    public GameDetailRespVO gameRecordDetail(Long userId, GameDetailReqVO vo);

    public void clearGameRecode(Long userId);

    public List<GameResultListRespVO> gameResultList(Long userId, GameResultListReqVO vo);
}
