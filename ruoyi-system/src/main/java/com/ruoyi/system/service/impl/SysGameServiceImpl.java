package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.vo.GameOpenDataDto;
import com.ruoyi.system.mapper.*;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.alibaba.fastjson2.JSONArray;

/**
 * 游戏Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-06
 */
@Service
public class SysGameServiceImpl implements ISysGameService 
{
    @Autowired
    private SysGameMapper sysGameMapper;

    @Autowired
    private SysBetTypeMapper sysBetTypeMapper;

    @Autowired
    private SysBetItemMapper sysBetItemMapper;

    @Autowired
    private GameOptionMapper gameOptionMapper;

    @Autowired
    private GameThreeballMixedOddsMapper gameThreeballMixedOddsMapper;

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
    private IBetkjService betkjService;

    @Autowired
    private IThreeBallLotteryService threeBallLotteryService;

    @Autowired
    private IFiveBallLotteryService fiveBallLotteryService;

    @Autowired
    private ITenBallLotteryService tenBallLotteryService;

    @Autowired
    private ISysConfigService configService;

    /**
     * 查询游戏
     * 
     * @param gameId 游戏主键
     * @return 游戏
     */
    @Override
    public SysGame selectSysGameByGameId(Long gameId)
    {
        return sysGameMapper.selectSysGameByGameId(gameId);
    }

    /**
     * 查询游戏列表
     * 
     * @param sysGame 游戏
     * @return 游戏
     */
    @Override
    public List<SysGame> selectSysGameList(SysGame sysGame)
    {
        return sysGameMapper.selectSysGameList(sysGame);
    }

    /**
     * 新增游戏
     * 
     * @param sysGame 游戏
     * @return 结果
     */
    @Override
    public int insertSysGame(SysGame sysGame)
    {
        sysGame.setCreateTime(DateUtils.getNowDate());
        if(StringUtils.equals(sysGame.getGameType(),"3")){
            sysGame.setGameRecord("game_threeball_record");
            sysGame.setGameKj("game_threeball_kj");
        }else if(StringUtils.equals(sysGame.getGameType(),"5")){
            sysGame.setGameRecord("game_fiveball_record");
            sysGame.setGameKj("game_fiveball_kj");
        }else if(StringUtils.equals(sysGame.getGameType(),"10")){
            sysGame.setGameRecord("game_tenball_record");
            sysGame.setGameKj("game_tenball_kj");
        }else if(StringUtils.equals(sysGame.getGameType(),"zfb")){
            sysGame.setGameRecord("game_zfb_record");
            sysGame.setGameKj("game_zfb_kj");
        }
        int row = sysGameMapper.insertSysGame(sysGame);

        SysBetType searchBetType = new SysBetType();
        searchBetType.setGameId(sysGame.getGameId());
        List<SysBetType> betTypeList = sysBetTypeMapper.selectSysBetTypeList(searchBetType);
        if(betTypeList.size() == 0){
            if(StringUtils.equals(sysGame.getGameType(),"3")){
                insertDefaultThreeballBetTypeAndItem(sysGame);
            }else if(StringUtils.equals(sysGame.getGameType(),"5")){
                insertDefaultFiveballBetTypeAndItem(sysGame);
            }else if(StringUtils.equals(sysGame.getGameType(),"10")){
                insertDefaultTenballBetTypeAndItem(sysGame);
            }else if(StringUtils.equals(sysGame.getGameType(),"zfb")){
                insertDefaultZfbBetTypeAndItem(sysGame);
            }
        }

        if(StringUtils.equals(sysGame.getGameType(),"3")) {
            insertDefaultThreeballMixedOdds(sysGame);
        }

        return row;
    }

    /**
     * 修改游戏
     *
     * @param sysGame 游戏
     * @return 结果
     */
    @Override
    public int updateSysGame(SysGame sysGame)
    {
        sysGame.setUpdateTime(DateUtils.getNowDate());
        if(StringUtils.equals(sysGame.getGameType(),"3")){
            sysGame.setGameRecord("game_threeball_record");
            sysGame.setGameKj("game_threeball_kj");
        }else if(StringUtils.equals(sysGame.getGameType(),"5")){
            sysGame.setGameRecord("game_fiveball_record");
            sysGame.setGameKj("game_fiveball_kj");
        }else if(StringUtils.equals(sysGame.getGameType(),"10")){
            sysGame.setGameRecord("game_tenball_record");
            sysGame.setGameKj("game_tenball_kj");
        }else if(StringUtils.equals(sysGame.getGameType(),"zfb")){
            sysGame.setGameRecord("game_zfb_record");
            sysGame.setGameKj("game_zfb_kj");
        }
        SysGame oldSysGame = selectSysGameByGameId(sysGame.getGameId());
        int row = sysGameMapper.updateSysGame(sysGame);

        SysBetType searchBetType = new SysBetType();
        searchBetType.setGameId(sysGame.getGameId());
        List<SysBetType> betTypeList = sysBetTypeMapper.selectSysBetTypeList(searchBetType);
        if(betTypeList.size() == 0){
            if(StringUtils.equals(sysGame.getGameType(),"3")){
                insertDefaultThreeballMixedOdds(sysGame);
                insertDefaultThreeballBetTypeAndItem(sysGame);
            }else if(StringUtils.equals(sysGame.getGameType(),"5")){
                insertDefaultFiveballBetTypeAndItem(sysGame);
            }else if(StringUtils.equals(sysGame.getGameType(),"10")){
                insertDefaultTenballBetTypeAndItem(sysGame);
            }else if(StringUtils.equals(sysGame.getGameType(),"zfb")){
                insertDefaultZfbBetTypeAndItem(sysGame);
            }
        }

        // 开奖区分变化
        if(!StringUtils.equals(sysGame.getSystemOpenType(),oldSysGame.getSystemOpenType())){
            if(StringUtils.equals(sysGame.getGameType(),"3")){
                updateThreeballKjAndCodeTable(sysGame);
            }else if(StringUtils.equals(sysGame.getGameType(),"5")){
                updateFiveballKjAndCodeTable(sysGame);
            }else if(StringUtils.equals(sysGame.getGameType(),"10")){
                updateTenballKjAndCodeTable(sysGame);
            }
        }

        if(StringUtils.equals(sysGame.getGameType(),"3")) {
            insertDefaultThreeballMixedOdds(sysGame);
        }

        return row;
    }

    //重新获取3球开奖数据
    public void updateThreeballKjAndCodeTable(SysGame sysGame){
        //系统开奖 -> 官方开奖
        if(StringUtils.equals(sysGame.getSystemOpenType(),"N")){
            //删除系统开奖自动生成的未开奖数据
            GameThreeballOpenData lastOpenRecord = gameThreeballOpenDataService.selectLastRecord(sysGame.getGameId());
            gameThreeballOpenDataService.deleteGameThreeballOpenDataById(lastOpenRecord.getId());

            GameThreeballOpenData searchGameThreeballOpenData = new GameThreeballOpenData();
            searchGameThreeballOpenData.setGameId(sysGame.getGameId());
            searchGameThreeballOpenData.setStatus("1");//系统预开奖
            List<GameThreeballOpenData> gameThreeballOpenDataList = gameThreeballOpenDataService.selectGameThreeballOpenDataList(searchGameThreeballOpenData);
            for(GameThreeballOpenData threeballOpenData : gameThreeballOpenDataList){
                gameThreeballOpenDataService.deleteGameThreeballOpenDataById(threeballOpenData.getId());
            }

            GameThreeballKj searchGameThreeballKj = new GameThreeballKj();
            searchGameThreeballKj.setGameId(sysGame.getGameId());
            searchGameThreeballKj.setStatus("0"); //未开奖
            List<GameThreeballKj> gameThreeballKjList = gameThreeballKjService.selectGameThreeballKjList(searchGameThreeballKj);
            for(GameThreeballKj gameThreeballKj : gameThreeballKjList){
                gameThreeballKjService.deleteGameThreeballKjById(gameThreeballKj.getId());
            }

            //重新获取一次开奖数据
            String url = configService.selectConfigByKey("sys.opengame.url") + sysGame.getGameOpenCode() + "&limit=50";
            String result = HttpUtils.sendGet(url);
            JSONObject resultJson = JSONObject.parseObject(result);

            if(!(resultJson == null)){
                String data = resultJson.getString("data");
                if(!StringUtils.isEmpty(data)){
                    List<GameOpenDataDto> openDataList = JSONArray.parseArray(data.toString(),GameOpenDataDto.class);
                    Map<Long , GameOpenDataDto> gameOpenDataDtoMap = openDataList.stream()
                            .collect(Collectors.toMap(
                                    GameOpenDataDto::getExpect,
                                    Function.identity(),
                                    (existing, replacement) -> existing // 保留现有的值，忽略替换值
                            ));

                    if(openDataList != null && openDataList.size() >0){
                        betkjService.saveThreeBallInfoFromOfficial(sysGame.getGameMarkId(),openDataList,gameOpenDataDtoMap);
                    }
                }
            }

            //重新获取一次未开奖数据
            threeBallLotteryService.createThreeData(sysGame);
        }else{
        //官方开奖 -> 系统开奖
            //删除系统开奖自动生成的未开奖数据
            GameThreeballOpenData searchGameThreeballOpenData = new GameThreeballOpenData();
            searchGameThreeballOpenData.setGameId(sysGame.getGameId());
            searchGameThreeballOpenData.setStatus("1");//系统预开奖
            List<GameThreeballOpenData> gameThreeballOpenDataList = gameThreeballOpenDataService.selectGameThreeballOpenDataList(searchGameThreeballOpenData);
            for(GameThreeballOpenData threeballOpenData : gameThreeballOpenDataList){
                gameThreeballOpenDataService.deleteGameThreeballOpenDataById(threeballOpenData.getId());
            }

            GameThreeballKj searchGameThreeballKj = new GameThreeballKj();
            searchGameThreeballKj.setGameId(sysGame.getGameId());
            searchGameThreeballKj.setStatus("0"); //未开奖
            List<GameThreeballKj> gameThreeballKjList = gameThreeballKjService.selectGameThreeballKjList(searchGameThreeballKj);
            for(GameThreeballKj gameThreeballKj : gameThreeballKjList){
                gameThreeballKjService.deleteGameThreeballKjById(gameThreeballKj.getId());
            }

            //重新获取一次未开奖数据
            betkjService.openThreeBallSystemExpectData(sysGame);
            threeBallLotteryService.createThreeData(sysGame);

        }
    }

    //重新获取5球开奖数据
    public void updateFiveballKjAndCodeTable(SysGame sysGame){
        //系统开奖 -> 官方开奖
        if(StringUtils.equals(sysGame.getSystemOpenType(),"N")){
            //删除系统开奖自动生成的未开奖数据
            GameFiveballOpenData searchGameFiveballOpenData = new GameFiveballOpenData();
            searchGameFiveballOpenData.setGameId(sysGame.getGameId());
            searchGameFiveballOpenData.setStatus("1");//系统预开奖
            List<GameFiveballOpenData> gameFiveballOpenDataList = gameFiveballOpenDataService.selectGameFiveballOpenDataList(searchGameFiveballOpenData);
            for(GameFiveballOpenData fiveballOpenData : gameFiveballOpenDataList){
                gameFiveballOpenDataService.deleteGameFiveballOpenDataById(fiveballOpenData.getId());
            }

            GameFiveballKj searchGameFiveballKj = new GameFiveballKj();
            searchGameFiveballKj.setGameId(sysGame.getGameId());
            searchGameFiveballKj.setStatus("0"); //未开奖
            List<GameFiveballKj> gameFiveballKjList = gameFiveballKjService.selectGameFiveballKjList(searchGameFiveballKj);
            for(GameFiveballKj gameFiveballKj : gameFiveballKjList){
                gameFiveballKjService.deleteGameFiveballKjById(gameFiveballKj.getId());
            }

            //重新获取一次开奖数据
            String url = configService.selectConfigByKey("sys.opengame.url") + sysGame.getGameOpenCode() + "&limit=50";
            String result = HttpUtils.sendGet(url);
            JSONObject resultJson = JSONObject.parseObject(result);

            if(!(resultJson == null)){
                String data = resultJson.getString("data");
                if(!StringUtils.isEmpty(data)){
                    List<GameOpenDataDto> openDataList = JSONArray.parseArray(data.toString(),GameOpenDataDto.class);
                    Map<Long , GameOpenDataDto> gameOpenDataDtoMap = openDataList.stream()
                            .collect(Collectors.toMap(
                                    GameOpenDataDto::getExpect,
                                    Function.identity(),
                                    (existing, replacement) -> existing // 保留现有的值，忽略替换值
                            ));

                    if(openDataList != null && openDataList.size() >0){
                        betkjService.saveFiveBallInfoFromOfficial(sysGame.getGameMarkId(),openDataList,gameOpenDataDtoMap);
                    }
                }
            }
            //重新获取一次未开奖数据
            fiveBallLotteryService.createFiveBallData(sysGame);
        }else{
            //官方开奖 -> 系统开奖
            //删除系统开奖自动生成的未开奖数据
            GameFiveballOpenData searchGameFiveballOpenData = new GameFiveballOpenData();
            searchGameFiveballOpenData.setGameId(sysGame.getGameId());
            searchGameFiveballOpenData.setStatus("1");//系统预开奖
            List<GameFiveballOpenData> gameFiveballOpenDataList = gameFiveballOpenDataService.selectGameFiveballOpenDataList(searchGameFiveballOpenData);
            for(GameFiveballOpenData fiveballOpenData : gameFiveballOpenDataList){
                gameFiveballOpenDataService.deleteGameFiveballOpenDataById(fiveballOpenData.getId());
            }

            GameFiveballKj searchGameFiveballKj = new GameFiveballKj();
            searchGameFiveballKj.setGameId(sysGame.getGameId());
            searchGameFiveballKj.setStatus("0"); //未开奖
            List<GameFiveballKj> gameFiveballKjList = gameFiveballKjService.selectGameFiveballKjList(searchGameFiveballKj);
            for(GameFiveballKj gameFiveballKj : gameFiveballKjList){
                gameFiveballKjService.deleteGameFiveballKjById(gameFiveballKj.getId());
            }

            //重新获取一次未开奖数据
            betkjService.openFiveBallSystemExpectData(sysGame);
            fiveBallLotteryService.createFiveBallData(sysGame);

        }
    }

    //重新获取10球开奖数据
    public void updateTenballKjAndCodeTable(SysGame sysGame){
        //系统开奖 -> 官方开奖
        if(StringUtils.equals(sysGame.getSystemOpenType(),"N")){
            //删除系统开奖自动生成的未开奖数据
            GameTenballOpenData searchGameTenballOpenData = new GameTenballOpenData();
            searchGameTenballOpenData.setGameId(sysGame.getGameId());
            searchGameTenballOpenData.setStatus("1");//系统预开奖
            List<GameTenballOpenData> gameTenballOpenDataList = gameTenballOpenDataService.selectGameTenballOpenDataList(searchGameTenballOpenData);
            for(GameTenballOpenData tenballOpenData : gameTenballOpenDataList){
                gameTenballOpenDataService.deleteGameTenballOpenDataById(tenballOpenData.getId());
            }

            GameTenballKj searchGameTenballKj = new GameTenballKj();
            searchGameTenballKj.setGameId(sysGame.getGameId());
            searchGameTenballKj.setStatus("0"); //未开奖
            List<GameTenballKj> gameTenballKjList = gameTenballKjService.selectGameTenballKjList(searchGameTenballKj);
            for(GameTenballKj gameTenballKj : gameTenballKjList){
                gameTenballKjService.deleteGameTenballKjById(gameTenballKj.getId());
            }

            //重新获取一次开奖数据
            String url = configService.selectConfigByKey("sys.opengame.url") + sysGame.getGameOpenCode() + "&limit=50";
            String result = HttpUtils.sendGet(url);
            JSONObject resultJson = JSONObject.parseObject(result);

            if(!(resultJson == null)){
                String data = resultJson.getString("data");
                if(!StringUtils.isEmpty(data)){
                    List<GameOpenDataDto> openDataList = JSONArray.parseArray(data.toString(),GameOpenDataDto.class);
                    Map<Long , GameOpenDataDto> gameOpenDataDtoMap = openDataList.stream()
                            .collect(Collectors.toMap(
                                    GameOpenDataDto::getExpect,
                                    Function.identity(),
                                    (existing, replacement) -> existing // 保留现有的值，忽略替换值
                            ));

                    if(openDataList != null && openDataList.size() >0){
                        betkjService.saveTenBallInfoFromOfficial(sysGame.getGameMarkId(),openDataList,gameOpenDataDtoMap);
                    }
                }
            }

            //重新获取一次未开奖数据
            tenBallLotteryService.createTenballData(sysGame);
        }else{
            //官方开奖 -> 系统开奖
            //删除系统开奖自动生成的未开奖数据
            GameTenballOpenData searchGameTenballOpenData = new GameTenballOpenData();
            searchGameTenballOpenData.setGameId(sysGame.getGameId());
            searchGameTenballOpenData.setStatus("1");//系统预开奖
            List<GameTenballOpenData> gameTenballOpenDataList = gameTenballOpenDataService.selectGameTenballOpenDataList(searchGameTenballOpenData);
            for(GameTenballOpenData tenballOpenData : gameTenballOpenDataList){
                gameTenballOpenDataService.deleteGameTenballOpenDataById(tenballOpenData.getId());
            }

            GameTenballKj searchGameTenballKj = new GameTenballKj();
            searchGameTenballKj.setGameId(sysGame.getGameId());
            searchGameTenballKj.setStatus("0"); //未开奖
            List<GameTenballKj> gameTenballKjList = gameTenballKjService.selectGameTenballKjList(searchGameTenballKj);
            for(GameTenballKj gameTenballKj : gameTenballKjList){
                gameTenballKjService.deleteGameTenballKjById(gameTenballKj.getId());
            }

            //重新获取一次未开奖数据
            betkjService.openTenBallSystemExpectData(sysGame);
            tenBallLotteryService.createTenballData(sysGame);
        }
    }

    // 新增3球特殊赔率设置
    public void insertDefaultThreeballMixedOdds(SysGame sysGame){
        GameThreeballMixedOdds searchGameThreeballMixedOdds = new GameThreeballMixedOdds();
        searchGameThreeballMixedOdds.setGameId(sysGame.getGameId());

        GameThreeballMixedOdds threeballMixedOdds = gameThreeballMixedOddsMapper.selectGameThreeballMixedOddsByGameId(searchGameThreeballMixedOdds);
        if(threeballMixedOdds == null){
            threeballMixedOdds = new GameThreeballMixedOdds();
            threeballMixedOdds.setGameId(sysGame.getGameId());
            threeballMixedOdds.setNumberMinQuota(0f);
            threeballMixedOdds.setNumberMaxQuota(0f);
            threeballMixedOdds.setLessNumberOdd(100f);
            threeballMixedOdds.setCenterNumberOdd(100f);
            threeballMixedOdds.setGreaterNumberOdd(100f);
            threeballMixedOdds.setSdbMinQuota(0f);
            threeballMixedOdds.setSdbMaxQuota(0f);
            threeballMixedOdds.setLessSdbOdd(100f);
            threeballMixedOdds.setCenterSdbOdd(100f);
            threeballMixedOdds.setGreaterSdbOdd(100f);
            threeballMixedOdds.setZeroNineMinQuota(0f);
            threeballMixedOdds.setZeroNineMaxQuota(0f);
            threeballMixedOdds.setLessZeroNineOdd(100f);
            threeballMixedOdds.setCenterZeroNineOdd(100f);
            threeballMixedOdds.setGreaterZeroNineOdd(100f);
            gameThreeballMixedOddsMapper.insertGameThreeballMixedOdds(threeballMixedOdds);
        }
    }

    public void insertDefaultThreeballBetTypeAndItem(SysGame sysGame){
        List<String> defaultThreeballBetTypeNameList = Arrays.asList("大小单双", "猜数字", "特殊玩法");
        List<SysBetType> defaultThreeballBetType = new ArrayList<>();
        Integer sort = 1;
        for(String defaultThreeballBetTypeName : defaultThreeballBetTypeNameList){
            SysBetType newSysBetType = new SysBetType();
            newSysBetType.setGameId(sysGame.getGameId());
            newSysBetType.setBetTypeName(defaultThreeballBetTypeName);
            newSysBetType.setStatus("0");
            newSysBetType.setSort(sort);

            sysBetTypeMapper.insertSysBetType(newSysBetType);
            defaultThreeballBetType.add(newSysBetType);

            sort++;
        }

        SysBetItem searchBetItem = new SysBetItem();
        searchBetItem.setGameId(sysGame.getGameId());
        List<SysBetItem> betItemList = sysBetItemMapper.selectSysBetItemList(searchBetItem);
        if(betItemList.size() == 0){
            String defaultBetItemJsonArrayString = "[" +
                        "[" +
                            "{\"betItemCode\":\"big\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"small\", \"betItemName\":\"小\"}," +
                            "{\"betItemCode\":\"single\", \"betItemName\":\"单\"}," +
                            "{\"betItemCode\":\"doubleFlg\", \"betItemName\":\"双\"}," +
                            "{\"betItemCode\":\"muchbig\", \"betItemName\":\"极大\"}," +
                            "{\"betItemCode\":\"bigsingle\", \"betItemName\":\"大单\"}," +
                            "{\"betItemCode\":\"smallsingle\", \"betItemName\":\"小单\"}," +
                            "{\"betItemCode\":\"bigdouble\", \"betItemName\":\"大双\"}," +
                            "{\"betItemCode\":\"smalldouble\", \"betItemName\":\"小双\"}," +
                            "{\"betItemCode\":\"muchsmall\", \"betItemName\":\"极小\"}" +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"num0\", \"betItemName\":\"0\"}, " +
                            "{\"betItemCode\":\"num1\", \"betItemName\":\"1\"}," +
                            "{\"betItemCode\":\"num2\", \"betItemName\":\"2\"}," +
                            "{\"betItemCode\":\"num3\", \"betItemName\":\"3\"}," +
                            "{\"betItemCode\":\"num4\", \"betItemName\":\"4\"}," +
                            "{\"betItemCode\":\"num5\", \"betItemName\":\"5\"}," +
                            "{\"betItemCode\":\"num6\", \"betItemName\":\"6\"}," +
                            "{\"betItemCode\":\"num7\", \"betItemName\":\"7\"}," +
                            "{\"betItemCode\":\"num8\", \"betItemName\":\"8\"}," +
                            "{\"betItemCode\":\"num9\", \"betItemName\":\"9\"}," +
                            "{\"betItemCode\":\"num10\", \"betItemName\":\"10\"}, " +
                            "{\"betItemCode\":\"num11\", \"betItemName\":\"11\"}," +
                            "{\"betItemCode\":\"num12\", \"betItemName\":\"12\"}," +
                            "{\"betItemCode\":\"num13\", \"betItemName\":\"13\"}," +
                            "{\"betItemCode\":\"num14\", \"betItemName\":\"14\"}," +
                            "{\"betItemCode\":\"num15\", \"betItemName\":\"15\"}," +
                            "{\"betItemCode\":\"num16\", \"betItemName\":\"16\"}," +
                            "{\"betItemCode\":\"num17\", \"betItemName\":\"17\"}," +
                            "{\"betItemCode\":\"num18\", \"betItemName\":\"18\"}," +
                            "{\"betItemCode\":\"num19\", \"betItemName\":\"19\"}," +
                            "{\"betItemCode\":\"num20\", \"betItemName\":\"20\"}," +
                            "{\"betItemCode\":\"num21\", \"betItemName\":\"21\"}," +
                            "{\"betItemCode\":\"num22\", \"betItemName\":\"22\"}," +
                            "{\"betItemCode\":\"num23\", \"betItemName\":\"23\"}," +
                            "{\"betItemCode\":\"num24\", \"betItemName\":\"24\"}," +
                            "{\"betItemCode\":\"num25\", \"betItemName\":\"25\"}," +
                            "{\"betItemCode\":\"num26\", \"betItemName\":\"26\"}," +
                            "{\"betItemCode\":\"num27\", \"betItemName\":\"27\"}" +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"red\", \"betItemName\":\"红\"}, " +
                            "{\"betItemCode\":\"green\", \"betItemName\":\"绿\"}, " +
                            "{\"betItemCode\":\"blue\", \"betItemName\":\"蓝\"}, " +
                            "{\"betItemCode\":\"loong\", \"betItemName\":\"龙\"}, " +
                            "{\"betItemCode\":\"tiger\", \"betItemName\":\"虎\"}, " +
                            "{\"betItemCode\":\"close\", \"betItemName\":\"合\"}, " +
                            "{\"betItemCode\":\"leopard\", \"betItemName\":\"豹子\"}, " +
                            "{\"betItemCode\":\"pairs\", \"betItemName\":\"对子\"}, " +
                            "{\"betItemCode\":\"shun\", \"betItemName\":\"顺子\"} " +
                        "]" +
                    "]";

            // 将字符串转换为外层的JSONArray对象
            JSONArray defaultBetItemJsonArray = new JSONArray(defaultBetItemJsonArrayString);

            JSONArray outerArray = defaultBetItemJsonArray.getJSONArray(0);

            // 遍历外层的JSONArray
            for (int i = 0; i < outerArray.size(); i++) {
                // 获取每个元素，它本身也是一个JSONArray
                JSONArray innerArray = outerArray.getJSONArray(i);
                SysBetType betTypeInfo = defaultThreeballBetType.get(i);

                sort = 1;

                // 遍历内层的JSONArray
                for (int j = 0; j < innerArray.size(); j++) {
                    // 获取每个元素的JSONObject
                    JSONObject jsonObject = innerArray.getJSONObject(j);

                    // 获取JSON对象中的数据
                    String betItemCode = jsonObject.getString("betItemCode");
                    String betItemName = jsonObject.getString("betItemName");

                    SysBetItem newSysBetItem = new SysBetItem();
                    newSysBetItem.setGameId(sysGame.getGameId());
                    newSysBetItem.setBetItemType(betTypeInfo.getBetTypeId());
                    newSysBetItem.setBetItemCode(betItemCode);
                    newSysBetItem.setBetItemName(betItemName);
                    newSysBetItem.setOdd(2f);
                    newSysBetItem.setMinBetAmount(2f);
                    newSysBetItem.setMaxBetAmount(9999f);
                    newSysBetItem.setSort(sort);
                    newSysBetItem.setStatus("0");

                    sysBetItemMapper.insertSysBetItem(newSysBetItem);
                    sort++;
                }
            }
        }

        GameOption searchGameOption = new GameOption();
        searchGameOption.setGameId(sysGame.getGameId());
        List<GameOption> gameOptionList = gameOptionMapper.selectGameOptionList(searchGameOption);
        if(gameOptionList.size() == 0){

            String defaultGameOptionJsonArrayString = "[" +
                        "{\"key\":\"num0\", \"title\":\"0\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num1\", \"title\":\"1\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num2\", \"title\":\"2\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num3\", \"title\":\"3\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num4\", \"title\":\"4\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num5\", \"title\":\"5\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num6\", \"title\":\"6\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num7\", \"title\":\"7\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num8\", \"title\":\"8\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num9\", \"title\":\"9\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num10\", \"title\":\"10\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num11\", \"title\":\"11\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num12\", \"title\":\"12\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num13\", \"title\":\"13\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num14\", \"title\":\"14\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num15\", \"title\":\"15\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num16\", \"title\":\"16\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num17\", \"title\":\"17\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num18\", \"title\":\"18\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num19\", \"title\":\"19\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num20\", \"title\":\"20\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num21\", \"title\":\"21\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num22\", \"title\":\"22\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num23\", \"title\":\"23\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num24\", \"title\":\"24\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num25\", \"title\":\"25\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num26\", \"title\":\"26\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"num27\", \"title\":\"27\", \"playGroup\":\"1\", \"playGroupTitle\":\"猜数字\"}, " +
                        "{\"key\":\"single\", \"title\":\"单\", \"playGroup\":\"2\", \"playGroupTitle\":\"大小单双\"}, " +
                        "{\"key\":\"doubleAmount\", \"title\":\"双\", \"playGroup\":\"2\", \"playGroupTitle\":\"大小单双\"}, " +
                        "{\"key\":\"big\", \"title\":\"大\", \"playGroup\":\"2\", \"playGroupTitle\":\"大小单双\"}, " +
                        "{\"key\":\"small\", \"title\":\"小\", \"playGroup\":\"2\", \"playGroupTitle\":\"大小单双\"}, " +
                        "{\"key\":\"muchBig\", \"title\":\"极大\", \"playGroup\":\"3\", \"playGroupTitle\":\"极值\"}, " +
                        "{\"key\":\"muchSmall\", \"title\":\"极小\", \"playGroup\":\"3\", \"playGroupTitle\":\"极值\"}, " +
                        "{\"key\":\"bigSingle\", \"title\":\"大单\", \"playGroup\":\"4\", \"playGroupTitle\":\"混合\"}, " +
                        "{\"key\":\"bigDouble\", \"title\":\"大双\", \"playGroup\":\"4\", \"playGroupTitle\":\"混合\"}, " +
                        "{\"key\":\"smallSingle\", \"title\":\"小单\", \"playGroup\":\"4\", \"playGroupTitle\":\"混合\"}, " +
                        "{\"key\":\"smallDouble\", \"title\":\"小双\", \"playGroup\":\"4\", \"playGroupTitle\":\"混合\"}, " +
                        "{\"key\":\"red\", \"title\":\"红\", \"playGroup\":\"5\", \"playGroupTitle\":\"波色\"}, " +
                        "{\"key\":\"green\", \"title\":\"绿\", \"playGroup\":\"5\", \"playGroupTitle\":\"波色\"}, " +
                        "{\"key\":\"blue\", \"title\":\"蓝\", \"playGroup\":\"5\", \"playGroupTitle\":\"波色\"}, " +
                        "{\"key\":\"leopard\", \"title\":\"豹子\", \"playGroup\":\"6\", \"playGroupTitle\":\"特殊玩法\"}, " +
                        "{\"key\":\"loong\", \"title\":\"龙\", \"playGroup\":\"8\", \"playGroupTitle\":\"龙虎合\"}, " +
                        "{\"key\":\"tiger\", \"title\":\"虎\", \"playGroup\":\"8\", \"playGroupTitle\":\"龙虎合\"}, " +
                        "{\"key\":\"Close\", \"title\":\"合\", \"playGroup\":\"8\", \"playGroupTitle\":\"龙虎合\"}, " +
                        "{\"key\":\"pairs\", \"title\":\"对子\", \"playGroup\":\"6\", \"playGroupTitle\":\"特殊玩法\"}, " +
                        "{\"key\":\"shun\", \"title\":\"顺子\", \"playGroup\":\"6\", \"playGroupTitle\":\"特殊玩法\"} " +
                    "]";

            // 将字符串转换为外层的JSONArray对象
            JSONArray defaultGameOptionJsonArray = new JSONArray(defaultGameOptionJsonArrayString);

            JSONArray outerArray = defaultGameOptionJsonArray.getJSONArray(0);

            // 遍历外层的JSONArray
            for (int i = 0; i < outerArray.size(); i++) {
                // 获取每个元素，它本身也是一个JSONArray
                JSONObject jsonObject = outerArray.getJSONObject(i);
                // 获取JSON对象中的数据
                String key = jsonObject.getString("key");
                String title = jsonObject.getString("title");
                String playGroup = jsonObject.getString("playGroup");
                String playGroupTitle = jsonObject.getString("playGroupTitle");

                GameOption newGameOption = new GameOption();
                newGameOption.setGameId(sysGame.getGameId());
                newGameOption.setKey(key);
                newGameOption.setTitle(title);
                newGameOption.setPlayGroup(Integer.getInteger(playGroup));
                newGameOption.setPlayGroupTitle(playGroupTitle);

                gameOptionMapper.insertGameOption(newGameOption);
            }
        }
    }

    public void insertDefaultFiveballBetTypeAndItem(SysGame sysGame){

        List<String> defaultThreeballBetTypeNameList = Arrays.asList("和值", "球1", "球2", "球3", "球4", "球5", "前三", "中三", "后三");
        List<SysBetType> defaultThreeballBetType = new ArrayList<>();
        Integer sort = 1;
        for(String defaultThreeballBetTypeName : defaultThreeballBetTypeNameList){
            SysBetType newSysBetType = new SysBetType();
            newSysBetType.setGameId(sysGame.getGameId());
            newSysBetType.setBetTypeName(defaultThreeballBetTypeName);
            newSysBetType.setStatus("0");
            newSysBetType.setSort(sort);

            sysBetTypeMapper.insertSysBetType(newSysBetType);
            defaultThreeballBetType.add(newSysBetType);

            sort++;
        }

        SysBetItem searchBetItem = new SysBetItem();
        searchBetItem.setGameId(sysGame.getGameId());
        List<SysBetItem> betItemList = sysBetItemMapper.selectSysBetItemList(searchBetItem);
        if(betItemList.size() == 0){
            String defaultBetItemJsonArrayString = "[" +
                        "[" +
                            "{\"betItemCode\":\"sumBig\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"sumSmall\", \"betItemName\":\"小\"}, " +
                            "{\"betItemCode\":\"sumSingle\", \"betItemName\":\"单\"}, " +
                            "{\"betItemCode\":\"sumDouble\", \"betItemName\":\"双\"}, " +
                            "{\"betItemCode\":\"sumLoong\", \"betItemName\":\"龙\"}, " +
                            "{\"betItemCode\":\"sumTiger\", \"betItemName\":\"虎\"}, " +
                            "{\"betItemCode\":\"sumSum\", \"betItemName\":\"和\"}" +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"num1Big\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"num1Small\", \"betItemName\":\"小\"}, " +
                            "{\"betItemCode\":\"num1Single\", \"betItemName\":\"单\"}, " +
                            "{\"betItemCode\":\"num1Double\", \"betItemName\":\"双\"}, " +
                            "{\"betItemCode\":\"num1Under0\", \"betItemName\":\"0\"}, " +
                            "{\"betItemCode\":\"num1Under1\", \"betItemName\":\"1\"}, " +
                            "{\"betItemCode\":\"num1Under2\", \"betItemName\":\"2\"}, " +
                            "{\"betItemCode\":\"num1Under3\", \"betItemName\":\"3\"}, " +
                            "{\"betItemCode\":\"num1Under4\", \"betItemName\":\"4\"}, " +
                            "{\"betItemCode\":\"num1Under5\", \"betItemName\":\"5\"}, " +
                            "{\"betItemCode\":\"num1Under6\", \"betItemName\":\"6\"}, " +
                            "{\"betItemCode\":\"num1Under7\", \"betItemName\":\"7\"}, " +
                            "{\"betItemCode\":\"num1Under8\", \"betItemName\":\"8\"}, " +
                            "{\"betItemCode\":\"num1Under9\", \"betItemName\":\"9\"}" +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"num2Under0\", \"betItemName\":\"0\"}, " +
                            "{\"betItemCode\":\"num2Under1\", \"betItemName\":\"1\"}, " +
                            "{\"betItemCode\":\"num2Under2\", \"betItemName\":\"2\"}, " +
                            "{\"betItemCode\":\"num2Under3\", \"betItemName\":\"3\"}, " +
                            "{\"betItemCode\":\"num2Under4\", \"betItemName\":\"4\"}, " +
                            "{\"betItemCode\":\"num2Under5\", \"betItemName\":\"5\"}, " +
                            "{\"betItemCode\":\"num2Under6\", \"betItemName\":\"6\"}, " +
                            "{\"betItemCode\":\"num2Under7\", \"betItemName\":\"7\"}, " +
                            "{\"betItemCode\":\"num2Under8\", \"betItemName\":\"8\"}, " +
                            "{\"betItemCode\":\"num2Under9\", \"betItemName\":\"9\"}, " +
                            "{\"betItemCode\":\"num2Big\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"num2Small\", \"betItemName\":\"小\"}, " +
                            "{\"betItemCode\":\"num2Single\", \"betItemName\":\"单\"}, " +
                            "{\"betItemCode\":\"num2Double\", \"betItemName\":\"双\"}" +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"num3Under0\", \"betItemName\":\"0\"}, " +
                            "{\"betItemCode\":\"num3Under1\", \"betItemName\":\"1\"}, " +
                            "{\"betItemCode\":\"num3Under2\", \"betItemName\":\"2\"}, " +
                            "{\"betItemCode\":\"num3Under3\", \"betItemName\":\"3\"}, " +
                            "{\"betItemCode\":\"num3Under4\", \"betItemName\":\"4\"}, " +
                            "{\"betItemCode\":\"num3Under5\", \"betItemName\":\"5\"}, " +
                            "{\"betItemCode\":\"num3Under6\", \"betItemName\":\"6\"}, " +
                            "{\"betItemCode\":\"num3Under7\", \"betItemName\":\"7\"}, " +
                            "{\"betItemCode\":\"num3Under8\", \"betItemName\":\"8\"}, " +
                            "{\"betItemCode\":\"num3Under9\", \"betItemName\":\"9\"}, " +
                            "{\"betItemCode\":\"num3Big\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"num3Small\", \"betItemName\":\"小\"}, " +
                            "{\"betItemCode\":\"num3Single\", \"betItemName\":\"单\"}, " +
                            "{\"betItemCode\":\"num3Double\", \"betItemName\":\"双\"}" +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"num4Under0\", \"betItemName\":\"0\"}, " +
                            "{\"betItemCode\":\"num4Under1\", \"betItemName\":\"1\"}, " +
                            "{\"betItemCode\":\"num4Under2\", \"betItemName\":\"2\"}, " +
                            "{\"betItemCode\":\"num4Under3\", \"betItemName\":\"3\"}, " +
                            "{\"betItemCode\":\"num4Under4\", \"betItemName\":\"4\"}, " +
                            "{\"betItemCode\":\"num4Under5\", \"betItemName\":\"5\"}, " +
                            "{\"betItemCode\":\"num4Under6\", \"betItemName\":\"6\"}, " +
                            "{\"betItemCode\":\"num4Under7\", \"betItemName\":\"7\"}, " +
                            "{\"betItemCode\":\"num4Under8\", \"betItemName\":\"8\"}, " +
                            "{\"betItemCode\":\"num4Under9\", \"betItemName\":\"9\"}, " +
                            "{\"betItemCode\":\"num4Big\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"num4Small\", \"betItemName\":\"小\"}, " +
                            "{\"betItemCode\":\"num4Single\", \"betItemName\":\"单\"}, " +
                            "{\"betItemCode\":\"num4Double\", \"betItemName\":\"双\"}" +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"num5Under0\", \"betItemName\":\"0\"}, " +
                            "{\"betItemCode\":\"num5Under1\", \"betItemName\":\"1\"}, " +
                            "{\"betItemCode\":\"num5Under2\", \"betItemName\":\"2\"}, " +
                            "{\"betItemCode\":\"num5Under3\", \"betItemName\":\"3\"}, " +
                            "{\"betItemCode\":\"num5Under4\", \"betItemName\":\"4\"}, " +
                            "{\"betItemCode\":\"num5Under5\", \"betItemName\":\"5\"}, " +
                            "{\"betItemCode\":\"num5Under6\", \"betItemName\":\"6\"}, " +
                            "{\"betItemCode\":\"num5Under7\", \"betItemName\":\"7\"}, " +
                            "{\"betItemCode\":\"num5Under8\", \"betItemName\":\"8\"}, " +
                            "{\"betItemCode\":\"num5Under9\", \"betItemName\":\"9\"}, " +
                            "{\"betItemCode\":\"num5Big\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"num5Small\", \"betItemName\":\"小\"}, " +
                            "{\"betItemCode\":\"num5Single\", \"betItemName\":\"单\"}, " +
                            "{\"betItemCode\":\"num5Double\", \"betItemName\":\"双\"}" +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"fBao\", \"betItemName\":\"豹\"}, " +
                            "{\"betItemCode\":\"fDui\", \"betItemName\":\"对\"}, " +
                            "{\"betItemCode\":\"fSun\", \"betItemName\":\"顺\"}, " +
                            "{\"betItemCode\":\"fBan\", \"betItemName\":\"半\"}, " +
                            "{\"betItemCode\":\"fZa\", \"betItemName\":\"杂\"}" +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"mBao\", \"betItemName\":\"豹\"}, " +
                            "{\"betItemCode\":\"mDui\", \"betItemName\":\"对\"}, " +
                            "{\"betItemCode\":\"mSun\", \"betItemName\":\"顺\"}, " +
                            "{\"betItemCode\":\"mBan\", \"betItemName\":\"半\"}, " +
                            "{\"betItemCode\":\"mZa\", \"betItemName\":\"杂\"}" +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"bBao\", \"betItemName\":\"豹\"}, " +
                            "{\"betItemCode\":\"bDui\", \"betItemName\":\"对\"}, " +
                            "{\"betItemCode\":\"bSun\", \"betItemName\":\"顺\"}, " +
                            "{\"betItemCode\":\"bBan\", \"betItemName\":\"半\"}, " +
                            "{\"betItemCode\":\"bZa\", \"betItemName\":\"杂\"}" +
                        "] " +
                    "]";

            // 将字符串转换为外层的JSONArray对象
            JSONArray defaultBetItemJsonArray = new JSONArray(defaultBetItemJsonArrayString);

            JSONArray outerArray = defaultBetItemJsonArray.getJSONArray(0);

            // 遍历外层的JSONArray
            for (int i = 0; i < outerArray.size(); i++) {
                // 获取每个元素，它本身也是一个JSONArray
                JSONArray innerArray = outerArray.getJSONArray(i);
                SysBetType betTypeInfo = defaultThreeballBetType.get(i);

                sort = 1;

                // 遍历内层的JSONArray
                for (int j = 0; j < innerArray.size(); j++) {
                    // 获取每个元素的JSONObject
                    JSONObject jsonObject = innerArray.getJSONObject(j);

                    // 获取JSON对象中的数据
                    String betItemCode = jsonObject.getString("betItemCode");
                    String betItemName = jsonObject.getString("betItemName");

                    SysBetItem newSysBetItem = new SysBetItem();
                    newSysBetItem.setGameId(sysGame.getGameId());
                    newSysBetItem.setBetItemType(betTypeInfo.getBetTypeId());
                    newSysBetItem.setBetItemCode(betItemCode);
                    newSysBetItem.setBetItemName(betItemName);
                    newSysBetItem.setOdd(2f);
                    newSysBetItem.setMinBetAmount(2f);
                    newSysBetItem.setMaxBetAmount(9999f);
                    newSysBetItem.setSort(sort);
                    newSysBetItem.setStatus("0");

                    sysBetItemMapper.insertSysBetItem(newSysBetItem);
                    sort++;
                }
            }
        }
    }

    public void insertDefaultTenballBetTypeAndItem(SysGame sysGame){

        List<String> defaultThreeballBetTypeNameList = Arrays.asList("冠亚和值","猜冠军","猜亚军","猜第三名","猜第四名","猜第五名","猜第六名","猜第七名","猜第八名","猜第九名","猜第十名");
        List<SysBetType> defaultThreeballBetType = new ArrayList<>();
        Integer sort = 1;
        for(String defaultThreeballBetTypeName : defaultThreeballBetTypeNameList){
            SysBetType newSysBetType = new SysBetType();
            newSysBetType.setGameId(sysGame.getGameId());
            newSysBetType.setBetTypeName(defaultThreeballBetTypeName);
            newSysBetType.setStatus("0");
            newSysBetType.setSort(sort);

            sysBetTypeMapper.insertSysBetType(newSysBetType);
            defaultThreeballBetType.add(newSysBetType);

            sort++;
        }

        SysBetItem searchBetItem = new SysBetItem();
        searchBetItem.setGameId(sysGame.getGameId());
        List<SysBetItem> betItemList = sysBetItemMapper.selectSysBetItemList(searchBetItem);
        if(betItemList.size() == 0){
            String defaultBetItemJsonArrayString = "[" +
                        "[" +
                            "{\"betItemCode\":\"big\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"small\", \"betItemName\":\"小\"}, " +
                            "{\"betItemCode\":\"single\", \"betItemName\":\"单\"}, " +
                            "{\"betItemCode\":\"doubleFlg\", \"betItemName\":\"双\"}, " +
                            "{\"betItemCode\":\"num3\", \"betItemName\":\"3\"}, " +
                            "{\"betItemCode\":\"num4\", \"betItemName\":\"4\"}, " +
                            "{\"betItemCode\":\"num5\", \"betItemName\":\"5\"}, " +
                            "{\"betItemCode\":\"num6\", \"betItemName\":\"6\"}, " +
                            "{\"betItemCode\":\"num7\", \"betItemName\":\"7\"}, " +
                            "{\"betItemCode\":\"num8\", \"betItemName\":\"8\"}, " +
                            "{\"betItemCode\":\"num9\", \"betItemName\":\"9\"}, " +
                            "{\"betItemCode\":\"num10\", \"betItemName\":\"10\"}, " +
                            "{\"betItemCode\":\"num11\", \"betItemName\":\"11\"}, " +
                            "{\"betItemCode\":\"num12\", \"betItemName\":\"12\"}, " +
                            "{\"betItemCode\":\"num13\", \"betItemName\":\"13\"}, " +
                            "{\"betItemCode\":\"num14\", \"betItemName\":\"14\"}, " +
                            "{\"betItemCode\":\"num15\", \"betItemName\":\"15\"}, " +
                            "{\"betItemCode\":\"num16\", \"betItemName\":\"16\"}, " +
                            "{\"betItemCode\":\"num17\", \"betItemName\":\"17\"}, " +
                            "{\"betItemCode\":\"num18\", \"betItemName\":\"18\"}, " +
                            "{\"betItemCode\":\"num19\", \"betItemName\":\"19\"}" +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"big1\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"small1\", \"betItemName\":\"小\"}, " +
                            "{\"betItemCode\":\"single1\", \"betItemName\":\"单\"}, " +
                            "{\"betItemCode\":\"double1\", \"betItemName\":\"双\"}, " +
                            "{\"betItemCode\":\"loong1\", \"betItemName\":\"龙\"}, " +
                            "{\"betItemCode\":\"tiger1\", \"betItemName\":\"虎\"}, " +
                            "{\"betItemCode\":\"num1Under1\", \"betItemName\":\"1\"}, " +
                            "{\"betItemCode\":\"num2Under1\", \"betItemName\":\"2\"}, " +
                            "{\"betItemCode\":\"num3Under1\", \"betItemName\":\"3\"}, " +
                            "{\"betItemCode\":\"num4Under1\", \"betItemName\":\"4\"}, " +
                            "{\"betItemCode\":\"num5Under1\", \"betItemName\":\"5\"}, " +
                            "{\"betItemCode\":\"num6Under1\", \"betItemName\":\"6\"}, " +
                            "{\"betItemCode\":\"num7Under1\", \"betItemName\":\"7\"}, " +
                            "{\"betItemCode\":\"num8Under1\", \"betItemName\":\"8\"}, " +
                            "{\"betItemCode\":\"num9Under1\", \"betItemName\":\"9\"}, " +
                            "{\"betItemCode\":\"num10Under1\", \"betItemName\":\"10\"} " +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"big2\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"small2\", \"betItemName\":\"小\"}, " +
                            "{\"betItemCode\":\"single2\", \"betItemName\":\"单\"}, " +
                            "{\"betItemCode\":\"double2\", \"betItemName\":\"双\"}, " +
                            "{\"betItemCode\":\"loong2\", \"betItemName\":\"龙\"}, " +
                            "{\"betItemCode\":\"tiger2\", \"betItemName\":\"虎\"}, " +
                            "{\"betItemCode\":\"num1Under2\", \"betItemName\":\"1\"}, " +
                            "{\"betItemCode\":\"num2Under2\", \"betItemName\":\"2\"}, " +
                            "{\"betItemCode\":\"num3Under2\", \"betItemName\":\"3\"}, " +
                            "{\"betItemCode\":\"num4Under2\", \"betItemName\":\"4\"}, " +
                            "{\"betItemCode\":\"num5Under2\", \"betItemName\":\"5\"}, " +
                            "{\"betItemCode\":\"num6Under2\", \"betItemName\":\"6\"}, " +
                            "{\"betItemCode\":\"num7Under2\", \"betItemName\":\"7\"}, " +
                            "{\"betItemCode\":\"num8Under2\", \"betItemName\":\"8\"}, " +
                            "{\"betItemCode\":\"num9Under2\", \"betItemName\":\"9\"}, " +
                            "{\"betItemCode\":\"num10Under2\", \"betItemName\":\"10\"} " +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"big3\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"small3\", \"betItemName\":\"小\"}, " +
                            "{\"betItemCode\":\"single3\", \"betItemName\":\"单\"}, " +
                            "{\"betItemCode\":\"double3\", \"betItemName\":\"双\"}, " +
                            "{\"betItemCode\":\"loong3\", \"betItemName\":\"龙\"}, " +
                            "{\"betItemCode\":\"tiger3\", \"betItemName\":\"虎\"}, " +
                            "{\"betItemCode\":\"num1Under3\", \"betItemName\":\"1\"}, " +
                            "{\"betItemCode\":\"num2Under3\", \"betItemName\":\"2\"}, " +
                            "{\"betItemCode\":\"num3Under3\", \"betItemName\":\"3\"}, " +
                            "{\"betItemCode\":\"num4Under3\", \"betItemName\":\"4\"}, " +
                            "{\"betItemCode\":\"num5Under3\", \"betItemName\":\"5\"}, " +
                            "{\"betItemCode\":\"num6Under3\", \"betItemName\":\"6\"}, " +
                            "{\"betItemCode\":\"num7Under3\", \"betItemName\":\"7\"}, " +
                            "{\"betItemCode\":\"num8Under3\", \"betItemName\":\"8\"}, " +
                            "{\"betItemCode\":\"num9Under3\", \"betItemName\":\"9\"}, " +
                            "{\"betItemCode\":\"num10Under3\", \"betItemName\":\"10\"} " +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"big4\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"small4\", \"betItemName\":\"小\"}, " +
                            "{\"betItemCode\":\"single4\", \"betItemName\":\"单\"}, " +
                            "{\"betItemCode\":\"double4\", \"betItemName\":\"双\"}, " +
                            "{\"betItemCode\":\"loong4\", \"betItemName\":\"龙\"}, " +
                            "{\"betItemCode\":\"tiger4\", \"betItemName\":\"虎\"}, " +
                            "{\"betItemCode\":\"num1Under4\", \"betItemName\":\"1\"}, " +
                            "{\"betItemCode\":\"num2Under4\", \"betItemName\":\"2\"}, " +
                            "{\"betItemCode\":\"num3Under4\", \"betItemName\":\"3\"}, " +
                            "{\"betItemCode\":\"num4Under4\", \"betItemName\":\"4\"}, " +
                            "{\"betItemCode\":\"num5Under4\", \"betItemName\":\"5\"}, " +
                            "{\"betItemCode\":\"num6Under4\", \"betItemName\":\"6\"}, " +
                            "{\"betItemCode\":\"num7Under4\", \"betItemName\":\"7\"}, " +
                            "{\"betItemCode\":\"num8Under4\", \"betItemName\":\"8\"}, " +
                            "{\"betItemCode\":\"num9Under4\", \"betItemName\":\"9\"}, " +
                            "{\"betItemCode\":\"num10Under4\", \"betItemName\":\"10\"} " +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"big5\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"small5\", \"betItemName\":\"小\"}, " +
                            "{\"betItemCode\":\"single5\", \"betItemName\":\"单\"}, " +
                            "{\"betItemCode\":\"double5\", \"betItemName\":\"双\"}, " +
                            "{\"betItemCode\":\"loong5\", \"betItemName\":\"龙\"}, " +
                            "{\"betItemCode\":\"tiger5\", \"betItemName\":\"虎\"}, " +
                            "{\"betItemCode\":\"num1Under5\", \"betItemName\":\"1\"}, " +
                            "{\"betItemCode\":\"num2Under5\", \"betItemName\":\"2\"}, " +
                            "{\"betItemCode\":\"num3Under5\", \"betItemName\":\"3\"}, " +
                            "{\"betItemCode\":\"num4Under5\", \"betItemName\":\"4\"}, " +
                            "{\"betItemCode\":\"num5Under5\", \"betItemName\":\"5\"}, " +
                            "{\"betItemCode\":\"num6Under5\", \"betItemName\":\"6\"}, " +
                            "{\"betItemCode\":\"num7Under5\", \"betItemName\":\"7\"}, " +
                            "{\"betItemCode\":\"num8Under5\", \"betItemName\":\"8\"}, " +
                            "{\"betItemCode\":\"num9Under5\", \"betItemName\":\"9\"}, " +
                            "{\"betItemCode\":\"num10Under5\", \"betItemName\":\"10\"} " +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"big6\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"small6\", \"betItemName\":\"小\"}, " +
                            "{\"betItemCode\":\"single6\", \"betItemName\":\"单\"}, " +
                            "{\"betItemCode\":\"double6\", \"betItemName\":\"双\"}, " +
                            "{\"betItemCode\":\"num1Under6\", \"betItemName\":\"1\"}, " +
                            "{\"betItemCode\":\"num2Under6\", \"betItemName\":\"2\"}, " +
                            "{\"betItemCode\":\"num3Under6\", \"betItemName\":\"3\"}, " +
                            "{\"betItemCode\":\"num4Under6\", \"betItemName\":\"4\"}, " +
                            "{\"betItemCode\":\"num5Under6\", \"betItemName\":\"5\"}, " +
                            "{\"betItemCode\":\"num6Under6\", \"betItemName\":\"6\"}, " +
                            "{\"betItemCode\":\"num7Under6\", \"betItemName\":\"7\"}, " +
                            "{\"betItemCode\":\"num8Under6\", \"betItemName\":\"8\"}, " +
                            "{\"betItemCode\":\"num9Under6\", \"betItemName\":\"9\"}, " +
                            "{\"betItemCode\":\"num10Under6\", \"betItemName\":\"10\"} " +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"big7\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"small7\", \"betItemName\":\"小\"}, " +
                            "{\"betItemCode\":\"single7\", \"betItemName\":\"单\"}, " +
                            "{\"betItemCode\":\"double7\", \"betItemName\":\"双\"}, " +
                            "{\"betItemCode\":\"num1Under7\", \"betItemName\":\"1\"}, " +
                            "{\"betItemCode\":\"num2Under7\", \"betItemName\":\"2\"}, " +
                            "{\"betItemCode\":\"num3Under7\", \"betItemName\":\"3\"}, " +
                            "{\"betItemCode\":\"num4Under7\", \"betItemName\":\"4\"}, " +
                            "{\"betItemCode\":\"num5Under7\", \"betItemName\":\"5\"}, " +
                            "{\"betItemCode\":\"num6Under7\", \"betItemName\":\"6\"}, " +
                            "{\"betItemCode\":\"num7Under7\", \"betItemName\":\"7\"}, " +
                            "{\"betItemCode\":\"num8Under7\", \"betItemName\":\"8\"}, " +
                            "{\"betItemCode\":\"num9Under7\", \"betItemName\":\"9\"}, " +
                            "{\"betItemCode\":\"num10Under7\", \"betItemName\":\"10\"} " +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"big8\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"small8\", \"betItemName\":\"小\"}, " +
                            "{\"betItemCode\":\"single8\", \"betItemName\":\"单\"}, " +
                            "{\"betItemCode\":\"double8\", \"betItemName\":\"双\"}, " +
                            "{\"betItemCode\":\"num1Under8\", \"betItemName\":\"1\"}, " +
                            "{\"betItemCode\":\"num2Under8\", \"betItemName\":\"2\"}, " +
                            "{\"betItemCode\":\"num3Under8\", \"betItemName\":\"3\"}, " +
                            "{\"betItemCode\":\"num4Under8\", \"betItemName\":\"4\"}, " +
                            "{\"betItemCode\":\"num5Under8\", \"betItemName\":\"5\"}, " +
                            "{\"betItemCode\":\"num6Under8\", \"betItemName\":\"6\"}, " +
                            "{\"betItemCode\":\"num7Under8\", \"betItemName\":\"7\"}, " +
                            "{\"betItemCode\":\"num8Under8\", \"betItemName\":\"8\"}, " +
                            "{\"betItemCode\":\"num9Under8\", \"betItemName\":\"9\"}, " +
                            "{\"betItemCode\":\"num10Under8\", \"betItemName\":\"10\"} " +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"big9\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"small9\", \"betItemName\":\"小\"}, " +
                            "{\"betItemCode\":\"single9\", \"betItemName\":\"单\"}, " +
                            "{\"betItemCode\":\"double9\", \"betItemName\":\"双\"}, " +
                            "{\"betItemCode\":\"num1Under9\", \"betItemName\":\"1\"}, " +
                            "{\"betItemCode\":\"num2Under9\", \"betItemName\":\"2\"}, " +
                            "{\"betItemCode\":\"num3Under9\", \"betItemName\":\"3\"}, " +
                            "{\"betItemCode\":\"num4Under9\", \"betItemName\":\"4\"}, " +
                            "{\"betItemCode\":\"num5Under9\", \"betItemName\":\"5\"}, " +
                            "{\"betItemCode\":\"num6Under9\", \"betItemName\":\"6\"}, " +
                            "{\"betItemCode\":\"num7Under9\", \"betItemName\":\"7\"}, " +
                            "{\"betItemCode\":\"num8Under9\", \"betItemName\":\"8\"}, " +
                            "{\"betItemCode\":\"num9Under9\", \"betItemName\":\"9\"}, " +
                            "{\"betItemCode\":\"num10Under9\", \"betItemName\":\"10\"} " +
                        "], " +
                        "[" +
                            "{\"betItemCode\":\"big10\", \"betItemName\":\"大\"}, " +
                            "{\"betItemCode\":\"small10\", \"betItemName\":\"小\"}, " +
                            "{\"betItemCode\":\"single10\", \"betItemName\":\"单\"}, " +
                            "{\"betItemCode\":\"double10\", \"betItemName\":\"双\"}, " +
                            "{\"betItemCode\":\"num1Under10\", \"betItemName\":\"1\"}, " +
                            "{\"betItemCode\":\"num2Under10\", \"betItemName\":\"2\"}, " +
                            "{\"betItemCode\":\"num3Under10\", \"betItemName\":\"3\"}, " +
                            "{\"betItemCode\":\"num4Under10\", \"betItemName\":\"4\"}, " +
                            "{\"betItemCode\":\"num5Under10\", \"betItemName\":\"5\"}, " +
                            "{\"betItemCode\":\"num6Under10\", \"betItemName\":\"6\"}, " +
                            "{\"betItemCode\":\"num7Under10\", \"betItemName\":\"7\"}, " +
                            "{\"betItemCode\":\"num8Under10\", \"betItemName\":\"8\"}, " +
                            "{\"betItemCode\":\"num9Under10\", \"betItemName\":\"9\"}, " +
                            "{\"betItemCode\":\"num10Under10\", \"betItemName\":\"10\"} " +
                        "]" +
                    "]";

            // 将字符串转换为外层的JSONArray对象
            JSONArray defaultBetItemJsonArray = new JSONArray(defaultBetItemJsonArrayString);

            JSONArray outerArray = defaultBetItemJsonArray.getJSONArray(0);

            // 遍历外层的JSONArray
            for (int i = 0; i < outerArray.size(); i++) {
                // 获取每个元素，它本身也是一个JSONArray
                JSONArray innerArray = outerArray.getJSONArray(i);
                SysBetType betTypeInfo = defaultThreeballBetType.get(i);

                sort = 1;

                // 遍历内层的JSONArray
                for (int j = 0; j < innerArray.size(); j++) {
                    // 获取每个元素的JSONObject
                    JSONObject jsonObject = innerArray.getJSONObject(j);

                    // 获取JSON对象中的数据
                    String betItemCode = jsonObject.getString("betItemCode");
                    String betItemName = jsonObject.getString("betItemName");

                    SysBetItem newSysBetItem = new SysBetItem();
                    newSysBetItem.setGameId(sysGame.getGameId());
                    newSysBetItem.setBetItemType(betTypeInfo.getBetTypeId());
                    newSysBetItem.setBetItemCode(betItemCode);
                    newSysBetItem.setBetItemName(betItemName);
                    newSysBetItem.setOdd(2f);
                    newSysBetItem.setMinBetAmount(2f);
                    newSysBetItem.setMaxBetAmount(9999f);
                    newSysBetItem.setSort(sort);
                    newSysBetItem.setStatus("0");

                    sysBetItemMapper.insertSysBetItem(newSysBetItem);
                    sort++;
                }
            }
        }
    }

    public void insertDefaultZfbBetTypeAndItem(SysGame sysGame){

        List<String> defaultThreeballBetTypeNameList = Arrays.asList("猜冠亚军","猜前三名","猜前四名","猜前五名","定位胆","大小单双","龙虎1v6","龙虎2v5","龙虎3v4");
        List<SysBetType> defaultThreeballBetType = new ArrayList<>();
        Integer sort = 1;
        for(String defaultThreeballBetTypeName : defaultThreeballBetTypeNameList){
            SysBetType newSysBetType = new SysBetType();
            newSysBetType.setGameId(sysGame.getGameId());
            newSysBetType.setBetTypeName(defaultThreeballBetTypeName);
            newSysBetType.setStatus("0");
            newSysBetType.setSort(sort);

            sysBetTypeMapper.insertSysBetType(newSysBetType);
            defaultThreeballBetType.add(newSysBetType);

            sort++;
        }

        SysBetItem searchBetItem = new SysBetItem();
        searchBetItem.setGameId(sysGame.getGameId());
        List<SysBetItem> betItemList = sysBetItemMapper.selectSysBetItemList(searchBetItem);
        if(betItemList.size() == 0){
            String defaultBetItemJsonArrayString = "[" +
                    "[" +
                    "{\"betItemCode\":\"type1\", \"betItemName\":\"冠亚军\"}" +
                    "], " +
                    "[" +
                    "{\"betItemCode\":\"type2\", \"betItemName\":\"猜前三名\"}" +
                    "], " +
                    "[" +
                    "{\"betItemCode\":\"type3\", \"betItemName\":\"猜前四名\"}" +
                    "], " +
                    "[" +
                    "{\"betItemCode\":\"type4\", \"betItemName\":\"猜前五名\"}" +
                    "], " +
                    "[" +
                    "{\"betItemCode\":\"type5\", \"betItemName\":\"定位胆\"}" +
                    "], " +
                    "[" +
                    "{\"betItemCode\":\"type6\", \"betItemName\":\"大小单双\"}" +
                    "], " +
                    "[" +
                    "{\"betItemCode\":\"type7\", \"betItemName\":\"龙虎1v6\"}" +
                    "], " +
                    "[" +
                    "{\"betItemCode\":\"type8\", \"betItemName\":\"龙虎2v5\"}" +
                    "], " +
                    "[" +
                    "{\"betItemCode\":\"type9\", \"betItemName\":\"龙虎3v4\"} " +
                    "] " +
                    "]";

            // 将字符串转换为外层的JSONArray对象
            JSONArray defaultBetItemJsonArray = new JSONArray(defaultBetItemJsonArrayString);

            JSONArray outerArray = defaultBetItemJsonArray.getJSONArray(0);

            // 遍历外层的JSONArray
            for (int i = 0; i < outerArray.size(); i++) {
                // 获取每个元素，它本身也是一个JSONArray
                JSONArray innerArray = outerArray.getJSONArray(i);
                SysBetType betTypeInfo = defaultThreeballBetType.get(i);

                sort = 1;

                // 遍历内层的JSONArray
                for (int j = 0; j < innerArray.size(); j++) {
                    // 获取每个元素的JSONObject
                    JSONObject jsonObject = innerArray.getJSONObject(j);

                    // 获取JSON对象中的数据
                    String betItemCode = jsonObject.getString("betItemCode");
                    String betItemName = jsonObject.getString("betItemName");

                    SysBetItem newSysBetItem = new SysBetItem();
                    newSysBetItem.setGameId(sysGame.getGameId());
                    newSysBetItem.setBetItemType(betTypeInfo.getBetTypeId());
                    newSysBetItem.setBetItemCode(betItemCode);
                    newSysBetItem.setBetItemName(betItemName);
                    newSysBetItem.setOdd(2f);
                    newSysBetItem.setMinBetAmount(2f);
                    newSysBetItem.setMaxBetAmount(9999f);
                    newSysBetItem.setSort(sort);
                    newSysBetItem.setStatus("0");

                    sysBetItemMapper.insertSysBetItem(newSysBetItem);
                    sort++;
                }
            }
        }
    }

    /**
     * 批量删除游戏
     * 
     * @param gameIds 需要删除的游戏主键
     * @return 结果
     */
    @Override
    public int deleteSysGameByGameIds(Long[] gameIds)
    {
        return sysGameMapper.deleteSysGameByGameIds(gameIds);
    }

    /**
     * 删除游戏信息
     * 
     * @param gameId 游戏主键
     * @return 结果
     */
    @Override
    public int deleteSysGameByGameId(Long gameId)
    {
        return sysGameMapper.deleteSysGameByGameId(gameId);
    }

    @Override
    public SysGame selectSysGameByGameMarkId(String gameMarkId) {
        return sysGameMapper.selectSysGameByGameMarkId(gameMarkId);
    }
}
