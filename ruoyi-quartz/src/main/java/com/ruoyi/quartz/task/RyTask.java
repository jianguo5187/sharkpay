package com.ruoyi.quartz.task;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.domain.vo.GameOpenDataDto;
import com.ruoyi.quartz.service.IGameTaskService;
import com.ruoyi.system.service.ISysCalendarService;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysGameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 定时任务调度测试
 * 
 * @author ruoyi
 */
@Component("ryTask")
public class RyTask
{

    @Autowired
    private IGameTaskService gameTaskService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private ISysCalendarService calendarService;

    @Autowired
    private ISysGameService sysGameService;

    public void ryMultipleParams(String s, Boolean b, Long l, Double d, Integer i)
    {
        System.out.println(StringUtils.format("执行多参方法： 字符串类型{}，布尔类型{}，长整型{}，浮点型{}，整形{}", s, b, l, d, i));
    }

    public void ryParams(String params)
    {
        System.out.println("执行有参方法：" + params);
    }

    public void ryNoParams()
    {
        System.out.println("执行无参方法");
    }

    // 根据游戏code,定时获取官方开奖数据
    public void getGameExpectData(String gameType){
//        System.out.println("游戏类型: " + gameType);
        SysGame sysGame = new SysGame();
        sysGame.setStatus("0"); //有效
//        sysGame.setSystemOpenType("N"); //官方开奖
        sysGame.setGameType(gameType);

        SimpleDateFormat sd = new SimpleDateFormat("HHmm");
        String nowTime = sd.format(new Date());

        List<SysGame> gameList = sysGameService.selectSysGameList(sysGame);

        for(SysGame gameInfo : gameList){

            Integer validOpenStartTime = Integer.valueOf(gameInfo.getValidOpenStartTime());
            Integer validOpenEndTime = Integer.valueOf(gameInfo.getValidOpenEndTime()) + 1;
            //游戏停盘维护判断
            if(validOpenStartTime.compareTo(Integer.valueOf(nowTime)) > 0
                    || validOpenEndTime.compareTo(Integer.valueOf(nowTime)) < 0){
                continue;
            }

            //官方开奖
            if(StringUtils.equals(gameInfo.getSystemOpenType(),"N")){

                String url = configService.selectConfigByKey("sys.opengame.url") + gameInfo.getGameOpenCode() + "&limit=50";
                String result = HttpUtils.sendGet(url);
                JSONObject resultJson = JSONObject.parseObject(result);
                if(resultJson == null){
//                    System.out.println("获取不到开奖网站数据");
                    return ;
                }
                String data = resultJson.getString("data");
                if(StringUtils.isEmpty(data)){
                    continue;
                }
//                System.out.println(data);
                List<GameOpenDataDto> openDataList = JSONArray.parseArray(data.toString(),GameOpenDataDto.class);
                Map<Long , GameOpenDataDto> gameOpenDataDtoMap = openDataList.stream()
                        .collect(Collectors.toMap(
                                GameOpenDataDto::getExpect,
                                Function.identity(),
                                (existing, replacement) -> existing // 保留现有的值，忽略替换值
                        ));

                if(openDataList != null && openDataList.size() >0){
                    if(StringUtils.equals("10",gameType)){
                        // 10球
                        gameTaskService.saveTenBallInfoFromOfficial(gameInfo.getGameMarkId(),openDataList,gameOpenDataDtoMap);
                    }else if(StringUtils.equals("3",gameType)){
                        // 3球
                        gameTaskService.saveThreeBallInfoFromOfficial(gameInfo.getGameMarkId(),openDataList,gameOpenDataDtoMap);
                    }else if(StringUtils.equals("5",gameType)){
                        // 5球
                        gameTaskService.saveFiveBallInfoFromOfficial(gameInfo.getGameMarkId(),openDataList,gameOpenDataDtoMap);
                    }
                }
            }else{
                //系统开奖
                if(StringUtils.equals("10",gameType)){
                    // 10球
                    gameTaskService.saveTenBallInfoFromSystem(gameInfo);
                }else if(StringUtils.equals("3",gameType)){
                    // 3球
                    gameTaskService.saveThreeBallInfoFromSystem(gameInfo);
                }else if(StringUtils.equals("5",gameType)){
                    // 5球
                    gameTaskService.saveFiveBallInfoFromSystem(gameInfo);
                }
            }
        }
    }

    // 根据游戏code,定时开奖结算
    public void autoLotteryBalance(String gameType){

//        System.out.println("游戏类型: " + gameType);
        SysGame sysGame = new SysGame();
        sysGame.setStatus("0"); //有效
        sysGame.setGameType(gameType);
        List<SysGame> gameList = sysGameService.selectSysGameList(sysGame);

        SimpleDateFormat sd = new SimpleDateFormat("HHmm");
        String nowTime = sd.format(new Date());

        for(SysGame gameInfo : gameList){

            Integer validOpenStartTime = Integer.valueOf(gameInfo.getValidOpenStartTime());
            Integer validOpenEndTime = Integer.valueOf(gameInfo.getValidOpenEndTime()) + 1;
            //游戏停盘维护判断
            if(validOpenStartTime.compareTo(Integer.valueOf(nowTime)) > 0
                    || validOpenEndTime.compareTo(Integer.valueOf(nowTime)) < 0){
                continue;
            }
            if(StringUtils.equals("10",gameType)){
                // 澳洲幸运10
                gameTaskService.lotteryTenBallBalance(gameInfo.getGameMarkId());
            }else if(StringUtils.equals("3",gameType)){
                // 加拿大2.8
                gameTaskService.lotteryThreeBallBalance(gameInfo.getGameMarkId());
            }else if(StringUtils.equals("5",gameType)){
                // 急速时时彩
                gameTaskService.lotteryFiveBallBalance(gameInfo.getGameMarkId());
            }
        }
    }

    // 根据游戏code,提前系统开奖数据
    public void openSystemGameExpectData(String gameType){

//        System.out.println("游戏类型: " + gameType);
        SysGame sysGame = new SysGame();
        sysGame.setStatus("0"); //有效
        sysGame.setSystemOpenType("Y"); //本系统开奖
        sysGame.setGameType(gameType);

        SimpleDateFormat sd = new SimpleDateFormat("HHmm");
        String nowTime = sd.format(new Date());

        List<SysGame> gameList = sysGameService.selectSysGameList(sysGame);

        for(SysGame gameInfo : gameList){

            Integer validOpenStartTime = Integer.valueOf(gameInfo.getValidOpenStartTime());
            Integer validOpenEndTime = Integer.valueOf(gameInfo.getValidOpenEndTime()) + 1;
            //游戏停盘维护判断
            if(validOpenStartTime.compareTo(Integer.valueOf(nowTime)) > 0
                    || validOpenEndTime.compareTo(Integer.valueOf(nowTime)) < 0){
                continue;
            }

            //系统开奖
            if(StringUtils.equals("10",gameType)){
                // 10球
                gameTaskService.openTenBallSystemExpectData(gameInfo);
            }else if(StringUtils.equals("3",gameType)){
                // 3球
                gameTaskService.openThreeBallSystemExpectData(gameInfo);
            }else if(StringUtils.equals("5",gameType)){
                // 5球
                gameTaskService.openFiveBallSystemExpectData(gameInfo);
            }
        }
    }

    public void insertTodayCalendar()
    {
        calendarService.insertTodayCalendar();
    }

    public void insertRobotBet(){
        gameTaskService.insertRobotBet();
    }

    // 自动卡奖结算(已开奖未结算的数据可以自动结算)
    public void autoKajiangLottery(){
        gameTaskService.autoKajiangLottery();
    }

    public void autoAllRepairLottery(){
        gameTaskService.autoAllRepairLottery();
    }
}
