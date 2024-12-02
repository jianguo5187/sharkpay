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
import com.ruoyi.system.mapper.SysBetTypeMapper;
import com.ruoyi.system.mapper.UsermoneyMapper;
import com.ruoyi.system.service.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
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
    private ISysBetTypeService sysBetTypeService;

    @Autowired
    private IUserwinService userwinService;

    @Autowired
    private BetRecordMapper betRecordMapper;

    @Autowired
    private FalseUserMapper falseUserMapper;

    @Autowired
    private UsermoneyMapper usermoneyMapper;

    @Autowired
    private SysBetTypeMapper betTypeMapper;

    @Autowired
    private IGameAutoBetRecordService gameAutoBetRecordService;

    @Autowired
    private IRobotBetOptionService robotBetOptionService;


    @Override
    public List<SysBetType> getOddsInfo(FiveBallsOddsReqVO vo) {
        SysBetType searchBetType = new SysBetType();
        searchBetType.setGameId(vo.getGameId());
        searchBetType.setStatus("0");
        List<SysBetType> betTypeList = sysBetTypeService.selectSysBetTypeList(searchBetType).stream().map(f->{
            SysBetItem searchBetItem = new SysBetItem();
            searchBetItem.setGameId(vo.getGameId());
            searchBetItem.setStatus("0");
            searchBetItem.setBetItemType(f.getBetTypeId());

            f.setBetItemList(sysBetItemService.selectSysBetItemList(searchBetItem));
            return f;}
        ).collect(Collectors.toList());

        return betTypeList;
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
        List<GameResultListRespVO> fiveBallsGameResultList = sysAppService.gameResultList(reqVO);
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

        Userwin searchUserwin = new Userwin();
        searchUserwin.setGameId(vo.getGameId());
        searchUserwin.setUserId(userId);
        searchUserwin.setIncludeTestUserFlg(true);
        Map<String, Object> params = new HashMap<>();
        SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
        String today = sd.format(new Date());
        params.put("beginTime",today);
        params.put("endTime",today);
        List<CollectReportRespVO> list = userwinService.selectCollectReportLis(searchUserwin);
        if(list == null || list.size() == 0){
            respVO.setTodayGameWinMoneyTotal(0f);
        }else{
            respVO.setTodayGameWinMoneyTotal(list.get(0).getWinMoneyTotal());
        }
        respVO.setPeriodsGameWinMoneyTotal(usermoneyMapper.selectUserGameWinMoneyByPeriods(userId, vo.getGameId(), vo.getLastPeriods()));

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
                int size = 0;
                if(gameFiveballKjList.size() > 1){
                    size = 1;
                }
                GameFiveballKj lasterGameFiveballKj = gameFiveballKjList.get(size);
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
//        if(StringUtils.isNull(vo.getPageNumber())){
//            vo.setPageNumber(1);
//        }
//        if(StringUtils.isNull(vo.getPageRowCount())){
//            vo.setPageRowCount(20);
//        }
        Integer pageNumber = null;
        if(StringUtils.isNotNull(vo.getPageNumber()) || StringUtils.isNotNull(vo.getPageRowCount())){
            if(StringUtils.isNull(vo.getPageNumber())){
                vo.setPageNumber(1);
            }
            if(StringUtils.isNull(vo.getPageRowCount())){
                vo.setPageRowCount(20);
            }
            pageNumber = (vo.getPageNumber()-1)*vo.getPageRowCount();
        }
        return betRecordMapper.selectBetRecordListByPeriods(vo.getGameId(), vo.getPeriods(), pageNumber, vo.getPageRowCount());
    }

    @Override
    public List<VirtuallyGameRecordRespVO> virtuallyGameRecord(Long userId, VirtuallyGameRecordReqVO vo, Boolean taskFlg) {
        List<VirtuallyGameRecordRespVO> respVO = new ArrayList<>();
        Date date = new Date();
        GameFiveballKj gameFiveballKj = gameFiveballKjService.selectGameFiveballKjByPeriods(vo.getGameId(), vo.getPeriods());

        if(gameFiveballKj.getPreTime().compareTo(date) < 0){
            return respVO;
        }

        if(vo.getLastBetRecordId() != null && vo.getLastBetRecordId() > 0) {
            List<VirtuallyGameRecordRespVO> dbVirtuallyRecordList = betRecordMapper.getVirtuallyRecordList(vo.getGameId(), vo.getPeriods(), vo.getLastBetRecordId());
            respVO.addAll(dbVirtuallyRecordList);
        }

//        SysGame gameInfo = sysGameService.selectSysGameByGameId(vo.getGameId());

        List<FalseUser> notBetFalseUserList = falseUserMapper.selectNoBetFalseUserListByGameIdAndPeriods(vo.getGameId(), vo.getPeriods());
        if(notBetFalseUserList == null || notBetFalseUserList.size() == 0){
            return respVO;
        }
        //随机挑选一个虚拟用户
        FalseUser virtuallyGameUser = notBetFalseUserList.get(random(1,notBetFalseUserList.size()) - 1);
        //获取话术
        RobotBetOption searchRobotBetOption = new RobotBetOption();
        searchRobotBetOption.setGameId(vo.getGameId());
        searchRobotBetOption.setStatus("0");
        List<RobotBetOption> robotBetOptionList = robotBetOptionService.selectRobotBetOptionList(searchRobotBetOption);
        if(robotBetOptionList == null || robotBetOptionList.size() == 0){
            return respVO;
        }

        Map<String,Integer> betTypeMap = new HashMap<>();
        betTypeMap.put("和值",1);
        betTypeMap.put("球1",2);
        betTypeMap.put("球2",3);
        betTypeMap.put("球3",4);
        betTypeMap.put("球4",5);
        betTypeMap.put("球5",6);
        betTypeMap.put("前三",7);
        betTypeMap.put("中三",8);
        betTypeMap.put("后三",9);

        Map<Long,RobotBetOption> betOptionMap = robotBetOptionList.stream()
                .collect(Collectors.toMap(
                        RobotBetOption::getId,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        for(int i=virtuallyGameUser.getMinBetCount(); i<=virtuallyGameUser.getMaxBetCount(); i++){
            if(betOptionMap.size() < 1){
                break;
            }
            //随机挑选一个话术
            RobotBetOption robotBetOption = betOptionMap.get(getRandomValue(betOptionMap));

            String betOption[] = robotBetOption.getBetItemOption().split("\\|");

            BetRecord betrecord = new BetRecord();
            betrecord.setUserId(0l);
            betrecord.setPeriods(vo.getPeriods());
            betrecord.setGameId(vo.getGameId());
            betrecord.setGameName(gameFiveballKj.getGameName());
            betrecord.setPlayType(betOption[0]);
            betrecord.setPlayDetail(betOption[1]);
            betrecord.setPlayGroup(betTypeMap.get(betOption[1]));
            betrecord.setOption(0);
            betrecord.setMoney(changeLongNumber(betOption[2]));
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
                virtuallyGameRecord.setStime(date);
                virtuallyGameRecord.setNumber(betOption[1]);
                virtuallyGameRecord.setMoney(changeLongNumber(betOption[2]));
                virtuallyGameRecord.setType(betTypeMap.get(betOption[1]));
                virtuallyGameRecord.setPeriods(vo.getPeriods());
                virtuallyGameRecord.setPlayType(betOption[0]);
                respVO.add(virtuallyGameRecord);
            }
        }

//        Random random = new Random();
//        BigDecimal result = new BigDecimal(gameInfo.getRobotRate()).divide(new BigDecimal(100), 2, RoundingMode.HALF_UP);
//        double virtuallyRandow = result.doubleValue();
//        double randomValue = random.nextDouble();
//        //产生虚假数据的概率
//        if(taskFlg || randomValue < virtuallyRandow) {
//
//            List<FalseUser> falseUserList = falseUserMapper.selectFalseUserListByGameId(vo.getGameId());
//            if(falseUserList == null || falseUserList.size() == 0){
//                falseUserList = falseUserMapper.selectFalseUserListByGameId(15l);
//            }
//            if(falseUserList != null && falseUserList.size() > 0){
//                FalseUser falseUser = falseUserList.get(random(1,falseUserList.size()) - 1);
//
//                List<GameBetTypeAndItemRespVO> betTypeAndItemRespVOList = betTypeMapper.selectGameBetTypeAndItemList(vo.getGameId());
//                Map<String,Integer> betTypeMap = new HashMap<>();
//                betTypeMap.put("和值",1);
//                betTypeMap.put("球1",2);
//                betTypeMap.put("球2",3);
//                betTypeMap.put("球3",4);
//                betTypeMap.put("球4",5);
//                betTypeMap.put("球5",6);
//                betTypeMap.put("前三",7);
//                betTypeMap.put("中三",8);
//                betTypeMap.put("后三",9);
//
////                Integer type = 0;
////                String playType = "";
////                String num = "";
//                String money = "";
////                List<String> playList = new ArrayList<>();
//
////                String[] numArg = falseUser.getRobotBetNum().split("\\|");
//                String[] moneyArg = falseUser.getRobotBetMoney().split("\\|");
//
//                money = moneyArg[random(1,moneyArg.length)-1];
////                int cishu = 0 ;
////                if(falseUser.getPlayType() == 0){
////                    cishu = 1;
////                    playList.add("和值");
////                }else if(falseUser.getPlayType() == 1){
////                    cishu = random(3,7);
////                    playList.add("球1");
////                    playList.add("球2");
////                    playList.add("球3");
////                    playList.add("球4");
////                    playList.add("球5");
////                }else{
////                    cishu = random(1,2);
////                    playList.add("前三");
////                    playList.add("中三");
////                    playList.add("后三");
////                }
//                FalseUser searchFalseUser = new FalseUser();
//                List<FalseUser> allFalseUserList = falseUserMapper.selectFalseUserList(searchFalseUser);
//
//                FalseUser virtuallyGameUser = allFalseUserList.get(random(1,allFalseUserList.size()) - 1);
//
//                Date now = new Date();
//                int cishu = random(3,7);
//
//                for(int i=0;i<cishu;i++){
//
////                    num = numArg[random(1,numArg.length)-1];
////                    //防止投注号码是空
////                    if(StringUtils.isEmpty(num)){
////                        num = numArg[0];
////                    }
////                    if(StringUtils.isEmpty(num)){
////                        continue;
////                    }
//
//                    int betNumIndex = random(0,betTypeAndItemRespVOList.size()-1);
//                    if(betNumIndex >= betTypeAndItemRespVOList.size()){
//                        continue;
//                    }
//                    GameBetTypeAndItemRespVO betTypeAndItem =  betTypeAndItemRespVOList.get(betNumIndex);
//
//                    String playType = betTypeAndItem.getBetTypeName();
//                    Integer type = betTypeMap.get(betTypeAndItem.getBetTypeName());
//
//                    BetRecord betrecord = new BetRecord();
//                    betrecord.setUserId(0l);
//                    betrecord.setPeriods(vo.getPeriods());
//                    betrecord.setGameId(vo.getGameId());
//                    betrecord.setGameName(gameFiveballKj.getGameName());
//                    betrecord.setPlayType(playType);
//                    betrecord.setPlayDetail(betTypeAndItem.getBetItemName());
//                    betrecord.setPlayGroup(type);
//                    betrecord.setOption(0);
//                    betrecord.setMoney(changeLongNumber(money));
//                    betrecord.setBalance(0f);
//                    betrecord.setAccountResult(0f);
//                    betrecord.setSettleFlg("0");
//                    betrecord.setGameResult("");
//                    betrecord.setIsDelete("0");
//                    betrecord.setIsRobot("1");
//                    betrecord.setHouseId(1l);
//                    betrecord.setRobotNickName(virtuallyGameUser.getUserName());
//                    betrecord.setRobotPic(virtuallyGameUser.getRobotPic());
//                    int insertIndex = betRecordMapper.insertBetRecord(betrecord);
//
//                    if(insertIndex > 0){
//                        VirtuallyGameRecordRespVO virtuallyGameRecord = new VirtuallyGameRecordRespVO();
//                        virtuallyGameRecord.setBetId(betrecord.getBetId());
//                        virtuallyGameRecord.setHouse("31");
//                        virtuallyGameRecord.setNickName(virtuallyGameUser.getUserName());
//                        virtuallyGameRecord.setPic(virtuallyGameUser.getRobotPic());
//                        virtuallyGameRecord.setStime(now);
//                        virtuallyGameRecord.setNumber(betTypeAndItem.getBetItemName());
//                        virtuallyGameRecord.setMoney(changeLongNumber(money));
//                        virtuallyGameRecord.setType(type);
//                        virtuallyGameRecord.setPeriods(vo.getPeriods());
//                        virtuallyGameRecord.setPlayType(playType);
//                        respVO.add(virtuallyGameRecord);
//                    }
//                }
//            }
//        }
        return respVO;
    }

    public Long getRandomValue(Map<Long,RobotBetOption> map){
        List<Long> keys = new ArrayList<>(map.keySet());
        // 生成随机索引
        int randomIndex = new Random().nextInt(keys.size());
        // 返回随机键
        return keys.get(randomIndex);
    }

    @Override
    public Long addFiveBallsBetRecord(Long userId, FiveBallsAddBetRecordReqVO vo) {
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
        Long lastBetRecordId = 0l;
        for(int i=0; i<betNumberArg.length; i++){

            String key = allFiledMap.get(vo.getType()+betNumberArg[i].trim());

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
            betrecord.setPlayDetail(betNumberArg[i].trim());
            betrecord.setPlayGroup(vo.getType());
            betrecord.setOption(0);
            betrecord.setMoney(vo.getMoney());
            betrecord.setBalance(userAmount);
            betrecord.setAccountResult(0f);
            betrecord.setSettleFlg("0");
            betrecord.setGameResult("");
            betrecord.setIsDelete("0");
            betrecord.setHouseId(1l);
            betrecord.setRecordLotteryKey(key);
            betrecord.setBetType(vo.getType());
            betrecord.setBetNumber(betNumberArg[i].trim());
            betRecordMapper.insertBetRecord(betrecord);

            Usermoney usermoney = new Usermoney();
            usermoney.setUserId(userId);
            usermoney.setGameId(vo.getGameId());
            usermoney.setGameName(gameFiveballKj.getGameName());
            usermoney.setRemark("投注[" + gameFiveballKj.getGameName() + "]第[" + vo.getPeriods() + "]期,投注内容[" + playType + "/" + betNumberArg[i].trim() + "],金额[" + vo.getMoney() + "]元");
            usermoney.setCashMoney(vo.getMoney());
            usermoney.setUserBalance(userAmount);
            usermoney.setType("7");
            usermoney.setCashContent(vo.getPeriods().toString());
            usermoneyMapper.insertUsermoney(usermoney);
            lastBetRecordId = betrecord.getBetId();
        }

        user.setAmount(userAmount);
        userService.updateUserAmount(user);
        return lastBetRecordId;
    }

    @Override
    public Long addFiveBallsMultiBetRecord(Long userId, FiveBallsAddMultiBetRecordReqVO vo) {
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

        for(FiveBallsMultiBetRecordReqVO fiveBallsMultiBetRecordReqVO : vo.getRecordList()) {
            checkBetFiveBallLimitAmount(gameFiveballRecord, fiveBallsMultiBetRecordReqVO.getNumber(), fiveBallsMultiBetRecordReqVO.getMoney(), fiveBallsMultiBetRecordReqVO.getType(), allFiledMap);
        }

        Float userAmount = user.getAmount();
        Long lastBetRecordId = 0l;
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
                String key = allFiledMap.get(fiveBallsMultiBetRecordReqVO.getType()+betNumberArg[i].trim());
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
                betrecord.setPlayDetail(betNumberArg[i].trim());
                betrecord.setPlayGroup(fiveBallsMultiBetRecordReqVO.getType());
                betrecord.setOption(0);
                betrecord.setMoney(fiveBallsMultiBetRecordReqVO.getMoney());
                betrecord.setBalance(userAmount);
                betrecord.setAccountResult(0f);
                betrecord.setSettleFlg("0");
                betrecord.setGameResult("");
                betrecord.setIsDelete("0");
                betrecord.setHouseId(1l);
                betrecord.setRecordLotteryKey(key);
                if(StringUtils.equals(vo.getAutoBetFlg(), "1")){
                    betrecord.setAutoBetFlg("1"); //自动追号
                    betrecord.setAutoBetRecordId(fiveBallsMultiBetRecordReqVO.getAutoBetRecordId());//自动追号ID
                }
                betrecord.setBetType(fiveBallsMultiBetRecordReqVO.getType());
                betrecord.setBetNumber(betNumberArg[i].trim());
                betRecordMapper.insertBetRecord(betrecord);

                Usermoney usermoney = new Usermoney();
                usermoney.setUserId(userId);
                usermoney.setGameId(vo.getGameId());
                usermoney.setGameName(gameFiveballKj.getGameName());
                usermoney.setRemark("投注[" + gameFiveballKj.getGameName() + "]第[" + vo.getPeriods() + "]期,投注内容[" + playType + "/" + betNumberArg[i].trim() + "],金额[" + fiveBallsMultiBetRecordReqVO.getMoney() + "]元");
                usermoney.setCashMoney(fiveBallsMultiBetRecordReqVO.getMoney());
                usermoney.setUserBalance(userAmount);
                usermoney.setType("7");
                usermoney.setCashContent(vo.getPeriods().toString());
                usermoneyMapper.insertUsermoney(usermoney);
                lastBetRecordId = betrecord.getBetId();
            }
        }

        user.setAmount(userAmount);
        userService.updateUserAmount(user);
        return lastBetRecordId;
    }

    @Override
    public void delFiveBallsBetRecord(Long userId, DelBetRecordReqVO vo) {
        SysUser user = userService.selectUserById(userId);
        Date date = new Date();
        GameFiveballKj gameFiveballKj = gameFiveballKjService.selectGameFiveballKjByPeriods(vo.getGameId(), vo.getPeriods());
        if(gameFiveballKj == null || !StringUtils.equals("0",gameFiveballKj.getStatus()) || gameFiveballKj.getBetTime().compareTo(date) <0){
            throw new ServiceException("当前期数已截止");
        }

        // 查询手动下注信息
//        BetRecord searchSelfBetRecord = new BetRecord();
//        searchSelfBetRecord.setUserId(userId);
//        searchSelfBetRecord.setGameId(vo.getGameId());
//        searchSelfBetRecord.setPeriods(vo.getPeriods());
//        searchSelfBetRecord.setIsDelete("0");
//        // 因为都可以撤单，所以这边代码注释掉
////        searchSelfBetRecord.setAutoBetFlg("0");//手动下注
//        List<BetRecord> selfBetRecordList = betRecordMapper.selectBetRecordList(searchSelfBetRecord);
//        if(selfBetRecordList == null || selfBetRecordList.size() == 0){
//            throw new ServiceException("本期暂无投注记录");
//        }

        GameFiveballRecord searchGameFiveballRecord = new GameFiveballRecord();
        searchGameFiveballRecord.setGameId(vo.getGameId());
        searchGameFiveballRecord.setUserId(userId);
        searchGameFiveballRecord.setPeriods(vo.getPeriods());
        searchGameFiveballRecord.setStatus("0");
        List<GameFiveballRecord> gameFiveballRecordList = gameFiveballRecordService.selectGameFiveballRecordList(searchGameFiveballRecord);
        if(gameFiveballRecordList == null || gameFiveballRecordList.size() == 0){
            throw new ServiceException("本期暂无投注记录");
        }
        GameFiveballRecord gameFiveballRecord = gameFiveballRecordList.get(0);
        // 因为都可以撤单，所以直接删掉下注记录
        gameFiveballRecordService.deleteGameFiveballRecordById(gameFiveballRecord.getId());
        // 因为都可以撤单，所以把追号任务都停了
        gameAutoBetRecordService.cancelAllAutoBetRecord(gameFiveballRecord.getUserId(),gameFiveballKj.getGameId());


//        Usermoney searchUsermoney = new Usermoney();
//        searchUsermoney.setUserId(userId);
//        searchUsermoney.setGameId(vo.getGameId());
//        searchUsermoney.setType("7"); //购买彩票
//        searchUsermoney.setCashContent(vo.getPeriods().toString());
//
//        List<Usermoney> userMoneyList = usermoneyMapper.selectUsermoneyList(searchUsermoney);
//        if(userMoneyList == null || userMoneyList.size() == 0){
//            throw new ServiceException("本期暂无投注记录");
//        }
//
//        for(Usermoney usermoney :userMoneyList){
//            usermoneyMapper.deleteUsermoneyById(usermoney.getId());
//        }

        user.setAmount(user.getAmount() + gameFiveballRecord.getCountMoney());
        userService.updateUserAmount(user);

        Usermoney cancelBetUsermoney = new Usermoney();
        cancelBetUsermoney.setUserId(userId);
        cancelBetUsermoney.setGameId(vo.getGameId());
        cancelBetUsermoney.setGameName(gameFiveballKj.getGameName());
        cancelBetUsermoney.setRemark("彩票撤单[" + gameFiveballKj.getGameName() + "]第[" + vo.getPeriods() + "]期,金额[" + gameFiveballRecord.getCountMoney() + "]元");
        cancelBetUsermoney.setCashMoney(gameFiveballRecord.getCountMoney());
        cancelBetUsermoney.setUserBalance(user.getAmount());
        cancelBetUsermoney.setType("9");
        cancelBetUsermoney.setCashContent(vo.getPeriods().toString());
        usermoneyMapper.insertUsermoney(cancelBetUsermoney);


        // 把下注表数据状态更新为删除
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
            String key = allFiledMap.get(betType+betNumberArg[i].trim());

            if(StringUtils.isEmpty(key)){
                throw new ServiceException("投注类型+投注号码不规范");
            }
            Float recordAmount = GameFiveballMap.get(key) != null ? (Float) GameFiveballMap.get(key) : 0f;

            if(betType == 1) {
                if ("和".equals(betNumberArg[i].trim())) {
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
                if(bigSmall.contains(betNumberArg[i].trim())){
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

    @Override
    @Transactional
    public Long addFiveBallsAutoBetRecord(Long userId, AddAutoBetRecordReqVO vo) {

        SysGame gameInfo = sysGameService.selectSysGameByGameId(vo.getGameId());
        GameAutoBetRecord autoBetRecord = new GameAutoBetRecord();
        autoBetRecord.setUserId(userId);
        autoBetRecord.setStartPeriods(vo.getPeriods());
        autoBetRecord.setNowPeriods(vo.getPeriods());
        autoBetRecord.setGameId(vo.getGameId());
        autoBetRecord.setGameName(gameInfo.getGameName());
        autoBetRecord.setAutoBetType(vo.getType());
        autoBetRecord.setAutoBetNumber(vo.getNumber());
        autoBetRecord.setWinStopStatus(vo.getWinStopStatus());
        autoBetRecord.setAutoBetCount(vo.getAutoBetCount());
        autoBetRecord.setAutoBetTimes(vo.getAutoBetTimes());
        autoBetRecord.setAutoBetMoney(vo.getMoney());
        autoBetRecord.setRemainCount(vo.getAutoBetCount() - 1);
        autoBetRecord.setCountMoney(vo.getMoney());
        gameAutoBetRecordService.insertGameAutoBetRecord(autoBetRecord);

        FiveBallsAddMultiBetRecordReqVO reqVO = new FiveBallsAddMultiBetRecordReqVO();
        List<FiveBallsMultiBetRecordReqVO> multiBetRecordList = new ArrayList<>();
        FiveBallsMultiBetRecordReqVO multiBetRecordReqVO = new FiveBallsMultiBetRecordReqVO();
        multiBetRecordReqVO.setType(vo.getType());
        multiBetRecordReqVO.setNumber(vo.getNumber());
        multiBetRecordReqVO.setMoney(vo.getMoney());
        multiBetRecordReqVO.setAutoBetRecordId(autoBetRecord.getId());
        multiBetRecordList.add(multiBetRecordReqVO);

        reqVO.setGameId(vo.getGameId());
        reqVO.setPeriods(vo.getPeriods());
        reqVO.setRecordList(multiBetRecordList);
        reqVO.setAutoBetFlg("1");
        Long lastRecordId = addFiveBallsMultiBetRecord(userId,reqVO);

        return lastRecordId;
    }
}
