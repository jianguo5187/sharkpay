package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysBetItem;
import com.ruoyi.system.domain.vo.*;

import java.util.List;

public interface IGameTenBallsService {

    public List<SysBetItem> getOddsInfo(TenBallsOddsReqVO vo);

    public TenBallKjRecordMoneyRespVO kjRecordMoney(Long userId,TenBallsOddsReqVO vo);

    public TenBallsTimeDateRespVO timeDate(TenBallsOddsReqVO vo);

    public List<BetRecordListRespVO> betRecordList(Long userId, TenBallsBetRecordListReqVO vo);

    public List<VirtuallyGameRecordRespVO> virtuallyGameRecord(Long userId, VirtuallyGameRecordReqVO vo, Boolean taskFlg);

    public void addTenBallsBetRecord(Long userId,TenBallsAddBetRecordReqVO vo);

    public void addTenBallsMultiBetRecord(Long userId,TenBallsAddMultiBetRecordReqVO vo);

    public void delTenBallsBetRecord(Long userId,DelBetRecordReqVO vo);
}
