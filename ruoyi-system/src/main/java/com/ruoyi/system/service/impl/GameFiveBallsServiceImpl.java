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

import java.util.List;

@Service
public class GameFiveBallsServiceImpl implements IGameFiveBallsService {

    @Autowired
    private ISysBetItemService sysBetItemService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysAppService sysAppService;

    @Autowired
    private IGameFiveballRecordService gameFiveballRecordService;

    @Autowired
    private IGameFiveballKjService gameFiveballKjService;

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
    public List<SysBetItem> getOddsInfo(FiveBallsOddsReqVO vo) {
        SysBetItem searchBetItem = new SysBetItem();
        searchBetItem.setGameId(vo.getGameId());
        searchBetItem.setStatus("0");

        return sysBetItemService.selectSysBetItemList(searchBetItem);
    }

    @Override
    public FiveBallKjRecordMoneyRespVO kjRecordMoney(Long userId, FiveBallsOddsReqVO vo) {
        SysUser user = userService.selectUserById(userId);
        FiveBallKjRecordMoneyRespVO respVO = new FiveBallKjRecordMoneyRespVO();
        respVO.setMoney(user.getAmount());
        respVO.setRecordStatus("0");
        respVO.setProfitLossMoney(0f);

        GameResultListReqVO reqVO = new GameResultListReqVO();
        reqVO.setGameId(vo.getGameId());
        reqVO.setPageNumber(1);
        reqVO.setPageRowCount(1);
        List<GameResultListRespVO> fiveBallsGameResultList = sysAppService.gameResultList(userId,reqVO);
        if(fiveBallsGameResultList != null && fiveBallsGameResultList.size() > 0){
            GameResultListRespVO fiveBllsGameResult = fiveBallsGameResultList.get(0);
            BeanUtils.copyProperties(fiveBllsGameResult,respVO);
            respVO.setLotteryStatus("1");

            GameFiveballRecord searchGameFiveballRecord = new GameFiveballRecord();
            searchGameFiveballRecord.setGameId(vo.getGameId());
            searchGameFiveballRecord.setUserId(userId);
            searchGameFiveballRecord.setPeriods(fiveBllsGameResult.getPeriods());
            List<GameFiveballRecord> gameFiveballRecordList = gameFiveballRecordService.selectGameFiveballRecordList(searchGameFiveballRecord);
            if(gameFiveballRecordList != null && gameFiveballRecordList.size() > 0){
                respVO.setRecordStatus("1");
                respVO.setProfitLossMoney(gameFiveballRecordList.get(0).getWinMoney() - gameFiveballRecordList.get(0).getCountMoney());
            }
        }else{
            respVO.setLotteryStatus("0");
        }

        return respVO;
    }

    @Override
    public FiveBallsTimeDateRespVO timeDate(FiveBallsOddsReqVO vo) {
        GameFiveballKj searchGameFiveballKj = new GameFiveballKj();
        FiveBallsTimeDateRespVO respVO = new FiveBallsTimeDateRespVO();
        searchGameFiveballKj.setGameId(vo.getGameId());
        searchGameFiveballKj.setStatus("0"); // 未开奖
        List<GameFiveballKj> gameFiveballKjList = gameFiveballKjService.selectGameFiveballKjList(searchGameFiveballKj);
        Date date = new Date();
        if(gameFiveballKjList != null && gameFiveballKjList.size() > 0){
            GameFiveballKj firstGameFiveballKj = gameFiveballKjList.get(0);
            if(firstGameFiveballKj.getPreTime().compareTo(date) > 0){
                Long preTime = firstGameFiveballKj.getPreTime().getTime() - date.getTime();
                Long betTime = firstGameFiveballKj.getBetTime().getTime() - date.getTime();
                respVO.setPeriods(firstGameFiveballKj.getPeriods());
                respVO.setGameId(firstGameFiveballKj.getGameId());
                respVO.setGameName(firstGameFiveballKj.getGameName());
                respVO.setPreTime(preTime/ 1000L);
                respVO.setBetTime(betTime/ 1000L);
            }else{
                GameFiveballKj lasterGameFiveballKj = gameFiveballKjList.get(gameFiveballKjList.size()-1);
                Long preTime = lasterGameFiveballKj.getPreTime().getTime() - date.getTime();
                Long betTime = lasterGameFiveballKj.getBetTime().getTime() - date.getTime();
                respVO.setPeriods(lasterGameFiveballKj.getPeriods());
                respVO.setGameId(lasterGameFiveballKj.getGameId());
                respVO.setGameName(lasterGameFiveballKj.getGameName());
                respVO.setPreTime(preTime/ 1000L);
                respVO.setBetTime(betTime/ 1000L);
            }
        }

        return respVO;
    }

    @Override
    public List<BetRecordListRespVO> betRecordList(Long userId, FiveBallsBetRecordListReqVO vo) {
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
        GameFiveballKj gameFiveballKj = gameFiveballKjService.selectGameFiveballKjByPeriods(vo.getGameId(), vo.getPeriods());

        if(gameFiveballKj.getPreTime().compareTo(date) < 0){
            return respVO;
        }

        SysGame gameInfo = sysGameService.selectSysGameByGameId(vo.getGameId());
        Random random = new Random();
        BigDecimal result = new BigDecimal(gameInfo.getRobotRate()).divide(new BigDecimal(100), 2, RoundingMode.HALF_UP);
        double virtuallyRandow = result.doubleValue();
        double randomValue = random.nextDouble();
        //产生虚假数据的概率
        if(taskFlg || randomValue < virtuallyRandow) {

            List<FalseUser> falseUserList = falseUserMapper.selectFalseUserListByGameId(vo.getGameId());
            if(falseUserList == null || falseUserList.size() == 0){
                falseUserList = falseUserMapper.selectFalseUserListByGameId(15l);
            }
            if(falseUserList != null && falseUserList.size() > 0){
                FalseUser falseUser = falseUserList.get(random(1,falseUserList.size()) - 1);

                Integer type = 0;
                String playType = "";
                String num = "";
                String money = "";
                List<String> playList = new ArrayList<>();

                String[] numArg = falseUser.getRobotBetNum().split("\\|");
                String[] moneyArg = falseUser.getRobotBetMoney().split("\\|");

                money = moneyArg[random(1,moneyArg.length)-1];
                int cishu = 0 ;

                if(falseUser.getPlayType() == 0){
                    cishu = 1;
                    playList.add("和值");
                }else if(falseUser.getPlayType() == 1){
                    cishu = random(3,7);
                    playList.add("球1");
                    playList.add("球2");
                    playList.add("球3");
                    playList.add("球4");
                    playList.add("球5");
                }else{
                    cishu = random(1,2);
                    playList.add("前三");
                    playList.add("中三");
                    playList.add("后三");
                }
                FalseUser searchFalseUser = new FalseUser();
                List<FalseUser> allFalseUserList = falseUserMapper.selectFalseUserList(searchFalseUser);

                FalseUser virtuallyGameUser = allFalseUserList.get(random(1,allFalseUserList.size()) - 1);

                Date now = new Date();

                for(int i=0;i<cishu;i++){

                    num = numArg[random(1,numArg.length)-1];
                    playType = playList.get(random(1,playList.size())-1);

                    BetRecord betrecord = new BetRecord();
                    betrecord.setUserId(0l);
                    betrecord.setPeriods(vo.getPeriods());
                    betrecord.setGameId(vo.getGameId());
                    betrecord.setGameName(gameFiveballKj.getGameName());
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
                        virtuallyGameRecord.setBetId(betrecord.getBetId());
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
    public void addFiveBallsBetRecord(Long userId, FiveBallsAddBetRecordReqVO vo) {
        Date date = new Date();
        GameFiveballKj gameFiveballKj = gameFiveballKjService.selectGameFiveballKjByPeriods(vo.getGameId(), vo.getPeriods());
        if(gameFiveballKj.getBetTime() == null || gameFiveballKj.getBetTime().compareTo(date) < 0){
            throw new ServiceException("当前期数已截止,请等待开奖后在投注");
        }
        SysUser user = userService.selectUserById(userId);
        String[] betNumberArg = vo.getNumber().split(",");
        if(user.getAmount().compareTo(vo.getMoney() * betNumberArg.length)<0){
            throw new ServiceException("用户余额不足");
        }
        GameFiveballRecord searchGameFiveballRecord = new GameFiveballRecord();
        searchGameFiveballRecord.setGameId(vo.getGameId());
        searchGameFiveballRecord.setUserId(userId);
        searchGameFiveballRecord.setPeriods(vo.getPeriods());
        searchGameFiveballRecord.setStatus("0");
        List<GameFiveballRecord> gameFiveballRecordList = gameFiveballRecordService.selectGameFiveballRecordList(searchGameFiveballRecord);

        GameFiveballRecord gameFiveballRecord = null;
        if(gameFiveballRecordList != null && gameFiveballRecordList.size() >0){
            gameFiveballRecord = gameFiveballRecordList.get(0);
        }

        Map<String,String> allFiledMap = new HashMap<>();
        allFiledMap.put("1大","sumBig");
        allFiledMap.put("1小","sumSmall");
        allFiledMap.put("1单","sumSingle");
        allFiledMap.put("1双","sumDouble");
        allFiledMap.put("1龙","sumLoong");
        allFiledMap.put("1虎","sumTiger");
        allFiledMap.put("1和","sumSum");
        for(int i=1;i<=5; i++){
            for(int j=0; j<=9; j++){
                allFiledMap.put((i+1)+""+j,"num"+i+"Ball"+j);
            }
            allFiledMap.put((i+1)+"大","num"+i+"Big");
            allFiledMap.put((i+1)+"小","num"+i+"Small");
            allFiledMap.put((i+1)+"单","num"+i+"Single");
            allFiledMap.put((i+1)+"双","num"+i+"Double");
        }
        allFiledMap.put("7豹","firstBao");
        allFiledMap.put("7对","firstDui");
        allFiledMap.put("7顺","firstSun");
        allFiledMap.put("7半","firstBan");
        allFiledMap.put("7杂","firstZa");
        allFiledMap.put("8豹","midBao");
        allFiledMap.put("8对","midDui");
        allFiledMap.put("8顺","midSun");
        allFiledMap.put("8半","midBan");
        allFiledMap.put("8杂","midZa");
        allFiledMap.put("9豹","backBao");
        allFiledMap.put("9对","backDui");
        allFiledMap.put("9顺","backSun");
        allFiledMap.put("9半","backBan");
        allFiledMap.put("9杂","backZa");

        checkBetFiveBallLimitAmount(gameFiveballRecord, vo.getNumber(), vo.getMoney(), vo.getType(), allFiledMap);

        String playType = "";

        if(vo.getType() == 1) {
            playType = "和值";
        }else if(vo.getType() == 7){
            playType = "前三";
        }else if(vo.getType() == 8){
            playType = "中三";
        }else if(vo.getType() == 9){
            playType = "后三";
        }else{
            playType = "球" + (vo.getType()-1);
        }

        Float userAmount = user.getAmount();
        for(int i=0; i<betNumberArg.length; i++){

            String key = allFiledMap.get(vo.getType()+betNumberArg[i]);

            searchGameFiveballRecord = new GameFiveballRecord();
            searchGameFiveballRecord.setGameId(vo.getGameId());
            searchGameFiveballRecord.setUserId(userId);
            searchGameFiveballRecord.setPeriods(vo.getPeriods());
            List<GameFiveballRecord> newGameFiveballRecordList = gameFiveballRecordService.selectGameFiveballRecordList(searchGameFiveballRecord);
            if(newGameFiveballRecordList != null && newGameFiveballRecordList.size() >0){
                GameFiveballRecord updateGameFiveballRecord = newGameFiveballRecordList.get(0);

                Map<String, Object> updateGameFiveballMap = EntityMapTransUtils.entityToMap1(updateGameFiveballRecord);

                Object betRecordAmountObject = updateGameFiveballMap.get(key);
                Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                Float betMoney = betRecordAmount + vo.getMoney();
                updateGameFiveballMap.put(key, betMoney);
                updateGameFiveballRecord = EntityMapTransUtils.mapToEntity1(GameFiveballRecord.class, updateGameFiveballMap);
                updateGameFiveballRecord.setCountMoney(updateGameFiveballRecord.getCountMoney() + vo.getMoney());
                updateGameFiveballRecord.setHouse(1);
                updateGameFiveballRecord.setRecordTime(date);
                gameFiveballRecordService.updateGameFiveballRecord(updateGameFiveballRecord);
            }else{
                GameFiveballRecord newGameFiveballRecord = new GameFiveballRecord();

                Map<String, Object> newGameFiveballMap = EntityMapTransUtils.entityToMap1(newGameFiveballRecord);

                Object betRecordAmountObject = newGameFiveballMap.get(key);
                Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                Float betMoney = betRecordAmount + vo.getMoney();
                newGameFiveballMap.put(key, betMoney);

                newGameFiveballRecord = EntityMapTransUtils.mapToEntity1(GameFiveballRecord.class, newGameFiveballMap);
                newGameFiveballRecord.setGameId(vo.getGameId());
                newGameFiveballRecord.setGameName(gameFiveballKj.getGameName());

                newGameFiveballRecord.setUserId(userId);
                newGameFiveballRecord.setPeriods(vo.getPeriods());
                newGameFiveballRecord.setStatus("0");
                newGameFiveballRecord.setCountMoney(vo.getMoney());
                newGameFiveballRecord.setHouse(1);
                gameFiveballRecordService.insertGameFiveballRecord(newGameFiveballRecord);
            }

            userAmount = userAmount - vo.getMoney();

            BetRecord betrecord = new BetRecord();
            betrecord.setIsRobot("0");
            betrecord.setUserId(userId);
            betrecord.setPeriods(vo.getPeriods());
            betrecord.setGameId(vo.getGameId());
            betrecord.setGameName(gameFiveballKj.getGameName());

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
            usermoney.setGameName(gameFiveballKj.getGameName());
            usermoney.setRemark(gameFiveballKj.getGameName() + "-" + vo.getPeriods() + playType + betNumberArg[i]);
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
    public void addFiveBallsMultiBetRecord(Long userId, FiveBallsAddMultiBetRecordReqVO vo) {
        Date date = new Date();
        GameFiveballKj gameFiveballKj = gameFiveballKjService.selectGameFiveballKjByPeriods(vo.getGameId(), vo.getPeriods());
        if(gameFiveballKj.getBetTime() == null || gameFiveballKj.getBetTime().compareTo(date) < 0){
            throw new ServiceException("当前期数已截止,请等待开奖后在投注");
        }

        SysUser user = userService.selectUserById(userId);
        Float totalRecordMoney = 0f;
        for(FiveBallsMultiBetRecordReqVO fiveBallsMultiBetRecordReqVO : vo.getRecordList()){
            String[] betNumberArg = fiveBallsMultiBetRecordReqVO.getNumber().split(",");
            totalRecordMoney = totalRecordMoney + (fiveBallsMultiBetRecordReqVO.getMoney() * betNumberArg.length);
        }

        if(user.getAmount().compareTo(totalRecordMoney)<0){
            throw new ServiceException("用户余额不足");
        }

        GameFiveballRecord searchGameFiveballRecord = new GameFiveballRecord();
        searchGameFiveballRecord.setGameId(vo.getGameId());
        searchGameFiveballRecord.setUserId(userId);
        searchGameFiveballRecord.setPeriods(vo.getPeriods());
        searchGameFiveballRecord.setStatus("0");
        List<GameFiveballRecord> gameFiveballRecordList = gameFiveballRecordService.selectGameFiveballRecordList(searchGameFiveballRecord);

        GameFiveballRecord gameFiveballRecord = null;
        if(gameFiveballRecordList != null && gameFiveballRecordList.size() >0){
            gameFiveballRecord = gameFiveballRecordList.get(0);
        }

        Map<String,String> allFiledMap = new HashMap<>();
        allFiledMap.put("1大","sumBig");
        allFiledMap.put("1小","sumSmall");
        allFiledMap.put("1单","sumSingle");
        allFiledMap.put("1双","sumDouble");
        allFiledMap.put("1龙","sumLoong");
        allFiledMap.put("1虎","sumTiger");
        allFiledMap.put("1和","sumSum");
        for(int i=1;i<=5; i++){
            for(int j=0; j<=9; j++){
                allFiledMap.put((i+1)+""+j,"num"+i+"Ball"+j);
            }
            allFiledMap.put((i+1)+"大","num"+i+"Big");
            allFiledMap.put((i+1)+"小","num"+i+"Small");
            allFiledMap.put((i+1)+"单","num"+i+"Single");
            allFiledMap.put((i+1)+"双","num"+i+"Double");
        }
        allFiledMap.put("7豹","fBao");
        allFiledMap.put("7对","fDui");
        allFiledMap.put("7顺","fSun");
        allFiledMap.put("7半","fBan");
        allFiledMap.put("7杂","fZa");
        allFiledMap.put("8豹","mBao");
        allFiledMap.put("8对","mDui");
        allFiledMap.put("8顺","mSun");
        allFiledMap.put("8半","mBan");
        allFiledMap.put("8杂","mZa");
        allFiledMap.put("9豹","bBao");
        allFiledMap.put("9对","bDui");
        allFiledMap.put("9顺","bSun");
        allFiledMap.put("9半","bBan");
        allFiledMap.put("9杂","bZa");

        for(FiveBallsMultiBetRecordReqVO fiveBallsMultiBetRecordReqVO : vo.getRecordList()) {
            checkBetFiveBallLimitAmount(gameFiveballRecord, fiveBallsMultiBetRecordReqVO.getNumber(), fiveBallsMultiBetRecordReqVO.getMoney(), fiveBallsMultiBetRecordReqVO.getType(), allFiledMap);
        }

        Float userAmount = user.getAmount();
        for(FiveBallsMultiBetRecordReqVO fiveBallsMultiBetRecordReqVO : vo.getRecordList()) {

            String[] betNumberArg = fiveBallsMultiBetRecordReqVO.getNumber().split(",");
            String playType = "";

            if(fiveBallsMultiBetRecordReqVO.getType() == 1) {
                playType = "和值";
            }else if(fiveBallsMultiBetRecordReqVO.getType() == 7){
                playType = "前三";
            }else if(fiveBallsMultiBetRecordReqVO.getType() == 8){
                playType = "中三";
            }else if(fiveBallsMultiBetRecordReqVO.getType() == 9){
                playType = "后三";
            }else{
                playType = "球" + (fiveBallsMultiBetRecordReqVO.getType()-1);
            }

            for(int i=0; i<betNumberArg.length; i++){
                String key = allFiledMap.get(fiveBallsMultiBetRecordReqVO.getType()+betNumberArg[i]);
                searchGameFiveballRecord = new GameFiveballRecord();
                searchGameFiveballRecord.setGameId(vo.getGameId());
                searchGameFiveballRecord.setUserId(userId);
                searchGameFiveballRecord.setPeriods(vo.getPeriods());
                List<GameFiveballRecord> newGameFiveballRecordList = gameFiveballRecordService.selectGameFiveballRecordList(searchGameFiveballRecord);

                if(newGameFiveballRecordList != null && newGameFiveballRecordList.size() >0){
                    GameFiveballRecord updateGameFiveballRecord = newGameFiveballRecordList.get(0);

                    Map<String, Object> updateGameFiveballMap = EntityMapTransUtils.entityToMap1(updateGameFiveballRecord);

                    Object betRecordAmountObject = updateGameFiveballMap.get(key);
                    Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                    Float betMoney = betRecordAmount + fiveBallsMultiBetRecordReqVO.getMoney();
                    updateGameFiveballMap.put(key, betMoney);
                    updateGameFiveballRecord = EntityMapTransUtils.mapToEntity1(GameFiveballRecord.class, updateGameFiveballMap);
                    updateGameFiveballRecord.setCountMoney(updateGameFiveballRecord.getCountMoney() + fiveBallsMultiBetRecordReqVO.getMoney());
                    updateGameFiveballRecord.setHouse(1);
                    updateGameFiveballRecord.setRecordTime(date);
                    gameFiveballRecordService.updateGameFiveballRecord(updateGameFiveballRecord);
                }else{
                    GameFiveballRecord newGameFiveballRecord = new GameFiveballRecord();

                    Map<String, Object> newGameFiveballMap = EntityMapTransUtils.entityToMap1(newGameFiveballRecord);

                    Object betRecordAmountObject = newGameFiveballMap.get(key);
                    Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                    Float betMoney = betRecordAmount + fiveBallsMultiBetRecordReqVO.getMoney();
                    newGameFiveballMap.put(key, betMoney);

                    newGameFiveballRecord = EntityMapTransUtils.mapToEntity1(GameFiveballRecord.class, newGameFiveballMap);
                    newGameFiveballRecord.setGameId(vo.getGameId());
                    newGameFiveballRecord.setGameName(gameFiveballKj.getGameName());

                    newGameFiveballRecord.setUserId(userId);
                    newGameFiveballRecord.setPeriods(vo.getPeriods());
                    newGameFiveballRecord.setStatus("0");
                    newGameFiveballRecord.setCountMoney(fiveBallsMultiBetRecordReqVO.getMoney());
                    newGameFiveballRecord.setHouse(1);
                    gameFiveballRecordService.insertGameFiveballRecord(newGameFiveballRecord);
                }

                userAmount = userAmount - fiveBallsMultiBetRecordReqVO.getMoney();

                BetRecord betrecord = new BetRecord();
                betrecord.setIsRobot("0");
                betrecord.setUserId(userId);
                betrecord.setPeriods(vo.getPeriods());
                betrecord.setGameId(vo.getGameId());
                betrecord.setGameName(gameFiveballKj.getGameName());

                betrecord.setPlayType(playType);
                betrecord.setPlayDetail(betNumberArg[i]);
                betrecord.setPlayGroup(fiveBallsMultiBetRecordReqVO.getType());
                betrecord.setOption(0);
                betrecord.setMoney(fiveBallsMultiBetRecordReqVO.getMoney());
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
                usermoney.setGameName(gameFiveballKj.getGameName());
                usermoney.setRemark(gameFiveballKj.getGameName() + "-" + vo.getPeriods() + playType + betNumberArg[i]);
                usermoney.setCashMoney(fiveBallsMultiBetRecordReqVO.getMoney());
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
    public void delFiveBallsBetRecord(Long userId, DelBetRecordReqVO vo) {
        SysUser user = userService.selectUserById(userId);
        Date date = new Date();
        GameFiveballKj gameFiveballKj = gameFiveballKjService.selectGameFiveballKjByPeriods(vo.getGameId(), vo.getPeriods());
        if(gameFiveballKj == null || !StringUtils.equals("0",gameFiveballKj.getStatus()) || gameFiveballKj.getBetTime().compareTo(date) <0){
            throw new ServiceException("当前期数已截止");
        }

        GameFiveballRecord searchGameFiveballRecord = new GameFiveballRecord();
        searchGameFiveballRecord.setGameId(vo.getGameId());
        searchGameFiveballRecord.setUserId(userId);
        searchGameFiveballRecord.setPeriods(vo.getPeriods());
        searchGameFiveballRecord.setStatus("0");
        List<GameFiveballRecord> gameFiveballRecordList = gameFiveballRecordService.selectGameFiveballRecordList(searchGameFiveballRecord);
        if(gameFiveballRecordList == null || gameFiveballRecordList.size() == 0){
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
        GameFiveballRecord gameFiveballRecord = gameFiveballRecordList.get(0);
        gameFiveballRecordService.deleteGameFiveballRecordById(gameFiveballRecord.getId());

        for(Usermoney usermoney :userMoneyList){
            usermoneyMapper.deleteUsermoneyById(usermoney.getId());
        }
        user.setAmount(user.getAmount() + gameFiveballRecord.getCountMoney());
        userService.updateUserAmount(user);

        betRecordMapper.cancelBetRecordByPeriods(vo.getGameId(), vo.getPeriods(), userId, "1");
    }

    public void checkBetFiveBallLimitAmount(GameFiveballRecord gameFiveballRecord, String number, Float money, Integer betType, Map<String,String> allFiledMap){

        String[] betNumberArg = number.split(",");
        List<String> bigSmall = Arrays.asList("大", "小", "单", "双");

        SysDictData searchSysDictData = new SysDictData();
        searchSysDictData.setStatus("0");
        searchSysDictData.setDictType("limit_amount_five");
        List<SysDictData> dictDataList = dictDataService.selectDictDataList(searchSysDictData);
        Map<String , SysDictData> limitAmountMap = dictDataList.stream()
                .collect(Collectors.toMap(
                        SysDictData::getDictValue,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));
        if(gameFiveballRecord == null){
            return;
        }
        if(getLimitAmountByKey(limitAmountMap,"sum_max").compareTo(gameFiveballRecord.getCountMoney() + money * betNumberArg.length) < 0){
            throw new ServiceException("单期投注总金额不可以大于" + getLimitAmountByKey(limitAmountMap,"small_num"));
        }

        if(money.compareTo(getLimitAmountByKey(limitAmountMap,"small_num"))<0){
            throw new ServiceException("投注金额不可以小余" + getLimitAmountByKey(limitAmountMap,"small_num"));
        }

        for(int i=0; i<betNumberArg.length; i++){
            Map<String, Object> GameFiveballMap = EntityMapTransUtils.entityToMap1(gameFiveballRecord);
            String key = allFiledMap.get(betType+betNumberArg[i]);

            if(StringUtils.isEmpty(key)){
                throw new ServiceException("投注类型+投注号码不规范");
            }
            Float recordAmount = GameFiveballMap.get(key) != null ? (Float) GameFiveballMap.get(key) : 0f;

            if(betType == 1) {
                if ("和".equals(betNumberArg[i])) {
                    if (getLimitAmountByKey(limitAmountMap,"big_special_he").compareTo(money + recordAmount) < 0) {
                        throw new ServiceException("和投注金额不可以大于" + getLimitAmountByKey(limitAmountMap,"big_special_he"));
                    }
                } else {
                    if (getLimitAmountByKey(limitAmountMap,"big_dxds").compareTo(money + recordAmount) < 0) {
                        throw new ServiceException("两面投注金额不可以大于" + getLimitAmountByKey(limitAmountMap,"big_dxds"));
                    }
                }
            }else if(betType == 7 || betType == 8 || betType == 9){
                if (getLimitAmountByKey(limitAmountMap,"big_special").compareTo(money + recordAmount) < 0) {
                    throw new ServiceException("前中后三投注金额不可以大于" + getLimitAmountByKey(limitAmountMap,"big_special"));
                }
            }else{
                if(bigSmall.contains(betNumberArg[i])){
                    if (getLimitAmountByKey(limitAmountMap,"big_dxds").compareTo(money + recordAmount) < 0) {
                        throw new ServiceException("两面投注金额不可以大于" + getLimitAmountByKey(limitAmountMap,"big_dxds"));
                    }
                }else{
                    if (getLimitAmountByKey(limitAmountMap,"big_num").compareTo(money + recordAmount) < 0) {
                        throw new ServiceException("数字号码投注金额不可以大于" + getLimitAmountByKey(limitAmountMap,"big_num"));
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
