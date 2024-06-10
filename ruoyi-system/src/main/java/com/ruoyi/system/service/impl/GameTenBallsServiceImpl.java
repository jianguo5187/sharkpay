package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.EntityMapTransUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.mapper.BetRecordMapper;
import com.ruoyi.system.mapper.FalseUserMapper;
import com.ruoyi.system.mapper.UsermoneyMapper;
import com.ruoyi.system.service.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class GameTenBallsServiceImpl implements IGameTenBallsService {

    @Autowired
    private ISysBetItemService sysBetItemService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysAppService sysAppService;

    @Autowired
    private IGameTenballRecordService gameTenballRecordService;

    @Autowired
    private IGameTenballKjService gameTenballKjService;

    @Autowired
    private ISysDictDataService dictDataService;

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private BetRecordMapper betRecordMapper;

    @Autowired
    private FalseUserMapper falseUserMapper;

    @Autowired
    private UsermoneyMapper usermoneyMapper;


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

            GameTenballRecord searchGameTenballRecord = new GameTenballRecord();
            searchGameTenballRecord.setGameId(vo.getGameId());
            searchGameTenballRecord.setUserId(userId);
            searchGameTenballRecord.setPeriods(tenBllsGameResult.getPeriods());
            List<GameTenballRecord> gameTenballRecordList = gameTenballRecordService.selectGameTenballRecordList(searchGameTenballRecord);
            if(gameTenballRecordList != null && gameTenballRecordList.size() > 0){
                respVO.setRecordStatus("1");
                respVO.setProfitLossMoney(gameTenballRecordList.get(0).getWinMoney() - gameTenballRecordList.get(0).getCountMoney());
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
        return betRecordMapper.selectBetRecordListByPeriods(vo.getGameId(), vo.getPeriods(), (vo.getPageNumber()-1)*vo.getPageRowCount(), vo.getPageRowCount());
    }

    @Override
    public List<VirtuallyGameRecordRespVO> virtuallyGameRecord(Long userId, VirtuallyGameRecordReqVO vo, Boolean taskFlg) {
        List<VirtuallyGameRecordRespVO> respVO = new ArrayList<>();
        Date date = new Date();
        GameTenballKj gameTenballKj = gameTenballKjService.selectGameTenballKjByPeriods(vo.getGameId(), vo.getPeriods());

        if(gameTenballKj.getPreTime().compareTo(date) < 0){
            return respVO;
        }

        SysGame gameInfo = sysGameService.selectSysGameByGameId(vo.getGameId());
        Random random = new Random();
        BigDecimal result = new BigDecimal(gameInfo.getRobotRate()).divide(new BigDecimal(100), 2, RoundingMode.HALF_UP);
        double virtuallyRandow = result.doubleValue();
        double randomValue = random.nextDouble();
        //产生虚假数据的概率
        if(randomValue < virtuallyRandow) {

            List<FalseUser> falseUserList = falseUserMapper.selectFalseUserListByGameId(vo.getGameId());
            if(falseUserList != null && falseUserList.size() > 0){
                FalseUser falseUser = falseUserList.get(random(1,falseUserList.size()) - 1);

                Integer type = 0;
                String playType = "";
                String num = "";
                String money = "";

                String[] numArg = falseUser.getRobotBetNum().split("\\|");
                String[] moneyArg = falseUser.getRobotBetMoney().split("\\|");

                money = moneyArg[random(1,moneyArg.length)-1];

                if(falseUser.getPlayType() == 0){
                    type = 1;
                    playType = "冠亚和";
                }else{
                    type = random(2,11);
                    playType = "第" + (type - 1) + "名";
                }
                FalseUser searchFalseUser = new FalseUser();
                List<FalseUser> allFalseUserList = falseUserMapper.selectFalseUserList(searchFalseUser);

                FalseUser virtuallyGameUser = allFalseUserList.get(random(1,allFalseUserList.size()) - 1);

                int cishu = random(3,7);
                Date now = new Date();

                for(int i=0;i<cishu;i++){

                    num = numArg[random(1,numArg.length)-1];

                    BetRecord betrecord = new BetRecord();
                    betrecord.setUserId(0l);
                    betrecord.setPeriods(vo.getPeriods());
                    betrecord.setGameId(vo.getGameId());
                    betrecord.setGameName(gameTenballKj.getGameName());
                    betrecord.setPlayType(playType);
                    betrecord.setPlayDetail(num);
                    betrecord.setPlayGroup(type);
                    betrecord.setOption(0);
                    betrecord.setMoney(changeLongNumber(money));
                    betrecord.setBalance(0f);
                    betrecord.setAccountResult(0f);
                    betrecord.setSettleFlg("0");
                    betrecord.setGameResult("");
                    betrecord.setIsDelete("0");
                    betrecord.setIsRobot("1");
                    betrecord.setHouseId(1l);
                    betrecord.setRobotNickName(virtuallyGameUser.getUserName());
                    betrecord.setRobotPic(virtuallyGameUser.getRobotPic());
                    int insertIndex = betRecordMapper.insertBetRecord(betrecord);

                    if(insertIndex > 0){
                        VirtuallyGameRecordRespVO virtuallyGameRecord = new VirtuallyGameRecordRespVO();
                        virtuallyGameRecord.setHouse("31");
                        virtuallyGameRecord.setNickName(virtuallyGameUser.getUserName());
                        virtuallyGameRecord.setPic(virtuallyGameUser.getRobotPic());
                        virtuallyGameRecord.setStime(now);
                        virtuallyGameRecord.setNumber(num);
                        virtuallyGameRecord.setMoney(changeLongNumber(money));
                        virtuallyGameRecord.setType(type);
                        virtuallyGameRecord.setPeriods(vo.getPeriods());
                        virtuallyGameRecord.setPlayType(playType);
                        respVO.add(virtuallyGameRecord);
                    }
                }
            }
        }
        return respVO;
    }

    @Override
    public void addTenBallsBetRecord(Long userId, TenBallsAddBetRecordReqVO vo) {
        Date date = new Date();
        GameTenballKj gameTenballKj = gameTenballKjService.selectGameTenballKjByPeriods(vo.getGameId(), vo.getPeriods());
        if(gameTenballKj.getBetTime() == null || gameTenballKj.getBetTime().compareTo(date) < 0){
            throw new ServiceException("当前期数已截止,请等待开奖后在投注");
        }
        SysUser user = userService.selectUserById(userId);
        String[] betNumberArg = vo.getNumber().split(",");
        if(user.getAmount().compareTo(vo.getMoney() * betNumberArg.length)<0){
            throw new ServiceException("用户余额不足");
        }
        GameTenballRecord searchGameTenballRecord = new GameTenballRecord();
        searchGameTenballRecord.setGameId(vo.getGameId());
        searchGameTenballRecord.setUserId(userId);
        searchGameTenballRecord.setPeriods(vo.getPeriods());
        searchGameTenballRecord.setStatus("0");
        List<GameTenballRecord> gameTenballRecordList = gameTenballRecordService.selectGameTenballRecordList(searchGameTenballRecord);

        GameTenballRecord gameTenballRecord = null;
        if(gameTenballRecordList != null && gameTenballRecordList.size() >0){
            gameTenballRecord = gameTenballRecordList.get(0);
        }

        checkBetTenBallLimitAmount(gameTenballRecord, vo.getNumber(), vo.getMoney(), vo.getType());

        String playType = "";

        if(vo.getType() == 1){
            playType = "冠亚和";
        }else{
            playType = "第" + (vo.getType()-1) + "名";
        }

        Float userAmount = user.getAmount();
        for(int i=0; i<betNumberArg.length; i++){

            searchGameTenballRecord = new GameTenballRecord();
            searchGameTenballRecord.setGameId(vo.getGameId());
            searchGameTenballRecord.setUserId(userId);
            searchGameTenballRecord.setPeriods(vo.getPeriods());
            List<GameTenballRecord> newGameTenballRecordList = gameTenballRecordService.selectGameTenballRecordList(searchGameTenballRecord);
            if(newGameTenballRecordList != null && newGameTenballRecordList.size() >0){
                GameTenballRecord updateGameTenballRecord = newGameTenballRecordList.get(0);

                Map<String, Object> updateGameTenballMap = EntityMapTransUtils.entityToMap1(updateGameTenballRecord);

                if(vo.getType() == 1){
                    if("单".equals(betNumberArg[i])){
                        Float betMoney = updateGameTenballRecord.getType1Single() + vo.getMoney();
                        updateGameTenballRecord.setType1Single(betMoney);
                    }else if("双".equals(betNumberArg[i])){

                        Float betMoney = updateGameTenballRecord.getType1Double() + vo.getMoney();
                        updateGameTenballRecord.setType1Double(betMoney);
                    }else if("大".equals(betNumberArg[i])){

                        Float betMoney = updateGameTenballRecord.getType1Big() + vo.getMoney();
                        updateGameTenballRecord.setType1Big(betMoney);
                    }else if("小".equals(betNumberArg[i])){

                        Float betMoney = updateGameTenballRecord.getType1Small() + vo.getMoney();
                        updateGameTenballRecord.setType1Small(betMoney);
                    }else{
                        Object betRecordAmountObject = updateGameTenballMap.get("type1Num" +betNumberArg[i]);
                        Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                        Float betMoney = betRecordAmount + vo.getMoney();
                        updateGameTenballMap.put("type1Num" +betNumberArg[i], betMoney);

                        updateGameTenballRecord = EntityMapTransUtils.mapToEntity1(GameTenballRecord.class, updateGameTenballMap);
                    }
                }else{
                    String columnKey = "";
                    if("单".equals(betNumberArg[i])){
                        columnKey = "type"+(vo.getType() - 1) + "Single" ;
                    }else if("双".equals(betNumberArg[i])){
                        columnKey = "type"+(vo.getType() - 1) + "Double";
                    }else if("大".equals(betNumberArg[i])){
                        columnKey = "type"+(vo.getType() - 1) + "Big";
                    }else if("小".equals(betNumberArg[i])){
                        columnKey = "type"+(vo.getType() - 1) + "Small";
                    }else if("龙".equals(betNumberArg[i]) && (vo.getType()-1) < 6){
                        columnKey = "type"+(vo.getType() - 1) + "Loong";
                    }else if("虎".equals(betNumberArg[i]) && (vo.getType()-1) < 6){
                        columnKey = "type"+(vo.getType() - 1) + "Tiger";
                    }else{
                        columnKey = "type"+(vo.getType() - 1) + "Num" +betNumberArg[i];
                    }

                    Object betRecordAmountObject = updateGameTenballMap.get(columnKey);
                    Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                    Float betMoney = betRecordAmount + vo.getMoney();
                    updateGameTenballMap.put(columnKey, betMoney);

                    updateGameTenballRecord = EntityMapTransUtils.mapToEntity1(GameTenballRecord.class, updateGameTenballMap);
                }
                updateGameTenballRecord.setCountMoney(updateGameTenballRecord.getCountMoney() + vo.getMoney());
                updateGameTenballRecord.setHouse(1);
                updateGameTenballRecord.setRecordTime(date);
                gameTenballRecordService.updateGameTenballRecord(updateGameTenballRecord);
            }else{
                GameTenballRecord newGameTenballRecord = new GameTenballRecord();

                Map<String, Object> newGameTenballMap = EntityMapTransUtils.entityToMap1(newGameTenballRecord);

                if(vo.getType() == 1){
                    if("单".equals(betNumberArg[i])){
                        newGameTenballRecord.setType1Single(vo.getMoney());
                    }else if("双".equals(betNumberArg[i])){
                        newGameTenballRecord.setType1Double(vo.getMoney());
                    }else if("大".equals(betNumberArg[i])){
                        newGameTenballRecord.setType1Big(vo.getMoney());
                    }else if("小".equals(betNumberArg[i])){
                        newGameTenballRecord.setType1Small(vo.getMoney());
                    }else{
                        Object betRecordAmountObject = newGameTenballMap.get("type1Num" +betNumberArg[i]);
                        Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                        Float betMoney = betRecordAmount + vo.getMoney();
                        newGameTenballMap.put("type1Num" +betNumberArg[i], betMoney);

                        newGameTenballRecord = EntityMapTransUtils.mapToEntity1(GameTenballRecord.class, newGameTenballMap);
                    }
                }else{
                    String columnKey = "";
                    if("单".equals(betNumberArg[i])){
                        columnKey = "type"+(vo.getType() - 1) + "Single";
                    }else if("双".equals(betNumberArg[i])){
                        columnKey = "type"+(vo.getType() - 1) + "Double";
                    }else if("大".equals(betNumberArg[i])){
                        columnKey = "type"+(vo.getType() - 1) + "Big";
                    }else if("小".equals(betNumberArg[i])){
                        columnKey = "type"+(vo.getType() - 1) + "Small";
                    }else if("龙".equals(betNumberArg[i]) && (vo.getType()-1) < 6){
                        columnKey = "type"+(vo.getType() - 1) + "Loong";
                    }else if("虎".equals(betNumberArg[i]) && (vo.getType()-1) < 6){
                        columnKey = "type"+(vo.getType() - 1) + "Tiger";
                    }else{
                        columnKey = "type"+(vo.getType() - 1) + "Num" +betNumberArg[i];
                    }

                    Object betRecordAmountObject = newGameTenballMap.get(columnKey);
                    Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                    Float betMoney = betRecordAmount + vo.getMoney();
                    newGameTenballMap.put(columnKey, betMoney);

                    newGameTenballRecord = EntityMapTransUtils.mapToEntity1(GameTenballRecord.class, newGameTenballMap);
                }

                newGameTenballRecord.setGameId(vo.getGameId());
                newGameTenballRecord.setGameName(gameTenballKj.getGameName());

                newGameTenballRecord.setUserId(userId);
                newGameTenballRecord.setPeriods(vo.getPeriods());
                newGameTenballRecord.setStatus("0");
                newGameTenballRecord.setCountMoney(vo.getMoney());
                newGameTenballRecord.setHouse(1);
                gameTenballRecordService.insertGameTenballRecord(newGameTenballRecord);
            }

            userAmount = userAmount - vo.getMoney();

            BetRecord betrecord = new BetRecord();
            betrecord.setIsRobot("0");
            betrecord.setUserId(userId);
            betrecord.setPeriods(vo.getPeriods());
            betrecord.setGameId(vo.getGameId());
            betrecord.setGameName(gameTenballKj.getGameName());

            betrecord.setPlayType(playType);
            betrecord.setPlayDetail(betNumberArg[i]);
            betrecord.setPlayGroup(vo.getType());
            betrecord.setOption(0);
            betrecord.setMoney(vo.getMoney());
            betrecord.setBalance(userAmount);
            betrecord.setAccountResult(0f);
            betrecord.setSettleFlg("0");
            betrecord.setGameResult("");
            betrecord.setIsDelete("0");
            betrecord.setHouseId(1l);
            betRecordMapper.insertBetRecord(betrecord);

            Usermoney usermoney = new Usermoney();
            usermoney.setUserId(userId);
            usermoney.setGameId(vo.getGameId());
            usermoney.setGameName(gameTenballKj.getGameName());
            usermoney.setRemark(gameTenballKj.getGameName() + "-" + vo.getPeriods() + playType + betNumberArg[i]);
            usermoney.setCashMoney(vo.getMoney());
            usermoney.setUserBalance(userAmount);
            usermoney.setType("7");
            usermoney.setCashContent(vo.getPeriods().toString());
            usermoneyMapper.insertUsermoney(usermoney);
        }

        user.setAmount(userAmount);
        userService.updateUserAmount(user);
    }

    @Override
    public void addTenBallsMultiBetRecord(Long userId, TenBallsAddMultiBetRecordReqVO vo) {

        SysUser user = userService.selectUserById(userId);
        Date date = new Date();
        GameTenballKj gameTenballKj = gameTenballKjService.selectGameTenballKjByPeriods(vo.getGameId(), vo.getPeriods());
        if(gameTenballKj.getBetTime() == null || gameTenballKj.getBetTime().compareTo(date) < 0){
            throw new ServiceException("当前期数已截止,请等待开奖后在投注");
        }
        Float totalRecordMoney = 0f;

        for(TenBallsMultiBetRecordReqVO tenBallsMultiBetRecordReqVO : vo.getRecordList()){
            String[] betNumberArg = tenBallsMultiBetRecordReqVO.getNumber().split(",");
            totalRecordMoney = totalRecordMoney + (tenBallsMultiBetRecordReqVO.getMoney() * betNumberArg.length);
        }
        if(user.getAmount().compareTo(totalRecordMoney)<0){
            throw new ServiceException("用户余额不足");
        }

        GameTenballRecord searchGameTenballRecord = new GameTenballRecord();
        searchGameTenballRecord.setGameId(vo.getGameId());
        searchGameTenballRecord.setUserId(userId);
        searchGameTenballRecord.setPeriods(vo.getPeriods());
        searchGameTenballRecord.setStatus("0");
        List<GameTenballRecord> gameTenballRecordList = gameTenballRecordService.selectGameTenballRecordList(searchGameTenballRecord);

        GameTenballRecord gameTenballRecord = null;
        if(gameTenballRecordList != null && gameTenballRecordList.size() >0){
            gameTenballRecord = gameTenballRecordList.get(0);
        }

        for(TenBallsMultiBetRecordReqVO tenBallsMultiBetRecordReqVO : vo.getRecordList()) {

            checkBetTenBallLimitAmount(gameTenballRecord, tenBallsMultiBetRecordReqVO.getNumber(), tenBallsMultiBetRecordReqVO.getMoney(), tenBallsMultiBetRecordReqVO.getType());
        }

        Float userAmount = user.getAmount();
        for(TenBallsMultiBetRecordReqVO tenBallsMultiBetRecordReqVO : vo.getRecordList()) {
            String[] betNumberArg = tenBallsMultiBetRecordReqVO.getNumber().split(",");
            String playType = "";

            if (tenBallsMultiBetRecordReqVO.getType() == 1) {
                playType = "冠亚和";
            } else {
                playType = "第" + (tenBallsMultiBetRecordReqVO.getType() - 1) + "名";
            }

            for (int i = 0; i < betNumberArg.length; i++) {
                searchGameTenballRecord = new GameTenballRecord();
                searchGameTenballRecord.setGameId(vo.getGameId());
                searchGameTenballRecord.setUserId(userId);
                searchGameTenballRecord.setPeriods(vo.getPeriods());
                List<GameTenballRecord> newGameTenballRecordList = gameTenballRecordService.selectGameTenballRecordList(searchGameTenballRecord);
                if(newGameTenballRecordList != null && newGameTenballRecordList.size() >0){
                    GameTenballRecord updateGameTenballRecord = newGameTenballRecordList.get(0);

                    Map<String, Object> updateGameTenballMap = EntityMapTransUtils.entityToMap1(updateGameTenballRecord);

                    if(tenBallsMultiBetRecordReqVO.getType() == 1){
                        if("单".equals(betNumberArg[i])){
                            Float betMoney = updateGameTenballRecord.getType1Single() + tenBallsMultiBetRecordReqVO.getMoney();
                            updateGameTenballRecord.setType1Single(betMoney);
                        }else if("双".equals(betNumberArg[i])){

                            Float betMoney = updateGameTenballRecord.getType1Double() + tenBallsMultiBetRecordReqVO.getMoney();
                            updateGameTenballRecord.setType1Double(betMoney);
                        }else if("大".equals(betNumberArg[i])){

                            Float betMoney = updateGameTenballRecord.getType1Big() + tenBallsMultiBetRecordReqVO.getMoney();
                            updateGameTenballRecord.setType1Big(betMoney);
                        }else if("小".equals(betNumberArg[i])){

                            Float betMoney = updateGameTenballRecord.getType1Small() + tenBallsMultiBetRecordReqVO.getMoney();
                            updateGameTenballRecord.setType1Small(betMoney);
                        }else{
                            Object betRecordAmountObject = updateGameTenballMap.get("type1Num" +betNumberArg[i]);
                            Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                            Float betMoney = betRecordAmount + tenBallsMultiBetRecordReqVO.getMoney();
                            updateGameTenballMap.put("type1Num" +betNumberArg[i], betMoney);

                            updateGameTenballRecord = EntityMapTransUtils.mapToEntity1(GameTenballRecord.class, updateGameTenballMap);
                        }
                    }else{
                        String columnKey = "";
                        if("单".equals(betNumberArg[i])){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType() - 1) + "Single" ;
                        }else if("双".equals(betNumberArg[i])){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType() - 1) + "Double";
                        }else if("大".equals(betNumberArg[i])){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType() - 1) + "Big";
                        }else if("小".equals(betNumberArg[i])){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType() - 1) + "Small";
                        }else if("龙".equals(betNumberArg[i]) && (tenBallsMultiBetRecordReqVO.getType()-1) < 6){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType() - 1) + "Loong";
                        }else if("虎".equals(betNumberArg[i]) && (tenBallsMultiBetRecordReqVO.getType()-1) < 6){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType() - 1) + "Tiger";
                        }else{
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType() - 1) + "Num" +betNumberArg[i];
                        }

                        Object betRecordAmountObject = updateGameTenballMap.get(columnKey);
                        Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                        Float betMoney = betRecordAmount + tenBallsMultiBetRecordReqVO.getMoney();
                        updateGameTenballMap.put(columnKey, betMoney);

                        updateGameTenballRecord = EntityMapTransUtils.mapToEntity1(GameTenballRecord.class, updateGameTenballMap);
                    }
                    updateGameTenballRecord.setCountMoney(updateGameTenballRecord.getCountMoney() + tenBallsMultiBetRecordReqVO.getMoney());
                    updateGameTenballRecord.setHouse(1);
                    updateGameTenballRecord.setRecordTime(date);
                    gameTenballRecordService.updateGameTenballRecord(updateGameTenballRecord);
                }else{

                    GameTenballRecord newGameTenballRecord = new GameTenballRecord();

                    Map<String, Object> newGameTenballMap = EntityMapTransUtils.entityToMap1(newGameTenballRecord);

                    if(tenBallsMultiBetRecordReqVO.getType() == 1){
                        if("单".equals(betNumberArg[i])){
                            newGameTenballRecord.setType1Single(tenBallsMultiBetRecordReqVO.getMoney());
                        }else if("双".equals(betNumberArg[i])){
                            newGameTenballRecord.setType1Double(tenBallsMultiBetRecordReqVO.getMoney());
                        }else if("大".equals(betNumberArg[i])){
                            newGameTenballRecord.setType1Big(tenBallsMultiBetRecordReqVO.getMoney());
                        }else if("小".equals(betNumberArg[i])){
                            newGameTenballRecord.setType1Small(tenBallsMultiBetRecordReqVO.getMoney());
                        }else{
                            Object betRecordAmountObject = newGameTenballMap.get("type1Num" +betNumberArg[i]);
                            Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                            Float betMoney = betRecordAmount + tenBallsMultiBetRecordReqVO.getMoney();
                            newGameTenballMap.put("type1Num" +betNumberArg[i], betMoney);

                            newGameTenballRecord = EntityMapTransUtils.mapToEntity1(GameTenballRecord.class, newGameTenballMap);
                        }
                    }else{
                        String columnKey = "";
                        if("单".equals(betNumberArg[i])){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType() - 1) + "Single";
                        }else if("双".equals(betNumberArg[i])){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType() - 1) + "Double";
                        }else if("大".equals(betNumberArg[i])){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType() - 1) + "Big";
                        }else if("小".equals(betNumberArg[i])){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType() - 1) + "Small";
                        }else if("龙".equals(betNumberArg[i]) && (tenBallsMultiBetRecordReqVO.getType()-1) < 6){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType() - 1) + "Loong";
                        }else if("虎".equals(betNumberArg[i]) && (tenBallsMultiBetRecordReqVO.getType()-1) < 6){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType() - 1) + "Tiger";
                        }else{
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType() - 1) + "Num" +betNumberArg[i];
                        }

                        Object betRecordAmountObject = newGameTenballMap.get(columnKey);
                        Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                        Float betMoney = betRecordAmount + tenBallsMultiBetRecordReqVO.getMoney();
                        newGameTenballMap.put(columnKey, betMoney);

                        newGameTenballRecord = EntityMapTransUtils.mapToEntity1(GameTenballRecord.class, newGameTenballMap);
                    }

                    newGameTenballRecord.setGameId(vo.getGameId());
                    newGameTenballRecord.setGameName(gameTenballKj.getGameName());

                    newGameTenballRecord.setUserId(userId);
                    newGameTenballRecord.setPeriods(vo.getPeriods());
                    newGameTenballRecord.setStatus("0");
                    newGameTenballRecord.setCountMoney(tenBallsMultiBetRecordReqVO.getMoney());
                    newGameTenballRecord.setHouse(1);
                    gameTenballRecordService.insertGameTenballRecord(newGameTenballRecord);
                }

                userAmount = userAmount - tenBallsMultiBetRecordReqVO.getMoney();

                BetRecord betrecord = new BetRecord();
                betrecord.setIsRobot("0");
                betrecord.setUserId(userId);
                betrecord.setPeriods(vo.getPeriods());
                betrecord.setGameId(vo.getGameId());
                betrecord.setGameName(gameTenballKj.getGameName());

                betrecord.setPlayType(playType);
                betrecord.setPlayDetail(betNumberArg[i]);
                betrecord.setPlayGroup(tenBallsMultiBetRecordReqVO.getType());
                betrecord.setOption(0);
                betrecord.setMoney(tenBallsMultiBetRecordReqVO.getMoney());
                betrecord.setBalance(userAmount);
                betrecord.setAccountResult(0f);
                betrecord.setSettleFlg("0");
                betrecord.setGameResult("");
                betrecord.setIsDelete("0");
                betrecord.setHouseId(1l);
                betRecordMapper.insertBetRecord(betrecord);

                Usermoney usermoney = new Usermoney();
                usermoney.setUserId(userId);
                usermoney.setGameId(vo.getGameId());
                usermoney.setGameName(gameTenballKj.getGameName());
                usermoney.setRemark(gameTenballKj.getGameName() + "-" + vo.getPeriods() + playType + betNumberArg[i]);
                usermoney.setCashMoney(tenBallsMultiBetRecordReqVO.getMoney());
                usermoney.setUserBalance(userAmount);
                usermoney.setType("7");
                usermoney.setCashContent(vo.getPeriods().toString());
                usermoneyMapper.insertUsermoney(usermoney);
            }
        }

        user.setAmount(userAmount);
        userService.updateUserAmount(user);

    }

    @Override
    public void delTenBallsBetRecord(Long userId, DelBetRecordReqVO vo) {
        SysUser user = userService.selectUserById(userId);
        Date date = new Date();
        GameTenballKj gameTenballKj = gameTenballKjService.selectGameTenballKjByPeriods(vo.getGameId(), vo.getPeriods());
        if(gameTenballKj == null || !StringUtils.equals("0",gameTenballKj.getStatus()) || gameTenballKj.getBetTime().compareTo(date) <0){
            throw new ServiceException("当前期数已截止");
        }

        GameTenballRecord searchGameTenballRecord = new GameTenballRecord();
        searchGameTenballRecord.setGameId(vo.getGameId());
        searchGameTenballRecord.setUserId(userId);
        searchGameTenballRecord.setPeriods(vo.getPeriods());
        searchGameTenballRecord.setStatus("0");
        List<GameTenballRecord> gameTenballRecordList = gameTenballRecordService.selectGameTenballRecordList(searchGameTenballRecord);
        if(gameTenballRecordList == null || gameTenballRecordList.size() == 0){
            throw new ServiceException("本期暂无投注记录");
        }

        Usermoney searchUsermoney = new Usermoney();
        searchUsermoney.setUserId(userId);
        searchUsermoney.setGameId(vo.getGameId());
        searchUsermoney.setType("7"); //购买彩票
        searchUsermoney.setCashContent(vo.getPeriods().toString());

        List<Usermoney> userMoneyList = usermoneyMapper.selectUsermoneyList(searchUsermoney);
        if(userMoneyList == null || userMoneyList.size() == 0){
            throw new ServiceException("本期暂无投注记录");
        }
        GameTenballRecord gameTenballRecord = gameTenballRecordList.get(0);
        gameTenballRecordService.deleteGameTenballRecordById(gameTenballRecord.getId());

        for(Usermoney usermoney :userMoneyList){
            usermoneyMapper.deleteUsermoneyById(usermoney.getId());
        }
        user.setAmount(user.getAmount() + gameTenballRecord.getCountMoney());
        userService.updateUserAmount(user);

        betRecordMapper.cancelBetRecordByPeriods(vo.getGameId(), vo.getPeriods(), userId, "1");
    }

    public void checkBetTenBallLimitAmount(GameTenballRecord gameTenballRecord, String number, Float money, Integer betType){
        List<String> tema = Arrays.asList("3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19");
        List<String> bigSmall = Arrays.asList("大", "小", "单", "双");
        List<String> longTiger = Arrays.asList("龙", "虎");
        List<String> rank = Arrays.asList("1", "2", "3", "4", "5", "6", "7", "8", "9", "10");
        String[] betNumberArg = number.split(",");
        SysDictData searchSysDictData = new SysDictData();
        searchSysDictData.setStatus("0");
        searchSysDictData.setDictType("limit_amount_ten");
        List<SysDictData> dictDataList = dictDataService.selectDictDataList(searchSysDictData);
        Map<String , SysDictData> limitAmountMap = dictDataList.stream()
                .collect(Collectors.toMap(
                        SysDictData::getDictValue,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));
        if(gameTenballRecord == null){
            return;
        }
        if(getLimitAmountByKey(limitAmountMap,"sum_max").compareTo(gameTenballRecord.getCountMoney() + money * betNumberArg.length) < 0){
            throw new ServiceException("单期投注总金额不可以大于" + getLimitAmountByKey(limitAmountMap,"small_num"));
        }

        if(money.compareTo(getLimitAmountByKey(limitAmountMap,"small_num"))<0){
            throw new ServiceException("投注金额不可以小余" + getLimitAmountByKey(limitAmountMap,"small_num"));
        }

        for(int i=0; i<betNumberArg.length; i++){
            Map<String, Object> GameTenballMap = EntityMapTransUtils.entityToMap1(gameTenballRecord);
            Float bigDxds = getLimitAmountByKey(limitAmountMap,"big_dxds");

            if(betType == 1){
                if(tema.contains(betNumberArg[i])){
                    List<String> special = Arrays.asList("3", "4", "18", "19");
                    Float recordAmount = GameTenballMap.get("type1Num"+betNumberArg[i])!=null?(Float) GameTenballMap.get("type1Num"+betNumberArg[i]):0f;
                    if(special.contains(betNumberArg[i])){
                        if(getLimitAmountByKey(limitAmountMap,"big_num_special").compareTo(money + recordAmount)<0){
                            throw new ServiceException("特殊号码投注金额不可以大于" + getLimitAmountByKey(limitAmountMap,"big_num_special"));
                        }
                    }else{
                        if(getLimitAmountByKey(limitAmountMap,"sum_num_special").compareTo(money + recordAmount)<0){
                            throw new ServiceException("特殊号码投注金额不可以大于" + getLimitAmountByKey(limitAmountMap,"sum_num_special"));
                        }
                    }
                }

                if(bigSmall.contains(betNumberArg[i])){
                    if("单".equals(betNumberArg[i]) && bigDxds.compareTo(money + gameTenballRecord.getType1Single()) < 0){
                        throw new ServiceException("和值单金额不可以大于" + bigDxds);
                    }
                    if("双".equals(betNumberArg[i]) && bigDxds.compareTo(money + gameTenballRecord.getType1Double()) < 0){
                        throw new ServiceException("和值双金额不可以大于" + bigDxds);
                    }
                    if("大".equals(betNumberArg[i]) && bigDxds.compareTo(money + gameTenballRecord.getType1Big()) < 0){
                        throw new ServiceException("和值大金额不可以大于" + bigDxds);
                    }
                    if("小".equals(betNumberArg[i]) && bigDxds.compareTo(money + gameTenballRecord.getType1Small()) < 0){
                        throw new ServiceException("和值小金额不可以大于" + bigDxds);
                    }
                }
            }else{
                if(rank.contains(betNumberArg[i])){
                    Object recordAmountObject = GameTenballMap.get("type"+(betType - 1) + "Num" +betNumberArg[i]);
                    Float recordAmount = recordAmountObject!=null?(Float) recordAmountObject:0f;
                    if(getLimitAmountByKey(limitAmountMap,"big_num").compareTo(money + recordAmount)<0){
                        throw new ServiceException("赛道号码注金额不可以大于" + getLimitAmountByKey(limitAmountMap,"big_num"));
                    }
                }

                if(bigSmall.contains(betNumberArg[i])){

                    Object singleRecordAmountObject = GameTenballMap.get("type"+(betType - 1) + "Single");
                    Float singleRecordAmount = singleRecordAmountObject!=null?(Float) singleRecordAmountObject:0f;
                    if("单".equals(betNumberArg[i]) && bigDxds.compareTo(money + singleRecordAmount) < 0){
                        throw new ServiceException("赛道单金额不可以大于" + bigDxds);
                    }

                    Object doubleRecordAmountObject = GameTenballMap.get("type"+(betType - 1) + "Double");
                    Float doubleRecordAmount = doubleRecordAmountObject!=null?(Float) doubleRecordAmountObject:0f;
                    if("双".equals(betNumberArg[i]) && bigDxds.compareTo(money + doubleRecordAmount) < 0){
                        throw new ServiceException("赛道双金额不可以大于" + bigDxds);
                    }

                    Object bigRecordAmountObject = GameTenballMap.get("type"+(betType - 1) + "Big");
                    Float bigRecordAmount = bigRecordAmountObject!=null?(Float) bigRecordAmountObject:0f;
                    if("大".equals(betNumberArg[i]) && bigDxds.compareTo(money + bigRecordAmount) < 0){
                        throw new ServiceException("赛道大金额不可以大于" + bigDxds);
                    }

                    Object smallRecordAmountObject = GameTenballMap.get("type"+(betType - 1) + "Small");
                    Float smallRecordAmount = smallRecordAmountObject!=null?(Float) smallRecordAmountObject:0f;
                    if("小".equals(betNumberArg[i]) && bigDxds.compareTo(money + smallRecordAmount) < 0){
                        throw new ServiceException("赛道小金额不可以大于" + bigDxds);
                    }
                }

                if(longTiger.contains(betNumberArg[i])){

                    Object loongRecordAmountObject = GameTenballMap.get("type"+(betType - 1) + "Loong");
                    Float loongRecordAmount = loongRecordAmountObject!=null?(Float) loongRecordAmountObject:0f;
                    if("小".equals(betNumberArg[i]) && bigDxds.compareTo(money + loongRecordAmount) < 0){
                        throw new ServiceException("赛道小金额不可以大于" + bigDxds);
                    }

                    Object tigerRecordAmountObject = GameTenballMap.get("type"+(betType - 1) + "Tiger");
                    Float tigerRecordAmount = tigerRecordAmountObject!=null?(Float) tigerRecordAmountObject:0f;
                    if("小".equals(betNumberArg[i]) && bigDxds.compareTo(money + tigerRecordAmount) < 0){
                        throw new ServiceException("虎金额不可以大于" + bigDxds);
                    }
                }
            }
        }
    }
    private Float getLimitAmountByKey(Map<String , SysDictData> limitAmountMap, String key){
        Float limitAmount = 0f;
        if(limitAmountMap.containsKey(key)){
            limitAmount = Float.parseFloat(limitAmountMap.get(key).getDictLabel());
        }

        return limitAmount;
    }

    public int random(int min,int max){
        Random random = new Random();
        int s = random.nextInt(max)%(max-min+1) + min;
        return s;
    }
    public Float changeLongNumber(String floatStr){
        Float floatNum = 0f;
        try {
            floatNum = Float.parseFloat(floatStr);
        }catch (Exception e){
            floatNum = 0f;
        }
        return floatNum;
    }
}
