package com.ruoyi.system.service.impl;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.mapper.BetkjMapper;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 开奖Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@Service
public class BetkjServiceImpl implements IBetkjService
{
    @Autowired
    private BetkjMapper betkjMapper;

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private IGameThreeballOpenDataService gameThreeballOpenDataService;

    @Autowired
    private IGameThreeballKjService gameThreeballKjService;

    @Autowired
    private IGameFiveballOpenDataService gameFiveballOpenDataService;

    @Autowired
    private IGameFiveballKjService gameFiveballKjService;

    @Autowired
    private IGameTenballOpenDataService gameTenballOpenDataService;

    @Autowired
    private IGameTenballKjService gameTenballKjService;

    @Autowired
    private IThreeBallLotteryService threeBallLotteryService;

    @Autowired
    private IFiveBallLotteryService fiveBallLotteryService;

    @Autowired
    private ITenBallLotteryService tenBallLotteryService;

    // 获取官方开奖结果的URL
    @Value("${autoGame.url}")
    private String gameUrl;

    /**
     * 查询开奖列表
     *
     * @param betkjReqVO 开奖
     * @return 开奖集合
     */
    @Override
    public List<BetkjRespVo> selectBetkjList(SysGame gameInfo , BetkjReqVO betkjReqVO) {
        String kjTable = "";
        if(StringUtils.equals(gameInfo.getGameType(),"3")){
            kjTable = "game_threeball_kj";
        }else if(StringUtils.equals(gameInfo.getGameType(),"5")){
            kjTable = "game_fiveball_kj";
        }else{
            kjTable = "game_tenball_kj";
        }

        return betkjMapper.selectBetkjList(gameInfo.getGameId(), kjTable, gameInfo.getGameType(), betkjReqVO.getPeriods(), betkjReqVO.getStatus());
    }

    @Override
    public void BetRepair(BetRepairReqVO vo) {
        SysGame gameInfo = sysGameService.selectSysGameByGameId(vo.getGameId());
        String url = gameUrl + gameInfo.getGameMarkId() + "&limit=120";
        String result = HttpUtils.sendGet(url);
        JSONObject resultJson = JSONObject.parseObject(result);
        if(resultJson == null){
            throw new ServiceException("获取不到开奖网站数据");
        }
        String data = resultJson.getString("data");
        System.out.println(data);
        List<GameOpenDataDto> openDataList = JSONArray.parseArray(data.toString(),GameOpenDataDto.class);
        Map<Long , GameOpenDataDto> gameOpenDataDtoMap = openDataList.stream()
                .collect(Collectors.toMap(
                        GameOpenDataDto::getExpect,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        if(StringUtils.equals(gameInfo.getGameType(),"3")){
            repairThreeBallInfoFromOfficial(gameInfo,openDataList,gameOpenDataDtoMap);
        }else if(StringUtils.equals(gameInfo.getGameType(),"5")){
            repairFiveBallInfoFromOfficial(gameInfo,openDataList,gameOpenDataDtoMap);
        }else{
            repairTenBallInfoFromOfficial(gameInfo,openDataList,gameOpenDataDtoMap);
        }
    }

    @Override
    public void handleLottery(HandleLotteryReqVO vo) {

        SysGame gameInfo = sysGameService.selectSysGameByGameId(vo.getGameId());
        if(StringUtils.equals(gameInfo.getGameType(),"3")){

            GameThreeballKj gameThreeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(gameInfo.getGameId(),vo.getPeriods());
            if(gameThreeballKj == null){
                throw new ServiceException("没有开奖数据，请先手动修复数据");
            }

            GameThreeballOpenData gameThreeballOpenData = gameThreeballOpenDataService.selectGameThreeballOpenDataByPeriods(gameInfo.getGameId(), vo.getPeriods());

            if(!StringUtils.equals(gameThreeballKj.getStatus(),"1") && gameThreeballOpenData == null){
                throw new ServiceException("本期开奖结果未获取，无法进行结算!");
            }

            if(!StringUtils.equals(gameThreeballKj.getStatus(),"1")){

                gameThreeballKj.setPeriods(gameThreeballOpenData.getPeriods());
                gameThreeballKj.setNum1(gameThreeballOpenData.getSum1());
                gameThreeballKj.setNum2(gameThreeballOpenData.getSum2());
                gameThreeballKj.setNum3(gameThreeballOpenData.getSum3());
                gameThreeballKj.setSumNum(gameThreeballOpenData.getSum1() + gameThreeballOpenData.getSum2() + gameThreeballOpenData.getSum3());

                gameThreeballKj.setStatus("1");
                // 开奖时间
                gameThreeballKj.setTheTime(gameThreeballOpenData.getTime());
                gameThreeballKjService.updateGameThreeballKj(gameThreeballKj);
            }

            threeBallLotteryService.lotteryThreeBall(gameInfo.getGameMarkId());
        }else if(StringUtils.equals(gameInfo.getGameType(),"5")){
            GameFiveballKj gameFiveballKj = gameFiveballKjService.selectGameFiveballKjByPeriods(gameInfo.getGameId(),vo.getPeriods());
            if(gameFiveballKj == null){
                throw new ServiceException("没有开奖数据，请先手动修复数据");
            }
            GameFiveballOpenData gameFiveballOpenData = gameFiveballOpenDataService.selectGameFiveballOpenDataByPeriods(gameInfo.getGameId(), vo.getPeriods());

            if(!StringUtils.equals(gameFiveballKj.getStatus(),"1") && gameFiveballOpenData == null){
                throw new ServiceException("本期开奖结果未获取，无法进行结算!");
            }

            if(!StringUtils.equals(gameFiveballKj.getStatus(),"1")){

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

                gameFiveballKj.setStatus("1");
                // 开奖时间
                gameFiveballKj.setTheTime(gameFiveballOpenData.getTime());

                gameFiveballKjService.updateGameFiveballKj(gameFiveballKj);
            }
            fiveBallLotteryService.lotteryFiveBall(gameInfo.getGameMarkId());
        }else{
            GameTenballKj gameTenballKj = gameTenballKjService.selectGameTenballKjByPeriods(gameInfo.getGameId(),vo.getPeriods());
            if(gameTenballKj == null){
                throw new ServiceException("没有开奖数据，请先手动修复数据");
            }
            GameTenballOpenData gameTenballOpenData = gameTenballOpenDataService.selectGameTenballOpenDataByPeriods(gameInfo.getGameId(), vo.getPeriods());

            if(!StringUtils.equals(gameTenballKj.getStatus(),"1") && gameTenballOpenData == null){
                throw new ServiceException("本期开奖结果未获取，无法进行结算!");
            }

            if(!StringUtils.equals(gameTenballKj.getStatus(),"1")){

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

                gameTenballKj.setStatus("1");
                // 开奖时间
                gameTenballKj.setTheTime(gameTenballOpenData.getTime());

                gameTenballKjService.updateGameTenballKj(gameTenballKj);
            }
            tenBallLotteryService.lotteryTenBall(gameInfo.getGameMarkId());
        }
    }

    public void repairThreeBallInfoFromOfficial(SysGame gameInfo, List<GameOpenDataDto> openDataList, Map<Long, GameOpenDataDto> gameOpenDataDtoMap) {

        List<GameOpenDataDto> sortedList = openDataList.stream()
                .sorted(Comparator.comparing(GameOpenDataDto::getExpect)) // 根据expect字段进行排序
                .collect(Collectors.toList());

        for(GameOpenDataDto gameOpenDataDto : sortedList){
            GameThreeballOpenData newGameThreeballOpenData = gameThreeballOpenDataService.selectGameThreeballOpenDataByPeriods(gameInfo.getGameId(), gameOpenDataDto.getExpect());
            if(newGameThreeballOpenData == null) {
                newGameThreeballOpenData = new GameThreeballOpenData();
                newGameThreeballOpenData.setPeriods(gameOpenDataDto.getExpect());
                newGameThreeballOpenData.setGameId(gameInfo.getGameId());
                newGameThreeballOpenData.setGameName(gameInfo.getGameName());
                String[] numList = gameOpenDataDto.getOpencode().split(",");
                newGameThreeballOpenData.setSum1(Integer.parseInt(numList[0]));
                newGameThreeballOpenData.setSum2(Integer.parseInt(numList[1]));
                newGameThreeballOpenData.setSum3(Integer.parseInt(numList[2]));
                newGameThreeballOpenData.setTime(gameOpenDataDto.getOpentime());
                newGameThreeballOpenData.setCreateBy("TASK");

                gameThreeballOpenDataService.insertGameThreeballOpenData(newGameThreeballOpenData);
            }
            GameThreeballKj gameThreeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(gameInfo.getGameId(), gameOpenDataDto.getExpect());
            if(gameThreeballKj == null){

                GameThreeballKj newGameThreeballKj = new GameThreeballKj();
                newGameThreeballKj.setGameId(gameInfo.getGameId());
                newGameThreeballKj.setGameName(gameInfo.getGameName());
                newGameThreeballKj.setPeriods(newGameThreeballOpenData.getPeriods());
                newGameThreeballKj.setNum1(newGameThreeballOpenData.getSum1());
                newGameThreeballKj.setNum2(newGameThreeballOpenData.getSum2());
                newGameThreeballKj.setNum3(newGameThreeballOpenData.getSum3());
                newGameThreeballKj.setSumNum(newGameThreeballOpenData.getSum1() + newGameThreeballOpenData.getSum2() + newGameThreeballOpenData.getSum3());

                newGameThreeballKj.setStatus("1");
                // 开奖时间
                newGameThreeballKj.setTheTime(newGameThreeballOpenData.getTime());

                Calendar calendar = Calendar.getInstance();
                calendar.setTime(newGameThreeballOpenData.getTime());
                //预计开奖时间(比实际开奖时间少10s)
                calendar.add(Calendar.SECOND, -5);
                newGameThreeballKj.setPreTime(calendar.getTime());

                //封盘投注截止时间
                calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
                newGameThreeballKj.setBetTime(calendar.getTime());

                gameThreeballKjService.insertGameThreeballKj(newGameThreeballKj);
            }else{
                // 开奖时间
                gameThreeballKj.setNum1(newGameThreeballOpenData.getSum1());
                gameThreeballKj.setNum2(newGameThreeballOpenData.getSum2());
                gameThreeballKj.setNum3(newGameThreeballOpenData.getSum3());
                gameThreeballKj.setSumNum(newGameThreeballOpenData.getSum1() + newGameThreeballOpenData.getSum2() + newGameThreeballOpenData.getSum3());
                gameThreeballKj.setTheTime(newGameThreeballOpenData.getTime());
                gameThreeballKj.setStatus("1");
                gameThreeballKjService.updateGameThreeballKj(gameThreeballKj);
            }
        }
        threeBallLotteryService.createThreeData(gameInfo);
    }

    public void repairFiveBallInfoFromOfficial(SysGame gameInfo, List<GameOpenDataDto> openDataList, Map<Long, GameOpenDataDto> gameOpenDataDtoMap) {
        List<GameOpenDataDto> sortedList = openDataList.stream()
                .sorted(Comparator.comparing(GameOpenDataDto::getExpect)) // 根据expect字段进行排序
                .collect(Collectors.toList());

        for(GameOpenDataDto gameOpenDataDto : sortedList){
            GameFiveballOpenData newGameFiveballOpenData = gameFiveballOpenDataService.selectGameFiveballOpenDataByPeriods(gameInfo.getGameId(), gameOpenDataDto.getExpect());
            if(newGameFiveballOpenData == null) {
                newGameFiveballOpenData = new GameFiveballOpenData();
                newGameFiveballOpenData.setPeriods(gameOpenDataDto.getExpect());
                newGameFiveballOpenData.setGameId(gameInfo.getGameId());
                newGameFiveballOpenData.setGameName(gameInfo.getGameName());
                String[] numList = gameOpenDataDto.getOpencode().split(",");
                newGameFiveballOpenData.setNum1(Integer.parseInt(numList[0]));
                newGameFiveballOpenData.setNum2(Integer.parseInt(numList[1]));
                newGameFiveballOpenData.setNum3(Integer.parseInt(numList[2]));
                newGameFiveballOpenData.setNum4(Integer.parseInt(numList[3]));
                newGameFiveballOpenData.setNum5(Integer.parseInt(numList[4]));
                newGameFiveballOpenData.setTime(gameOpenDataDto.getOpentime());
                newGameFiveballOpenData.setCreateBy("TASK");

                gameFiveballOpenDataService.insertGameFiveballOpenData(newGameFiveballOpenData);
            }
            GameFiveballKj gameFiveballKj = gameFiveballKjService.selectGameFiveballKjByPeriods(gameInfo.getGameId(), gameOpenDataDto.getExpect());
            if(gameFiveballKj == null){

                GameFiveballKj newGameFiveballKj = new GameFiveballKj();

                newGameFiveballKj.setPeriods(newGameFiveballOpenData.getPeriods());
                newGameFiveballKj.setGameId(gameInfo.getGameId());
                newGameFiveballKj.setGameName(gameInfo.getGameName());

                newGameFiveballKj.setNum1(newGameFiveballOpenData.getNum1());
                newGameFiveballKj.setNum1Bs(getBigSmallNumResult(newGameFiveballOpenData.getNum1()));
                newGameFiveballKj.setNum1Sd(getSingleDoubleNumResult(newGameFiveballOpenData.getNum1()));
                newGameFiveballKj.setNum2(newGameFiveballOpenData.getNum2());
                newGameFiveballKj.setNum2Bs(getBigSmallNumResult(newGameFiveballOpenData.getNum2()));
                newGameFiveballKj.setNum2Sd(getSingleDoubleNumResult(newGameFiveballOpenData.getNum2()));
                newGameFiveballKj.setNum3(newGameFiveballOpenData.getNum3());
                newGameFiveballKj.setNum3Bs(getBigSmallNumResult(newGameFiveballOpenData.getNum3()));
                newGameFiveballKj.setNum3Sd(getSingleDoubleNumResult(newGameFiveballOpenData.getNum3()));
                newGameFiveballKj.setNum4(newGameFiveballOpenData.getNum4());
                newGameFiveballKj.setNum4Bs(getBigSmallNumResult(newGameFiveballOpenData.getNum4()));
                newGameFiveballKj.setNum4Sd(getSingleDoubleNumResult(newGameFiveballOpenData.getNum4()));
                newGameFiveballKj.setNum5(newGameFiveballOpenData.getNum5());
                newGameFiveballKj.setNum5Bs(getBigSmallNumResult(newGameFiveballOpenData.getNum5()));
                newGameFiveballKj.setNum5Sd(getSingleDoubleNumResult(newGameFiveballOpenData.getNum5()));
                newGameFiveballKj.setSum(newGameFiveballOpenData.getNum1() + newGameFiveballOpenData.getNum2() + newGameFiveballOpenData.getNum3() + newGameFiveballOpenData.getNum4() + newGameFiveballOpenData.getNum5());
                newGameFiveballKj.setSumBs(getSumBigSmallNumResult(newGameFiveballKj.getSum()));
                newGameFiveballKj.setSumSd(getSingleDoubleNumResult(newGameFiveballKj.getSum()));
                newGameFiveballKj.setSumLts(getLoongTigerCloseNumResult(newGameFiveballOpenData.getNum1(),newGameFiveballOpenData.getNum5()));
                newGameFiveballKj.setNumF(getBaoShunDui(newGameFiveballOpenData.getNum1(),newGameFiveballOpenData.getNum2(),newGameFiveballOpenData.getNum3()));
                newGameFiveballKj.setNumM(getBaoShunDui(newGameFiveballOpenData.getNum2(),newGameFiveballOpenData.getNum3(),newGameFiveballOpenData.getNum4()));
                newGameFiveballKj.setNumB(getBaoShunDui(newGameFiveballOpenData.getNum3(),newGameFiveballOpenData.getNum4(),newGameFiveballOpenData.getNum5()));

                newGameFiveballKj.setStatus("1");
                // 开奖时间
                newGameFiveballKj.setTheTime(newGameFiveballOpenData.getTime());

                Calendar calendar = Calendar.getInstance();
                calendar.setTime(newGameFiveballOpenData.getTime());
                //预计开奖时间(比实际开奖时间少10s)
                calendar.add(Calendar.SECOND, -5);
                newGameFiveballKj.setPreTime(calendar.getTime());

                //封盘投注截止时间
                calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
                newGameFiveballKj.setBetTime(calendar.getTime());

                gameFiveballKjService.insertGameFiveballKj(newGameFiveballKj);
            }else{
                gameFiveballKj.setNum1(newGameFiveballOpenData.getNum1());
                gameFiveballKj.setNum1Bs(getBigSmallNumResult(newGameFiveballOpenData.getNum1()));
                gameFiveballKj.setNum1Sd(getSingleDoubleNumResult(newGameFiveballOpenData.getNum1()));
                gameFiveballKj.setNum2(newGameFiveballOpenData.getNum2());
                gameFiveballKj.setNum2Bs(getBigSmallNumResult(newGameFiveballOpenData.getNum2()));
                gameFiveballKj.setNum2Sd(getSingleDoubleNumResult(newGameFiveballOpenData.getNum2()));
                gameFiveballKj.setNum3(newGameFiveballOpenData.getNum3());
                gameFiveballKj.setNum3Bs(getBigSmallNumResult(newGameFiveballOpenData.getNum3()));
                gameFiveballKj.setNum3Sd(getSingleDoubleNumResult(newGameFiveballOpenData.getNum3()));
                gameFiveballKj.setNum4(newGameFiveballOpenData.getNum4());
                gameFiveballKj.setNum4Bs(getBigSmallNumResult(newGameFiveballOpenData.getNum4()));
                gameFiveballKj.setNum4Sd(getSingleDoubleNumResult(newGameFiveballOpenData.getNum4()));
                gameFiveballKj.setNum5(newGameFiveballOpenData.getNum5());
                gameFiveballKj.setNum5Bs(getBigSmallNumResult(newGameFiveballOpenData.getNum5()));
                gameFiveballKj.setNum5Sd(getSingleDoubleNumResult(newGameFiveballOpenData.getNum5()));
                gameFiveballKj.setSum(newGameFiveballOpenData.getNum1() + newGameFiveballOpenData.getNum2() + newGameFiveballOpenData.getNum3() + newGameFiveballOpenData.getNum4() + newGameFiveballOpenData.getNum5());
                gameFiveballKj.setSumBs(getSumBigSmallNumResult(gameFiveballKj.getSum()));
                gameFiveballKj.setSumSd(getSingleDoubleNumResult(gameFiveballKj.getSum()));
                gameFiveballKj.setSumLts(getLoongTigerCloseNumResult(newGameFiveballOpenData.getNum1(),newGameFiveballOpenData.getNum5()));
                gameFiveballKj.setNumF(getBaoShunDui(newGameFiveballOpenData.getNum1(),newGameFiveballOpenData.getNum2(),newGameFiveballOpenData.getNum3()));
                gameFiveballKj.setNumM(getBaoShunDui(newGameFiveballOpenData.getNum2(),newGameFiveballOpenData.getNum3(),newGameFiveballOpenData.getNum4()));
                gameFiveballKj.setNumB(getBaoShunDui(newGameFiveballOpenData.getNum3(),newGameFiveballOpenData.getNum4(),newGameFiveballOpenData.getNum5()));

                gameFiveballKj.setTheTime(newGameFiveballOpenData.getTime());
                gameFiveballKj.setStatus("1");
                gameFiveballKjService.updateGameFiveballKj(gameFiveballKj);
            }
        }
        fiveBallLotteryService.createFiveBallData(gameInfo);
    }

    public void repairTenBallInfoFromOfficial(SysGame gameInfo, List<GameOpenDataDto> openDataList, Map<Long, GameOpenDataDto> gameOpenDataDtoMap) {

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
            GameTenballKj gameTenballKj = gameTenballKjService.selectGameTenballKjByPeriods(gameInfo.getGameId(), gameOpenDataDto.getExpect());
            if(gameTenballKj == null){

                GameTenballKj newGameTenballKj = new GameTenballKj();
                newGameTenballKj.setGameId(gameInfo.getGameId());
                newGameTenballKj.setGameName(gameInfo.getGameName());
                newGameTenballKj.setPeriods(newGameTenballOpenData.getPeriods());
                newGameTenballKj.setNum1(newGameTenballOpenData.getNum1());
                newGameTenballKj.setNum2(newGameTenballOpenData.getNum2());
                newGameTenballKj.setNum3(newGameTenballOpenData.getNum3());
                newGameTenballKj.setNum4(newGameTenballOpenData.getNum4());
                newGameTenballKj.setNum5(newGameTenballOpenData.getNum5());
                newGameTenballKj.setNum6(newGameTenballOpenData.getNum6());
                newGameTenballKj.setNum7(newGameTenballOpenData.getNum7());
                newGameTenballKj.setNum8(newGameTenballOpenData.getNum8());
                newGameTenballKj.setNum9(newGameTenballOpenData.getNum9());
                newGameTenballKj.setNum10(newGameTenballOpenData.getNum10());

                newGameTenballKj.setStatus("1");
                // 开奖时间
                newGameTenballKj.setTheTime(newGameTenballOpenData.getTime());

                Calendar calendar = Calendar.getInstance();
                calendar.setTime(newGameTenballOpenData.getTime());
                //预计开奖时间(比实际开奖时间少10s)
                calendar.add(Calendar.SECOND, -5);
                newGameTenballKj.setPreTime(calendar.getTime());

                //封盘投注截止时间
                calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
                newGameTenballKj.setBetTime(calendar.getTime());

                gameTenballKjService.insertGameTenballKj(newGameTenballKj);
            }else{
                // 开奖时间
                gameTenballKj.setNum1(newGameTenballOpenData.getNum1());
                gameTenballKj.setNum2(newGameTenballOpenData.getNum2());
                gameTenballKj.setNum3(newGameTenballOpenData.getNum3());
                gameTenballKj.setNum4(newGameTenballOpenData.getNum4());
                gameTenballKj.setNum5(newGameTenballOpenData.getNum5());
                gameTenballKj.setNum6(newGameTenballOpenData.getNum6());
                gameTenballKj.setNum7(newGameTenballOpenData.getNum7());
                gameTenballKj.setNum8(newGameTenballOpenData.getNum8());
                gameTenballKj.setNum9(newGameTenballOpenData.getNum9());
                gameTenballKj.setNum10(newGameTenballOpenData.getNum10());
                gameTenballKj.setTheTime(newGameTenballOpenData.getTime());
                gameTenballKj.setStatus("1");
                gameTenballKjService.updateGameTenballKj(gameTenballKj);
            }
        }
        tenBallLotteryService.createTenballData(gameInfo);
    }


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
