package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.GameTenballKj;
import com.ruoyi.system.domain.GameThreeballRecord;
import com.ruoyi.system.domain.SysBetItem;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.mapper.BetRecordMapper;
import com.ruoyi.system.service.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class GameTenBallsServiceImpl implements IGameTenBallsService {

    @Autowired
    private ISysBetItemService sysBetItemService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysAppService sysAppService;

    @Autowired
    private IGameThreeballRecordService gameThreeballRecordService;

    @Autowired
    private IGameTenballKjService gameTenballKjService;

    @Autowired
    private BetRecordMapper betRecordMapper;

    @Override
    public List<SysBetItem> getOddsInfo(TenBallsOddsReqVO vo) {
        SysBetItem searchBetItem = new SysBetItem();
        searchBetItem.setGameId(vo.getGameId());
        searchBetItem.setStatus("0");

        return sysBetItemService.selectSysBetItemList(searchBetItem);
    }

    @Override
    public TenBallKjRecordMoneyRespVO kjRecordMoney(Long userId, TenBallsOddsReqVO vo) {
        SysUser user = userService.selectUserById(userId);
        TenBallKjRecordMoneyRespVO respVO = new TenBallKjRecordMoneyRespVO();
        respVO.setMoney(user.getAmount());
        respVO.setRecordStatus("0");
        respVO.setProfitLossMoney(0f);

        GameResultListReqVO reqVO = new GameResultListReqVO();
        reqVO.setGameId(vo.getGameId());
        reqVO.setPageNumber(1);
        reqVO.setPageRowCount(1);
        List<GameResultListRespVO> tenBallsGameResultList = sysAppService.gameResultList(userId,reqVO);
        if(tenBallsGameResultList != null && tenBallsGameResultList.size() > 0){
            GameResultListRespVO tenBllsGameResult = tenBallsGameResultList.get(0);
            BeanUtils.copyProperties(tenBllsGameResult,respVO);
            respVO.setLotteryStatus("1");

            GameThreeballRecord searchGameThreeballRecord = new GameThreeballRecord();
            searchGameThreeballRecord.setGameId(vo.getGameId());
            searchGameThreeballRecord.setUserId(userId);
            searchGameThreeballRecord.setPeriods(tenBllsGameResult.getPeriods());
            List<GameThreeballRecord> gameThreeballRecordList = gameThreeballRecordService.selectGameThreeballRecordList(searchGameThreeballRecord);
            if(gameThreeballRecordList != null && gameThreeballRecordList.size() > 0){
                respVO.setRecordStatus("1");
                respVO.setProfitLossMoney(gameThreeballRecordList.get(0).getWinMoney() - gameThreeballRecordList.get(0).getCountMoney());
            }
        }else{
            respVO.setLotteryStatus("0");
        }

        return respVO;
    }

    @Override
    public TenBallsTimeDateRespVO timeDate(TenBallsOddsReqVO vo) {
        GameTenballKj searchGameTenballKj = new GameTenballKj();
        TenBallsTimeDateRespVO respVO = new TenBallsTimeDateRespVO();
        searchGameTenballKj.setGameId(vo.getGameId());
        searchGameTenballKj.setStatus("0"); // 未开奖
        List<GameTenballKj> gameTenballKjList = gameTenballKjService.selectGameTenballKjList(searchGameTenballKj);
        Date date = new Date();
        if(gameTenballKjList != null && gameTenballKjList.size() > 0){
            GameTenballKj firstGameTenballKj = gameTenballKjList.get(0);
            if(firstGameTenballKj.getPreTime().compareTo(date) > 0){
                Long preTime = firstGameTenballKj.getPreTime().getTime() - date.getTime();
                Long betTime = firstGameTenballKj.getBetTime().getTime() - date.getTime();
                respVO.setPeriods(firstGameTenballKj.getPeriods());
                respVO.setGameId(firstGameTenballKj.getGameId());
                respVO.setGameName(firstGameTenballKj.getGameName());
                respVO.setPreTime(preTime/ 1000L);
                respVO.setBetTime(betTime/ 1000L);
            }else{
                GameTenballKj lasterGameTenballKj = gameTenballKjList.get(gameTenballKjList.size()-1);
                Long preTime = lasterGameTenballKj.getPreTime().getTime() - date.getTime();
                Long betTime = lasterGameTenballKj.getBetTime().getTime() - date.getTime();
                respVO.setPeriods(lasterGameTenballKj.getPeriods());
                respVO.setGameId(lasterGameTenballKj.getGameId());
                respVO.setGameName(lasterGameTenballKj.getGameName());
                respVO.setPreTime(preTime/ 1000L);
                respVO.setBetTime(betTime/ 1000L);
            }
        }

        return respVO;
    }

    @Override
    public List<BetRecordListRespVO> betRecordList(Long userId, TenBallsBetRecordListReqVO vo) {
        if(StringUtils.isNull(vo.getPageNumber())){
            vo.setPageNumber(1);
        }
        if(StringUtils.isNull(vo.getPageRowCount())){
            vo.setPageRowCount(20);
        }
        return betRecordMapper.selectBetRecordListByPeriods(vo.getGameId(), vo.getPeriods(), vo.getPageNumber(), vo.getPageRowCount());
    }

    @Override
    public List<VirtuallyGameRecordRespVO> virtuallyGameRecord(Long userId, VirtuallyGameRecordReqVO vo) {
        List<VirtuallyGameRecordRespVO> respVO = new ArrayList<>();
        Date date = new Date();
        return respVO;
    }
}
