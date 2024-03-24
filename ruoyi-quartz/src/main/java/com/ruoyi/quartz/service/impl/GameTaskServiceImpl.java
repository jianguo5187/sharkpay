package com.ruoyi.quartz.service.impl;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.quartz.domain.GameOpenDataDto;
import com.ruoyi.quartz.service.IGameTaskService;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

@Service
public class GameTaskServiceImpl implements IGameTaskService {

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private IAzxy10Service azxy10Service;

    @Autowired
    private IAzxy10kjService azxy10kjService;

    @Autowired
    private IAzxy10recordService azxy10recordService;

    @Autowired
    private IJndService jndService;

    @Autowired
    private IJnd28Service jnd28Service;

    @Autowired
    private IJssscService jssscService;

    @Autowired
    private IJsssckjService jsssckjService;

    @Autowired
    private IUserwinService userwinService;

    @Autowired
    private IUsermoneyService usermoneyService;

    @Autowired
    private IAdminwinService adminwinService;

    @Autowired
    private ISysUserService sysUserService;

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

        SysGame gameInfo = sysGameService.selectSysGameByGameMarkId(gameCode);
        if(gameInfo == null){
            throw new ServiceException("没有澳洲幸运10游戏基础表数据");
        }
        if(gameInfo.getLotteryInterval() == 0){
            throw new ServiceException("开奖间隔为空,定时开奖结算失败");
        }

        Azxy10kj existAzxy10kj = azxy10kjService.selectLastRecord("");

        Azxy10 azxy10Info = azxy10Service.selectLastRecord();

        Long jiange = 0l;
        if(azxy10Info == null){
            throw new ServiceException("澳洲幸运10没有开奖数据，请先同步开奖数据");
        }

        Azxy10kj searchAzxy10kj = new Azxy10kj();
        searchAzxy10kj.setStatus("0");
        List<Azxy10kj> notOpenAzxy10kjList = azxy10kjService.selectAzxy10kjList(searchAzxy10kj);
        if(notOpenAzxy10kjList != null && notOpenAzxy10kjList.size() > 0){
            jiange = azxy10Info.getId() - notOpenAzxy10kjList.get(0).getId();
        }

        if(jiange >= 0){
            List<Azxy10kj> azxy10kjList = azxy10kjService.selectAzxy10kjListWithStatusZeroAndLimit(azxy10Info.getId(),"0",null,"1",50);
            for (Azxy10kj azxy10kj : azxy10kjList){
                azxy10kj.setStatus("2");
                azxy10kj.setUpdateBy("lotteryAzxy10Balance");
                azxy10kjService.updateAzxy10kj(azxy10kj);
            }
            CreateAzxy10Data(gameInfo);
        }

        if(existAzxy10kj != null){
            SingleAzxy10Update(gameInfo);
            CreateAzxy10Data(gameInfo);
        }else{
            CreateAzxy10All(gameInfo);
        }
    }

    public void CreateAzxy10Data(SysGame gameInfo){
        List<Azxy10kj> azxy10kjList = azxy10kjService.selectAzxy10kjListWithStatusZeroAndLimit(null,"0",null,"1",null);
        if(azxy10kjList.size() == 2){
            return;
//            throw new ServiceException("CreateAzxy10Data return false1");
        }
        Azxy10 azxy10Info = azxy10Service.selectLastRecord();
        if(azxy10Info == null){
            throw new ServiceException("CreateAzxy10Data return false2");
        }
        Azxy10kj firstAzxy10kj = azxy10kjService.selectAzxy10kjById(azxy10Info.getId() + 1);

        Azxy10kj newAzxy10kj = new Azxy10kj();
        newAzxy10kj.setStatus("0");
        newAzxy10kj.setCreateBy("CreateAzxy10Data");

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(azxy10Info.getTime());

        if(azxy10kjList.size() == 0 && firstAzxy10kj == null){
            newAzxy10kj.setId(azxy10Info.getId() + 1);

            //预计开奖时间
            calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval());
            newAzxy10kj.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newAzxy10kj.setBetTime(calendar.getTime());
        }else if(azxy10kjList.size() == 1 && firstAzxy10kj != null){
            Azxy10kj secondAzxy10kj = azxy10kjService.selectAzxy10kjById(azxy10Info.getId() + 2);
            if(secondAzxy10kj != null){
                throw new ServiceException("CreateAzxy10Data return false3 ID: " + (azxy10Info.getId() + 2));
            }
            newAzxy10kj.setId(azxy10Info.getId() + 2);

            //预计开奖时间
            calendar.add(Calendar.SECOND, gameInfo.getLotteryInterval()*2);
            newAzxy10kj.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newAzxy10kj.setBetTime(calendar.getTime());
        }else{
            throw new ServiceException("CreateAzxy10Data return false4");
        }
        azxy10kjService.insertAzxy10kj(newAzxy10kj);
        CreateAzxy10Data(gameInfo);
    }

    public void CreateAzxy10All(SysGame gameInfo){
        List<Azxy10> azxy10List = azxy10Service.selectAzxy10ListByParam("1",5);
        for(Azxy10 azxy10 :azxy10List){
            Azxy10kj newAzxy10kj = new Azxy10kj();

            newAzxy10kj.setId(azxy10.getId());
            newAzxy10kj.setNum1(azxy10.getNum1());
            newAzxy10kj.setNum2(azxy10.getNum2());
            newAzxy10kj.setNum3(azxy10.getNum3());
            newAzxy10kj.setNum4(azxy10.getNum4());
            newAzxy10kj.setNum5(azxy10.getNum5());
            newAzxy10kj.setNum6(azxy10.getNum6());
            newAzxy10kj.setNum7(azxy10.getNum7());
            newAzxy10kj.setNum8(azxy10.getNum8());
            newAzxy10kj.setNum9(azxy10.getNum9());
            newAzxy10kj.setNum10(azxy10.getNum10());

            newAzxy10kj.setStatus("1");
            // 开奖时间
            newAzxy10kj.setTheTime(azxy10.getTime());

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(azxy10.getTime());
            //预计开奖时间(比实际开奖时间少10s)
            calendar.add(Calendar.SECOND, -5);
            newAzxy10kj.setPreTime(calendar.getTime());

            //封盘投注截止时间
            calendar.add(Calendar.SECOND, gameInfo.getEndTime()*-1);
            newAzxy10kj.setBetTime(calendar.getTime());

            azxy10kjService.insertAzxy10kj(newAzxy10kj);
        }

        CreateAzxy10Data(gameInfo);
    }

    public void SingleAzxy10Update(SysGame gameInfo){

        List<Azxy10kj> azxy10kjList = azxy10kjService.selectAzxy10kjListWithStatusZeroAndLimit(null,"0","1",null,1);

        if(azxy10kjList == null || azxy10kjList.size() == 0){
            return;
        }
        Azxy10kj azxy10kj = azxy10kjList.get(0);

        Azxy10 azxy10 = azxy10Service.selectAzxy10ById(azxy10kj.getId());
        if(azxy10 == null){
            return;
        }

        azxy10kj.setNum1(azxy10.getNum1());
        azxy10kj.setNum2(azxy10.getNum2());
        azxy10kj.setNum3(azxy10.getNum3());
        azxy10kj.setNum4(azxy10.getNum4());
        azxy10kj.setNum5(azxy10.getNum5());
        azxy10kj.setNum6(azxy10.getNum6());
        azxy10kj.setNum7(azxy10.getNum7());
        azxy10kj.setNum8(azxy10.getNum8());
        azxy10kj.setNum9(azxy10.getNum9());
        azxy10kj.setNum10(azxy10.getNum10());
        azxy10kj.setStatus("1"); //开奖
        azxy10kj.setTheTime(azxy10.getTime());

        int updateInt = azxy10kjService.updateAzxy10kj(azxy10kj);
        if(updateInt > 0){
            lotteryAzxy10(gameInfo, azxy10kj.getId());
            CreateAzxy10Data(gameInfo);

            // 补漏
            List<Azxy10kj> notOpenAzxy10kjList = azxy10kjService.selectAzxy10kjListWithStatusZeroAndLimit(azxy10kj.getId(),"0",null,"1",1);
            if(notOpenAzxy10kjList != null && notOpenAzxy10kjList.size() >0){
                lotteryAzxy10(gameInfo, notOpenAzxy10kjList.get(0).getId());
            }
        }
    }

    public void lotteryAzxy10(SysGame gameInfo, Long periodId){
        Azxy10record searchAzxy10Record = new Azxy10record();
        searchAzxy10Record.setStatus("0");
        searchAzxy10Record.setPeriods(periodId);
        List<Azxy10record> azxy10recordList = azxy10recordService.selectAzxy10recordList(searchAzxy10Record);

        if(azxy10recordList == null || azxy10recordList.size() == 0){
            return;
        }

        Azxy10kj azxy10kj = azxy10kjService.selectAzxy10kjById(periodId);
        Float adminWinMoney = 0f;
        String gameResult = azxy10kj.getNum1() + "+" +
                            azxy10kj.getNum2() + "+" +
                            azxy10kj.getNum3() + "+" +
                            azxy10kj.getNum4() + "+" +
                            azxy10kj.getNum5() + "+" +
                            azxy10kj.getNum6() + "+" +
                            azxy10kj.getNum7() + "+" +
                            azxy10kj.getNum8() + "+" +
                            azxy10kj.getNum9() + "+" +
                            azxy10kj.getNum10();

        for(Azxy10record azxy10record : azxy10recordList){

        }

        Adminwin todayAdminwin = adminwinService.selectTodayAdminwin(gameInfo.getGameId());
        if(todayAdminwin == null){
            todayAdminwin = new Adminwin();
            todayAdminwin.setGameId(gameInfo.getGameId());
            todayAdminwin.setGameName(gameInfo.getGameName());
            todayAdminwin.setWinMoney(adminWinMoney);
            todayAdminwin.setCreateBy("lotteryAzxy10");

            adminwinService.insertAdminwin(todayAdminwin);
        }else{
            todayAdminwin.setWinMoney(adminWinMoney +todayAdminwin.getWinMoney());
            todayAdminwin.setUpdateBy("lotteryAzxy10");
            adminwinService.updateAdminwin(todayAdminwin);
        }

//        azxy10kj.setCountMoney();
        searchAzxy10Record = new Azxy10record();
        searchAzxy10Record.setPeriods(periodId);
        List<Azxy10record> openedAzxy10recordList = azxy10recordService.selectAzxy10recordList(searchAzxy10Record);
        Float countMoney = 0f;
        Float winMoney = 0f;

        for(Azxy10record azxy10record : openedAzxy10recordList){
            countMoney += azxy10record.getCountMoney();
        }
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

    }
}
