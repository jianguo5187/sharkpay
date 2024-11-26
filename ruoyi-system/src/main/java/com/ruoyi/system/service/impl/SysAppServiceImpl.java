package com.ruoyi.system.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.common.utils.http.NewHttpUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.mapper.*;
import com.ruoyi.system.service.*;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class SysAppServiceImpl implements ISysAppService {

    @Autowired
    private IGameThreeballKjService gameThreeballKjService;

    @Autowired
    private IGameFiveballKjService gameFiveballKjService;

    @Autowired
    private IGameTenballKjService gameTenballKjService;

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private IUserwinService userwinService;

    @Autowired
    private BetkjMapper betkjMapper;

    @Autowired
    private BetRecordMapper betRecordMapper;

    @Autowired
    private UserwinMapper userwinMapper;

    @Autowired
    private IWaveService waveService;

    @Autowired
    private ISysReplaceService sysReplaceService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private SysUserMapper userMapper;

    @Autowired
    private UsermoneyMapper usermoneyMapper;

    @Autowired
    private SysConfigMapper configMapper;

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private ISysLandingDomainService sysLandingDomainService;

    @Autowired
    private ISysDictDataService dictDataService;

    @Autowired
    private IGameAutoBetRecordService gameAutoBetRecordService;

    //验证微信拦截APIUrl
    @Value("${wx.autoCheck.apiUrl}")
    private String apiUrl;

    @Override
    public List<GameListRespVO> gameRecordList(Long userId, GameListReqVO vo) {

        SysGame gameInfo = sysGameService.selectSysGameByGameId(vo.getGameId());
        String day = vo.getFilterDay();

        if(StringUtils.isEmpty(vo.getFilterDay())){
            SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
            String today = sd.format(new Date());
            day = today;
        }

        String recordTable = "";
        if(StringUtils.equals(gameInfo.getGameType(),"3")){
            // 3球
            recordTable = "game_threeball_record";
        }else if(StringUtils.equals(gameInfo.getGameType(),"5")){
            // 5球
            recordTable = "game_fiveball_record";
        }else{
            // 10球
            recordTable = "game_tenball_record";
        }

        return betkjMapper.gameRecordList(vo.getGameId(), recordTable,userId,day);
    }

    @Override
    public GameDetailRespVO gameRecordDetail(Long userId, GameDetailReqVO vo) {

        SysGame gameInfo = sysGameService.selectSysGameByGameId(vo.getGameId());
        GameDetailRespVO respVO = new GameDetailRespVO();

        String recordTable = "";
        if(StringUtils.equals(gameInfo.getGameType(),"3")){
            // 3球
            recordTable = "game_threeball_record";
        }else if(StringUtils.equals(gameInfo.getGameType(),"5")){
            // 5球
            recordTable = "game_fiveball_record";
        }else{
            // 10球
            recordTable = "game_tenball_record";
        }

        List<GameDetailRespVO> gameDetailList = betkjMapper.gameRecordDetail(vo.getGameId(),recordTable,gameInfo.getGameType(),userId, vo.getPeriods());

        if(gameDetailList != null && gameDetailList.size() > 0){
            respVO = gameDetailList.get(0);

            BetRecord searchBetRecord = new BetRecord();
            searchBetRecord.setGameId(vo.getGameId());
            searchBetRecord.setPeriods(vo.getPeriods());
            searchBetRecord.setUserId(userId);
            searchBetRecord.setIsDelete("0");
            List<BetRecord> betRecordList = betRecordMapper.selectBetRecordList(searchBetRecord);

            List<PlayedDetailRespVO> playedDetailList = new ArrayList<>();
            for(BetRecord betRecord : betRecordList){
                PlayedDetailRespVO playedDetail = new PlayedDetailRespVO();
                playedDetail.setPlayDetail(betRecord.getPlayDetail());
                playedDetail.setPlayType(betRecord.getPlayType());
                playedDetail.setMoney(betRecord.getMoney());
                playedDetailList.add(playedDetail);

                respVO.setRecordTime(betRecord.getRecordTime());
            }
            respVO.setPlayedDetail(playedDetailList);
        }
        return respVO;
    }

    @Override
    public void clearGameRecode(Long userId) {
        SysGame sysGame = new SysGame();
        sysGame.setStatus("0"); //有效
        List<SysGame> gameList = sysGameService.selectSysGameList(sysGame);
        String recordTable = "";
        for(SysGame gameInfo : gameList){

            if(StringUtils.equals(gameInfo.getGameType(),"3")){
                // 3球
                recordTable = "game_threeball_record";
            }else if(StringUtils.equals(gameInfo.getGameType(),"5")){
                // 5球
                recordTable = "game_fiveball_record";
            }else{
                // 10球
                recordTable = "game_tenball_record";
            }
            betkjMapper.clearGameRecode(gameInfo.getGameId(), recordTable, userId);
            userwinMapper.clearUserwin(gameInfo.getGameId(),userId);
        }
    }

    @Override
    public List<GameResultListRespVO> gameResultList(GameResultListReqVO vo) {

        List<GameResultListRespVO> respVO = new ArrayList<>();
        SysGame gameInfo = sysGameService.selectSysGameByGameId(vo.getGameId());
        if(StringUtils.isNull(vo.getPageNumber())){
            vo.setPageNumber(1);
        }
        if(StringUtils.isNull(vo.getPageRowCount())){
            vo.setPageRowCount(20);
        }

        if(StringUtils.equals(gameInfo.getGameType(),"3")){
            List<GameThreeballKj> gameThreeballKjList = gameThreeballKjService.selectThreeBallsGameResult(gameInfo.getGameId(),(vo.getPageNumber()-1)*vo.getPageRowCount(), vo.getPageRowCount(), vo.getFilterDate());
            Wave wave = waveService.selectWaveByGameId(2l);

            for(GameThreeballKj gameThreeballKj : gameThreeballKjList){

                Integer num1 =  gameThreeballKj.getNum1();
                Integer num2 =  gameThreeballKj.getNum2();
                Integer num3 =  gameThreeballKj.getNum3();
                Integer sumNum = gameThreeballKj.getSumNum();

                String sumBs = "";
                String sumDs = "";
                String color = "无";

                if(sumNum > 13){
                    sumBs = "大";
                }else{
                    sumBs = "小";
                }

                if(sumNum%2 == 0){
                    sumDs = "双";
                }else{
                    sumDs = "单";
                }

                if(changeWaveInfoByNum(sumNum , wave) == 1){
                    color = "绿";
                }else if(changeWaveInfoByNum(sumNum , wave) == 2){
                    color = "红";
                }else if(changeWaveInfoByNum(sumNum , wave) == 3){
                    color = "蓝";
                }

                GameResultListRespVO gameResul = new GameResultListRespVO();
                gameResul.setGameId(gameThreeballKj.getGameId());
                gameResul.setGameName(gameThreeballKj.getGameName());
                gameResul.setPeriods(gameThreeballKj.getPeriods());
                gameResul.setOpentime(gameThreeballKj.getTheTime());
                gameResul.setOpenCode(num1.toString() + "," + num2.toString() + "," + num3.toString() + "," + sumNum.toString());
                gameResul.setOpenCodeName(sumBs + "," + sumDs + "," + color);

                respVO.add(gameResul);
            }
        }else if(StringUtils.equals(gameInfo.getGameType(),"5")){
            List<GameFiveballKj> gameFiveballKjList = gameFiveballKjService.selectFiveBallsGameResult(gameInfo.getGameId(),(vo.getPageNumber()-1)*vo.getPageRowCount(), vo.getPageRowCount(), vo.getFilterDate());

            List<String> sdList = new ArrayList<>();
            sdList.add("单");
            sdList.add("双");
            List<String> bsList = new ArrayList<>();
            bsList.add("小");
            bsList.add("大");
            List<String> ltsList = new ArrayList<>();
            ltsList.add("和");
            ltsList.add("虎");
            ltsList.add("龙");

            for(GameFiveballKj gameFiveballKj : gameFiveballKjList){

                Integer num1 =  gameFiveballKj.getNum1();
                Integer num2 =  gameFiveballKj.getNum2();
                Integer num3 =  gameFiveballKj.getNum3();
                Integer num4 =  gameFiveballKj.getNum4();
                Integer num5 =  gameFiveballKj.getNum5();
                Integer sum =  gameFiveballKj.getSum();
                Integer sumBs =  gameFiveballKj.getSumBs();
                Integer sumSd =  gameFiveballKj.getSumSd();
                Integer sumLts =  gameFiveballKj.getSumLts();

                GameResultListRespVO gameResul = new GameResultListRespVO();
                gameResul.setGameId(gameFiveballKj.getGameId());
                gameResul.setGameName(gameFiveballKj.getGameName());
                gameResul.setPeriods(gameFiveballKj.getPeriods());
                gameResul.setOpentime(gameFiveballKj.getTheTime());
                gameResul.setOpenCode(num1.toString() + "," + num2.toString() + "," + num3.toString() + "," + num4.toString() + "," + num5.toString() + "," + sum.toString() + "," + bsList.get(sumBs) + "," + sdList.get(sumSd) + "," + ltsList.get(sumLts));
                gameResul.setOpenCodeName("25,\\u5927,\\u5355,\\u864e,\\u6742\\u516d,\\u534a\\u987a,\\u534a\\u987a");

                respVO.add(gameResul);
            }
        }else{
            List<GameTenballKj> gameTenballKjList = gameTenballKjService.selectTenBallsGameResult(gameInfo.getGameId(),(vo.getPageNumber()-1)*vo.getPageRowCount(), vo.getPageRowCount(), vo.getFilterDate());
            for(GameTenballKj gameTenballKj : gameTenballKjList){

                Integer num1 =  gameTenballKj.getNum1();
                Integer num2 =  gameTenballKj.getNum2();
                Integer num3 =  gameTenballKj.getNum3();
                Integer num4 =  gameTenballKj.getNum4();
                Integer num5 =  gameTenballKj.getNum5();
                Integer num6 =  gameTenballKj.getNum6();
                Integer num7 =  gameTenballKj.getNum7();
                Integer num8 =  gameTenballKj.getNum8();
                Integer num9 =  gameTenballKj.getNum9();
                Integer num10 = gameTenballKj.getNum10();

                String oneLonghu = "";
                String twoLonghu = "";
                String threeLonghu = "";
                String fourLonghu = "";
                String fiveLonghu = "";
                String sumBs = "";
                String sumDs = "";


                if(num1.compareTo(num10) > 0){
                    oneLonghu = "龙";
                }else{
                    oneLonghu = "虎";
                }

                if(num2.compareTo(num9) > 0){
                    twoLonghu = "龙";
                }else{
                    twoLonghu = "虎";
                }

                if(num3.compareTo(num8) > 0){
                    threeLonghu = "龙";
                }else{
                    threeLonghu = "虎";
                }

                if(num4.compareTo(num7) > 0){
                    fourLonghu = "龙";
                }else{
                    fourLonghu = "虎";
                }

                if(num5.compareTo(num6) > 0){
                    fiveLonghu = "龙";
                }else{
                    fiveLonghu = "虎";
                }

                if((num1+num2)>=12){
                    sumBs = "大";
                }else{
                    sumBs = "小";
                }

                if((num1+num2)%2 == 0){
                    sumDs = "双";
                }else{
                    sumDs = "单";
                }

                GameResultListRespVO gameResul = new GameResultListRespVO();
                gameResul.setGameId(gameTenballKj.getGameId());
                gameResul.setGameName(gameTenballKj.getGameName());
                gameResul.setPeriods(gameTenballKj.getPeriods());
                gameResul.setOpentime(gameTenballKj.getTheTime());
                gameResul.setOpenCode(num1.toString() + "," + num2.toString() + "," + num3.toString() + "," + num4.toString() + "," + num5.toString() + "," + num6.toString() + "," + num7.toString() + "," + num8.toString() + "," + num9.toString() + "," + num10.toString());
                gameResul.setOpenCodeName((num1+num2) + "," + sumBs + "," + sumDs + "," + oneLonghu + "," + twoLonghu + "," + threeLonghu + "," + fourLonghu + "," + fiveLonghu);

                respVO.add(gameResul);
            }
        }
        return respVO;
    }

    public Integer changeWaveInfoByNum(Integer num, Wave wave){
        Integer changeResult = 0;
        switch (num){
            case  0:
                changeResult = wave.getNum0();
                break;
            case  1:
                changeResult = wave.getNum1();
                break;
            case  2:
                changeResult = wave.getNum2();
                break;
            case  3:
                changeResult = wave.getNum3();
                break;
            case  4:
                changeResult = wave.getNum4();
                break;
            case  5:
                changeResult = wave.getNum5();
                break;
            case  6:
                changeResult = wave.getNum6();
                break;
            case  7:
                changeResult = wave.getNum7();
                break;
            case  8:
                changeResult = wave.getNum8();
                break;
            case  9:
                changeResult = wave.getNum9();
                break;
            case  10:
                changeResult = wave.getNum10();
                break;
            case  11:
                changeResult = wave.getNum11();
                break;
            case  12:
                changeResult = wave.getNum12();
                break;
            case  13:
                changeResult = wave.getNum13();
                break;
            case  14:
                changeResult = wave.getNum14();
                break;
            case  15:
                changeResult = wave.getNum15();
                break;
            case  16:
                changeResult = wave.getNum16();
                break;
            case  17:
                changeResult = wave.getNum17();
                break;
            case  18:
                changeResult = wave.getNum18();
                break;
            case  19:
                changeResult = wave.getNum19();
                break;
            case  20:
                changeResult = wave.getNum20();
                break;
            case  21:
                changeResult = wave.getNum21();
                break;
            case  22:
                changeResult = wave.getNum22();
                break;
            case  23:
                changeResult = wave.getNum23();
                break;
            case  24:
                changeResult = wave.getNum24();
                break;
            case  25:
                changeResult = wave.getNum25();
                break;
            case  26:
                changeResult = wave.getNum26();
                break;
            case  27:
                changeResult = wave.getNum27();
                break;
        }
        return changeResult;
    }

    @Override
    public List<SysReplace> replaceList() {
        SysReplace searchReplace = new SysReplace();
        searchReplace.setStatus("0");
        return sysReplaceService.selectSysReplaceList(searchReplace);
    }

    @Override
    public HomePageDataRespVO getHomePageDate() {
        HomePageDataRespVO respVO = new HomePageDataRespVO();
        respVO.setUserCnt(userMapper.selectEffectiveUsersCount());
        respVO.setBetTotalAmount(betRecordMapper.selectBetToalAmount(null,null));
        respVO.setBetWinTotalAmount(userwinMapper.selectBetWinToalAmount());

        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        String today = sd.format(new Date());
        Userwin searchUserwin = new Userwin();
        searchUserwin.setFilterDay(today);
        searchUserwin.setIncludeTestUserFlg(false);

        Float todayWinMoney = 0f;
        List<UserTotalRankListRespVO> totalUserWinList = userwinService.selectUserTotalRankList(searchUserwin);
        for(UserTotalRankListRespVO userTotalRankListRespVO : totalUserWinList){
            todayWinMoney = todayWinMoney + userTotalRankListRespVO.getTotalWinMoney();
        }
        respVO.setTodayWinMoney(todayWinMoney * -1);

        List<String> echartWeekTitle = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE,-7);
        for(int i=1;i<=7;i++){
            cal.add(Calendar.DATE,1);
            echartWeekTitle.add(sdf.format(cal.getTime()));
        }
        respVO.setUpDownMoneyEchartTitle(echartWeekTitle);
        respVO.setGameBetEchartTitle(echartWeekTitle);

        //上分（充值）列表
        List<WeekUpDownMoneyRespVO> weekUpMoneyList = usermoneyMapper.selectWeekUpDownMoneyList("2");
        Map<String , WeekUpDownMoneyRespVO> weekUpMoneyMap = weekUpMoneyList.stream()
                .collect(Collectors.toMap(
                        WeekUpDownMoneyRespVO::getCashDay,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        //下分（提现）列表
        List<WeekUpDownMoneyRespVO> weekDownMoneyList = usermoneyMapper.selectWeekUpDownMoneyList("5");
        Map<String , WeekUpDownMoneyRespVO> weekDownMoneyMap = weekDownMoneyList.stream()
                .collect(Collectors.toMap(
                        WeekUpDownMoneyRespVO::getCashDay,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        List<Float> weekUpMoneyData = new ArrayList<>();
        List<Float> weekDownMoneyData = new ArrayList<>();

        for(String weekDay : echartWeekTitle){
            if(weekUpMoneyMap.containsKey(weekDay)){
                weekUpMoneyData.add(weekUpMoneyMap.get(weekDay).getCashMoney());
            }else{
                weekUpMoneyData.add(0f);
            }

            if(weekDownMoneyMap.containsKey(weekDay)){
                weekDownMoneyData.add(weekDownMoneyMap.get(weekDay).getCashMoney());
            }else{
                weekDownMoneyData.add(0f);
            }
        }
        respVO.setUpMoneyEchartSeriesData(weekUpMoneyData);
        respVO.setDownMoneyEchartSeriesData(weekDownMoneyData);

        SysGame sysGame = new SysGame();
        sysGame.setStatus("0"); //有效
        List<SysGame> gameList = sysGameService.selectSysGameList(sysGame);
        List<String> gameBetEchartLegend = new ArrayList<>();
        for(SysGame gameInfo : gameList){
            gameBetEchartLegend.add(gameInfo.getGameName());
        }
        respVO.setGameBetEchartLegend(gameBetEchartLegend);

        List<WeeKGameBetRespVO> weeKGameBetList = betRecordMapper.selectWeekGameBetList();
        Map<String , WeeKGameBetRespVO> weeKGameBetMap = weeKGameBetList.stream()
                .collect(Collectors.toMap(
                        WeeKGameBetRespVO::getMapKey,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        List<EChartsSeriesDataDto> gameBetEchartSeriesList = new ArrayList<>();
        for(String gameName : gameBetEchartLegend){
            EChartsSeriesDataDto gameBetEchartSeries = new EChartsSeriesDataDto();
            List<Float> weeKGameBetData = new ArrayList<>();
            for(String weekDay : echartWeekTitle){
                if(weeKGameBetMap.containsKey(weekDay + "_" + gameName)){
                    weeKGameBetData.add(weeKGameBetMap.get(weekDay + "_" + gameName).getBetMoney());
                }else{
                    weeKGameBetData.add(0f);
                }
            }
            gameBetEchartSeries.setData(weeKGameBetData);
            gameBetEchartSeries.setName(gameName);
            gameBetEchartSeries.setType("line");
            gameBetEchartSeriesList.add(gameBetEchartSeries);
        }
        respVO.setGameBetEchartSeries(gameBetEchartSeriesList);
//        EChartsSeriesDataDto weekUpMoneySeriesData = new EChartsSeriesDataDto();
//        weekUpMoneySeriesData.setData(weekUpMoneyData);
//        weekUpMoneySeriesData.setName("上分");
//        weekUpMoneySeriesData.setType("line");
//        EChartsSeriesDataDto weekDownMoneySeriesData = new EChartsSeriesDataDto();
//        weekDownMoneySeriesData.setData(weekDownMoneyData);
//        weekDownMoneySeriesData.setName("下分");
//        weekDownMoneySeriesData.setType("line");
//
//        List<EChartsSeriesDataDto> upDownMoneyEchartSeriesList = new ArrayList<>();
//        upDownMoneyEchartSeriesList.add(weekUpMoneySeriesData);
//        upDownMoneyEchartSeriesList.add(weekDownMoneySeriesData);
//        respVO.setUpDownMoneyEchartSeries(upDownMoneyEchartSeriesList);
        return respVO;
    }

    @Override
    public void updateLogoImg(UpdateLogoImgReqVO vo) {
        SysConfig dbConfig = new SysConfig();
        dbConfig.setConfigKey("sys.logo.img");
        SysConfig retConfig = configMapper.selectConfig(dbConfig);
        if(retConfig == null){
            retConfig = new SysConfig();
            retConfig.setConfigName("LOGO图片地址");
            retConfig.setConfigKey("sys.logo.img");
            retConfig.setConfigValue(vo.getLogoImg());
            retConfig.setConfigType("Y");
            configService.insertConfig(retConfig);
        }else{
            retConfig.setConfigValue(vo.getLogoImg());
            configService.updateConfig(retConfig);
        }
    }

    @Override
    public List<VirtuallyGameRecordRespVO> getVirtuallyRecordList(VirtuallyRecordListReqVO vo) {
        return betRecordMapper.getVirtuallyRecordList(vo.getGameId(), vo.getPeriods(), vo.getLastBetRecordId());
    }

    @Override
    public List<CashbackReportRespVO> getCashbackReportList(Long userId, CashbackComissionReportReqVO vo) {
        return userwinMapper.selectCashbackReportLis(userId, vo.getFilterDay());
    }

    @Override
    public List<CommissionReportRespVO> getCommissionReportList(Long userId, CashbackComissionReportReqVO vo) {
        return userwinMapper.selectCommissionReportLis(userId, vo.getFilterDay());
    }

    @Override
    public void updateChatImg(UpdateLogoImgReqVO vo) {
        SysConfig wechatDbConfig = new SysConfig();
        wechatDbConfig.setConfigKey("sys.wechat.img");
        SysConfig wechatRetConfig = configMapper.selectConfig(wechatDbConfig);
        if(wechatRetConfig == null){
            wechatRetConfig = new SysConfig();
            wechatRetConfig.setConfigName("微信客服图片地址");
            wechatRetConfig.setConfigKey("sys.wechat.img");
            wechatRetConfig.setConfigValue(vo.getWechatImg());
            wechatRetConfig.setConfigType("Y");
            configService.insertConfig(wechatRetConfig);
        }else{
            wechatRetConfig.setConfigValue(vo.getWechatImg());
            configService.updateConfig(wechatRetConfig);
        }

        SysConfig qqChatConfig = new SysConfig();
        qqChatConfig.setConfigKey("sys.qqchat.img");
        SysConfig qqChatRetConfig = configMapper.selectConfig(qqChatConfig);
        if(qqChatRetConfig == null){
            qqChatRetConfig = new SysConfig();
            qqChatRetConfig.setConfigName("LOGO图片地址");
            qqChatRetConfig.setConfigKey("sys.qqchat.img");
            qqChatRetConfig.setConfigValue(vo.getQqChatImg());
            qqChatRetConfig.setConfigType("Y");
            configService.insertConfig(qqChatRetConfig);
        }else{
            qqChatRetConfig.setConfigValue(vo.getQqChatImg());
            configService.updateConfig(qqChatRetConfig);
        }
    }

    @Override
    public List<String> getOpenData(String gameType) {
        List<String> openCode = new ArrayList<>();
        Random random = new Random();
        if(StringUtils.equals("10",gameType)){
            // 10球
            String[] predefinedCodes = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10"};
            openCode.addAll(java.util.Arrays.asList(predefinedCodes));
            Collections.shuffle(openCode); // 随机排序
        }else if(StringUtils.equals("3",gameType)){
            // 3球
            for (int i = 0; i < 3; i++) {
                openCode.add(String.valueOf(random.nextInt(10))); // 生成0-9之间的随机数
            }
        }else if(StringUtils.equals("5",gameType)){
            // 5球
            for (int i = 0; i < 5; i++) {
                openCode.add(String.valueOf(random.nextInt(10))); // 生成0-9之间的随机数
            }
        }
        return openCode;
    }

    @Override
    public void updateSiteSetting(UpdateSiteSettingReqVO vo) {
//        SysConfig dbConfig = new SysConfig();
//        dbConfig.setConfigKey("sys.site.openFlg");
//        SysConfig retConfig = configMapper.selectConfig(dbConfig);
//        if(retConfig == null){
//            retConfig = new SysConfig();
//            retConfig.setConfigName("站点开关");
//            retConfig.setConfigKey("sys.site.openFlg");
//            retConfig.setConfigValue(vo.isSiteOpenFlg().toString());
//            retConfig.setConfigType("Y");
//            configService.insertConfig(retConfig);
//        }else{
//            retConfig.setConfigValue(vo.isSiteOpenFlg().toString());
//            configService.updateConfig(retConfig);
//        }
        updateAndInsertConfigInfo("站点开关", "sys.site.openFlg",vo.isSiteOpenFlg().toString());
        updateAndInsertConfigInfo("最小充值金额", "sys.change.min",vo.getMinChargeMoney().toString());
        updateAndInsertConfigInfo("最小提现金额", "sys.postal.min",vo.getMinPostalMoney().toString());
        updateAndInsertConfigInfo("每日提现次数", "sys.postal.maxCnt",vo.getPostalMaxCnt().toString());
        updateAndInsertConfigInfo("app首页公告内容", "sys.app.home.appHomeAnnouncement",vo.getAppHomeAnnouncement().toString());
        updateAndInsertConfigInfo("轮播公告内容", "sys.app.home.notice",vo.getAppHomeNotice().toString());
        updateAndInsertConfigInfo("官方开奖URL", "sys.opengame.url",vo.getOpenRecordUrl().toString());
        updateAndInsertConfigInfo("网站唯一标识ID", "sys.web.type",vo.getWebType().toString());
        updateAndInsertConfigInfo("网站名称", "sys.web.name",vo.getWebName().toString());
        updateAndInsertConfigInfo("微信appId", "sys.wechat.appId",vo.getWechatAppId().toString());
        updateAndInsertConfigInfo("微信appSecret", "sys.wechat.appSecret",vo.getWechatAppSecret().toString());
        updateAndInsertConfigInfo("授权域名", "sys.wechat.authUrl",vo.getWechatAuthUrl().toString());
        updateAndInsertConfigInfo("客服端聊天地址", "sys.im.kefuUrl",vo.getKefuImUrl());
        updateAndInsertConfigInfo("玩家端聊天地址", "sys.im.appUrl",vo.getAppImUrl());
        updateAndInsertConfigInfo("二维码服务器IP", "sys.web.qrServer",vo.getQrServerUrl());
        updateAndInsertConfigInfo("自开彩种赢亏比率", "sys.game.winRate",vo.getSystemGameWinRate().toString());

        updateAndInsertConfigInfo("阿里云IP查询AppCode", "sys.ali.cloudApiCode",vo.getAliCloudApiCode());
        updateAndInsertConfigInfo("拒绝访问省份", "sys.refuse.province",vo.getRefuseProvince());
        updateAndInsertConfigInfo("拒绝访问城市", "sys.refuse.city",vo.getRefuseCity());
        updateAndInsertConfigInfo("拒绝访问服务商", "sys.refuse.isp",vo.getRefuseIsp());

        updateAndInsertConfigInfo("微信拦截状态接口Code", "sys.wxAutoCheck.apiCode",vo.getWxAutoCheckApiCode());
        // 刷新缓存
        configService.resetConfigCache();
    }

    public void updateAndInsertConfigInfo(String configName, String configKey, String configValue){

        SysConfig dbConfig = new SysConfig();
        dbConfig.setConfigKey(configKey);
        SysConfig retConfig = configMapper.selectConfig(dbConfig);
        if(retConfig == null){
            retConfig = new SysConfig();
            retConfig.setConfigName(configName);
            retConfig.setConfigKey(configKey);
            retConfig.setConfigValue(configValue);
            retConfig.setConfigType("N");
            configService.insertConfig(retConfig);
        }else{
            if(StringUtils.isNotEmpty(configValue)){
                retConfig.setConfigValue(configValue);
                configService.updateConfig(retConfig);
            }else{
                Long[] configIds = {retConfig.getConfigId()};
                configService.deleteConfigByIds(configIds);
            }
        }
    }

    @Override
    public String checkIpAddressValid(CheckIpAddressValidReqVO vo) {
        String checkResult = "0";
        String cacheKey = "CHECK_IP-";
        String configValue = Convert.toStr(redisCache.getCacheObject(cacheKey + vo.getIpAddress()));
        String reponseResult ="";
        if (StringUtils.isNotEmpty(configValue)){
            reponseResult = configValue;
        }else{
            reponseResult = getIpAddress(vo.getIpAddress());
        }

        System.out.println(new Date() + " ApiResult : " + reponseResult);

        if(StringUtils.isNotEmpty(reponseResult)){
            redisCache.setCacheObject(cacheKey + vo.getIpAddress(), reponseResult);

            JSONObject resultJson = JSONObject.parseObject(reponseResult);
            if(resultJson != null && resultJson.getInteger("code").compareTo(200) == 0 && resultJson.getJSONObject("data") != null){
//                ipaddrCity = resultJson.getString("city");
                JSONObject dataJson = resultJson.getJSONObject("data");
                String country = dataJson.getString("country");
                String region = dataJson.getString("region");
                String city = dataJson.getString("city");
                String isp = dataJson.getString("isp");

                if(!StringUtils.equals(country,"中国")){
                    checkResult = "0";
                }else{
                    String refuseProvinceArg = configService.selectConfigByKey("sys.refuse.province");
                    String refuseCityArg = configService.selectConfigByKey("sys.refuse.city");
                    String refuseIspArg = configService.selectConfigByKey("sys.refuse.isp");
                    List<String> refuseProvinceList = new ArrayList<>();
                    List<String> refuseCityList = new ArrayList<>();
                    List<String> refuseIspList = new ArrayList<>();

                    if(StringUtils.isNotEmpty(refuseProvinceArg)){
                        refuseProvinceList = Arrays.asList(refuseProvinceArg.split(","));
                    }
                    if(StringUtils.isNotEmpty(refuseCityArg)){
                        refuseCityList = Arrays.asList(refuseCityArg.split(","));
                    }
                    if(StringUtils.isNotEmpty(refuseIspArg)){
                        refuseIspList = Arrays.asList(refuseIspArg.split(","));
                    }

                    if(refuseProvinceList.contains(region)
                            || refuseCityList.contains(city)
                            || refuseIspList.contains(isp)){
                        checkResult = "0";
                    }else{
                        checkResult = "1";
                    }
                }
            }
        }

        return checkResult;
    }

    public String getIpAddress(String ipAddress){
        String host = "https://ipaddquery.market.alicloudapi.com";
        String path = "/ip/address-query";
        String method = "POST";
        String appcode = configService.selectConfigByKey("sys.ali.cloudApiCode");
        Map<String, String> headers = new HashMap<String, String>();
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        //根据API的要求，定义相对应的Content-Type
        headers.put("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        Map<String, String> querys = new HashMap<String, String>();
        Map<String, String> bodys = new HashMap<String, String>();
        bodys.put("ip", ipAddress);
        String reponseResult = "";
        try {
            /**
             * 重要提示如下:
             * HttpUtils请从
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
             * 下载
             *
             * 相应的依赖请参照
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
             */
            HttpResponse response = NewHttpUtils.doPost(host, path, method, headers, querys, bodys);
            System.out.println(response.toString());
            //获取response的body
            HttpEntity entity = response.getEntity();
            if (entity != null) {
                String content = EntityUtils.toString(entity);
                // 处理内容
                return content;
            }
//            System.out.println(EntityUtils.toString(response.getEntity()));
//            return EntityUtils.toString(response.getEntity());
//            reponseResult = response.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reponseResult;
    }

    @Override
    public void autoModifyValidDomainUrl() {
        SysLandingDomain searchUserLandingDomain = new SysLandingDomain();
        searchUserLandingDomain.setStatus("0"); //有效
        searchUserLandingDomain.setDelFlag("0"); //未删除
        List<SysLandingDomain> validDomainList = sysLandingDomainService.selectSysLandingDomainList(searchUserLandingDomain);
        if(validDomainList.size() < 1){
            return;
        }
//        if(validDomainList.size() <= 1){
//            return;
//        }
//        String checkHostArg = "";
//        for(SysLandingDomain sysLandingDomain : validDomainList){
//            if(StringUtils.isNotEmpty(checkHostArg)){
//                checkHostArg = checkHostArg + ",";
//            }
//            String checkDomainUrl = sysLandingDomain.getLandingDomainUrl().replace("http://","").replace("https://","");
//            checkHostArg = checkHostArg + checkDomainUrl;
//        }
        Boolean checkResult = true;
        String appcode = configService.selectConfigByKey("sys.wxAutoCheck.apiCode");
        if(validDomainList.size() > 0){
            SysLandingDomain sysLandingDomain = validDomainList.get(0);
            String checkDomainUrl = sysLandingDomain.getLandingDomainUrl().replace("http://","").replace("https://","");
            String ipCheckResultStr = HttpUtils.sendGet(apiUrl.replace("{0}", appcode).replace("{1}", checkDomainUrl));
            if (StringUtils.isNotEmpty(ipCheckResultStr)) {
                JSONObject obj = JSON.parseObject(ipCheckResultStr);
                String data = obj.getString("data");
                if (StringUtils.isNotEmpty(data)) {
                    JSONObject domainResultJson = JSON.parseObject(data);
                    String domainResult = domainResultJson.getString(checkDomainUrl);
                    if(StringUtils.isNotEmpty(domainResult) && !StringUtils.equals(domainResult,"1") && !StringUtils.equals(domainResult,"3")){
                        System.out.println("微信拦截状态【" + checkDomainUrl + "】:  " + ipCheckResultStr);
                        checkResult = false;
                        sysLandingDomain.setDelFlag("1");
                        sysLandingDomain.setUpdateBy("task");
                        sysLandingDomainService.updateSysLandingDomain(sysLandingDomain);

                        sysLandingDomainService.updateMainUrlToQrServer();
                    }
                }
            }
        }else{
            return;
        }

        if(!checkResult && validDomainList.size() >1){
            autoModifyValidDomainUrl();
        }
//        Boolean checkResult = false;
//        if (StringUtils.isNotEmpty(ipCheckResultStr)) {
//            JSONObject obj = JSON.parseObject(ipCheckResultStr);
//            String data = obj.getString("data");
//            if (StringUtils.isNotEmpty(data)) {
//                JSONObject domainResultJson = JSON.parseObject(data);
//                for(SysLandingDomain sysLandingDomain : validDomainList){
//                    String domainResult = domainResultJson.getString(sysLandingDomain.getLandingDomainUrl().replace("http://","").replace("https://",""));
//                    if(StringUtils.isNotEmpty(domainResult)  && StringUtils.equals(domainResult,"1")){
//                        sysLandingDomain.setStatus("0");
//                        sysLandingDomain.setDelFlag("0");
//                        checkResult = true;
//                    }else{
//                        sysLandingDomain.setDelFlag("1");
//                    }
//                    sysLandingDomainService.updateSysLandingDomain(sysLandingDomain);
//                }
//            }
//        }
//        if(!checkResult){
//            SysLandingDomain lastSysLandingDomain = validDomainList.get(validDomainList.size()-1);
//            lastSysLandingDomain.setStatus("0");
//            lastSysLandingDomain.setDelFlag("0");
//            sysLandingDomainService.updateSysLandingDomain(lastSysLandingDomain);
//        }
//        sysLandingDomainService.updateMainUrlToQrServer();
//        appcode = "e15f1ab30cf671b1b75763ef10945418";
//        for(int i = 0; i<validDomainList.size()-1;i++){
//            SysLandingDomain sysLandingDomain = validDomainList.get(i);
//            String checkDomainUrl = sysLandingDomain.getLandingDomainUrl().replace("http://","").replace("https://","");
//
//            String ipCheckResultStr = HttpUtils.sendGet(apiUrl.replace("{0}", appcode).replace("{1}", checkDomainUrl));
//            checkResult = false;
//            if (StringUtils.isNotEmpty(ipCheckResultStr)){
//                JSONObject obj = JSON.parseObject(ipCheckResultStr);
//                String data = obj.getString("data");
//                if(StringUtils.isNotEmpty(data)){
//                    JSONObject domainResultJson = JSON.parseObject(data);
//                    String domainResult = domainResultJson.getString(checkDomainUrl);
//                    if(StringUtils.isNotEmpty(domainResult)  && StringUtils.equals(domainResult,"1")){
//                        checkResult = true;
//                    }
//                }
//
//            }
//            if(checkResult){
//                sysLandingDomain.setStatus("0");
//            }else{
//                sysLandingDomain.setDelFlag("1");
//            }
//            sysLandingDomainService.updateSysLandingDomain(sysLandingDomain);
//
//            if(checkResult){
//                sysLandingDomainService.updateMainUrlToQrServer();
//                return;
//            }
//        }

//        if(!checkResult){
//            sysLandingDomainService.updateMainUrlToQrServer();
//        }
    }

    @Override
    public GameLimitSettingRespVO getGameLimitSetting(){
        GameLimitSettingRespVO respVO = new GameLimitSettingRespVO();

        SysDictData searchThreeBallGameLimitSettinga = new SysDictData();
        searchThreeBallGameLimitSettinga.setStatus("0");
        searchThreeBallGameLimitSettinga.setDictType("limit_amount_three");
        List<SysDictData> threeBallGameLimitSettingList = dictDataService.selectDictDataList(searchThreeBallGameLimitSettinga);
        Map<String , SysDictData> threeBallGameLimiSettingMap = threeBallGameLimitSettingList.stream()
                .collect(Collectors.toMap(
                        SysDictData::getDictValue,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        respVO.setThreeBallBetSpecialAmount(getLimitSettingByKey(threeBallGameLimiSettingMap,"big_special"));
        respVO.setThreeBallBetNumCount(getLimitSettingByKey(threeBallGameLimiSettingMap,"num_count"));
        respVO.setThreeBallMinBetAmount(getLimitSettingByKey(threeBallGameLimiSettingMap,"small_num"));
        respVO.setThreeBallMaxSumBetAmount(getLimitSettingByKey(threeBallGameLimiSettingMap,"sum_max"));
        respVO.setThreeBallBetNumAmount(getLimitSettingByKey(threeBallGameLimiSettingMap,"b_num1"));
        respVO.setThreeBallBetDxdsAmount(getLimitSettingByKey(threeBallGameLimiSettingMap,"b_num2"));
        respVO.setThreeBallBetMuchAmount(getLimitSettingByKey(threeBallGameLimiSettingMap,"b_num3"));
        respVO.setThreeBallBetCombinationAmount(getLimitSettingByKey(threeBallGameLimiSettingMap,"b_num4"));
        respVO.setThreeBallBetBoseAmount(getLimitSettingByKey(threeBallGameLimiSettingMap,"b_num5"));
        respVO.setThreeBallBetSdbAmount(getLimitSettingByKey(threeBallGameLimiSettingMap,"b_num6"));

        SysDictData searchFiveBallGameLimitSettinga = new SysDictData();
        searchFiveBallGameLimitSettinga.setStatus("0");
        searchFiveBallGameLimitSettinga.setDictType("limit_amount_five");
        List<SysDictData> fiveBallGameLimitSettingList = dictDataService.selectDictDataList(searchFiveBallGameLimitSettinga);
        Map<String , SysDictData> fiveBallGameLimiSettingMap = fiveBallGameLimitSettingList.stream()
                .collect(Collectors.toMap(
                        SysDictData::getDictValue,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));
        respVO.setFiveBallMinBetAmount(getLimitSettingByKey(fiveBallGameLimiSettingMap,"small_num"));
        respVO.setFiveBallMaxSumBetAmount(getLimitSettingByKey(fiveBallGameLimiSettingMap,"sum_max"));
        respVO.setFiveBallBetHeAmount(getLimitSettingByKey(fiveBallGameLimiSettingMap,"big_special_he"));
        respVO.setFiveBallBetDxdslhAmount(getLimitSettingByKey(fiveBallGameLimiSettingMap,"big_dxds"));
        respVO.setFiveBallBetNumAmount(getLimitSettingByKey(fiveBallGameLimiSettingMap,"big_num"));
        respVO.setFiveBallBetQzhAmount(getLimitSettingByKey(fiveBallGameLimiSettingMap,"big_special"));

        SysDictData searchTenBallGameLimitSettinga = new SysDictData();
        searchTenBallGameLimitSettinga.setStatus("0");
        searchTenBallGameLimitSettinga.setDictType("limit_amount_ten");
        List<SysDictData> tenBallGameLimitSettingList = dictDataService.selectDictDataList(searchTenBallGameLimitSettinga);
        Map<String , SysDictData> tenBallGameLimiSettingMap = tenBallGameLimitSettingList.stream()
                .collect(Collectors.toMap(
                        SysDictData::getDictValue,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));
        respVO.setTenBallMinBetAmount(getLimitSettingByKey(tenBallGameLimiSettingMap,"small_num"));
        respVO.setTenBallMaxSumBetAmount(getLimitSettingByKey(tenBallGameLimiSettingMap,"sum_max"));
        respVO.setTenBallBetSpecialNumAmount(getLimitSettingByKey(tenBallGameLimiSettingMap,"big_num_special"));
        respVO.setTenBallBetOtherNumAmount(getLimitSettingByKey(tenBallGameLimiSettingMap,"sum_num_special"));
        respVO.setTenBallBetDxdslhAmount(getLimitSettingByKey(tenBallGameLimiSettingMap,"big_dxds"));
        respVO.setTenBallBetNumAmount(getLimitSettingByKey(tenBallGameLimiSettingMap,"big_num"));
        respVO.setTenBallBetNumCount(getLimitSettingByKey(tenBallGameLimiSettingMap,"num_count"));
        return respVO;
    }

    @Override
    public void updatGameLimitSetting(GameLimitSettingUpdateReqVO vo) {

        SysDictData searchThreeBallGameLimitSettinga = new SysDictData();
        searchThreeBallGameLimitSettinga.setStatus("0");
        searchThreeBallGameLimitSettinga.setDictType("limit_amount_three");
        List<SysDictData> threeBallGameLimitSettingList = dictDataService.selectDictDataList(searchThreeBallGameLimitSettinga);
        Map<String , SysDictData> threeBallGameLimiSettingMap = threeBallGameLimitSettingList.stream()
                .collect(Collectors.toMap(
                        SysDictData::getDictValue,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        upateOrInsertLimitSettingByKey(threeBallGameLimiSettingMap,"big_special", vo.getThreeBallBetSpecialAmount(), "limit_amount_three", "特殊号码限额");
        upateOrInsertLimitSettingByKey(threeBallGameLimiSettingMap,"num_count", vo.getThreeBallBetNumCount(), "limit_amount_three", "号码投注个数（为0不限制投注个数）");
        upateOrInsertLimitSettingByKey(threeBallGameLimiSettingMap,"small_num", vo.getThreeBallMinBetAmount(), "limit_amount_three", "最小下注额度");
        upateOrInsertLimitSettingByKey(threeBallGameLimiSettingMap,"sum_max", vo.getThreeBallMaxSumBetAmount(), "limit_amount_three", "下注总额度");
        upateOrInsertLimitSettingByKey(threeBallGameLimiSettingMap,"b_num1", vo.getThreeBallBetNumAmount(), "limit_amount_three", "投注数字限额");
        upateOrInsertLimitSettingByKey(threeBallGameLimiSettingMap,"b_num2", vo.getThreeBallBetDxdsAmount(), "limit_amount_three", "投注大小单双限额");
        upateOrInsertLimitSettingByKey(threeBallGameLimiSettingMap,"b_num3", vo.getThreeBallBetMuchAmount(), "limit_amount_three", "投注极值限额");
        upateOrInsertLimitSettingByKey(threeBallGameLimiSettingMap,"b_num4", vo.getThreeBallBetCombinationAmount(), "limit_amount_three", "投注组合限额");
        upateOrInsertLimitSettingByKey(threeBallGameLimiSettingMap,"b_num5", vo.getThreeBallBetBoseAmount(), "limit_amount_three", "投注波色限额");
        upateOrInsertLimitSettingByKey(threeBallGameLimiSettingMap,"b_num6", vo.getThreeBallBetSdbAmount(), "limit_amount_three", "投注对顺豹限额");


        SysDictData searchFiveBallGameLimitSettinga = new SysDictData();
        searchFiveBallGameLimitSettinga.setStatus("0");
        searchFiveBallGameLimitSettinga.setDictType("limit_amount_five");
        List<SysDictData> fiveBallGameLimitSettingList = dictDataService.selectDictDataList(searchFiveBallGameLimitSettinga);
        Map<String , SysDictData> fiveBallGameLimiSettingMap = fiveBallGameLimitSettingList.stream()
                .collect(Collectors.toMap(
                        SysDictData::getDictValue,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        upateOrInsertLimitSettingByKey(fiveBallGameLimiSettingMap,"small_num", vo.getFiveBallMinBetAmount(), "limit_amount_five", "最小下注额度");
        upateOrInsertLimitSettingByKey(fiveBallGameLimiSettingMap,"sum_max", vo.getFiveBallMaxSumBetAmount(), "limit_amount_five", "下注总额度");
        upateOrInsertLimitSettingByKey(fiveBallGameLimiSettingMap,"big_special_he", vo.getFiveBallBetHeAmount(), "limit_amount_five", "投注和值（和）限额");
        upateOrInsertLimitSettingByKey(fiveBallGameLimiSettingMap,"big_dxds", vo.getFiveBallBetDxdslhAmount(), "limit_amount_five", "投注大小单双龙虎限额");
        upateOrInsertLimitSettingByKey(fiveBallGameLimiSettingMap,"big_num", vo.getFiveBallBetNumAmount(), "limit_amount_five", "投注数字号码限额");
        upateOrInsertLimitSettingByKey(fiveBallGameLimiSettingMap,"big_special", vo.getFiveBallBetQzhAmount(), "limit_amount_five", "投注前中后三投限额");

        SysDictData searchTenBallGameLimitSettinga = new SysDictData();
        searchTenBallGameLimitSettinga.setStatus("0");
        searchTenBallGameLimitSettinga.setDictType("limit_amount_ten");
        List<SysDictData> tenBallGameLimitSettingList = dictDataService.selectDictDataList(searchTenBallGameLimitSettinga);
        Map<String , SysDictData> tenBallGameLimiSettingMap = tenBallGameLimitSettingList.stream()
                .collect(Collectors.toMap(
                        SysDictData::getDictValue,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));
        upateOrInsertLimitSettingByKey(tenBallGameLimiSettingMap,"small_num", vo.getTenBallMinBetAmount(), "limit_amount_ten", "最小下注额度");
        upateOrInsertLimitSettingByKey(tenBallGameLimiSettingMap,"sum_max", vo.getTenBallMaxSumBetAmount(), "limit_amount_ten", "下注总额度");
        upateOrInsertLimitSettingByKey(tenBallGameLimiSettingMap,"big_num_special", vo.getTenBallBetSpecialNumAmount(), "limit_amount_ten", "投注冠亚和特殊号码总额度");
        upateOrInsertLimitSettingByKey(tenBallGameLimiSettingMap,"sum_num_special", vo.getTenBallBetOtherNumAmount(), "limit_amount_ten", "投注冠亚和其他号码总额度");
        upateOrInsertLimitSettingByKey(tenBallGameLimiSettingMap,"big_dxds", vo.getTenBallBetDxdslhAmount(), "limit_amount_ten", "投注大小单双龙虎限额");
        upateOrInsertLimitSettingByKey(tenBallGameLimiSettingMap,"big_num", vo.getTenBallBetNumAmount(), "limit_amount_ten", "投注赛道号码限额");
        upateOrInsertLimitSettingByKey(tenBallGameLimiSettingMap,"num_count", vo.getTenBallBetNumCount(), "limit_amount_ten", "投注赛道号码个数");
    }

    private Float getLimitSettingByKey(Map<String , SysDictData> limitAmountMap, String key){
        Float limitAmount = 0f;
        if(limitAmountMap.containsKey(key)){
            limitAmount = Float.parseFloat(limitAmountMap.get(key).getDictLabel());
        }

        return limitAmount;
    }

    private void upateOrInsertLimitSettingByKey(Map<String , SysDictData> limitAmountMap, String key, Float limitAmount, String type, String remark){
        if(limitAmountMap.containsKey(key)){
            SysDictData gameLimitSetting = limitAmountMap.get(key);
            gameLimitSetting.setDictLabel(String.valueOf(limitAmount));
            dictDataService.updateDictData(gameLimitSetting);
        }else{
            SysDictData gameLimitSetting = new SysDictData();
            gameLimitSetting.setDictLabel(String.valueOf(limitAmount));
            gameLimitSetting.setDictValue(key);
            gameLimitSetting.setDictType(type);
            gameLimitSetting.setListClass("default");
            gameLimitSetting.setRemark(remark);
            dictDataService.insertDictData(gameLimitSetting);
        }
    }

    @Override
    public List<ChildReportRespVO> selectChildReportList(ChildReportReqVO vo) {
        return userwinMapper.selectChildReportList(vo.getUserId());
    }

    @Override
    public List<GameAutoBetRecord> getAutoBetScheduleList(Long userId, AutoBetScheduleListReqVO vo) {

        GameAutoBetRecord searchAutoBetRecord = new GameAutoBetRecord();
        searchAutoBetRecord.setUserId(userId);
        searchAutoBetRecord.setGameId(vo.getGameId());
        return gameAutoBetRecordService.getAutoBetScheduleList(searchAutoBetRecord);
    }

    @Override
    public int stopAutoBetSchedule(SysUser user, StopAutoBetScheduleReqVO vo){
        GameAutoBetRecord autoBetRecord = gameAutoBetRecordService.selectGameAutoBetRecordById(vo.getAutoBetId());
        autoBetRecord.setStatus("1");
        autoBetRecord.setRemark(user.getNickName() + "停止");
        autoBetRecord.setUpdateBy(user.getNickName());
        return gameAutoBetRecordService.updateGameAutoBetRecord(autoBetRecord);
    }
}
