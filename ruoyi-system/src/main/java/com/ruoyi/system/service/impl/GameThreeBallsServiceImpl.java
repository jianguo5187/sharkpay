package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.EntityMapTransUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.mapper.BetRecordMapper;
import com.ruoyi.system.mapper.FalseUserMapper;
import com.ruoyi.system.mapper.GameOptionMapper;
import com.ruoyi.system.mapper.UsermoneyMapper;
import com.ruoyi.system.service.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class GameThreeBallsServiceImpl implements IGameThreeBallsService {
    @Autowired
    private ISysBetItemService sysBetItemService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysAppService sysAppService;

    @Autowired
    private IGameThreeballRecordService gameThreeballRecordService;

    @Autowired
    private IGameThreeballKjService gameThreeballKjService;

    @Autowired
    private ISysDictDataService dictDataService;

    @Autowired
    private BetRecordMapper betRecordMapper;

    @Autowired
    private FalseUserMapper falseUserMapper;

    @Autowired
    private UsermoneyMapper usermoneyMapper;

    @Autowired
    private GameOptionMapper gameOptionMapper;


    @Override
    public List<SysBetItem> getOddsInfo(ThreeBallsOddsReqVO vo) {
        SysBetItem searchBetItem = new SysBetItem();
        searchBetItem.setGameId(vo.getGameId());
        searchBetItem.setStatus("0");

        return sysBetItemService.selectSysBetItemList(searchBetItem);
    }

    @Override
    public ThreeBallKjRecordMoneyRespVO kjRecordMoney(Long userId, ThreeBallsOddsReqVO vo) {
        SysUser user = userService.selectUserById(userId);
        ThreeBallKjRecordMoneyRespVO respVO = new ThreeBallKjRecordMoneyRespVO();
        respVO.setMoney(user.getAmount());
        respVO.setRecordStatus("0");
        respVO.setProfitLossMoney(0f);

        GameResultListReqVO reqVO = new GameResultListReqVO();
        reqVO.setGameId(vo.getGameId());
        reqVO.setPageNumber(1);
        reqVO.setPageRowCount(1);
        List<GameResultListRespVO> threeBallsGameResultList = sysAppService.gameResultList(userId,reqVO);
        if(threeBallsGameResultList != null && threeBallsGameResultList.size() > 0){
            GameResultListRespVO threeBllsGameResult = threeBallsGameResultList.get(0);
            BeanUtils.copyProperties(threeBllsGameResult,respVO);
            respVO.setLotteryStatus("1");

            GameThreeballRecord searchGameThreeballRecord = new GameThreeballRecord();
            searchGameThreeballRecord.setGameId(vo.getGameId());
            searchGameThreeballRecord.setUserId(userId);
            searchGameThreeballRecord.setPeriods(threeBllsGameResult.getPeriods());
            List<GameThreeballRecord> gameThreeballRecordList = gameThreeballRecordService.selectGameThreeballRecordList(searchGameThreeballRecord);
            if(gameThreeballRecordList != null && gameThreeballRecordList.size() > 0){
                respVO.setRecordStatus("1");
                respVO.setProfitLossMoney(gameThreeballRecordList.get(0).getWinMoney() - gameThreeballRecordList.get(0).getCountMoney());
            }
        }else{
            respVO.setLotteryStatus("0");
        }

        return respVO;
    }

    @Override
    public ThreeBallsTimeDateRespVO timeDate(ThreeBallsOddsReqVO vo) {
        GameThreeballKj searchGameThreeballKj = new GameThreeballKj();
        ThreeBallsTimeDateRespVO respVO = new ThreeBallsTimeDateRespVO();
        searchGameThreeballKj.setGameId(vo.getGameId());
        searchGameThreeballKj.setStatus("0"); // 未开奖
        List<GameThreeballKj> gameThreeballKjList = gameThreeballKjService.selectGameThreeballKjList(searchGameThreeballKj);
        Date date = new Date();
        if(gameThreeballKjList != null && gameThreeballKjList.size() > 0){
            GameThreeballKj firstGameThreeballKj = gameThreeballKjList.get(0);
            if(firstGameThreeballKj.getPreTime().compareTo(date) > 0){
                Long preTime = firstGameThreeballKj.getPreTime().getTime() - date.getTime();
                Long betTime = firstGameThreeballKj.getBetTime().getTime() - date.getTime();
                respVO.setPeriods(firstGameThreeballKj.getPeriods());
                respVO.setGameId(firstGameThreeballKj.getGameId());
                respVO.setGameName(firstGameThreeballKj.getGameName());
                respVO.setPreTime(preTime/ 1000L);
                respVO.setBetTime(betTime/ 1000L);
            }else{
                GameThreeballKj lasterGameThreeballKj = gameThreeballKjList.get(gameThreeballKjList.size()-1);
                Long preTime = lasterGameThreeballKj.getPreTime().getTime() - date.getTime();
                Long betTime = lasterGameThreeballKj.getBetTime().getTime() - date.getTime();
                respVO.setPeriods(lasterGameThreeballKj.getPeriods());
                respVO.setGameId(lasterGameThreeballKj.getGameId());
                respVO.setGameName(lasterGameThreeballKj.getGameName());
                respVO.setPreTime(preTime/ 1000L);
                respVO.setBetTime(betTime/ 1000L);
            }
        }

        return respVO;
    }

    @Override
    public List<BetRecordListRespVO> betRecordList(Long userId, ThreeBallsBetRecordListReqVO vo) {
        if(StringUtils.isNull(vo.getPageNumber())){
            vo.setPageNumber(1);
        }
        if(StringUtils.isNull(vo.getPageRowCount())){
            vo.setPageRowCount(20);
        }
        return betRecordMapper.selectBetRecordListByPeriods(vo.getGameId(), vo.getPeriods(), (vo.getPageNumber()-1)*vo.getPageRowCount(), vo.getPageRowCount());
    }

    @Override
    public List<VirtuallyGameRecordRespVO> virtuallyGameRecord(Long userId, VirtuallyGameRecordReqVO vo) {
        List<VirtuallyGameRecordRespVO> respVO = new ArrayList<>();
        Date date = new Date();
        GameThreeballKj gameThreeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(vo.getGameId(), vo.getPeriods());

        if(gameThreeballKj.getPreTime().compareTo(date) < 0){
            return respVO;
        }
        int d = random(1,4);//生成一个0~1的随机数
        //产生虚假数据的概率，现为5分之一
        if(d <= 1) {
            List<FalseUser> falseUserList = falseUserMapper.selectFalseUserListByGameId(vo.getGameId());
            if(falseUserList != null && falseUserList.size() > 0){
                FalseUser falseUser = falseUserList.get(random(1,falseUserList.size()) - 1);

                Integer type = 0;
                String playType = "和值";
                String num = "";
                String money = "";

                String[] numArg = falseUser.getRobotBetNum().split("\\|");
                String[] moneyArg = falseUser.getRobotBetMoney().split("\\|");

                money = moneyArg[random(1,moneyArg.length)-1];

                FalseUser searchFalseUser = new FalseUser();
                List<FalseUser> allFalseUserList = falseUserMapper.selectFalseUserList(searchFalseUser);

                FalseUser virtuallyGameUser = allFalseUserList.get(random(1,allFalseUserList.size()) - 1);

                int cishu = random(3,7);
                Date now = new Date();

                for(int i=0;i<cishu;i++){

                    num = numArg[random(1,numArg.length)-1];

                    BetRecord betrecord = new BetRecord();
                    betrecord.setUserId(0l);
                    betrecord.setPeriods(vo.getPeriods());
                    betrecord.setGameId(vo.getGameId());
                    betrecord.setGameName(gameThreeballKj.getGameName());
                    betrecord.setPlayType(playType);
                    betrecord.setPlayDetail(num);
                    betrecord.setPlayGroup(type);
                    betrecord.setOption(0);
                    betrecord.setMoney(changeLongNumber(money));
                    betrecord.setBalance(0f);
                    betrecord.setAccountResult(0f);
                    betrecord.setSettleFlg("0");
                    betrecord.setGameResult("");
                    betrecord.setIsDelete("0");
                    betrecord.setIsRobot("1");
                    betrecord.setHouseId(1l);
                    betrecord.setRobotNickName(virtuallyGameUser.getUserName());
                    betrecord.setRobotPic(virtuallyGameUser.getRobotPic());
                    int insertIndex = betRecordMapper.insertBetRecord(betrecord);

                    if(insertIndex > 0){
                        VirtuallyGameRecordRespVO virtuallyGameRecord = new VirtuallyGameRecordRespVO();
                        virtuallyGameRecord.setHouse("31");
                        virtuallyGameRecord.setNickName(virtuallyGameUser.getUserName());
                        virtuallyGameRecord.setPic(virtuallyGameUser.getRobotPic());
                        virtuallyGameRecord.setStime(now);
                        virtuallyGameRecord.setNumber(num);
                        virtuallyGameRecord.setMoney(changeLongNumber(money));
                        virtuallyGameRecord.setType(type);
                        virtuallyGameRecord.setPeriods(vo.getPeriods());
                        virtuallyGameRecord.setPlayType(playType);
                        respVO.add(virtuallyGameRecord);
                    }
                }
            }
        }
        return respVO;
    }

    @Override
    public void addThreeBallsBetRecord(Long userId, ThreeBallsAddBetRecordReqVO vo) {
        Date date = new Date();
        GameThreeballKj gameThreeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(vo.getGameId(), vo.getPeriods());
        if(gameThreeballKj.getBetTime() == null || gameThreeballKj.getBetTime().compareTo(date) < 0){
            throw new ServiceException("当前期数已截止,请等待开奖后在投注");
        }
        SysUser user = userService.selectUserById(userId);
        String[] betNumberArg = vo.getNumber().split(",");
        if(user.getAmount().compareTo(vo.getMoney() * betNumberArg.length)<0){
            throw new ServiceException("用户余额不足");
        }
        GameThreeballRecord searchGameThreeballRecord = new GameThreeballRecord();
        searchGameThreeballRecord.setGameId(vo.getGameId());
        searchGameThreeballRecord.setUserId(userId);
        searchGameThreeballRecord.setPeriods(vo.getPeriods());
        searchGameThreeballRecord.setStatus("0");
        List<GameThreeballRecord> gameThreeballRecordList = gameThreeballRecordService.selectGameThreeballRecordList(searchGameThreeballRecord);

        GameThreeballRecord gameThreeballRecord = null;
        if(gameThreeballRecordList != null && gameThreeballRecordList.size() >0){
            gameThreeballRecord = gameThreeballRecordList.get(0);
        }

        SysDictData searchSysDictData = new SysDictData();
        searchSysDictData.setStatus("0");
        searchSysDictData.setDictType("limit_amount_three");
        List<SysDictData> dictDataList = dictDataService.selectDictDataList(searchSysDictData);
        Map<String , SysDictData> limitAmountMap = dictDataList.stream()
                .collect(Collectors.toMap(
                        SysDictData::getDictValue,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        GameOption searchGameOption = new GameOption();
        searchGameOption.setGameId(vo.getGameId());
        List<GameOption> gameOptionList = gameOptionMapper.selectGameOptionList(searchGameOption);
        Map<String , GameOption> gameOptionMap = gameOptionList.stream()
                .collect(Collectors.toMap(
                        GameOption::getTitle,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));


        if(gameThreeballRecord != null && getLimitAmountByKey(limitAmountMap,"sum_max").compareTo(gameThreeballRecord.getCountMoney() + vo.getMoney() * betNumberArg.length) < 0){
            throw new ServiceException("单期投注总金额不可以大于" + getLimitAmountByKey(limitAmountMap,"small_num"));
        }

        if(vo.getMoney().compareTo(getLimitAmountByKey(limitAmountMap,"small_num"))<0){
            throw new ServiceException("投注金额不可以小余" + getLimitAmountByKey(limitAmountMap,"small_num"));
        }
        Map<String, String> countMap = new HashMap<>();
        Integer numTypeCnt = 0;

        if(gameThreeballRecord != null){
            Map<String, Object> gameThreeballRecordMap = EntityMapTransUtils.entityToMap1(gameThreeballRecord);
            for(int i=0; i<=27; i++){
                if(gameThreeballRecordMap.get("num"+i) != null && (Float)gameThreeballRecordMap.get("num"+i) >0){
                    countMap.put("num"+i,i+"");
                }
            }
            for(int i=0; i<betNumberArg.length; i++){
                if(countMap.containsKey(betNumberArg[i])){
                    numTypeCnt++;
                }
            }
        }

        for(int i=0; i<betNumberArg.length; i++) {
            GameOption gameOption = gameOptionMap.get(betNumberArg[i] + "");
            if("猜数字".equals(gameOption.getPlayGroupTitle())){
                Integer numCount = limitAmountMap.get("num_count").getDictLabel() != null ? Integer.parseInt(limitAmountMap.get("num_count").getDictLabel()):0;
                if (numCount >0 && numCount.compareTo((countMap.size() + betNumberArg.length - numTypeCnt)) < 0) {
                    throw new ServiceException("投注猜数字不可以超过" + getLimitAmountByKey(limitAmountMap,"num_count"));
                }
            }
            if(gameThreeballRecord != null){
                Map<String, Object> gameThreeballRecordMap = EntityMapTransUtils.entityToMap1(gameThreeballRecord);
                String mainKey = gameOption.getKey().toLowerCase();
                String keyB = "b_num" +gameOption.getPlayGroup();
                Float recordAmount = gameThreeballRecordMap.get(mainKey) != null ? (Float) gameThreeballRecordMap.get(mainKey) : 0f;
                if(limitAmountMap.get(keyB) != null && (getLimitAmountByKey(limitAmountMap,keyB)).compareTo(vo.getMoney()+recordAmount) < 0){
                    throw new ServiceException(betNumberArg[i] + "投注金额不可以大于" + getLimitAmountByKey(limitAmountMap,keyB));
                }
                List<String> specialList = Arrays.asList("0", "1", "2", "3", "24", "25", "26", "27");
                if (specialList.contains(betNumberArg[i] + "")) {
                    if (getLimitAmountByKey(limitAmountMap,"big_special").compareTo(vo.getMoney() + recordAmount) < 0) {
                        throw new ServiceException("特殊号码投注金额不可以大于" + getLimitAmountByKey(limitAmountMap,"big_special"));
                    }
                }
            }
        }

        Float userAmount = user.getAmount();
        for(int i=0; i<betNumberArg.length; i++){

            GameOption gameOption = gameOptionMap.get(betNumberArg[i] + "");
            String key = gameOption.getKey();
            String playType = gameOption.getPlayGroupTitle();
            Integer playGroup = gameOption.getPlayGroup();

            searchGameThreeballRecord = new GameThreeballRecord();
            searchGameThreeballRecord.setGameId(vo.getGameId());
            searchGameThreeballRecord.setUserId(userId);
            searchGameThreeballRecord.setPeriods(vo.getPeriods());
            List<GameThreeballRecord> newGameThreeballRecordList = gameThreeballRecordService.selectGameThreeballRecordList(searchGameThreeballRecord);
            if(newGameThreeballRecordList != null && newGameThreeballRecordList.size() >0){
                GameThreeballRecord updateGameThreeballRecord = newGameThreeballRecordList.get(0);

                Map<String, Object> updateGameThreeballMap = EntityMapTransUtils.entityToMap1(updateGameThreeballRecord);

                Object betRecordAmountObject = updateGameThreeballMap.get(key);
                Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                Float betMoney = betRecordAmount + vo.getMoney();
                updateGameThreeballMap.put(key, betMoney);
                updateGameThreeballRecord = EntityMapTransUtils.mapToEntity1(GameThreeballRecord.class, updateGameThreeballMap);

                updateGameThreeballRecord.setCountMoney(updateGameThreeballRecord.getCountMoney() + vo.getMoney());
                updateGameThreeballRecord.setHouse(1);
                updateGameThreeballRecord.setRecordTime(date);
                gameThreeballRecordService.updateGameThreeballRecord(updateGameThreeballRecord);
            }else{
                GameThreeballRecord newGameThreeballRecord = new GameThreeballRecord();

                Map<String, Object> newGameThreeballMap = EntityMapTransUtils.entityToMap1(newGameThreeballRecord);

                Object betRecordAmountObject = newGameThreeballMap.get(key);
                Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                Float betMoney = betRecordAmount + vo.getMoney();
                newGameThreeballMap.put(key, betMoney);

                newGameThreeballRecord = EntityMapTransUtils.mapToEntity1(GameThreeballRecord.class, newGameThreeballMap);

                newGameThreeballRecord.setGameId(vo.getGameId());
                newGameThreeballRecord.setGameName(gameThreeballKj.getGameName());

                newGameThreeballRecord.setUserId(userId);
                newGameThreeballRecord.setPeriods(vo.getPeriods());
                newGameThreeballRecord.setStatus("0");
                newGameThreeballRecord.setCountMoney(vo.getMoney());
                newGameThreeballRecord.setHouse(1);
                gameThreeballRecordService.insertGameThreeballRecord(newGameThreeballRecord);
            }

            userAmount = userAmount - vo.getMoney();

            BetRecord betrecord = new BetRecord();
            betrecord.setIsRobot("0");
            betrecord.setUserId(userId);
            betrecord.setPeriods(vo.getPeriods());
            betrecord.setGameId(vo.getGameId());
            betrecord.setGameName(gameThreeballKj.getGameName());

            betrecord.setPlayType(playType);
            betrecord.setPlayDetail(betNumberArg[i]);
            betrecord.setPlayGroup(playGroup);
            betrecord.setOption(0);
            betrecord.setMoney(vo.getMoney());
            betrecord.setBalance(userAmount);
            betrecord.setAccountResult(0f);
            betrecord.setSettleFlg("0");
            betrecord.setGameResult("");
            betrecord.setIsDelete("0");
            betrecord.setHouseId(1l);
            betRecordMapper.insertBetRecord(betrecord);

            Usermoney usermoney = new Usermoney();
            usermoney.setUserId(userId);
            usermoney.setGameId(vo.getGameId());
            usermoney.setGameName(gameThreeballKj.getGameName());
            usermoney.setRemark(gameThreeballKj.getGameName() + "-" + vo.getPeriods() + playType + betNumberArg[i]);
            usermoney.setCashMoney(vo.getMoney());
            usermoney.setUserBalance(userAmount);
            usermoney.setType("7");
            usermoney.setCashContent(vo.getPeriods().toString());
            usermoneyMapper.insertUsermoney(usermoney);
        }

        user.setAmount(userAmount);
        userService.updateUserAmount(user);
    }

    @Override
    public void addThreeBallsMultiBetRecord(Long userId, ThreeBallsAddMultiBetRecordReqVO vo) {
        Date date = new Date();
        GameThreeballKj gameThreeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(vo.getGameId(), vo.getPeriods());
        if(gameThreeballKj.getBetTime() == null || gameThreeballKj.getBetTime().compareTo(date) < 0){
            throw new ServiceException("当前期数已截止,请等待开奖后在投注");
        }
        Float totalRecordMoney = 0f;
        String[] betNumberArg;
        SysUser user = userService.selectUserById(userId);

        for(ThreeBallsMultiBetRecordReqVO threeBallsMultiBetRecordReqVO : vo.getRecordList()){
            betNumberArg = threeBallsMultiBetRecordReqVO.getNumber().split(",");
            totalRecordMoney = totalRecordMoney + (threeBallsMultiBetRecordReqVO.getMoney() * betNumberArg.length);
        }

        if(user.getAmount().compareTo(totalRecordMoney)<0){
            throw new ServiceException("用户余额不足");
        }
        GameThreeballRecord searchGameThreeballRecord = new GameThreeballRecord();
        searchGameThreeballRecord.setGameId(vo.getGameId());
        searchGameThreeballRecord.setUserId(userId);
        searchGameThreeballRecord.setPeriods(vo.getPeriods());
        searchGameThreeballRecord.setStatus("0");
        List<GameThreeballRecord> gameThreeballRecordList = gameThreeballRecordService.selectGameThreeballRecordList(searchGameThreeballRecord);

        GameThreeballRecord gameThreeballRecord = null;
        if(gameThreeballRecordList != null && gameThreeballRecordList.size() >0){
            gameThreeballRecord = gameThreeballRecordList.get(0);
        }


        SysDictData searchSysDictData = new SysDictData();
        searchSysDictData.setStatus("0");
        searchSysDictData.setDictType("limit_amount_three");
        List<SysDictData> dictDataList = dictDataService.selectDictDataList(searchSysDictData);
        Map<String , SysDictData> limitAmountMap = dictDataList.stream()
                .collect(Collectors.toMap(
                        SysDictData::getDictValue,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        GameOption searchGameOption = new GameOption();
        searchGameOption.setGameId(vo.getGameId());
        List<GameOption> gameOptionList = gameOptionMapper.selectGameOptionList(searchGameOption);
        Map<String , GameOption> gameOptionMap = gameOptionList.stream()
                .collect(Collectors.toMap(
                        GameOption::getTitle,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        for(ThreeBallsMultiBetRecordReqVO threeBallsMultiBetRecordReqVO : vo.getRecordList()){

            betNumberArg = threeBallsMultiBetRecordReqVO.getNumber().split(",");
            if(gameThreeballRecord != null && getLimitAmountByKey(limitAmountMap,"sum_max").compareTo(gameThreeballRecord.getCountMoney() + threeBallsMultiBetRecordReqVO.getMoney() * betNumberArg.length) < 0){
                throw new ServiceException("单期投注总金额不可以大于" + getLimitAmountByKey(limitAmountMap,"small_num"));
            }

            if(threeBallsMultiBetRecordReqVO.getMoney().compareTo(getLimitAmountByKey(limitAmountMap,"small_num"))<0){
                throw new ServiceException("投注金额不可以小余" + getLimitAmountByKey(limitAmountMap,"small_num"));
            }
            Integer numTypeCnt = 0;
            Map<String, String> countMap = new HashMap<>();

            if(gameThreeballRecord != null){
                Map<String, Object> gameThreeballRecordMap = EntityMapTransUtils.entityToMap1(gameThreeballRecord);
                for(int i=0; i<=27; i++){
                    if(gameThreeballRecordMap.get("num"+i) != null && (Float)gameThreeballRecordMap.get("num"+i) >0){
                        countMap.put("num"+i,i+"");
                    }
                }
                for(int i=0; i<betNumberArg.length; i++){
                    if(countMap.containsKey(betNumberArg[i])){
                        numTypeCnt++;
                    }
                }
            }

            for(int i=0; i<betNumberArg.length; i++) {
                GameOption gameOption = gameOptionMap.get(betNumberArg[i] + "");
                if("猜数字".equals(gameOption.getPlayGroupTitle())){
                    Integer numCount = limitAmountMap.get("num_count").getDictLabel() != null ? Integer.parseInt(limitAmountMap.get("num_count").getDictLabel()):0;
                    if (numCount >0 && numCount.compareTo((countMap.size() + betNumberArg.length - numTypeCnt)) < 0) {
                        throw new ServiceException("投注猜数字不可以超过" + getLimitAmountByKey(limitAmountMap,"num_count"));
                    }
                }
                if(gameThreeballRecord != null){
                    Map<String, Object> gameThreeballRecordMap = EntityMapTransUtils.entityToMap1(gameThreeballRecord);
                    String mainKey = gameOption.getKey().toLowerCase();
                    String keyB = "b_num" +gameOption.getPlayGroup();
                    Float recordAmount = gameThreeballRecordMap.get(mainKey) != null ? (Float) gameThreeballRecordMap.get(mainKey) : 0f;
                    if(limitAmountMap.get(keyB) != null && (getLimitAmountByKey(limitAmountMap,keyB)).compareTo(threeBallsMultiBetRecordReqVO.getMoney()+recordAmount) < 0){
                        throw new ServiceException(betNumberArg[i] + "投注金额不可以大于" + getLimitAmountByKey(limitAmountMap,keyB));
                    }
                    List<String> specialList = Arrays.asList("0", "1", "2", "3", "24", "25", "26", "27");
                    if (specialList.contains(betNumberArg[i] + "")) {
                        if (getLimitAmountByKey(limitAmountMap,"big_special").compareTo(threeBallsMultiBetRecordReqVO.getMoney() + recordAmount) < 0) {
                            throw new ServiceException("特殊号码投注金额不可以大于" + getLimitAmountByKey(limitAmountMap,"big_special"));
                        }
                    }
                }
            }
        }

        Float userAmount = user.getAmount();
        for(ThreeBallsMultiBetRecordReqVO threeBallsMultiBetRecordReqVO : vo.getRecordList()) {
            betNumberArg = threeBallsMultiBetRecordReqVO.getNumber().split(",");
            for(int i=0; i<betNumberArg.length; i++){

                GameOption gameOption = gameOptionMap.get(betNumberArg[i] + "");
                String key = gameOption.getKey();
                String playType = gameOption.getPlayGroupTitle();
                Integer playGroup = gameOption.getPlayGroup();

                searchGameThreeballRecord = new GameThreeballRecord();
                searchGameThreeballRecord.setGameId(vo.getGameId());
                searchGameThreeballRecord.setUserId(userId);
                searchGameThreeballRecord.setPeriods(vo.getPeriods());
                List<GameThreeballRecord> newGameThreeballRecordList = gameThreeballRecordService.selectGameThreeballRecordList(searchGameThreeballRecord);
                if(newGameThreeballRecordList != null && newGameThreeballRecordList.size() >0){
                    GameThreeballRecord updateGameThreeballRecord = newGameThreeballRecordList.get(0);

                    Map<String, Object> updateGameThreeballMap = EntityMapTransUtils.entityToMap1(updateGameThreeballRecord);

                    Object betRecordAmountObject = updateGameThreeballMap.get(key);
                    Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                    Float betMoney = betRecordAmount + threeBallsMultiBetRecordReqVO.getMoney();
                    updateGameThreeballMap.put(key, betMoney);
                    updateGameThreeballRecord = EntityMapTransUtils.mapToEntity1(GameThreeballRecord.class, updateGameThreeballMap);

                    updateGameThreeballRecord.setCountMoney(updateGameThreeballRecord.getCountMoney() + threeBallsMultiBetRecordReqVO.getMoney());
                    updateGameThreeballRecord.setHouse(1);
                    updateGameThreeballRecord.setRecordTime(date);
                    gameThreeballRecordService.updateGameThreeballRecord(updateGameThreeballRecord);
                }else{
                    GameThreeballRecord newGameThreeballRecord = new GameThreeballRecord();

                    Map<String, Object> newGameThreeballMap = EntityMapTransUtils.entityToMap1(newGameThreeballRecord);

                    Object betRecordAmountObject = newGameThreeballMap.get(key);
                    Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                    Float betMoney = betRecordAmount + threeBallsMultiBetRecordReqVO.getMoney();
                    newGameThreeballMap.put(key, betMoney);

                    newGameThreeballRecord = EntityMapTransUtils.mapToEntity1(GameThreeballRecord.class, newGameThreeballMap);

                    newGameThreeballRecord.setGameId(vo.getGameId());
                    newGameThreeballRecord.setGameName(gameThreeballKj.getGameName());

                    newGameThreeballRecord.setUserId(userId);
                    newGameThreeballRecord.setPeriods(vo.getPeriods());
                    newGameThreeballRecord.setStatus("0");
                    newGameThreeballRecord.setCountMoney(threeBallsMultiBetRecordReqVO.getMoney());
                    newGameThreeballRecord.setHouse(1);
                    gameThreeballRecordService.insertGameThreeballRecord(newGameThreeballRecord);
                }

                userAmount = userAmount - threeBallsMultiBetRecordReqVO.getMoney();

                BetRecord betrecord = new BetRecord();
                betrecord.setIsRobot("0");
                betrecord.setUserId(userId);
                betrecord.setPeriods(vo.getPeriods());
                betrecord.setGameId(vo.getGameId());
                betrecord.setGameName(gameThreeballKj.getGameName());

                betrecord.setPlayType(playType);
                betrecord.setPlayDetail(betNumberArg[i]);
                betrecord.setPlayGroup(playGroup);
                betrecord.setOption(0);
                betrecord.setMoney(threeBallsMultiBetRecordReqVO.getMoney());
                betrecord.setBalance(userAmount);
                betrecord.setAccountResult(0f);
                betrecord.setSettleFlg("0");
                betrecord.setGameResult("");
                betrecord.setIsDelete("0");
                betrecord.setHouseId(1l);
                betRecordMapper.insertBetRecord(betrecord);

                Usermoney usermoney = new Usermoney();
                usermoney.setUserId(userId);
                usermoney.setGameId(vo.getGameId());
                usermoney.setGameName(gameThreeballKj.getGameName());
                usermoney.setRemark(gameThreeballKj.getGameName() + "-" + vo.getPeriods() + playType + betNumberArg[i]);
                usermoney.setCashMoney(threeBallsMultiBetRecordReqVO.getMoney());
                usermoney.setUserBalance(userAmount);
                usermoney.setType("7");
                usermoney.setCashContent(vo.getPeriods().toString());
                usermoneyMapper.insertUsermoney(usermoney);
            }
        }

        user.setAmount(userAmount);
        userService.updateUserAmount(user);
    }

    @Override
    public void delThreeBallsBetRecord(Long userId, DelBetRecordReqVO vo) {
        SysUser user = userService.selectUserById(userId);
        Date date = new Date();
        GameThreeballKj gameThreeballKj = gameThreeballKjService.selectGameThreeballKjByPeriods(vo.getGameId(), vo.getPeriods());
        if(gameThreeballKj == null || !StringUtils.equals("0",gameThreeballKj.getStatus()) || gameThreeballKj.getBetTime().compareTo(date) <0){
            throw new ServiceException("当前期数已截止");
        }

        GameThreeballRecord searchGameThreeballRecord = new GameThreeballRecord();
        searchGameThreeballRecord.setGameId(vo.getGameId());
        searchGameThreeballRecord.setUserId(userId);
        searchGameThreeballRecord.setPeriods(vo.getPeriods());
        searchGameThreeballRecord.setStatus("0");
        List<GameThreeballRecord> gameThreeballRecordList = gameThreeballRecordService.selectGameThreeballRecordList(searchGameThreeballRecord);
        if(gameThreeballRecordList == null || gameThreeballRecordList.size() == 0){
            throw new ServiceException("本期暂无投注记录");
        }

        Usermoney searchUsermoney = new Usermoney();
        searchUsermoney.setUserId(userId);
        searchUsermoney.setGameId(vo.getGameId());
        searchUsermoney.setType("7"); //购买彩票
        searchUsermoney.setCashContent(vo.getPeriods().toString());

        List<Usermoney> userMoneyList = usermoneyMapper.selectUsermoneyList(searchUsermoney);
        if(userMoneyList == null || userMoneyList.size() == 0){
            throw new ServiceException("本期暂无投注记录");
        }
        GameThreeballRecord gameThreeballRecord = gameThreeballRecordList.get(0);
        gameThreeballRecordService.deleteGameThreeballRecordById(gameThreeballRecord.getId());

        for(Usermoney usermoney :userMoneyList){
            usermoneyMapper.deleteUsermoneyById(usermoney.getId());
        }
        user.setAmount(user.getAmount() + gameThreeballRecord.getCountMoney());
        userService.updateUserAmount(user);

        betRecordMapper.cancelBetRecordByPeriods(vo.getGameId(), vo.getPeriods(), userId);
    }
    private Float getLimitAmountByKey(Map<String , SysDictData> limitAmountMap, String key){
        Float limitAmount = 0f;
        if(limitAmountMap.containsKey(key)){
            limitAmount = Float.parseFloat(limitAmountMap.get(key).getDictLabel());
        }

        return limitAmount;
    }

    public int random(int min,int max){
        Random random = new Random();
        int s = random.nextInt(max)%(max-min+1) + min;
        return s;
    }
    public Float changeLongNumber(String floatStr){
        Float floatNum = 0f;
        try {
            floatNum = Float.parseFloat(floatStr);
        }catch (Exception e){
            floatNum = 0f;
        }
        return floatNum;
    }
}