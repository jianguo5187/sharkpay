package com.ruoyi.system.service;

import com.ruoyi.system.domain.vo.GameListReqVO;
import com.ruoyi.system.domain.vo.GameListRespVO;

import java.util.List;

public interface ISysAppService {

    public List<GameListRespVO> gameRecordList(Long userId, GameListReqVO vo);
}
