package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.EntityMapTransUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.IThreeBallLotteryService;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.vo.RecordSumRespVo;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class ThreeBallLotteryServiceImpl implements IThreeBallLotteryService {

    //系统提前开奖期数
    @Value("${gameOpen.periodsSize}")
    private Integer periodsSize;

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private IGameThreeballKjService gameThreeballKjService;

    @Autowired
    private IGameThreeballOpenDataService gameThreeballOpenDataService;

    @Autowired
    private IGameThreeballRecordService gameThreeballRecordService;

    @Autowired
    private IUserwinService userwinService;

    @Autowired
    private IUsermoneyService usermoneyService;

    @Autowired
    private IAdminwinService adminwinService;

    @Autowired
    private ISysUserService sysUserService;

    @Autowired
    private ISysBetItemService sysBetItemService;

    @Autowired
    private IBetRecordService betRecordService;

    @Autowired
    private IWaveService waveService;

    @Autowired
    private IGameThreeballMixedOddsService gameThreeballMixedOddsService;

    @Autowired
    private ISysAppService sysAppService;

    @Autowired
    private ISysConfigService configService;

    @Override
    public void lotteryThreeBall(String gameCode) {

        SysGame gameInfo = sysGameService.selectSysGameByGameMarkId(gameCode);
        if(gameInfo == null){
            throw new ServiceException("没有" + gameCode + "游戏基础表数据");
        }
        if(gameInfo.getLotteryInterval() == 0){
            throw new ServiceException("开奖间隔为空,定时开奖结算失败");
        }

        GameThreeballKj existGameThreeballKj = gameThreeballKjService.selectLastRecord(gameInfo.getGameId(),"");

        GameThreeballOpenData gameThreeballOpenData = gameThreeballOpenDataService.selectLastRecord(gameInfo.getGameId());

        Long jiange = 0l;
        if(gameThreeballOpenData == null){
            throw new ServiceException(gameInfo.getGameName() + "没有开奖数据，请先同步开奖数据");
        }

        GameThreeballKj searchGameThreeballKj = new GameThreeballKj();
        searchGameThreeballKj.setStatus("0");
        searchGameThreeballKj.setGameId(gameInfo.getGameId());
        List<GameThreeballKj> notOpenGameThreeballKjList = gameThreeballKjService.selectGameThreeballKjList(searchGameThreeballKj);
        if(notOpenGameThreeballKjList != null && notOpenGameThreeballKjList.size() > 0){
            jiange = gameThreeballOpenData.getPeriods() - notOpenGameThreeballKjList.get(0).getPeriods();
        }

        if(jiange >= 0){
            List<GameThreeballKj> gameThreeballKjList = gameThreeballKjService.selectGameThreeballKjListWithStatusZeroAndLimit(gameInfo.getGameId(),gameThreeballOpenData.getPeriods(),"0",null,"1",50);
            for (GameThreeballKj gameThreeballKj : gameThreeballKjList){
                gameThreeballKj.setStatus("2");
                gameThreeballKj.setUpdateBy("lotteryThreeBalance");
                gameThreeballKjService.updateGameThreeballKj(gameThreeballKj);
            }
            createThreeData(gameInfo);
        }

        if(existGameThreeballKj != null){
            SingleThreeUpdate(gameInfo);
            createThreeData(gameInfo);
        }else{
            CreateThreeAll(gameInfo);
        }
    }

    @Override
    public void createThreeData(SysGame gameInfo){
        if(StringUtils.equals(gameInfo.getSystemOpenType(),"N")){
            List<GameThreeballKj> gameThreeballKjList = gameThreeballKjService.selectGameThreeballKjListWithStatusZeroAndLimit(gameInfo.getGameId(),null,"0",null,"1",null);
            if(gameThreeballKjList.size() >= 2){
                return;
            }
            GameThreeballOpenData gameThreeballOpenData = gameThreeballOpenDataService.selectLastRecord(gameInfo.getGameId());
            if(gameThreeballOpenData == null){
                return ;
    //            throw new ServiceException("createThreeData return false2");
            }
            GameThreeballKj firstGameThreeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(gameInfo.getGameId(),gameThreeballOpenData.getPeriods() + 1);

            GameThreeballKj newGameThreeballKj = new GameThreeballKj();
            newGameThreeballKj.setGameId(gameInfo.getGameId());
            newGameThreeballKj.setGameName(gameInfo.getGameName());
            newGameThreeballKj.setStatus("0");
            newGameThreeballKj.setCreateBy("createThreeData");

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(gameThreeballOpenData.getTime());

            if(gameThreeballKjList.size() == 0 && firstGameThreeballKj == null){
                newGameThreeballKj.setPeriods(gameThreeballOpenData.getPeriods() + 1);

                //预计开奖时间
                calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval());
                calendar.add(Calendar.SECOND, gameInfo.getLeadTime());
                newGameThreeballKj.setPreTime(calendar.getTime());

                //封盘投注截止时间
                calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
                newGameThreeballKj.setBetTime(calendar.getTime());
            }else if(gameThreeballKjList.size() == 1 && firstGameThreeballKj != null){
                GameThreeballKj secondGameThreeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(gameInfo.getGameId(), gameThreeballOpenData.getPeriods() + 2);
                if(secondGameThreeballKj != null){
                    return ;
    //                throw new ServiceException("createThreeData return false3 ID: " + (gameThreeballOpenData.getPeriods() + 2));
                }
                newGameThreeballKj.setPeriods(gameThreeballOpenData.getPeriods() + 2);

                //预计开奖时间
                calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval()*2);
                calendar.add(Calendar.SECOND, gameInfo.getLeadTime());
                newGameThreeballKj.setPreTime(calendar.getTime());

                //封盘投注截止时间
                calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
                newGameThreeballKj.setBetTime(calendar.getTime());
            }else{
                return ;
    //            throw new ServiceException("createThreeData return false4");
            }
            gameThreeballKjService.insertGameThreeballKj(newGameThreeballKj);
            createThreeData(gameInfo);
        }else{
            List<GameThreeballKj> gameThreeballKjList = gameThreeballKjService.selectGameThreeballKjListWithStatusZeroAndLimit(gameInfo.getGameId(),null,"0",null,"1",null);
            Integer kjSize = gameThreeballKjList.size();
            if(kjSize >= periodsSize){
                return;
            }
            Date beforeOpenDataTime = null;
            GameThreeballOpenData gameThreeballOpenData = gameThreeballOpenDataService.selectLastRecord(gameInfo.getGameId());
            if(gameThreeballOpenData == null){
                return ;
            }

            //没有预开奖数据
            boolean preTimeFlg = false;
            if(kjSize == 0 && StringUtils.equals(gameInfo.getSystemOpenType(),"Y")){
                if(StringUtils.equals(gameThreeballOpenData.getStatus(),"1")){
                    beforeOpenDataTime = gameThreeballOpenData.getPreTime();
                    preTimeFlg = true;
                }else{
                    GameThreeballOpenData nextGameThreeballOpenData = gameThreeballOpenDataService.selectLastOpenDataByMinPeriods(gameInfo.getGameId(),gameThreeballOpenData.getPeriods(),"");
                    if(nextGameThreeballOpenData != null
                        && (nextGameThreeballOpenData.getPeriods() - gameThreeballOpenData.getPeriods()) == 1
                        && StringUtils.equals(nextGameThreeballOpenData.getStatus(),"1")){
                        beforeOpenDataTime = nextGameThreeballOpenData.getPreTime();
                        preTimeFlg = true;
                    }else{
                        beforeOpenDataTime = gameThreeballOpenData.getTime();
                    }
                }
            }else{
                beforeOpenDataTime = gameThreeballOpenData.getTime();
            }
            SimpleDateFormat sd = new SimpleDateFormat("HHmmss");
            Integer startTime = 0;
            Integer endTime = 999999;
            if(StringUtils.isNotEmpty(gameInfo.getValidOpenStartTime())){
                startTime = Integer.parseInt(gameInfo.getValidOpenStartTime()+"00");
            }
            if(StringUtils.isNotEmpty(gameInfo.getValidOpenEndTime())){
                endTime = Integer.parseInt(gameInfo.getValidOpenEndTime()+"59");
            }
            Calendar currentTime = Calendar.getInstance();

            // 需要产生的虚拟开奖记录个数
            for(int i=1;i<=periodsSize;i++){
                Long newPeriods = gameThreeballOpenData.getPeriods() + i;

                GameThreeballKj gameThreeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(gameInfo.getGameId(),newPeriods);
                if(gameThreeballKj == null){

                    Calendar checkCalendar = Calendar.getInstance();
                    checkCalendar.setTime(beforeOpenDataTime);
                    //预计开奖时间
                    checkCalendar.add(Calendar.SECOND, gameInfo.getLotteryInterval()*i);
                    checkCalendar.add(Calendar.SECOND, gameInfo.getLeadTime()*-1);
                    String preTime = sd.format(checkCalendar.getTime());
                    if(startTime.compareTo(Integer.parseInt(preTime)) > 0 || endTime.compareTo(Integer.parseInt(preTime)) < 0){
                        break;
                    }

                    GameThreeballKj newGameThreeballKj = new GameThreeballKj();
                    newGameThreeballKj.setGameId(gameInfo.getGameId());
                    newGameThreeballKj.setGameName(gameInfo.getGameName());
                    newGameThreeballKj.setStatus("0");
                    newGameThreeballKj.setCreateBy("createFiveBallData");

                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(beforeOpenDataTime);

                    newGameThreeballKj.setPeriods(newPeriods);

                    //预计开奖时间
                    if(preTimeFlg){
                        calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval()*(i-1));
                    }else{
                        calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval()*i);
                        calendar.add(Calendar.SECOND, gameInfo.getLeadTime());
                    }
                    // 开奖表的预计时间比系统时间小，直接返回
                    if(currentTime.after(calendar.getTime())){
                        return;
                    }
                    newGameThreeballKj.setPreTime(calendar.getTime());

                    //封盘投注截止时间
                    calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
                    newGameThreeballKj.setBetTime(calendar.getTime());

                    gameThreeballKjService.insertGameThreeballKj(newGameThreeballKj);
                }
            }
        }
    }

    public void CreateThreeAll(SysGame gameInfo){
        List<GameThreeballOpenData> gameThreeballOpenDataList = gameThreeballOpenDataService.selectGameThreeballOpenDataListByParam(gameInfo.getGameId(),"1",5);
        for(GameThreeballOpenData gameThreeballOpenData :gameThreeballOpenDataList){
            GameThreeballKj newGameThreeballKj = new GameThreeballKj();

            newGameThreeballKj.setGameId(gameInfo.getGameId());
            newGameThreeballKj.setGameName(gameInfo.getGameName());
            newGameThreeballKj.setPeriods(gameThreeballOpenData.getPeriods());
            newGameThreeballKj.setNum1(gameThreeballOpenData.getSum1());
            newGameThreeballKj.setNum2(gameThreeballOpenData.getSum2());
            newGameThreeballKj.setNum3(gameThreeballOpenData.getSum3());
            newGameThreeballKj.setSumNum(gameThreeballOpenData.getSum1() + gameThreeballOpenData.getSum2() + gameThreeballOpenData.getSum3());

            newGameThreeballKj.setStatus("1");
            // 开奖时间
            newGameThreeballKj.setTheTime(gameThreeballOpenData.getTime());

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(gameThreeballOpenData.getTime());
            //预计开奖时间(比实际开奖时间少10s)
            calendar.add(Calendar.SECOND, -5);
            newGameThreeballKj.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newGameThreeballKj.setBetTime(calendar.getTime());

            gameThreeballKjService.insertGameThreeballKj(newGameThreeballKj);
        }

        createThreeData(gameInfo);
    }

    public void SingleThreeUpdate(SysGame gameInfo){

        List<GameThreeballKj> gameThreeballKjList = gameThreeballKjService.selectGameThreeballKjListWithStatusZeroAndLimit(gameInfo.getGameId(),null,"0","1",null,1);

        if(gameThreeballKjList == null || gameThreeballKjList.size() == 0){
            return;
        }
        GameThreeballKj gameThreeballKj = gameThreeballKjList.get(0);

        GameThreeballOpenData gameThreeballOpenData = gameThreeballOpenDataService.selectGameThreeballOpenDataByPeriods(gameInfo.getGameId(),gameThreeballKj.getPeriods(),"0");
        if(gameThreeballOpenData == null || !StringUtils.equals(gameThreeballOpenData.getStatus(),"0")){
            return;
        }

        gameThreeballKj = setGameThreeballKj(gameThreeballKj,gameThreeballOpenData);
//        gameThreeballKj.setNum1(gameThreeballOpenData.getSum1());
//        gameThreeballKj.setNum2(gameThreeballOpenData.getSum2());
//        gameThreeballKj.setNum3(gameThreeballOpenData.getSum3());
//        gameThreeballKj.setSumNum(gameThreeballOpenData.getSum1() + gameThreeballOpenData.getSum2() + gameThreeballOpenData.getSum3());
        gameThreeballKj.setStatus("1"); //开奖
        gameThreeballKj.setTheTime(gameThreeballOpenData.getTime());

        //系统开奖【计算当期中奖金额，可能重开】
        if(StringUtils.equals(gameInfo.getSystemOpenType(),"Y")){
            Float winMoney = 0f;
            Float betMoney = 0f;

            GameThreeballRecord searchGameThreeballRecord = new GameThreeballRecord();
            searchGameThreeballRecord.setGameId(gameInfo.getGameId());
            searchGameThreeballRecord.setStatus("0");
            searchGameThreeballRecord.setPeriods(gameThreeballKj.getPeriods());
            List<GameThreeballRecord> gameThreeballRecordList = gameThreeballRecordService.selectGameThreeballRecordList(searchGameThreeballRecord);

            if(gameThreeballRecordList == null || gameThreeballRecordList.size() == 0){
                gameThreeballRecordList = new ArrayList<>();
            }

            SysBetItem searchBetItem = new SysBetItem();
            searchBetItem.setGameId(gameInfo.getGameId());
            searchBetItem.setStatus("0");

            List<SysBetItem> gameBetItem = sysBetItemService.selectSysBetItemList(searchBetItem);

            Map<String , SysBetItem> betItemMap = gameBetItem.stream()
                    .collect(Collectors.toMap(
                            SysBetItem::getBetItemCode,
                            Function.identity(),
                            (existing, replacement) -> existing // 保留现有的值，忽略替换值
                    ));

            Wave wave = waveService.selectWaveByGameId(2l);
            Map<String, Object> waveMap = EntityMapTransUtils.entityToMap1(wave);

            List<Integer> bigSingleList = Arrays.asList(15, 17, 19, 21, 23, 25, 27);
            List<Integer> smallSingleList = Arrays.asList(1, 3, 5, 7, 9, 11, 13);
            List<Integer> bigDoubleList = Arrays.asList(14, 16, 18, 20, 22, 24, 26);
            List<Integer> smallDoubleList = Arrays.asList(0, 2, 4, 6, 8, 10, 12);

            Map<Long , GameThreeballRecord> threeballRecordMap = gameThreeballRecordList.stream()
                    .collect(Collectors.toMap(
                            GameThreeballRecord::getUserId,
                            Function.identity(),
                            (existing, replacement) -> existing // 保留现有的值，忽略替换值
                    ));

            GameThreeballMixedOdds searchGameThreeballMixedOdds = new GameThreeballMixedOdds();
            searchGameThreeballMixedOdds.setGameId(gameInfo.getGameId());
            GameThreeballMixedOdds gameThreeballMixedOdds = gameThreeballMixedOddsService.selectGameThreeballMixedOddsByGameId(searchGameThreeballMixedOdds);


            BetRecord searchBetRecord = new BetRecord();
            searchBetRecord.setGameId(gameInfo.getGameId());
            searchBetRecord.setPeriods(gameThreeballKj.getPeriods());
            searchBetRecord.setSettleFlg("0");
            searchBetRecord.setIsDelete("0");
            searchBetRecord.setIsRobot("0");
            List<BetRecord> betRecordList = betRecordService.selectBetRecordList(searchBetRecord);

            Integer dsbResult = getBaoShunDui(gameThreeballKj.getNum1(),gameThreeballKj.getNum2(),gameThreeballKj.getNum3());
            for(BetRecord betRecord : betRecordList) {
                //投注金额
                betMoney += betRecord.getMoney();

                Float countMoney = 0f;
                if(threeballRecordMap.containsKey(betRecord.getUserId())){
                    countMoney = threeballRecordMap.get(betRecord.getUserId()).getCountMoney();
                }else{
                    continue;
                }

                // 和值 数字
                if(("num"+gameThreeballKj.getSumNum()).equals(betRecord.getRecordLotteryKey())){

                    winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"num"+gameThreeballKj.getSumNum());
                }
                Map<String,String> lotterKeyMap = new HashMap<>();
                lotterKeyMap.put("big","big");
                lotterKeyMap.put("small","small");
                lotterKeyMap.put("single","single");
                lotterKeyMap.put("doubleAmount","doubleFlg");

                // 大,小,单,双
                if((gameThreeballKj.getSumNum() > 13 && "big".equals(betRecord.getRecordLotteryKey()))
                        || (gameThreeballKj.getSumNum() < 14 && "small".equals(betRecord.getRecordLotteryKey()))
                        || (gameThreeballKj.getSumNum()%2 == 1 && "single".equals(betRecord.getRecordLotteryKey()))
                        || (gameThreeballKj.getSumNum()%2 == 0 && "doubleAmount".equals(betRecord.getRecordLotteryKey()))){
//                if(lotterKeyMap.containsKey(betRecord.getRecordLotteryKey())){
//            "big".equals(betRecord.getRecordLotteryKey()))
//                || ("small".equals(betRecord.getRecordLotteryKey()))
//                || ("single".equals(betRecord.getRecordLotteryKey()))
//                || ("doubleAmount".equals(betRecord.getRecordLotteryKey()))


                    // 1314且设置了上限
                    if((gameThreeballKj.getSumNum() == 13 || gameThreeballKj.getSumNum() == 14) && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0){

                        // 大于上限
                        if(countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0) {
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterNumberOdd();
                            // 大于下限 小于上限
                        }else if(countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
                                && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterNumberOdd();
                            // 小于下限
                        }else {
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessNumberOdd();
                        }
                        // 豹顺对且设置了上限
                    }else if((dsbResult == 1 || dsbResult == 2 || dsbResult == 3) && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0){
                        // 大于上限
                        if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0) {
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterSdbOdd();
                            // 大于下限 小于上限
                        }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
                                && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterSdbOdd();
                            // 小于下限
                        }else{
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessSdbOdd();
                        }

                        // 包含09且设置了上限
                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9) && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0){

                        // 大于上限
                        if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 ){
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
                            // 大于下限 小于上限
                        }else if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
                            // 小于下限
                        }else{
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
                        }
                        // 常规赔率
                    }else{
                        if(gameThreeballKj.getSumNum() > 13
                                || gameThreeballKj.getSumNum() < 14
                                || gameThreeballKj.getSumNum()%2 == 1
                                || gameThreeballKj.getSumNum()%2 == 0 ){
                            winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,lotterKeyMap.get(betRecord.getRecordLotteryKey()));
                        }
                    }
                }
                Map<String,String> comboLotterKeyMap = new HashMap<>();
                comboLotterKeyMap.put("bigSingle","bigsingle");
                comboLotterKeyMap.put("bigDouble","bigdouble");
                comboLotterKeyMap.put("smallSingle","smallsingle");
                comboLotterKeyMap.put("smallDouble","smalldouble");

                if(bigSingleList.contains(gameThreeballKj.getSumNum()) && "bigSingle".equals(betRecord.getRecordLotteryKey())
                        || bigDoubleList.contains(gameThreeballKj.getSumNum()) && "bigDouble".equals(betRecord.getRecordLotteryKey())
                        || smallSingleList.contains(gameThreeballKj.getSumNum()) && "smallSingle".equals(betRecord.getRecordLotteryKey())
                        || smallDoubleList.contains(gameThreeballKj.getSumNum()) && "smallDouble".equals(betRecord.getRecordLotteryKey())){
//                if(comboLotterKeyMap.containsKey(betRecord.getRecordLotteryKey())){
//                    (gameThreeballKj.getSumNum() > 21 && "muchBig".equals(betRecord.getRecordLotteryKey())
//                || bigSingleList.contains(gameThreeballKj.getSumNum()) && "bigSingle".equals(betRecord.getRecordLotteryKey())
//                || bigDoubleList.contains(gameThreeballKj.getSumNum()) && "bigDouble".equals(betRecord.getRecordLotteryKey())
//                || smallSingleList.contains(gameThreeballKj.getSumNum()) && "smallSingle".equals(betRecord.getRecordLotteryKey())
//                || smallDoubleList.contains(gameThreeballKj.getSumNum()) && "smallDouble".equals(betRecord.getRecordLotteryKey())
//                || gameThreeballKj.getSumNum() < 6 && "muchSmall".equals(betRecord.getRecordLotteryKey()))){

                    // 1314且设置了上限
                    if((gameThreeballKj.getSumNum() == 13 || gameThreeballKj.getSumNum() == 14) && gameThreeballMixedOdds.getComboNumberMaxQuota().compareTo(0f) > 0){

                        // 大于上限
                        if(countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMaxQuota()) > 0) {
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getComboGreaterNumberOdd();
                            // 大于下限 小于上限
                        }else if(countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMaxQuota()) <= 0
                                && countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMinQuota()) > 0){
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getComboCenterNumberOdd();
                            // 小于下限
                        }else {
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getComboLessNumberOdd();
                        }
                        // 豹顺对且设置了上限
                    }else if((dsbResult == 1 || dsbResult == 2 || dsbResult == 3) && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0){
                        // 大于上限
                        if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0) {
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterSdbOdd();
                            // 大于下限 小于上限
                        }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
                                && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterSdbOdd();
                            // 小于下限
                        }else{
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessSdbOdd();
                        }

                        // 包含09且设置了上限
                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9) && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0){

                        // 大于上限
                        if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 ){
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
                            // 大于下限 小于上限
                        }else if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
                            // 小于下限
                        }else{
                            winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
                        }
                        // 常规赔率
                    }else{

//                        if(gameThreeballKj.getSumNum() > 21
//                                || bigSingleList.contains(gameThreeballKj.getSumNum())
//                                || bigDoubleList.contains(gameThreeballKj.getSumNum())
//                                || smallSingleList.contains(gameThreeballKj.getSumNum())
//                                || smallDoubleList.contains(gameThreeballKj.getSumNum())
//                                || gameThreeballKj.getSumNum() < 6){

                            winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,comboLotterKeyMap.get(betRecord.getRecordLotteryKey()));
//                        }
                    }
                }

//                // 大
//                if(gameThreeballKj.getSumNum() > 13 && "big".equals(betRecord.getRecordLotteryKey())){
//                    if(gameThreeballKj.getSumNum() == 14 && countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0 && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0) {
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getGreaterNumberOdd();
//                    }else if(gameThreeballKj.getSumNum() == 14
//                            && countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
//                            && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getCenterNumberOdd();
//                    }else if(gameThreeballKj.getSumNum() == 14
//                            && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) <= 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getLessNumberOdd();
//                    }else{
//                        if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                                || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                                || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                            winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                        }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                                || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                                || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                            winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                        }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                                || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                                || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                            winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                        }else{
//                            winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"big");
//                        }
//                    }
//                }
//
//                // 小
//                if(gameThreeballKj.getSumNum() < 14 && "small".equals(betRecord.getRecordLotteryKey())){
//                    if(gameThreeballKj.getSumNum() == 13 && countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0 && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0) {
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getGreaterNumberOdd();
//                    }else if(gameThreeballKj.getSumNum() == 13
//                            && countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
//                            && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getCenterNumberOdd();
//                    }else if(gameThreeballKj.getSumNum() == 13
//                            && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) <= 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getLessNumberOdd();
//                    }else{
//
//                        if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                                || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                                || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                            winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                        }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                                || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                                || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                            winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                        }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                                || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                                || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                            winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                        }else{
//                            winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"small");
//                        }
//                    }
//                }
//
//                // 单
//                if(gameThreeballKj.getSumNum()%2 == 1 && "single".equals(betRecord.getRecordLotteryKey())){
//                    if(gameThreeballKj.getSumNum() == 13 && countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0 && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0) {
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getGreaterNumberOdd();
//                    }else if(gameThreeballKj.getSumNum() == 13
//                            && countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
//                            && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getCenterNumberOdd();
//                    }else if(gameThreeballKj.getSumNum() == 13
//                            && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) <= 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getLessNumberOdd();
//                    }else {
//                        if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                                || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                                || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                            winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                        }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                                || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                                || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                            winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                        }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                                || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                                || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                            winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                        }else{
//                            winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap, "single");
//                        }
//                    }
//                }
//
//                // 双
//                if(gameThreeballKj.getSumNum()%2 == 0 && "doubleAmount".equals(betRecord.getRecordLotteryKey())){
//
//                    if(gameThreeballKj.getSumNum() == 14 && countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0  && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0) {
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getGreaterNumberOdd();
//                    }else if(gameThreeballKj.getSumNum() == 14
//                            && countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
//                            && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getCenterNumberOdd();
//                    }else if(gameThreeballKj.getSumNum() == 14
//                            && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) <= 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getLessNumberOdd();
//                    }else{
//
//                        if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                                || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                                || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                            winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                        }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                                || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                                || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                            winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                        }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                                || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                                || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                                && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                            winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                        }else{
//                            winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"doubleFlg");
//                        }
//                    }
//                }
//
//                // 大单
//                if(bigSingleList.contains(gameThreeballKj.getSumNum()) && "bigSingle".equals(betRecord.getRecordLotteryKey())){
//                    if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0  && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                    }else {
//                        winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap, "bigsingle");
//                    }
//                }
//                // 大双
//                if(bigDoubleList.contains(gameThreeballKj.getSumNum()) && "bigDouble".equals(betRecord.getRecordLotteryKey())){
//
//                    if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0  && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                    }else {
//                        winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap, "bigdouble");
//                    }
//                }
//                // 小单
//                if(smallSingleList.contains(gameThreeballKj.getSumNum()) && "smallSingle".equals(betRecord.getRecordLotteryKey())){
//
//                    if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                    }else {
//                        winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap, "smallsingle");
//                    }
//                }
//                // 小双
//                if(smallDoubleList.contains(gameThreeballKj.getSumNum()) && "smallDouble".equals(betRecord.getRecordLotteryKey())){
//                    if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                    }else {
//                        winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap, "smalldouble");
//                    }
//                }
//
                // 极大
                if(gameThreeballKj.getSumNum() > 21 && "muchBig".equals(betRecord.getRecordLotteryKey())){
                    winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"muchbig");
                }

                // 极小
                if(gameThreeballKj.getSumNum() < 6 && "muchSmall".equals(betRecord.getRecordLotteryKey())){
                    winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"muchsmall");
                }

                // 龙
                if(gameThreeballKj.getNum3() < gameThreeballKj.getNum1() && "loong".equals(betRecord.getRecordLotteryKey())){
                    winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"loong");
                }
                // 虎
                if(gameThreeballKj.getNum1() < gameThreeballKj.getNum3() && "tiger".equals(betRecord.getRecordLotteryKey())){
                    winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"tiger");
                }
                // 合
                if(gameThreeballKj.getNum1() == gameThreeballKj.getNum3() && "close".equals(betRecord.getRecordLotteryKey())){
                    winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"close");
                }

                // 豹
                if(dsbResult == 1 && "leopard".equals(betRecord.getRecordLotteryKey())){
//                    if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0 && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0) {
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getGreaterSdbOdd();
//                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
//                            && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getCenterSdbOdd();
//                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) <= 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getLessSdbOdd();
//                    }else{
                        winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"leopard");
//                    }
                }
                // 顺
                if(dsbResult == 2 && "shun".equals(betRecord.getRecordLotteryKey())){

//                    if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0 && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0) {
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getGreaterSdbOdd();
//                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
//                            && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getCenterSdbOdd();
//                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) <= 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getLessSdbOdd();
//                    }else{
                        winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"shun");
//                    }
                }
                // 对
                if(dsbResult == 3 && "pairs".equals(betRecord.getRecordLotteryKey())){
//                    if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0 && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0) {
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getGreaterSdbOdd();
//                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
//                            && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getCenterSdbOdd();
//                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) <= 0){
//                        winMoney += betRecord.getMoney() * gameThreeballMixedOdds.getLessSdbOdd();
//                    }else{
                        winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"pairs");
//                    }
                }

                // 红绿蓝
                if(waveMap != null){
                    Object waveNumObject = waveMap.get("num" + gameThreeballKj.getSumNum());
                    Integer numWave = waveNumObject!=null?(Integer) waveNumObject:0;

                    // 绿
                    if(numWave == 1 && "green".equals(betRecord.getRecordLotteryKey())){
                        winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"green");
                    }
                    // 红
                    if(numWave == 2 && "red".equals(betRecord.getRecordLotteryKey())){
                        winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"red");
                    }
                    // 蓝
                    if(numWave == 3 && "blue".equals(betRecord.getRecordLotteryKey())){
                        winMoney += betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"blue");
                    }
                }
            }

            if(betMoney.compareTo(0f) > 0){
                Float winRate = (betMoney - winMoney)/betMoney*100;
                String systemGameWinRate = configService.selectConfigByKey("sys.game.winRate");
                // 默认一定重开一次
                Float gameWinRate = 0f;
                if(StringUtils.isNotEmpty(systemGameWinRate)){
                    gameWinRate = Float.valueOf(systemGameWinRate);
                }
                if(winRate.compareTo(0f) <= 0 || winRate.compareTo(gameWinRate) <= 0){
                    //重开奖
                    List<String> openCode = sysAppService.getOpenData(gameInfo.getGameType());
                    gameThreeballOpenData.setSum1(Integer.parseInt(openCode.get(0)));
                    gameThreeballOpenData.setSum2(Integer.parseInt(openCode.get(1)));
                    gameThreeballOpenData.setSum3(Integer.parseInt(openCode.get(2)));
                    gameThreeballOpenData.setPreSum1(Integer.parseInt(openCode.get(0)));
                    gameThreeballOpenData.setPreSum2(Integer.parseInt(openCode.get(1)));
                    gameThreeballOpenData.setPreSum3(Integer.parseInt(openCode.get(2)));
                    gameThreeballOpenData.setUpdateBy("PREOPEN");
                    gameThreeballOpenDataService.updateGameThreeballOpenData(gameThreeballOpenData);

                    gameThreeballKj = setGameThreeballKj(gameThreeballKj,gameThreeballOpenData);
                }
            }
        }

        int updateInt = gameThreeballKjService.updateGameThreeballKj(gameThreeballKj);
        if(updateInt > 0){
            lotteryGameThreeballOpenData(gameInfo, gameThreeballKj.getPeriods());
            createThreeData(gameInfo);

            // 补漏
            List<GameThreeballKj> notOpenGameThreeballKjList = gameThreeballKjService.selectGameThreeballKjListWithStatusZeroAndLimit(gameInfo.getGameId(),gameThreeballKj.getPeriods(),"0",null,"1",1);
            if(notOpenGameThreeballKjList != null && notOpenGameThreeballKjList.size() >0){
                lotteryGameThreeballOpenData(gameInfo, notOpenGameThreeballKjList.get(0).getPeriods());
            }
        }
    }

    public GameThreeballKj setGameThreeballKj(GameThreeballKj gameThreeballKj, GameThreeballOpenData gameThreeballOpenData){
        gameThreeballKj.setNum1(gameThreeballOpenData.getSum1());
        gameThreeballKj.setNum2(gameThreeballOpenData.getSum2());
        gameThreeballKj.setNum3(gameThreeballOpenData.getSum3());
        gameThreeballKj.setSumNum(gameThreeballOpenData.getSum1() + gameThreeballOpenData.getSum2() + gameThreeballOpenData.getSum3());

        return gameThreeballKj;
    }


    @Override
    public void lotteryGameThreeballOpenData(SysGame gameInfo, Long periodId){
        GameThreeballRecord searchGameThreeballRecord = new GameThreeballRecord();
        searchGameThreeballRecord.setGameId(gameInfo.getGameId());
        searchGameThreeballRecord.setStatus("0");
        searchGameThreeballRecord.setPeriods(periodId);
        List<GameThreeballRecord> gameThreeballRecordList = gameThreeballRecordService.selectGameThreeballRecordList(searchGameThreeballRecord);

        if(gameThreeballRecordList == null || gameThreeballRecordList.size() == 0){
            return;
        }

        GameThreeballKj gameThreeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(gameInfo.getGameId(), periodId);
        Float adminWinMoney = 0f;
        String gameResult = gameThreeballKj.getNum1() + "+" +
                gameThreeballKj.getNum2() + "+" +
                gameThreeballKj.getNum3() + "=" +
                gameThreeballKj.getSumNum();

        SysBetItem searchBetItem = new SysBetItem();
        searchBetItem.setGameId(gameInfo.getGameId());
        searchBetItem.setStatus("0");

        List<SysBetItem> gameBetItem = sysBetItemService.selectSysBetItemList(searchBetItem);

        Map<String , SysBetItem> betItemMap = gameBetItem.stream()
                .collect(Collectors.toMap(
                        SysBetItem::getBetItemCode,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        Map<String, Object> gameThreeballKjMap = EntityMapTransUtils.entityToMap1(gameThreeballKj);

        Wave wave = waveService.selectWaveByGameId(2l);
        Map<String, Object> waveMap = EntityMapTransUtils.entityToMap1(wave);

        List<Integer> bigSingleList = Arrays.asList(15, 17, 19, 21, 23, 25, 27);
        List<Integer> smallSingleList = Arrays.asList(1, 3, 5, 7, 9, 11, 13);
        List<Integer> bigDoubleList = Arrays.asList(14, 16, 18, 20, 22, 24, 26);
        List<Integer> smallDoubleList = Arrays.asList(0, 2, 4, 6, 8, 10, 12);

        GameThreeballMixedOdds searchGameThreeballMixedOdds = new GameThreeballMixedOdds();
        searchGameThreeballMixedOdds.setGameId(gameInfo.getGameId());
        GameThreeballMixedOdds gameThreeballMixedOdds = gameThreeballMixedOddsService.selectGameThreeballMixedOddsByGameId(searchGameThreeballMixedOdds);

        Map<Long , GameThreeballRecord> threeballRecordMap = gameThreeballRecordList.stream()
                .collect(Collectors.toMap(
                        GameThreeballRecord::getUserId,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        BetRecord searchBetRecord = new BetRecord();
        searchBetRecord.setGameId(gameInfo.getGameId());
        searchBetRecord.setPeriods(periodId);
        searchBetRecord.setSettleFlg("0");
        searchBetRecord.setIsDelete("0");
        searchBetRecord.setIsRobot("0");
        List<BetRecord> betRecordList = betRecordService.selectBetRecordList(searchBetRecord);

        Integer dsbResult = getBaoShunDui(gameThreeballKj.getNum1(),gameThreeballKj.getNum2(),gameThreeballKj.getNum3());
        Map<Long,Float> userBetMoneyMap = new HashMap<>();

        for(BetRecord betRecord : betRecordList) {
            Float winMoney = 0f;
            Float countMoney = 0f;
            if(threeballRecordMap.containsKey(betRecord.getUserId())){
                countMoney = threeballRecordMap.get(betRecord.getUserId()).getCountMoney();
            }else{
                continue;
            }
            Float userBetMoney = 0F;
            if(userBetMoneyMap.containsKey(betRecord.getUserId())){
                userBetMoney = userBetMoneyMap.get(betRecord.getUserId());
            }
            userBetMoney += betRecord.getMoney();
            userBetMoneyMap.put(betRecord.getUserId(),userBetMoney);

            // 和值 数字
            if(("num"+gameThreeballKj.getSumNum()).equals(betRecord.getRecordLotteryKey())){

                winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"num"+gameThreeballKj.getSumNum());
            }

            Map<String,String> lotterKeyMap = new HashMap<>();
            lotterKeyMap.put("big","big");
            lotterKeyMap.put("small","small");
            lotterKeyMap.put("single","single");
            lotterKeyMap.put("doubleAmount","doubleFlg");

            // 大,小,单,双
            if((gameThreeballKj.getSumNum() > 13 && "big".equals(betRecord.getRecordLotteryKey()))
                    || (gameThreeballKj.getSumNum() < 14 && "small".equals(betRecord.getRecordLotteryKey()))
                    || (gameThreeballKj.getSumNum()%2 == 1 && "single".equals(betRecord.getRecordLotteryKey()))
                    || (gameThreeballKj.getSumNum()%2 == 0 && "doubleAmount".equals(betRecord.getRecordLotteryKey()))){
//                && (gameThreeballKj.getSumNum() > 13
//                        || gameThreeballKj.getSumNum() < 14
//                        || gameThreeballKj.getSumNum()%2 == 1
//                        || gameThreeballKj.getSumNum()%2 == 0)){
//            "big".equals(betRecord.getRecordLotteryKey()))
//                || ("small".equals(betRecord.getRecordLotteryKey()))
//                || ("single".equals(betRecord.getRecordLotteryKey()))
//                || ("doubleAmount".equals(betRecord.getRecordLotteryKey()))


                // 1314且设置了上限
                if((gameThreeballKj.getSumNum() == 13 || gameThreeballKj.getSumNum() == 14) && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0) {
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterNumberOdd();
                    // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterNumberOdd();
                    // 小于下限
                    }else {
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessNumberOdd();
                    }
                // 豹顺对且设置了上限
                }else if((dsbResult == 1 || dsbResult == 2 || dsbResult == 3) && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0){
                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0) {
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterSdbOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterSdbOdd();
                        // 小于下限
                    }else{
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessSdbOdd();
                    }

                // 包含09且设置了上限
                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9) && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 ){
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
                        // 小于下限
                    }else{
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
                    }
                // 常规赔率
                }else{
//                    if(gameThreeballKj.getSumNum() > 13
//                            || gameThreeballKj.getSumNum() < 14
//                            || gameThreeballKj.getSumNum()%2 == 1
//                            || gameThreeballKj.getSumNum()%2 == 0 ){
                        winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,lotterKeyMap.get(betRecord.getRecordLotteryKey()));
//                    }
                }
            }
//                if((gameThreeballKj.getSumNum() == 13 || gameThreeballKj.getSumNum() == 14)
//                        && countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0 && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0) {
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterNumberOdd();
//                }else if((gameThreeballKj.getSumNum() == 13 || gameThreeballKj.getSumNum() == 14)
//                        && countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
//                        && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterNumberOdd();
//                }else if((gameThreeballKj.getSumNum() == 13 || gameThreeballKj.getSumNum() == 14)
//                        && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) <= 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessNumberOdd();
//                }else{
//                    if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                    }else{
//                        winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"big");
//                    }
//                }
//
            // 小
//            if(gameThreeballKj.getSumNum() < 14 && "small".equals(betRecord.getRecordLotteryKey())){
//                if(gameThreeballKj.getSumNum() == 13 && countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0 && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0) {
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterNumberOdd();
//                }else if(gameThreeballKj.getSumNum() == 13
//                        && countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
//                        && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterNumberOdd();
//                }else if(gameThreeballKj.getSumNum() == 13
//                        && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) <= 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessNumberOdd();
//                }else{
//
//                    if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                    }else{
//                        winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"small");
//                    }
//                }
//            }
//
//            // 单
//            if(gameThreeballKj.getSumNum()%2 == 1 && "single".equals(betRecord.getRecordLotteryKey())){
//                if(gameThreeballKj.getSumNum() == 13 && countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0 && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0) {
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterNumberOdd();
//                }else if(gameThreeballKj.getSumNum() == 13
//                        && countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
//                        && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterNumberOdd();
//                }else if(gameThreeballKj.getSumNum() == 13
//                        && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) <= 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessNumberOdd();
//                }else {
//                    if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                    }else{
//                        winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap, "single");
//                    }
//                }
//            }
            // 双
//            if(gameThreeballKj.getSumNum()%2 == 0 && "doubleAmount".equals(betRecord.getRecordLotteryKey())){
//
//                if(gameThreeballKj.getSumNum() == 14 && countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0  && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0) {
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterNumberOdd();
//                }else if(gameThreeballKj.getSumNum() == 14
//                        && countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
//                        && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterNumberOdd();
//                }else if(gameThreeballKj.getSumNum() == 14
//                        && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) <= 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessNumberOdd();
//                }else{
//
//                    if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                    }else{
//                        winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"doubleFlg");
//                    }
//                }
//            }

            // 组合
            Map<String,String> comboLotterKeyMap = new HashMap<>();
            comboLotterKeyMap.put("bigSingle","bigsingle");
            comboLotterKeyMap.put("bigDouble","bigdouble");
            comboLotterKeyMap.put("smallSingle","smallsingle");
            comboLotterKeyMap.put("smallDouble","smalldouble");

//            if(comboLotterKeyMap.containsKey(betRecord.getRecordLotteryKey())){
            if(bigSingleList.contains(gameThreeballKj.getSumNum()) && "bigSingle".equals(betRecord.getRecordLotteryKey())
                || bigDoubleList.contains(gameThreeballKj.getSumNum()) && "bigDouble".equals(betRecord.getRecordLotteryKey())
                || smallSingleList.contains(gameThreeballKj.getSumNum()) && "smallSingle".equals(betRecord.getRecordLotteryKey())
                || smallDoubleList.contains(gameThreeballKj.getSumNum()) && "smallDouble".equals(betRecord.getRecordLotteryKey())){

                // 1314且设置了上限
                if((gameThreeballKj.getSumNum() == 13 || gameThreeballKj.getSumNum() == 14) && gameThreeballMixedOdds.getComboNumberMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMaxQuota()) > 0) {
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getComboGreaterNumberOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMinQuota()) > 0){
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getComboCenterNumberOdd();
                        // 小于下限
                    }else {
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getComboLessNumberOdd();
                    }
                    // 豹顺对且设置了上限
                }else if((dsbResult == 1 || dsbResult == 2 || dsbResult == 3) && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0){
                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0) {
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterSdbOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterSdbOdd();
                        // 小于下限
                    }else{
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessSdbOdd();
                    }

                    // 包含09且设置了上限
                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9) && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 ){
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
                        // 小于下限
                    }else{
                        winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
                    }
                    // 常规赔率
                }else{

//                    if(gameThreeballKj.getSumNum() > 21
//                            || bigSingleList.contains(gameThreeballKj.getSumNum())
//                            || bigDoubleList.contains(gameThreeballKj.getSumNum())
//                            || smallSingleList.contains(gameThreeballKj.getSumNum())
//                            || smallDoubleList.contains(gameThreeballKj.getSumNum())
//                            || gameThreeballKj.getSumNum() < 6){
                        winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,comboLotterKeyMap.get(betRecord.getRecordLotteryKey()));
//                    }
                }
            }
//
//            // 大单
//            if(bigSingleList.contains(gameThreeballKj.getSumNum()) && "bigSingle".equals(betRecord.getRecordLotteryKey())){
//                if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0  && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                        && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                }else {
//                    winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap, "bigsingle");
//                }
//            }
//            // 大双
//            if(bigDoubleList.contains(gameThreeballKj.getSumNum()) && "bigDouble".equals(betRecord.getRecordLotteryKey())){
//
//                if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0  && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                        && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                }else {
//                    winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap, "bigdouble");
//                }
//            }
//            // 小单
//            if(smallSingleList.contains(gameThreeballKj.getSumNum()) && "smallSingle".equals(betRecord.getRecordLotteryKey())){
//
//                if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                        && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                }else {
//                    winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap, "smallsingle");
//                }
//            }
//            // 小双
//            if(smallDoubleList.contains(gameThreeballKj.getSumNum()) && "smallDouble".equals(betRecord.getRecordLotteryKey())){
//                if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                        && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                }else {
//                    winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap, "smalldouble");
//                }
//            }

            // 极大
            if(gameThreeballKj.getSumNum() > 21 && "muchBig".equals(betRecord.getRecordLotteryKey())){
                winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"muchbig");
            }
            // 极小
            if(gameThreeballKj.getSumNum() < 6 && "muchSmall".equals(betRecord.getRecordLotteryKey())){
                winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"muchsmall");
            }
            // 龙
            if(gameThreeballKj.getNum3() < gameThreeballKj.getNum1() && "loong".equals(betRecord.getRecordLotteryKey())){
                winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"loong");
            }
            // 虎
            if(gameThreeballKj.getNum1() < gameThreeballKj.getNum3() && "tiger".equals(betRecord.getRecordLotteryKey())){
                winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"tiger");
            }
            // 合
            if(gameThreeballKj.getNum1() == gameThreeballKj.getNum3() && "close".equals(betRecord.getRecordLotteryKey())){
                winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"close");
            }

            // 豹
            if(dsbResult == 1 && "leopard".equals(betRecord.getRecordLotteryKey())){
//                if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0 && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0) {
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterSdbOdd();
//                }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
//                        && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterSdbOdd();
//                }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) <= 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessSdbOdd();
//                }else{
                    winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"leopard");
//                }
            }
            // 顺
            if(dsbResult == 2 && "shun".equals(betRecord.getRecordLotteryKey())){

//                if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0 && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0) {
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterSdbOdd();
//                }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
//                        && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterSdbOdd();
//                }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) <= 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessSdbOdd();
//                }else{
                    winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"shun");
//                }
            }
            // 对
            if(dsbResult == 3 && "pairs".equals(betRecord.getRecordLotteryKey())){
//                if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0 && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0) {
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getGreaterSdbOdd();
//                }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
//                        && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getCenterSdbOdd();
//                }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) <= 0){
//                    winMoney = betRecord.getMoney() * gameThreeballMixedOdds.getLessSdbOdd();
//                }else{
                    winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"pairs");
//                }
            }

            // 红绿蓝
            if(waveMap != null){
                Object waveNumObject = waveMap.get("num" + gameThreeballKj.getSumNum());
                Integer numWave = waveNumObject!=null?(Integer) waveNumObject:0;

                // 绿
                if(numWave == 1 && "green".equals(betRecord.getRecordLotteryKey())){
                    winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"green");
                }
                // 红
                if(numWave == 2 && "red".equals(betRecord.getRecordLotteryKey())){
                    winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"red");
                }
                // 蓝
                if(numWave == 3 && "blue".equals(betRecord.getRecordLotteryKey())){
                    winMoney = betRecord.getMoney() * getOddFromMapByOddKey(betItemMap,"blue");
                }
            }

            betRecord.setGameResult(gameResult);
            betRecord.setSettleFlg("1");
            betRecord.setAccountResult(winMoney);
            betRecordService.updateBetRecord(betRecord);
        }

        for(GameThreeballRecord gameThreeballRecord : gameThreeballRecordList){
            Float money = 0f;
            Float bigSamllMoney = 0f;
            Float otherMoney = 0f;
            Float combinationMoney = 0f;
            Float countMoney = gameThreeballRecord.getCountMoney();

            Map<String, Object> gameThreeballRecordMap = EntityMapTransUtils.entityToMap1(gameThreeballRecord);

            // 和值 数字
            for(int i=0; i<=27; i++){
                Object amountObject = gameThreeballRecordMap.get("num" + i);
                Float amount = amountObject!=null?(Float) amountObject:0f;
                if(amount > 0){
                    otherMoney += amount;
                }
                if(gameThreeballKj.getSumNum() == i && amount>0){
                    money += amount * getOddFromMapByOddKey(betItemMap,"num"+i);
                }
            }

            // 大
            if(gameThreeballKj.getSumNum() > 13 && gameThreeballRecord.getBig() > 0){
                bigSamllMoney += gameThreeballRecord.getBig();

                if((gameThreeballKj.getSumNum() == 13 || gameThreeballKj.getSumNum() == 14) && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0){
                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0) {
                        money += gameThreeballRecord.getBig() * gameThreeballMixedOdds.getGreaterNumberOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
                        money += gameThreeballRecord.getBig() * gameThreeballMixedOdds.getCenterNumberOdd();
                        // 小于下限
                    }else {
                        money += gameThreeballRecord.getBig() * gameThreeballMixedOdds.getLessNumberOdd();
                    }
                    // 豹顺对且设置了上限
                }else if((dsbResult == 1 || dsbResult == 2 || dsbResult == 3) && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0){
                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0) {
                        money += gameThreeballRecord.getBig() * gameThreeballMixedOdds.getGreaterSdbOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
                        money += gameThreeballRecord.getBig() * gameThreeballMixedOdds.getCenterSdbOdd();
                        // 小于下限
                    }else{
                        money += gameThreeballRecord.getBig() * gameThreeballMixedOdds.getLessSdbOdd();
                    }

                    // 包含09且设置了上限
                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9) && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 ){
                        money += gameThreeballRecord.getBig() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
                        money += gameThreeballRecord.getBig() * gameThreeballMixedOdds.getCenterZeroNineOdd();
                        // 小于下限
                    }else{
                        money += gameThreeballRecord.getBig() * gameThreeballMixedOdds.getLessZeroNineOdd();
                    }
                    // 常规赔率
                }else{
//                    if(gameThreeballKj.getSumNum() > 13){
                        money += gameThreeballRecord.getBig() * getOddFromMapByOddKey(betItemMap,"big");
//                    }
                }
            }
//            if(gameThreeballKj.getSumNum() > 13 && gameThreeballRecord.getBig() > 0){
//                bigSamllMoney += gameThreeballRecord.getBig();
//
//                if(gameThreeballKj.getSumNum() == 14 && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0 && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0) {
//                    money += gameThreeballRecord.getBig() * gameThreeballMixedOdds.getGreaterNumberOdd();
//                }else if(gameThreeballKj.getSumNum() == 14
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
//                    money += gameThreeballRecord.getBig() * gameThreeballMixedOdds.getCenterNumberOdd();
//                }else if(gameThreeballKj.getSumNum() == 14
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getNumberMinQuota()) <= 0){
//                    money += gameThreeballRecord.getBig() * gameThreeballMixedOdds.getLessNumberOdd();
//                }else{
//                    if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                        money += gameThreeballRecord.getBig() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                            && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                        money += gameThreeballRecord.getBig() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                        money += gameThreeballRecord.getBig() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                    }else{
//                        money += gameThreeballRecord.getBig() * getOddFromMapByOddKey(betItemMap,"big");
//                    }
//                }
//            }

            // 小
            if(gameThreeballKj.getSumNum() < 14 && gameThreeballRecord.getSmall() > 0){
                bigSamllMoney += gameThreeballRecord.getSmall();

                // 1314且设置了上限
                if((gameThreeballKj.getSumNum() == 13 || gameThreeballKj.getSumNum() == 14) && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0) {
                        money += gameThreeballRecord.getSmall() * gameThreeballMixedOdds.getGreaterNumberOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
                        money += gameThreeballRecord.getSmall() * gameThreeballMixedOdds.getCenterNumberOdd();
                        // 小于下限
                    }else {
                        money += gameThreeballRecord.getSmall() * gameThreeballMixedOdds.getLessNumberOdd();
                    }
                    // 豹顺对且设置了上限
                }else if((dsbResult == 1 || dsbResult == 2 || dsbResult == 3) && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0){
                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0) {
                        money += gameThreeballRecord.getSmall() * gameThreeballMixedOdds.getGreaterSdbOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
                        money += gameThreeballRecord.getSmall() * gameThreeballMixedOdds.getCenterSdbOdd();
                        // 小于下限
                    }else{
                        money += gameThreeballRecord.getSmall() * gameThreeballMixedOdds.getLessSdbOdd();
                    }

                    // 包含09且设置了上限
                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9) && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 ){
                        money += gameThreeballRecord.getSmall() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
                        money += gameThreeballRecord.getSmall() * gameThreeballMixedOdds.getCenterZeroNineOdd();
                        // 小于下限
                    }else{
                        money += gameThreeballRecord.getSmall() * gameThreeballMixedOdds.getLessZeroNineOdd();
                    }
                    // 常规赔率
                }else{
//                    if(gameThreeballKj.getSumNum() < 14){
                        money += gameThreeballRecord.getSmall() * getOddFromMapByOddKey(betItemMap,"small");
//                    }
                }
            }
//            if(gameThreeballKj.getSumNum() < 14 && gameThreeballRecord.getSmall() > 0){
//                bigSamllMoney += gameThreeballRecord.getSmall();
//
//                if(gameThreeballKj.getSumNum() == 13 && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0 && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0) {
//                    money += gameThreeballRecord.getSmall() * gameThreeballMixedOdds.getGreaterNumberOdd();
//                }else if(gameThreeballKj.getSumNum() == 13
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
//                    money += gameThreeballRecord.getSmall() * gameThreeballMixedOdds.getCenterNumberOdd();
//                }else if(gameThreeballKj.getSumNum() == 13
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getNumberMinQuota()) <= 0){
//                    money += gameThreeballRecord.getSmall() * gameThreeballMixedOdds.getLessNumberOdd();
//                }else{
//
//                    if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                        money += gameThreeballRecord.getSmall() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                            && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                        money += gameThreeballRecord.getSmall() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                        money += gameThreeballRecord.getSmall() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                    }else{
//                        money += gameThreeballRecord.getSmall() * getOddFromMapByOddKey(betItemMap,"small");
//                    }
//                }
//            }
            // 单
            if(gameThreeballKj.getSumNum()%2 == 1 && gameThreeballRecord.getSingle() > 0){
                bigSamllMoney += gameThreeballRecord.getSingle();

                // 1314且设置了上限
                if((gameThreeballKj.getSumNum() == 13 || gameThreeballKj.getSumNum() == 14) && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0) {
                        money += gameThreeballRecord.getSingle() * gameThreeballMixedOdds.getGreaterNumberOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
                        money += gameThreeballRecord.getSingle() * gameThreeballMixedOdds.getCenterNumberOdd();
                        // 小于下限
                    }else {
                        money += gameThreeballRecord.getSingle() * gameThreeballMixedOdds.getLessNumberOdd();
                    }
                    // 豹顺对且设置了上限
                }else if((dsbResult == 1 || dsbResult == 2 || dsbResult == 3) && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0){
                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0) {
                        money += gameThreeballRecord.getSingle() * gameThreeballMixedOdds.getGreaterSdbOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
                        money += gameThreeballRecord.getSingle() * gameThreeballMixedOdds.getCenterSdbOdd();
                        // 小于下限
                    }else{
                        money += gameThreeballRecord.getSingle() * gameThreeballMixedOdds.getLessSdbOdd();
                    }

                    // 包含09且设置了上限
                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9) && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 ){
                        money += gameThreeballRecord.getSingle() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
                        money += gameThreeballRecord.getSingle() * gameThreeballMixedOdds.getCenterZeroNineOdd();
                        // 小于下限
                    }else{
                        money += gameThreeballRecord.getSingle() * gameThreeballMixedOdds.getLessZeroNineOdd();
                    }
                    // 常规赔率
                }else{
//                    if(gameThreeballKj.getSumNum()%2 == 1){
                        money += gameThreeballRecord.getSingle() * getOddFromMapByOddKey(betItemMap, "single");
//                    }
                }
            }
//            if(gameThreeballKj.getSumNum()%2 == 1 && gameThreeballRecord.getSingle() > 0){
//                bigSamllMoney += gameThreeballRecord.getSingle();
//                if(gameThreeballKj.getSumNum() == 13 && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0 && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0) {
//                    money += gameThreeballRecord.getSingle() * gameThreeballMixedOdds.getGreaterNumberOdd();
//                }else if(gameThreeballKj.getSumNum() == 13
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
//                    money += gameThreeballRecord.getSingle() * gameThreeballMixedOdds.getCenterNumberOdd();
//                }else if(gameThreeballKj.getSumNum() == 13
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getNumberMinQuota()) <= 0){
//                    money += gameThreeballRecord.getSingle() * gameThreeballMixedOdds.getLessNumberOdd();
//                }else {
//                    if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                        money += gameThreeballRecord.getSingle() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                            && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                        money += gameThreeballRecord.getSingle() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                        money += gameThreeballRecord.getSingle() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                    }else {
//                        money += gameThreeballRecord.getSingle() * getOddFromMapByOddKey(betItemMap, "single");
//                    }
//                }
//            }
            // 双
            if(gameThreeballKj.getSumNum()%2 == 0 && gameThreeballRecord.getDoubleAmount() > 0){
                bigSamllMoney += gameThreeballRecord.getDoubleAmount();
                // 1314且设置了上限
                if((gameThreeballKj.getSumNum() == 13 || gameThreeballKj.getSumNum() == 14) && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0){
                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0) {
                        money += gameThreeballRecord.getDoubleAmount() * gameThreeballMixedOdds.getGreaterNumberOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
                        money += gameThreeballRecord.getDoubleAmount() * gameThreeballMixedOdds.getCenterNumberOdd();
                        // 小于下限
                    }else {
                        money += gameThreeballRecord.getDoubleAmount() * gameThreeballMixedOdds.getLessNumberOdd();
                    }
                    // 豹顺对且设置了上限
                }else if((dsbResult == 1 || dsbResult == 2 || dsbResult == 3) && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0){
                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0) {
                        money += gameThreeballRecord.getDoubleAmount() * gameThreeballMixedOdds.getGreaterSdbOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
                        money += gameThreeballRecord.getDoubleAmount() * gameThreeballMixedOdds.getCenterSdbOdd();
                        // 小于下限
                    }else{
                        money += gameThreeballRecord.getDoubleAmount() * gameThreeballMixedOdds.getLessSdbOdd();
                    }

                    // 包含09且设置了上限
                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9) && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 ){
                        money += gameThreeballRecord.getDoubleAmount() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
                        money += gameThreeballRecord.getDoubleAmount() * gameThreeballMixedOdds.getCenterZeroNineOdd();
                        // 小于下限
                    }else{
                        money += gameThreeballRecord.getDoubleAmount() * gameThreeballMixedOdds.getLessZeroNineOdd();
                    }
                    // 常规赔率
                }else{
//                    if(gameThreeballKj.getSumNum()%2 == 0 ){
                        money += gameThreeballRecord.getDoubleAmount() * getOddFromMapByOddKey(betItemMap, "doubleFlg");
//                    }
                }
            }
//            if(gameThreeballKj.getSumNum()%2 == 0 && gameThreeballRecord.getDoubleAmount() > 0){
//                bigSamllMoney += gameThreeballRecord.getDoubleAmount();
//
//                if(gameThreeballKj.getSumNum() == 14 && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) > 0 && gameThreeballMixedOdds.getNumberMaxQuota().compareTo(0f) > 0) {
//                    money += gameThreeballRecord.getDoubleAmount() * gameThreeballMixedOdds.getGreaterNumberOdd();
//                }else if(gameThreeballKj.getSumNum() == 14
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getNumberMaxQuota()) <= 0
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getNumberMinQuota()) > 0){
//                    money += gameThreeballRecord.getDoubleAmount() * gameThreeballMixedOdds.getCenterNumberOdd();
//                }else if(gameThreeballKj.getSumNum() == 14
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getNumberMinQuota()) <= 0){
//                    money += gameThreeballRecord.getDoubleAmount() * gameThreeballMixedOdds.getLessNumberOdd();
//                }else{
//                    if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                        money += gameThreeballRecord.getDoubleAmount() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                            && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                        money += gameThreeballRecord.getDoubleAmount() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                    }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                            || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                            || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                            && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                        money += gameThreeballRecord.getDoubleAmount() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                    }else {
//                        money += gameThreeballRecord.getDoubleAmount() * getOddFromMapByOddKey(betItemMap, "doubleFlg");
//                    }
//                }
//            }

            // 极大
            if(gameThreeballKj.getSumNum() > 21 && gameThreeballRecord.getMuchBig() > 0){
                money += gameThreeballRecord.getMuchBig() * getOddFromMapByOddKey(betItemMap,"muchbig");
            }

            // 大单
            if(bigSingleList.contains(gameThreeballKj.getSumNum()) && gameThreeballRecord.getBigSingle() > 0){
                combinationMoney += gameThreeballRecord.getBigSingle();

                if((gameThreeballKj.getSumNum() == 13 || gameThreeballKj.getSumNum() == 14) && gameThreeballMixedOdds.getComboNumberMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMaxQuota()) > 0) {
                        money += gameThreeballRecord.getBigSingle() * gameThreeballMixedOdds.getComboGreaterNumberOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMinQuota()) > 0){
                        money += gameThreeballRecord.getBigSingle() * gameThreeballMixedOdds.getComboCenterNumberOdd();
                        // 小于下限
                    }else {
                        money += gameThreeballRecord.getBigSingle() * gameThreeballMixedOdds.getComboLessNumberOdd();
                    }
                    // 豹顺对且设置了上限
                }else if((dsbResult == 1 || dsbResult == 2 || dsbResult == 3) && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0){
                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0) {
                        money += gameThreeballRecord.getBigSingle() * gameThreeballMixedOdds.getGreaterSdbOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
                        money += gameThreeballRecord.getBigSingle() * gameThreeballMixedOdds.getCenterSdbOdd();
                        // 小于下限
                    }else{
                        money += gameThreeballRecord.getBigSingle() * gameThreeballMixedOdds.getLessSdbOdd();
                    }

                    // 包含09且设置了上限
                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9) && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 ){
                        money += gameThreeballRecord.getBigSingle() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
                        money += gameThreeballRecord.getBigSingle() * gameThreeballMixedOdds.getCenterZeroNineOdd();
                        // 小于下限
                    }else{
                        money += gameThreeballRecord.getBigSingle() * gameThreeballMixedOdds.getLessZeroNineOdd();
                    }
                    // 常规赔率
                }else{
//                    if(bigSingleList.contains(gameThreeballKj.getSumNum())){
                        money += gameThreeballRecord.getBigSingle() * getOddFromMapByOddKey(betItemMap, "bigsingle");
//                    }
                }
            }
//            if(bigSingleList.contains(gameThreeballKj.getSumNum()) && gameThreeballRecord.getBigSingle() > 0){
//                if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                    money += gameThreeballRecord.getBigSingle() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                    money += gameThreeballRecord.getBigSingle() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                    money += gameThreeballRecord.getBigSingle() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                }else {
//                    money += gameThreeballRecord.getBigSingle() * getOddFromMapByOddKey(betItemMap, "bigsingle");
//                }
//                combinationMoney += gameThreeballRecord.getBigSingle();
//            }
            // 大双
            if(bigDoubleList.contains(gameThreeballKj.getSumNum()) && gameThreeballRecord.getBigDouble() > 0){
                combinationMoney += gameThreeballRecord.getSmallSingle();

                if((gameThreeballKj.getSumNum() == 13 || gameThreeballKj.getSumNum() == 14) && gameThreeballMixedOdds.getComboNumberMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMaxQuota()) > 0) {
                        money += gameThreeballRecord.getBigDouble() * gameThreeballMixedOdds.getComboGreaterNumberOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMinQuota()) > 0){
                        money += gameThreeballRecord.getBigDouble() * gameThreeballMixedOdds.getComboCenterNumberOdd();
                        // 小于下限
                    }else {
                        money += gameThreeballRecord.getBigDouble() * gameThreeballMixedOdds.getComboLessNumberOdd();
                    }
                    // 豹顺对且设置了上限
                }else if((dsbResult == 1 || dsbResult == 2 || dsbResult == 3) && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0){
                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0) {
                        money += gameThreeballRecord.getBigDouble() * gameThreeballMixedOdds.getGreaterSdbOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
                        money += gameThreeballRecord.getBigDouble() * gameThreeballMixedOdds.getCenterSdbOdd();
                        // 小于下限
                    }else{
                        money += gameThreeballRecord.getBigDouble() * gameThreeballMixedOdds.getLessSdbOdd();
                    }

                    // 包含09且设置了上限
                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9) && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 ){
                        money += gameThreeballRecord.getBigDouble() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
                        money += gameThreeballRecord.getBigDouble() * gameThreeballMixedOdds.getCenterZeroNineOdd();
                        // 小于下限
                    }else{
                        money += gameThreeballRecord.getBigDouble() * gameThreeballMixedOdds.getLessZeroNineOdd();
                    }
                    // 常规赔率
                }else{

//                    if(bigDoubleList.contains(gameThreeballKj.getSumNum())){
                        money += gameThreeballRecord.getBigDouble() * getOddFromMapByOddKey(betItemMap, "bigdouble");
//                    }
                }
            }
//            if(bigDoubleList.contains(gameThreeballKj.getSumNum()) && gameThreeballRecord.getBigDouble() > 0){
//                if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                    money += gameThreeballRecord.getBigDouble() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                    money += gameThreeballRecord.getBigDouble() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                    money += gameThreeballRecord.getBigDouble() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                }else {
//                    money += gameThreeballRecord.getBigDouble() * getOddFromMapByOddKey(betItemMap, "bigdouble");
//                }
//                combinationMoney += gameThreeballRecord.getBigDouble();
//            }

            // 小单
            if(smallSingleList.contains(gameThreeballKj.getSumNum()) && gameThreeballRecord.getSmallSingle() > 0){
                combinationMoney += gameThreeballRecord.getSmallSingle();
                if((gameThreeballKj.getSumNum() == 13 || gameThreeballKj.getSumNum() == 14) && gameThreeballMixedOdds.getComboNumberMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMaxQuota()) > 0) {
                        money += gameThreeballRecord.getSmallSingle() * gameThreeballMixedOdds.getComboGreaterNumberOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMinQuota()) > 0){
                        money += gameThreeballRecord.getSmallSingle() * gameThreeballMixedOdds.getComboCenterNumberOdd();
                        // 小于下限
                    }else {
                        money += gameThreeballRecord.getSmallSingle() * gameThreeballMixedOdds.getComboLessNumberOdd();
                    }
                    // 豹顺对且设置了上限
                }else if((dsbResult == 1 || dsbResult == 2 || dsbResult == 3) && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0){
                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0) {
                        money += gameThreeballRecord.getSmallSingle() * gameThreeballMixedOdds.getGreaterSdbOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
                        money += gameThreeballRecord.getSmallSingle() * gameThreeballMixedOdds.getCenterSdbOdd();
                        // 小于下限
                    }else{
                        money += gameThreeballRecord.getSmallSingle() * gameThreeballMixedOdds.getLessSdbOdd();
                    }

                    // 包含09且设置了上限
                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9) && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 ){
                        money += gameThreeballRecord.getSmallSingle() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
                        money += gameThreeballRecord.getSmallSingle() * gameThreeballMixedOdds.getCenterZeroNineOdd();
                        // 小于下限
                    }else{
                        money += gameThreeballRecord.getSmallSingle() * gameThreeballMixedOdds.getLessZeroNineOdd();
                    }
                    // 常规赔率
                }else{
//                    if(smallSingleList.contains(gameThreeballKj.getSumNum())){
                        money += gameThreeballRecord.getSmallSingle() * getOddFromMapByOddKey(betItemMap, "smallsingle");
//                    }
                }
            }
//            if(smallSingleList.contains(gameThreeballKj.getSumNum()) && gameThreeballRecord.getSmallSingle() > 0){
//                if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                    money += gameThreeballRecord.getSmallSingle() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                    money += gameThreeballRecord.getSmallSingle() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                    money += gameThreeballRecord.getSmallSingle() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                }else {
//                    money += gameThreeballRecord.getSmallSingle() * getOddFromMapByOddKey(betItemMap, "smallsingle");
//                }
//                combinationMoney += gameThreeballRecord.getSmallSingle();
//            }
            // 小双
            if(smallDoubleList.contains(gameThreeballKj.getSumNum()) && gameThreeballRecord.getSmallDouble() > 0){
                combinationMoney += gameThreeballRecord.getSmallDouble();

                if((gameThreeballKj.getSumNum() == 13 || gameThreeballKj.getSumNum() == 14) && gameThreeballMixedOdds.getComboNumberMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMaxQuota()) > 0) {
                        money += gameThreeballRecord.getSmallDouble() * gameThreeballMixedOdds.getComboGreaterNumberOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getComboNumberMinQuota()) > 0){
                        money += gameThreeballRecord.getSmallDouble() * gameThreeballMixedOdds.getComboCenterNumberOdd();
                        // 小于下限
                    }else {
                        money += gameThreeballRecord.getSmallDouble() * gameThreeballMixedOdds.getComboLessNumberOdd();
                    }
                    // 豹顺对且设置了上限
                }else if((dsbResult == 1 || dsbResult == 2 || dsbResult == 3) && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0){
                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0) {
                        money += gameThreeballRecord.getSmallDouble() * gameThreeballMixedOdds.getGreaterSdbOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
                        money += gameThreeballRecord.getSmallDouble() * gameThreeballMixedOdds.getCenterSdbOdd();
                        // 小于下限
                    }else{
                        money += gameThreeballRecord.getSmallDouble() * gameThreeballMixedOdds.getLessSdbOdd();
                    }

                    // 包含09且设置了上限
                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9) && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0){

                    // 大于上限
                    if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 ){
                        money += gameThreeballRecord.getSmallDouble() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
                        // 大于下限 小于上限
                    }else if(countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
                            && countMoney.compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
                        money += gameThreeballRecord.getSmallDouble() * gameThreeballMixedOdds.getCenterZeroNineOdd();
                        // 小于下限
                    }else{
                        money += gameThreeballRecord.getSmallDouble() * gameThreeballMixedOdds.getLessZeroNineOdd();
                    }
                    // 常规赔率
                }else{
//                    if(smallDoubleList.contains(gameThreeballKj.getSumNum())){
                        money += gameThreeballRecord.getSmallDouble() * getOddFromMapByOddKey(betItemMap, "smalldouble");
//                    }
                }
            }
//            if(smallDoubleList.contains(gameThreeballKj.getSumNum()) && gameThreeballRecord.getSmallDouble() > 0){
//                if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) > 0 && gameThreeballMixedOdds.getZeroNineMaxQuota().compareTo(0f) > 0) {
//                    money += gameThreeballRecord.getSmallDouble() * gameThreeballMixedOdds.getGreaterZeroNineOdd();
//                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMaxQuota()) <= 0
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) > 0){
//                    money += gameThreeballRecord.getSmallDouble() * gameThreeballMixedOdds.getCenterZeroNineOdd();
//                }else if((gameThreeballKj.getNum1() == 0 || gameThreeballKj.getNum1() == 9
//                        || gameThreeballKj.getNum2() == 0 || gameThreeballKj.getNum2() == 9
//                        || gameThreeballKj.getNum3() == 0 || gameThreeballKj.getNum3() == 9)
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getZeroNineMinQuota()) <= 0){
//                    money += gameThreeballRecord.getSmallDouble() * gameThreeballMixedOdds.getLessZeroNineOdd();
//                }else {
//                    money += gameThreeballRecord.getSmallDouble() * getOddFromMapByOddKey(betItemMap, "smalldouble");
//                }
//                combinationMoney += gameThreeballRecord.getSmallDouble();
//            }
            // 极小
            if(gameThreeballKj.getSumNum() < 6 && gameThreeballRecord.getMuchSmall() > 0){
                money += gameThreeballRecord.getMuchSmall() * getOddFromMapByOddKey(betItemMap,"muchsmall");
            }
            // 龙
            if(gameThreeballKj.getNum3() < gameThreeballKj.getNum1() && gameThreeballRecord.getLoong() > 0){
                money += gameThreeballRecord.getLoong() * getOddFromMapByOddKey(betItemMap,"loong");
            }
            // 虎
            if(gameThreeballKj.getNum1() < gameThreeballKj.getNum3() && gameThreeballRecord.getTiger() > 0){
                money += gameThreeballRecord.getTiger() * getOddFromMapByOddKey(betItemMap,"tiger");
            }
            // 合
            if(gameThreeballKj.getNum1() == gameThreeballKj.getNum3() && gameThreeballRecord.getClose() > 0){
                money += gameThreeballRecord.getClose() * getOddFromMapByOddKey(betItemMap,"close");
            }

//            Integer dsbResult = getBaoShunDui(gameThreeballKj.getNum1(),gameThreeballKj.getNum2(),gameThreeballKj.getNum3());
            // 豹
            if(dsbResult == 1 && gameThreeballRecord.getLeopard() > 0){
//                if(gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0 && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0) {
//                    money += gameThreeballRecord.getLeopard() * gameThreeballMixedOdds.getGreaterSdbOdd();
//                }else if(gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
//                    money += gameThreeballRecord.getLeopard() * gameThreeballMixedOdds.getCenterSdbOdd();
//                }else if(gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getSdbMinQuota()) <= 0){
//                    money += gameThreeballRecord.getLeopard() * gameThreeballMixedOdds.getLessSdbOdd();
//                }else{
                    money += gameThreeballRecord.getLeopard() * getOddFromMapByOddKey(betItemMap,"leopard");
//                }
            }
            // 顺
            if(dsbResult == 2 && gameThreeballRecord.getShun() > 0){
//                if(gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0 && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0) {
//                    money += gameThreeballRecord.getShun() * gameThreeballMixedOdds.getGreaterSdbOdd();
//                }else if(gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
//                    money += gameThreeballRecord.getShun() * gameThreeballMixedOdds.getCenterSdbOdd();
//                }else if(gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getSdbMinQuota()) <= 0){
//                    money += gameThreeballRecord.getShun() * gameThreeballMixedOdds.getLessSdbOdd();
//                }else{
                    money += gameThreeballRecord.getShun() * getOddFromMapByOddKey(betItemMap,"shun");
//                }
            }
            // 对
            if(dsbResult == 3 && gameThreeballRecord.getPairs() > 0){
//                if(gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) > 0 && gameThreeballMixedOdds.getSdbMaxQuota().compareTo(0f) > 0) {
//                    money += gameThreeballRecord.getPairs() * gameThreeballMixedOdds.getGreaterSdbOdd();
//                }else if(gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getSdbMaxQuota()) <= 0
//                        && gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getSdbMinQuota()) > 0){
//                    money += gameThreeballRecord.getPairs() * gameThreeballMixedOdds.getCenterSdbOdd();
//                }else if(gameThreeballRecord.getCountMoney().compareTo(gameThreeballMixedOdds.getSdbMinQuota()) <= 0){
//                    money += gameThreeballRecord.getPairs() * gameThreeballMixedOdds.getLessSdbOdd();
//                }else{
                    money += gameThreeballRecord.getPairs() * getOddFromMapByOddKey(betItemMap,"pairs");
//                }
            }

            // 红绿蓝
            if(waveMap != null){
                Object waveNumObject = waveMap.get("num" + gameThreeballKj.getSumNum());
                Integer numWave = waveNumObject!=null?(Integer) waveNumObject:0;

                // 绿
                if(numWave == 1 && gameThreeballRecord.getGreen() > 0){
                    money += gameThreeballRecord.getGreen() * getOddFromMapByOddKey(betItemMap,"green");
                }
                // 红
                if(numWave == 2 && gameThreeballRecord.getRed() > 0){
                    money += gameThreeballRecord.getRed() * getOddFromMapByOddKey(betItemMap,"red");
                }
                // 蓝
                if(numWave == 3 && gameThreeballRecord.getBlue() > 0){
                    money += gameThreeballRecord.getBlue() * getOddFromMapByOddKey(betItemMap,"blue");
                }
            }

            SysUser user = sysUserService.selectUserById(gameThreeballRecord.getUserId());
            user.setScore(user.getScore() + gameThreeballRecord.getCountMoney());
            if(money > 0){
                user.setAmount(user.getAmount() + money);
            }
            sysUserService.updateUserAmount(user);

            Userwin userwin = userwinService.selectTodayUserwin(gameInfo.getGameId(),gameThreeballRecord.getUserId());
            if(userwin == null){
                userwin = new Userwin();
                userwin.setGameId(gameInfo.getGameId());
                userwin.setGameName(gameInfo.getGameName());
                userwin.setUserId(gameThreeballRecord.getUserId());
                userwin.setWinMoney(money - gameThreeballRecord.getCountMoney());
                userwin.setBigSmallMoney(bigSamllMoney);
                userwin.setOtherMoney(otherMoney);
                userwin.setCombinationMoney(combinationMoney);
                userwin.setBetMoney(userBetMoneyMap.get(gameThreeballRecord.getUserId()));
                userwin.setCreateBy("lotteryThree");

                userwinService.insertUserwin(userwin);
            }else{

                userwin.setWinMoney(userwin.getWinMoney() + (money - gameThreeballRecord.getCountMoney()));
                userwin.setBigSmallMoney(userwin.getBigSmallMoney() + bigSamllMoney);
                userwin.setOtherMoney(userwin.getOtherMoney() + otherMoney);
                userwin.setCombinationMoney(userwin.getCombinationMoney() + combinationMoney);
                userwin.setBetMoney(userwin.getBetMoney() + userBetMoneyMap.get(gameThreeballRecord.getUserId()));
                userwin.setCreateBy("lotteryThree");
                userwinService.updateUserwin(userwin);
            }

            gameThreeballRecord.setWinMoney(money);
            gameThreeballRecord.setStatus("1");
            gameThreeballRecord.setN1(gameThreeballKj.getNum1());
            gameThreeballRecord.setN2(gameThreeballKj.getNum2());
            gameThreeballRecord.setN3(gameThreeballKj.getNum3());
            gameThreeballRecord.setSumNum(gameThreeballKj.getSumNum());
            gameThreeballRecord.setUpdateBy("lotteryThree");

            gameThreeballRecordService.updateGameThreeballRecord(gameThreeballRecord);

            if(money > 0){
                Usermoney usermoney = new Usermoney();
                usermoney.setUserId(gameThreeballRecord.getUserId());
                usermoney.setCashContent("【" + gameInfo.getGameName() + "】中奖-" + periodId);
                usermoney.setCashMoney(money);
                usermoney.setUserBalance(user.getAmount());
                usermoney.setType("8");
                usermoney.setGameId(gameInfo.getGameId());
                usermoney.setGameName(gameInfo.getGameName());
                usermoney.setRemark("【" + gameInfo.getGameName() + "】第[" + periodId + "]期,中奖金额[" + money + "]元");
                usermoneyService.insertUsermoney(usermoney);
            }

            adminWinMoney += gameThreeballRecord.getCountMoney() - money;
            Float accountResult = money - gameThreeballRecord.getCountMoney();

//            BetRecord betRecord = new BetRecord();
//            betRecord.setUserId(gameThreeballRecord.getUserId());
//            betRecord.setGameId(gameInfo.getGameId());
//            betRecord.setPeriods(periodId);
//            betRecord.setSettleFlg("0");
//            betRecord.setIsDelete("0");
//            betRecord.setGameResult(gameResult);
//            betRecord.setAccountResult(accountResult);
//
//            betRecordService.updateLotteryResult(betRecord);

        }

        Adminwin todayAdminwin = adminwinService.selectTodayAdminwin(gameInfo.getGameId());
        if(todayAdminwin == null){
            todayAdminwin = new Adminwin();
            todayAdminwin.setGameId(gameInfo.getGameId());
            todayAdminwin.setGameName(gameInfo.getGameName());
            todayAdminwin.setWinMoney(adminWinMoney);
            todayAdminwin.setCreateBy("lotteryThree");

            adminwinService.insertAdminwin(todayAdminwin);
        }else{
            todayAdminwin.setWinMoney(adminWinMoney +todayAdminwin.getWinMoney());
            todayAdminwin.setUpdateBy("lotteryThree");
            adminwinService.updateAdminwin(todayAdminwin);
        }

        RecordSumRespVo recordSumRespVo = gameThreeballRecordService.selectSumRecordByPeriodId(gameInfo.getGameId(), periodId);
        gameThreeballKj.setCountMoney(recordSumRespVo.getCountMoney());
        gameThreeballKj.setWinMoney(recordSumRespVo.getWinMoney());
        gameThreeballKjService.updateGameThreeballKjTotalAmountByPeriodId(gameThreeballKj);
    }

    private Float getOddFromMapByOddKey(Map<String , SysBetItem> betItemMap, String betItemCode){
        Float odd = 0f;
        if(betItemMap.containsKey(betItemCode)){
            odd = betItemMap.get(betItemCode).getOdd();
        }

        return odd;
    }

    private Integer getBaoShunDui(Integer num1,Integer num2,Integer num3){
        Integer result = 404;
        Integer[] nums = {num1,num2,num3};
        Arrays.sort(nums);

        //豹子
        if(num1 == num2 && num1 == num3 && num2 == num3){
            result = 1;
            // 顺子
        }else if(nums[1] - nums[0] == 1 && nums[2] - nums[1] == 1){
            result = 2;
            // 顺子
        }else if(nums[0] == 0 && nums[1] == 1 && nums[2] == 9){
            result = 2;
            // 顺子
        }else if(nums[0] == 0 && nums[1] == 8 && nums[2] == 9){
            result = 2;
        }else if(num1 == (num2 + 1) && num2 == (num3 + 1)){
            result = 2;
        }else if(num1 == 9 && num2 == 1 && num3 == 0){
            result = 2;
        }else if(num1 == 9 && num2 == 8 && num3 == 0){
            result = 2;
        }else if((num1 == num2 && num2 != num3) || (num1 != num2 && num2 == num3)){
            result = 3;
        }else if((nums[0] == nums[1] && nums[1] != nums[2]) || (nums[0] != nums[1] && nums[1] == nums[2])){
            result = 3;
        }

        return result;
    }

}
