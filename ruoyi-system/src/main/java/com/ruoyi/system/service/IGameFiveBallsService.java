package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysBetItem;
import com.ruoyi.system.domain.SysBetType;
import com.ruoyi.system.domain.vo.*;

import java.util.List;

public interface IGameFiveBallsService {

    public List<SysBetType> getOddsInfo(FiveBallsOddsReqVO vo);

    public FiveBallKjRecordMoneyRespVO kjRecordMoney(Long userId, FiveBallsOddsReqVO vo);

    public FiveBallsTimeDateRespVO timeDate(FiveBallsOddsReqVO vo);

    public List<BetRecordListRespVO> betRecordList(Long userId, FiveBallsBetRecordListReqVO vo);

    public List<VirtuallyGameRecordRespVO> virtuallyGameRecord(Long userId, VirtuallyGameRecordReqVO vo, Boolean taskFlg);

    public Long addFiveBallsBetRecord(Long userId,FiveBallsAddBetRecordReqVO vo);

    public Long addFiveBallsMultiBetRecord(Long userId,FiveBallsAddMultiBetRecordReqVO vo);

    public void delFiveBallsBetRecord(Long userId,DelBetRecordReqVO vo);

    public Long addFiveBallsAutoBetRecord(Long userId,AddAutoBetRecordReqVO vo);
}
