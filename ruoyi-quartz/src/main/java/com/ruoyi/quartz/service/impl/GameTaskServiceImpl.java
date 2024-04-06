package com.ruoyi.quartz.service.impl;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.quartz.domain.GameOpenDataDto;
import com.ruoyi.quartz.service.IGameTaskService;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.stream.Collectors;

import java.util.List;
import java.util.Map;

@Service
public class GameTaskServiceImpl implements IGameTaskService {

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private IAzxy10Service azxy10Service;

    @Autowired
    private IJndService jndService;

    @Autowired
    private IJssscService jssscService;

    @Autowired
    private Azxy10LotteryServiceImpl azxy10LotteryService;

    @Autowired
    private Jnd28LotteryServiceImpl jnd28LotteryService;

    @Autowired
    private JssscLotteryServiceImpl jssscLotteryService;

    @Autowired
    private IGameThreeballOpenDataService gameThreeballOpenDataService;

    @Autowired
    private IGameFiveballOpenDataService gameFiveballOpenDataService;

    @Autowired
    private IGameTenballOpenDataService gameTenballOpenDataService;

    @Override
    public void saveThreeBallInfoFromOfficial(String gameCode, List<GameOpenDataDto> openDataList, Map<Long, GameOpenDataDto> gameOpenDataDtoMap) {

        SysGame gameInfo = sysGameService.selectSysGameByGameMarkId(gameCode);
        if(gameInfo == null){
            throw new ServiceException("没有【" + gameCode + "的游戏基础表数据");
        }

        GameThreeballOpenData threeballOpenData = gameThreeballOpenDataService.selectLastRecord(gameInfo.getGameId());
        if(threeballOpenData != null){
            GameOpenDataDto openData = new GameOpenDataDto();

            Long newPeriods = threeballOpenData.getPeriods() + 1;

            if(gameOpenDataDtoMap.get(newPeriods) == null
                    && gameOpenDataDtoMap.get(threeballOpenData.getPeriods()) != null){
                System.out.println(gameInfo.getGameName() + ": 暂时无新数据");
                return;
            }

            Long newId = 0l;
            if((gameOpenDataDtoMap.get(threeballOpenData.getPeriods()) != null)){
                openData = gameOpenDataDtoMap.get(newPeriods);
                newId = newPeriods;
            }else{
                openData = openDataList.get(0);
                newId = openData.getExpect();
            }
            GameThreeballOpenData newGameThreeballOpenDataInfo = gameThreeballOpenDataService.selectGameThreeballOpenDataById(newId);
            boolean newFlg = false;
            if(newGameThreeballOpenDataInfo == null){
                newGameThreeballOpenDataInfo = new GameThreeballOpenData();
                newFlg = true;
            }
            newGameThreeballOpenDataInfo.setPeriods(newId);
            newGameThreeballOpenDataInfo.setGameId(gameInfo.getGameId());
            newGameThreeballOpenDataInfo.setGameName(gameInfo.getGameName());
            String [] numList = openData.getOpencode().split(",");
            newGameThreeballOpenDataInfo.setSum1(Integer.parseInt(numList[0]));
            newGameThreeballOpenDataInfo.setSum2(Integer.parseInt(numList[1]));
            newGameThreeballOpenDataInfo.setSum3(Integer.parseInt(numList[2]));
            newGameThreeballOpenDataInfo.setTime(openData.getOpentime());
            newGameThreeballOpenDataInfo.setCreateBy("TASK");

            if(newFlg){
                gameThreeballOpenDataService.insertGameThreeballOpenData(newGameThreeballOpenDataInfo);
            }else{
                gameThreeballOpenDataService.updateGameThreeballOpenData(newGameThreeballOpenDataInfo);
            }
        }else{
            List<GameOpenDataDto> sortedList = openDataList.stream()
                    .sorted(Comparator.comparing(GameOpenDataDto::getExpect)) // 根据expect字段进行排序
                    .collect(Collectors.toList());
            for(GameOpenDataDto gameOpenDataDto : sortedList){
                GameThreeballOpenData newGameThreeballOpenDataInfo = gameThreeballOpenDataService.selectGameThreeballOpenDataById(gameOpenDataDto.getExpect());
                if(newGameThreeballOpenDataInfo == null) {
                    newGameThreeballOpenDataInfo = new GameThreeballOpenData();
                    newGameThreeballOpenDataInfo.setPeriods(gameOpenDataDto.getExpect());
                    newGameThreeballOpenDataInfo.setGameId(gameInfo.getGameId());
                    newGameThreeballOpenDataInfo.setGameName(gameInfo.getGameName());
                    String[] numList = gameOpenDataDto.getOpencode().split(",");
                    newGameThreeballOpenDataInfo.setSum1(Integer.parseInt(numList[0]));
                    newGameThreeballOpenDataInfo.setSum2(Integer.parseInt(numList[1]));
                    newGameThreeballOpenDataInfo.setSum3(Integer.parseInt(numList[2]));
                    newGameThreeballOpenDataInfo.setTime(gameOpenDataDto.getOpentime());
                    newGameThreeballOpenDataInfo.setCreateBy("TASK");

                    gameThreeballOpenDataService.insertGameThreeballOpenData(newGameThreeballOpenDataInfo);
                }
            }
        }
    }

    @Override
    public void saveFiveBallInfoFromOfficial(String gameCode, List<GameOpenDataDto> openDataList, Map<Long, GameOpenDataDto> gameOpenDataDtoMap) {

        SysGame gameInfo = sysGameService.selectSysGameByGameMarkId(gameCode);
        if(gameInfo == null){
            throw new ServiceException("没有【" + gameCode + "的游戏基础表数据");
        }

        GameFiveballOpenData fiveballOpenData = gameFiveballOpenDataService.selectLastRecord(gameInfo.getGameId());
        if(fiveballOpenData != null){
            GameOpenDataDto openData = new GameOpenDataDto();

            Long newPeriods = fiveballOpenData.getPeriods() + 1;

            if(gameOpenDataDtoMap.get(newPeriods) == null
                    && gameOpenDataDtoMap.get(fiveballOpenData.getPeriods()) != null){
                System.out.println(gameInfo.getGameName() + ": 暂时无新数据");
                return;
            }

            Long newId = 0l;
            if((gameOpenDataDtoMap.get(fiveballOpenData.getPeriods()) != null)){
                openData = gameOpenDataDtoMap.get(newPeriods);
                newId = newPeriods;
            }else{
                openData = openDataList.get(0);
                newId = openData.getExpect();
            }
            GameFiveballOpenData newGameFiveballOpenDataInfo = gameFiveballOpenDataService.selectGameFiveballOpenDataById(newId);
            boolean newFlg = false;
            if(newGameFiveballOpenDataInfo == null){
                newGameFiveballOpenDataInfo = new GameFiveballOpenData();
                newFlg = true;
            }
            newGameFiveballOpenDataInfo.setPeriods(newId);
            newGameFiveballOpenDataInfo.setGameId(gameInfo.getGameId());
            newGameFiveballOpenDataInfo.setGameName(gameInfo.getGameName());
            String [] numList = openData.getOpencode().split(",");
            newGameFiveballOpenDataInfo.setNum1(Integer.parseInt(numList[0]));
            newGameFiveballOpenDataInfo.setNum2(Integer.parseInt(numList[1]));
            newGameFiveballOpenDataInfo.setNum3(Integer.parseInt(numList[2]));
            newGameFiveballOpenDataInfo.setNum4(Integer.parseInt(numList[3]));
            newGameFiveballOpenDataInfo.setNum5(Integer.parseInt(numList[4]));
            newGameFiveballOpenDataInfo.setTime(openData.getOpentime());
            newGameFiveballOpenDataInfo.setCreateBy("TASK");

            if(newFlg){
                gameFiveballOpenDataService.insertGameFiveballOpenData(newGameFiveballOpenDataInfo);
            }else{
                gameFiveballOpenDataService.updateGameFiveballOpenData(newGameFiveballOpenDataInfo);
            }
        }else{
            List<GameOpenDataDto> sortedList = openDataList.stream()
                    .sorted(Comparator.comparing(GameOpenDataDto::getExpect)) // 根据expect字段进行排序
                    .collect(Collectors.toList());
            for(GameOpenDataDto gameOpenDataDto : sortedList){
                GameFiveballOpenData newGameFiveballOpenDataInfo = gameFiveballOpenDataService.selectGameFiveballOpenDataById(gameOpenDataDto.getExpect());
                if(newGameFiveballOpenDataInfo == null) {
                    newGameFiveballOpenDataInfo = new GameFiveballOpenData();
                    newGameFiveballOpenDataInfo.setPeriods(gameOpenDataDto.getExpect());
                    newGameFiveballOpenDataInfo.setGameId(gameInfo.getGameId());
                    newGameFiveballOpenDataInfo.setGameName(gameInfo.getGameName());
                    String[] numList = gameOpenDataDto.getOpencode().split(",");
                    newGameFiveballOpenDataInfo.setNum1(Integer.parseInt(numList[0]));
                    newGameFiveballOpenDataInfo.setNum2(Integer.parseInt(numList[1]));
                    newGameFiveballOpenDataInfo.setNum3(Integer.parseInt(numList[2]));
                    newGameFiveballOpenDataInfo.setNum4(Integer.parseInt(numList[3]));
                    newGameFiveballOpenDataInfo.setNum5(Integer.parseInt(numList[4]));
                    newGameFiveballOpenDataInfo.setTime(gameOpenDataDto.getOpentime());
                    newGameFiveballOpenDataInfo.setCreateBy("TASK");

                    gameFiveballOpenDataService.insertGameFiveballOpenData(newGameFiveballOpenDataInfo);
                }
            }
        }
    }

    @Override
    public void saveTenBallInfoFromOfficial(String gameCode, List<GameOpenDataDto> openDataList, Map<Long, GameOpenDataDto> gameOpenDataDtoMap) {

        SysGame gameInfo = sysGameService.selectSysGameByGameMarkId(gameCode);
        if(gameInfo == null){
            throw new ServiceException("没有【" + gameCode + "的游戏基础表数据");
        }

        GameTenballOpenData tenballOpenData = gameTenballOpenDataService.selectLastRecord(gameInfo.getGameId());
        if(tenballOpenData != null){
            GameOpenDataDto openData = new GameOpenDataDto();

            Long newPeriods = tenballOpenData.getPeriods() + 1;

            if(gameOpenDataDtoMap.get(newPeriods) == null
                    && gameOpenDataDtoMap.get(tenballOpenData.getPeriods()) != null){
                System.out.println(gameInfo.getGameName() + ": 暂时无新数据");
                return;
            }

            Long newId = 0l;
            if((gameOpenDataDtoMap.get(tenballOpenData.getPeriods()) != null)){
                openData = gameOpenDataDtoMap.get(newPeriods);
                newId = newPeriods;
            }else{
                openData = openDataList.get(0);
                newId = openData.getExpect();
            }

            GameTenballOpenData newGameTenballOpenData = gameTenballOpenDataService.selectGameTenballOpenDataByPeriods(gameInfo.getGameId(), newId);

            boolean newFlg = false;
            if(newGameTenballOpenData == null){
                newGameTenballOpenData = new GameTenballOpenData();
                newFlg = true;
            }
            newGameTenballOpenData.setPeriods(newId);
            newGameTenballOpenData.setGameId(gameInfo.getGameId());
            newGameTenballOpenData.setGameName(gameInfo.getGameName());
            String [] numList = openData.getOpencode().split(",");
            newGameTenballOpenData.setNum1(Integer.parseInt(numList[0]));
            newGameTenballOpenData.setNum2(Integer.parseInt(numList[1]));
            newGameTenballOpenData.setNum3(Integer.parseInt(numList[2]));
            newGameTenballOpenData.setNum4(Integer.parseInt(numList[3]));
            newGameTenballOpenData.setNum5(Integer.parseInt(numList[4]));
            newGameTenballOpenData.setNum6(Integer.parseInt(numList[5]));
            newGameTenballOpenData.setNum7(Integer.parseInt(numList[6]));
            newGameTenballOpenData.setNum8(Integer.parseInt(numList[7]));
            newGameTenballOpenData.setNum9(Integer.parseInt(numList[8]));
            newGameTenballOpenData.setNum10(Integer.parseInt(numList[9]));
            newGameTenballOpenData.setTime(openData.getOpentime());
            newGameTenballOpenData.setCreateBy("TASK");

            if(newFlg){
                gameTenballOpenDataService.insertGameTenballOpenData(newGameTenballOpenData);
            }else{
                gameTenballOpenDataService.updateGameTenballOpenData(newGameTenballOpenData);
            }
        }else{
            List<GameOpenDataDto> sortedList = openDataList.stream()
                    .sorted(Comparator.comparing(GameOpenDataDto::getExpect)) // 根据expect字段进行排序
                    .collect(Collectors.toList());

            for(GameOpenDataDto gameOpenDataDto : sortedList){
                GameTenballOpenData newGameTenballOpenData = gameTenballOpenDataService.selectGameTenballOpenDataByPeriods(gameInfo.getGameId(), gameOpenDataDto.getExpect());
                if(newGameTenballOpenData == null) {
                    newGameTenballOpenData = new GameTenballOpenData();
                    newGameTenballOpenData.setPeriods(gameOpenDataDto.getExpect());
                    newGameTenballOpenData.setGameId(gameInfo.getGameId());
                    newGameTenballOpenData.setGameName(gameInfo.getGameName());
                    String[] numList = gameOpenDataDto.getOpencode().split(",");
                    newGameTenballOpenData.setNum1(Integer.parseInt(numList[0]));
                    newGameTenballOpenData.setNum2(Integer.parseInt(numList[1]));
                    newGameTenballOpenData.setNum3(Integer.parseInt(numList[2]));
                    newGameTenballOpenData.setNum4(Integer.parseInt(numList[3]));
                    newGameTenballOpenData.setNum5(Integer.parseInt(numList[4]));
                    newGameTenballOpenData.setNum6(Integer.parseInt(numList[5]));
                    newGameTenballOpenData.setNum7(Integer.parseInt(numList[6]));
                    newGameTenballOpenData.setNum8(Integer.parseInt(numList[7]));
                    newGameTenballOpenData.setNum9(Integer.parseInt(numList[8]));
                    newGameTenballOpenData.setNum10(Integer.parseInt(numList[9]));
                    newGameTenballOpenData.setTime(gameOpenDataDto.getOpentime());
                    newGameTenballOpenData.setCreateBy("TASK");

                    gameTenballOpenDataService.insertGameTenballOpenData(newGameTenballOpenData);
                }
            }
        }
    }

    @Override
    public void saveAzxy10InfoFromOfficial(List<GameOpenDataDto> openDataList, Map<Long, GameOpenDataDto> gameOpenDataDtoMap) {
        // 澳洲幸运10
        Azxy10 azxy10Info = azxy10Service.selectLastRecord();
        if(azxy10Info != null){
            GameOpenDataDto openData = new GameOpenDataDto();

            Long newPeriods = azxy10Info.getId() + 1;

            if(gameOpenDataDtoMap.get(newPeriods) == null
                    && gameOpenDataDtoMap.get(azxy10Info.getId()) != null){
                System.out.println("加拿大2.8: 暂时无新数据");
                return;
            }

            Long newId = 0l;
            if((gameOpenDataDtoMap.get(azxy10Info.getId()) != null)){
                openData = gameOpenDataDtoMap.get(newPeriods);
                newId = newPeriods;
            }else{
                openData = openDataList.get(0);
                newId = openData.getExpect();
            }
            Azxy10 newAzxy10Info = azxy10Service.selectAzxy10ById(newId);
            boolean newFlg = false;
            if(newAzxy10Info == null){
                newAzxy10Info = new Azxy10();
                newFlg = true;
            }
            newAzxy10Info.setId(newId);
            String [] numList = openData.getOpencode().split(",");
            newAzxy10Info.setNum1(Integer.parseInt(numList[0]));
            newAzxy10Info.setNum2(Integer.parseInt(numList[1]));
            newAzxy10Info.setNum3(Integer.parseInt(numList[2]));
            newAzxy10Info.setNum4(Integer.parseInt(numList[3]));
            newAzxy10Info.setNum5(Integer.parseInt(numList[4]));
            newAzxy10Info.setNum6(Integer.parseInt(numList[5]));
            newAzxy10Info.setNum7(Integer.parseInt(numList[6]));
            newAzxy10Info.setNum8(Integer.parseInt(numList[7]));
            newAzxy10Info.setNum9(Integer.parseInt(numList[8]));
            newAzxy10Info.setNum10(Integer.parseInt(numList[9]));
            newAzxy10Info.setTime(openData.getOpentime());
            newAzxy10Info.setCreateBy("TASK");

            if(newFlg){
                azxy10Service.insertAzxy10(newAzxy10Info);
            }else{
                azxy10Service.updateAzxy10(newAzxy10Info);
            }
        }else{
            for(GameOpenDataDto gameOpenDataDto : openDataList){
                Azxy10 newAzxy10Info = azxy10Service.selectAzxy10ById(gameOpenDataDto.getExpect());
                if(newAzxy10Info == null) {
                    newAzxy10Info = new Azxy10();
                    newAzxy10Info.setId(gameOpenDataDto.getExpect());
                    String[] numList = gameOpenDataDto.getOpencode().split(",");
                    newAzxy10Info.setNum1(Integer.parseInt(numList[0]));
                    newAzxy10Info.setNum2(Integer.parseInt(numList[1]));
                    newAzxy10Info.setNum3(Integer.parseInt(numList[2]));
                    newAzxy10Info.setNum4(Integer.parseInt(numList[3]));
                    newAzxy10Info.setNum5(Integer.parseInt(numList[4]));
                    newAzxy10Info.setNum6(Integer.parseInt(numList[5]));
                    newAzxy10Info.setNum7(Integer.parseInt(numList[6]));
                    newAzxy10Info.setNum8(Integer.parseInt(numList[7]));
                    newAzxy10Info.setNum9(Integer.parseInt(numList[8]));
                    newAzxy10Info.setNum10(Integer.parseInt(numList[9]));
                    newAzxy10Info.setTime(gameOpenDataDto.getOpentime());
                    newAzxy10Info.setCreateBy("TASK");

                    azxy10Service.insertAzxy10(newAzxy10Info);
                }
            }
        }
    }

    @Override
    public void lotteryAzxy10Balance(String gameCode) {
        azxy10LotteryService.lotteryAzxy10(gameCode);
    }

    @Override
    public void saveJndInfoFromOfficial(List<GameOpenDataDto> openDataList, Map<Long, GameOpenDataDto> gameOpenDataDtoMap) {
        // 加拿大2.8
        Jnd jndInfo = jndService.selectLastRecord();
        if(jndInfo != null){
            GameOpenDataDto openData = new GameOpenDataDto();

            Long newPeriods = jndInfo.getId() + 1;

            if(gameOpenDataDtoMap.get(newPeriods) == null
                    && gameOpenDataDtoMap.get(jndInfo.getId()) != null){
                System.out.println("加拿大2.8: 暂时无新数据");
                return;
            }

            Long newId = 0l;
            if((gameOpenDataDtoMap.get(jndInfo.getId()) != null)){
                openData = gameOpenDataDtoMap.get(newPeriods);
                newId = newPeriods;
            }else{
                openData = openDataList.get(0);
                newId = openData.getExpect();
            }
            Jnd newJndInfo = jndService.selectJndById(newId);
            boolean newFlg = false;
            if(newJndInfo == null){
                newJndInfo = new Jnd();
                newFlg = true;
            }
            newJndInfo.setId(newId);
            String [] numList = openData.getOpencode().split(",");
            newJndInfo.setSum1(Integer.parseInt(numList[0]));
            newJndInfo.setSum2(Integer.parseInt(numList[1]));
            newJndInfo.setSum3(Integer.parseInt(numList[2]));
            newJndInfo.setTime(openData.getOpentime());
            newJndInfo.setCreateBy("TASK");

            if(newFlg){
                jndService.insertJnd(newJndInfo);
            }else{
                jndService.updateJnd(newJndInfo);
            }
        }else{
            for(GameOpenDataDto gameOpenDataDto : openDataList){
                Jnd newJndInfo = jndService.selectJndById(gameOpenDataDto.getExpect());
                if(newJndInfo == null) {
                    newJndInfo = new Jnd();
                    newJndInfo.setId(gameOpenDataDto.getExpect());
                    String[] numList = gameOpenDataDto.getOpencode().split(",");
                    newJndInfo.setSum1(Integer.parseInt(numList[0]));
                    newJndInfo.setSum2(Integer.parseInt(numList[1]));
                    newJndInfo.setSum3(Integer.parseInt(numList[2]));
                    newJndInfo.setTime(gameOpenDataDto.getOpentime());
                    newJndInfo.setCreateBy("TASK");

                    jndService.insertJnd(newJndInfo);
                }
            }
        }
    }

    @Override
    public void lotteryJndBalance(String gameCode) {
        jnd28LotteryService.lotteryJnd28(gameCode);
    }

    @Override
    public void saveJssscInfoFromOfficial(List<GameOpenDataDto> openDataList, Map<Long, GameOpenDataDto> gameOpenDataDtoMap) {
        // 急速时时彩
        Jsssc jssscInfo = jssscService.selectLastRecord();
        if(jssscInfo != null){
            GameOpenDataDto openData = new GameOpenDataDto();

            Long newPeriods = jssscInfo.getId() + 1;

            if(gameOpenDataDtoMap.get(newPeriods) == null
                    && gameOpenDataDtoMap.get(jssscInfo.getId()) != null){
                System.out.println("加拿大2.8: 暂时无新数据");
                return;
            }

            Long newId = 0l;
            if((gameOpenDataDtoMap.get(jssscInfo.getId()) != null)){
                openData = gameOpenDataDtoMap.get(newPeriods);
                newId = newPeriods;
            }else{
                openData = openDataList.get(0);
                newId = openData.getExpect();
            }
            Jsssc newJssscInfo = jssscService.selectJssscById(newId);
            boolean newFlg = false;
            if(newJssscInfo == null){
                newJssscInfo = new Jsssc();
                newFlg = true;
            }
            newJssscInfo.setId(newId);
            String [] numList = openData.getOpencode().split(",");
            newJssscInfo.setNum1(Integer.parseInt(numList[0]));
            newJssscInfo.setNum2(Integer.parseInt(numList[1]));
            newJssscInfo.setNum3(Integer.parseInt(numList[2]));
            newJssscInfo.setNum4(Integer.parseInt(numList[3]));
            newJssscInfo.setNum5(Integer.parseInt(numList[4]));
            newJssscInfo.setTime(openData.getOpentime());
            newJssscInfo.setCreateBy("TASK");

            if(newFlg){
                jssscService.insertJsssc(newJssscInfo);
            }else{
                jssscService.updateJsssc(newJssscInfo);
            }
        }else{
            for(GameOpenDataDto gameOpenDataDto : openDataList){
                Jsssc newJssscInfo = jssscService.selectJssscById(gameOpenDataDto.getExpect());
                if(newJssscInfo == null) {
                    newJssscInfo = new Jsssc();
                    newJssscInfo.setId(gameOpenDataDto.getExpect());
                    String[] numList = gameOpenDataDto.getOpencode().split(",");
                    newJssscInfo.setNum1(Integer.parseInt(numList[0]));
                    newJssscInfo.setNum2(Integer.parseInt(numList[1]));
                    newJssscInfo.setNum3(Integer.parseInt(numList[2]));
                    newJssscInfo.setNum4(Integer.parseInt(numList[3]));
                    newJssscInfo.setNum5(Integer.parseInt(numList[4]));
                    newJssscInfo.setTime(gameOpenDataDto.getOpentime());
                    newJssscInfo.setCreateBy("TASK");

                    jssscService.insertJsssc(newJssscInfo);
                }
            }
        }
    }

    @Override
    public void lotteryJssscBalance(String gameCode) {
        jssscLotteryService.lotteryJsssc(gameCode);
    }
}
