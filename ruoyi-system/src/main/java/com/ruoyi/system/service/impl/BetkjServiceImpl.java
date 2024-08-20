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

    //系统提前开奖期数
    @Value("${gameOpen.periodsSize}")
    private Integer periodsSize;

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

    @Autowired
    private ISysAppService sysAppService;

    @Autowired
    private ISysGameService gameService;


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
        String openCodeTable = "";
        if(StringUtils.equals(gameInfo.getGameType(),"3")){
            kjTable = "game_threeball_kj";
            openCodeTable = "game_threeball_open_data";
        }else if(StringUtils.equals(gameInfo.getGameType(),"5")){
            kjTable = "game_fiveball_kj";
            openCodeTable = "game_fiveball_open_data";
        }else{
            kjTable = "game_tenball_kj";
            openCodeTable = "game_tenball_open_data";
        }

        return betkjMapper.selectBetkjList(gameInfo.getGameId(), kjTable, openCodeTable,gameInfo.getGameType(), betkjReqVO.getPeriods(), betkjReqVO.getStatus());
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

        GameThreeballOpenData gameThreeballOpenData = gameThreeballOpenDataService.selectGameThreeballOpenDataByPeriods(gameInfo.getGameId(), periods,"0");

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
        GameFiveballOpenData gameFiveballOpenData = gameFiveballOpenDataService.selectGameFiveballOpenDataByPeriods(gameInfo.getGameId(), periods,"0");

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
        GameTenballOpenData gameTenballOpenData = gameTenballOpenDataService.selectGameTenballOpenDataByPeriods(gameInfo.getGameId(), periods,"0");

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

                // 已开奖但未结算
                List<GameThreeballKj> gameThreeballKajiangPeriodsList = gameThreeballKjService.selectKajiangPeriods(vo.getGameId());
                for(GameThreeballKj gameThreeballKj : gameThreeballKajiangPeriodsList){
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

                // 已开奖但未结算
                List<GameFiveballKj> gameFiveballKajiangPeriodsList = gameFiveballKjService.selectKajiangPeriods(vo.getGameId());
                for(GameFiveballKj gameFiveballKj : gameFiveballKajiangPeriodsList){
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

                List<GameTenballKj> gameTenballKajiangPeriodsList = gameTenballKjService.selectKajiangPeriods(vo.getGameId());
                for(GameTenballKj gameTenballKj : gameTenballKajiangPeriodsList){
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
            GameThreeballOpenData newGameThreeballOpenData = gameThreeballOpenDataService.selectGameThreeballOpenDataByPeriods(gameInfo.getGameId(), gameOpenDataDto.getExpect(),"0");
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
            GameFiveballOpenData newGameFiveballOpenData = gameFiveballOpenDataService.selectGameFiveballOpenDataByPeriods(gameInfo.getGameId(), gameOpenDataDto.getExpect(),"0");
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
            GameTenballOpenData newGameTenballOpenData = gameTenballOpenDataService.selectGameTenballOpenDataByPeriods(gameInfo.getGameId(), gameOpenDataDto.getExpect(),"0");
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

        Long newPeriods =  0l;
        if(threeballOpenData != null){
            newPeriods = threeballOpenData.getPeriods() + 1;
        }

        if(threeballOpenData != null && gameOpenDataDtoMap.get(newPeriods) == null
                && gameOpenDataDtoMap.get(threeballOpenData.getPeriods()) != null){
            return;
        }

//        if(threeballOpenData != null){
//            GameOpenDataDto openData = new GameOpenDataDto();
//
//            Long newPeriods = threeballOpenData.getPeriods() + 1;
//
//            if(gameOpenDataDtoMap.get(newPeriods) == null
//                    && gameOpenDataDtoMap.get(threeballOpenData.getPeriods()) != null){
////                System.out.println(gameInfo.getGameName() + ": 暂时无新数据");
//                return;
//            }
//
//            Long newId = 0l;
//            if((gameOpenDataDtoMap.get(threeballOpenData.getPeriods()) != null)){
//                openData = gameOpenDataDtoMap.get(newPeriods);
//                newId = newPeriods;
//            }else{
//                openData = openDataList.get(0);
//                newId = openData.getExpect();
//            }
//            GameThreeballOpenData newGameThreeballOpenDataInfo = gameThreeballOpenDataService.selectGameThreeballOpenDataByPeriods(gameInfo.getGameId(),newId);
//            boolean newFlg = false;
//            if(newGameThreeballOpenDataInfo == null){
//                newGameThreeballOpenDataInfo = new GameThreeballOpenData();
//                newFlg = true;
//            }
//            newGameThreeballOpenDataInfo.setPeriods(newId);
//            newGameThreeballOpenDataInfo.setGameId(gameInfo.getGameId());
//            newGameThreeballOpenDataInfo.setGameName(gameInfo.getGameName());
//            String [] numList = openData.getOpencode().split(",");
//            newGameThreeballOpenDataInfo.setSum1(Integer.parseInt(numList[0]));
//            newGameThreeballOpenDataInfo.setSum2(Integer.parseInt(numList[1]));
//            newGameThreeballOpenDataInfo.setSum3(Integer.parseInt(numList[2]));
//            newGameThreeballOpenDataInfo.setTime(openData.getOpentime());
//            newGameThreeballOpenDataInfo.setCreateBy("TASK");
//
//            if(newFlg){
//                gameThreeballOpenDataService.insertGameThreeballOpenData(newGameThreeballOpenDataInfo);
//            }else{
//                gameThreeballOpenDataService.updateGameThreeballOpenData(newGameThreeballOpenDataInfo);
//            }
//        }else{
            List<GameOpenDataDto> sortedList = openDataList.stream()
                    .sorted(Comparator.comparing(GameOpenDataDto::getExpect)) // 根据expect字段进行排序
                    .collect(Collectors.toList());
            for(GameOpenDataDto gameOpenDataDto : sortedList){
                GameThreeballOpenData newGameThreeballOpenDataInfo = gameThreeballOpenDataService.selectGameThreeballOpenDataByPeriods(gameInfo.getGameId(),gameOpenDataDto.getExpect(),null);
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
                } else if (newGameThreeballOpenDataInfo.getSum1() == null) {

                    String[] numList = gameOpenDataDto.getOpencode().split(",");
                    newGameThreeballOpenDataInfo.setSum1(Integer.parseInt(numList[0]));
                    newGameThreeballOpenDataInfo.setSum2(Integer.parseInt(numList[1]));
                    newGameThreeballOpenDataInfo.setSum3(Integer.parseInt(numList[2]));
                    newGameThreeballOpenDataInfo.setTime(gameOpenDataDto.getOpentime());

                    gameThreeballOpenDataService.updateGameThreeballOpenData(newGameThreeballOpenDataInfo);
                }
            }
//        }
    }

    @Override
    public void saveThreeBallInfoFromSystem(SysGame gameInfo) {

        GameThreeballOpenData threeballOpenData = gameThreeballOpenDataService.selectLastRecord(gameInfo.getGameId());
        Date beforeOpenDataTime = null;
        if(threeballOpenData == null) {
            //初始没数据
            threeballOpenData = new GameThreeballOpenData();
            threeballOpenData.setPeriods(1l);
            threeballOpenData.setGameId(gameInfo.getGameId());
            threeballOpenData.setGameName(gameInfo.getGameName());
            List<String> openCode = sysAppService.getOpenData(gameInfo.getGameType());
            threeballOpenData.setSum1(Integer.parseInt(openCode.get(0)));
            threeballOpenData.setSum2(Integer.parseInt(openCode.get(1)));
            threeballOpenData.setSum3(Integer.parseInt(openCode.get(2)));
            threeballOpenData.setTime(new Date());
            threeballOpenData.setPreSum1(Integer.parseInt(openCode.get(0)));
            threeballOpenData.setPreSum2(Integer.parseInt(openCode.get(1)));
            threeballOpenData.setPreSum3(Integer.parseInt(openCode.get(2)));
            threeballOpenData.setPreTime(new Date());
            threeballOpenData.setCreateBy("TASK");

            gameThreeballOpenDataService.insertGameThreeballOpenData(threeballOpenData);
        }

        //获取开奖数据
        GameThreeballOpenData searchPreThreeballOpenData = new GameThreeballOpenData();
        searchPreThreeballOpenData.setStatus("2"); //预开奖
        searchPreThreeballOpenData.setGameId(gameInfo.getGameId());
        List<GameThreeballOpenData> preThreeballOpenDataList = gameThreeballOpenDataService.selectGameThreeballOpenDataList(searchPreThreeballOpenData);
        Integer preOpenSize = preThreeballOpenDataList.size();
        if(preOpenSize >= periodsSize){
            return;
        }
        //没有预开奖数据
        if(preOpenSize == 0){
            beforeOpenDataTime = new Date();
        }else{
            beforeOpenDataTime = threeballOpenData.getTime();
        }
        SimpleDateFormat sd = new SimpleDateFormat("HHmmss");
        Integer startTime = 0;
        Integer endTime = 999999;
        if(StringUtils.isNotEmpty(gameInfo.getValidOpenStartTime())){
            startTime = Integer.parseInt(gameInfo.getValidOpenStartTime()+"00");
        }
        if(StringUtils.isNotEmpty(gameInfo.getValidOpenEndTime())){
            endTime = Integer.parseInt(gameInfo.getValidOpenEndTime()+"59");
        }
        Calendar currentTime = Calendar.getInstance();

        // 需要产生的虚拟开奖记录个数
        for(int i=1;i<=periodsSize;i++) {
            Long newPeriods = threeballOpenData.getPeriods() + i;

            GameThreeballOpenData preThreeballOpenData = gameThreeballOpenDataService.selectGameThreeballOpenDataByPeriods(gameInfo.getGameId(), newPeriods,null);
            if(preThreeballOpenData == null){
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(beforeOpenDataTime);
                //预计开奖时间
                calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval()*i);
                calendar.add(Calendar.SECOND, gameInfo.getLeadTime()*-1);
                String preTime = sd.format(calendar.getTime());
                if(startTime.compareTo(Integer.parseInt(preTime)) > 0 || endTime.compareTo(Integer.parseInt(preTime)) < 0){
                    break;
                }

                preThreeballOpenData = new GameThreeballOpenData();

                preThreeballOpenData.setPeriods(newPeriods);
                preThreeballOpenData.setGameId(gameInfo.getGameId());
                preThreeballOpenData.setGameName(gameInfo.getGameName());
                List<String> openCode = sysAppService.getOpenData(gameInfo.getGameType());
                preThreeballOpenData.setPreSum1(Integer.parseInt(openCode.get(0)));
                preThreeballOpenData.setPreSum2(Integer.parseInt(openCode.get(1)));
                preThreeballOpenData.setPreSum3(Integer.parseInt(openCode.get(2)));
                preThreeballOpenData.setStatus("1");

                if(currentTime.after(calendar.getTime())){
                    beforeOpenDataTime = new Date();
                    preThreeballOpenData.setPreTime(new Date());
                }else{
                    preThreeballOpenData.setPreTime(calendar.getTime());
                }
                preThreeballOpenData.setCreateBy("TASK");

                gameThreeballOpenDataService.insertGameThreeballOpenData(preThreeballOpenData);
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

        Long newPeriods =  0l;
        if(fiveballOpenData != null){
            newPeriods = fiveballOpenData.getPeriods() + 1;
        }

        if(fiveballOpenData != null && gameOpenDataDtoMap.get(newPeriods) == null
                && gameOpenDataDtoMap.get(fiveballOpenData.getPeriods()) != null){
//            System.out.println(gameInfo.getGameName() + ": 暂时无新数据");
            return;
        }
//        if(fiveballOpenData != null){
//            GameOpenDataDto openData = new GameOpenDataDto();
//
//            Long newId = 0l;
//            if((gameOpenDataDtoMap.get(fiveballOpenData.getPeriods()) != null)){
//                openData = gameOpenDataDtoMap.get(newPeriods);
//                newId = newPeriods;
//            }else{
//                openData = openDataList.get(0);
//                newId = openData.getExpect();
//            }
//            GameFiveballOpenData newGameFiveballOpenDataInfo = gameFiveballOpenDataService.selectGameFiveballOpenDataById(newId);
//            boolean newFlg = false;
//            if(newGameFiveballOpenDataInfo == null){
//                newGameFiveballOpenDataInfo = new GameFiveballOpenData();
//                newFlg = true;
//            }
//            newGameFiveballOpenDataInfo.setPeriods(newId);
//            newGameFiveballOpenDataInfo.setGameId(gameInfo.getGameId());
//            newGameFiveballOpenDataInfo.setGameName(gameInfo.getGameName());
//            String [] numList = openData.getOpencode().split(",");
//            newGameFiveballOpenDataInfo.setNum1(Integer.parseInt(numList[0]));
//            newGameFiveballOpenDataInfo.setNum2(Integer.parseInt(numList[1]));
//            newGameFiveballOpenDataInfo.setNum3(Integer.parseInt(numList[2]));
//            newGameFiveballOpenDataInfo.setNum4(Integer.parseInt(numList[3]));
//            newGameFiveballOpenDataInfo.setNum5(Integer.parseInt(numList[4]));
//            newGameFiveballOpenDataInfo.setTime(openData.getOpentime());
//            newGameFiveballOpenDataInfo.setCreateBy("TASK");
//
//            if(newFlg){
//                gameFiveballOpenDataService.insertGameFiveballOpenData(newGameFiveballOpenDataInfo);
//            }else{
//                gameFiveballOpenDataService.updateGameFiveballOpenData(newGameFiveballOpenDataInfo);
//            }
//        }else{
            List<GameOpenDataDto> sortedList = openDataList.stream()
                    .sorted(Comparator.comparing(GameOpenDataDto::getExpect)) // 根据expect字段进行排序
                    .collect(Collectors.toList());
            for(GameOpenDataDto gameOpenDataDto : sortedList){
                GameFiveballOpenData newGameFiveballOpenDataInfo = gameFiveballOpenDataService.selectGameFiveballOpenDataByPeriods(gameInfo.getGameId(),gameOpenDataDto.getExpect(),null);
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
                } else if (newGameFiveballOpenDataInfo.getNum1() == null) {
                    String[] numList = gameOpenDataDto.getOpencode().split(",");
                    newGameFiveballOpenDataInfo.setNum1(Integer.parseInt(numList[0]));
                    newGameFiveballOpenDataInfo.setNum2(Integer.parseInt(numList[1]));
                    newGameFiveballOpenDataInfo.setNum3(Integer.parseInt(numList[2]));
                    newGameFiveballOpenDataInfo.setNum4(Integer.parseInt(numList[3]));
                    newGameFiveballOpenDataInfo.setNum5(Integer.parseInt(numList[4]));
                    newGameFiveballOpenDataInfo.setTime(gameOpenDataDto.getOpentime());
                    gameFiveballOpenDataService.updateGameFiveballOpenData(newGameFiveballOpenDataInfo);
                }
//            }
        }
    }

    @Override
    public void saveFiveBallInfoFromSystem(SysGame gameInfo) {

        GameFiveballOpenData fiveballOpenData = gameFiveballOpenDataService.selectLastRecord(gameInfo.getGameId());
        Date beforeOpenDataTime = null;
        if(fiveballOpenData == null){
            //初始没数据
            fiveballOpenData = new GameFiveballOpenData();
            fiveballOpenData.setPeriods(1l);
            fiveballOpenData.setGameId(gameInfo.getGameId());
            fiveballOpenData.setGameName(gameInfo.getGameName());
            List<String> openCode = sysAppService.getOpenData(gameInfo.getGameType());
            fiveballOpenData.setNum1(Integer.parseInt(openCode.get(0)));
            fiveballOpenData.setNum2(Integer.parseInt(openCode.get(1)));
            fiveballOpenData.setNum3(Integer.parseInt(openCode.get(2)));
            fiveballOpenData.setNum4(Integer.parseInt(openCode.get(3)));
            fiveballOpenData.setNum5(Integer.parseInt(openCode.get(4)));
            fiveballOpenData.setTime(new Date());
            fiveballOpenData.setPreNum1(Integer.parseInt(openCode.get(0)));
            fiveballOpenData.setPreNum2(Integer.parseInt(openCode.get(1)));
            fiveballOpenData.setPreNum3(Integer.parseInt(openCode.get(2)));
            fiveballOpenData.setPreNum4(Integer.parseInt(openCode.get(3)));
            fiveballOpenData.setPreNum5(Integer.parseInt(openCode.get(4)));
            fiveballOpenData.setPreTime(new Date());
            fiveballOpenData.setCreateBy("TASK");

            gameFiveballOpenDataService.insertGameFiveballOpenData(fiveballOpenData);
        }
        //获取开奖数据
        GameFiveballOpenData searchPreFiveballOpenData = new GameFiveballOpenData();
        searchPreFiveballOpenData.setStatus("2"); //预开奖
        searchPreFiveballOpenData.setGameId(gameInfo.getGameId());
        List<GameFiveballOpenData> preFiveballOpenDataList = gameFiveballOpenDataService.selectGameFiveballOpenDataList(searchPreFiveballOpenData);
        Integer preOpenSize = preFiveballOpenDataList.size();
        if(preOpenSize >= periodsSize){
            return;
        }
        //没有预开奖数据
        if(preOpenSize == 0){
            beforeOpenDataTime = new Date();
        }else{
            beforeOpenDataTime = fiveballOpenData.getTime();
        }
        SimpleDateFormat sd = new SimpleDateFormat("HHmmss");
        Integer startTime = 0;
        Integer endTime = 999999;
        if(StringUtils.isNotEmpty(gameInfo.getValidOpenStartTime())){
            startTime = Integer.parseInt(gameInfo.getValidOpenStartTime()+"00");
        }
        if(StringUtils.isNotEmpty(gameInfo.getValidOpenEndTime())){
            endTime = Integer.parseInt(gameInfo.getValidOpenEndTime()+"59");
        }
        Calendar currentTime = Calendar.getInstance();

        // 需要产生的虚拟开奖记录个数
        for(int i=1;i<=periodsSize;i++) {
            Long newPeriods = fiveballOpenData.getPeriods() + i;

            GameFiveballOpenData preFiveballOpenData = gameFiveballOpenDataService.selectGameFiveballOpenDataByPeriods(gameInfo.getGameId(), newPeriods,null);
            if(preFiveballOpenData == null){
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(beforeOpenDataTime);
                //预计开奖时间
                calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval()*i);
                calendar.add(Calendar.SECOND, gameInfo.getLeadTime()*-1);
                String preTime = sd.format(calendar.getTime());
                if(startTime.compareTo(Integer.parseInt(preTime)) > 0 || endTime.compareTo(Integer.parseInt(preTime)) < 0){
                    break;
                }

                preFiveballOpenData = new GameFiveballOpenData();

                preFiveballOpenData.setPeriods(newPeriods);
                preFiveballOpenData.setGameId(gameInfo.getGameId());
                preFiveballOpenData.setGameName(gameInfo.getGameName());
                List<String> openCode = sysAppService.getOpenData(gameInfo.getGameType());
                preFiveballOpenData.setPreNum1(Integer.parseInt(openCode.get(0)));
                preFiveballOpenData.setPreNum2(Integer.parseInt(openCode.get(1)));
                preFiveballOpenData.setPreNum3(Integer.parseInt(openCode.get(2)));
                preFiveballOpenData.setPreNum4(Integer.parseInt(openCode.get(3)));
                preFiveballOpenData.setPreNum5(Integer.parseInt(openCode.get(4)));
                preFiveballOpenData.setStatus("1");

                if(currentTime.after(calendar.getTime())){
                    beforeOpenDataTime = new Date();
                    preFiveballOpenData.setPreTime(new Date());
                }else{
                    preFiveballOpenData.setPreTime(calendar.getTime());
                }
                preFiveballOpenData.setCreateBy("TASK");

                gameFiveballOpenDataService.insertGameFiveballOpenData(preFiveballOpenData);
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

        Long newPeriods =  0l;
        if(tenballOpenData != null){
            newPeriods = tenballOpenData.getPeriods() + 1;
        }

        if(tenballOpenData != null && gameOpenDataDtoMap.get(newPeriods) == null
                && gameOpenDataDtoMap.get(tenballOpenData.getPeriods()) != null){
            return;
        }

//        if(tenballOpenData != null){
//            GameOpenDataDto openData = new GameOpenDataDto();
//
//            Long newPeriods = tenballOpenData.getPeriods() + 1;
//
//            if(gameOpenDataDtoMap.get(newPeriods) == null
//                    && gameOpenDataDtoMap.get(tenballOpenData.getPeriods()) != null){
////                System.out.println(gameInfo.getGameName() + ": 暂时无新数据");
//                return;
//            }
//
//            Long newId = 0l;
//            if((gameOpenDataDtoMap.get(tenballOpenData.getPeriods()) != null)){
//                openData = gameOpenDataDtoMap.get(newPeriods);
//                newId = newPeriods;
//            }else{
//                openData = openDataList.get(0);
//                newId = openData.getExpect();
//            }
//
//            GameTenballOpenData newGameTenballOpenData = gameTenballOpenDataService.selectGameTenballOpenDataByPeriods(gameInfo.getGameId(), newId);
//
//            boolean newFlg = false;
//            if(newGameTenballOpenData == null){
//                newGameTenballOpenData = new GameTenballOpenData();
//                newFlg = true;
//            }
//            newGameTenballOpenData.setPeriods(newId);
//            newGameTenballOpenData.setGameId(gameInfo.getGameId());
//            newGameTenballOpenData.setGameName(gameInfo.getGameName());
//            String [] numList = openData.getOpencode().split(",");
//            newGameTenballOpenData.setNum1(Integer.parseInt(numList[0]));
//            newGameTenballOpenData.setNum2(Integer.parseInt(numList[1]));
//            newGameTenballOpenData.setNum3(Integer.parseInt(numList[2]));
//            newGameTenballOpenData.setNum4(Integer.parseInt(numList[3]));
//            newGameTenballOpenData.setNum5(Integer.parseInt(numList[4]));
//            newGameTenballOpenData.setNum6(Integer.parseInt(numList[5]));
//            newGameTenballOpenData.setNum7(Integer.parseInt(numList[6]));
//            newGameTenballOpenData.setNum8(Integer.parseInt(numList[7]));
//            newGameTenballOpenData.setNum9(Integer.parseInt(numList[8]));
//            newGameTenballOpenData.setNum10(Integer.parseInt(numList[9]));
//            newGameTenballOpenData.setTime(openData.getOpentime());
//            newGameTenballOpenData.setCreateBy("TASK");
//
//            if(newFlg){
//                gameTenballOpenDataService.insertGameTenballOpenData(newGameTenballOpenData);
//            }else{
//                gameTenballOpenDataService.updateGameTenballOpenData(newGameTenballOpenData);
//            }
//        }else{
            List<GameOpenDataDto> sortedList = openDataList.stream()
                    .sorted(Comparator.comparing(GameOpenDataDto::getExpect)) // 根据expect字段进行排序
                    .collect(Collectors.toList());

            for(GameOpenDataDto gameOpenDataDto : sortedList){
                GameTenballOpenData newGameTenballOpenData = gameTenballOpenDataService.selectGameTenballOpenDataByPeriods(gameInfo.getGameId(), gameOpenDataDto.getExpect(),null);
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
                } else if (newGameTenballOpenData.getNum1() == null) {

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

                    gameTenballOpenDataService.updateGameTenballOpenData(newGameTenballOpenData);
                }
            }
//        }
    }

    @Override
    public void saveTenBallInfoFromSystem(SysGame gameInfo) {

        GameTenballOpenData tenballOpenData = gameTenballOpenDataService.selectLastRecord(gameInfo.getGameId());
        Date beforeOpenDataTime = null;
        if(tenballOpenData == null) {
            //初始没数据
            tenballOpenData = new GameTenballOpenData();
            tenballOpenData.setPeriods(1l);
            tenballOpenData.setGameId(gameInfo.getGameId());
            tenballOpenData.setGameName(gameInfo.getGameName());
            List<String> openCode = sysAppService.getOpenData(gameInfo.getGameType());


            tenballOpenData.setNum1(Integer.parseInt(openCode.get(0)));
            tenballOpenData.setNum2(Integer.parseInt(openCode.get(1)));
            tenballOpenData.setNum3(Integer.parseInt(openCode.get(2)));
            tenballOpenData.setNum4(Integer.parseInt(openCode.get(3)));
            tenballOpenData.setNum5(Integer.parseInt(openCode.get(4)));
            tenballOpenData.setNum6(Integer.parseInt(openCode.get(5)));
            tenballOpenData.setNum7(Integer.parseInt(openCode.get(6)));
            tenballOpenData.setNum8(Integer.parseInt(openCode.get(7)));
            tenballOpenData.setNum9(Integer.parseInt(openCode.get(8)));
            tenballOpenData.setNum10(Integer.parseInt(openCode.get(9)));
            tenballOpenData.setTime(new Date());
            tenballOpenData.setPreNum1(Integer.parseInt(openCode.get(0)));
            tenballOpenData.setPreNum2(Integer.parseInt(openCode.get(1)));
            tenballOpenData.setPreNum3(Integer.parseInt(openCode.get(2)));
            tenballOpenData.setPreNum4(Integer.parseInt(openCode.get(3)));
            tenballOpenData.setPreNum5(Integer.parseInt(openCode.get(4)));
            tenballOpenData.setPreNum6(Integer.parseInt(openCode.get(5)));
            tenballOpenData.setPreNum7(Integer.parseInt(openCode.get(6)));
            tenballOpenData.setPreNum8(Integer.parseInt(openCode.get(7)));
            tenballOpenData.setPreNum9(Integer.parseInt(openCode.get(8)));
            tenballOpenData.setPreNum10(Integer.parseInt(openCode.get(9)));
            tenballOpenData.setPreTime(new Date());
            tenballOpenData.setCreateBy("TASK");

            gameTenballOpenDataService.insertGameTenballOpenData(tenballOpenData);
        }

        //获取开奖数据
        GameTenballOpenData searchPreTenballOpenData = new GameTenballOpenData();
        searchPreTenballOpenData.setStatus("2"); //预开奖
        searchPreTenballOpenData.setGameId(gameInfo.getGameId());
        List<GameTenballOpenData> preTenballOpenDataList = gameTenballOpenDataService.selectGameTenballOpenDataList(searchPreTenballOpenData);
        Integer preOpenSize = preTenballOpenDataList.size();
        if(preOpenSize >= periodsSize){
            return;
        }
        //没有预开奖数据
        if(preOpenSize == 0){
            beforeOpenDataTime = new Date();
        }else{
            beforeOpenDataTime = tenballOpenData.getTime();
        }
        SimpleDateFormat sd = new SimpleDateFormat("HHmmss");
        Integer startTime = 0;
        Integer endTime = 999999;
        if(StringUtils.isNotEmpty(gameInfo.getValidOpenStartTime())){
            startTime = Integer.parseInt(gameInfo.getValidOpenStartTime()+"00");
        }
        if(StringUtils.isNotEmpty(gameInfo.getValidOpenEndTime())){
            endTime = Integer.parseInt(gameInfo.getValidOpenEndTime()+"59");
        }
        Calendar currentTime = Calendar.getInstance();

        // 需要产生的虚拟开奖记录个数
        for(int i=1;i<=periodsSize;i++) {
            Long newPeriods = tenballOpenData.getPeriods() + i;

            GameTenballOpenData preTenballOpenData = gameTenballOpenDataService.selectGameTenballOpenDataByPeriods(gameInfo.getGameId(), newPeriods,null);
            if(preTenballOpenData == null){
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(beforeOpenDataTime);
                //预计开奖时间
                calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval()*i);
                calendar.add(Calendar.SECOND, gameInfo.getLeadTime()*-1);
                String preTime = sd.format(calendar.getTime());
                if(startTime.compareTo(Integer.parseInt(preTime)) > 0 || endTime.compareTo(Integer.parseInt(preTime)) < 0){
                    break;
                }

                preTenballOpenData = new GameTenballOpenData();

                preTenballOpenData.setPeriods(newPeriods);
                preTenballOpenData.setGameId(gameInfo.getGameId());
                preTenballOpenData.setGameName(gameInfo.getGameName());
                List<String> openCode = sysAppService.getOpenData(gameInfo.getGameType());
                preTenballOpenData.setPreNum1(Integer.parseInt(openCode.get(0)));
                preTenballOpenData.setPreNum2(Integer.parseInt(openCode.get(1)));
                preTenballOpenData.setPreNum3(Integer.parseInt(openCode.get(2)));
                preTenballOpenData.setPreNum4(Integer.parseInt(openCode.get(3)));
                preTenballOpenData.setPreNum5(Integer.parseInt(openCode.get(4)));
                preTenballOpenData.setPreNum6(Integer.parseInt(openCode.get(5)));
                preTenballOpenData.setPreNum7(Integer.parseInt(openCode.get(6)));
                preTenballOpenData.setPreNum8(Integer.parseInt(openCode.get(7)));
                preTenballOpenData.setPreNum9(Integer.parseInt(openCode.get(8)));
                preTenballOpenData.setPreNum10(Integer.parseInt(openCode.get(9)));
                preTenballOpenData.setStatus("1");

                if(currentTime.after(calendar.getTime())){
                    beforeOpenDataTime = new Date();
                    preTenballOpenData.setPreTime(new Date());
                }else{
                    preTenballOpenData.setPreTime(calendar.getTime());
                }
                preTenballOpenData.setCreateBy("TASK");

                gameTenballOpenDataService.insertGameTenballOpenData(preTenballOpenData);
            }
        }

    }

    @Override
    public void openThreeBallSystemExpectData(SysGame gameInfo) {

        List<GameThreeballOpenData> preThreeballOpenData = gameThreeballOpenDataService.selectThreeballPreOpenData();
        boolean nextOpenFlg = false;
        for(GameThreeballOpenData gameThreeballOpenData : preThreeballOpenData){
            gameThreeballOpenData.setStatus("0");
            gameThreeballOpenData.setSum1(gameThreeballOpenData.getPreSum1());
            gameThreeballOpenData.setSum2(gameThreeballOpenData.getPreSum2());
            gameThreeballOpenData.setSum3(gameThreeballOpenData.getPreSum3());
            gameThreeballOpenData.setTime(gameThreeballOpenData.getPreTime());

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(gameThreeballOpenData.getPreTime());
            calendar.add(Calendar.SECOND, gameInfo.getLeadTime()*-1);//实际开奖时间要大于等于预时间
            gameThreeballOpenData.setTime(calendar.getTime());
            gameThreeballOpenDataService.updateGameThreeballOpenData(gameThreeballOpenData);
            nextOpenFlg = true;
        }
        if(nextOpenFlg){
            saveThreeBallInfoFromSystem(gameInfo);
        }
    }

    @Override
    public void openFiveBallSystemExpectData(SysGame gameInfo) {

        List<GameFiveballOpenData> preFiveballOpenData = gameFiveballOpenDataService.selectFiveballPreOpenData();
        boolean nextOpenFlg = false;
        for(GameFiveballOpenData gameFiveballOpenData : preFiveballOpenData){
            gameFiveballOpenData.setStatus("0");
            gameFiveballOpenData.setNum1(gameFiveballOpenData.getPreNum1());
            gameFiveballOpenData.setNum2(gameFiveballOpenData.getPreNum2());
            gameFiveballOpenData.setNum3(gameFiveballOpenData.getPreNum3());
            gameFiveballOpenData.setNum4(gameFiveballOpenData.getPreNum4());
            gameFiveballOpenData.setNum5(gameFiveballOpenData.getPreNum5());
            gameFiveballOpenData.setTime(gameFiveballOpenData.getPreTime());

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(gameFiveballOpenData.getPreTime());
            calendar.add(Calendar.SECOND, gameInfo.getLeadTime()*-1);//实际开奖时间要大于等于预时间
            gameFiveballOpenData.setTime(calendar.getTime());
            gameFiveballOpenDataService.updateGameFiveballOpenData(gameFiveballOpenData);
            nextOpenFlg = true;
        }
        if(nextOpenFlg){
            saveFiveBallInfoFromSystem(gameInfo);
        }
    }

    @Override
    public void openTenBallSystemExpectData(SysGame gameInfo) {

        List<GameTenballOpenData> preTenballOpenData = gameTenballOpenDataService.selectTenballPreOpenData();
        boolean nextOpenFlg = false;
        for(GameTenballOpenData gameTenballOpenData : preTenballOpenData){
            gameTenballOpenData.setStatus("0");
            gameTenballOpenData.setNum1(gameTenballOpenData.getPreNum1());
            gameTenballOpenData.setNum2(gameTenballOpenData.getPreNum2());
            gameTenballOpenData.setNum3(gameTenballOpenData.getPreNum3());
            gameTenballOpenData.setNum4(gameTenballOpenData.getPreNum4());
            gameTenballOpenData.setNum5(gameTenballOpenData.getPreNum5());
            gameTenballOpenData.setNum6(gameTenballOpenData.getPreNum6());
            gameTenballOpenData.setNum7(gameTenballOpenData.getPreNum7());
            gameTenballOpenData.setNum8(gameTenballOpenData.getPreNum8());
            gameTenballOpenData.setNum9(gameTenballOpenData.getPreNum9());
            gameTenballOpenData.setNum10(gameTenballOpenData.getPreNum10());
            gameTenballOpenData.setTime(gameTenballOpenData.getPreTime());

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(gameTenballOpenData.getPreTime());
            calendar.add(Calendar.SECOND, gameInfo.getLeadTime()*-1);//实际开奖时间要大于等于预时间
            gameTenballOpenData.setTime(calendar.getTime());
            gameTenballOpenDataService.updateGameTenballOpenData(gameTenballOpenData);
            nextOpenFlg = true;
        }
        if(nextOpenFlg){
            saveTenBallInfoFromSystem(gameInfo);
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

        Wave wave = waveService.selectWaveByGameId(2l);
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

    @Override
    public void autoKajiangLottery() {
        // 3球已开奖但未结算
        List<GameThreeballKj> gameThreeballKajiangPeriodsList = gameThreeballKjService.selectKajiangPeriods(null);
        for(GameThreeballKj gameThreeballKj :gameThreeballKajiangPeriodsList){
            SysGame gameInfo = sysGameService.selectSysGameByGameId(gameThreeballKj.getGameId());
            threeballHandleLottery(gameInfo, gameThreeballKj.getPeriods());
        }

        //5球已开奖但未结算
        List<GameFiveballKj> gameFiveballKajiangPeriodsList = gameFiveballKjService.selectKajiangPeriods(null);
        for(GameFiveballKj gameFiveballKj : gameFiveballKajiangPeriodsList){
            SysGame gameInfo = sysGameService.selectSysGameByGameId(gameFiveballKj.getGameId());
            fiveballHandleLottery(gameInfo, gameFiveballKj.getPeriods());
        }

        //10球已开奖但未结算
        List<GameTenballKj> gameTenballKajiangPeriodsList = gameTenballKjService.selectKajiangPeriods(null);
        for(GameTenballKj gameTenballKj : gameTenballKajiangPeriodsList){
            SysGame gameInfo = sysGameService.selectSysGameByGameId(gameTenballKj.getGameId());
            tenballHandleLottery(gameInfo, gameTenballKj.getPeriods());
        }
    }

    @Override
    public void autoAllRepairLottery() {

        // 3球卡奖
        GameThreeballKj searchGameThreeballKj = new GameThreeballKj();
        searchGameThreeballKj.setStatus("2"); //开奖中
        List<GameThreeballKj> gameThreeballKjList = gameThreeballKjService.selectGameThreeballKjList(searchGameThreeballKj);
        for(GameThreeballKj gameThreeballKj : gameThreeballKjList){
            SysGame gameInfo = sysGameService.selectSysGameByGameId(gameThreeballKj.getGameId());
            threeballHandleLottery(gameInfo, gameThreeballKj.getPeriods());
        }

        // 5球卡奖
        GameFiveballKj searchGameFiveballKj = new GameFiveballKj();
        searchGameFiveballKj.setStatus("2"); //开奖中
        List<GameFiveballKj> gameFiveballKjList = gameFiveballKjService.selectGameFiveballKjList(searchGameFiveballKj);
        for(GameFiveballKj gameFiveballKj : gameFiveballKjList){
            SysGame gameInfo = sysGameService.selectSysGameByGameId(gameFiveballKj.getGameId());
            fiveballHandleLottery(gameInfo, gameFiveballKj.getPeriods());
        }

        // 10球卡奖
        GameTenballKj searchGameTenballKj = new GameTenballKj();
        searchGameTenballKj.setStatus("2"); //开奖中
        List<GameTenballKj> gameTenballKjList = gameTenballKjService.selectGameTenballKjList(searchGameTenballKj);
        for(GameTenballKj gameTenballKj : gameTenballKjList){
            SysGame gameInfo = sysGameService.selectSysGameByGameId(gameTenballKj.getGameId());
            tenballHandleLottery(gameInfo, gameTenballKj.getPeriods());
        }

        autoKajiangLottery();
    }

    @Override
    public int reOpen(EditSystemBetCodeReqVO vo) {

        int row = 0;
        if(StringUtils.equals(vo.getGameType(),"3")){
            GameThreeballKj threeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(vo.getGameId(), vo.getPeriods());
            if(threeballKj == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }
            if(StringUtils.equals(threeballKj.getStatus(),"1")){
                throw new ServiceException("无法操作已经开奖的数据！");
            }

            GameThreeballOpenData threeballOpenData = gameThreeballOpenDataService.selectGameThreeballOpenDataByPeriods(vo.getGameId(), vo.getPeriods(), null);
            if(threeballOpenData == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }
            List<String> openCode = sysAppService.getOpenData(vo.getGameType());
            threeballOpenData.setPreSum1(Integer.parseInt(openCode.get(0)));
            threeballOpenData.setPreSum2(Integer.parseInt(openCode.get(1)));
            threeballOpenData.setPreSum3(Integer.parseInt(openCode.get(2)));
            row = gameThreeballOpenDataService.updateGameThreeballOpenData(threeballOpenData);
        }else if(StringUtils.equals(vo.getGameType(),"5")){
            GameFiveballKj fiveballKj = gameFiveballKjService.selectGameFiveballKjByPeriods(vo.getGameId(), vo.getPeriods());
            if(fiveballKj == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }
            if(StringUtils.equals(fiveballKj.getStatus(),"1")){
                throw new ServiceException("无法操作已经开奖的数据！");
            }

            GameFiveballOpenData fiveballOpenData = gameFiveballOpenDataService.selectGameFiveballOpenDataByPeriods(vo.getGameId(), vo.getPeriods(), null);
            if(fiveballOpenData == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }
            List<String> openCode = sysAppService.getOpenData(vo.getGameType());
            fiveballOpenData.setPreNum1(Integer.parseInt(openCode.get(0)));
            fiveballOpenData.setPreNum2(Integer.parseInt(openCode.get(1)));
            fiveballOpenData.setPreNum3(Integer.parseInt(openCode.get(2)));
            fiveballOpenData.setPreNum4(Integer.parseInt(openCode.get(3)));
            fiveballOpenData.setPreNum5(Integer.parseInt(openCode.get(4)));
            row = gameFiveballOpenDataService.updateGameFiveballOpenData(fiveballOpenData);
        }else{
            GameTenballKj tenballKj = gameTenballKjService.selectGameTenballKjByPeriods(vo.getGameId(), vo.getPeriods());
            if(tenballKj == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }
            if(StringUtils.equals(tenballKj.getStatus(),"1")){
                throw new ServiceException("无法操作已经开奖的数据！");
            }

            GameTenballOpenData tenballOpenData = gameTenballOpenDataService.selectGameTenballOpenDataByPeriods(vo.getGameId(), vo.getPeriods(), null);
            if(tenballOpenData == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }
            List<String> openCode = sysAppService.getOpenData(vo.getGameType());
            tenballOpenData.setPreNum1(Integer.parseInt(openCode.get(0)));
            tenballOpenData.setPreNum2(Integer.parseInt(openCode.get(1)));
            tenballOpenData.setPreNum3(Integer.parseInt(openCode.get(2)));
            tenballOpenData.setPreNum4(Integer.parseInt(openCode.get(3)));
            tenballOpenData.setPreNum5(Integer.parseInt(openCode.get(4)));
            tenballOpenData.setPreNum6(Integer.parseInt(openCode.get(5)));
            tenballOpenData.setPreNum7(Integer.parseInt(openCode.get(6)));
            tenballOpenData.setPreNum8(Integer.parseInt(openCode.get(7)));
            tenballOpenData.setPreNum9(Integer.parseInt(openCode.get(8)));
            tenballOpenData.setPreNum10(Integer.parseInt(openCode.get(9)));
            row = gameTenballOpenDataService.updateGameTenballOpenData(tenballOpenData);
        }

        return row;
    }

    @Override
    public int editOpenCode(EditSystemBetCodeReqVO vo) {

        int row = 0;
        String[] newOpenCodeArg = vo.getNewOpenCode().split(",");
        if(StringUtils.equals(vo.getGameType(),"3")){
            if(newOpenCodeArg.length != 3){
                throw new ServiceException("开奖号码个数不正确。");
            }
            for(int i=0;i<newOpenCodeArg.length;i++){
                Integer code = Integer.parseInt(newOpenCodeArg[i]);
                if(Integer.parseInt(newOpenCodeArg[i]) >9 || Integer.parseInt(newOpenCodeArg[i])<0){
                    throw new ServiceException("号码错误：" + code);
                }
            }

            GameThreeballKj threeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(vo.getGameId(), vo.getPeriods());
            if(threeballKj == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }
            if(StringUtils.equals(threeballKj.getStatus(),"1")){
                throw new ServiceException("无法操作已经开奖的数据！");
            }

            GameThreeballOpenData threeballOpenData = gameThreeballOpenDataService.selectGameThreeballOpenDataByPeriods(vo.getGameId(), vo.getPeriods(), null);
            if(threeballOpenData == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }
            threeballOpenData.setPreSum1(Integer.parseInt(newOpenCodeArg[0]));
            threeballOpenData.setPreSum2(Integer.parseInt(newOpenCodeArg[1]));
            threeballOpenData.setPreSum3(Integer.parseInt(newOpenCodeArg[2]));
            row = gameThreeballOpenDataService.updateGameThreeballOpenData(threeballOpenData);
        }else if(StringUtils.equals(vo.getGameType(),"5")){
            if(newOpenCodeArg.length != 5){
                throw new ServiceException("开奖号码个数不正确。");
            }
            for(int i=0;i<newOpenCodeArg.length;i++){
                Integer code = Integer.parseInt(newOpenCodeArg[i]);
                if(Integer.parseInt(newOpenCodeArg[i]) >9 || Integer.parseInt(newOpenCodeArg[i])<0){
                    throw new ServiceException("号码错误：" + code);
                }
            }
            GameFiveballKj fiveballKj = gameFiveballKjService.selectGameFiveballKjByPeriods(vo.getGameId(), vo.getPeriods());
            if(fiveballKj == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }
            if(StringUtils.equals(fiveballKj.getStatus(),"1")){
                throw new ServiceException("无法操作已经开奖的数据！");
            }

            GameFiveballOpenData fiveballOpenData = gameFiveballOpenDataService.selectGameFiveballOpenDataByPeriods(vo.getGameId(), vo.getPeriods(), null);
            if(fiveballOpenData == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }
            fiveballOpenData.setPreNum1(Integer.parseInt(newOpenCodeArg[0]));
            fiveballOpenData.setPreNum2(Integer.parseInt(newOpenCodeArg[1]));
            fiveballOpenData.setPreNum3(Integer.parseInt(newOpenCodeArg[2]));
            fiveballOpenData.setPreNum4(Integer.parseInt(newOpenCodeArg[3]));
            fiveballOpenData.setPreNum5(Integer.parseInt(newOpenCodeArg[4]));
            row = gameFiveballOpenDataService.updateGameFiveballOpenData(fiveballOpenData);
        }else{
            if(newOpenCodeArg.length != 10){
                throw new ServiceException("开奖号码个数不正确。");
            }
            String beforeCode = "";
            for(int i=0;i<newOpenCodeArg.length;i++){
                if(StringUtils.equals(beforeCode,newOpenCodeArg[i])){
                    throw new ServiceException("号码错误,重复内容：" + beforeCode);
                }
                beforeCode = newOpenCodeArg[i];
                Integer code = Integer.parseInt(newOpenCodeArg[i]);
                if(Integer.parseInt(newOpenCodeArg[i]) >10 || Integer.parseInt(newOpenCodeArg[i])<=0){
                    throw new ServiceException("号码错误：" + code);
                }
            }
            GameTenballKj tenballKj = gameTenballKjService.selectGameTenballKjByPeriods(vo.getGameId(), vo.getPeriods());
            if(tenballKj == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }
            if(StringUtils.equals(tenballKj.getStatus(),"1")){
                throw new ServiceException("无法操作已经开奖的数据！");
            }

            GameTenballOpenData tenballOpenData = gameTenballOpenDataService.selectGameTenballOpenDataByPeriods(vo.getGameId(), vo.getPeriods(), null);
            if(tenballOpenData == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }
            tenballOpenData.setPreNum1(Integer.parseInt(newOpenCodeArg[0]));
            tenballOpenData.setPreNum2(Integer.parseInt(newOpenCodeArg[1]));
            tenballOpenData.setPreNum3(Integer.parseInt(newOpenCodeArg[2]));
            tenballOpenData.setPreNum4(Integer.parseInt(newOpenCodeArg[3]));
            tenballOpenData.setPreNum5(Integer.parseInt(newOpenCodeArg[4]));
            tenballOpenData.setPreNum6(Integer.parseInt(newOpenCodeArg[5]));
            tenballOpenData.setPreNum7(Integer.parseInt(newOpenCodeArg[6]));
            tenballOpenData.setPreNum8(Integer.parseInt(newOpenCodeArg[7]));
            tenballOpenData.setPreNum9(Integer.parseInt(newOpenCodeArg[8]));
            tenballOpenData.setPreNum10(Integer.parseInt(newOpenCodeArg[9]));
            row = gameTenballOpenDataService.updateGameTenballOpenData(tenballOpenData);
        }

        return row;
    }

    @Override
    public int sleepOpenCode(EditSystemBetCodeReqVO vo) {

        int row = 0;
        if(StringUtils.equals(vo.getGameType(),"3")){

            GameThreeballKj threeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(vo.getGameId(), vo.getPeriods());
            if(threeballKj == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }
            if(StringUtils.equals(threeballKj.getStatus(),"1")){
                throw new ServiceException("无法操作已经开奖的数据！");
            }

            GameThreeballOpenData threeballOpenData = gameThreeballOpenDataService.selectGameThreeballOpenDataByPeriods(vo.getGameId(), vo.getPeriods(), null);
            if(threeballOpenData == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(threeballOpenData.getPreTime());
            //预计开奖时间
            calendar.add(Calendar.SECOND, vo.getSleepSeconds());
            threeballOpenData.setPreTime(calendar.getTime());
            row = gameThreeballOpenDataService.updateGameThreeballOpenData(threeballOpenData);
        }else if(StringUtils.equals(vo.getGameType(),"5")){
            GameFiveballKj fiveballKj = gameFiveballKjService.selectGameFiveballKjByPeriods(vo.getGameId(), vo.getPeriods());
            if(fiveballKj == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }
            if(StringUtils.equals(fiveballKj.getStatus(),"1")){
                throw new ServiceException("无法操作已经开奖的数据！");
            }

            GameFiveballOpenData fiveballOpenData = gameFiveballOpenDataService.selectGameFiveballOpenDataByPeriods(vo.getGameId(), vo.getPeriods(), null);
            if(fiveballOpenData == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(fiveballOpenData.getPreTime());
            //预计开奖时间
            calendar.add(Calendar.SECOND, vo.getSleepSeconds());
            fiveballOpenData.setPreTime(calendar.getTime());
            row = gameFiveballOpenDataService.updateGameFiveballOpenData(fiveballOpenData);
        }else{
            GameTenballKj tenballKj = gameTenballKjService.selectGameTenballKjByPeriods(vo.getGameId(), vo.getPeriods());
            if(tenballKj == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }
            if(StringUtils.equals(tenballKj.getStatus(),"1")){
                throw new ServiceException("无法操作已经开奖的数据！");
            }

            GameTenballOpenData tenballOpenData = gameTenballOpenDataService.selectGameTenballOpenDataByPeriods(vo.getGameId(), vo.getPeriods(), null);
            if(tenballOpenData == null){
                throw new ServiceException("该期开奖记录被删除，请联系管理员！");
            }
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(tenballOpenData.getPreTime());
            //预计开奖时间
            calendar.add(Calendar.SECOND, vo.getSleepSeconds());
            tenballOpenData.setPreTime(calendar.getTime());
            row = gameTenballOpenDataService.updateGameTenballOpenData(tenballOpenData);
        }
        return row;
    }

    @Override
    public LastNoOpenRecordRespVo getLastNoOpenRecord(BetkjReqVO vo) {

        SysGame gameInfo = gameService.selectSysGameByGameId(vo.getGameId());
        String kjTable = "";
        String openCodeTable = "";
        if(StringUtils.equals(gameInfo.getGameType(),"3")){
            kjTable = "game_threeball_kj";
            openCodeTable = "game_threeball_open_data";
        }else if(StringUtils.equals(gameInfo.getGameType(),"5")){
            kjTable = "game_fiveball_kj";
            openCodeTable = "game_fiveball_open_data";
        }else{
            kjTable = "game_tenball_kj";
            openCodeTable = "game_tenball_open_data";
        }
        LastNoOpenRecordRespVo respVo = new LastNoOpenRecordRespVo();
        List<BetkjRespVo> betkjRespVoList = betkjMapper.selectBetkjList(gameInfo.getGameId(), kjTable, openCodeTable,gameInfo.getGameType(), null, "0");
        Date date = new Date();
        if(betkjRespVoList != null && betkjRespVoList.size() > 0){
            BetkjRespVo lastBetkjRespVo = betkjRespVoList.get(betkjRespVoList.size()-1);
            respVo.setPeriods(lastBetkjRespVo.getPeriods());
            Long preTime = lastBetkjRespVo.getBetOpenTime().getTime() - date.getTime();
            respVo.setBetTime(preTime/ 1000L);
        }else{
            respVo.setPeriods(0l);
            respVo.setBetTime(0l);
        }
        return respVo;
    }

    @Override
    public void autoDeleteOldRobotBet() {
        betkjMapper.deleteAllOldRobotBet();
    }
}
