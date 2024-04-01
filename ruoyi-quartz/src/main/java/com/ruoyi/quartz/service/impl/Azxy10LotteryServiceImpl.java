package com.ruoyi.quartz.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.EntityMapTransUtils;
import com.ruoyi.quartz.service.Azxy10LotteryService;
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
public class Azxy10LotteryServiceImpl implements Azxy10LotteryService {

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private IAzxy10Service azxy10Service;

    @Autowired
    private IAzxy10kjService azxy10kjService;

    @Autowired
    private IAzxy10recordService azxy10recordService;

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
    public void lotteryAzxy10(String gameCode) {

        SysGame gameInfo = sysGameService.selectSysGameByGameMarkId(gameCode);
        if(gameInfo == null){
            throw new ServiceException("没有澳洲幸运10游戏基础表数据");
        }
        if(gameInfo.getLotteryInterval() == 0){
            throw new ServiceException("开奖间隔为空,定时开奖结算失败");
        }

        Azxy10kj existAzxy10kj = azxy10kjService.selectLastRecord("");

        Azxy10 azxy10Info = azxy10Service.selectLastRecord();

        Long jiange = 0l;
        if(azxy10Info == null){
            throw new ServiceException("澳洲幸运10没有开奖数据，请先同步开奖数据");
        }

        Azxy10kj searchAzxy10kj = new Azxy10kj();
        searchAzxy10kj.setStatus("0");
        List<Azxy10kj> notOpenAzxy10kjList = azxy10kjService.selectAzxy10kjList(searchAzxy10kj);
        if(notOpenAzxy10kjList != null && notOpenAzxy10kjList.size() > 0){
            jiange = azxy10Info.getId() - notOpenAzxy10kjList.get(0).getId();
        }

        if(jiange >= 0){
            List<Azxy10kj> azxy10kjList = azxy10kjService.selectAzxy10kjListWithStatusZeroAndLimit(azxy10Info.getId(),"0",null,"1",50);
            for (Azxy10kj azxy10kj : azxy10kjList){
                azxy10kj.setStatus("2");
                azxy10kj.setUpdateBy("lotteryAzxy10Balance");
                azxy10kjService.updateAzxy10kj(azxy10kj);
            }
            CreateAzxy10Data(gameInfo);
        }

        if(existAzxy10kj != null){
            SingleAzxy10Update(gameInfo);
            CreateAzxy10Data(gameInfo);
        }else{
            CreateAzxy10All(gameInfo);
        }
    }



    public void CreateAzxy10Data(SysGame gameInfo){
        List<Azxy10kj> azxy10kjList = azxy10kjService.selectAzxy10kjListWithStatusZeroAndLimit(null,"0",null,"1",null);
        if(azxy10kjList.size() == 2){
            return;
//            throw new ServiceException("CreateAzxy10Data return false1");
        }
        Azxy10 azxy10Info = azxy10Service.selectLastRecord();
        if(azxy10Info == null){
            throw new ServiceException("CreateAzxy10Data return false2");
        }
        Azxy10kj firstAzxy10kj = azxy10kjService.selectAzxy10kjById(azxy10Info.getId() + 1);

        Azxy10kj newAzxy10kj = new Azxy10kj();
        newAzxy10kj.setStatus("0");
        newAzxy10kj.setCreateBy("CreateAzxy10Data");

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String timeStr = formatter.format(azxy10Info.getTime());
        String minStr = timeStr.substring(15,16);
        Date time = null;
        if(Integer.parseInt(minStr) <5 && azxy10Info.getId()%2 == 0){
            String dateStr = timeStr.substring(0,15) + "3:45";
            try {
                time = formatter.parse(dateStr);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
        }else if(Integer.parseInt(minStr) > 5 || azxy10Info.getId()%2 != 0){
            String dateStr = timeStr.substring(0,15) + "8:45";
            try {
                time = formatter.parse(dateStr);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
        }else{
            time = azxy10Info.getTime();
        }

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(time);

        if(azxy10kjList.size() == 0 && firstAzxy10kj == null){
            newAzxy10kj.setId(azxy10Info.getId() + 1);

            //预计开奖时间
            calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval());
            calendar.add(Calendar.SECOND, gameInfo.getLeadTime());
            newAzxy10kj.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newAzxy10kj.setBetTime(calendar.getTime());
        }else if(azxy10kjList.size() == 1 && firstAzxy10kj != null){
            Azxy10kj secondAzxy10kj = azxy10kjService.selectAzxy10kjById(azxy10Info.getId() + 2);
            if(secondAzxy10kj != null){
                throw new ServiceException("CreateAzxy10Data return false3 ID: " + (azxy10Info.getId() + 2));
            }
            newAzxy10kj.setId(azxy10Info.getId() + 2);

            //预计开奖时间
            calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval()*2);
            calendar.add(Calendar.SECOND, gameInfo.getLeadTime());
            newAzxy10kj.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newAzxy10kj.setBetTime(calendar.getTime());
        }else{
            throw new ServiceException("CreateAzxy10Data return false4");
        }
        azxy10kjService.insertAzxy10kj(newAzxy10kj);
        CreateAzxy10Data(gameInfo);
    }

    public void CreateAzxy10All(SysGame gameInfo){
        List<Azxy10> azxy10List = azxy10Service.selectAzxy10ListByParam("1",5);
        for(Azxy10 azxy10 :azxy10List){
            Azxy10kj newAzxy10kj = new Azxy10kj();

            newAzxy10kj.setId(azxy10.getId());
            newAzxy10kj.setNum1(azxy10.getNum1());
            newAzxy10kj.setNum2(azxy10.getNum2());
            newAzxy10kj.setNum3(azxy10.getNum3());
            newAzxy10kj.setNum4(azxy10.getNum4());
            newAzxy10kj.setNum5(azxy10.getNum5());
            newAzxy10kj.setNum6(azxy10.getNum6());
            newAzxy10kj.setNum7(azxy10.getNum7());
            newAzxy10kj.setNum8(azxy10.getNum8());
            newAzxy10kj.setNum9(azxy10.getNum9());
            newAzxy10kj.setNum10(azxy10.getNum10());

            newAzxy10kj.setStatus("1");
            // 开奖时间
            newAzxy10kj.setTheTime(azxy10.getTime());

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(azxy10.getTime());
            //预计开奖时间(比实际开奖时间少10s)
            calendar.add(Calendar.SECOND, -5);
            newAzxy10kj.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newAzxy10kj.setBetTime(calendar.getTime());

            azxy10kjService.insertAzxy10kj(newAzxy10kj);
        }

        CreateAzxy10Data(gameInfo);
    }

    public void SingleAzxy10Update(SysGame gameInfo){

        List<Azxy10kj> azxy10kjList = azxy10kjService.selectAzxy10kjListWithStatusZeroAndLimit(null,"0","1",null,1);

        if(azxy10kjList == null || azxy10kjList.size() == 0){
            return;
        }
        Azxy10kj azxy10kj = azxy10kjList.get(0);

        Azxy10 azxy10 = azxy10Service.selectAzxy10ById(azxy10kj.getId());
        if(azxy10 == null){
            return;
        }

        azxy10kj.setNum1(azxy10.getNum1());
        azxy10kj.setNum2(azxy10.getNum2());
        azxy10kj.setNum3(azxy10.getNum3());
        azxy10kj.setNum4(azxy10.getNum4());
        azxy10kj.setNum5(azxy10.getNum5());
        azxy10kj.setNum6(azxy10.getNum6());
        azxy10kj.setNum7(azxy10.getNum7());
        azxy10kj.setNum8(azxy10.getNum8());
        azxy10kj.setNum9(azxy10.getNum9());
        azxy10kj.setNum10(azxy10.getNum10());
        azxy10kj.setStatus("1"); //开奖
        azxy10kj.setTheTime(azxy10.getTime());

        int updateInt = azxy10kjService.updateAzxy10kj(azxy10kj);
        if(updateInt > 0){
            lotteryAzxy10(gameInfo, azxy10kj.getId());
            CreateAzxy10Data(gameInfo);

            // 补漏
            List<Azxy10kj> notOpenAzxy10kjList = azxy10kjService.selectAzxy10kjListWithStatusZeroAndLimit(azxy10kj.getId(),"0",null,"1",1);
            if(notOpenAzxy10kjList != null && notOpenAzxy10kjList.size() >0){
                lotteryAzxy10(gameInfo, notOpenAzxy10kjList.get(0).getId());
            }
        }
    }

    public void lotteryAzxy10(SysGame gameInfo, Long periodId){
        Azxy10record searchAzxy10Record = new Azxy10record();
        searchAzxy10Record.setStatus("0");
        searchAzxy10Record.setPeriods(periodId);
        List<Azxy10record> azxy10recordList = azxy10recordService.selectAzxy10recordList(searchAzxy10Record);

        if(azxy10recordList == null || azxy10recordList.size() == 0){
            return;
        }

        Azxy10kj azxy10kj = azxy10kjService.selectAzxy10kjById(periodId);
        Float adminWinMoney = 0f;
        String gameResult = azxy10kj.getNum1() + "+" +
                azxy10kj.getNum2() + "+" +
                azxy10kj.getNum3() + "+" +
                azxy10kj.getNum4() + "+" +
                azxy10kj.getNum5() + "+" +
                azxy10kj.getNum6() + "+" +
                azxy10kj.getNum7() + "+" +
                azxy10kj.getNum8() + "+" +
                azxy10kj.getNum9() + "+" +
                azxy10kj.getNum10();

        SysBetItem searchBetItem = new SysBetItem();
        searchBetItem.setGameId(gameInfo.getGameId());
        searchBetItem.setStatus("0");

        List<SysBetItem> gameBetItem = sysBetItemService.selectSysBetItemList(searchBetItem);
//        Map<String, SysBetItem> betItemMap = gameBetItem.stream()
//                .collect(Collectors.toMap(SysBetItem::getBetItemCode, item -> item));

        Map<String , SysBetItem> betItemMap = gameBetItem.stream()
                .collect(Collectors.toMap(
                        SysBetItem::getBetItemCode,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        Map<String, Object> azxy10kjMap = EntityMapTransUtils.entityToMap1(azxy10kj);
        List<Integer> bigSingleList = Arrays.asList(13, 15, 17, 19);
        List<Integer> smallSingleList = Arrays.asList(3, 5, 7, 9, 11);
        List<Integer> bigDoubleList = Arrays.asList(12, 14, 16, 18);
        List<Integer> smallDoubleList = Arrays.asList(4, 6, 8, 10);

        for(Azxy10record azxy10record : azxy10recordList){
            Float money = 0f;
            Float bigSamllMoney = 0f;
            Float otherMoney = 0f;

            Map<String, Object> azxy10RecordMap = EntityMapTransUtils.entityToMap1(azxy10record);

            // 大小单双的金额计算
//            for(int i=1;i<=11;i++){
//                Object bigAmountObject = azxy10RecordMap.get("type" + i + "_big");
//                Float bigAmount = bigAmountObject!=null?(Float) bigAmountObject:0f;
//                if(bigAmount > 0){
//                    bigSamllMoney += bigAmount;
//                }
//
//                Object smallAmountObject = azxy10RecordMap.get("type" + i + "_small");
//                Float smallAmount = smallAmountObject!=null?(Float) smallAmountObject:0f;
//                if(smallAmount > 0){
//                    bigSamllMoney += smallAmount;
//                }
//
//                Object singleAmountObject = azxy10RecordMap.get("type" + i + "_single");
//                Float singleAmount = singleAmountObject!=null?(Float) singleAmountObject:0f;
//                if(singleAmount > 0){
//                    bigSamllMoney += singleAmount;
//                }
//
//                Object doubleAmountObject = azxy10RecordMap.get("type" + i + "_double");
//                Float doubleAmount = doubleAmountObject!=null?(Float) doubleAmountObject:0f;
//                if(doubleAmount > 0){
//                    bigSamllMoney += doubleAmount;
//                }
//            }
            // 冠亚和的大小单双的金额计算
            if(azxy10record.getType1Big() >0){
                bigSamllMoney += azxy10record.getType1Big();
            }
            // 冠亚和的小的金额计算
            if(azxy10record.getType1Small() >0){
                bigSamllMoney += azxy10record.getType1Small();
            }
            // 冠亚和的单的金额计算
            if(azxy10record.getType1Single() >0){
                bigSamllMoney += azxy10record.getType1Single();
            }
            // 冠亚和的双的金额计算
            if(azxy10record.getType1Double() >0){
                bigSamllMoney += azxy10record.getType1Double();
            }

            // 冠亚和的大单·大双·小单·小双的金额计算
            if(azxy10record.getBigSingle() > 0){
                otherMoney += azxy10record.getBigSingle();
            }
            if(azxy10record.getBigDouble() > 0){
                otherMoney += azxy10record.getBigDouble();
            }
            if(azxy10record.getSmallSingle() > 0){
                otherMoney += azxy10record.getSmallSingle();
            }
            if(azxy10record.getSmallDouble() > 0){
                otherMoney += azxy10record.getSmallDouble();
            }

            //冠亚和3~19的金额计算
            Integer num1AddNum2Result = azxy10kj.getNum1()+azxy10kj.getNum2();

            for(int j=3;j<=19;j++){
                Object amountObject = azxy10RecordMap.get("type1Num" + j);
                Float amount = amountObject!=null?(Float) amountObject:0f;
                if(amount > 0){
                    otherMoney += amount;
                }
                if(num1AddNum2Result == j && amount>0){
                    money += amount * getOddFromMapByOddKey(betItemMap,"num"+j);
                }
            }

            // 冠亚和大的金额计算
            if(num1AddNum2Result > 11 && azxy10record.getType1Big() > 0){
                money += azxy10record.getType1Big() * getOddFromMapByOddKey(betItemMap,"big");
            }

            // 冠亚和小的金额计算
            if(num1AddNum2Result <= 11 && azxy10record.getType1Small() > 0){
                money += azxy10record.getType1Small() * getOddFromMapByOddKey(betItemMap,"small");
            }

            // 冠亚和单的金额计算
            if(num1AddNum2Result%2 == 1 && azxy10record.getType1Single() > 0){
                money += azxy10record.getType1Single() * getOddFromMapByOddKey(betItemMap,"single");
            }

            // 冠亚和双的金额计算
            if(num1AddNum2Result%2 == 0 && azxy10record.getType1Double() > 0){
                money += azxy10record.getType1Double() * getOddFromMapByOddKey(betItemMap,"doubleFlg");
            }

            // 大单
            if(bigSingleList.contains(num1AddNum2Result) && azxy10record.getBigSingle() > 0){
                money += azxy10record.getBigSingle() * getOddFromMapByOddKey(betItemMap,"bigsingle");
            }
            // 大双
            if(bigDoubleList.contains(num1AddNum2Result) && azxy10record.getBigDouble() > 0){
                money += azxy10record.getBigDouble() * getOddFromMapByOddKey(betItemMap,"bigdouble");
            }
            // 小单
            if(smallSingleList.contains(num1AddNum2Result) && azxy10record.getSmallSingle() > 0){
                money += azxy10record.getSmallSingle() * getOddFromMapByOddKey(betItemMap,"smallsingle");
            }
            // 小双
            if(smallDoubleList.contains(num1AddNum2Result) && azxy10record.getSmallDouble() > 0){
                money += azxy10record.getSmallDouble() * getOddFromMapByOddKey(betItemMap,"smalldouble");
            }

            //冠军~第十名的金额计算
            for(int k=2;k<=11;k++){

                // 大的金额计算
                Object bigAmountObject = azxy10RecordMap.get("type" + k + "Big");
                Float bigAmount = bigAmountObject!=null?(Float) bigAmountObject:0f;
                if(bigAmount > 0){
                    bigSamllMoney += bigAmount;
                }

                // 小的金额计算
                Object smallAmountObject = azxy10RecordMap.get("type" + k + "Small");
                Float smallAmount = smallAmountObject!=null?(Float) smallAmountObject:0f;
                if(smallAmount > 0){
                    bigSamllMoney += smallAmount;
                }

                // 单的金额计算
                Object singleAmountObject = azxy10RecordMap.get("type" + k + "Single");
                Float singleAmount = singleAmountObject!=null?(Float) singleAmountObject:0f;
                if(singleAmount > 0){
                    bigSamllMoney += singleAmount;
                }

                // 双的金额计算
                Object doubleAmountObject = azxy10RecordMap.get("type" + k + "Double");
                Float doubleAmount = doubleAmountObject!=null?(Float) doubleAmountObject:0f;
                if(doubleAmount > 0){
                    bigSamllMoney += doubleAmount;
                }

                // 龙的金额计算
                Object loongAmountObject = azxy10RecordMap.get("type" + k + "Loong");
                Float loongAmount = loongAmountObject!=null?(Float) loongAmountObject:0f;
                if(loongAmount > 0){
                    otherMoney += loongAmount;
                }

                // 虎的金额计算
                Object tigerAmountObject = azxy10RecordMap.get("type" + k + "Tiger");
                Float tigerAmount = tigerAmountObject!=null?(Float) tigerAmountObject:0f;
                if(tigerAmount > 0){
                    otherMoney += tigerAmount;
                }

                // 买的号码1~10的金额计算
                for(int l=1;l<=10;l++){
                    Object amountObject = azxy10RecordMap.get("type" + k +"Num" + l);
                    Float amount = amountObject!=null?(Float) amountObject:0f;
                    if(amount > 0){
                        otherMoney += amount;
                    }
                }

                // 开奖num1~10
                for(int x=1;x<=10;x++){
                    Object kjNumObject = azxy10kjMap.get("num" + x);
                    Integer kjNum = kjNumObject!=null?(Integer) kjNumObject:0;

                    Object kj2NumObject = azxy10kjMap.get("num" + (11-x));
                    Integer kj2Num = kj2NumObject!=null?(Integer) kj2NumObject:0;

                    Object amountObject = azxy10RecordMap.get("type" + k +"Num" + x);
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

            SysUser user = sysUserService.selectUserById(azxy10record.getUserId());
            user.setScore(user.getScore() + azxy10record.getCountMoney());
            if(money > 0){
                user.setAmount(user.getAmount() + money);
            }
            sysUserService.updateUserAmount(user);

            Userwin userwin = userwinService.selectTodayUserwin(gameInfo.getGameId(),azxy10record.getUserId());
            if(userwin == null){
                userwin = new Userwin();
                userwin.setGameId(gameInfo.getGameId());
                userwin.setGameName(gameInfo.getGameName());
                userwin.setUserId(azxy10record.getUserId());
                userwin.setWinMoney(money - azxy10record.getCountMoney());
                userwin.setCreateBy("lotteryAzxy10");

                userwinService.insertUserwin(userwin);
            }else{

                userwin.setWinMoney(userwin.getWinMoney() + (money - azxy10record.getCountMoney()));
                userwin.setCreateBy("lotteryAzxy10");
                userwinService.updateUserwin(userwin);
            }

            azxy10record.setWinMoney(money);
            azxy10record.setStatus("1");
            azxy10record.setNum1(azxy10kj.getNum1());
            azxy10record.setNum2(azxy10kj.getNum2());
            azxy10record.setNum3(azxy10kj.getNum3());
            azxy10record.setNum4(azxy10kj.getNum4());
            azxy10record.setNum5(azxy10kj.getNum5());
            azxy10record.setNum6(azxy10kj.getNum6());
            azxy10record.setNum7(azxy10kj.getNum7());
            azxy10record.setNum8(azxy10kj.getNum8());
            azxy10record.setNum9(azxy10kj.getNum9());
            azxy10record.setNum10(azxy10kj.getNum10());
            azxy10record.setSumNum(azxy10kj.getNum1() + azxy10kj.getNum2());
            azxy10record.setUpdateBy("lotteryAzxy10");

            azxy10recordService.updateAzxy10record(azxy10record);

            if(money > 0){
                Usermoney usermoney = new Usermoney();
                usermoney.setUserId(azxy10record.getUserId());
                usermoney.setCashContent("【澳洲幸运10】中奖-" + periodId);
                usermoney.setCashMoney(money);
                usermoney.setUserBalance(user.getAmount());
                usermoney.setType("8");
                usermoney.setGameId(gameInfo.getGameId());
                usermoney.setGameName(gameInfo.getGameName());
                usermoneyService.insertUsermoney(usermoney);
            }

            adminWinMoney += azxy10record.getCountMoney() - money;
            Float accountResult = money - azxy10record.getCountMoney();

            BetRecord betRecord = new BetRecord();
            betRecord.setUserId(azxy10record.getUserId());
            betRecord.setGameId(gameInfo.getGameId());
            betRecord.setPeriods(periodId);
            betRecord.setSettleFlg("0");
            betRecord.setIsDelete("0");
            betRecord.setGameResult(gameResult);
            betRecord.setAccountResult(accountResult);

            betRecordService.updateLotteryResult(betRecord);
//            if(azxy10kj.getNum1() >5 && azxy10record.getType2Big() > 0){
//                money += azxy10record.getType2Big() * betItemMap.get("big1").getOdd();
//            }
//            if(azxy10kj.getNum1() <6 && azxy10record.getType2Small() > 0){
//                money += azxy10record.getType2Small() * betItemMap.get("small1").getOdd();
//            }
//            if(azxy10kj.getNum1()%2 == 1 && azxy10record.getType2Single() > 0){
//                money += azxy10record.getType2Single() * betItemMap.get("single1").getOdd();
//            }
//            if(azxy10kj.getNum1()%2 == 0 && azxy10record.getType2Double() > 0){
//                money += azxy10record.getType2Double() * betItemMap.get("double1").getOdd();
//            }

//            if(azxy10kj.getNum1() == 1 && azxy10record.getType2Num1() > 0){
//                money += azxy10record.getType2Num1() * betItemMap.get("num1Under1").getOdd();
//            }
//            if(azxy10kj.getNum1() == 2 && azxy10record.getType2Num2() > 0){
//                money += azxy10record.getType2Num2() * betItemMap.get("num2Under1").getOdd();
//            }
//            if(azxy10kj.getNum1() == 3 && azxy10record.getType2Num3() > 0){
//                money += azxy10record.getType2Num3() * betItemMap.get("num3Under1").getOdd();
//            }
//            if(azxy10kj.getNum1() == 4 && azxy10record.getType2Num4() > 0){
//                money += azxy10record.getType2Num4() * betItemMap.get("num4Under1").getOdd();
//            }
//            if(azxy10kj.getNum1() == 5 && azxy10record.getType2Num5() > 0){
//                money += azxy10record.getType2Num5() * betItemMap.get("num5Under1").getOdd();
//            }
//            if(azxy10kj.getNum1() == 6 && azxy10record.getType2Num6() > 0){
//                money += azxy10record.getType2Num6() * betItemMap.get("num6Under1").getOdd();
//            }
//            if(azxy10kj.getNum1() == 7 && azxy10record.getType2Num7() > 0){
//                money += azxy10record.getType2Num7() * betItemMap.get("num7Under1").getOdd();
//            }
//            if(azxy10kj.getNum1() == 8 && azxy10record.getType2Num8() > 0){
//                money += azxy10record.getType2Num8() * betItemMap.get("num8Under1").getOdd();
//            }
//            if(azxy10kj.getNum1() == 9 && azxy10record.getType2Num9() > 0){
//                money += azxy10record.getType2Num9() * betItemMap.get("num9Under1").getOdd();
//            }
//            if(azxy10kj.getNum1() == 10 && azxy10record.getType2Num10() > 0){
//                money += azxy10record.getType2Num10() * betItemMap.get("num10Under1").getOdd();
//            }
            // 冠亚和金额计算
            // 冠亚和3~19金额计算
//            for(int x=3;x<=19;x++){
//                Integer num1AddNum2Result = azxy10kj.getNum1()+azxy10kj.getNum2();
//                Object amountObject = azxy10RecordMap.get("type1_num" + x);
//                Float amount = amountObject!=null?(Float) amountObject:0f;
//                if(num1AddNum2Result == x && amount>0){
//                    money += amount * betItemMap.get("num"+x).getOdd();
//                }
//            }
//            if((azxy10kj.getNum1()+azxy10kj.getNum2()) == 3 && azxy10record.getType1Num3() > 0){
//                money += azxy10record.getType1Num3() * betItemMap.get("num3").getOdd();
//            }
//            // 冠亚和4金额计算
//            if((azxy10kj.getNum1()+azxy10kj.getNum2()) == 4 && azxy10record.getType1Num4() > 0){
//                money += azxy10record.getType1Num4() * betItemMap.get("num4").getOdd();
//            }
//            // 冠亚和5金额计算
//            if((azxy10kj.getNum1()+azxy10kj.getNum2()) == 5 && azxy10record.getType1Num5() > 0){
//                money += azxy10record.getType1Num5() * betItemMap.get("num5").getOdd();
//            }
//            // 冠亚和6金额计算
//            if((azxy10kj.getNum1()+azxy10kj.getNum2()) == 6 && azxy10record.getType1Num6() > 0){
//                money += azxy10record.getType1Num6() * betItemMap.get("num6").getOdd();
//            }
//            // 冠亚和7金额计算
//            if((azxy10kj.getNum1()+azxy10kj.getNum2()) == 7 && azxy10record.getType1Num7() > 0){
//                money += azxy10record.getType1Num7() * betItemMap.get("num7").getOdd();
//            }
//            // 冠亚和8金额计算
//            if((azxy10kj.getNum1()+azxy10kj.getNum2()) == 8 && azxy10record.getType1Num8() > 0){
//                money += azxy10record.getType1Num8() * betItemMap.get("num8").getOdd();
//            }
//            // 冠亚和9金额计算
//            if((azxy10kj.getNum1()+azxy10kj.getNum2()) == 9 && azxy10record.getType1Num9() > 0){
//                money += azxy10record.getType1Num9() * betItemMap.get("num9").getOdd();
//            }
//            // 冠亚和10金额计算
//            if((azxy10kj.getNum1()+azxy10kj.getNum2()) == 10 && azxy10record.getType1Num10() > 0){
//                money += azxy10record.getType1Num10() * betItemMap.get("num10").getOdd();
//            }
//            // 冠亚和11金额计算
//            if((azxy10kj.getNum1()+azxy10kj.getNum2()) == 11 && azxy10record.getType1Num11() > 0){
//                money += azxy10record.getType1Num11() * betItemMap.get("num11").getOdd();
//            }
//            // 冠亚和12金额计算
//            if((azxy10kj.getNum1()+azxy10kj.getNum2()) == 12 && azxy10record.getType1Num12() > 0){
//                money += azxy10record.getType1Num12() * betItemMap.get("num12").getOdd();
//            }
//            // 冠亚和13金额计算
//            if((azxy10kj.getNum1()+azxy10kj.getNum2()) == 13 && azxy10record.getType1Num13() > 0){
//                money += azxy10record.getType1Num13() * betItemMap.get("num13").getOdd();
//            }
//            // 冠亚和14金额计算
//            if((azxy10kj.getNum1()+azxy10kj.getNum2()) == 14 && azxy10record.getType1Num14() > 0){
//                money += azxy10record.getType1Num14() * betItemMap.get("num14").getOdd();
//            }
//            // 冠亚和15金额计算
//            if((azxy10kj.getNum1()+azxy10kj.getNum2()) == 15 && azxy10record.getType1Num15() > 0){
//                money += azxy10record.getType1Num15() * betItemMap.get("num15").getOdd();
//            }
//            // 冠亚和16金额计算
//            if((azxy10kj.getNum1()+azxy10kj.getNum2()) == 16 && azxy10record.getType1Num16() > 0){
//                money += azxy10record.getType1Num16() * betItemMap.get("num160").getOdd();
//            }
//            // 冠亚和17金额计算
//            if((azxy10kj.getNum1()+azxy10kj.getNum2()) == 17 && azxy10record.getType1Num17() > 0){
//                money += azxy10record.getType1Num17() * betItemMap.get("num17").getOdd();
//            }
//            // 冠亚和18金额计算
//            if((azxy10kj.getNum1()+azxy10kj.getNum2()) == 18 && azxy10record.getType1Num18() > 0){
//                money += azxy10record.getType1Num18() * betItemMap.get("num18").getOdd();
//            }
//            // 冠亚和19金额计算
//            if((azxy10kj.getNum1()+azxy10kj.getNum2()) == 19 && azxy10record.getType1Num19() > 0){
//                money += azxy10record.getType1Num19() * betItemMap.get("num19").getOdd();
//            }
//            if(azxy10kj.getNum1() == 1 && azxy10record.getType2Num1() > 0){
//                money += azxy10record.getType2Num1() * betItemMap.get("num1Under1").getOdd();
//            }

        }

        Adminwin todayAdminwin = adminwinService.selectTodayAdminwin(gameInfo.getGameId());
        if(todayAdminwin == null){
            todayAdminwin = new Adminwin();
            todayAdminwin.setGameId(gameInfo.getGameId());
            todayAdminwin.setGameName(gameInfo.getGameName());
            todayAdminwin.setWinMoney(adminWinMoney);
            todayAdminwin.setCreateBy("lotteryAzxy10");

            adminwinService.insertAdminwin(todayAdminwin);
        }else{
            todayAdminwin.setWinMoney(adminWinMoney +todayAdminwin.getWinMoney());
            todayAdminwin.setUpdateBy("lotteryAzxy10");
            adminwinService.updateAdminwin(todayAdminwin);
        }

        RecordSumRespVo recordSumRespVo = azxy10recordService.selectSumRecordByPeriodId(periodId);
        if(recordSumRespVo != null){
            Azxy10record updateAzxy10record = new Azxy10record();
            updateAzxy10record.setPeriods(periodId);
            updateAzxy10record.setCountMoney(recordSumRespVo.getCountMoney());
            updateAzxy10record.setWinMoney(recordSumRespVo.getWinMoney());
            azxy10recordService.updateAzxy10recordTotalAmountByPeriodId(updateAzxy10record);
        }
    }

    private Float getOddFromMapByOddKey(Map<String , SysBetItem> betItemMap, String betItemCode){
        Float odd = 0f;
        if(betItemMap.containsKey(betItemCode)){
            odd = betItemMap.get(betItemCode).getOdd();
        }

        return odd;
    }

}
