package com.ruoyi.quartz.task;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.domain.vo.GameOpenDataDto;
import com.ruoyi.quartz.service.IGameTaskService;
import com.ruoyi.system.service.ISysCalendarService;
import com.ruoyi.system.service.ISysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

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

    // 获取官方开奖结果的URL
    @Value("${autoGame.url}")
    private String gameUrl;

    @Autowired
    private IGameTaskService gameTaskService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private ISysCalendarService calendarService;

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
    public void getGameExpectData(String gameCode){
        System.out.println("游戏code: " + gameCode);
        String url = configService.selectConfigByKey("sys.opengame.url") + gameCode + "&limit=50";
        String result = HttpUtils.sendGet(url);
        JSONObject resultJson = JSONObject.parseObject(result);
        if(resultJson == null){
            System.out.println("获取不到开奖网站数据");
            return ;
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

        if(openDataList != null && openDataList.size() >0){
            if(StringUtils.equals("azxy10",gameCode)){
                // 澳洲幸运10
                gameTaskService.saveTenBallInfoFromOfficial(gameCode,openDataList,gameOpenDataDtoMap);
            }else if(StringUtils.equals("jnd28",gameCode)){
                // 加拿大2.8
                gameTaskService.saveThreeBallInfoFromOfficial(gameCode,openDataList,gameOpenDataDtoMap);
            }else if(StringUtils.equals("jsssc",gameCode)){
                // 急速时时彩
                gameTaskService.saveFiveBallInfoFromOfficial(gameCode,openDataList,gameOpenDataDtoMap);
            }
        }
    }

    // 根据游戏code,定时开奖结算
    public void autoLotteryBalance(String gameCode){

        System.out.println("游戏code: " + gameCode);
        if(StringUtils.equals("azxy10",gameCode)){
            // 澳洲幸运10
            gameTaskService.lotteryTenBallBalance(gameCode);
        }else if(StringUtils.equals("jnd28",gameCode)){
            // 加拿大2.8
            gameTaskService.lotteryThreeBallBalance(gameCode);
        }else if(StringUtils.equals("jsssc",gameCode)){
            // 急速时时彩
            gameTaskService.lotteryFiveBallBalance(gameCode);
        }
    }

    public void insertTodayCalendar()
    {
        calendarService.insertTodayCalendar();
    }

    public void insertRobotBet(){
        gameTaskService.insertRobotBet();
    }
}
