package com.ruoyi.quartz.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.EntityMapTransUtils;
import com.ruoyi.quartz.service.JssscLotteryService;
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
public class JssscLotteryServiceImpl implements JssscLotteryService {

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private IJssscService jssscService;

    @Autowired
    private IJsssckjService jsssckjService;

    @Autowired
    private IJssscrecordService jssscrecordService;

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
    public void lotteryJsssc(String gameCode) {

        SysGame gameInfo = sysGameService.selectSysGameByGameMarkId(gameCode);
        if(gameInfo == null){
            throw new ServiceException("没有澳洲幸运10游戏基础表数据");
        }
        if(gameInfo.getLotteryInterval() == 0){
            throw new ServiceException("开奖间隔为空,定时开奖结算失败");
        }

        Jsssckj existJsssckj = jsssckjService.selectLastRecord("");

        Jsssc jssscInfo = jssscService.selectLastRecord();

        Long jiange = 0l;
        if(jssscInfo == null){
            throw new ServiceException("澳洲幸运10没有开奖数据，请先同步开奖数据");
        }

        Jsssckj searchJsssckj = new Jsssckj();
        searchJsssckj.setStatus("0");
        List<Jsssckj> notOpenJsssckjList = jsssckjService.selectJsssckjList(searchJsssckj);
        if(notOpenJsssckjList != null && notOpenJsssckjList.size() > 0){
            jiange = jssscInfo.getId() - notOpenJsssckjList.get(0).getId();
        }

        if(jiange >= 0){
            List<Jsssckj> jsssckjList = jsssckjService.selectJsssckjListWithStatusZeroAndLimit(jssscInfo.getId(),"0",null,"1",50);
            for (Jsssckj jsssckj : jsssckjList){
                jsssckj.setStatus("2");
                jsssckj.setUpdateBy("lotteryJssscBalance");
                jsssckjService.updateJsssckj(jsssckj);
            }
            CreateJssscData(gameInfo);
        }

        if(existJsssckj != null){
            SingleJssscUpdate(gameInfo);
            CreateJssscData(gameInfo);
        }else{
            CreateJssscAll(gameInfo);
        }
    }

    private void CreateJssscData(SysGame gameInfo){
        List<Jsssckj> jsssckjList = jsssckjService.selectJsssckjListWithStatusZeroAndLimit(null,"0",null,"1",null);
        if(jsssckjList.size() == 2){
            return;
//            throw new ServiceException("CreateJssscData return false1");
        }
        Jsssc jssscInfo = jssscService.selectLastRecord();
        if(jssscInfo == null){
            throw new ServiceException("CreateJssscData return false2");
        }
        Jsssckj firstJsssckj = jsssckjService.selectJsssckjById(jssscInfo.getId() + 1);

        Jsssckj newJsssckj = new Jsssckj();
        newJsssckj.setStatus("0");
        newJsssckj.setCreateBy("CreateJssscData");

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(jssscInfo.getTime());

        if(jsssckjList.size() == 0 && firstJsssckj == null){
            newJsssckj.setId(jssscInfo.getId() + 1);

            //预计开奖时间
            calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval());
            newJsssckj.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newJsssckj.setBetTime(calendar.getTime());
        }else if(jsssckjList.size() == 1 && firstJsssckj != null){
            Jsssckj secondJsssckj = jsssckjService.selectJsssckjById(jssscInfo.getId() + 2);
            if(secondJsssckj != null){
                throw new ServiceException("CreateJssscData return false3 ID: " + (jssscInfo.getId() + 2));
            }
            newJsssckj.setId(jssscInfo.getId() + 2);

            //预计开奖时间
            calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval()*2);
            newJsssckj.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newJsssckj.setBetTime(calendar.getTime());
        }else{
            throw new ServiceException("CreateJssscData return false4");
        }
        jsssckjService.insertJsssckj(newJsssckj);
        CreateJssscData(gameInfo);
    }

    private void CreateJssscAll(SysGame gameInfo){
        List<Jsssc> jssscList = jssscService.selectJssscListByParam("1",5);
        for(Jsssc jsssc :jssscList){
            Jsssckj newJsssckj = new Jsssckj();

            newJsssckj.setId(jsssc.getId());

            newJsssckj.setNum1(jsssc.getNum1());
            newJsssckj.setNum1Bs(getBigSmallNumResult(jsssc.getNum1()));
            newJsssckj.setNum1Sd(getSingleDoubleNumResult(jsssc.getNum1()));
            newJsssckj.setNum2(jsssc.getNum2());
            newJsssckj.setNum2Bs(getBigSmallNumResult(jsssc.getNum2()));
            newJsssckj.setNum2Sd(getSingleDoubleNumResult(jsssc.getNum2()));
            newJsssckj.setNum3(jsssc.getNum3());
            newJsssckj.setNum3Bs(getBigSmallNumResult(jsssc.getNum3()));
            newJsssckj.setNum3Sd(getSingleDoubleNumResult(jsssc.getNum3()));
            newJsssckj.setNum4(jsssc.getNum4());
            newJsssckj.setNum4Bs(getBigSmallNumResult(jsssc.getNum4()));
            newJsssckj.setNum4Sd(getSingleDoubleNumResult(jsssc.getNum4()));
            newJsssckj.setNum5(jsssc.getNum5());
            newJsssckj.setNum5Bs(getBigSmallNumResult(jsssc.getNum5()));
            newJsssckj.setNum5Sd(getSingleDoubleNumResult(jsssc.getNum5()));
            newJsssckj.setSum(jsssc.getNum1() + jsssc.getNum2() + jsssc.getNum3() + jsssc.getNum4() + jsssc.getNum5());
            newJsssckj.setSumBs(getSumBigSmallNumResult(newJsssckj.getSum()));
            newJsssckj.setSumSd(getSingleDoubleNumResult(newJsssckj.getSum()));
            newJsssckj.setSumLts(getLoongTigerCloseNumResult(jsssc.getNum1(),jsssc.getNum5()));
            newJsssckj.setNumF(getBaoShunDui(jsssc.getNum1(),jsssc.getNum2(),jsssc.getNum3()));
            newJsssckj.setNumM(getBaoShunDui(jsssc.getNum2(),jsssc.getNum3(),jsssc.getNum4()));
            newJsssckj.setNumB(getBaoShunDui(jsssc.getNum3(),jsssc.getNum4(),jsssc.getNum5()));

            newJsssckj.setStatus("1");
            // 开奖时间
            newJsssckj.setTheTime(jsssc.getTime());

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(jsssc.getTime());
            //预计开奖时间(比实际开奖时间少10s)
            calendar.add(Calendar.SECOND, -5);
            newJsssckj.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newJsssckj.setBetTime(calendar.getTime());

            jsssckjService.insertJsssckj(newJsssckj);
        }

        CreateJssscData(gameInfo);
    }

    private void SingleJssscUpdate(SysGame gameInfo){

        List<Jsssckj> jsssckjList = jsssckjService.selectJsssckjListWithStatusZeroAndLimit(null,"0","1",null,1);

        if(jsssckjList == null || jsssckjList.size() == 0){
            return;
        }
        Jsssckj jsssckj = jsssckjList.get(0);

        Jsssc jsssc = jssscService.selectJssscById(jsssckj.getId());
        if(jsssc == null){
            return;
        }

        jsssckj.setNum1(jsssc.getNum1());
        jsssckj.setNum1Bs(getBigSmallNumResult(jsssc.getNum1()));
        jsssckj.setNum1Sd(getSingleDoubleNumResult(jsssc.getNum1()));
        jsssckj.setNum2(jsssc.getNum2());
        jsssckj.setNum2Bs(getBigSmallNumResult(jsssc.getNum2()));
        jsssckj.setNum2Sd(getSingleDoubleNumResult(jsssc.getNum2()));
        jsssckj.setNum3(jsssc.getNum3());
        jsssckj.setNum3Bs(getBigSmallNumResult(jsssc.getNum3()));
        jsssckj.setNum3Sd(getSingleDoubleNumResult(jsssc.getNum3()));
        jsssckj.setNum4(jsssc.getNum4());
        jsssckj.setNum4Bs(getBigSmallNumResult(jsssc.getNum4()));
        jsssckj.setNum4Sd(getSingleDoubleNumResult(jsssc.getNum4()));
        jsssckj.setNum5(jsssc.getNum5());
        jsssckj.setNum5Bs(getBigSmallNumResult(jsssc.getNum5()));
        jsssckj.setNum5Sd(getSingleDoubleNumResult(jsssc.getNum5()));
        jsssckj.setSum(jsssc.getNum1() + jsssc.getNum2() + jsssc.getNum3() + jsssc.getNum4() + jsssc.getNum5());
        jsssckj.setSumBs(getSumBigSmallNumResult(jsssckj.getSum()));
        jsssckj.setSumSd(getSingleDoubleNumResult(jsssckj.getSum()));
        jsssckj.setSumLts(getLoongTigerCloseNumResult(jsssc.getNum1(),jsssc.getNum5()));
        jsssckj.setNumF(getBaoShunDui(jsssc.getNum1(),jsssc.getNum2(),jsssc.getNum3()));
        jsssckj.setNumM(getBaoShunDui(jsssc.getNum2(),jsssc.getNum3(),jsssc.getNum4()));
        jsssckj.setNumB(getBaoShunDui(jsssc.getNum3(),jsssc.getNum4(),jsssc.getNum5()));
        jsssckj.setStatus("1"); //开奖
        jsssckj.setTheTime(jsssc.getTime());

        int updateInt = jsssckjService.updateJsssckj(jsssckj);
        if(updateInt > 0){
            lotteryJsssc(gameInfo, jsssckj.getId());
            CreateJssscData(gameInfo);

            // 补漏
            List<Jsssckj> notOpenJsssckjList = jsssckjService.selectJsssckjListWithStatusZeroAndLimit(jsssckj.getId(),"0",null,"1",1);
            if(notOpenJsssckjList != null && notOpenJsssckjList.size() >0){
                lotteryJsssc(gameInfo, notOpenJsssckjList.get(0).getId());
            }
        }
    }

    private void lotteryJsssc(SysGame gameInfo, Long periodId){
        Jssscrecord searchJssscRecord = new Jssscrecord();
        searchJssscRecord.setStatus("0");
        searchJssscRecord.setPeriods(periodId);
        List<Jssscrecord> jssscrecordList = jssscrecordService.selectJssscrecordList(searchJssscRecord);

        if(jssscrecordList == null || jssscrecordList.size() == 0){
            return;
        }

        Jsssckj jsssckj = jsssckjService.selectJsssckjById(periodId);
        Float adminWinMoney = 0f;
        String gameResult = jsssckj.getNum1() + "+" +
                jsssckj.getNum2() + "+" +
                jsssckj.getNum3() + "+" +
                jsssckj.getNum4() + "+" +
                jsssckj.getNum5();

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

        Map<String, Object> jsssckjMap = EntityMapTransUtils.entityToMap1(jsssckj);
        List<Integer> bigSingleList = Arrays.asList(13, 15, 17, 19);
        List<Integer> smallSingleList = Arrays.asList(3, 5, 7, 9, 11);
        List<Integer> bigDoubleList = Arrays.asList(12, 14, 16, 18);
        List<Integer> smallDoubleList = Arrays.asList(4, 6, 8, 10);

        for(Jssscrecord jssscrecord : jssscrecordList){
            Float money = 0f;
            Float bigSamllMoney = 0f;
            Float otherMoney = 0f;

            Map<String, Object> jssscRecordMap = EntityMapTransUtils.entityToMap1(jssscrecord);
            // 和值
            // 大1 小0 [小,大]
            // 大的金额计算
            if(jsssckj.getSumBs() == 1 && jssscrecord.getSumBig() >0){
                money += jssscrecord.getSumBig() * getOddFromMapByOddKey(betItemMap,"sumBig");
                bigSamllMoney += jssscrecord.getSumBig() * getOddFromMapByOddKey(betItemMap,"sumBig");
            }
            // 小的金额计算
            if(jsssckj.getSumBs() == 0 && jssscrecord.getSumSmall() >0){
                money += jssscrecord.getSumSmall() * getOddFromMapByOddKey(betItemMap,"sumSmall");
                bigSamllMoney += jssscrecord.getSumSmall() * getOddFromMapByOddKey(betItemMap,"sumSmall");
            }

            // 双1 单0 [单,双]
            // 单的金额计算
            if(jsssckj.getSumSd() == 0 && jssscrecord.getSumSingle() >0){
                money += jssscrecord.getSumSingle() * getOddFromMapByOddKey(betItemMap,"sumSingle");
                bigSamllMoney += jssscrecord.getSumSingle() * getOddFromMapByOddKey(betItemMap,"sumSingle");
            }
            // 双的金额计算
            if(jsssckj.getSumSd() == 1 && jssscrecord.getSumDouble() >0){
                money += jssscrecord.getSumDouble() * getOddFromMapByOddKey(betItemMap,"sumDouble");
                bigSamllMoney += jssscrecord.getSumDouble() * getOddFromMapByOddKey(betItemMap,"sumDouble");
            }

            // 龙2 虎1 和0 [和,虎,龙]
            // 龙的金额计算
            if(jsssckj.getSumLts() == 2 && jssscrecord.getSumLoong() >0){
                money += jssscrecord.getSumLoong() * getOddFromMapByOddKey(betItemMap,"sumLoong");
            }

            // 虎的金额计算
            if(jsssckj.getSumLts() == 1 && jssscrecord.getSumTiger() >0){
                money += jssscrecord.getSumTiger() * getOddFromMapByOddKey(betItemMap,"sumTiger");
            }

            // 和的金额计算
            if(jsssckj.getSumLts() == 0 && jssscrecord.getSumSum() >0){
                money += jssscrecord.getSumSum() * getOddFromMapByOddKey(betItemMap,"sumSum");
            }

            // 球1~5
            for(int i=1;i<=5;i++){
                // 号码0~9
                for(int j=0;j<=9;j++){
                    Object amountObject = jssscRecordMap.get("num"+ i +"Ball" + j);
                    Float amount = amountObject!=null?(Float) amountObject:0f;
                    if(jsssckj.getNum1() == 0 && amount>0){
                        money += amount * getOddFromMapByOddKey(betItemMap,"num"+ i + "Under"+j);
                    }
                }

                // 大小
                // 大1 小0 [小,大]
                Object bigSmarNumObject = jssscRecordMap.get("num" + i + "Bs");
                if(bigSmarNumObject!=null){
                    Integer bigSmarNum = (Integer) bigSmarNumObject;

                    // 大的金额计算
                    Object bigAmountObject = jssscRecordMap.get("num" + i + "Big");
                    Float bigAmount = bigAmountObject!=null?(Float) bigAmountObject:0f;
                    if(bigSmarNum == 1 && bigAmount > 0){
                        money += bigAmount * getOddFromMapByOddKey(betItemMap,"num"+ i + "Big");;
                    }

                    // 小的金额计算
                    Object smallAmountObject = jssscRecordMap.get("num" + i + "Small");
                    Float smallAmount = smallAmountObject!=null?(Float) smallAmountObject:0f;
                    if(bigSmarNum == 0 && smallAmount > 0){
                        money += smallAmount * getOddFromMapByOddKey(betItemMap,"num"+ i + "Small");;;
                    }
                }

                // 单双
                // 双1 单0 [单,双]
                Object singleDoubleNumObject = jssscRecordMap.get("num" + i + "Sd");
                if(singleDoubleNumObject != null){
                    Integer singleDoubleNum = (Integer) singleDoubleNumObject;

                    // 单的金额计算
                    Object singleAmountObject = jssscRecordMap.get("num" + i + "Single");
                    Float singleAmount = singleAmountObject!=null?(Float) singleAmountObject:0f;
                    if(singleDoubleNum == 0 && singleAmount > 0){
                        money += singleAmount * getOddFromMapByOddKey(betItemMap,"num"+ i + "Single");;;
                    }

                    // 双的金额计算
                    Object doubleAmountObject = jssscRecordMap.get("num" + i + "Double");
                    Float doubleAmount = doubleAmountObject!=null?(Float) doubleAmountObject:0f;
                    if(singleDoubleNum == 1 && doubleAmount > 0){
                        money += doubleAmount * getOddFromMapByOddKey(betItemMap,"num"+ i + "Double");;;
                    }
                }
            }

            // 前三
            // 杂六4 半顺3 顺2 对1 豹0 [豹,对,顺,半顺,杂六]
            if(jsssckj.getNumF() == 0 && jssscrecord.getFirstBan() >0){
                money += jssscrecord.getFirstBan() * getOddFromMapByOddKey(betItemMap,"fBao");
            }
            if(jsssckj.getNumF() == 1 && jssscrecord.getFirstDui() >0){
                money += jssscrecord.getFirstDui() * getOddFromMapByOddKey(betItemMap,"fDui");
            }
            if(jsssckj.getNumF() == 2 && jssscrecord.getFirstSun() >0){
                money += jssscrecord.getFirstSun() * getOddFromMapByOddKey(betItemMap,"fSun");
            }
            if(jsssckj.getNumF() == 3 && jssscrecord.getFirstBan() >0){
                money += jssscrecord.getFirstBan() * getOddFromMapByOddKey(betItemMap,"fBan");
            }
            if(jsssckj.getNumF() == 4 && jssscrecord.getFirstZa() >0){
                money += jssscrecord.getFirstZa() * getOddFromMapByOddKey(betItemMap,"fZa");
            }

            // 中三
            // 杂六4 半顺3 顺2 对1 豹0 [豹,对,顺,半顺,杂六]
            if(jsssckj.getNumM() == 0 && jssscrecord.getMidBan() >0){
                money += jssscrecord.getMidBan() * getOddFromMapByOddKey(betItemMap,"mBao");
            }
            if(jsssckj.getNumM() == 1 && jssscrecord.getMidDui() >0){
                money += jssscrecord.getMidDui() * getOddFromMapByOddKey(betItemMap,"mDui");
            }
            if(jsssckj.getNumM() == 2 && jssscrecord.getMidSun() >0){
                money += jssscrecord.getMidSun() * getOddFromMapByOddKey(betItemMap,"mSun");
            }
            if(jsssckj.getNumM() == 3 && jssscrecord.getMidBan() >0){
                money += jssscrecord.getMidBan() * getOddFromMapByOddKey(betItemMap,"mBan");
            }
            if(jsssckj.getNumM() == 4 && jssscrecord.getMidZa() >0){
                money += jssscrecord.getMidZa() * getOddFromMapByOddKey(betItemMap,"mZa");
            }

            // 后三
            // 杂六4 半顺3 顺2 对1 豹0 [豹,对,顺,半顺,杂六]
            if(jsssckj.getNumB() == 0 && jssscrecord.getBackBan() >0){
                money += jssscrecord.getBackBan() * getOddFromMapByOddKey(betItemMap,"bBao");
            }
            if(jsssckj.getNumB() == 1 && jssscrecord.getBackDui() >0){
                money += jssscrecord.getBackDui() * getOddFromMapByOddKey(betItemMap,"bDui");
            }
            if(jsssckj.getNumB() == 2 && jssscrecord.getBackSun() >0){
                money += jssscrecord.getBackSun() * getOddFromMapByOddKey(betItemMap,"bSun");
            }
            if(jsssckj.getNumB() == 3 && jssscrecord.getBackBan() >0){
                money += jssscrecord.getBackBan() * getOddFromMapByOddKey(betItemMap,"bBan");
            }
            if(jsssckj.getNumB() == 4 && jssscrecord.getBackZa() >0){
                money += jssscrecord.getBackZa() * getOddFromMapByOddKey(betItemMap,"ba");
            }

            otherMoney = money - bigSamllMoney;

            SysUser user = sysUserService.selectUserById(jssscrecord.getUserId());
            user.setScore(user.getScore() + jssscrecord.getCountMoney());
            if(money > 0){
                user.setAmount(user.getAmount() + money);
            }
            sysUserService.updateUserAmount(user);

            Userwin userwin = userwinService.selectTodayUserwin(gameInfo.getGameId(),jssscrecord.getUserId());
            if(userwin == null){
                userwin = new Userwin();
                userwin.setGameId(gameInfo.getGameId());
                userwin.setGameName(gameInfo.getGameName());
                userwin.setUserId(jssscrecord.getUserId());
                userwin.setWinMoney(money - jssscrecord.getCountMoney());
                userwin.setCreateBy("lotteryJsssc");

                userwinService.insertUserwin(userwin);
            }else{

                userwin.setWinMoney(userwin.getWinMoney() + (money - jssscrecord.getCountMoney()));
                userwin.setCreateBy("lotteryJsssc");
                userwinService.updateUserwin(userwin);
            }

            jssscrecord.setWinMoney(money);
            jssscrecord.setStatus("1");
            jssscrecord.setNum1(jsssckj.getNum1());
            jssscrecord.setNum2(jsssckj.getNum2());
            jssscrecord.setNum3(jsssckj.getNum3());
            jssscrecord.setNum4(jsssckj.getNum4());
            jssscrecord.setNum5(jsssckj.getNum5());
            jssscrecord.setSum(jsssckj.getSum());
            jssscrecord.setUpdateBy("lotteryJsssc");

            jssscrecordService.updateJssscrecord(jssscrecord);

            if(money > 0){
                Usermoney usermoney = new Usermoney();
                usermoney.setUserId(jssscrecord.getUserId());
                usermoney.setCashContent("【澳洲幸运10】中奖-" + periodId);
                usermoney.setCashMoney(money);
                usermoney.setUserBalance(user.getAmount());
                usermoney.setType("8");
                usermoney.setGameId(gameInfo.getGameId());
                usermoney.setGameName(gameInfo.getGameName());
                usermoneyService.insertUsermoney(usermoney);
            }

            adminWinMoney += jssscrecord.getCountMoney() - money;
            Float accountResult = money - jssscrecord.getCountMoney();

            BetRecord betRecord = new BetRecord();
            betRecord.setUserId(jssscrecord.getUserId());
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
            todayAdminwin.setCreateBy("lotteryJsssc");

            adminwinService.insertAdminwin(todayAdminwin);
        }else{
            todayAdminwin.setWinMoney(adminWinMoney +todayAdminwin.getWinMoney());
            todayAdminwin.setUpdateBy("lotteryJsssc");
            adminwinService.updateAdminwin(todayAdminwin);
        }

        RecordSumRespVo recordSumRespVo = jssscrecordService.selectSumRecordByPeriodId(periodId);
        if(recordSumRespVo != null){
            Jssscrecord updateJssscrecord = new Jssscrecord();
            updateJssscrecord.setPeriods(periodId);
            updateJssscrecord.setCountMoney(recordSumRespVo.getCountMoney());
            updateJssscrecord.setWinMoney(recordSumRespVo.getWinMoney());
            jssscrecordService.updateJssscrecordTotalAmountByPeriodId(updateJssscrecord);
        }
    }

    private Float getOddFromMapByOddKey(Map<String , SysBetItem> betItemMap, String betItemCode){
        Float odd = 0f;
        if(betItemMap.containsKey(betItemCode)){
            odd = betItemMap.get(betItemCode).getOdd();
        }

        return odd;
    }


    // 大1 小0 [小,大]
    private Integer getBigSmallNumResult(Integer num){
        Integer result = 1;
        if(num <5){
            result = 0;
        }else{
            result = 1;
        }
        return result;
    }

    // 大1 小0 [小,大]
    private Integer getSumBigSmallNumResult(Integer num){
        Integer result = 1;
        if(num <23){
            result = 0;
        }else{
            result = 1;
        }
        return result;
    }

    // 双1 单0 [单,双]
    private Integer getSingleDoubleNumResult(Integer num){
        Integer result = 1;
        if(num%2 == 0){
            result = 1;
        }else{
            result = 0;
        }
        return result;
    }

    // 龙2 虎1 和0 [和,虎,龙]
    private Integer getLoongTigerCloseNumResult(Integer num1, Integer num2){
        Integer result = 1;
        if(num1 > num2){
            result = 2;
        }else if(num1 < num2){
            result = 1;
        }else{
            result = 0;
        }
        return result;
    }

    // 杂六4 半顺3 顺2 对1 豹0 [豹,对,顺,半顺,杂六]
    private Integer getBaoShunDui(Integer num1,Integer num2,Integer num3){
        Integer result = 404;
        String c = String.valueOf(num1) + String.valueOf(num2) + String.valueOf(num3);
        Integer[] after = new Integer[]{num1, num2, num3};
        Arrays.sort(after);

        //豹子
        if(num1 == num2 && num1 == num3 && num2 == num3){
            result = 0;
        // 对子
        }else if((num1 == num2 && num2 != num3) || (num1 != num2 && num2 == num3)){
            result = 1;
        // 顺子
        }else if(isStraight(c) || isStraight(after)){
            result = 2;
        // 半顺
        }else if(isHalfStraight(c) || isHalfStraight(after)){
            result = 3;
        }else{
            result = 4;
        }

        return result;
    }

    private static boolean isStraight(String c) {
        return c.equals("019") || c.equals("091") || c.equals("098") ||
                c.equals("089") || c.equals("109") || c.equals("190") ||
                c.equals("901") || c.equals("910") || c.equals("809") ||
                c.equals("890");
    }

    private static boolean isStraight(Integer[] after) {
        for (int i = 0; i < after.length - 2; i++) {
            if (after[i + 1] == after[i] + 1 && after[i + 2] == after[i + 1] + 1) {
                return true;
            }
        }
        return false;
    }

    private static boolean isHalfStraight(String c) {
        return c.matches(".*09|0.9.*");
    }

    private static boolean isHalfStraight(Integer[] after) {
        int count = 0;
        for (int i = 0; i < after.length - 1; i++) {
            if (after[i + 1] == after[i] + 1) {
                count++;
            }
        }
        return count == 1;
    }

}
