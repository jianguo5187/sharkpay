package com.ruoyi.quartz.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.EntityMapTransUtils;
import com.ruoyi.quartz.service.IFiveBallLotteryService;
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
public class FiveBallLotteryServiceImpl implements IFiveBallLotteryService {

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private IGameFiveballKjService gameFiveballKjService;

    @Autowired
    private IGameFiveballOpenDataService gameFiveballOpenDataService;

    @Autowired
    private IGameFiveballRecordService gameFiveballRecordService;

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
    public void lotteryFiveBall(String gameCode) {

        SysGame gameInfo = sysGameService.selectSysGameByGameMarkId(gameCode);
        if(gameInfo == null){
            throw new ServiceException("没有" + gameCode + "游戏基础表数据");
        }
        if(gameInfo.getLotteryInterval() == 0){
            throw new ServiceException("开奖间隔为空,定时开奖结算失败");
        }

        GameFiveballKj existGameFiveballKj = gameFiveballKjService.selectLastRecord(gameInfo.getGameId(), "");

        GameFiveballOpenData gameFiveballOpenDataInfo = gameFiveballOpenDataService.selectLastRecord(gameInfo.getGameId());

        Long jiange = 0l;
        if(gameFiveballOpenDataInfo == null){
            throw new ServiceException(gameInfo.getGameName() + "没有开奖数据，请先同步开奖数据");
        }

        GameFiveballKj searchGameFiveballKj = new GameFiveballKj();
        searchGameFiveballKj.setStatus("0");
        searchGameFiveballKj.setGameId(gameInfo.getGameId());
        List<GameFiveballKj> notOpenGameFiveballKjList = gameFiveballKjService.selectGameFiveballKjList(searchGameFiveballKj);
        if(notOpenGameFiveballKjList != null && notOpenGameFiveballKjList.size() > 0){
            jiange = gameFiveballOpenDataInfo.getPeriods() - notOpenGameFiveballKjList.get(0).getPeriods();
        }

        if(jiange >= 0){
            List<GameFiveballKj> gameFiveballKjList = gameFiveballKjService.selectGameFiveballKjListWithStatusZeroAndLimit(gameInfo.getGameId(), gameFiveballOpenDataInfo.getPeriods(),"0",null,"1",50);
            for (GameFiveballKj gameFiveballKj : gameFiveballKjList){
                gameFiveballKj.setStatus("2");
                gameFiveballKj.setUpdateBy("lotteryGameFiveballOpenDataBalance");
                gameFiveballKjService.updateGameFiveballKj(gameFiveballKj);
            }
            CreateFiveBallData(gameInfo);
        }

        if(existGameFiveballKj != null){
            SingleFiveBallUpdate(gameInfo);
            CreateFiveBallData(gameInfo);
        }else{
            CreateFiveBallAll(gameInfo);
        }
    }

    private void CreateFiveBallData(SysGame gameInfo){
        List<GameFiveballKj> GameFiveballKjList = gameFiveballKjService.selectGameFiveballKjListWithStatusZeroAndLimit(gameInfo.getGameId(), null,"0",null,"1",null);
        if(GameFiveballKjList.size() == 2){
            return;
        }
        GameFiveballOpenData gameFiveballOpenDataInfo = gameFiveballOpenDataService.selectLastRecord(gameInfo.getGameId());
        if(gameFiveballOpenDataInfo == null){
            throw new ServiceException("CreateFiveBallData return false2");
        }
        GameFiveballKj firstGameFiveballKj = gameFiveballKjService.selectGameFiveballKjByPeriods(gameInfo.getGameId(),gameFiveballOpenDataInfo.getPeriods() + 1);

        GameFiveballKj newGameFiveballKj = new GameFiveballKj();
        newGameFiveballKj.setGameId(gameInfo.getGameId());
        newGameFiveballKj.setGameName(gameInfo.getGameName());
        newGameFiveballKj.setStatus("0");
        newGameFiveballKj.setCreateBy("CreateFiveBallData");

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(gameFiveballOpenDataInfo.getTime());

        if(GameFiveballKjList.size() == 0 && firstGameFiveballKj == null){
            newGameFiveballKj.setPeriods(gameFiveballOpenDataInfo.getPeriods() + 1);

            //预计开奖时间
            calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval());
            calendar.add(Calendar.SECOND, gameInfo.getLeadTime());
            newGameFiveballKj.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newGameFiveballKj.setBetTime(calendar.getTime());
        }else if(GameFiveballKjList.size() == 1 && firstGameFiveballKj != null){
            GameFiveballKj secondGameFiveballKj = gameFiveballKjService.selectGameFiveballKjByPeriods(gameInfo.getGameId(), gameFiveballOpenDataInfo.getPeriods() + 2);
            if(secondGameFiveballKj != null){
                throw new ServiceException("CreateFiveBallData return false3 ID: " + (gameFiveballOpenDataInfo.getPeriods() + 2));
            }
            newGameFiveballKj.setPeriods(gameFiveballOpenDataInfo.getPeriods() + 2);

            //预计开奖时间
            calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval()*2);
            calendar.add(Calendar.SECOND, gameInfo.getLeadTime());
            newGameFiveballKj.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newGameFiveballKj.setBetTime(calendar.getTime());
        }else{
            throw new ServiceException("CreateFiveBallData return false4");
        }
        gameFiveballKjService.insertGameFiveballKj(newGameFiveballKj);
        CreateFiveBallData(gameInfo);
    }

    private void CreateFiveBallAll(SysGame gameInfo){
        List<GameFiveballOpenData> gameFiveballOpenDataList = gameFiveballOpenDataService.selectGameFiveballOpenDataListByParam(gameInfo.getGameId(),"1",5);
        for(GameFiveballOpenData gameFiveballOpenData :gameFiveballOpenDataList){
            GameFiveballKj newGameFiveballKj = new GameFiveballKj();

            newGameFiveballKj.setPeriods(gameFiveballOpenData.getPeriods());
            newGameFiveballKj.setGameId(gameInfo.getGameId());
            newGameFiveballKj.setGameName(gameInfo.getGameName());

            newGameFiveballKj.setNum1(gameFiveballOpenData.getNum1());
            newGameFiveballKj.setNum1Bs(getBigSmallNumResult(gameFiveballOpenData.getNum1()));
            newGameFiveballKj.setNum1Sd(getSingleDoubleNumResult(gameFiveballOpenData.getNum1()));
            newGameFiveballKj.setNum2(gameFiveballOpenData.getNum2());
            newGameFiveballKj.setNum2Bs(getBigSmallNumResult(gameFiveballOpenData.getNum2()));
            newGameFiveballKj.setNum2Sd(getSingleDoubleNumResult(gameFiveballOpenData.getNum2()));
            newGameFiveballKj.setNum3(gameFiveballOpenData.getNum3());
            newGameFiveballKj.setNum3Bs(getBigSmallNumResult(gameFiveballOpenData.getNum3()));
            newGameFiveballKj.setNum3Sd(getSingleDoubleNumResult(gameFiveballOpenData.getNum3()));
            newGameFiveballKj.setNum4(gameFiveballOpenData.getNum4());
            newGameFiveballKj.setNum4Bs(getBigSmallNumResult(gameFiveballOpenData.getNum4()));
            newGameFiveballKj.setNum4Sd(getSingleDoubleNumResult(gameFiveballOpenData.getNum4()));
            newGameFiveballKj.setNum5(gameFiveballOpenData.getNum5());
            newGameFiveballKj.setNum5Bs(getBigSmallNumResult(gameFiveballOpenData.getNum5()));
            newGameFiveballKj.setNum5Sd(getSingleDoubleNumResult(gameFiveballOpenData.getNum5()));
            newGameFiveballKj.setSum(gameFiveballOpenData.getNum1() + gameFiveballOpenData.getNum2() + gameFiveballOpenData.getNum3() + gameFiveballOpenData.getNum4() + gameFiveballOpenData.getNum5());
            newGameFiveballKj.setSumBs(getSumBigSmallNumResult(newGameFiveballKj.getSum()));
            newGameFiveballKj.setSumSd(getSingleDoubleNumResult(newGameFiveballKj.getSum()));
            newGameFiveballKj.setSumLts(getLoongTigerCloseNumResult(gameFiveballOpenData.getNum1(),gameFiveballOpenData.getNum5()));
            newGameFiveballKj.setNumF(getBaoShunDui(gameFiveballOpenData.getNum1(),gameFiveballOpenData.getNum2(),gameFiveballOpenData.getNum3()));
            newGameFiveballKj.setNumM(getBaoShunDui(gameFiveballOpenData.getNum2(),gameFiveballOpenData.getNum3(),gameFiveballOpenData.getNum4()));
            newGameFiveballKj.setNumB(getBaoShunDui(gameFiveballOpenData.getNum3(),gameFiveballOpenData.getNum4(),gameFiveballOpenData.getNum5()));

            newGameFiveballKj.setStatus("1");
            // 开奖时间
            newGameFiveballKj.setTheTime(gameFiveballOpenData.getTime());

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(gameFiveballOpenData.getTime());
            //预计开奖时间(比实际开奖时间少10s)
            calendar.add(Calendar.SECOND, -5);
            newGameFiveballKj.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newGameFiveballKj.setBetTime(calendar.getTime());

            gameFiveballKjService.insertGameFiveballKj(newGameFiveballKj);
        }

        CreateFiveBallData(gameInfo);
    }

    private void SingleFiveBallUpdate(SysGame gameInfo){

        List<GameFiveballKj> gameFiveballKjList = gameFiveballKjService.selectGameFiveballKjListWithStatusZeroAndLimit(gameInfo.getGameId(),null,"0","1",null,1);

        if(gameFiveballKjList == null || gameFiveballKjList.size() == 0){
            return;
        }
        GameFiveballKj gameFiveballKj = gameFiveballKjList.get(0);

        GameFiveballOpenData gameFiveballOpenData = gameFiveballOpenDataService.selectGameFiveballOpenDataByPeriods(gameInfo.getGameId(), gameFiveballKj.getPeriods());
        if(gameFiveballOpenData == null){
            return;
        }

        gameFiveballKj.setNum1(gameFiveballOpenData.getNum1());
        gameFiveballKj.setNum1Bs(getBigSmallNumResult(gameFiveballOpenData.getNum1()));
        gameFiveballKj.setNum1Sd(getSingleDoubleNumResult(gameFiveballOpenData.getNum1()));
        gameFiveballKj.setNum2(gameFiveballOpenData.getNum2());
        gameFiveballKj.setNum2Bs(getBigSmallNumResult(gameFiveballOpenData.getNum2()));
        gameFiveballKj.setNum2Sd(getSingleDoubleNumResult(gameFiveballOpenData.getNum2()));
        gameFiveballKj.setNum3(gameFiveballOpenData.getNum3());
        gameFiveballKj.setNum3Bs(getBigSmallNumResult(gameFiveballOpenData.getNum3()));
        gameFiveballKj.setNum3Sd(getSingleDoubleNumResult(gameFiveballOpenData.getNum3()));
        gameFiveballKj.setNum4(gameFiveballOpenData.getNum4());
        gameFiveballKj.setNum4Bs(getBigSmallNumResult(gameFiveballOpenData.getNum4()));
        gameFiveballKj.setNum4Sd(getSingleDoubleNumResult(gameFiveballOpenData.getNum4()));
        gameFiveballKj.setNum5(gameFiveballOpenData.getNum5());
        gameFiveballKj.setNum5Bs(getBigSmallNumResult(gameFiveballOpenData.getNum5()));
        gameFiveballKj.setNum5Sd(getSingleDoubleNumResult(gameFiveballOpenData.getNum5()));
        gameFiveballKj.setSum(gameFiveballOpenData.getNum1() + gameFiveballOpenData.getNum2() + gameFiveballOpenData.getNum3() + gameFiveballOpenData.getNum4() + gameFiveballOpenData.getNum5());
        gameFiveballKj.setSumBs(getSumBigSmallNumResult(gameFiveballKj.getSum()));
        gameFiveballKj.setSumSd(getSingleDoubleNumResult(gameFiveballKj.getSum()));
        gameFiveballKj.setSumLts(getLoongTigerCloseNumResult(gameFiveballOpenData.getNum1(),gameFiveballOpenData.getNum5()));
        gameFiveballKj.setNumF(getBaoShunDui(gameFiveballOpenData.getNum1(),gameFiveballOpenData.getNum2(),gameFiveballOpenData.getNum3()));
        gameFiveballKj.setNumM(getBaoShunDui(gameFiveballOpenData.getNum2(),gameFiveballOpenData.getNum3(),gameFiveballOpenData.getNum4()));
        gameFiveballKj.setNumB(getBaoShunDui(gameFiveballOpenData.getNum3(),gameFiveballOpenData.getNum4(),gameFiveballOpenData.getNum5()));
        gameFiveballKj.setStatus("1"); //开奖
        gameFiveballKj.setTheTime(gameFiveballOpenData.getTime());

        int updateInt = gameFiveballKjService.updateGameFiveballKj(gameFiveballKj);
        if(updateInt > 0){
            lotteryGameFiveballOpenData(gameInfo, gameFiveballKj.getPeriods());
            CreateFiveBallData(gameInfo);

            // 补漏
            List<GameFiveballKj> notOpenGameFiveballKjList = gameFiveballKjService.selectGameFiveballKjListWithStatusZeroAndLimit(gameInfo.getGameId(),gameFiveballKj.getPeriods(),"0",null,"1",1);
            if(notOpenGameFiveballKjList != null && notOpenGameFiveballKjList.size() >0){
                lotteryGameFiveballOpenData(gameInfo, notOpenGameFiveballKjList.get(0).getPeriods());
            }
        }
    }

    private void lotteryGameFiveballOpenData(SysGame gameInfo, Long periodId){
        GameFiveballRecord searchGameFiveballRecord = new GameFiveballRecord();
        searchGameFiveballRecord.setStatus("0");
        searchGameFiveballRecord.setPeriods(periodId);
        List<GameFiveballRecord> GameFiveballRecordList = gameFiveballRecordService.selectGameFiveballRecordList(searchGameFiveballRecord);

        if(GameFiveballRecordList == null || GameFiveballRecordList.size() == 0){
            return;
        }

        GameFiveballKj gameFiveballKj = gameFiveballKjService.selectGameFiveballKjByPeriods(gameInfo.getGameId(),periodId);
        Float adminWinMoney = 0f;
        String gameResult = gameFiveballKj.getNum1() + "+" +
                gameFiveballKj.getNum2() + "+" +
                gameFiveballKj.getNum3() + "+" +
                gameFiveballKj.getNum4() + "+" +
                gameFiveballKj.getNum5();

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

        Map<String, Object> gameFiveballKjMap = EntityMapTransUtils.entityToMap1(gameFiveballKj);
        List<Integer> bigSingleList = Arrays.asList(13, 15, 17, 19);
        List<Integer> smallSingleList = Arrays.asList(3, 5, 7, 9, 11);
        List<Integer> bigDoubleList = Arrays.asList(12, 14, 16, 18);
        List<Integer> smallDoubleList = Arrays.asList(4, 6, 8, 10);

        for(GameFiveballRecord GameFiveballRecord : GameFiveballRecordList){
            Float money = 0f;
            Float bigSamllMoney = 0f;
            Float otherMoney = 0f;

            Map<String, Object> GameFiveballRecordMap = EntityMapTransUtils.entityToMap1(GameFiveballRecord);
            // 和值
            // 大1 小0 [小,大]
            // 大的金额计算
            if(gameFiveballKj.getSumBs() == 1 && GameFiveballRecord.getSumBig() >0){
                money += GameFiveballRecord.getSumBig() * getOddFromMapByOddKey(betItemMap,"sumBig");
                bigSamllMoney += GameFiveballRecord.getSumBig() * getOddFromMapByOddKey(betItemMap,"sumBig");
            }
            // 小的金额计算
            if(gameFiveballKj.getSumBs() == 0 && GameFiveballRecord.getSumSmall() >0){
                money += GameFiveballRecord.getSumSmall() * getOddFromMapByOddKey(betItemMap,"sumSmall");
                bigSamllMoney += GameFiveballRecord.getSumSmall() * getOddFromMapByOddKey(betItemMap,"sumSmall");
            }

            // 双1 单0 [单,双]
            // 单的金额计算
            if(gameFiveballKj.getSumSd() == 0 && GameFiveballRecord.getSumSingle() >0){
                money += GameFiveballRecord.getSumSingle() * getOddFromMapByOddKey(betItemMap,"sumSingle");
                bigSamllMoney += GameFiveballRecord.getSumSingle() * getOddFromMapByOddKey(betItemMap,"sumSingle");
            }
            // 双的金额计算
            if(gameFiveballKj.getSumSd() == 1 && GameFiveballRecord.getSumDouble() >0){
                money += GameFiveballRecord.getSumDouble() * getOddFromMapByOddKey(betItemMap,"sumDouble");
                bigSamllMoney += GameFiveballRecord.getSumDouble() * getOddFromMapByOddKey(betItemMap,"sumDouble");
            }

            // 龙2 虎1 和0 [和,虎,龙]
            // 龙的金额计算
            if(gameFiveballKj.getSumLts() == 2 && GameFiveballRecord.getSumLoong() >0){
                money += GameFiveballRecord.getSumLoong() * getOddFromMapByOddKey(betItemMap,"sumLoong");
            }

            // 虎的金额计算
            if(gameFiveballKj.getSumLts() == 1 && GameFiveballRecord.getSumTiger() >0){
                money += GameFiveballRecord.getSumTiger() * getOddFromMapByOddKey(betItemMap,"sumTiger");
            }

            // 和的金额计算
            if(gameFiveballKj.getSumLts() == 0 && GameFiveballRecord.getSumSum() >0){
                money += GameFiveballRecord.getSumSum() * getOddFromMapByOddKey(betItemMap,"sumSum");
            }

            // 球1~5
            for(int i=1;i<=5;i++){
                // 号码0~9
                for(int j=0;j<=9;j++){
                    Object amountObject = GameFiveballRecordMap.get("num"+ i +"Ball" + j);
                    Float amount = amountObject!=null?(Float) amountObject:0f;
                    if(gameFiveballKj.getNum1() == 0 && amount>0){
                        money += amount * getOddFromMapByOddKey(betItemMap,"num"+ i + "Under"+j);
                    }
                }

                // 大小
                // 大1 小0 [小,大]
                Object bigSmarNumObject = GameFiveballRecordMap.get("num" + i + "Bs");
                if(bigSmarNumObject!=null){
                    Integer bigSmarNum = (Integer) bigSmarNumObject;

                    // 大的金额计算
                    Object bigAmountObject = GameFiveballRecordMap.get("num" + i + "Big");
                    Float bigAmount = bigAmountObject!=null?(Float) bigAmountObject:0f;
                    if(bigSmarNum == 1 && bigAmount > 0){
                        money += bigAmount * getOddFromMapByOddKey(betItemMap,"num"+ i + "Big");;
                    }

                    // 小的金额计算
                    Object smallAmountObject = GameFiveballRecordMap.get("num" + i + "Small");
                    Float smallAmount = smallAmountObject!=null?(Float) smallAmountObject:0f;
                    if(bigSmarNum == 0 && smallAmount > 0){
                        money += smallAmount * getOddFromMapByOddKey(betItemMap,"num"+ i + "Small");;;
                    }
                }

                // 单双
                // 双1 单0 [单,双]
                Object singleDoubleNumObject = GameFiveballRecordMap.get("num" + i + "Sd");
                if(singleDoubleNumObject != null){
                    Integer singleDoubleNum = (Integer) singleDoubleNumObject;

                    // 单的金额计算
                    Object singleAmountObject = GameFiveballRecordMap.get("num" + i + "Single");
                    Float singleAmount = singleAmountObject!=null?(Float) singleAmountObject:0f;
                    if(singleDoubleNum == 0 && singleAmount > 0){
                        money += singleAmount * getOddFromMapByOddKey(betItemMap,"num"+ i + "Single");;;
                    }

                    // 双的金额计算
                    Object doubleAmountObject = GameFiveballRecordMap.get("num" + i + "Double");
                    Float doubleAmount = doubleAmountObject!=null?(Float) doubleAmountObject:0f;
                    if(singleDoubleNum == 1 && doubleAmount > 0){
                        money += doubleAmount * getOddFromMapByOddKey(betItemMap,"num"+ i + "Double");;;
                    }
                }
            }

            // 前三
            // 杂六4 半顺3 顺2 对1 豹0 [豹,对,顺,半顺,杂六]
            if(gameFiveballKj.getNumF() == 0 && GameFiveballRecord.getFirstBan() >0){
                money += GameFiveballRecord.getFirstBan() * getOddFromMapByOddKey(betItemMap,"fBao");
            }
            if(gameFiveballKj.getNumF() == 1 && GameFiveballRecord.getFirstDui() >0){
                money += GameFiveballRecord.getFirstDui() * getOddFromMapByOddKey(betItemMap,"fDui");
            }
            if(gameFiveballKj.getNumF() == 2 && GameFiveballRecord.getFirstSun() >0){
                money += GameFiveballRecord.getFirstSun() * getOddFromMapByOddKey(betItemMap,"fSun");
            }
            if(gameFiveballKj.getNumF() == 3 && GameFiveballRecord.getFirstBan() >0){
                money += GameFiveballRecord.getFirstBan() * getOddFromMapByOddKey(betItemMap,"fBan");
            }
            if(gameFiveballKj.getNumF() == 4 && GameFiveballRecord.getFirstZa() >0){
                money += GameFiveballRecord.getFirstZa() * getOddFromMapByOddKey(betItemMap,"fZa");
            }

            // 中三
            // 杂六4 半顺3 顺2 对1 豹0 [豹,对,顺,半顺,杂六]
            if(gameFiveballKj.getNumM() == 0 && GameFiveballRecord.getMidBan() >0){
                money += GameFiveballRecord.getMidBan() * getOddFromMapByOddKey(betItemMap,"mBao");
            }
            if(gameFiveballKj.getNumM() == 1 && GameFiveballRecord.getMidDui() >0){
                money += GameFiveballRecord.getMidDui() * getOddFromMapByOddKey(betItemMap,"mDui");
            }
            if(gameFiveballKj.getNumM() == 2 && GameFiveballRecord.getMidSun() >0){
                money += GameFiveballRecord.getMidSun() * getOddFromMapByOddKey(betItemMap,"mSun");
            }
            if(gameFiveballKj.getNumM() == 3 && GameFiveballRecord.getMidBan() >0){
                money += GameFiveballRecord.getMidBan() * getOddFromMapByOddKey(betItemMap,"mBan");
            }
            if(gameFiveballKj.getNumM() == 4 && GameFiveballRecord.getMidZa() >0){
                money += GameFiveballRecord.getMidZa() * getOddFromMapByOddKey(betItemMap,"mZa");
            }

            // 后三
            // 杂六4 半顺3 顺2 对1 豹0 [豹,对,顺,半顺,杂六]
            if(gameFiveballKj.getNumB() == 0 && GameFiveballRecord.getBackBan() >0){
                money += GameFiveballRecord.getBackBan() * getOddFromMapByOddKey(betItemMap,"bBao");
            }
            if(gameFiveballKj.getNumB() == 1 && GameFiveballRecord.getBackDui() >0){
                money += GameFiveballRecord.getBackDui() * getOddFromMapByOddKey(betItemMap,"bDui");
            }
            if(gameFiveballKj.getNumB() == 2 && GameFiveballRecord.getBackSun() >0){
                money += GameFiveballRecord.getBackSun() * getOddFromMapByOddKey(betItemMap,"bSun");
            }
            if(gameFiveballKj.getNumB() == 3 && GameFiveballRecord.getBackBan() >0){
                money += GameFiveballRecord.getBackBan() * getOddFromMapByOddKey(betItemMap,"bBan");
            }
            if(gameFiveballKj.getNumB() == 4 && GameFiveballRecord.getBackZa() >0){
                money += GameFiveballRecord.getBackZa() * getOddFromMapByOddKey(betItemMap,"ba");
            }

            otherMoney = money - bigSamllMoney;

            SysUser user = sysUserService.selectUserById(GameFiveballRecord.getUserId());
            user.setScore(user.getScore() + GameFiveballRecord.getCountMoney());
            if(money > 0){
                user.setAmount(user.getAmount() + money);
            }
            sysUserService.updateUserAmount(user);

            Userwin userwin = userwinService.selectTodayUserwin(gameInfo.getGameId(),GameFiveballRecord.getUserId());
            if(userwin == null){
                userwin = new Userwin();
                userwin.setGameId(gameInfo.getGameId());
                userwin.setGameName(gameInfo.getGameName());
                userwin.setUserId(GameFiveballRecord.getUserId());
                userwin.setWinMoney(money - GameFiveballRecord.getCountMoney());
                userwin.setCreateBy("lotteryGameFiveballOpenData");

                userwinService.insertUserwin(userwin);
            }else{

                userwin.setWinMoney(userwin.getWinMoney() + (money - GameFiveballRecord.getCountMoney()));
                userwin.setCreateBy("lotteryGameFiveballOpenData");
                userwinService.updateUserwin(userwin);
            }

            GameFiveballRecord.setWinMoney(money);
            GameFiveballRecord.setStatus("1");
            GameFiveballRecord.setNum1(gameFiveballKj.getNum1());
            GameFiveballRecord.setNum2(gameFiveballKj.getNum2());
            GameFiveballRecord.setNum3(gameFiveballKj.getNum3());
            GameFiveballRecord.setNum4(gameFiveballKj.getNum4());
            GameFiveballRecord.setNum5(gameFiveballKj.getNum5());
            GameFiveballRecord.setSum(gameFiveballKj.getSum());
            GameFiveballRecord.setUpdateBy("lotteryGameFiveballOpenData");

            gameFiveballRecordService.updateGameFiveballRecord(GameFiveballRecord);

            if(money > 0){
                Usermoney usermoney = new Usermoney();
                usermoney.setUserId(GameFiveballRecord.getUserId());
                usermoney.setCashContent("【澳洲幸运10】中奖-" + periodId);
                usermoney.setCashMoney(money);
                usermoney.setUserBalance(user.getAmount());
                usermoney.setType("8");
                usermoney.setGameId(gameInfo.getGameId());
                usermoney.setGameName(gameInfo.getGameName());
                usermoneyService.insertUsermoney(usermoney);
            }

            adminWinMoney += GameFiveballRecord.getCountMoney() - money;
            Float accountResult = money - GameFiveballRecord.getCountMoney();

            BetRecord betRecord = new BetRecord();
            betRecord.setUserId(GameFiveballRecord.getUserId());
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
            todayAdminwin.setCreateBy("lotteryGameFiveballOpenData");

            adminwinService.insertAdminwin(todayAdminwin);
        }else{
            todayAdminwin.setWinMoney(adminWinMoney +todayAdminwin.getWinMoney());
            todayAdminwin.setUpdateBy("lotteryGameFiveballOpenData");
            adminwinService.updateAdminwin(todayAdminwin);
        }

        RecordSumRespVo recordSumRespVo = gameFiveballRecordService.selectSumRecordByPeriodId(gameInfo.getGameId(),periodId);
        gameFiveballKj.setCountMoney(recordSumRespVo.getCountMoney());
        gameFiveballKj.setWinMoney(recordSumRespVo.getWinMoney());
        gameFiveballKjService.updateGameFiveballKjTotalAmountByPeriodId(gameFiveballKj);
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
