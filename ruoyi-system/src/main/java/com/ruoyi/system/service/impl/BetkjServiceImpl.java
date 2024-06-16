package com.ruoyi.system.service.impl;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.EntityMapTransUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.mapper.*;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
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

    @Autowired
    private IWaveService waveService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private GameThreeballRecordMapper gameThreeballRecordMapper;

    @Autowired
    private GameFiveballRecordMapper gameFiveballRecordMapper;

    @Autowired
    private GameTenballRecordMapper gameTenballRecordMapper;

    @Autowired
    private UserwinMapper userwinMapper;


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
        String url = configService.selectConfigByKey("sys.opengame.url") + gameInfo.getGameOpenCode() + "&limit=120";
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
        }else if(StringUtils.equals(gameInfo.getGameType(),"10")){
            repairTenBallInfoFromOfficial(gameInfo,openDataList,gameOpenDataDtoMap);
        }
    }

    public void threeballHandleLottery(SysGame gameInfo,Long periods){

        GameThreeballKj gameThreeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(gameInfo.getGameId(),periods);
        if(gameThreeballKj == null){
            return;
        }

        GameThreeballOpenData gameThreeballOpenData = gameThreeballOpenDataService.selectGameThreeballOpenDataByPeriods(gameInfo.getGameId(), periods);

        if(!StringUtils.equals(gameThreeballKj.getStatus(),"1") && gameThreeballOpenData == null){
            return;
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

        threeBallLotteryService.lotteryGameThreeballOpenData(gameInfo, periods);
    }

    public void fiveballHandleLottery(SysGame gameInfo,Long periods){
        GameFiveballKj gameFiveballKj = gameFiveballKjService.selectGameFiveballKjByPeriods(gameInfo.getGameId(),periods);
        if(gameFiveballKj == null){
            return;
        }
        GameFiveballOpenData gameFiveballOpenData = gameFiveballOpenDataService.selectGameFiveballOpenDataByPeriods(gameInfo.getGameId(), periods);

        if(!StringUtils.equals(gameFiveballKj.getStatus(),"1") && gameFiveballOpenData == null){
            return;
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
        fiveBallLotteryService.lotteryGameFiveballOpenData(gameInfo, periods);
    }

    public void tenballHandleLottery(SysGame gameInfo,Long periods){
        GameTenballKj gameTenballKj = gameTenballKjService.selectGameTenballKjByPeriods(gameInfo.getGameId(),periods);
        if(gameTenballKj == null){
            return;
        }
        GameTenballOpenData gameTenballOpenData = gameTenballOpenDataService.selectGameTenballOpenDataByPeriods(gameInfo.getGameId(), periods);

        if(!StringUtils.equals(gameTenballKj.getStatus(),"1") && gameTenballOpenData == null){
            return;
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
        tenBallLotteryService.lotteryGameTenballOpenData(gameInfo, periods);
    }

    @Override
    public void handleLottery(HandleLotteryReqVO vo) {

        SysGame gameInfo = sysGameService.selectSysGameByGameId(vo.getGameId());
        if(StringUtils.equals(gameInfo.getGameType(),"3")){
            if(vo.getPeriods() == null || vo.getPeriods() == 0){
                //获取全部卡奖期数
                GameThreeballKj searchGameThreeballKj = new GameThreeballKj();
                searchGameThreeballKj.setGameId(vo.getGameId());
                searchGameThreeballKj.setStatus("2"); //开奖中
                List<GameThreeballKj> gameThreeballKjList = gameThreeballKjService.selectGameThreeballKjList(searchGameThreeballKj);
                for(GameThreeballKj gameThreeballKj : gameThreeballKjList){
                    threeballHandleLottery(gameInfo, gameThreeballKj.getPeriods());
                }
            }else{
                threeballHandleLottery(gameInfo, vo.getPeriods());
            }
        }else if(StringUtils.equals(gameInfo.getGameType(),"5")){
            if(vo.getPeriods() == null || vo.getPeriods() == 0){
                //获取全部卡奖期数
                GameFiveballKj searchGameFiveballKj = new GameFiveballKj();
                searchGameFiveballKj.setGameId(vo.getGameId());
                searchGameFiveballKj.setStatus("2"); //开奖中
                List<GameFiveballKj> gameThreeballKjList = gameFiveballKjService.selectGameFiveballKjList(searchGameFiveballKj);
                for(GameFiveballKj gameFiveballKj : gameThreeballKjList){
                    fiveballHandleLottery(gameInfo, gameFiveballKj.getPeriods());
                }
            }else{
                fiveballHandleLottery(gameInfo, vo.getPeriods());
            }
        }else if(StringUtils.equals(gameInfo.getGameType(),"10")){
            if(vo.getPeriods() == null || vo.getPeriods() == 0){
                //获取全部卡奖期数
                GameTenballKj searchGameTenballKj = new GameTenballKj();
                searchGameTenballKj.setGameId(vo.getGameId());
                searchGameTenballKj.setStatus("2"); //开奖中
                List<GameTenballKj> gameTenballKjList = gameTenballKjService.selectGameTenballKjList(searchGameTenballKj);
                for(GameTenballKj gameTenballKj : gameTenballKjList){
                    tenballHandleLottery(gameInfo, gameTenballKj.getPeriods());
                }
            }else{
                tenballHandleLottery(gameInfo, vo.getPeriods());
            }
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

    @Override
    public List<BetUserWinRespVo> selectUserGameWinBetList(SysGame gameInfo, BetUserWinReqVO betUserWinReqVO) {
        List<BetUserWinRespVo> res = new ArrayList<>();
        if(StringUtils.equals(gameInfo.getGameType(),"3")){
            res = recordThreeBall(gameInfo,betUserWinReqVO);
        }else if(StringUtils.equals(gameInfo.getGameType(),"5")){
            res = recordFiveBall(gameInfo,betUserWinReqVO);
        }else{
            res = recordTenBall(gameInfo,betUserWinReqVO);
        }
        return res;
    }

    public List<BetUserWinRespVo> recordThreeBall(SysGame gameInfo, BetUserWinReqVO betUserWinReqVO){
        List<BetUserWinRespVo> resList = new ArrayList<>();

        List<Integer> bigSingleList = Arrays.asList(15, 17, 19, 21, 23, 25, 27);
        List<Integer> smallSingleList = Arrays.asList(1, 3, 5, 7, 9, 11, 13);
        List<Integer> bigDoubleList = Arrays.asList(14, 16, 18, 20, 22, 24, 26);
        List<Integer> smallDoubleList = Arrays.asList(0, 2, 4, 6, 8, 10, 12);

        List<GameThreeballRecord> threeballDateRecordList = gameThreeballRecordMapper.selectUserDateList(betUserWinReqVO.getGameId(), betUserWinReqVO.getUserId(), betUserWinReqVO.getRecordTime());

        Wave wave = waveService.selectWaveByGameId(gameInfo.getGameId());
        Map<String, Object> waveMap = EntityMapTransUtils.entityToMap1(wave);
        for(GameThreeballRecord threeballRecord : threeballDateRecordList){
            BetUserWinRespVo vo = new BetUserWinRespVo();

            vo.setBetRecordId(threeballRecord.getId());
            vo.setUserId(threeballRecord.getUserId());
            vo.setGameId(threeballRecord.getGameId());
            vo.setGameName(threeballRecord.getGameName());
            vo.setPeriods(threeballRecord.getPeriods());
            vo.setBetOpenTime(threeballRecord.getRecordTime());
            vo.setCountMoney(threeballRecord.getCountMoney());
            vo.setWinMoney(threeballRecord.getWinMoney());
            vo.setIsDeduct(threeballRecord.getIsDeduct());

            BigDecimal bd1 = new BigDecimal(Float.toString(threeballRecord.getWinMoney()));
            BigDecimal bd2 = new BigDecimal(Float.toString(threeballRecord.getCountMoney()));
            BigDecimal sum = bd1.subtract(bd2);
            BigDecimal result = sum.setScale(2, BigDecimal.ROUND_HALF_UP);
            Float resultMoney = result.floatValue();
            vo.setResultMoney(resultMoney);

            String openResult = threeballRecord.getN1() + "+" + threeballRecord.getN2() + "+" + threeballRecord.getN3() + "=" + threeballRecord.getSumNum();
            vo.setOpenResult(openResult);

            String betResult = "";

            Integer sumNum = threeballRecord.getSumNum();
            Map<String, Object> gameThreeballRecordMap = EntityMapTransUtils.entityToMap1(threeballRecord);

            // 和值 数字
            for(int i=0; i<=27; i++){
                Object amountObject = gameThreeballRecordMap.get("num" + i);
                Float amount = amountObject!=null?(Float) amountObject:0f;
                if(amount > 0){
                    if(sumNum == i){
                        betResult += "<span style='color:red'>" + i + "-" + amount.toString() + "</span></br>";
                    }else{
                        betResult += i + "-" + amount.toString() + "</br>";
                    }
                }
            }

            // 大
            if(threeballRecord.getBig() > 0){
                if(sumNum > 13){
                    betResult += "<span style='color:red'>大" + "-" + threeballRecord.getBig().toString() + "</span></br>";
                }else{
                    betResult += "大-" + threeballRecord.getBig().toString() + "</br>";
                }
            }
            // 小
            if(threeballRecord.getSmall() > 0){
                if(sumNum < 14){
                    betResult += "<span style='color:red'>小" + "-" + threeballRecord.getSmall().toString() + "</span></br>";
                }else{
                    betResult += "小-" + threeballRecord.getSmall().toString() + "</br>";
                }
            }
            // 单
            if(threeballRecord.getSingle() > 0){
                if(sumNum%2 == 1){
                    betResult += "<span style='color:red'>单" + "-" + threeballRecord.getSingle().toString() + "</span></br>";
                }else{
                    betResult += "单-" + threeballRecord.getSingle().toString() + "</br>";
                }
            }
            // 双
            if(threeballRecord.getDoubleAmount() > 0){
                if(sumNum%2 == 0){
                    betResult += "<span style='color:red'>双" + "-" + threeballRecord.getDoubleAmount().toString() + "</span></br>";
                }else{
                    betResult += "双-" + threeballRecord.getDoubleAmount().toString() + "</br>";
                }
            }
            // 极大
            if(threeballRecord.getMuchBig() > 0){
                if(sumNum > 21){
                    betResult += "<span style='color:red'>极大" + "-" + threeballRecord.getMuchBig().toString() + "</span></br>";
                }else{
                    betResult += "极大-" + threeballRecord.getMuchBig().toString() + "</br>";
                }
            }
            // 极小
            if(threeballRecord.getMuchSmall() > 0){
                if(sumNum < 6){
                    betResult += "<span style='color:red'>极小" + "-" + threeballRecord.getMuchSmall().toString() + "</span></br>";
                }else{
                    betResult += "极小-" + threeballRecord.getMuchSmall().toString() + "</br>";
                }
            }

            // 大单
            if(threeballRecord.getBigSingle() > 0){
                if(bigSingleList.contains(sumNum)){
                    betResult += "<span style='color:red'>大单" + "-" + threeballRecord.getBigSingle().toString() + "</span></br>";
                }else{
                    betResult += "大单-" + threeballRecord.getBigSingle().toString() + "</br>";
                }
            }
            // 大双
            if(threeballRecord.getBigDouble() > 0){
                if(bigDoubleList.contains(sumNum)){
                    betResult += "<span style='color:red'>大双" + "-" + threeballRecord.getBigDouble().toString() + "</span></br>";
                }else{
                    betResult += "大双-" + threeballRecord.getBigDouble().toString() + "</br>";
                }
            }
            // 小单
            if(threeballRecord.getSmallSingle() > 0){
                if(smallSingleList.contains(sumNum)){
                    betResult += "<span style='color:red'>小单" + "-" + threeballRecord.getSmallSingle().toString() + "</span></br>";
                }else{
                    betResult += "小单-" + threeballRecord.getSmallSingle().toString() + "</br>";
                }
            }
            // 小双
            if(threeballRecord.getSmallDouble() > 0){
                if(smallDoubleList.contains(sumNum)){
                    betResult += "<span style='color:red'>小双" + "-" + threeballRecord.getSmallDouble().toString() + "</span></br>";
                }else{
                    betResult += "小双-" + threeballRecord.getSmallDouble().toString() + "</br>";
                }
            }
            // 龙
            if(threeballRecord.getLoong() > 0){
                if(threeballRecord.getN3() < threeballRecord.getN1()){
                    betResult += "<span style='color:red'>龙" + "-" + threeballRecord.getLoong().toString() + "</span></br>";
                }else{
                    betResult += "龙-" + threeballRecord.getLoong().toString() + "</br>";
                }
            }
            // 虎
            if(threeballRecord.getTiger() > 0){
                if(threeballRecord.getN3() < threeballRecord.getN1()){
                    betResult += "<span style='color:red'>虎" + "-" + threeballRecord.getTiger().toString() + "</span></br>";
                }else{
                    betResult += "虎-" + threeballRecord.getTiger().toString() + "</br>";
                }
            }
            // 合
            if(threeballRecord.getClose() > 0){
                if(threeballRecord.getN3() < threeballRecord.getN1()){
                    betResult += "<span style='color:red'>合" + "-" + threeballRecord.getClose().toString() + "</span></br>";
                }else{
                    betResult += "合-" + threeballRecord.getClose().toString() + "</br>";
                }
            }

            Integer dsbResult = getBaoShunDui(threeballRecord.getN1(),threeballRecord.getN2(),threeballRecord.getN3());
            // 豹
            if(threeballRecord.getLeopard() > 0){
                if(dsbResult == 1){
                    betResult += "<span style='color:red'>豹子" + "-" + threeballRecord.getLeopard().toString() + "</span></br>";
                }else{
                    betResult += "豹子-" + threeballRecord.getLeopard().toString() + "</br>";
                }
            }
            // 顺
            if(threeballRecord.getShun() > 0){
                if(dsbResult == 2){
                    betResult += "<span style='color:red'>顺子" + "-" + threeballRecord.getShun().toString() + "</span></br>";
                }else{
                    betResult += "顺子-" + threeballRecord.getShun().toString() + "</br>";
                }
            }
            // 对
            if(threeballRecord.getPairs() > 0){
                if(dsbResult == 3){
                    betResult += "<span style='color:red'>对子" + "-" + threeballRecord.getPairs().toString() + "</span></br>";
                }else{
                    betResult += "对子-" + threeballRecord.getPairs().toString() + "</br>";
                }
            }

            // 红绿蓝
            if(waveMap != null){
                Object waveNumObject = waveMap.get("num" + threeballRecord.getSumNum());
                Integer numWave = waveNumObject!=null?(Integer) waveNumObject:0;

                // 绿
                if(threeballRecord.getGreen() > 0){
                    if(numWave == 1){
                        betResult += "<span style='color:red'>绿波" + "-" + threeballRecord.getGreen().toString() + "</span></br>";
                    }else{
                        betResult += "绿波-" + threeballRecord.getGreen().toString() + "</br>";
                    }
                }
                // 红
                if(threeballRecord.getRed() > 0){
                    if(numWave == 2){
                        betResult += "<span style='color:red'>红波" + "-" + threeballRecord.getRed().toString() + "</span></br>";
                    }else{
                        betResult += "红波-" + threeballRecord.getRed().toString() + "</br>";
                    }
                }
                // 蓝
                if(threeballRecord.getBlue() > 0){
                    if(numWave == 3){
                        betResult += "<span style='color:red'>蓝波" + "-" + threeballRecord.getBlue().toString() + "</span></br>";
                    }else{
                        betResult += "蓝波-" + threeballRecord.getBlue().toString() + "</br>";
                    }
                }
            }

            vo.setBetResult(betResult);

            resList.add(vo);
        }
        return resList;
    }

    public List<BetUserWinRespVo> recordFiveBall(SysGame gameInfo, BetUserWinReqVO betUserWinReqVO){
        List<BetUserWinRespVo> resList = new ArrayList<>();
        List<GameFiveballRecord> fiveballDateRecordList = gameFiveballRecordMapper.selectUserDateList(betUserWinReqVO.getGameId(), betUserWinReqVO.getUserId(), betUserWinReqVO.getRecordTime());
        for(GameFiveballRecord fiveballRecord : fiveballDateRecordList){
            BetUserWinRespVo vo = new BetUserWinRespVo();

            vo.setBetRecordId(fiveballRecord.getId());
            vo.setUserId(fiveballRecord.getUserId());
            vo.setGameId(fiveballRecord.getGameId());
            vo.setGameName(fiveballRecord.getGameName());
            vo.setPeriods(fiveballRecord.getPeriods());
            vo.setBetOpenTime(fiveballRecord.getRecordTime());
            vo.setCountMoney(fiveballRecord.getCountMoney());
            vo.setWinMoney(fiveballRecord.getWinMoney());
            vo.setIsDeduct(fiveballRecord.getIsDeduct());

            BigDecimal bd1 = new BigDecimal(Float.toString(fiveballRecord.getWinMoney()));
            BigDecimal bd2 = new BigDecimal(Float.toString(fiveballRecord.getCountMoney()));
            BigDecimal sum = bd1.subtract(bd2);
            BigDecimal result = sum.setScale(2, BigDecimal.ROUND_HALF_UP);
            Float resultMoney = result.floatValue();
            vo.setResultMoney(resultMoney);

            String openResult = fiveballRecord.getNum1() + "+" + fiveballRecord.getNum2() + "+" + fiveballRecord.getNum3() + "+" + fiveballRecord.getNum4() + "+" + fiveballRecord.getNum5() + "=" + fiveballRecord.getSum();
            vo.setOpenResult(openResult);

            Integer sumNum = fiveballRecord.getSum();
            String betResult = "";
            Map<String, Object> gameFiveballRecordMap = EntityMapTransUtils.entityToMap1(fiveballRecord);

            // 球1~5
            for(int i=1;i<=5;i++){

                Object numberObject = gameFiveballRecordMap.get("num"+ i);
                Integer numBall = numberObject!=null?(Integer) numberObject:-1;

                // 号码0~9
                for(int j=0;j<=9;j++){
                    Object amountObject = gameFiveballRecordMap.get("num"+ i +"Ball" + j);
                    Float amount = amountObject!=null?(Float) amountObject:0f;
                    if(amount > 0){
                        if(numBall == j){
                            betResult += "<span style='color:red'>球" + i + "-" + j + "-" + amount + "</span></br>";
                        }else{
                            betResult += "球" + i + "-" + j + "-" + amount + "</br>";
                        }
                    }
                }

                // 大小
                // 大1 小0 [小,大]
                // 大的金额计算
                Object bigAmountObject = gameFiveballRecordMap.get("num" + i + "Big");
                Float bigAmount = bigAmountObject!=null?(Float) bigAmountObject:0f;
                if(bigAmount > 0){
                    if(getBigSmallNumResult(numBall) == 1){
                        betResult += "<span style='color:red'>球" + i + "-大-" + bigAmount + "</span></br>";
                    }else{
                        betResult += "球" + i + "-大-" + bigAmount + "</br>";
                    }
                }

                // 小的金额计算
                Object smallAmountObject = gameFiveballRecordMap.get("num" + i + "Small");
                Float smallAmount = smallAmountObject!=null?(Float) smallAmountObject:0f;
                if(smallAmount > 0){
                    if(getBigSmallNumResult(numBall) == 0){
                        betResult += "<span style='color:red'>球" + i + "-小-" + smallAmount + "</span></br>";
                    }else{
                        betResult += "球" + i + "-小-" + smallAmount + "</br>";
                    }
                }

                // 单双
                // 双1 单0 [单,双]
                // 单的金额计算
                Object singleAmountObject = gameFiveballRecordMap.get("num" + i + "Single");
                Float singleAmount = singleAmountObject!=null?(Float) singleAmountObject:0f;
                if(singleAmount > 0){
                    if(getSingleDoubleNumResult(numBall) == 0){
                        betResult += "<span style='color:red'>球" + i + "-单-" + singleAmount + "</span></br>";
                    }else{
                        betResult += "球" + i + "-单-" + singleAmount + "</br>";
                    }
                }

                // 双的金额计算
                Object doubleAmountObject = gameFiveballRecordMap.get("num" + i + "Double");
                Float doubleAmount = doubleAmountObject!=null?(Float) doubleAmountObject:0f;
                if(doubleAmount > 0){
                    if(getSingleDoubleNumResult(numBall) == 1){
                        betResult += "<span style='color:red'>球" + i + "-单-" + doubleAmount + "</span></br>";
                    }else{
                        betResult += "球" + i + "-单-" + doubleAmount + "</br>";
                    }
                }
            }

            // 和值
            // 大1 小0 [小,大]
            // 大的金额计算
            if(fiveballRecord.getSumBig() > 0){
                if(getSumBigSmallNumResult(sumNum) == 1){
                    betResult += "<span style='color:red'>和值:大" + "-" + fiveballRecord.getSumBig().toString() + "</span></br>";
                }else{
                    betResult += "和值:大-" + fiveballRecord.getSumBig().toString() + "</br>";
                }
            }
            // 小的金额计算
            if(fiveballRecord.getSumSmall() > 0){
                if(getSumBigSmallNumResult(sumNum) == 0){
                    betResult += "<span style='color:red'>和值:小" + "-" + fiveballRecord.getSumSmall().toString() + "</span></br>";
                }else{
                    betResult += "和值:小-" + fiveballRecord.getSumSmall().toString() + "</br>";
                }
            }

            // 双1 单0 [单,双]
            // 单的金额计算
            if(fiveballRecord.getSumSingle() > 0){
                if(getSingleDoubleNumResult(sumNum) == 1){
                    betResult += "<span style='color:red'>和值:单" + "-" + fiveballRecord.getSumSingle().toString() + "</span></br>";
                }else{
                    betResult += "和值:单-" + fiveballRecord.getSumSingle().toString() + "</br>";
                }
            }
            // 双的金额计算
            if(fiveballRecord.getSumDouble() > 0){
                if(getSingleDoubleNumResult(sumNum) == 0){
                    betResult += "<span style='color:red'>和值:单" + "-" + fiveballRecord.getSumDouble().toString() + "</span></br>";
                }else{
                    betResult += "和值:单-" + fiveballRecord.getSumDouble().toString() + "</br>";
                }
            }

            // 龙2 虎1 和0 [和,虎,龙]
            // 龙的金额计算
            if(fiveballRecord.getSumLoong() > 0){
                if(getLoongTigerCloseNumResult(fiveballRecord.getNum1(),fiveballRecord.getNum5()) == 2){
                    betResult += "<span style='color:red'>和值:龙" + "-" + fiveballRecord.getSumLoong().toString() + "</span></br>";
                }else{
                    betResult += "和值:龙-" + fiveballRecord.getSumLoong().toString() + "</br>";
                }
            }
            // 虎的金额计算
            if(fiveballRecord.getSumTiger() > 0){
                if(getLoongTigerCloseNumResult(fiveballRecord.getNum1(),fiveballRecord.getNum5()) == 1){
                    betResult += "<span style='color:red'>和值:虎" + "-" + fiveballRecord.getSumTiger().toString() + "</span></br>";
                }else{
                    betResult += "和值:虎-" + fiveballRecord.getSumTiger().toString() + "</br>";
                }
            }
            // 和的金额计算
            if(fiveballRecord.getSumSum() > 0){
                if(getLoongTigerCloseNumResult(fiveballRecord.getNum1(),fiveballRecord.getNum5()) == 0){
                    betResult += "<span style='color:red'>和值:合" + "-" + fiveballRecord.getSumSum().toString() + "</span></br>";
                }else{
                    betResult += "和值:合-" + fiveballRecord.getSumSum().toString() + "</br>";
                }
            }


            // 前三
            // 杂六4 半顺3 顺2 对1 豹0 [豹,对,顺,半顺,杂六]
            Integer firstDsbResult = getBaoShunDui(fiveballRecord.getNum1(),fiveballRecord.getNum2(),fiveballRecord.getNum3());
            if(fiveballRecord.getFirstBao() > 0){
                if(firstDsbResult == 0){
                    betResult += "<span style='color:red'>前三:豹" + "-" + fiveballRecord.getFirstBao().toString() + "</span></br>";
                }else{
                    betResult += "前三:豹-" + fiveballRecord.getFirstBao().toString() + "</br>";
                }
            }
            if(fiveballRecord.getFirstDui() > 0){
                if(firstDsbResult == 1){
                    betResult += "<span style='color:red'>前三:对" + "-" + fiveballRecord.getFirstDui().toString() + "</span></br>";
                }else{
                    betResult += "前三:对-" + fiveballRecord.getFirstDui().toString() + "</br>";
                }
            }
            if(fiveballRecord.getFirstSun() > 0){
                if(firstDsbResult == 2){
                    betResult += "<span style='color:red'>前三:顺" + "-" + fiveballRecord.getFirstSun().toString() + "</span></br>";
                }else{
                    betResult += "前三:顺-" + fiveballRecord.getFirstSun().toString() + "</br>";
                }
            }
            if(fiveballRecord.getFirstBan() > 0){
                if(firstDsbResult == 3){
                    betResult += "<span style='color:red'>前三:半顺" + "-" + fiveballRecord.getFirstBan().toString() + "</span></br>";
                }else{
                    betResult += "前三:半顺-" + fiveballRecord.getFirstBan().toString() + "</br>";
                }
            }
            if(fiveballRecord.getFirstZa() > 0){
                if(firstDsbResult == 4){
                    betResult += "<span style='color:red'>前三:杂六" + "-" + fiveballRecord.getFirstZa().toString() + "</span></br>";
                }else{
                    betResult += "前三:杂六-" + fiveballRecord.getFirstZa().toString() + "</br>";
                }
            }

            // 中三
            // 杂六4 半顺3 顺2 对1 豹0 [豹,对,顺,半顺,杂六]
            Integer midDsbResult = getBaoShunDui(fiveballRecord.getNum2(),fiveballRecord.getNum3(),fiveballRecord.getNum4());
            if(fiveballRecord.getMidBan() > 0){
                if(midDsbResult == 0){
                    betResult += "<span style='color:red'>中三:豹" + "-" + fiveballRecord.getMidBan().toString() + "</span></br>";
                }else{
                    betResult += "中三:豹-" + fiveballRecord.getMidBan().toString() + "</br>";
                }
            }
            if(fiveballRecord.getMidDui() > 0){
                if(midDsbResult == 1){
                    betResult += "<span style='color:red'>中三:对" + "-" + fiveballRecord.getMidDui().toString() + "</span></br>";
                }else{
                    betResult += "中三:对-" + fiveballRecord.getMidDui().toString() + "</br>";
                }
            }
            if(fiveballRecord.getMidSun() > 0){
                if(midDsbResult == 2){
                    betResult += "<span style='color:red'>中三:顺" + "-" + fiveballRecord.getMidSun().toString() + "</span></br>";
                }else{
                    betResult += "中三:顺-" + fiveballRecord.getMidSun().toString() + "</br>";
                }
            }
            if(fiveballRecord.getMidBan() > 0){
                if(midDsbResult == 3){
                    betResult += "<span style='color:red'>中三:半顺" + "-" + fiveballRecord.getMidBan().toString() + "</span></br>";
                }else{
                    betResult += "中三:半顺-" + fiveballRecord.getMidBan().toString() + "</br>";
                }
            }
            if(fiveballRecord.getMidZa() > 0){
                if(midDsbResult == 4){
                    betResult += "<span style='color:red'>中三:杂六" + "-" + fiveballRecord.getMidZa().toString() + "</span></br>";
                }else{
                    betResult += "中三:杂六-" + fiveballRecord.getMidZa().toString() + "</br>";
                }
            }

            // 后三
            // 杂六4 半顺3 顺2 对1 豹0 [豹,对,顺,半顺,杂六]
            Integer backDsbResult = getBaoShunDui(fiveballRecord.getNum3(),fiveballRecord.getNum4(),fiveballRecord.getNum5());
            if(fiveballRecord.getBackBao() > 0){
                if(backDsbResult == 0){
                    betResult += "<span style='color:red'>后三:豹" + "-" + fiveballRecord.getBackBao().toString() + "</span></br>";
                }else{
                    betResult += "后三:豹-" + fiveballRecord.getBackBao().toString() + "</br>";
                }
            }
            if(fiveballRecord.getBackDui() > 0){
                if(backDsbResult == 1){
                    betResult += "<span style='color:red'>后三:对" + "-" + fiveballRecord.getBackDui().toString() + "</span></br>";
                }else{
                    betResult += "后三:对-" + fiveballRecord.getBackDui().toString() + "</br>";
                }
            }
            if(fiveballRecord.getBackSun() > 0){
                if(backDsbResult == 2){
                    betResult += "<span style='color:red'>后三:顺" + "-" + fiveballRecord.getBackSun().toString() + "</span></br>";
                }else{
                    betResult += "后三:顺-" + fiveballRecord.getBackSun().toString() + "</br>";
                }
            }
            if(fiveballRecord.getBackBan() > 0){
                if(backDsbResult == 3){
                    betResult += "<span style='color:red'>后三:半顺" + "-" + fiveballRecord.getBackBan().toString() + "</span></br>";
                }else{
                    betResult += "后三:半顺-" + fiveballRecord.getBackBan().toString() + "</br>";
                }
            }
            if(fiveballRecord.getBackZa() > 0){
                if(backDsbResult == 4){
                    betResult += "<span style='color:red'>后三:杂六" + "-" + fiveballRecord.getBackZa().toString() + "</span></br>";
                }else{
                    betResult += "后三:杂六-" + fiveballRecord.getBackZa().toString() + "</br>";
                }
            }

            vo.setBetResult(betResult);

            resList.add(vo);
        }
        return resList;
    }

    public List<BetUserWinRespVo> recordTenBall(SysGame gameInfo, BetUserWinReqVO betUserWinReqVO){
        List<BetUserWinRespVo> resList = new ArrayList<>();

        List<Integer> bigSingleList = Arrays.asList(13, 15, 17, 19);
        List<Integer> smallSingleList = Arrays.asList(3, 5, 7, 9, 11);
        List<Integer> bigDoubleList = Arrays.asList(12, 14, 16, 18);
        List<Integer> smallDoubleList = Arrays.asList(4, 6, 8, 10);
        List<GameTenballRecord> tenballDateRecordList = gameTenballRecordMapper.selectUserDateList(betUserWinReqVO.getGameId(), betUserWinReqVO.getUserId(), betUserWinReqVO.getRecordTime());
        for(GameTenballRecord tenballRecord : tenballDateRecordList){
            BetUserWinRespVo vo = new BetUserWinRespVo();

            vo.setBetRecordId(tenballRecord.getId());
            vo.setUserId(tenballRecord.getUserId());
            vo.setGameId(tenballRecord.getGameId());
            vo.setGameName(tenballRecord.getGameName());
            vo.setPeriods(tenballRecord.getPeriods());
            vo.setBetOpenTime(tenballRecord.getRecordTime());
            vo.setCountMoney(tenballRecord.getCountMoney());
            vo.setWinMoney(tenballRecord.getWinMoney());
            vo.setIsDeduct(tenballRecord.getIsDeduct());

            BigDecimal bd1 = new BigDecimal(Float.toString(tenballRecord.getWinMoney()));
            BigDecimal bd2 = new BigDecimal(Float.toString(tenballRecord.getCountMoney()));
            BigDecimal sum = bd1.subtract(bd2);
            BigDecimal result = sum.setScale(2, BigDecimal.ROUND_HALF_UP);
            Float resultMoney = result.floatValue();
            vo.setResultMoney(resultMoney);

            String openResult = tenballRecord.getNum1() + "+" + tenballRecord.getNum2() + "+" + tenballRecord.getNum3()
                    + "+" + tenballRecord.getNum4() + "+" + tenballRecord.getNum5() + "+" + tenballRecord.getNum6()
                    + "+" + tenballRecord.getNum7() + "+" + tenballRecord.getNum8() + "+" + tenballRecord.getNum9()
                    + "+" + tenballRecord.getNum10();
            vo.setOpenResult(openResult);

            String betResult = "";

            Integer sumNum = tenballRecord.getSumNum();
            Map<String, Object> gameTenballRecordMap = EntityMapTransUtils.entityToMap1(tenballRecord);

            // 冠亚和的大小单双的金额计算
            if(tenballRecord.getType1Big() >0){
                if(sumNum > 11){
                    betResult += "<span style='color:red'>大" + "-" + tenballRecord.getType1Big().toString() + "</span></br>";
                }else{
                    betResult += "大-" + tenballRecord.getType1Big().toString() + "</br>";
                }
            }
            // 冠亚和的小的金额计算
            if(tenballRecord.getType1Small() >0){
                if(sumNum < 12){
                    betResult += "<span style='color:red'>小" + "-" + tenballRecord.getType1Small().toString() + "</span></br>";
                }else{
                    betResult += "小-" + tenballRecord.getType1Small().toString() + "</br>";
                }
            }
            // 冠亚和的单的金额计算
            if(tenballRecord.getType1Single() >0){
                if(sumNum%2 == 1){
                    betResult += "<span style='color:red'>单" + "-" + tenballRecord.getType1Single().toString() + "</span></br>";
                }else{
                    betResult += "单-" + tenballRecord.getType1Single().toString() + "</br>";
                }
            }
            // 冠亚和的双的金额计算
            if(tenballRecord.getType1Double() >0){
                if(sumNum%2 == 0){
                    betResult += "<span style='color:red'>双" + "-" + tenballRecord.getType1Double().toString() + "</span></br>";
                }else{
                    betResult += "双-" + tenballRecord.getType1Double().toString() + "</br>";
                }
            }

            // 冠亚和的大单·大双·小单·小双的金额计算
            if(tenballRecord.getBigSingle() > 0){
                if(sumNum > 11 && sumNum%2 == 1){
                    betResult += "<span style='color:red'>大单" + "-" + tenballRecord.getBigSingle().toString() + "</span></br>";
                }else{
                    betResult += "大单-" + tenballRecord.getBigSingle().toString() + "</br>";
                }
            }
            if(tenballRecord.getBigDouble() > 0){
                if(sumNum > 11 && sumNum%2 == 0){
                    betResult += "<span style='color:red'>大双" + "-" + tenballRecord.getBigDouble().toString() + "</span></br>";
                }else{
                    betResult += "大双-" + tenballRecord.getBigDouble().toString() + "</br>";
                }
            }
            if(tenballRecord.getSmallSingle() > 0){
                if(sumNum < 12 && sumNum%2 == 1){
                    betResult += "<span style='color:red'>小单" + "-" + tenballRecord.getSmallSingle().toString() + "</span></br>";
                }else{
                    betResult += "小单-" + tenballRecord.getSmallSingle().toString() + "</br>";
                }
            }
            if(tenballRecord.getSmallDouble() > 0){
                if(sumNum < 12 && sumNum%2 == 0){
                    betResult += "<span style='color:red'>小双" + "-" + tenballRecord.getSmallSingle().toString() + "</span></br>";
                }else{
                    betResult += "小双-" + tenballRecord.getSmallSingle().toString() + "</br>";
                }
            }

            //冠亚和3~19的金额计算
            for(int j=3;j<=19;j++){
                Object amountObject = gameTenballRecordMap.get("type1Num" + j);
                Float amount = amountObject!=null?(Float) amountObject:0f;
                if(amount > 0){
                    if(sumNum == j){
                        betResult += "<span style='color:red'>" + j + "-" + amount + "</span></br>";
                    }else{
                        betResult += j + "-" + amount + "</br>";
                    }
                }
            }


            //冠军~第十名的金额计算
            for(int k=2;k<=11;k++){

                // 开奖num1~10
                for(int x=1;x<=10;x++){
                    Object kjNumObject = gameTenballRecordMap.get("num" + x);
                    Integer kjNum = kjNumObject!=null?(Integer) kjNumObject:0;

                    Object amountObject = gameTenballRecordMap.get("type" + k +"Num" + x);
                    Float amount = amountObject!=null?(Float) amountObject:0f;
                    if(amount > 0){
                        if(kjNum == (k-1)){
                            betResult += "<span style='color:red'>" + (k-1) + "-" + x + "-" + amount + "</span></br>";
                        }else{
                            betResult += (k-1) + "-" + x + "-"  + amount + "</br>";
                        }
                    }
                }

                Object kjNumObject = gameTenballRecordMap.get("num" + (k-1));
                Integer kjNum = kjNumObject!=null?(Integer) kjNumObject:0;

                Object kj2NumObject = gameTenballRecordMap.get("num" + (11-(k-1)));
                Integer kj2Num = kj2NumObject!=null?(Integer) kj2NumObject:0;

                // 单的金额计算
                Object singleAmountObject = gameTenballRecordMap.get("type" + k + "Single");
                Float singleAmount = singleAmountObject!=null?(Float) singleAmountObject:0f;
                if(singleAmount > 0){
                    if(kjNum%2 == 1){
                        betResult += "<span style='color:red'>" + (k-1) + "-单-" + singleAmount + "</span></br>";
                    }else{
                        betResult += (k-1) + "-单-" +  singleAmount + "</br>";
                    }
                }

                // 双的金额计算
                Object doubleAmountObject = gameTenballRecordMap.get("type" + k + "Double");
                Float doubleAmount = doubleAmountObject!=null?(Float) doubleAmountObject:0f;
                if(doubleAmount > 0){
                    if(kjNum%2 == 0){
                        betResult += "<span style='color:red'>" + (k-1) + "-双-" + doubleAmount + "</span></br>";
                    }else{
                        betResult += (k-1) + "-双-" +  doubleAmount + "</br>";
                    }
                }

                // 大的金额计算
                Object bigAmountObject = gameTenballRecordMap.get("type" + k + "Big");
                Float bigAmount = bigAmountObject!=null?(Float) bigAmountObject:0f;
                if(bigAmount > 0){
                    if(kjNum%2 > 5){
                        betResult += "<span style='color:red'>" + (k-1) + "-大-" + bigAmount + "</span></br>";
                    }else{
                        betResult += (k-1) + "-大-" +  bigAmount + "</br>";
                    }
                }

                // 小的金额计算
                Object smallAmountObject = gameTenballRecordMap.get("type" + k + "Small");
                Float smallAmount = smallAmountObject!=null?(Float) smallAmountObject:0f;
                if(smallAmount > 0){
                    if(kjNum%2 < 6){
                        betResult += "<span style='color:red'>" + (k-1) + "-小-" + smallAmount + "</span></br>";
                    }else{
                        betResult += (k-1) + "-小-" +  smallAmount + "</br>";
                    }
                }

                // 龙的金额计算
                Object loongAmountObject = gameTenballRecordMap.get("type" + k + "Loong");
                Float loongAmount = loongAmountObject!=null?(Float) loongAmountObject:0f;
                if(loongAmount > 0){
                    if(kj2Num < kjNum){
                        betResult += "<span style='color:red'>" + (k-1) + "-龙-" + loongAmount + "</span></br>";
                    }else{
                        betResult += (k-1) + "-龙-" +  loongAmount + "</br>";
                    }
                }

                // 虎的金额计算
                Object tigerAmountObject = gameTenballRecordMap.get("type" + k + "Tiger");
                Float tigerAmount = tigerAmountObject!=null?(Float) tigerAmountObject:0f;
                if(tigerAmount > 0){
                    if(kj2Num > kjNum){
                        betResult += "<span style='color:red'>" + (k-1) + "-虎-" + tigerAmount + "</span></br>";
                    }else{
                        betResult += (k-1) + "-虎-" +  tigerAmount + "</br>";
                    }
                }
            }

            vo.setBetResult(betResult);

            resList.add(vo);
        }
        return resList;
    }

    @Override
    public void betUserDeduct(BetUserDeductReqVO vo) {

        SysGame gameInfo = sysGameService.selectSysGameByGameId(vo.getGameId());

        Float countMoney = betkjMapper.selectGameRecordCountMoneyById(gameInfo.getGameRecord(), vo.getBetRecordId());

        betkjMapper.updateGameRecordDeductType(gameInfo.getGameRecord(), vo.getBetRecordId(), vo.getIsDeduct());

        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        String winTime = sd.format(vo.getRecordTime());

        userwinMapper.updateUserDeductMoney(vo.getUserId(), vo.getGameId(), winTime, vo.getIsDeduct(), countMoney);
    }
}
