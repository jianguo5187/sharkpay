package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.EntityMapTransUtils;
import com.ruoyi.system.service.ITenBallLotteryService;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.vo.RecordSumRespVo;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class TenBallLotteryServiceImpl implements ITenBallLotteryService {

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private IGameTenballKjService gameTenballKjService;

    @Autowired
    private IGameTenballOpenDataService gameTenballOpenDataService;

    @Autowired
    private IGameTenballRecordService gameTenballRecordService;

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

    @Override
    public void lotteryTenBall(String gameCode) {

        SysGame gameInfo = sysGameService.selectSysGameByGameMarkId(gameCode);
        if(gameInfo == null){
            throw new ServiceException("没有" + gameCode + "游戏基础表数据");
        }
        if(gameInfo.getLotteryInterval() == 0){
            throw new ServiceException("开奖间隔为空,定时开奖结算失败");
        }

        GameTenballKj existGameTenballKj = gameTenballKjService.selectLastRecord(gameInfo.getGameId(),"");

        GameTenballOpenData gameTenballOpenData = gameTenballOpenDataService.selectLastRecord(gameInfo.getGameId());

        Long jiange = 0l;
        if(gameTenballOpenData == null){
            throw new ServiceException(gameInfo.getGameName() + "没有开奖数据，请先同步开奖数据");
        }

        GameTenballKj searchGameTenballKj = new GameTenballKj();
        searchGameTenballKj.setStatus("0");
        searchGameTenballKj.setGameId(gameInfo.getGameId());
        List<GameTenballKj> notOpenGameTenballKjList = gameTenballKjService.selectGameTenballKjList(searchGameTenballKj);
        if(notOpenGameTenballKjList != null && notOpenGameTenballKjList.size() > 0){
            jiange = gameTenballOpenData.getPeriods() - notOpenGameTenballKjList.get(0).getPeriods();
        }

        if(jiange >= 0){
            List<GameTenballKj> gameTenballKjList = gameTenballKjService.selectGameTenballKjListWithStatusZeroAndLimit(gameInfo.getGameId(), gameTenballOpenData.getPeriods(),"0",null,"1",50);
            for (GameTenballKj GameTenballKj : gameTenballKjList){
                GameTenballKj.setStatus("2");
                GameTenballKj.setUpdateBy("lotteryTenballBalance");
                gameTenballKjService.updateGameTenballKj(GameTenballKj);
            }
            createTenballData(gameInfo);
        }

        if(existGameTenballKj != null){
            SingleTenballUpdate(gameInfo);
            createTenballData(gameInfo);
        }else{
            CreateTenballAll(gameInfo);
        }
    }

    @Override
    public void createTenballData(SysGame gameInfo){
        List<GameTenballKj> gameTenballKjList = gameTenballKjService.selectGameTenballKjListWithStatusZeroAndLimit(gameInfo.getGameId(), null,"0",null,"1",null);
        if(gameTenballKjList.size() == 2){
            return;
        }
        GameTenballOpenData gameTenballOpenDataInfo = gameTenballOpenDataService.selectLastRecord(gameInfo.getGameId());
        if(gameTenballOpenDataInfo == null){
            throw new ServiceException("createTenballData return false2");
        }
        GameTenballKj firstGameTenballKj = gameTenballKjService.selectGameTenballKjByPeriods(gameInfo.getGameId(),gameTenballOpenDataInfo.getPeriods() + 1);

        GameTenballKj newGameTenballKj = new GameTenballKj();
        newGameTenballKj.setGameId(gameInfo.getGameId());
        newGameTenballKj.setGameName(gameInfo.getGameName());
        newGameTenballKj.setStatus("0");
        newGameTenballKj.setCreateBy("createTenballData");

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String timeStr = formatter.format(gameTenballOpenDataInfo.getTime());
        String minStr = timeStr.substring(15,16);
        Date time = null;
        if(Integer.parseInt(minStr) <5 && gameTenballOpenDataInfo.getPeriods()%2 == 0){
            String dateStr = timeStr.substring(0,15) + "3:45";
            try {
                time = formatter.parse(dateStr);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
        }else if(Integer.parseInt(minStr) > 5 || gameTenballOpenDataInfo.getPeriods()%2 != 0){
            String dateStr = timeStr.substring(0,15) + "8:45";
            try {
                time = formatter.parse(dateStr);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
        }else{
            time = gameTenballOpenDataInfo.getTime();
        }

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(time);

        if(gameTenballKjList.size() == 0 && firstGameTenballKj == null){
            newGameTenballKj.setPeriods(gameTenballOpenDataInfo.getPeriods() + 1);

            //预计开奖时间
            calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval());
            calendar.add(Calendar.SECOND, gameInfo.getLeadTime());
            newGameTenballKj.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newGameTenballKj.setBetTime(calendar.getTime());
        }else if(gameTenballKjList.size() == 1 && firstGameTenballKj != null){
            GameTenballKj secondGameTenballKj = gameTenballKjService.selectGameTenballKjByPeriods(gameInfo.getGameId(),gameTenballOpenDataInfo.getPeriods() + 2);
            if(secondGameTenballKj != null){
                throw new ServiceException("createTenballData return false3 ID: " + (gameTenballOpenDataInfo.getPeriods() + 2));
            }
            newGameTenballKj.setPeriods(gameTenballOpenDataInfo.getPeriods() + 2);

            //预计开奖时间
            calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval()*2);
            calendar.add(Calendar.SECOND, gameInfo.getLeadTime());
            newGameTenballKj.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newGameTenballKj.setBetTime(calendar.getTime());
        }else{
            throw new ServiceException("createTenballData return false4");
        }
        gameTenballKjService.insertGameTenballKj(newGameTenballKj);
        createTenballData(gameInfo);
    }

    public void CreateTenballAll(SysGame gameInfo){
        List<GameTenballOpenData> gameTenballOpenDataList = gameTenballOpenDataService.selectGameTenballOpenDataListByParam(gameInfo.getGameId(),"1",5);
        for(GameTenballOpenData gmeTenballOpenData :gameTenballOpenDataList){
            GameTenballKj newGameTenballKj = new GameTenballKj();
            newGameTenballKj.setGameId(gameInfo.getGameId());
            newGameTenballKj.setGameName(gameInfo.getGameName());
            newGameTenballKj.setPeriods(gmeTenballOpenData.getPeriods());
            newGameTenballKj.setNum1(gmeTenballOpenData.getNum1());
            newGameTenballKj.setNum2(gmeTenballOpenData.getNum2());
            newGameTenballKj.setNum3(gmeTenballOpenData.getNum3());
            newGameTenballKj.setNum4(gmeTenballOpenData.getNum4());
            newGameTenballKj.setNum5(gmeTenballOpenData.getNum5());
            newGameTenballKj.setNum6(gmeTenballOpenData.getNum6());
            newGameTenballKj.setNum7(gmeTenballOpenData.getNum7());
            newGameTenballKj.setNum8(gmeTenballOpenData.getNum8());
            newGameTenballKj.setNum9(gmeTenballOpenData.getNum9());
            newGameTenballKj.setNum10(gmeTenballOpenData.getNum10());

            newGameTenballKj.setStatus("1");
            // 开奖时间
            newGameTenballKj.setTheTime(gmeTenballOpenData.getTime());

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(gmeTenballOpenData.getTime());
            //预计开奖时间(比实际开奖时间少10s)
            calendar.add(Calendar.SECOND, -5);
            newGameTenballKj.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newGameTenballKj.setBetTime(calendar.getTime());

            gameTenballKjService.insertGameTenballKj(newGameTenballKj);
        }

        createTenballData(gameInfo);
    }

    public void SingleTenballUpdate(SysGame gameInfo){

        List<GameTenballKj> gameTenballKjList = gameTenballKjService.selectGameTenballKjListWithStatusZeroAndLimit(gameInfo.getGameId(),null,"0","1",null,1);

        if(gameTenballKjList == null || gameTenballKjList.size() == 0){
            return;
        }
        GameTenballKj gameTenballKj = gameTenballKjList.get(0);

        GameTenballOpenData gameTenballOpenData = gameTenballOpenDataService.selectGameTenballOpenDataByPeriods(gameInfo.getGameId(),gameTenballKj.getPeriods());
        if(gameTenballOpenData == null){
            return;
        }

        gameTenballKj.setNum1(gameTenballOpenData.getNum1());
        gameTenballKj.setNum2(gameTenballOpenData.getNum2());
        gameTenballKj.setNum3(gameTenballOpenData.getNum3());
        gameTenballKj.setNum4(gameTenballOpenData.getNum4());
        gameTenballKj.setNum5(gameTenballOpenData.getNum5());
        gameTenballKj.setNum6(gameTenballOpenData.getNum6());
        gameTenballKj.setNum7(gameTenballOpenData.getNum7());
        gameTenballKj.setNum8(gameTenballOpenData.getNum8());
        gameTenballKj.setNum9(gameTenballOpenData.getNum9());
        gameTenballKj.setNum10(gameTenballOpenData.getNum10());
        gameTenballKj.setStatus("1"); //开奖
        gameTenballKj.setTheTime(gameTenballOpenData.getTime());

        int updateInt = gameTenballKjService.updateGameTenballKj(gameTenballKj);
        if(updateInt > 0){
            lotteryGameTenballOpenData(gameInfo, gameTenballKj.getPeriods());
            createTenballData(gameInfo);

            // 补漏
            List<GameTenballKj> notOpenGameTenballKjList = gameTenballKjService.selectGameTenballKjListWithStatusZeroAndLimit(gameInfo.getGameId(),gameTenballKj.getPeriods(),"0",null,"1",1);
            if(notOpenGameTenballKjList != null && notOpenGameTenballKjList.size() >0){
                lotteryGameTenballOpenData(gameInfo, notOpenGameTenballKjList.get(0).getPeriods());
            }
        }
    }

    @Override
    public void lotteryGameTenballOpenData(SysGame gameInfo, Long periodId){
        GameTenballRecord searchGameTenballRecord = new GameTenballRecord();
        searchGameTenballRecord.setGameId(gameInfo.getGameId());
        searchGameTenballRecord.setStatus("0");
        searchGameTenballRecord.setPeriods(periodId);
        List<GameTenballRecord> gameTenballRecordList = gameTenballRecordService.selectGameTenballRecordList(searchGameTenballRecord);

        if(gameTenballRecordList == null || gameTenballRecordList.size() == 0){
            return;
        }

        GameTenballKj gameTenballKj = gameTenballKjService.selectGameTenballKjByPeriods(gameInfo.getGameId(),periodId);

        Float adminWinMoney = 0f;
        String gameResult = gameTenballKj.getNum1() + "+" +
                gameTenballKj.getNum2() + "+" +
                gameTenballKj.getNum3() + "+" +
                gameTenballKj.getNum4() + "+" +
                gameTenballKj.getNum5() + "+" +
                gameTenballKj.getNum6() + "+" +
                gameTenballKj.getNum7() + "+" +
                gameTenballKj.getNum8() + "+" +
                gameTenballKj.getNum9() + "+" +
                gameTenballKj.getNum10();

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

        Map<String, Object> gameTenballKjMap = EntityMapTransUtils.entityToMap1(gameTenballKj);
        List<Integer> bigSingleList = Arrays.asList(13, 15, 17, 19);
        List<Integer> smallSingleList = Arrays.asList(3, 5, 7, 9, 11);
        List<Integer> bigDoubleList = Arrays.asList(12, 14, 16, 18);
        List<Integer> smallDoubleList = Arrays.asList(4, 6, 8, 10);

        for(GameTenballRecord gameTenballRecord : gameTenballRecordList){
            Float money = 0f;
            Float bigSamllMoney = 0f;
            Float otherMoney = 0f;

            Map<String, Object> gameTenballRecordMap = EntityMapTransUtils.entityToMap1(gameTenballRecord);
            // 冠亚和的大小单双的金额计算
            if(gameTenballRecord.getType1Big() >0){
                bigSamllMoney += gameTenballRecord.getType1Big();
            }
            // 冠亚和的小的金额计算
            if(gameTenballRecord.getType1Small() >0){
                bigSamllMoney += gameTenballRecord.getType1Small();
            }
            // 冠亚和的单的金额计算
            if(gameTenballRecord.getType1Single() >0){
                bigSamllMoney += gameTenballRecord.getType1Single();
            }
            // 冠亚和的双的金额计算
            if(gameTenballRecord.getType1Double() >0){
                bigSamllMoney += gameTenballRecord.getType1Double();
            }

            // 冠亚和的大单·大双·小单·小双的金额计算
            if(gameTenballRecord.getBigSingle() > 0){
                otherMoney += gameTenballRecord.getBigSingle();
            }
            if(gameTenballRecord.getBigDouble() > 0){
                otherMoney += gameTenballRecord.getBigDouble();
            }
            if(gameTenballRecord.getSmallSingle() > 0){
                otherMoney += gameTenballRecord.getSmallSingle();
            }
            if(gameTenballRecord.getSmallDouble() > 0){
                otherMoney += gameTenballRecord.getSmallDouble();
            }

            //冠亚和3~19的金额计算
            Integer num1AddNum2Result = gameTenballKj.getNum1()+gameTenballKj.getNum2();

            for(int j=3;j<=19;j++){
                Object amountObject = gameTenballRecordMap.get("type1Num" + j);
                Float amount = amountObject!=null?(Float) amountObject:0f;
                if(amount > 0){
                    otherMoney += amount;
                }
                if(num1AddNum2Result == j && amount>0){
                    money += amount * getOddFromMapByOddKey(betItemMap,"num"+j);
                }
            }

            // 冠亚和大的金额计算
            if(num1AddNum2Result > 11 && gameTenballRecord.getType1Big() > 0){
                money += gameTenballRecord.getType1Big() * getOddFromMapByOddKey(betItemMap,"big");
            }

            // 冠亚和小的金额计算
            if(num1AddNum2Result <= 11 && gameTenballRecord.getType1Small() > 0){
                money += gameTenballRecord.getType1Small() * getOddFromMapByOddKey(betItemMap,"small");
            }

            // 冠亚和单的金额计算
            if(num1AddNum2Result%2 == 1 && gameTenballRecord.getType1Single() > 0){
                money += gameTenballRecord.getType1Single() * getOddFromMapByOddKey(betItemMap,"single");
            }

            // 冠亚和双的金额计算
            if(num1AddNum2Result%2 == 0 && gameTenballRecord.getType1Double() > 0){
                money += gameTenballRecord.getType1Double() * getOddFromMapByOddKey(betItemMap,"doubleFlg");
            }

            // 大单
            if(bigSingleList.contains(num1AddNum2Result) && gameTenballRecord.getBigSingle() > 0){
                money += gameTenballRecord.getBigSingle() * getOddFromMapByOddKey(betItemMap,"bigsingle");
            }
            // 大双
            if(bigDoubleList.contains(num1AddNum2Result) && gameTenballRecord.getBigDouble() > 0){
                money += gameTenballRecord.getBigDouble() * getOddFromMapByOddKey(betItemMap,"bigdouble");
            }
            // 小单
            if(smallSingleList.contains(num1AddNum2Result) && gameTenballRecord.getSmallSingle() > 0){
                money += gameTenballRecord.getSmallSingle() * getOddFromMapByOddKey(betItemMap,"smallsingle");
            }
            // 小双
            if(smallDoubleList.contains(num1AddNum2Result) && gameTenballRecord.getSmallDouble() > 0){
                money += gameTenballRecord.getSmallDouble() * getOddFromMapByOddKey(betItemMap,"smalldouble");
            }

            //冠军~第十名的金额计算
            for(int k=2;k<=11;k++){

                // 大的金额计算
                Object bigAmountObject = gameTenballRecordMap.get("type" + k + "Big");
                Float bigAmount = bigAmountObject!=null?(Float) bigAmountObject:0f;
                if(bigAmount > 0){
                    bigSamllMoney += bigAmount;
                }

                // 小的金额计算
                Object smallAmountObject = gameTenballRecordMap.get("type" + k + "Small");
                Float smallAmount = smallAmountObject!=null?(Float) smallAmountObject:0f;
                if(smallAmount > 0){
                    bigSamllMoney += smallAmount;
                }

                // 单的金额计算
                Object singleAmountObject = gameTenballRecordMap.get("type" + k + "Single");
                Float singleAmount = singleAmountObject!=null?(Float) singleAmountObject:0f;
                if(singleAmount > 0){
                    bigSamllMoney += singleAmount;
                }

                // 双的金额计算
                Object doubleAmountObject = gameTenballRecordMap.get("type" + k + "Double");
                Float doubleAmount = doubleAmountObject!=null?(Float) doubleAmountObject:0f;
                if(doubleAmount > 0){
                    bigSamllMoney += doubleAmount;
                }

                // 龙的金额计算
                Object loongAmountObject = gameTenballRecordMap.get("type" + k + "Loong");
                Float loongAmount = loongAmountObject!=null?(Float) loongAmountObject:0f;
                if(loongAmount > 0){
                    otherMoney += loongAmount;
                }

                // 虎的金额计算
                Object tigerAmountObject = gameTenballRecordMap.get("type" + k + "Tiger");
                Float tigerAmount = tigerAmountObject!=null?(Float) tigerAmountObject:0f;
                if(tigerAmount > 0){
                    otherMoney += tigerAmount;
                }

                // 买的号码1~10的金额计算
                for(int l=1;l<=10;l++){
                    Object amountObject = gameTenballRecordMap.get("type" + k +"Num" + l);
                    Float amount = amountObject!=null?(Float) amountObject:0f;
                    if(amount > 0){
                        otherMoney += amount;
                    }
                }

                // 开奖num1~10
                for(int x=1;x<=10;x++){
                    Object kjNumObject = gameTenballKjMap.get("num" + x);
                    Integer kjNum = kjNumObject!=null?(Integer) kjNumObject:0;

                    Object kj2NumObject = gameTenballKjMap.get("num" + (11-x));
                    Integer kj2Num = kj2NumObject!=null?(Integer) kj2NumObject:0;

                    Object amountObject = gameTenballRecordMap.get("type" + k +"Num" + x);
                    Float amount = amountObject!=null?(Float) amountObject:0f;

                    if(kjNum == x && amount > 0){
                        money += amount * getOddFromMapByOddKey(betItemMap,"num" + x + "Under" + (k-1));
                    }

                    // 大的金额计算
                    if(kjNum >5 && bigAmount > 0){
                        money += bigAmount * getOddFromMapByOddKey(betItemMap,"big" + x);
                    }

                    // 小的金额计算
                    if(kjNum <6 && smallAmount > 0){
                        money += smallAmount * getOddFromMapByOddKey(betItemMap,"small" + x);
                    }

                    // 单的金额计算
                    if(kjNum%2 == 1 && singleAmount > 0){
                        money += singleAmount * getOddFromMapByOddKey(betItemMap,"single" + x);
                    }

                    // 双的金额计算
                    if(kjNum%2 == 0 && doubleAmount > 0){
                        money += doubleAmount * getOddFromMapByOddKey(betItemMap,"double" + x);
                    }

                    // 龙的金额计算
                    if(kj2Num < kjNum && loongAmount > 0){
                        money += loongAmount * getOddFromMapByOddKey(betItemMap,"loong" + x);
                    }

                    // 虎的金额计算
                    if(kj2Num > kjNum && tigerAmount > 0){
                        money += tigerAmount * getOddFromMapByOddKey(betItemMap,"tiger" + x);
                    }

                }
            }

            SysUser user = sysUserService.selectUserById(gameTenballRecord.getUserId());
            user.setScore(user.getScore() + gameTenballRecord.getCountMoney());
            if(money > 0){
                user.setAmount(user.getAmount() + money);
            }
            sysUserService.updateUserAmount(user);

            Userwin userwin = userwinService.selectTodayUserwin(gameInfo.getGameId(),gameTenballRecord.getUserId());
            if(userwin == null){
                userwin = new Userwin();
                userwin.setGameId(gameInfo.getGameId());
                userwin.setGameName(gameInfo.getGameName());
                userwin.setUserId(gameTenballRecord.getUserId());
                userwin.setWinMoney(money - gameTenballRecord.getCountMoney());
                userwin.setBigSmallMoney(bigSamllMoney);
                userwin.setOtherMoney(otherMoney);
                userwin.setCreateBy("lotteryTenball");

                userwinService.insertUserwin(userwin);
            }else{

                userwin.setWinMoney(userwin.getWinMoney() + (money - gameTenballRecord.getCountMoney()));
                userwin.setBigSmallMoney(userwin.getBigSmallMoney() + bigSamllMoney);
                userwin.setOtherMoney(userwin.getOtherMoney() + otherMoney);
                userwin.setCreateBy("lotteryTenball");
                userwinService.updateUserwin(userwin);
            }

            gameTenballRecord.setWinMoney(money);
            gameTenballRecord.setStatus("1");
            gameTenballRecord.setNum1(gameTenballKj.getNum1());
            gameTenballRecord.setNum2(gameTenballKj.getNum2());
            gameTenballRecord.setNum3(gameTenballKj.getNum3());
            gameTenballRecord.setNum4(gameTenballKj.getNum4());
            gameTenballRecord.setNum5(gameTenballKj.getNum5());
            gameTenballRecord.setNum6(gameTenballKj.getNum6());
            gameTenballRecord.setNum7(gameTenballKj.getNum7());
            gameTenballRecord.setNum8(gameTenballKj.getNum8());
            gameTenballRecord.setNum9(gameTenballKj.getNum9());
            gameTenballRecord.setNum10(gameTenballKj.getNum10());
            gameTenballRecord.setSumNum(gameTenballKj.getNum1() + gameTenballKj.getNum2());
            gameTenballRecord.setUpdateBy("lotteryTenball");

            gameTenballRecordService.updateGameTenballRecord(gameTenballRecord);

            if(money > 0){
                Usermoney usermoney = new Usermoney();
                usermoney.setUserId(gameTenballRecord.getUserId());
                usermoney.setCashContent("【澳洲幸运10】中奖-" + periodId);
                usermoney.setCashMoney(money);
                usermoney.setUserBalance(user.getAmount());
                usermoney.setType("8");
                usermoney.setGameId(gameInfo.getGameId());
                usermoney.setGameName(gameInfo.getGameName());
                usermoneyService.insertUsermoney(usermoney);
            }

            adminWinMoney += gameTenballRecord.getCountMoney() - money;
            Float accountResult = money - gameTenballRecord.getCountMoney();

            BetRecord betRecord = new BetRecord();
            betRecord.setUserId(gameTenballRecord.getUserId());
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
            todayAdminwin.setCreateBy("lotteryTenball");

            adminwinService.insertAdminwin(todayAdminwin);
        }else{
            todayAdminwin.setWinMoney(adminWinMoney +todayAdminwin.getWinMoney());
            todayAdminwin.setUpdateBy("lotteryTenball");
            adminwinService.updateAdminwin(todayAdminwin);
        }

        RecordSumRespVo recordSumRespVo = gameTenballRecordService.selectSumRecordByPeriodId(gameInfo.getGameId(), periodId);
        gameTenballKj.setCountMoney(recordSumRespVo.getCountMoney());
        gameTenballKj.setWinMoney(recordSumRespVo.getWinMoney());
        gameTenballKjService.updateGameTenballKjTotalAmountByPeriodId(gameTenballKj);
    }

    private Float getOddFromMapByOddKey(Map<String , SysBetItem> betItemMap, String betItemCode){
        Float odd = 0f;
        if(betItemMap.containsKey(betItemCode)){
            odd = betItemMap.get(betItemCode).getOdd();
        }

        return odd;
    }

}
