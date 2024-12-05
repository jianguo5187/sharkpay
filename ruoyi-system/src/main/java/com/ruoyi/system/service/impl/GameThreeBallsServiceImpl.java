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
import com.ruoyi.system.mapper.GameOptionMapper;
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

@Service
public class GameThreeBallsServiceImpl implements IGameThreeBallsService {
    @Autowired
    private ISysBetItemService sysBetItemService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysAppService sysAppService;

    @Autowired
    private IGameThreeballRecordService gameThreeballRecordService;

    @Autowired
    private IGameThreeballKjService gameThreeballKjService;

    @Autowired
    private ISysDictDataService dictDataService;

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private ISysBetTypeService sysBetTypeService;

    @Autowired
    private IUserwinService userwinService;

    @Autowired
    private IGameAutoBetRecordService gameAutoBetRecordService;

    @Autowired
    private IRobotBetOptionService robotBetOptionService;

    @Autowired
    private BetRecordMapper betRecordMapper;

    @Autowired
    private FalseUserMapper falseUserMapper;

    @Autowired
    private UsermoneyMapper usermoneyMapper;

    @Autowired
    private GameOptionMapper gameOptionMapper;


    @Override
    public List<SysBetType> getOddsInfo(ThreeBallsOddsReqVO vo) {
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
//
//        SysBetItem searchBetItem = new SysBetItem();
//        searchBetItem.setGameId(vo.getGameId());
//        searchBetItem.setStatus("0");

        return betTypeList;
    }

    @Override
    public ThreeBallKjRecordMoneyRespVO kjRecordMoney(Long userId, ThreeBallsOddsReqVO vo) {
        SysUser user = userService.selectUserById(userId);
        ThreeBallKjRecordMoneyRespVO respVO = new ThreeBallKjRecordMoneyRespVO();
        respVO.setMoney(user.getAmount());
        respVO.setRecordStatus("0");
        respVO.setProfitLossMoney(0f);

        GameResultListReqVO reqVO = new GameResultListReqVO();
        reqVO.setGameId(vo.getGameId());
        reqVO.setPageNumber(1);
        reqVO.setPageRowCount(1);
        List<GameResultListRespVO> threeBallsGameResultList = sysAppService.gameResultList(reqVO);
        if(threeBallsGameResultList != null && threeBallsGameResultList.size() > 0){
            GameResultListRespVO threeBllsGameResult = threeBallsGameResultList.get(0);
            BeanUtils.copyProperties(threeBllsGameResult,respVO);
            respVO.setLotteryStatus("1");

            GameThreeballRecord searchGameThreeballRecord = new GameThreeballRecord();
            searchGameThreeballRecord.setGameId(vo.getGameId());
            searchGameThreeballRecord.setUserId(userId);
            searchGameThreeballRecord.setPeriods(threeBllsGameResult.getPeriods());
            List<GameThreeballRecord> gameThreeballRecordList = gameThreeballRecordService.selectGameThreeballRecordList(searchGameThreeballRecord);
            if(gameThreeballRecordList != null && gameThreeballRecordList.size() > 0){
                respVO.setRecordStatus("1");
                respVO.setProfitLossMoney(gameThreeballRecordList.get(0).getWinMoney() - gameThreeballRecordList.get(0).getCountMoney());
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
    public ThreeBallsTimeDateRespVO timeDate(ThreeBallsOddsReqVO vo) {
        GameThreeballKj searchGameThreeballKj = new GameThreeballKj();
        ThreeBallsTimeDateRespVO respVO = new ThreeBallsTimeDateRespVO();
        searchGameThreeballKj.setGameId(vo.getGameId());
        searchGameThreeballKj.setStatus("0"); // 未开奖
        List<GameThreeballKj> gameThreeballKjList = gameThreeballKjService.selectGameThreeballKjList(searchGameThreeballKj);
        Date date = new Date();
        if(gameThreeballKjList != null && gameThreeballKjList.size() > 0){
            GameThreeballKj firstGameThreeballKj = gameThreeballKjList.get(0);
            if(firstGameThreeballKj.getPreTime().compareTo(date) > 0){
                Long preTime = firstGameThreeballKj.getPreTime().getTime() - date.getTime();
                Long betTime = firstGameThreeballKj.getBetTime().getTime() - date.getTime();
                respVO.setPeriods(firstGameThreeballKj.getPeriods());
                respVO.setGameId(firstGameThreeballKj.getGameId());
                respVO.setGameName(firstGameThreeballKj.getGameName());
                respVO.setPreTime(preTime/ 1000L);
                respVO.setBetTime(betTime/ 1000L);
            }else{
                int size = 0;
                if(gameThreeballKjList.size() > 1){
                    size = 1;
                }
                GameThreeballKj lasterGameThreeballKj = gameThreeballKjList.get(size);
                Long preTime = lasterGameThreeballKj.getPreTime().getTime() - date.getTime();
                Long betTime = lasterGameThreeballKj.getBetTime().getTime() - date.getTime();
                respVO.setPeriods(lasterGameThreeballKj.getPeriods());
                respVO.setGameId(lasterGameThreeballKj.getGameId());
                respVO.setGameName(lasterGameThreeballKj.getGameName());
                respVO.setPreTime(preTime/ 1000L);
                respVO.setBetTime(betTime/ 1000L);
            }
        }

        return respVO;
    }

    @Override
    public List<BetRecordListRespVO> betRecordList(Long userId, ThreeBallsBetRecordListReqVO vo) {
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
        GameThreeballKj gameThreeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(vo.getGameId(), vo.getPeriods());

        if(gameThreeballKj.getPreTime().compareTo(date) < 0){
            return respVO;
        }

        if(vo.getLastBetRecordId() != null && vo.getLastBetRecordId() > 0){
            List<VirtuallyGameRecordRespVO> dbVirtuallyRecordList  = betRecordMapper.getVirtuallyRecordList(vo.getGameId(), vo.getPeriods(), vo.getLastBetRecordId());
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
        betTypeMap.put("双面",1);
        betTypeMap.put("特码",2);
        betTypeMap.put("特殊",3);

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
            String[] betNumberArg = betOption[1].split(",");
            for(String betNumber : betNumberArg) {

                BetRecord betrecord = new BetRecord();
                betrecord.setUserId(0l);
                betrecord.setPeriods(vo.getPeriods());
                betrecord.setGameId(vo.getGameId());
                betrecord.setGameName(gameThreeballKj.getGameName());
                betrecord.setPlayType(betOption[0]);
                betrecord.setPlayDetail(betNumber);
                betrecord.setPlayGroup(betTypeMap.get(betNumber));
                betrecord.setOption(0);
                betrecord.setMoney(changeLongNumber(betOption[2]));
                betrecord.setBalance(0f);
                betrecord.setAccountResult(0f);
                betrecord.setSettleFlg("0");
                betrecord.setGameResult("");
                betrecord.setIsDelete("0");
                betrecord.setRobotUserId(virtuallyGameUser.getId());
                betrecord.setIsRobot("1");
                betrecord.setHouseId(1l);
                betrecord.setRobotNickName(virtuallyGameUser.getUserName());
                betrecord.setRobotPic(virtuallyGameUser.getRobotPic());
                int insertIndex = betRecordMapper.insertBetRecord(betrecord);

                betOptionMap.remove(robotBetOption.getId());

                if (insertIndex > 0) {
                    VirtuallyGameRecordRespVO virtuallyGameRecord = new VirtuallyGameRecordRespVO();
                    virtuallyGameRecord.setBetId(betrecord.getBetId());
                    virtuallyGameRecord.setHouse("31");
                    virtuallyGameRecord.setNickName(virtuallyGameUser.getUserName());
                    virtuallyGameRecord.setPic(virtuallyGameUser.getRobotPic());
                    virtuallyGameRecord.setStime(date);
                    virtuallyGameRecord.setNumber(betNumber);
                    virtuallyGameRecord.setMoney(changeLongNumber(betOption[2]));
                    virtuallyGameRecord.setType(betTypeMap.get(betNumber));
                    virtuallyGameRecord.setPeriods(vo.getPeriods());
                    virtuallyGameRecord.setPlayType(betOption[0]);
                    respVO.add(virtuallyGameRecord);
                }
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
//                falseUserList = falseUserMapper.selectFalseUserListByGameId(2l);
//            }
//            if(falseUserList != null && falseUserList.size() > 0){
//                FalseUser falseUser = falseUserList.get(random(1,falseUserList.size()) - 1);
//
//                Integer type = 0;
////                String playType = "和值";
//                String num = "";
//                String money = "";
//
//                String[] numArg = falseUser.getRobotBetNum().split("\\|");
//                String[] moneyArg = falseUser.getRobotBetMoney().split("\\|");
//
//                money = moneyArg[random(1,moneyArg.length)-1];
//
//                FalseUser searchFalseUser = new FalseUser();
//                List<FalseUser> allFalseUserList = falseUserMapper.selectFalseUserList(searchFalseUser);
//
////                FalseUser virtuallyGameUser = allFalseUserList.get(random(1,allFalseUserList.size()) - 1);
//
//                int cishu = random(3,7);
//                Date now = new Date();
//
//                GameOption searchGameOption = new GameOption();
//                searchGameOption.setGameId(vo.getGameId());
//                List<GameOption> gameOptionList = gameOptionMapper.selectGameOptionList(searchGameOption);
//                Map<String , GameOption> gameOptionMap = gameOptionList.stream()
//                        .collect(Collectors.toMap(
//                                GameOption::getTitle,
//                                Function.identity(),
//                                (existing, replacement) -> existing // 保留现有的值，忽略替换值
//                        ));
//
//                for(int i=0;i<cishu;i++){
//
//                    num = numArg[random(1,numArg.length)-1];
//                    //防止投注号码是空
//                    if(StringUtils.isEmpty(num)){
//                        num = numArg[0];
//                    }
//                    if(StringUtils.isEmpty(num)){
//                        continue;
//                    }
//
//                    GameOption gameOption = gameOptionMap.get(num + "");
//                    if(gameOption == null){
//                        continue;
//                    }
//                    String key = gameOption.getKey();
//                    String playType = gameOption.getPlayGroupTitle();
//                    Integer playGroup = gameOption.getPlayGroup();
//
//                    BetRecord betrecord = new BetRecord();
//                    betrecord.setUserId(0l);
//                    betrecord.setPeriods(vo.getPeriods());
//                    betrecord.setGameId(vo.getGameId());
//                    betrecord.setGameName(gameThreeballKj.getGameName());
//                    betrecord.setPlayType(playType);
//                    betrecord.setPlayGroup(playGroup);
//                    betrecord.setPlayDetail(num);
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
//                    betrecord.setRecordLotteryKey(key);
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
//                        virtuallyGameRecord.setNumber(num);
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
    public Long addThreeBallsBetRecord(Long userId, ThreeBallsAddBetRecordReqVO vo) {
        Date date = new Date();
        GameThreeballKj gameThreeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(vo.getGameId(), vo.getPeriods());
        if(gameThreeballKj.getBetTime() == null || gameThreeballKj.getBetTime().compareTo(date) < 0){
            throw new ServiceException("当前期数已截止,请等待开奖后在投注");
        }
        SysUser user = userService.selectUserById(userId);
        String[] betNumberArg = vo.getNumber().split(",");
        if(user.getAmount().compareTo(vo.getMoney() * betNumberArg.length)<0){
            throw new ServiceException("用户余额不足");
        }
        GameThreeballRecord searchGameThreeballRecord = new GameThreeballRecord();
        searchGameThreeballRecord.setGameId(vo.getGameId());
        searchGameThreeballRecord.setUserId(userId);
        searchGameThreeballRecord.setPeriods(vo.getPeriods());
        searchGameThreeballRecord.setStatus("0");
        List<GameThreeballRecord> gameThreeballRecordList = gameThreeballRecordService.selectGameThreeballRecordList(searchGameThreeballRecord);

        GameThreeballRecord gameThreeballRecord = null;
        if(gameThreeballRecordList != null && gameThreeballRecordList.size() >0){
            gameThreeballRecord = gameThreeballRecordList.get(0);
        }

        SysDictData searchSysDictData = new SysDictData();
        searchSysDictData.setStatus("0");
        searchSysDictData.setDictType("limit_amount_three");
        List<SysDictData> dictDataList = dictDataService.selectDictDataList(searchSysDictData);
        Map<String , SysDictData> limitAmountMap = dictDataList.stream()
                .collect(Collectors.toMap(
                        SysDictData::getDictValue,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        GameOption searchGameOption = new GameOption();
        searchGameOption.setGameId(vo.getGameId());
        List<GameOption> gameOptionList = gameOptionMapper.selectGameOptionList(searchGameOption);
        Map<String , GameOption> gameOptionMap = gameOptionList.stream()
                .collect(Collectors.toMap(
                        GameOption::getTitle,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));


        if(gameThreeballRecord != null && getLimitAmountByKey(limitAmountMap,"sum_max").compareTo(gameThreeballRecord.getCountMoney() + vo.getMoney() * betNumberArg.length) < 0){
            throw new ServiceException("单期投注总金额不可以大于" + getLimitAmountByKey(limitAmountMap,"small_num"));
        }

        if(vo.getMoney().compareTo(getLimitAmountByKey(limitAmountMap,"small_num"))<0){
            throw new ServiceException("投注金额不可以小余" + getLimitAmountByKey(limitAmountMap,"small_num"));
        }
        Map<String, String> countMap = new HashMap<>();
        Integer numTypeCnt = 0;

        if(gameThreeballRecord != null){
            Map<String, Object> gameThreeballRecordMap = EntityMapTransUtils.entityToMap1(gameThreeballRecord);
            for(int i=0; i<=27; i++){
                if(gameThreeballRecordMap.get("num"+i) != null && (Float)gameThreeballRecordMap.get("num"+i) >0){
                    countMap.put("num"+i,i+"");
                }
            }
            for(int i=0; i<betNumberArg.length; i++){
                if(countMap.containsKey("num"+betNumberArg[i].trim())){
                    numTypeCnt++;
                }
            }
        }

        Long lastBetRecordId = 0l;
        for(int i=0; i<betNumberArg.length; i++) {
            GameOption gameOption = gameOptionMap.get(betNumberArg[i].trim() + "");
            if("特码".equals(gameOption.getPlayGroupTitle())){
                Integer numCount = limitAmountMap.get("num_count").getDictLabel() != null ? (int)Float.parseFloat(limitAmountMap.get("num_count").getDictLabel()):0;
                if (numCount >0 && numCount.compareTo((countMap.size() + betNumberArg.length - numTypeCnt)) < 0) {
                    throw new ServiceException("投注特码不可以超过" + getLimitAmountByKey(limitAmountMap,"num_count"));
                }
            }
            if(gameThreeballRecord != null){
                Map<String, Object> gameThreeballRecordMap = EntityMapTransUtils.entityToMap1(gameThreeballRecord);
                String mainKey = gameOption.getKey().toLowerCase();
                String keyB = "b_num" +gameOption.getPlayGroup();
                Float recordAmount = gameThreeballRecordMap.get(mainKey) != null ? (Float) gameThreeballRecordMap.get(mainKey) : 0f;
                if(limitAmountMap.get(keyB) != null && (getLimitAmountByKey(limitAmountMap,keyB)).compareTo(vo.getMoney()+recordAmount) < 0){
                    throw new ServiceException(betNumberArg[i].trim() + "投注金额不可以大于" + getLimitAmountByKey(limitAmountMap,keyB));
                }
                List<String> specialList = Arrays.asList("0", "1", "2", "3", "24", "25", "26", "27");
                if (specialList.contains(betNumberArg[i].trim() + "")) {
                    if (getLimitAmountByKey(limitAmountMap,"big_special").compareTo(vo.getMoney() + recordAmount) < 0) {
                        throw new ServiceException("特殊号码投注金额不可以大于" + getLimitAmountByKey(limitAmountMap,"big_special"));
                    }
                }
            }
        }

        Float userAmount = user.getAmount();
        for(int i=0; i<betNumberArg.length; i++){

            GameOption gameOption = gameOptionMap.get(betNumberArg[i].trim() + "");
            String key = gameOption.getKey();
            String playType = gameOption.getPlayGroupTitle();
            Integer playGroup = gameOption.getPlayGroup();

            searchGameThreeballRecord = new GameThreeballRecord();
            searchGameThreeballRecord.setGameId(vo.getGameId());
            searchGameThreeballRecord.setUserId(userId);
            searchGameThreeballRecord.setPeriods(vo.getPeriods());
            List<GameThreeballRecord> newGameThreeballRecordList = gameThreeballRecordService.selectGameThreeballRecordList(searchGameThreeballRecord);
            if(newGameThreeballRecordList != null && newGameThreeballRecordList.size() >0){
                GameThreeballRecord updateGameThreeballRecord = newGameThreeballRecordList.get(0);

                Map<String, Object> updateGameThreeballMap = EntityMapTransUtils.entityToMap1(updateGameThreeballRecord);

                Object betRecordAmountObject = updateGameThreeballMap.get(key);
                Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                Float betMoney = betRecordAmount + vo.getMoney();
                updateGameThreeballMap.put(key, betMoney);
                updateGameThreeballRecord = EntityMapTransUtils.mapToEntity1(GameThreeballRecord.class, updateGameThreeballMap);

                updateGameThreeballRecord.setCountMoney(updateGameThreeballRecord.getCountMoney() + vo.getMoney());
                updateGameThreeballRecord.setHouse(1);
                updateGameThreeballRecord.setRecordTime(date);
                gameThreeballRecordService.updateGameThreeballRecord(updateGameThreeballRecord);
            }else{
                GameThreeballRecord newGameThreeballRecord = new GameThreeballRecord();

                Map<String, Object> newGameThreeballMap = EntityMapTransUtils.entityToMap1(newGameThreeballRecord);

                Object betRecordAmountObject = newGameThreeballMap.get(key);
                Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                Float betMoney = betRecordAmount + vo.getMoney();
                newGameThreeballMap.put(key, betMoney);

                newGameThreeballRecord = EntityMapTransUtils.mapToEntity1(GameThreeballRecord.class, newGameThreeballMap);

                newGameThreeballRecord.setGameId(vo.getGameId());
                newGameThreeballRecord.setGameName(gameThreeballKj.getGameName());

                newGameThreeballRecord.setUserId(userId);
                newGameThreeballRecord.setPeriods(vo.getPeriods());
                newGameThreeballRecord.setStatus("0");
                newGameThreeballRecord.setCountMoney(vo.getMoney());
                newGameThreeballRecord.setHouse(1);
                gameThreeballRecordService.insertGameThreeballRecord(newGameThreeballRecord);
            }

            userAmount = userAmount - vo.getMoney();

            BetRecord betrecord = new BetRecord();
            betrecord.setIsRobot("0");
            betrecord.setUserId(userId);
            betrecord.setPeriods(vo.getPeriods());
            betrecord.setGameId(vo.getGameId());
            betrecord.setGameName(gameThreeballKj.getGameName());

            betrecord.setPlayType(playType);
            betrecord.setPlayDetail(betNumberArg[i].trim());
            betrecord.setPlayGroup(playGroup);
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
            usermoney.setGameName(gameThreeballKj.getGameName());
            usermoney.setRemark("投注[" + gameThreeballKj.getGameName() + "]第[" + vo.getPeriods() + "]期,投注内容[" + playType + "/" + betNumberArg[i].trim() + "],金额[" + vo.getMoney() + "]元");
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
    public Long addThreeBallsMultiBetRecord(Long userId, ThreeBallsAddMultiBetRecordReqVO vo) {
        Date date = new Date();
        GameThreeballKj gameThreeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(vo.getGameId(), vo.getPeriods());
        if(gameThreeballKj.getBetTime() == null || gameThreeballKj.getBetTime().compareTo(date) < 0){
            throw new ServiceException("当前期数已截止,请等待开奖后在投注");
        }
        Float totalRecordMoney = 0f;
        String[] betNumberArg;
        SysUser user = userService.selectUserById(userId);

        for(ThreeBallsMultiBetRecordReqVO threeBallsMultiBetRecordReqVO : vo.getRecordList()){
            betNumberArg = threeBallsMultiBetRecordReqVO.getNumber().split(",");
            totalRecordMoney = totalRecordMoney + (threeBallsMultiBetRecordReqVO.getMoney() * betNumberArg.length);
        }

        if(user.getAmount().compareTo(totalRecordMoney)<0){
            throw new ServiceException("用户余额不足");
        }
        GameThreeballRecord searchGameThreeballRecord = new GameThreeballRecord();
        searchGameThreeballRecord.setGameId(vo.getGameId());
        searchGameThreeballRecord.setUserId(userId);
        searchGameThreeballRecord.setPeriods(vo.getPeriods());
        searchGameThreeballRecord.setStatus("0");
        List<GameThreeballRecord> gameThreeballRecordList = gameThreeballRecordService.selectGameThreeballRecordList(searchGameThreeballRecord);

        GameThreeballRecord gameThreeballRecord = null;
        if(gameThreeballRecordList != null && gameThreeballRecordList.size() >0){
            gameThreeballRecord = gameThreeballRecordList.get(0);
        }


        SysDictData searchSysDictData = new SysDictData();
        searchSysDictData.setStatus("0");
        searchSysDictData.setDictType("limit_amount_three");
        List<SysDictData> dictDataList = dictDataService.selectDictDataList(searchSysDictData);
        Map<String , SysDictData> limitAmountMap = dictDataList.stream()
                .collect(Collectors.toMap(
                        SysDictData::getDictValue,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        GameOption searchGameOption = new GameOption();
        searchGameOption.setGameId(vo.getGameId());
        List<GameOption> gameOptionList = gameOptionMapper.selectGameOptionList(searchGameOption);
        Map<String , GameOption> gameOptionMap = gameOptionList.stream()
                .collect(Collectors.toMap(
                        GameOption::getTitle,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        for(ThreeBallsMultiBetRecordReqVO threeBallsMultiBetRecordReqVO : vo.getRecordList()){

            betNumberArg = threeBallsMultiBetRecordReqVO.getNumber().split(",");
            if(gameThreeballRecord != null && getLimitAmountByKey(limitAmountMap,"sum_max").compareTo(gameThreeballRecord.getCountMoney() + threeBallsMultiBetRecordReqVO.getMoney() * betNumberArg.length) < 0){
                throw new ServiceException("单期投注总金额不可以大于" + getLimitAmountByKey(limitAmountMap,"small_num"));
            }

            if(threeBallsMultiBetRecordReqVO.getMoney().compareTo(getLimitAmountByKey(limitAmountMap,"small_num"))<0){
                throw new ServiceException("投注金额不可以小余" + getLimitAmountByKey(limitAmountMap,"small_num"));
            }
            Integer numTypeCnt = 0;
            Map<String, String> countMap = new HashMap<>();

            if(gameThreeballRecord != null){
                Map<String, Object> gameThreeballRecordMap = EntityMapTransUtils.entityToMap1(gameThreeballRecord);
                for(int i=0; i<=27; i++){
                    if(gameThreeballRecordMap.get("num"+i) != null && (Float)gameThreeballRecordMap.get("num"+i) >0){
                        countMap.put("num"+i,i+"");
                    }
                }
                for(int i=0; i<betNumberArg.length; i++){
                    if(countMap.containsKey("num"+betNumberArg[i].trim())){
                        numTypeCnt++;
                    }
                }
            }

            for(int i=0; i<betNumberArg.length; i++) {
                GameOption gameOption = gameOptionMap.get(betNumberArg[i].trim() + "");
                if("特码".equals(gameOption.getPlayGroupTitle())){
                    Integer numCount = limitAmountMap.get("num_count").getDictLabel() != null ? (int)Float.parseFloat(limitAmountMap.get("num_count").getDictLabel()):0;
                    if (numCount >0 && numCount.compareTo((countMap.size() + betNumberArg.length - numTypeCnt)) < 0) {
                        throw new ServiceException("投注特码不可以超过" + getLimitAmountByKey(limitAmountMap,"num_count") + "个");
                    }
                }
                if(gameThreeballRecord != null){
                    Map<String, Object> gameThreeballRecordMap = EntityMapTransUtils.entityToMap1(gameThreeballRecord);
                    String mainKey = gameOption.getKey().toLowerCase();
                    String keyB = "b_num" +gameOption.getPlayGroup();
                    Float recordAmount = gameThreeballRecordMap.get(mainKey) != null ? (Float) gameThreeballRecordMap.get(mainKey) : 0f;
                    if(limitAmountMap.get(keyB) != null && (getLimitAmountByKey(limitAmountMap,keyB)).compareTo(threeBallsMultiBetRecordReqVO.getMoney()+recordAmount) < 0){
                        throw new ServiceException(betNumberArg[i].trim() + "投注金额不可以大于" + getLimitAmountByKey(limitAmountMap,keyB));
                    }
                    List<String> specialList = Arrays.asList("0", "1", "2", "3", "24", "25", "26", "27");
                    if (specialList.contains(betNumberArg[i].trim() + "")) {
                        if (getLimitAmountByKey(limitAmountMap,"big_special").compareTo(threeBallsMultiBetRecordReqVO.getMoney() + recordAmount) < 0) {
                            throw new ServiceException("特殊号码投注金额不可以大于" + getLimitAmountByKey(limitAmountMap,"big_special"));
                        }
                    }
                }
            }
        }

        Float userAmount = user.getAmount();
        Long lastBetRecordId = 0l;
        for(ThreeBallsMultiBetRecordReqVO threeBallsMultiBetRecordReqVO : vo.getRecordList()) {
            betNumberArg = threeBallsMultiBetRecordReqVO.getNumber().split(",");
            for(int i=0; i<betNumberArg.length; i++){

                GameOption gameOption = gameOptionMap.get(betNumberArg[i].trim());
                String key = gameOption.getKey();
                String playType = gameOption.getPlayGroupTitle();
                Integer playGroup = gameOption.getPlayGroup();

                searchGameThreeballRecord = new GameThreeballRecord();
                searchGameThreeballRecord.setGameId(vo.getGameId());
                searchGameThreeballRecord.setUserId(userId);
                searchGameThreeballRecord.setPeriods(vo.getPeriods());
                List<GameThreeballRecord> newGameThreeballRecordList = gameThreeballRecordService.selectGameThreeballRecordList(searchGameThreeballRecord);
                if(newGameThreeballRecordList != null && newGameThreeballRecordList.size() >0){
                    GameThreeballRecord updateGameThreeballRecord = newGameThreeballRecordList.get(0);

                    Map<String, Object> updateGameThreeballMap = EntityMapTransUtils.entityToMap1(updateGameThreeballRecord);

                    Object betRecordAmountObject = updateGameThreeballMap.get(key);
                    Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                    Float betMoney = betRecordAmount + threeBallsMultiBetRecordReqVO.getMoney();
                    updateGameThreeballMap.put(key, betMoney);
                    updateGameThreeballRecord = EntityMapTransUtils.mapToEntity1(GameThreeballRecord.class, updateGameThreeballMap);

                    updateGameThreeballRecord.setCountMoney(updateGameThreeballRecord.getCountMoney() + threeBallsMultiBetRecordReqVO.getMoney());
                    updateGameThreeballRecord.setHouse(1);
                    updateGameThreeballRecord.setRecordTime(date);
                    gameThreeballRecordService.updateGameThreeballRecord(updateGameThreeballRecord);
                }else{
                    GameThreeballRecord newGameThreeballRecord = new GameThreeballRecord();

                    Map<String, Object> newGameThreeballMap = EntityMapTransUtils.entityToMap1(newGameThreeballRecord);

                    Object betRecordAmountObject = newGameThreeballMap.get(key);
                    Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                    Float betMoney = betRecordAmount + threeBallsMultiBetRecordReqVO.getMoney();
                    newGameThreeballMap.put(key, betMoney);

                    newGameThreeballRecord = EntityMapTransUtils.mapToEntity1(GameThreeballRecord.class, newGameThreeballMap);

                    newGameThreeballRecord.setGameId(vo.getGameId());
                    newGameThreeballRecord.setGameName(gameThreeballKj.getGameName());

                    newGameThreeballRecord.setUserId(userId);
                    newGameThreeballRecord.setPeriods(vo.getPeriods());
                    newGameThreeballRecord.setStatus("0");
                    newGameThreeballRecord.setCountMoney(threeBallsMultiBetRecordReqVO.getMoney());
                    newGameThreeballRecord.setHouse(1);
                    gameThreeballRecordService.insertGameThreeballRecord(newGameThreeballRecord);
                }

                userAmount = userAmount - threeBallsMultiBetRecordReqVO.getMoney();

                BetRecord betrecord = new BetRecord();
                betrecord.setIsRobot("0");
                betrecord.setUserId(userId);
                betrecord.setPeriods(vo.getPeriods());
                betrecord.setGameId(vo.getGameId());
                betrecord.setGameName(gameThreeballKj.getGameName());

                betrecord.setPlayType(playType);
                betrecord.setPlayDetail(betNumberArg[i].trim());
                betrecord.setPlayGroup(playGroup);
                betrecord.setOption(0);
                betrecord.setMoney(threeBallsMultiBetRecordReqVO.getMoney());
                betrecord.setBalance(userAmount);
                betrecord.setAccountResult(0f);
                betrecord.setSettleFlg("0");
                betrecord.setGameResult("");
                betrecord.setIsDelete("0");
                betrecord.setHouseId(1l);
                betrecord.setRecordLotteryKey(key);
                if(StringUtils.equals(vo.getAutoBetFlg(), "1")){
                    betrecord.setAutoBetFlg("1"); //自动追号
                    betrecord.setAutoBetRecordId(threeBallsMultiBetRecordReqVO.getAutoBetRecordId());//自动追号ID
                }
                betrecord.setBetType(threeBallsMultiBetRecordReqVO.getType());
                betrecord.setBetNumber(betNumberArg[i].trim());
                betRecordMapper.insertBetRecord(betrecord);

                Usermoney usermoney = new Usermoney();
                usermoney.setUserId(userId);
                usermoney.setGameId(vo.getGameId());
                usermoney.setGameName(gameThreeballKj.getGameName());
                usermoney.setRemark("投注[" + gameThreeballKj.getGameName() + "]第[" + vo.getPeriods() + "]期,投注内容[" + playType + "/" + betNumberArg[i].trim() + "],金额[" + threeBallsMultiBetRecordReqVO.getMoney() + "]元");
                usermoney.setCashMoney(threeBallsMultiBetRecordReqVO.getMoney());
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
    public void delThreeBallsBetRecord(Long userId, DelBetRecordReqVO vo) {
        SysUser user = userService.selectUserById(userId);
        Date date = new Date();
        GameThreeballKj gameThreeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(vo.getGameId(), vo.getPeriods());
        if(gameThreeballKj == null || !StringUtils.equals("0",gameThreeballKj.getStatus()) || gameThreeballKj.getBetTime().compareTo(date) <0){
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

        GameThreeballRecord searchGameThreeballRecord = new GameThreeballRecord();
        searchGameThreeballRecord.setGameId(vo.getGameId());
        searchGameThreeballRecord.setUserId(userId);
        searchGameThreeballRecord.setPeriods(vo.getPeriods());
        searchGameThreeballRecord.setStatus("0");
        List<GameThreeballRecord> gameThreeballRecordList = gameThreeballRecordService.selectGameThreeballRecordList(searchGameThreeballRecord);
        if(gameThreeballRecordList == null || gameThreeballRecordList.size() == 0){
            throw new ServiceException("本期暂无投注记录");
        }
        GameThreeballRecord gameThreeballRecord = gameThreeballRecordList.get(0);
        // 因为都可以撤单，所以直接删掉下注记录
        gameThreeballRecordService.deleteGameThreeballRecordById(gameThreeballRecord.getId());

        // 因为都可以撤单，所以把追号任务都停了
        gameAutoBetRecordService.cancelAllAutoBetRecord(gameThreeballRecord.getUserId(),gameThreeballKj.getGameId());

        // 因为都可以撤单，所以这边代码注释掉
//        BetRecord searchAutoBetRecord = new BetRecord();
//        searchAutoBetRecord.setUserId(userId);
//        searchAutoBetRecord.setGameId(vo.getGameId());
//        searchAutoBetRecord.setPeriods(vo.getPeriods());
//        searchAutoBetRecord.setIsDelete("0");
//        searchAutoBetRecord.setAutoBetFlg("1");//追号下注
//        List<BetRecord> autoBetRecordList = betRecordMapper.selectBetRecordList(searchAutoBetRecord);
//        if(autoBetRecordList == null || autoBetRecordList.size() == 0){
//            // 没有追号任务，直接把record表记录删掉
//            gameThreeballRecordService.deleteGameThreeballRecordById(gameThreeballRecord.getId());
//        }else{
//            // 投注记录表投注金额字段全部变成空
//            gameThreeballRecord = initRecordAmount(gameThreeballRecord);
//
//            GameOption searchGameOption = new GameOption();
//            searchGameOption.setGameId(vo.getGameId());
//            List<GameOption> gameOptionList = gameOptionMapper.selectGameOptionList(searchGameOption);
//            Map<String , GameOption> gameOptionMap = gameOptionList.stream()
//                    .collect(Collectors.toMap(
//                            GameOption::getTitle,
//                            Function.identity(),
//                            (existing, replacement) -> existing // 保留现有的值，忽略替换值
//                    ));
//
//            // 把自动下注的值加回去
//            for(BetRecord autoBetRecord : autoBetRecordList){
//
//                GameOption gameOption = gameOptionMap.get(autoBetRecord.getBetNumber());
//                String key = gameOption.getKey();
//
//                Map<String, Object> updateGameThreeballMap = EntityMapTransUtils.entityToMap1(gameThreeballRecord);
//
//                Object betRecordAmountObject = updateGameThreeballMap.get(key);
//                Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
//                Float betMoney = betRecordAmount + autoBetRecord.getMoney();
//                updateGameThreeballMap.put(key, betMoney);
//                gameThreeballRecord = EntityMapTransUtils.mapToEntity1(GameThreeballRecord.class, updateGameThreeballMap);
//
//                gameThreeballRecord.setCountMoney(gameThreeballRecord.getCountMoney() + autoBetRecord.getMoney());
//                gameThreeballRecord.setHouse(1);
//                gameThreeballRecord.setRecordTime(date);
//                gameThreeballRecordService.updateGameThreeballRecord(gameThreeballRecord);
//            }
//        }

        user.setAmount(user.getAmount() + gameThreeballRecord.getCountMoney());
        userService.updateUserAmount(user);

        Usermoney cancelBetUsermoney = new Usermoney();
        cancelBetUsermoney.setUserId(userId);
        cancelBetUsermoney.setGameId(vo.getGameId());
        cancelBetUsermoney.setGameName(gameThreeballKj.getGameName());
        cancelBetUsermoney.setRemark("彩票撤单[" + gameThreeballKj.getGameName() + "]第[" + vo.getPeriods() + "]期,金额[" + gameThreeballRecord.getCountMoney() + "]元");
        cancelBetUsermoney.setCashMoney(gameThreeballRecord.getCountMoney());
        cancelBetUsermoney.setUserBalance(user.getAmount());
        cancelBetUsermoney.setType("9");
        cancelBetUsermoney.setCashContent(vo.getPeriods().toString());
        usermoneyMapper.insertUsermoney(cancelBetUsermoney);

        // 把下注表数据状态更新为删除
        betRecordMapper.cancelBetRecordByPeriods(vo.getGameId(), vo.getPeriods(), userId, "1");
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

    public GameThreeballRecord initRecordAmount(GameThreeballRecord record){
        record.setCountMoney(0f);
        record.setBig(0f);
        record.setSmall(0f);
        record.setSingle(0f);
        record.setDoubleAmount(0f);
        record.setMuchBig(0f);
        record.setBigSingle(0f);
        record.setSmallSingle(0f);
        record.setBigDouble(0f);
        record.setSmallDouble(0f);
        record.setMuchSmall(0f);
        record.setNum0(0f);
        record.setNum1(0f);
        record.setNum2(0f);
        record.setNum3(0f);
        record.setNum4(0f);
        record.setNum5(0f);
        record.setNum6(0f);
        record.setNum7(0f);
        record.setNum8(0f);
        record.setNum9(0f);
        record.setNum10(0f);
        record.setNum11(0f);
        record.setNum12(0f);
        record.setNum13(0f);
        record.setNum14(0f);
        record.setNum15(0f);
        record.setNum16(0f);
        record.setNum17(0f);
        record.setNum18(0f);
        record.setNum19(0f);
        record.setNum20(0f);
        record.setNum21(0f);
        record.setNum22(0f);
        record.setNum23(0f);
        record.setNum24(0f);
        record.setNum25(0f);
        record.setNum26(0f);
        record.setNum27(0f);
        record.setRed(0f);
        record.setGreen(0f);
        record.setBlue(0f);
        record.setLoong(0f);
        record.setTiger(0f);
        record.setClose(0f);
        record.setLeopard(0f);
        record.setPairs(0f);
        record.setShun(0f);

        return record;
    }

    @Override
    @Transactional
    public Long addThreeBallsAutoBetRecord(Long userId, AddAutoBetRecordReqVO vo) {

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

        ThreeBallsAddMultiBetRecordReqVO reqVO = new ThreeBallsAddMultiBetRecordReqVO();
        List<ThreeBallsMultiBetRecordReqVO> multiBetRecordList = new ArrayList<>();
        ThreeBallsMultiBetRecordReqVO multiBetRecordReqVO = new ThreeBallsMultiBetRecordReqVO();
        multiBetRecordReqVO.setType(vo.getType());
        multiBetRecordReqVO.setNumber(vo.getNumber());
        multiBetRecordReqVO.setMoney(vo.getMoney());
        multiBetRecordReqVO.setAutoBetRecordId(autoBetRecord.getId());
        multiBetRecordList.add(multiBetRecordReqVO);

        reqVO.setGameId(vo.getGameId());
        reqVO.setPeriods(vo.getPeriods());
        reqVO.setRecordList(multiBetRecordList);
        reqVO.setAutoBetFlg("1");
        Long lastRecordId = addThreeBallsMultiBetRecord(userId,reqVO);
        return lastRecordId;
    }
}
