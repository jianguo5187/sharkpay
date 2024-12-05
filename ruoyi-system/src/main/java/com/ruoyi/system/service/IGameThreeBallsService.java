package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysBetItem;
import com.ruoyi.system.domain.SysBetType;
import com.ruoyi.system.domain.vo.*;

import java.util.List;

public interface IGameThreeBallsService {

    public List<SysBetType> getOddsInfo(ThreeBallsOddsReqVO vo);

    public ThreeBallKjRecordMoneyRespVO kjRecordMoney(Long userId,ThreeBallsOddsReqVO vo);

    public ThreeBallsTimeDateRespVO timeDate(ThreeBallsOddsReqVO vo);

    public List<BetRecordListRespVO> betRecordList(Long userId, ThreeBallsBetRecordListReqVO vo);

    public List<VirtuallyGameRecordRespVO> virtuallyGameRecord(Long userId, VirtuallyGameRecordReqVO vo, Boolean taskFlg);

    public Long addThreeBallsBetRecord(Long userId,ThreeBallsAddBetRecordReqVO vo);

    public Long addThreeBallsMultiBetRecord(Long userId,ThreeBallsAddMultiBetRecordReqVO vo);

    public void delThreeBallsBetRecord(Long userId,DelBetRecordReqVO vo);
    public Long addThreeBallsAutoBetRecord(Long userId,AddAutoBetRecordReqVO vo);

    public List<BetRecordListRespVO> userBetRecord(Long userId, ThreeBallsBetRecordListReqVO vo);
}
