package com.ruoyi.quartz.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.EntityMapTransUtils;
import com.ruoyi.quartz.service.Jnd28LotteryService;
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
public class Jnd28LotteryServiceImpl implements Jnd28LotteryService {

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private IJndService jndService;

    @Autowired
    private IJnd28Service jnd28Service;

    @Autowired
    private IJndrecordService jndrecordService;

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
    public void lotteryJnd28(String gameCode) {

        SysGame gameInfo = sysGameService.selectSysGameByGameMarkId(gameCode);
        if(gameInfo == null){
            throw new ServiceException("没有加拿大2.8游戏基础表数据");
        }
        if(gameInfo.getLotteryInterval() == 0){
            throw new ServiceException("开奖间隔为空,定时开奖结算失败");
        }

        Jnd28 existJnd28 = jnd28Service.selectLastRecord("");

        Jnd jndInfo = jndService.selectLastRecord();

        Long jiange = 0l;
        if(jndInfo == null){
            throw new ServiceException("加拿大2.8没有开奖数据，请先同步开奖数据");
        }

        Jnd28 searchJnd28 = new Jnd28();
        searchJnd28.setStatus("0");
        List<Jnd28> notOpenJnd28List = jnd28Service.selectJnd28List(searchJnd28);
        if(notOpenJnd28List != null && notOpenJnd28List.size() > 0){
            jiange = jndInfo.getId() - notOpenJnd28List.get(0).getId();
        }

        if(jiange >= 0){
            List<Jnd28> jnd28List = jnd28Service.selectJnd28ListWithStatusZeroAndLimit(jndInfo.getId(),"0",null,"1",50);
            for (Jnd28 jnd28 : jnd28List){
                jnd28.setStatus("2");
                jnd28.setUpdateBy("lotteryJndBalance");
                jnd28Service.updateJnd28(jnd28);
            }
            CreateJndData(gameInfo);
        }
        if(existJnd28 != null){
            SingleJndUpdate(gameInfo);
            CreateJndData(gameInfo);
        }else{
            CreateJndAll(gameInfo);
        }

    }

    public void CreateJndData(SysGame gameInfo){
        List<Jnd28> jnd28List = jnd28Service.selectJnd28ListWithStatusZeroAndLimit(null,"0",null,"1",null);
        if(jnd28List.size() == 2){
            return;
//            throw new ServiceException("CreateJndData return false1");
        }
        Jnd jndInfo = jndService.selectLastRecord();
        if(jndInfo == null){
            throw new ServiceException("CreateJndData return false2");
        }
        Jnd28 firstJnd28 = jnd28Service.selectJnd28ById(jndInfo.getId() + 1);

        Jnd28 newJnd28 = new Jnd28();
        newJnd28.setStatus("0");
        newJnd28.setCreateBy("CreateJndData");

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(jndInfo.getTime());

        if(jnd28List.size() == 0 && firstJnd28 == null){
            newJnd28.setId(jndInfo.getId() + 1);

            //预计开奖时间
            calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval());
            calendar.add(Calendar.SECOND, gameInfo.getLeadTime());
            newJnd28.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newJnd28.setBetTime(calendar.getTime());
        }else if(jnd28List.size() == 1 && firstJnd28 != null){
            Jnd28 secondJnd28 = jnd28Service.selectJnd28ById(jndInfo.getId() + 2);
            if(secondJnd28 != null){
                throw new ServiceException("CreateJndData return false3 ID: " + (jndInfo.getId() + 2));
            }
            newJnd28.setId(jndInfo.getId() + 2);

            //预计开奖时间
            calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval()*2);
            calendar.add(Calendar.SECOND, gameInfo.getLeadTime());
            newJnd28.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newJnd28.setBetTime(calendar.getTime());
        }else{
            throw new ServiceException("CreateJndData return false4");
        }
        jnd28Service.insertJnd28(newJnd28);
        CreateJndData(gameInfo);
    }

    public void CreateJndAll(SysGame gameInfo){
        List<Jnd> jndList = jndService.selectJndListByParam("1",5);
        for(Jnd jnd :jndList){
            Jnd28 newJnd28 = new Jnd28();

            newJnd28.setId(jnd.getId());
            newJnd28.setNum1(jnd.getSum1());
            newJnd28.setNum2(jnd.getSum2());
            newJnd28.setNum3(jnd.getSum3());
            newJnd28.setSumNum(jnd.getSum1() + jnd.getSum2());

            newJnd28.setStatus("1");
            // 开奖时间
            newJnd28.setTheTime(jnd.getTime());

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(jnd.getTime());
            //预计开奖时间(比实际开奖时间少10s)
            calendar.add(Calendar.SECOND, -5);
            newJnd28.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newJnd28.setBetTime(calendar.getTime());

            jnd28Service.insertJnd28(newJnd28);
        }

        CreateJndData(gameInfo);
    }

    public void SingleJndUpdate(SysGame gameInfo){

        List<Jnd28> jnd28List = jnd28Service.selectJnd28ListWithStatusZeroAndLimit(null,"0","1",null,1);

        if(jnd28List == null || jnd28List.size() == 0){
            return;
        }
        Jnd28 jnd28 = jnd28List.get(0);

        Jnd jnd = jndService.selectJndById(jnd28.getId());
        if(jnd == null){
            return;
        }

        jnd28.setNum1(jnd.getSum1());
        jnd28.setNum2(jnd.getSum2());
        jnd28.setNum3(jnd.getSum3());
        jnd28.setSumNum(jnd.getSum1() + jnd.getSum2());
        jnd28.setStatus("1"); //开奖
        jnd28.setTheTime(jnd.getTime());

        int updateInt = jnd28Service.updateJnd28(jnd28);
        if(updateInt > 0){
            lotteryJnd(gameInfo, jnd28.getId());
            CreateJndData(gameInfo);

            // 补漏
            List<Jnd28> notOpenJnd28List = jnd28Service.selectJnd28ListWithStatusZeroAndLimit(jnd28.getId(),"0",null,"1",1);
            if(notOpenJnd28List != null && notOpenJnd28List.size() >0){
                lotteryJnd(gameInfo, notOpenJnd28List.get(0).getId());
            }
        }
    }

    public void lotteryJnd(SysGame gameInfo, Long periodId){
        Jndrecord searchJndRecord = new Jndrecord();
        searchJndRecord.setStatus("0");
        searchJndRecord.setPeriods(periodId);
        List<Jndrecord> jndrecordList = jndrecordService.selectJndrecordList(searchJndRecord);

        if(jndrecordList == null || jndrecordList.size() == 0){
            return;
        }

        Jnd28 jnd28 = jnd28Service.selectJnd28ById(periodId);
        Float adminWinMoney = 0f;
        String gameResult = jnd28.getNum1() + "+" +
                jnd28.getNum2() + "+" +
                jnd28.getNum3() + "=" +
                jnd28.getSumNum();

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

        Map<String, Object> jnd28Map = EntityMapTransUtils.entityToMap1(jnd28);

        Wave wave = waveService.selectWaveByGameId(gameInfo.getGameId());
        Map<String, Object> waveMap = EntityMapTransUtils.entityToMap1(wave);

        List<Integer> bigSingleList = Arrays.asList(15, 17, 19, 21, 23, 25, 27);
        List<Integer> smallSingleList = Arrays.asList(1, 3, 5, 7, 9, 11, 13);
        List<Integer> bigDoubleList = Arrays.asList(14, 16, 18, 20, 22, 24, 26);
        List<Integer> smallDoubleList = Arrays.asList(0, 2, 4, 6, 8, 10, 12);

        for(Jndrecord jndrecord : jndrecordList){
            Float money = 0f;
            Float bigSamllMoney = 0f;
            Float otherMoney = 0f;

            Map<String, Object> jndRecordMap = EntityMapTransUtils.entityToMap1(jndrecord);

            // 和值 数字
            for(int i=0; i<=27; i++){
                Object amountObject = jndRecordMap.get("num" + i);
                Float amount = amountObject!=null?(Float) amountObject:0f;
                if(amount > 0){
                    otherMoney += amount;
                }
                if(jnd28.getSumNum() == i && amount>0){
                    money += amount * getOddFromMapByOddKey(betItemMap,"num"+i);
                }
            }

            // 大
            if(jnd28.getSumNum() > 13 && jndrecord.getBig() > 0){
                money += jndrecord.getBig() * getOddFromMapByOddKey(betItemMap,"big");
            }
            // 小
            if(jnd28.getSumNum() < 14 && jndrecord.getSmall() > 0){
                money += jndrecord.getSmall() * getOddFromMapByOddKey(betItemMap,"small");
            }
            // 单
            if(jnd28.getSumNum()%2 == 1 && jndrecord.getSingle() > 0){
                money += jndrecord.getSingle() * getOddFromMapByOddKey(betItemMap,"single");
            }
            // 双
            if(jnd28.getSumNum()%2 == 0 && jndrecord.getDoubleAmount() > 0){
                money += jndrecord.getDoubleAmount() * getOddFromMapByOddKey(betItemMap,"doubleFlg");
            }
            // 极大
            if(jnd28.getSumNum() > 21 && jndrecord.getMuchBig() > 0){
                money += jndrecord.getMuchBig() * getOddFromMapByOddKey(betItemMap,"muchbig");
            }

            // 大单
            if(bigSingleList.contains(jnd28.getSumNum()) && jndrecord.getBigSingle() > 0){
                money += jndrecord.getBigSingle() * getOddFromMapByOddKey(betItemMap,"bigsingle");
            }
            // 大双
            if(bigDoubleList.contains(jnd28.getSumNum()) && jndrecord.getBigDouble() > 0){
                money += jndrecord.getBigDouble() * getOddFromMapByOddKey(betItemMap,"bigdouble");
            }
            // 小单
            if(smallSingleList.contains(jnd28.getSumNum()) && jndrecord.getSmallSingle() > 0){
                money += jndrecord.getSmallSingle() * getOddFromMapByOddKey(betItemMap,"smallsingle");
            }
            // 小双
            if(smallDoubleList.contains(jnd28.getSumNum()) && jndrecord.getSmallDouble() > 0){
                money += jndrecord.getSmallDouble() * getOddFromMapByOddKey(betItemMap,"smalldouble");
            }
            // 极小
            if(jnd28.getSumNum() < 6 && jndrecord.getMuchSmall() > 0){
                money += jndrecord.getMuchSmall() * getOddFromMapByOddKey(betItemMap,"muchsmall");
            }
            // 龙
            if(jnd28.getNum3() < jnd28.getNum1() && jndrecord.getLoong() > 0){
                money += jndrecord.getLoong() * getOddFromMapByOddKey(betItemMap,"loong");
            }
            // 虎
            if(jnd28.getNum1() < jnd28.getNum3() && jndrecord.getTiger() > 0){
                money += jndrecord.getLoong() * getOddFromMapByOddKey(betItemMap,"tiger");
            }
            // 合
            if(jnd28.getNum1() == jnd28.getNum3() && jndrecord.getClose() > 0){
                money += jndrecord.getClose() * getOddFromMapByOddKey(betItemMap,"close");
            }

            Integer dsbResult = getBaoShunDui(jnd28.getNum1(),jnd28.getNum2(),jnd28.getNum3());
            // 豹
            if(dsbResult == 1 && jndrecord.getLeopard() > 0){
                money += jndrecord.getLeopard() * getOddFromMapByOddKey(betItemMap,"leopard");
            }
            // 顺
            if(dsbResult == 2 && jndrecord.getShun() > 0){
                money += jndrecord.getShun() * getOddFromMapByOddKey(betItemMap,"shun");
            }
            // 对
            if(dsbResult == 3 && jndrecord.getPairs() > 0){
                money += jndrecord.getPairs() * getOddFromMapByOddKey(betItemMap,"pairs");
            }

            // 红绿蓝
            if(waveMap != null){
                Object waveNumObject = waveMap.get("num" + jnd28.getSumNum());
                Integer numWave = waveNumObject!=null?(Integer) waveNumObject:0;

                // 绿
                if(numWave == 1 && jndrecord.getGreen() > 0){
                    money += jndrecord.getGreen() * getOddFromMapByOddKey(betItemMap,"green");
                }
                // 红
                if(numWave == 2 && jndrecord.getRed() > 0){
                    money += jndrecord.getRed() * getOddFromMapByOddKey(betItemMap,"red");
                }
                // 蓝
                if(numWave == 3 && jndrecord.getBlue() > 0){
                    money += jndrecord.getBlue() * getOddFromMapByOddKey(betItemMap,"blue");
                }
            }

            SysUser user = sysUserService.selectUserById(jndrecord.getUserId());
            user.setScore(user.getScore() + jndrecord.getCountMoney());
            if(money > 0){
                user.setAmount(user.getAmount() + money);
            }
            sysUserService.updateUserAmount(user);

            Userwin userwin = userwinService.selectTodayUserwin(gameInfo.getGameId(),jndrecord.getUserId());
            if(userwin == null){
                userwin = new Userwin();
                userwin.setGameId(gameInfo.getGameId());
                userwin.setGameName(gameInfo.getGameName());
                userwin.setUserId(jndrecord.getUserId());
                userwin.setWinMoney(money - jndrecord.getCountMoney());
                userwin.setCreateBy("lotteryJnd");

                userwinService.insertUserwin(userwin);
            }else{

                userwin.setWinMoney(userwin.getWinMoney() + (money - jndrecord.getCountMoney()));
                userwin.setCreateBy("lotteryJnd");
                userwinService.updateUserwin(userwin);
            }

            jndrecord.setWinMoney(money);
            jndrecord.setStatus("1");
            jndrecord.setN1(jnd28.getNum1());
            jndrecord.setN2(jnd28.getNum2());
            jndrecord.setN3(jnd28.getNum3());
            jndrecord.setSumNum(jnd28.getSumNum());
            jndrecord.setUpdateBy("lotteryJnd");

            jndrecordService.updateJndrecord(jndrecord);

            if(money > 0){
                Usermoney usermoney = new Usermoney();
                usermoney.setUserId(jndrecord.getUserId());
                usermoney.setCashContent("【加拿大2.8】中奖-" + periodId);
                usermoney.setCashMoney(money);
                usermoney.setUserBalance(user.getAmount());
                usermoney.setType("8");
                usermoney.setGameId(gameInfo.getGameId());
                usermoney.setGameName(gameInfo.getGameName());
                usermoneyService.insertUsermoney(usermoney);
            }

            adminWinMoney += jndrecord.getCountMoney() - money;
            Float accountResult = money - jndrecord.getCountMoney();

            BetRecord betRecord = new BetRecord();
            betRecord.setUserId(jndrecord.getUserId());
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
            todayAdminwin.setCreateBy("lotteryJnd");

            adminwinService.insertAdminwin(todayAdminwin);
        }else{
            todayAdminwin.setWinMoney(adminWinMoney +todayAdminwin.getWinMoney());
            todayAdminwin.setUpdateBy("lotteryJnd");
            adminwinService.updateAdminwin(todayAdminwin);
        }

        RecordSumRespVo recordSumRespVo = jndrecordService.selectSumRecordByPeriodId(periodId);
        jnd28.setCountMoney(recordSumRespVo.getCountMoney());
        jnd28.setWinMoney(recordSumRespVo.getWinMoney());
        jnd28Service.updateJnd28TotalAmountByPeriodId(jnd28);
//
//        if(recordSumRespVo != null){
//            Jndrecord updateJndrecord = new Jndrecord();
//            updateJndrecord.setPeriods(periodId);
//            updateJndrecord.setCountMoney(recordSumRespVo.getCountMoney());
//            updateJndrecord.setWinMoney(recordSumRespVo.getWinMoney());
//            jndrecordService.updateJndrecordTotalAmountByPeriodId(updateJndrecord);
//        }
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
