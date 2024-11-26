package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.domain.Usermoney;
import com.ruoyi.system.domain.Userwin;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.mapper.UsermoneyMapper;
import com.ruoyi.system.mapper.UserwinMapper;
import com.ruoyi.system.service.IMyService;
import com.ruoyi.system.service.ISysGameService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class MyServiceImpl implements IMyService {


    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private UserwinMapper userwinMapper;

    @Autowired
    private UsermoneyMapper usermoneyMapper;

    @Autowired
    private ISysUserService userService;

    @Override
    public YkInfoRespVO getTodayYkInfo(Long userId) {
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        String today = sd.format(new Date());
        return getYkInfoByDate(userId,today);
    }

    @Override
    public YkInfoRespVO getYesdayYkInfo(Long userId) {
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE,-1);
        String yesday = sd.format(cal.getTime());

        return getYkInfoByDate(userId,yesday);
    }

    public YkInfoRespVO getYkInfoByDate(Long userId,String day) {

        YkInfoRespVO respVO=new YkInfoRespVO();
        List<YkDetailRespVO> gameWinList = userwinMapper.selectUserGameWinList(userId,day);

        Map<Long , YkDetailRespVO> gameWinMap = gameWinList.stream()
                .collect(Collectors.toMap(
                        YkDetailRespVO::getGameId,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        SysGame sysGame = new SysGame();
        sysGame.setStatus("0"); //有效
        List<SysGame> gameList = sysGameService.selectSysGameList(sysGame);

        List<YkDetailRespVO> ykDetailRespVOList = new ArrayList<>();
        for(SysGame gameInfo : gameList){

            YkDetailRespVO ykDetailRespVO = new YkDetailRespVO();
            ykDetailRespVO.setGameId(gameInfo.getGameId());
            ykDetailRespVO.setGameName(gameInfo.getGameName());
            if(gameWinMap.containsKey(gameInfo.getGameId())){
                ykDetailRespVO.setWinMoney(gameWinMap.get(gameInfo.getGameId()).getWinMoney());
            }else{
                ykDetailRespVO.setWinMoney(0f);
            }
            ykDetailRespVOList.add(ykDetailRespVO);
        }
        respVO.setYkDetail(ykDetailRespVOList);

        return respVO;
    }

    @Override
    public FyRespVO getFyList(Long userId, FyListReqVO vo) {

        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        String today = sd.format(new Date());
        String day = vo.getFilterDay();
        Boolean todayFlg = false;

        if(StringUtils.equals(today,day)){
            todayFlg = true;
        }


        if(StringUtils.isEmpty(vo.getFilterDay())){
            day = today;
        }

        SysGame sysGame = new SysGame();
        sysGame.setStatus("0"); //有效
        List<SysGame> gameList = sysGameService.selectSysGameList(sysGame);

        Map<Long , SysGame> gameMap = gameList.stream()
                .collect(Collectors.toMap(
                        SysGame::getGameId,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        List<SysUser> childUserList = userService.selectChildUserList(userId);
        List<FyListRespVO> fyList = new ArrayList<>();
        FyRespVO respVO = new FyRespVO();
        Float totalFyMoney = 0f;
        for(SysUser childUser : childUserList){
            FyListRespVO fyRespVO = new FyListRespVO();
            fyRespVO.setUserId(childUser.getUserId());
            fyRespVO.setNickName(childUser.getNickName());

            Float fyMoney = 0f;
            Float noFyMoney = 0f;
            Float sumMoney = 0f;
            Float bigSmall = 0f;
            Float other = 0f;
            Float deductMoney = 0f;
            Float yongJin = 0f;
            List<Userwin> uwList = userwinMapper.selectUserWinListByDay(childUser.getUserId(),null,day);
            for(Userwin userwin : uwList){

                Float gameCommission = 0f;
                if(gameMap.containsKey(userwin.getGameId())){
                    gameCommission = gameMap.get(userwin.getGameId()).getGameCommission();
                }

                bigSmall += userwin.getBigSmallMoney();
                other += userwin.getOtherMoney();
                deductMoney += userwin.getDeductMoney();
                yongJin += (bigSmall + other - deductMoney)*gameCommission / 100;
            }
            sumMoney = bigSmall + other - deductMoney;
            if(todayFlg){
                fyMoney = 0f;
                noFyMoney = yongJin;
            }else{
                fyMoney = yongJin;
                noFyMoney = 0f;
            }

            fyRespVO.setFyMoney(fyMoney);
            fyRespVO.setNoFyMoney(noFyMoney);
            fyRespVO.setSumMoney(sumMoney);
            fyList.add(fyRespVO);

            totalFyMoney = totalFyMoney + fyMoney;
        }

        respVO.setFyList(fyList);
        respVO.setTotalFyNum(totalFyMoney);
        return respVO;
    }

    @Override
    public FxRespVO getFxList(Long userId, FyListReqVO vo) {
        String day = vo.getFilterDay();

        if(StringUtils.isEmpty(vo.getFilterDay())){
            SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
            String today = sd.format(new Date());
            day = today;
        }

        SysGame sysGame = new SysGame();
        sysGame.setStatus("0"); //有效
        List<SysGame> gameList = sysGameService.selectSysGameList(sysGame);
        SysUser user = userService.selectUserById(userId);
        List<FxListRespVO> fxList = new ArrayList<>();
        FxRespVO respVO = new FxRespVO();
        Float totalFxMoney = 0f;
        Float totalLsNum = 0f;
        for(SysGame gameInfo : gameList){

            FxListRespVO fxRespVO = new FxListRespVO();
            fxRespVO.setGameId(gameInfo.getGameId());
            fxRespVO.setGameName(gameInfo.getGameName());

            Float cashback = gameInfo.getGameCashback();

            Float fxMoney = 0f;
            Float noFxMoney = 0f;
            Float sumMoney = 0f;

            // TODO
//            if(cashback != null && cashback.compareTo(0f)>0 && user.getCbPercent() != null && user.getCbPercent().compareTo(0f) >0){
//                cashback = user.getCbPercent();
//            }
            List<Userwin> uwList = userwinMapper.selectUserWinListByDay(userId, gameInfo.getGameId(), day);
            if(uwList != null && uwList.size() > 0){
                Userwin userWin = uwList.get(0);
                Float lsnum = userWin.getBetMoney() - userWin.getDeductMoney();

                totalLsNum += lsnum;
//                totalFxMoney += userWin.getRecordrebate();

                sumMoney = lsnum;
//                if(userWin.getRecordrebate() == null || userWin.getRecordrebate() == 0){
                    fxMoney = 0f;
                    noFxMoney = lsnum*cashback/100;
//                }else{
//                    fxMoney = userWin.getRecordrebate();
//                    noFxMoney = 0f;
//                }
            }
            fxRespVO.setFxMoney(fxMoney);
            fxRespVO.setNoFxMoney(noFxMoney);
            fxRespVO.setSumMoney(sumMoney);
            fxList.add(fxRespVO);
        }


        respVO.setFxList(fxList);
        respVO.setTotalFxNum(totalFxMoney);
        respVO.setTotalLsNum(totalLsNum);
        return respVO;
    }

    @Override
    public List<Usermoney> getUserMoneylList(Long userId, ChangeListReqVO vo) {
        if(StringUtils.isNull(vo.getPageNumber())){
            vo.setPageNumber(1);
        }
        if(StringUtils.isNull(vo.getPageRowCount())){
            vo.setPageRowCount(20);
        }
        return usermoneyMapper.selectValidUsermoneyList(userId, vo.getFilterDate(), vo.getType(), (vo.getPageNumber()-1)*vo.getPageRowCount(), vo.getPageRowCount());
    }

    @Override
    public void clearUsermoneyInfo(Long userId) {
       usermoneyMapper.clearUsermoneyInfo(userId);
    }

}
