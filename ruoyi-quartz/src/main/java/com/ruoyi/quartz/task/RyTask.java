package com.ruoyi.quartz.task;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.quartz.domain.GameOpenDataDto;
import com.ruoyi.system.domain.Azxy10;
import com.ruoyi.system.domain.Jnd;
import com.ruoyi.system.domain.Jnd28;
import com.ruoyi.system.domain.Jsssc;
import com.ruoyi.system.service.IAzxy10Service;
import com.ruoyi.system.service.IJnd28Service;
import com.ruoyi.system.service.IJndService;
import com.ruoyi.system.service.IJssscService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import com.ruoyi.common.utils.StringUtils;

import java.util.List;
import java.util.Map;
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
    private IAzxy10Service azxy10Service;

    @Autowired
    private IJndService jndService;

    @Autowired
    private IJssscService jssscService;

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

    // 根据游戏code，定时获取开奖数据
    public void getGameExpectData(String gameCode){
        System.out.println("游戏code: " + gameCode);
        String url = gameUrl + gameCode + "&limit=50";
        String result = HttpUtils.sendGet(url);
        JSONObject resultJson = JSONObject.parseObject(result);
        String data = resultJson.getString("data");
        System.out.println(data);
        List<GameOpenDataDto> openDataList = JSONArray.parseArray(data.toString(),GameOpenDataDto.class);
        Map<Long , GameOpenDataDto> gameOpenDataDtoMap = openDataList.stream().collect(Collectors.toMap(GameOpenDataDto::getExpect, dto -> dto));;

        if(openDataList != null && openDataList.size() >0){
            if(StringUtils.equals("azxy10",gameCode)){
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
            }else if(StringUtils.equals("jnd28",gameCode)){
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
            }else if(StringUtils.equals("jsscmet",gameCode)){
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
        }
    }
}
