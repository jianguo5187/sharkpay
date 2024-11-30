package com.ruoyi.quartz.service.impl;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.quartz.service.IGameTaskService;
import com.ruoyi.system.domain.GameThreeballKj;
import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Random;

@Service
public class GameTaskServiceImpl implements IGameTaskService {

    @Autowired
    private IThreeBallLotteryService threeBallLotteryService;

    @Autowired
    private IFiveBallLotteryService fiveBallLotteryService;

    @Autowired
    private ITenBallLotteryService tenBallLotteryService;

    @Autowired
    private IBetkjService betkjService;

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private IGameThreeBallsService gameThreeBallsService;

    @Autowired
    private IGameFiveBallsService gameFiveBallsService;

    @Autowired
    private IGameTenBallsService gameTenBallsService;

    @Autowired
    private IUserwinService userwinService;

    @Override
    public void saveThreeBallInfoFromOfficial(String gameCode, List<GameOpenDataDto> openDataList, Map<Long, GameOpenDataDto> gameOpenDataDtoMap) {

        betkjService.saveThreeBallInfoFromOfficial(gameCode,openDataList,gameOpenDataDtoMap);
    }

//    @Override
//    public void saveThreeBallInfoFromSystem(SysGame gameInfo) {
//        betkjService.saveThreeBallInfoFromSystem(gameInfo);
//    }

    @Override
    public void saveFiveBallInfoFromOfficial(String gameCode, List<GameOpenDataDto> openDataList, Map<Long, GameOpenDataDto> gameOpenDataDtoMap) {

        betkjService.saveFiveBallInfoFromOfficial(gameCode,openDataList,gameOpenDataDtoMap);
    }

//    @Override
//    public void saveFiveBallInfoFromSystem(SysGame gameInfo) {
//        betkjService.saveFiveBallInfoFromSystem(gameInfo);
//    }

    @Override
    public void saveTenBallInfoFromOfficial(String gameCode, List<GameOpenDataDto> openDataList, Map<Long, GameOpenDataDto> gameOpenDataDtoMap) {

        betkjService.saveTenBallInfoFromOfficial(gameCode,openDataList,gameOpenDataDtoMap);
    }

//    @Override
//    public void saveTenBallInfoFromSystem(SysGame gameInfo) {
//        betkjService.saveTenBallInfoFromSystem(gameInfo);
//    }

    @Override
    public void openThreeBallSystemExpectData(SysGame gameInfo) {
        betkjService.openThreeBallSystemExpectData(gameInfo);
    }

    @Override
    public void openFiveBallSystemExpectData(SysGame gameInfo) {
        betkjService.openFiveBallSystemExpectData(gameInfo);
    }

    @Override
    public void openTenBallSystemExpectData(SysGame gameInfo) {
        betkjService.openTenBallSystemExpectData(gameInfo);
    }

    @Override
    public void lotteryThreeBallBalance(String gameCode) {
        threeBallLotteryService.lotteryThreeBall(gameCode);
    }

    @Override
    public void lotteryFiveBallBalance(String gameCode) {
        fiveBallLotteryService.lotteryFiveBall(gameCode);
    }

    @Override
    public void lotteryTenBallBalance(String gameCode) {
        tenBallLotteryService.lotteryTenBall(gameCode);
    }
//
//    @Override
//    public void saveAzxy10InfoFromOfficial(List<GameOpenDataDto> openDataList, Map<Long, GameOpenDataDto> gameOpenDataDtoMap) {
//        // 澳洲幸运10
//        Azxy10 azxy10Info = azxy10Service.selectLastRecord();
//        if(azxy10Info != null){
//            GameOpenDataDto openData = new GameOpenDataDto();
//
//            Long newPeriods = azxy10Info.getId() + 1;
//
//            if(gameOpenDataDtoMap.get(newPeriods) == null
//                    && gameOpenDataDtoMap.get(azxy10Info.getId()) != null){
//                System.out.println("加拿大2.8: 暂时无新数据");
//                return;
//            }
//
//            Long newId = 0l;
//            if((gameOpenDataDtoMap.get(azxy10Info.getId()) != null)){
//                openData = gameOpenDataDtoMap.get(newPeriods);
//                newId = newPeriods;
//            }else{
//                openData = openDataList.get(0);
//                newId = openData.getExpect();
//            }
//            Azxy10 newAzxy10Info = azxy10Service.selectAzxy10ById(newId);
//            boolean newFlg = false;
//            if(newAzxy10Info == null){
//                newAzxy10Info = new Azxy10();
//                newFlg = true;
//            }
//            newAzxy10Info.setId(newId);
//            String [] numList = openData.getOpencode().split(",");
//            newAzxy10Info.setNum1(Integer.parseInt(numList[0]));
//            newAzxy10Info.setNum2(Integer.parseInt(numList[1]));
//            newAzxy10Info.setNum3(Integer.parseInt(numList[2]));
//            newAzxy10Info.setNum4(Integer.parseInt(numList[3]));
//            newAzxy10Info.setNum5(Integer.parseInt(numList[4]));
//            newAzxy10Info.setNum6(Integer.parseInt(numList[5]));
//            newAzxy10Info.setNum7(Integer.parseInt(numList[6]));
//            newAzxy10Info.setNum8(Integer.parseInt(numList[7]));
//            newAzxy10Info.setNum9(Integer.parseInt(numList[8]));
//            newAzxy10Info.setNum10(Integer.parseInt(numList[9]));
//            newAzxy10Info.setTime(openData.getOpentime());
//            newAzxy10Info.setCreateBy("TASK");
//
//            if(newFlg){
//                azxy10Service.insertAzxy10(newAzxy10Info);
//            }else{
//                azxy10Service.updateAzxy10(newAzxy10Info);
//            }
//        }else{
//            for(GameOpenDataDto gameOpenDataDto : openDataList){
//                Azxy10 newAzxy10Info = azxy10Service.selectAzxy10ById(gameOpenDataDto.getExpect());
//                if(newAzxy10Info == null) {
//                    newAzxy10Info = new Azxy10();
//                    newAzxy10Info.setId(gameOpenDataDto.getExpect());
//                    String[] numList = gameOpenDataDto.getOpencode().split(",");
//                    newAzxy10Info.setNum1(Integer.parseInt(numList[0]));
//                    newAzxy10Info.setNum2(Integer.parseInt(numList[1]));
//                    newAzxy10Info.setNum3(Integer.parseInt(numList[2]));
//                    newAzxy10Info.setNum4(Integer.parseInt(numList[3]));
//                    newAzxy10Info.setNum5(Integer.parseInt(numList[4]));
//                    newAzxy10Info.setNum6(Integer.parseInt(numList[5]));
//                    newAzxy10Info.setNum7(Integer.parseInt(numList[6]));
//                    newAzxy10Info.setNum8(Integer.parseInt(numList[7]));
//                    newAzxy10Info.setNum9(Integer.parseInt(numList[8]));
//                    newAzxy10Info.setNum10(Integer.parseInt(numList[9]));
//                    newAzxy10Info.setTime(gameOpenDataDto.getOpentime());
//                    newAzxy10Info.setCreateBy("TASK");
//
//                    azxy10Service.insertAzxy10(newAzxy10Info);
//                }
//            }
//        }
//    }
//
//    @Override
//    public void lotteryAzxy10Balance(String gameCode) {
//        azxy10LotteryService.lotteryAzxy10(gameCode);
//    }
//
//    @Override
//    public void saveJndInfoFromOfficial(List<GameOpenDataDto> openDataList, Map<Long, GameOpenDataDto> gameOpenDataDtoMap) {
//        // 加拿大2.8
//        Jnd jndInfo = jndService.selectLastRecord();
//        if(jndInfo != null){
//            GameOpenDataDto openData = new GameOpenDataDto();
//
//            Long newPeriods = jndInfo.getId() + 1;
//
//            if(gameOpenDataDtoMap.get(newPeriods) == null
//                    && gameOpenDataDtoMap.get(jndInfo.getId()) != null){
//                System.out.println("加拿大2.8: 暂时无新数据");
//                return;
//            }
//
//            Long newId = 0l;
//            if((gameOpenDataDtoMap.get(jndInfo.getId()) != null)){
//                openData = gameOpenDataDtoMap.get(newPeriods);
//                newId = newPeriods;
//            }else{
//                openData = openDataList.get(0);
//                newId = openData.getExpect();
//            }
//            Jnd newJndInfo = jndService.selectJndById(newId);
//            boolean newFlg = false;
//            if(newJndInfo == null){
//                newJndInfo = new Jnd();
//                newFlg = true;
//            }
//            newJndInfo.setId(newId);
//            String [] numList = openData.getOpencode().split(",");
//            newJndInfo.setSum1(Integer.parseInt(numList[0]));
//            newJndInfo.setSum2(Integer.parseInt(numList[1]));
//            newJndInfo.setSum3(Integer.parseInt(numList[2]));
//            newJndInfo.setTime(openData.getOpentime());
//            newJndInfo.setCreateBy("TASK");
//
//            if(newFlg){
//                jndService.insertJnd(newJndInfo);
//            }else{
//                jndService.updateJnd(newJndInfo);
//            }
//        }else{
//            for(GameOpenDataDto gameOpenDataDto : openDataList){
//                Jnd newJndInfo = jndService.selectJndById(gameOpenDataDto.getExpect());
//                if(newJndInfo == null) {
//                    newJndInfo = new Jnd();
//                    newJndInfo.setId(gameOpenDataDto.getExpect());
//                    String[] numList = gameOpenDataDto.getOpencode().split(",");
//                    newJndInfo.setSum1(Integer.parseInt(numList[0]));
//                    newJndInfo.setSum2(Integer.parseInt(numList[1]));
//                    newJndInfo.setSum3(Integer.parseInt(numList[2]));
//                    newJndInfo.setTime(gameOpenDataDto.getOpentime());
//                    newJndInfo.setCreateBy("TASK");
//
//                    jndService.insertJnd(newJndInfo);
//                }
//            }
//        }
//    }
//
//    @Override
//    public void lotteryJndBalance(String gameCode) {
//        jnd28LotteryService.lotteryJnd28(gameCode);
//    }
//
//    @Override
//    public void saveJssscInfoFromOfficial(List<GameOpenDataDto> openDataList, Map<Long, GameOpenDataDto> gameOpenDataDtoMap) {
//        // 急速时时彩
//        Jsssc jssscInfo = jssscService.selectLastRecord();
//        if(jssscInfo != null){
//            GameOpenDataDto openData = new GameOpenDataDto();
//
//            Long newPeriods = jssscInfo.getId() + 1;
//
//            if(gameOpenDataDtoMap.get(newPeriods) == null
//                    && gameOpenDataDtoMap.get(jssscInfo.getId()) != null){
//                System.out.println("加拿大2.8: 暂时无新数据");
//                return;
//            }
//
//            Long newId = 0l;
//            if((gameOpenDataDtoMap.get(jssscInfo.getId()) != null)){
//                openData = gameOpenDataDtoMap.get(newPeriods);
//                newId = newPeriods;
//            }else{
//                openData = openDataList.get(0);
//                newId = openData.getExpect();
//            }
//            Jsssc newJssscInfo = jssscService.selectJssscById(newId);
//            boolean newFlg = false;
//            if(newJssscInfo == null){
//                newJssscInfo = new Jsssc();
//                newFlg = true;
//            }
//            newJssscInfo.setId(newId);
//            String [] numList = openData.getOpencode().split(",");
//            newJssscInfo.setNum1(Integer.parseInt(numList[0]));
//            newJssscInfo.setNum2(Integer.parseInt(numList[1]));
//            newJssscInfo.setNum3(Integer.parseInt(numList[2]));
//            newJssscInfo.setNum4(Integer.parseInt(numList[3]));
//            newJssscInfo.setNum5(Integer.parseInt(numList[4]));
//            newJssscInfo.setTime(openData.getOpentime());
//            newJssscInfo.setCreateBy("TASK");
//
//            if(newFlg){
//                jssscService.insertJsssc(newJssscInfo);
//            }else{
//                jssscService.updateJsssc(newJssscInfo);
//            }
//        }else{
//            for(GameOpenDataDto gameOpenDataDto : openDataList){
//                Jsssc newJssscInfo = jssscService.selectJssscById(gameOpenDataDto.getExpect());
//                if(newJssscInfo == null) {
//                    newJssscInfo = new Jsssc();
//                    newJssscInfo.setId(gameOpenDataDto.getExpect());
//                    String[] numList = gameOpenDataDto.getOpencode().split(",");
//                    newJssscInfo.setNum1(Integer.parseInt(numList[0]));
//                    newJssscInfo.setNum2(Integer.parseInt(numList[1]));
//                    newJssscInfo.setNum3(Integer.parseInt(numList[2]));
//                    newJssscInfo.setNum4(Integer.parseInt(numList[3]));
//                    newJssscInfo.setNum5(Integer.parseInt(numList[4]));
//                    newJssscInfo.setTime(gameOpenDataDto.getOpentime());
//                    newJssscInfo.setCreateBy("TASK");
//
//                    jssscService.insertJsssc(newJssscInfo);
//                }
//            }
//        }
//    }
//
//    @Override
//    public void lotteryJssscBalance(String gameCode) {
//        jssscLotteryService.lotteryJsssc(gameCode);
//    }

    @Override
    public void insertRobotBet(){

        SysGame sysGame = new SysGame();
        sysGame.setStatus("0"); //有效
        List<SysGame> gameList = sysGameService.selectSysGameList(sysGame);
        for(SysGame gameInfo : gameList){
            Random random = new Random();
            // 80%概率增加下注概率
//            if (random.nextDouble() <= 0.8) {
                if(StringUtils.equals(gameInfo.getGameType(),"3")){
                    // 3球
                    ThreeBallsOddsReqVO threeBallsOddsReqVO = new ThreeBallsOddsReqVO();
                    threeBallsOddsReqVO.setGameId(gameInfo.getGameId());
                    ThreeBallsTimeDateRespVO threeBallsTimeDateRespVO = gameThreeBallsService.timeDate(threeBallsOddsReqVO);
                    VirtuallyGameRecordReqVO virtuallyGameRecordReqVO = new VirtuallyGameRecordReqVO();
                    virtuallyGameRecordReqVO.setGameId(gameInfo.getGameId());
                    virtuallyGameRecordReqVO.setPeriods(threeBallsTimeDateRespVO.getPeriods());
                    gameThreeBallsService.virtuallyGameRecord(2l,virtuallyGameRecordReqVO, true);

                }else if(StringUtils.equals(gameInfo.getGameType(),"5")){
                    // 5球

                    FiveBallsOddsReqVO fiveBallsOddsReqVO = new FiveBallsOddsReqVO();
                    fiveBallsOddsReqVO.setGameId(gameInfo.getGameId());
                    FiveBallsTimeDateRespVO fiveBallsTimeDateRespVO = gameFiveBallsService.timeDate(fiveBallsOddsReqVO);
                    VirtuallyGameRecordReqVO virtuallyGameRecordReqVO = new VirtuallyGameRecordReqVO();
                    virtuallyGameRecordReqVO.setGameId(gameInfo.getGameId());
                    virtuallyGameRecordReqVO.setPeriods(fiveBallsTimeDateRespVO.getPeriods());
                    gameFiveBallsService.virtuallyGameRecord(2l,virtuallyGameRecordReqVO, true);
                }else{
                    // 10球

                    TenBallsOddsReqVO tenBallsOddsReqVO = new TenBallsOddsReqVO();
                    tenBallsOddsReqVO.setGameId(gameInfo.getGameId());
                    TenBallsTimeDateRespVO tenBallsTimeDateRespVO = gameTenBallsService.timeDate(tenBallsOddsReqVO);
                    VirtuallyGameRecordReqVO virtuallyGameRecordReqVO = new VirtuallyGameRecordReqVO();
                    virtuallyGameRecordReqVO.setGameId(gameInfo.getGameId());
                    virtuallyGameRecordReqVO.setPeriods(tenBallsTimeDateRespVO.getPeriods());
                    gameTenBallsService.virtuallyGameRecord(2l,virtuallyGameRecordReqVO, true);
                }
//            }
        }
    }

    @Override
    public void autoKajiangLottery() {
        betkjService.autoKajiangLottery();
    }

    @Override
    public void autoAllRepairLottery() {
        betkjService.autoAllRepairLottery();
    }

    @Override
    public void autoDeleteOldRobotBet() {
        betkjService.autoDeleteOldRobotBet();
    }

    @Override
    public void autoAllBetRepair() {

        SysGame sysGame = new SysGame();
        sysGame.setStatus("0"); //有效
        List<SysGame> gameList = sysGameService.selectSysGameList(sysGame);
        for(SysGame gameInfo : gameList){
            BetRepairReqVO vo = new BetRepairReqVO();
            vo.setGameId(gameInfo.getGameId());
            betkjService.BetRepair(vo);
        }
    }

    @Override
    public void autoCommissionBalance() {
        userwinService.autoCommissionBalance();
    }

    @Override
    public void autoCashbackBalance() {
        userwinService.autoCashbackBalance();
    }
}
