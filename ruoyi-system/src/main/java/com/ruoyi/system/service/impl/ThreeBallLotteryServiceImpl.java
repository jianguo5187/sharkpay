package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.EntityMapTransUtils;
import com.ruoyi.system.service.IThreeBallLotteryService;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.vo.RecordSumRespVo;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class ThreeBallLotteryServiceImpl implements IThreeBallLotteryService {

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
        List<GameThreeballKj> gameThreeballKjList = gameThreeballKjService.selectGameThreeballKjListWithStatusZeroAndLimit(gameInfo.getGameId(),null,"0",null,"1",null);
        if(gameThreeballKjList.size() == 2){
            return;
        }
        GameThreeballOpenData gameThreeballOpenData = gameThreeballOpenDataService.selectLastRecord(gameInfo.getGameId());
        if(gameThreeballOpenData == null){
            throw new ServiceException("createThreeData return false2");
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
                throw new ServiceException("createThreeData return false3 ID: " + (gameThreeballOpenData.getPeriods() + 2));
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
            throw new ServiceException("createThreeData return false4");
        }
        gameThreeballKjService.insertGameThreeballKj(newGameThreeballKj);
        createThreeData(gameInfo);
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

        GameThreeballOpenData gameThreeballOpenData = gameThreeballOpenDataService.selectGameThreeballOpenDataByPeriods(gameInfo.getGameId(),gameThreeballKj.getPeriods());
        if(gameThreeballOpenData == null){
            return;
        }

        gameThreeballKj.setNum1(gameThreeballOpenData.getSum1());
        gameThreeballKj.setNum2(gameThreeballOpenData.getSum2());
        gameThreeballKj.setNum3(gameThreeballOpenData.getSum3());
        gameThreeballKj.setSumNum(gameThreeballOpenData.getSum1() + gameThreeballOpenData.getSum2() + gameThreeballOpenData.getSum3());
        gameThreeballKj.setStatus("1"); //开奖
        gameThreeballKj.setTheTime(gameThreeballOpenData.getTime());

        int updateInt = gameThreeballKjService.updateGameThreeballKj(gameThreeballKj);
        if(updateInt > 0){
            lotteryThree(gameInfo, gameThreeballKj.getPeriods());
            createThreeData(gameInfo);

            // 补漏
            List<GameThreeballKj> notOpenGameThreeballKjList = gameThreeballKjService.selectGameThreeballKjListWithStatusZeroAndLimit(gameInfo.getGameId(),gameThreeballKj.getPeriods(),"0",null,"1",1);
            if(notOpenGameThreeballKjList != null && notOpenGameThreeballKjList.size() >0){
                lotteryThree(gameInfo, notOpenGameThreeballKjList.get(0).getPeriods());
            }
        }
    }

    public void lotteryThree(SysGame gameInfo, Long periodId){
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

        Wave wave = waveService.selectWaveByGameId(gameInfo.getGameId());
        Map<String, Object> waveMap = EntityMapTransUtils.entityToMap1(wave);

        List<Integer> bigSingleList = Arrays.asList(15, 17, 19, 21, 23, 25, 27);
        List<Integer> smallSingleList = Arrays.asList(1, 3, 5, 7, 9, 11, 13);
        List<Integer> bigDoubleList = Arrays.asList(14, 16, 18, 20, 22, 24, 26);
        List<Integer> smallDoubleList = Arrays.asList(0, 2, 4, 6, 8, 10, 12);

        for(GameThreeballRecord gameThreeballRecord : gameThreeballRecordList){
            Float money = 0f;
            Float bigSamllMoney = 0f;
            Float otherMoney = 0f;

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
                money += gameThreeballRecord.getBig() * getOddFromMapByOddKey(betItemMap,"big");
            }
            // 小
            if(gameThreeballKj.getSumNum() < 14 && gameThreeballRecord.getSmall() > 0){
                money += gameThreeballRecord.getSmall() * getOddFromMapByOddKey(betItemMap,"small");
            }
            // 单
            if(gameThreeballKj.getSumNum()%2 == 1 && gameThreeballRecord.getSingle() > 0){
                money += gameThreeballRecord.getSingle() * getOddFromMapByOddKey(betItemMap,"single");
            }
            // 双
            if(gameThreeballKj.getSumNum()%2 == 0 && gameThreeballRecord.getDoubleAmount() > 0){
                money += gameThreeballRecord.getDoubleAmount() * getOddFromMapByOddKey(betItemMap,"doubleFlg");
            }
            // 极大
            if(gameThreeballKj.getSumNum() > 21 && gameThreeballRecord.getMuchBig() > 0){
                money += gameThreeballRecord.getMuchBig() * getOddFromMapByOddKey(betItemMap,"muchbig");
            }

            // 大单
            if(bigSingleList.contains(gameThreeballKj.getSumNum()) && gameThreeballRecord.getBigSingle() > 0){
                money += gameThreeballRecord.getBigSingle() * getOddFromMapByOddKey(betItemMap,"bigsingle");
            }
            // 大双
            if(bigDoubleList.contains(gameThreeballKj.getSumNum()) && gameThreeballRecord.getBigDouble() > 0){
                money += gameThreeballRecord.getBigDouble() * getOddFromMapByOddKey(betItemMap,"bigdouble");
            }
            // 小单
            if(smallSingleList.contains(gameThreeballKj.getSumNum()) && gameThreeballRecord.getSmallSingle() > 0){
                money += gameThreeballRecord.getSmallSingle() * getOddFromMapByOddKey(betItemMap,"smallsingle");
            }
            // 小双
            if(smallDoubleList.contains(gameThreeballKj.getSumNum()) && gameThreeballRecord.getSmallDouble() > 0){
                money += gameThreeballRecord.getSmallDouble() * getOddFromMapByOddKey(betItemMap,"smalldouble");
            }
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
                money += gameThreeballRecord.getLoong() * getOddFromMapByOddKey(betItemMap,"tiger");
            }
            // 合
            if(gameThreeballKj.getNum1() == gameThreeballKj.getNum3() && gameThreeballRecord.getClose() > 0){
                money += gameThreeballRecord.getClose() * getOddFromMapByOddKey(betItemMap,"close");
            }

            Integer dsbResult = getBaoShunDui(gameThreeballKj.getNum1(),gameThreeballKj.getNum2(),gameThreeballKj.getNum3());
            // 豹
            if(dsbResult == 1 && gameThreeballRecord.getLeopard() > 0){
                money += gameThreeballRecord.getLeopard() * getOddFromMapByOddKey(betItemMap,"leopard");
            }
            // 顺
            if(dsbResult == 2 && gameThreeballRecord.getShun() > 0){
                money += gameThreeballRecord.getShun() * getOddFromMapByOddKey(betItemMap,"shun");
            }
            // 对
            if(dsbResult == 3 && gameThreeballRecord.getPairs() > 0){
                money += gameThreeballRecord.getPairs() * getOddFromMapByOddKey(betItemMap,"pairs");
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
                userwin.setCreateBy("lotteryThree");

                userwinService.insertUserwin(userwin);
            }else{

                userwin.setWinMoney(userwin.getWinMoney() + (money - gameThreeballRecord.getCountMoney()));
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
                usermoney.setCashContent("【加拿大2.8】中奖-" + periodId);
                usermoney.setCashMoney(money);
                usermoney.setUserBalance(user.getAmount());
                usermoney.setType("8");
                usermoney.setGameId(gameInfo.getGameId());
                usermoney.setGameName(gameInfo.getGameName());
                usermoneyService.insertUsermoney(usermoney);
            }

            adminWinMoney += gameThreeballRecord.getCountMoney() - money;
            Float accountResult = money - gameThreeballRecord.getCountMoney();

            BetRecord betRecord = new BetRecord();
            betRecord.setUserId(gameThreeballRecord.getUserId());
            betRecord.setGameId(gameInfo.getGameId());
            betRecord.setPeriods(periodId);
            betRecord.setSettleFlg("0");
            betRecord.setIsDelete("0");
            betRecord.setGameResult(gameResult);
            betRecord.setAccountResult(accountResult);

            betRecordService.updateLotteryResult(betRecord);

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

        //豹子
        if(num1 == num2 && num1 == num3 && num2 == num3){
            result = 1;
            // 顺子
        }else if(num1 == (num2 + 1) && num2 == (num3 + 1)){
            result = 2;
        }else if(num1 == 9 && num2 == 1 && num3 == 0){
            result = 2;
        }else if(num1 == 9 && num2 == 8 && num3 == 0){
            result = 2;
        }else if((num1 == num2 && num2 != num3) || (num1 != num2 && num2 == num3)){
            result = 3;
        }

        return result;
    }

}
