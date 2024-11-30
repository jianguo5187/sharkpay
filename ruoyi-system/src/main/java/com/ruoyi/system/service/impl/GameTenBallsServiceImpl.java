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
import com.ruoyi.system.mapper.SysBetTypeMapper;
import com.ruoyi.system.mapper.UsermoneyMapper;
import com.ruoyi.system.service.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class GameTenBallsServiceImpl implements IGameTenBallsService {

    @Autowired
    private ISysBetItemService sysBetItemService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysAppService sysAppService;

    @Autowired
    private IGameTenballRecordService gameTenballRecordService;

    @Autowired
    private IGameTenballKjService gameTenballKjService;

    @Autowired
    private ISysDictDataService dictDataService;

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private ISysBetTypeService sysBetTypeService;

    @Autowired
    private IUserwinService userwinService;

    @Autowired
    private IGameAutoBetRecordService gameAutoBetRecordService;

    @Autowired
    private BetRecordMapper betRecordMapper;

    @Autowired
    private FalseUserMapper falseUserMapper;

    @Autowired
    private UsermoneyMapper usermoneyMapper;

    @Autowired
    private SysBetTypeMapper betTypeMapper;


    @Override
    public List<SysBetType> getOddsInfo(TenBallsOddsReqVO vo) {
        SysBetType searchBetType = new SysBetType();
        searchBetType.setGameId(vo.getGameId());
        searchBetType.setStatus("0");
        List<SysBetType> betTypeList = sysBetTypeService.selectSysBetTypeList(searchBetType).stream().map(f->{
            SysBetItem searchBetItem = new SysBetItem();
            searchBetItem.setGameId(vo.getGameId());
            searchBetItem.setStatus("0");
            searchBetItem.setBetItemType(f.getBetTypeId());

            f.setBetItemList(sysBetItemService.selectSysBetItemList(searchBetItem));
            return f;}
        ).collect(Collectors.toList());
//
//        SysBetItem searchBetItem = new SysBetItem();
//        searchBetItem.setGameId(vo.getGameId());
//        searchBetItem.setStatus("0");

        return betTypeList;
    }

    @Override
    public TenBallKjRecordMoneyRespVO kjRecordMoney(Long userId, TenBallsOddsReqVO vo) {
        SysUser user = userService.selectUserById(userId);
        TenBallKjRecordMoneyRespVO respVO = new TenBallKjRecordMoneyRespVO();
        respVO.setMoney(user.getAmount());
        respVO.setRecordStatus("0");
        respVO.setProfitLossMoney(0f);

        GameResultListReqVO reqVO = new GameResultListReqVO();
        reqVO.setGameId(vo.getGameId());
        reqVO.setPageNumber(1);
        reqVO.setPageRowCount(1);
        List<GameResultListRespVO> tenBallsGameResultList = sysAppService.gameResultList(reqVO);
        if(tenBallsGameResultList != null && tenBallsGameResultList.size() > 0){
            GameResultListRespVO tenBllsGameResult = tenBallsGameResultList.get(0);
            BeanUtils.copyProperties(tenBllsGameResult,respVO);
            respVO.setLotteryStatus("1");

            GameTenballRecord searchGameTenballRecord = new GameTenballRecord();
            searchGameTenballRecord.setGameId(vo.getGameId());
            searchGameTenballRecord.setUserId(userId);
            searchGameTenballRecord.setPeriods(tenBllsGameResult.getPeriods());
            List<GameTenballRecord> gameTenballRecordList = gameTenballRecordService.selectGameTenballRecordList(searchGameTenballRecord);
            if(gameTenballRecordList != null && gameTenballRecordList.size() > 0){
                respVO.setRecordStatus("1");
                respVO.setProfitLossMoney(gameTenballRecordList.get(0).getWinMoney() - gameTenballRecordList.get(0).getCountMoney());
            }
        }else{
            respVO.setLotteryStatus("0");
        }

        Userwin searchUserwin = new Userwin();
        searchUserwin.setGameId(vo.getGameId());
        searchUserwin.setUserId(userId);
        searchUserwin.setIncludeTestUserFlg(true);
        Map<String, Object> params = new HashMap<>();
        SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
        String today = sd.format(new Date());
        params.put("beginTime",today);
        params.put("endTime",today);
        List<CollectReportRespVO> list = userwinService.selectCollectReportLis(searchUserwin);
        if(list == null || list.size() == 0){
            respVO.setTodayGameWinMoneyTotal(0f);
        }else{
            respVO.setTodayGameWinMoneyTotal(list.get(0).getWinMoneyTotal());
        }
        respVO.setPeriodsGameWinMoneyTotal(usermoneyMapper.selectUserGameWinMoneyByPeriods(userId, vo.getGameId(), vo.getLastPeriods()));

        return respVO;
    }

    @Override
    public TenBallsTimeDateRespVO timeDate(TenBallsOddsReqVO vo) {
        GameTenballKj searchGameTenballKj = new GameTenballKj();
        TenBallsTimeDateRespVO respVO = new TenBallsTimeDateRespVO();
        searchGameTenballKj.setGameId(vo.getGameId());
        searchGameTenballKj.setStatus("0"); // 未开奖
        List<GameTenballKj> gameTenballKjList = gameTenballKjService.selectGameTenballKjList(searchGameTenballKj);
        Date date = new Date();
        if(gameTenballKjList != null && gameTenballKjList.size() > 0){
            GameTenballKj firstGameTenballKj = gameTenballKjList.get(0);
            if(firstGameTenballKj.getPreTime().compareTo(date) > 0){
                Long preTime = firstGameTenballKj.getPreTime().getTime() - date.getTime();
                Long betTime = firstGameTenballKj.getBetTime().getTime() - date.getTime();
                respVO.setPeriods(firstGameTenballKj.getPeriods());
                respVO.setGameId(firstGameTenballKj.getGameId());
                respVO.setGameName(firstGameTenballKj.getGameName());
                respVO.setPreTime(preTime/ 1000L);
                respVO.setBetTime(betTime/ 1000L);
            }else{
                int size = 0;
                if(gameTenballKjList.size() > 1){
                    size = 1;
                }
                GameTenballKj lasterGameTenballKj = gameTenballKjList.get(size);
                Long preTime = lasterGameTenballKj.getPreTime().getTime() - date.getTime();
                Long betTime = lasterGameTenballKj.getBetTime().getTime() - date.getTime();
                respVO.setPeriods(lasterGameTenballKj.getPeriods());
                respVO.setGameId(lasterGameTenballKj.getGameId());
                respVO.setGameName(lasterGameTenballKj.getGameName());
                respVO.setPreTime(preTime/ 1000L);
                respVO.setBetTime(betTime/ 1000L);
            }
        }

        return respVO;
    }

    @Override
    public List<BetRecordListRespVO> betRecordList(Long userId, TenBallsBetRecordListReqVO vo) {
//        if(StringUtils.isNull(vo.getPageNumber())){
//            vo.setPageNumber(1);
//        }
//        if(StringUtils.isNull(vo.getPageRowCount())){
//            vo.setPageRowCount(20);
//        }
        Integer pageNumber = null;
        if(StringUtils.isNotNull(vo.getPageNumber()) || StringUtils.isNotNull(vo.getPageRowCount())){
            if(StringUtils.isNull(vo.getPageNumber())){
                vo.setPageNumber(1);
            }
            if(StringUtils.isNull(vo.getPageRowCount())){
                vo.setPageRowCount(20);
            }
            pageNumber = (vo.getPageNumber()-1)*vo.getPageRowCount();
        }
        return betRecordMapper.selectBetRecordListByPeriods(vo.getGameId(), vo.getPeriods(), pageNumber, vo.getPageRowCount());
    }

    @Override
    public List<VirtuallyGameRecordRespVO> virtuallyGameRecord(Long userId, VirtuallyGameRecordReqVO vo, Boolean taskFlg) {
        List<VirtuallyGameRecordRespVO> respVO = new ArrayList<>();
        Date date = new Date();
        GameTenballKj gameTenballKj = gameTenballKjService.selectGameTenballKjByPeriods(vo.getGameId(), vo.getPeriods());

        if(gameTenballKj.getPreTime().compareTo(date) < 0){
            return respVO;
        }

        if(vo.getLastBetRecordId() != null && vo.getLastBetRecordId() > 0){
            List<VirtuallyGameRecordRespVO> dbVirtuallyRecordList  = betRecordMapper.getVirtuallyRecordList(vo.getGameId(), vo.getPeriods(), vo.getLastBetRecordId());
            respVO.addAll(dbVirtuallyRecordList);
        }

        SysGame gameInfo = sysGameService.selectSysGameByGameId(vo.getGameId());
        Random random = new Random();
        BigDecimal result = new BigDecimal(gameInfo.getRobotRate()).divide(new BigDecimal(100), 2, RoundingMode.HALF_UP);
        double virtuallyRandow = result.doubleValue();
        double randomValue = random.nextDouble();
        //产生虚假数据的概率
        if(taskFlg || randomValue < virtuallyRandow) {

            List<FalseUser> falseUserList = falseUserMapper.selectFalseUserListByGameId(vo.getGameId());
            if(falseUserList == null || falseUserList.size() == 0){
                falseUserList = falseUserMapper.selectFalseUserListByGameId(9l);
            }
            if(falseUserList != null && falseUserList.size() > 0){
                FalseUser falseUser = falseUserList.get(random(1,falseUserList.size()) - 1);

//                Integer type = 0;
//                String playType = "";
//                String num = "";
                String money = "";

//                String[] numArg = falseUser.getRobotBetNum().split("\\|");
                String[] moneyArg = falseUser.getRobotBetMoney().split("\\|");

                money = moneyArg[random(1,moneyArg.length)-1];

//                if(falseUser.getPlayType() == 0){
//                    type = 1;
//                    playType = "冠亚和";
//                }else{
//                    type = random(2,11);
//                    playType = "第" + (type - 1) + "名";
//                }
                FalseUser searchFalseUser = new FalseUser();
                List<FalseUser> allFalseUserList = falseUserMapper.selectFalseUserList(searchFalseUser);

                FalseUser virtuallyGameUser = allFalseUserList.get(random(1,allFalseUserList.size()) - 1);
                List<GameBetTypeAndItemRespVO> betTypeAndItemRespVOList = betTypeMapper.selectGameBetTypeAndItemList(vo.getGameId());

                Map<String,Integer> betTypeMap = new HashMap<>();
                betTypeMap.put("冠亚和值",1);
                betTypeMap.put("猜冠军",2);
                betTypeMap.put("猜亚军",3);
                betTypeMap.put("猜第三名",4);
                betTypeMap.put("猜第四名",5);
                betTypeMap.put("猜第五名",6);
                betTypeMap.put("猜第六名",7);
                betTypeMap.put("猜第七名",8);
                betTypeMap.put("猜第八名",9);
                betTypeMap.put("猜第九名",10);
                betTypeMap.put("猜第十名",11);

                Map<String,String> palyTypeMap = new HashMap<>();
                palyTypeMap.put("冠亚和值","冠亚和");
                palyTypeMap.put("猜冠军","第1名");
                palyTypeMap.put("猜亚军","第2名");
                palyTypeMap.put("猜第三名","第3名");
                palyTypeMap.put("猜第四名","第4名");
                palyTypeMap.put("猜第五名","第5名");
                palyTypeMap.put("猜第六名","第6名");
                palyTypeMap.put("猜第七名","第7名");
                palyTypeMap.put("猜第八名","第8名");
                palyTypeMap.put("猜第九名","第9名");
                palyTypeMap.put("猜第十名","第10名");

                int cishu = random(3,7);
                Date now = new Date();

                for(int i=0;i<cishu;i++){

//                    num = numArg[random(1,numArg.length)-1];
//                    //防止投注号码是空
//                    if(StringUtils.isEmpty(num)){
//                        num = numArg[0];
//                    }
//                    if(StringUtils.isEmpty(num)){
//                        continue;
//                    }

                    int betNumIndex = random(0,betTypeAndItemRespVOList.size()-1);
                    if(betNumIndex >= betTypeAndItemRespVOList.size()){
                        continue;
                    }
                    GameBetTypeAndItemRespVO betTypeAndItem =  betTypeAndItemRespVOList.get(betNumIndex);
                    String playType = palyTypeMap.get(betTypeAndItem.getBetTypeName());
                    int type = betTypeMap.get(betTypeAndItem.getBetTypeName());

                    BetRecord betrecord = new BetRecord();
                    betrecord.setUserId(0l);
                    betrecord.setPeriods(vo.getPeriods());
                    betrecord.setGameId(vo.getGameId());
                    betrecord.setGameName(gameTenballKj.getGameName());
                    betrecord.setPlayType(playType);
                    betrecord.setPlayDetail(betTypeAndItem.getBetItemName());
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
                        virtuallyGameRecord.setBetId(betrecord.getBetId());
                        virtuallyGameRecord.setHouse("31");
                        virtuallyGameRecord.setNickName(virtuallyGameUser.getUserName());
                        virtuallyGameRecord.setPic(virtuallyGameUser.getRobotPic());
                        virtuallyGameRecord.setStime(now);
                        virtuallyGameRecord.setNumber(betTypeAndItem.getBetItemName());
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
    public Long addTenBallsBetRecord(Long userId, TenBallsAddBetRecordReqVO vo) {
        Date date = new Date();
        GameTenballKj gameTenballKj = gameTenballKjService.selectGameTenballKjByPeriods(vo.getGameId(), vo.getPeriods());
        if(gameTenballKj.getBetTime() == null || gameTenballKj.getBetTime().compareTo(date) < 0){
            throw new ServiceException("当前期数已截止,请等待开奖后在投注");
        }
        SysUser user = userService.selectUserById(userId);
        String[] betNumberArg = vo.getNumber().split(",");
        if(user.getAmount().compareTo(vo.getMoney() * betNumberArg.length)<0){
            throw new ServiceException("用户余额不足");
        }
        GameTenballRecord searchGameTenballRecord = new GameTenballRecord();
        searchGameTenballRecord.setGameId(vo.getGameId());
        searchGameTenballRecord.setUserId(userId);
        searchGameTenballRecord.setPeriods(vo.getPeriods());
        searchGameTenballRecord.setStatus("0");
        List<GameTenballRecord> gameTenballRecordList = gameTenballRecordService.selectGameTenballRecordList(searchGameTenballRecord);

        GameTenballRecord gameTenballRecord = null;
        if(gameTenballRecordList != null && gameTenballRecordList.size() >0){
            gameTenballRecord = gameTenballRecordList.get(0);
        }

        checkBetTenBallLimitAmount(gameTenballRecord, vo.getNumber(), vo.getMoney(), vo.getType(), null);

        String playType = "";

        if(vo.getType() == 1){
            playType = "冠亚和";
        }else{
            playType = "第" + (vo.getType()-1) + "名";
        }

        Float userAmount = user.getAmount();
        Long lastBetRecordId = 0l;
        for(int i=0; i<betNumberArg.length; i++){

            searchGameTenballRecord = new GameTenballRecord();
            searchGameTenballRecord.setGameId(vo.getGameId());
            searchGameTenballRecord.setUserId(userId);
            searchGameTenballRecord.setPeriods(vo.getPeriods());
            List<GameTenballRecord> newGameTenballRecordList = gameTenballRecordService.selectGameTenballRecordList(searchGameTenballRecord);
            String columnKey = "";
            if(newGameTenballRecordList != null && newGameTenballRecordList.size() >0){
                GameTenballRecord updateGameTenballRecord = newGameTenballRecordList.get(0);

                Map<String, Object> updateGameTenballMap = EntityMapTransUtils.entityToMap1(updateGameTenballRecord);

                if(vo.getType() == 1){
                    if("单".equals(betNumberArg[i].trim())){
                        Float betMoney = updateGameTenballRecord.getType1Single() + vo.getMoney();
                        updateGameTenballRecord.setType1Single(betMoney);
                        columnKey = "type1Single";
                    }else if("双".equals(betNumberArg[i].trim())){

                        Float betMoney = updateGameTenballRecord.getType1Double() + vo.getMoney();
                        updateGameTenballRecord.setType1Double(betMoney);
                        columnKey = "type1Double";
                    }else if("大".equals(betNumberArg[i].trim())){

                        Float betMoney = updateGameTenballRecord.getType1Big() + vo.getMoney();
                        updateGameTenballRecord.setType1Big(betMoney);
                        columnKey = "type1Big";
                    }else if("小".equals(betNumberArg[i].trim())){

                        Float betMoney = updateGameTenballRecord.getType1Small() + vo.getMoney();
                        updateGameTenballRecord.setType1Small(betMoney);
                        columnKey = "type1Small";
                    }else{
                        Object betRecordAmountObject = updateGameTenballMap.get("type1Num" +betNumberArg[i].trim());
                        Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                        Float betMoney = betRecordAmount + vo.getMoney();
                        updateGameTenballMap.put("type1Num" +betNumberArg[i].trim(), betMoney);

                        updateGameTenballRecord = EntityMapTransUtils.mapToEntity1(GameTenballRecord.class, updateGameTenballMap);
                        columnKey = "type1Num" +betNumberArg[i].trim();
                    }
                }else{
                    if("单".equals(betNumberArg[i].trim())){
                        columnKey = "type"+(vo.getType()) + "Single" ;
                    }else if("双".equals(betNumberArg[i].trim())){
                        columnKey = "type"+(vo.getType()) + "Double";
                    }else if("大".equals(betNumberArg[i].trim())){
                        columnKey = "type"+(vo.getType()) + "Big";
                    }else if("小".equals(betNumberArg[i].trim())){
                        columnKey = "type"+(vo.getType()) + "Small";
                    }else if("龙".equals(betNumberArg[i].trim()) && (vo.getType()-1) < 6){
                        columnKey = "type"+(vo.getType()) + "Loong";
                    }else if("虎".equals(betNumberArg[i].trim()) && (vo.getType()-1) < 6){
                        columnKey = "type"+(vo.getType()) + "Tiger";
                    }else{
                        columnKey = "type"+(vo.getType()) + "Num" +betNumberArg[i].trim();
                    }

                    Object betRecordAmountObject = updateGameTenballMap.get(columnKey);
                    Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                    Float betMoney = betRecordAmount + vo.getMoney();
                    updateGameTenballMap.put(columnKey, betMoney);

                    updateGameTenballRecord = EntityMapTransUtils.mapToEntity1(GameTenballRecord.class, updateGameTenballMap);
                }
                updateGameTenballRecord.setCountMoney(updateGameTenballRecord.getCountMoney() + vo.getMoney());
                updateGameTenballRecord.setHouse(1);
                updateGameTenballRecord.setRecordTime(date);
                gameTenballRecordService.updateGameTenballRecord(updateGameTenballRecord);
            }else{
                GameTenballRecord newGameTenballRecord = new GameTenballRecord();

                Map<String, Object> newGameTenballMap = EntityMapTransUtils.entityToMap1(newGameTenballRecord);

                if(vo.getType() == 1){
                    if("单".equals(betNumberArg[i].trim())){
                        newGameTenballRecord.setType1Single(vo.getMoney());
                        columnKey = "type1Single";
                    }else if("双".equals(betNumberArg[i].trim())){
                        newGameTenballRecord.setType1Double(vo.getMoney());
                        columnKey = "type1Double";
                    }else if("大".equals(betNumberArg[i].trim())){
                        newGameTenballRecord.setType1Big(vo.getMoney());
                        columnKey = "type1Big";
                    }else if("小".equals(betNumberArg[i].trim())){
                        newGameTenballRecord.setType1Small(vo.getMoney());
                        columnKey = "type1Small";
                    }else{
                        Object betRecordAmountObject = newGameTenballMap.get("type1Num" +betNumberArg[i].trim());
                        Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                        Float betMoney = betRecordAmount + vo.getMoney();
                        newGameTenballMap.put("type1Num" +betNumberArg[i].trim(), betMoney);

                        newGameTenballRecord = EntityMapTransUtils.mapToEntity1(GameTenballRecord.class, newGameTenballMap);
                        columnKey = "type1Num" +betNumberArg[i].trim();
                    }
                }else{
                    if("单".equals(betNumberArg[i].trim())){
                        columnKey = "type"+(vo.getType()) + "Single";
                    }else if("双".equals(betNumberArg[i].trim())){
                        columnKey = "type"+(vo.getType()) + "Double";
                    }else if("大".equals(betNumberArg[i].trim())){
                        columnKey = "type"+(vo.getType()) + "Big";
                    }else if("小".equals(betNumberArg[i].trim())){
                        columnKey = "type"+(vo.getType()) + "Small";
                    }else if("龙".equals(betNumberArg[i].trim()) && (vo.getType()-1) < 6){
                        columnKey = "type"+(vo.getType()) + "Loong";
                    }else if("虎".equals(betNumberArg[i].trim()) && (vo.getType()-1) < 6){
                        columnKey = "type"+(vo.getType()) + "Tiger";
                    }else{
                        columnKey = "type"+(vo.getType()) + "Num" +betNumberArg[i].trim();
                    }

                    Object betRecordAmountObject = newGameTenballMap.get(columnKey);
                    Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                    Float betMoney = betRecordAmount + vo.getMoney();
                    newGameTenballMap.put(columnKey, betMoney);

                    newGameTenballRecord = EntityMapTransUtils.mapToEntity1(GameTenballRecord.class, newGameTenballMap);
                }

                newGameTenballRecord.setGameId(vo.getGameId());
                newGameTenballRecord.setGameName(gameTenballKj.getGameName());

                newGameTenballRecord.setUserId(userId);
                newGameTenballRecord.setPeriods(vo.getPeriods());
                newGameTenballRecord.setStatus("0");
                newGameTenballRecord.setCountMoney(vo.getMoney());
                newGameTenballRecord.setHouse(1);
                gameTenballRecordService.insertGameTenballRecord(newGameTenballRecord);
            }

            userAmount = userAmount - vo.getMoney();

            BetRecord betrecord = new BetRecord();
            betrecord.setIsRobot("0");
            betrecord.setUserId(userId);
            betrecord.setPeriods(vo.getPeriods());
            betrecord.setGameId(vo.getGameId());
            betrecord.setGameName(gameTenballKj.getGameName());

            betrecord.setPlayType(playType);
            betrecord.setPlayDetail(betNumberArg[i].trim());
            betrecord.setPlayGroup(vo.getType());
            betrecord.setOption(0);
            betrecord.setMoney(vo.getMoney());
            betrecord.setBalance(userAmount);
            betrecord.setAccountResult(0f);
            betrecord.setSettleFlg("0");
            betrecord.setGameResult("");
            betrecord.setIsDelete("0");
            betrecord.setHouseId(1l);
            betrecord.setRecordLotteryKey(columnKey);
            betrecord.setBetType(vo.getType());
            betrecord.setBetNumber(betNumberArg[i].trim());
            betRecordMapper.insertBetRecord(betrecord);

            Usermoney usermoney = new Usermoney();
            usermoney.setUserId(userId);
            usermoney.setGameId(vo.getGameId());
            usermoney.setGameName(gameTenballKj.getGameName());
            usermoney.setRemark("投注[" + gameTenballKj.getGameName() + "]第[" + vo.getPeriods() + "]期,投注内容[" + playType + "/" + betNumberArg[i].trim() + "],金额[" + vo.getMoney() + "]元");
            usermoney.setCashMoney(vo.getMoney());
            usermoney.setUserBalance(userAmount);
            usermoney.setType("7");
            usermoney.setCashContent(vo.getPeriods().toString());
            usermoneyMapper.insertUsermoney(usermoney);

            lastBetRecordId = betrecord.getBetId();
        }

        user.setAmount(userAmount);
        userService.updateUserAmount(user);
        return lastBetRecordId;
    }

    @Override
    public Long addTenBallsMultiBetRecord(Long userId, TenBallsAddMultiBetRecordReqVO vo) {

        SysUser user = userService.selectUserById(userId);
        Date date = new Date();
        GameTenballKj gameTenballKj = gameTenballKjService.selectGameTenballKjByPeriods(vo.getGameId(), vo.getPeriods());
        if(gameTenballKj.getBetTime() == null || gameTenballKj.getBetTime().compareTo(date) < 0){
            throw new ServiceException("当前期数已截止,请等待开奖后在投注");
        }
        Float totalRecordMoney = 0f;

        for(TenBallsMultiBetRecordReqVO tenBallsMultiBetRecordReqVO : vo.getRecordList()){
            String[] betNumberArg = tenBallsMultiBetRecordReqVO.getNumber().split(",");
            totalRecordMoney = totalRecordMoney + (tenBallsMultiBetRecordReqVO.getMoney() * betNumberArg.length);
        }
        if(user.getAmount().compareTo(totalRecordMoney)<0){
            throw new ServiceException("用户余额不足");
        }

        GameTenballRecord searchGameTenballRecord = new GameTenballRecord();
        searchGameTenballRecord.setGameId(vo.getGameId());
        searchGameTenballRecord.setUserId(userId);
        searchGameTenballRecord.setPeriods(vo.getPeriods());
        searchGameTenballRecord.setStatus("0");
        List<GameTenballRecord> gameTenballRecordList = gameTenballRecordService.selectGameTenballRecordList(searchGameTenballRecord);

        GameTenballRecord gameTenballRecord = null;
        if(gameTenballRecordList != null && gameTenballRecordList.size() >0){
            gameTenballRecord = gameTenballRecordList.get(0);
        }

        for(TenBallsMultiBetRecordReqVO tenBallsMultiBetRecordReqVO : vo.getRecordList()) {

            checkBetTenBallLimitAmount(gameTenballRecord, tenBallsMultiBetRecordReqVO.getNumber(), tenBallsMultiBetRecordReqVO.getMoney(), tenBallsMultiBetRecordReqVO.getType(), vo.getRecordList());
        }

        Float userAmount = user.getAmount();
        Long lastBetRecordId = 0l;
        for(TenBallsMultiBetRecordReqVO tenBallsMultiBetRecordReqVO : vo.getRecordList()) {
            String[] betNumberArg = tenBallsMultiBetRecordReqVO.getNumber().split(",");
            String playType = "";

            if (tenBallsMultiBetRecordReqVO.getType() == 1) {
                playType = "冠亚和";
            } else {
                playType = "第" + (tenBallsMultiBetRecordReqVO.getType() - 1) + "名";
            }

            for (int i = 0; i < betNumberArg.length; i++) {
                searchGameTenballRecord = new GameTenballRecord();
                searchGameTenballRecord.setGameId(vo.getGameId());
                searchGameTenballRecord.setUserId(userId);
                searchGameTenballRecord.setPeriods(vo.getPeriods());
                List<GameTenballRecord> newGameTenballRecordList = gameTenballRecordService.selectGameTenballRecordList(searchGameTenballRecord);
                String columnKey = "";
                if(newGameTenballRecordList != null && newGameTenballRecordList.size() >0){
                    GameTenballRecord updateGameTenballRecord = newGameTenballRecordList.get(0);

                    Map<String, Object> updateGameTenballMap = EntityMapTransUtils.entityToMap1(updateGameTenballRecord);

                    if(tenBallsMultiBetRecordReqVO.getType() == 1){
                        if("单".equals(betNumberArg[i].trim())){
                            Float betMoney = updateGameTenballRecord.getType1Single() + tenBallsMultiBetRecordReqVO.getMoney();
                            updateGameTenballRecord.setType1Single(betMoney);
                            columnKey = "type1Single";
                        }else if("双".equals(betNumberArg[i].trim())){

                            Float betMoney = updateGameTenballRecord.getType1Double() + tenBallsMultiBetRecordReqVO.getMoney();
                            updateGameTenballRecord.setType1Double(betMoney);
                            columnKey = "type1Double";
                        }else if("大".equals(betNumberArg[i].trim())){

                            Float betMoney = updateGameTenballRecord.getType1Big() + tenBallsMultiBetRecordReqVO.getMoney();
                            updateGameTenballRecord.setType1Big(betMoney);
                            columnKey = "type1Big";
                        }else if("小".equals(betNumberArg[i].trim())){

                            Float betMoney = updateGameTenballRecord.getType1Small() + tenBallsMultiBetRecordReqVO.getMoney();
                            updateGameTenballRecord.setType1Small(betMoney);
                            columnKey = "type1Small";
                        }else{
                            Object betRecordAmountObject = updateGameTenballMap.get("type1Num" +betNumberArg[i].trim());
                            Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                            Float betMoney = betRecordAmount + tenBallsMultiBetRecordReqVO.getMoney();
                            updateGameTenballMap.put("type1Num" +betNumberArg[i].trim(), betMoney);

                            updateGameTenballRecord = EntityMapTransUtils.mapToEntity1(GameTenballRecord.class, updateGameTenballMap);
                            columnKey = "type1Num" +betNumberArg[i].trim();
                        }
                    }else{
                        if("单".equals(betNumberArg[i].trim())){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType()) + "Single" ;
                        }else if("双".equals(betNumberArg[i].trim())){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType()) + "Double";
                        }else if("大".equals(betNumberArg[i].trim())){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType()) + "Big";
                        }else if("小".equals(betNumberArg[i].trim())){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType()) + "Small";
                        }else if("龙".equals(betNumberArg[i].trim()) && (tenBallsMultiBetRecordReqVO.getType()-1) < 6){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType()) + "Loong";
                        }else if("虎".equals(betNumberArg[i].trim()) && (tenBallsMultiBetRecordReqVO.getType()-1) < 6){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType()) + "Tiger";
                        }else{
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType()) + "Num" +betNumberArg[i].trim();
                        }

                        Object betRecordAmountObject = updateGameTenballMap.get(columnKey);
                        Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                        Float betMoney = betRecordAmount + tenBallsMultiBetRecordReqVO.getMoney();
                        updateGameTenballMap.put(columnKey, betMoney);

                        updateGameTenballRecord = EntityMapTransUtils.mapToEntity1(GameTenballRecord.class, updateGameTenballMap);
                    }
                    updateGameTenballRecord.setCountMoney(updateGameTenballRecord.getCountMoney() + tenBallsMultiBetRecordReqVO.getMoney());
                    updateGameTenballRecord.setHouse(1);
                    updateGameTenballRecord.setRecordTime(date);
                    gameTenballRecordService.updateGameTenballRecord(updateGameTenballRecord);
                }else{

                    GameTenballRecord newGameTenballRecord = new GameTenballRecord();

                    Map<String, Object> newGameTenballMap = EntityMapTransUtils.entityToMap1(newGameTenballRecord);

                    if(tenBallsMultiBetRecordReqVO.getType() == 1){
                        if("单".equals(betNumberArg[i].trim())){
                            newGameTenballRecord.setType1Single(tenBallsMultiBetRecordReqVO.getMoney());
                            columnKey = "type1Single";
                        }else if("双".equals(betNumberArg[i].trim())){
                            newGameTenballRecord.setType1Double(tenBallsMultiBetRecordReqVO.getMoney());
                            columnKey = "type1Double";
                        }else if("大".equals(betNumberArg[i].trim())){
                            newGameTenballRecord.setType1Big(tenBallsMultiBetRecordReqVO.getMoney());
                            columnKey = "type1Big";
                        }else if("小".equals(betNumberArg[i].trim())){
                            newGameTenballRecord.setType1Small(tenBallsMultiBetRecordReqVO.getMoney());
                            columnKey = "type1Small";
                        }else{
                            Object betRecordAmountObject = newGameTenballMap.get("type1Num" +betNumberArg[i].trim());
                            Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                            Float betMoney = betRecordAmount + tenBallsMultiBetRecordReqVO.getMoney();
                            newGameTenballMap.put("type1Num" +betNumberArg[i].trim(), betMoney);

                            newGameTenballRecord = EntityMapTransUtils.mapToEntity1(GameTenballRecord.class, newGameTenballMap);
                            columnKey = "type1Num" +betNumberArg[i].trim();
                        }
                    }else{
                        if("单".equals(betNumberArg[i].trim())){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType()) + "Single";
                        }else if("双".equals(betNumberArg[i].trim())){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType()) + "Double";
                        }else if("大".equals(betNumberArg[i].trim())){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType()) + "Big";
                        }else if("小".equals(betNumberArg[i].trim())){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType()) + "Small";
                        }else if("龙".equals(betNumberArg[i].trim()) && (tenBallsMultiBetRecordReqVO.getType()-1) < 6){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType()) + "Loong";
                        }else if("虎".equals(betNumberArg[i].trim()) && (tenBallsMultiBetRecordReqVO.getType()-1) < 6){
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType()) + "Tiger";
                        }else{
                            columnKey = "type"+(tenBallsMultiBetRecordReqVO.getType()) + "Num" +betNumberArg[i].trim();
                        }

                        Object betRecordAmountObject = newGameTenballMap.get(columnKey);
                        Float betRecordAmount = betRecordAmountObject!=null?(Float) betRecordAmountObject:0f;
                        Float betMoney = betRecordAmount + tenBallsMultiBetRecordReqVO.getMoney();
                        newGameTenballMap.put(columnKey, betMoney);

                        newGameTenballRecord = EntityMapTransUtils.mapToEntity1(GameTenballRecord.class, newGameTenballMap);
                    }

                    newGameTenballRecord.setGameId(vo.getGameId());
                    newGameTenballRecord.setGameName(gameTenballKj.getGameName());

                    newGameTenballRecord.setUserId(userId);
                    newGameTenballRecord.setPeriods(vo.getPeriods());
                    newGameTenballRecord.setStatus("0");
                    newGameTenballRecord.setCountMoney(tenBallsMultiBetRecordReqVO.getMoney());
                    newGameTenballRecord.setHouse(1);
                    gameTenballRecordService.insertGameTenballRecord(newGameTenballRecord);
                }

                userAmount = userAmount - tenBallsMultiBetRecordReqVO.getMoney();

                BetRecord betrecord = new BetRecord();
                betrecord.setIsRobot("0");
                betrecord.setUserId(userId);
                betrecord.setPeriods(vo.getPeriods());
                betrecord.setGameId(vo.getGameId());
                betrecord.setGameName(gameTenballKj.getGameName());

                betrecord.setPlayType(playType);
                betrecord.setPlayDetail(betNumberArg[i].trim());
                betrecord.setPlayGroup(tenBallsMultiBetRecordReqVO.getType());
                betrecord.setOption(0);
                betrecord.setMoney(tenBallsMultiBetRecordReqVO.getMoney());
                betrecord.setBalance(userAmount);
                betrecord.setAccountResult(0f);
                betrecord.setSettleFlg("0");
                betrecord.setGameResult("");
                betrecord.setIsDelete("0");
                betrecord.setHouseId(1l);
                betrecord.setRecordLotteryKey(columnKey);
                if(StringUtils.equals(vo.getAutoBetFlg(), "1")){
                    betrecord.setAutoBetFlg("1"); //自动追号
                    betrecord.setAutoBetRecordId(tenBallsMultiBetRecordReqVO.getAutoBetRecordId());//自动追号ID
                }
                betrecord.setBetType(tenBallsMultiBetRecordReqVO.getType());
                betrecord.setBetNumber(betNumberArg[i].trim());
                betRecordMapper.insertBetRecord(betrecord);

                Usermoney usermoney = new Usermoney();
                usermoney.setUserId(userId);
                usermoney.setGameId(vo.getGameId());
                usermoney.setGameName(gameTenballKj.getGameName());
                usermoney.setRemark("投注[" + gameTenballKj.getGameName() + "]第[" + vo.getPeriods() + "]期,投注内容[" + playType + "/" + betNumberArg[i].trim() + "],金额[" + tenBallsMultiBetRecordReqVO.getMoney() + "]元");
                usermoney.setCashMoney(tenBallsMultiBetRecordReqVO.getMoney());
                usermoney.setUserBalance(userAmount);
                usermoney.setType("7");
                usermoney.setCashContent(vo.getPeriods().toString());
                usermoneyMapper.insertUsermoney(usermoney);
                lastBetRecordId = betrecord.getBetId();
            }
        }

        user.setAmount(userAmount);
        userService.updateUserAmount(user);
        return lastBetRecordId;
    }

    @Override
    public void delTenBallsBetRecord(Long userId, DelBetRecordReqVO vo) {
        SysUser user = userService.selectUserById(userId);
        Date date = new Date();
        GameTenballKj gameTenballKj = gameTenballKjService.selectGameTenballKjByPeriods(vo.getGameId(), vo.getPeriods());
        if(gameTenballKj == null || !StringUtils.equals("0",gameTenballKj.getStatus()) || gameTenballKj.getBetTime().compareTo(date) <0){
            throw new ServiceException("当前期数已截止");
        }

        // 查询手动下注信息
//        BetRecord searchSelfBetRecord = new BetRecord();
//        searchSelfBetRecord.setUserId(userId);
//        searchSelfBetRecord.setGameId(vo.getGameId());
//        searchSelfBetRecord.setPeriods(vo.getPeriods());
//        searchSelfBetRecord.setIsDelete("0");
//        // 因为都可以撤单，所以这边代码注释掉
////        searchSelfBetRecord.setAutoBetFlg("0");//手动下注
//        List<BetRecord> selfBetRecordList = betRecordMapper.selectBetRecordList(searchSelfBetRecord);
//        if(selfBetRecordList == null || selfBetRecordList.size() == 0){
//            throw new ServiceException("本期暂无投注记录");
//        }

        GameTenballRecord searchGameTenballRecord = new GameTenballRecord();
        searchGameTenballRecord.setGameId(vo.getGameId());
        searchGameTenballRecord.setUserId(userId);
        searchGameTenballRecord.setPeriods(vo.getPeriods());
        searchGameTenballRecord.setStatus("0");
        List<GameTenballRecord> gameTenballRecordList = gameTenballRecordService.selectGameTenballRecordList(searchGameTenballRecord);
        if(gameTenballRecordList == null || gameTenballRecordList.size() == 0){
            throw new ServiceException("本期暂无投注记录");
        }
        GameTenballRecord gameTenballRecord = gameTenballRecordList.get(0);
        // 因为都可以撤单，所以直接删掉下注记录
        gameTenballRecordService.deleteGameTenballRecordById(gameTenballRecord.getId());

        // 因为都可以撤单，所以把追号任务都停了
        gameAutoBetRecordService.cancelAllAutoBetRecord(gameTenballRecord.getUserId(),gameTenballKj.getGameId());

//        Usermoney searchUsermoney = new Usermoney();
//        searchUsermoney.setUserId(userId);
//        searchUsermoney.setGameId(vo.getGameId());
//        searchUsermoney.setType("7"); //购买彩票
//        searchUsermoney.setCashContent(vo.getPeriods().toString());
//
//        List<Usermoney> userMoneyList = usermoneyMapper.selectUsermoneyList(searchUsermoney);
//        if(userMoneyList == null || userMoneyList.size() == 0){
//            throw new ServiceException("本期暂无投注记录");
//        }
//
//        for(Usermoney usermoney :userMoneyList){
//            usermoneyMapper.deleteUsermoneyById(usermoney.getId());
//        }
        user.setAmount(user.getAmount() + gameTenballRecord.getCountMoney());
        userService.updateUserAmount(user);


        Usermoney cancelBetUsermoney = new Usermoney();
        cancelBetUsermoney.setUserId(userId);
        cancelBetUsermoney.setGameId(vo.getGameId());
        cancelBetUsermoney.setGameName(gameTenballKj.getGameName());
        cancelBetUsermoney.setRemark("彩票撤单[" + gameTenballKj.getGameName() + "]第[" + vo.getPeriods() + "]期,金额[" + gameTenballRecord.getCountMoney() + "]元");
        cancelBetUsermoney.setCashMoney(gameTenballRecord.getCountMoney());
        cancelBetUsermoney.setUserBalance(user.getAmount());
        cancelBetUsermoney.setType("9");
        cancelBetUsermoney.setCashContent(vo.getPeriods().toString());
        usermoneyMapper.insertUsermoney(cancelBetUsermoney);

        // 把下注表数据状态更新为删除
        betRecordMapper.cancelBetRecordByPeriods(vo.getGameId(), vo.getPeriods(), userId, "1");
    }

    public void checkBetTenBallLimitAmount(GameTenballRecord gameTenballRecord, String number, Float money, Integer betType, List<TenBallsMultiBetRecordReqVO> multiBetRecord){
        List<String> tema = Arrays.asList("3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19");
        List<String> bigSmall = Arrays.asList("大", "小", "单", "双");
        List<String> longTiger = Arrays.asList("龙", "虎");
        List<String> rank = Arrays.asList("1", "2", "3", "4", "5", "6", "7", "8", "9", "10");
        String[] betNumberArg = number.split(",");
        SysDictData searchSysDictData = new SysDictData();
        searchSysDictData.setStatus("0");
        searchSysDictData.setDictType("limit_amount_ten");
        List<SysDictData> dictDataList = dictDataService.selectDictDataList(searchSysDictData);
        Map<String , SysDictData> limitAmountMap = dictDataList.stream()
                .collect(Collectors.toMap(
                        SysDictData::getDictValue,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));
        if(gameTenballRecord == null){
            return;
        }
        if(getLimitAmountByKey(limitAmountMap,"sum_max").compareTo(gameTenballRecord.getCountMoney() + money * betNumberArg.length) < 0){
            throw new ServiceException("单期投注总金额不可以大于" + getLimitAmountByKey(limitAmountMap,"small_num"));
        }

        if(money.compareTo(getLimitAmountByKey(limitAmountMap,"small_num"))<0){
            throw new ServiceException("投注金额不可以小余" + getLimitAmountByKey(limitAmountMap,"small_num"));
        }

        Map<String, Object> gameTenballMap = EntityMapTransUtils.entityToMap1(gameTenballRecord);

        // 冠亚和以外的才需要 验证号码个数
        if(betType != 1){
            Map<String, String> typeCountMap = new HashMap<>();
            Map<String, Map<String, String>> typeNumCountMap = new HashMap<>();
            Integer numCount = limitAmountMap.get("num_count").getDictLabel() != null ? (int)Float.parseFloat(limitAmountMap.get("num_count").getDictLabel()):0;


            for(int i=2;i<=11;i++){
                for(int j=1;j<=10;j++){
                    String mapKey = "type"+i + "Num" +j;
                    if(gameTenballMap.get(mapKey) != null && (Float)gameTenballMap.get(mapKey) >0){
                        typeCountMap.put("type"+i,i+"");

                        Map<String, String> typeMap = new HashMap<>();
                        if(typeNumCountMap.containsKey("type"+i)){
                            typeMap = typeNumCountMap.get("type"+i);
                        }
                        typeMap.put(mapKey,mapKey);

                        typeNumCountMap.put("type"+i,typeMap);
                    }
                }
            }

            //投注赛道个数验证
//            if(!typeCountMap.containsKey("type"+betType)){
//
//                //是否包含赛道1-10
//                boolean numBetFalg = false;
//                for(int i=0; i<betNumberArg.length; i++){
//                    if(rank.contains(betNumberArg[i].trim())){
//                        numBetFalg = true;
//                        break;
//                    }
//                }
//
//                if(numBetFalg && (typeCountMap.size() + 1) > numCount){
//                    throw new ServiceException("投注赛道号码个数不可以大于" + numCount);
//                }
//
//                if(multiBetRecord != null){
//                    Integer typeCnt = 0;
//                    for(TenBallsMultiBetRecordReqVO vo : multiBetRecord){
//                        if(vo.getType() != 1){
//                            String[] checkBetNumberArg = vo.getNumber().split(",");
//                            boolean multiNumBetFalg = false;
//                            for(int i=0; i<checkBetNumberArg.length; i++){
//                                if(rank.contains(checkBetNumberArg[i].trim())){
//                                    multiNumBetFalg = true;
//                                    break;
//                                }
//                            }
//                            if(multiNumBetFalg && !typeCountMap.containsKey("type"+vo.getType())){
//                                typeCnt ++;
//                            }
//                        }
//                    }
//
//                    if((typeCountMap.size() + typeCnt) > numCount){
//                        throw new ServiceException("投注赛道号码个数不可以大于" + numCount);
//                    }
//                }
//            }

            //赛道号码个数验证
            for(int i=0; i<betNumberArg.length; i++){
                if(betType != 1){
                    if(rank.contains(betNumberArg[i].trim())){
                        if(typeNumCountMap.containsKey("type"+betType)){
                            Map<String, String> typeMap = typeNumCountMap.get("type"+betType);
                            if(!typeMap.containsKey("type"+betType + "Num" +betNumberArg[i])){
                                typeMap.put("type"+betType + "Num" +betNumberArg[i],"type"+betType + "Num" +betNumberArg[i]);
                                typeNumCountMap.put("type"+betType,typeMap);
                            }
                        }else {
                            Map<String, String> typeMap = new HashMap<>();
                            typeMap.put("type"+betType + "Num" +betNumberArg[i],"type"+betType + "Num" +betNumberArg[i]);
                            typeNumCountMap.put("type"+betType,typeMap);
                        }
                    }
                }
            }

            if(multiBetRecord != null){
                for(TenBallsMultiBetRecordReqVO vo : multiBetRecord){
                    if(vo.getType() != 1){
                        String[] checkBetNumberArg = vo.getNumber().split(",");
                        for(int i=0; i<checkBetNumberArg.length; i++){
                            if(rank.contains(checkBetNumberArg[i].trim())){

                                if(typeNumCountMap.containsKey("type"+vo.getType())){
                                    Map<String, String> typeMap = typeNumCountMap.get("type"+vo.getType());
                                    if(!typeMap.containsKey("type"+vo.getType() + "Num" +checkBetNumberArg[i])){
                                        typeMap.put("type"+vo.getType() + "Num" +checkBetNumberArg[i],"type"+vo.getType() + "Num" +checkBetNumberArg[i]);
                                        typeNumCountMap.put("type"+vo.getType(),typeMap);
                                    }
                                }else {
                                    Map<String, String> typeMap = new HashMap<>();
                                    typeMap.put("type"+vo.getType() + "Num" +checkBetNumberArg[i],"type"+vo.getType() + "Num" +checkBetNumberArg[i]);
                                    typeNumCountMap.put("type"+vo.getType(),typeMap);
                                }
                            }
                        }
                    }
                }
            }

            // 判断投注赛道个数
            if(typeNumCountMap.size()> numCount){
                throw new ServiceException("投注赛道号码个数不可以大于" + numCount);
            }

            // 判断投注赛道号码个数
            for(String key : typeNumCountMap.keySet()) {
                if(typeNumCountMap.get(key).size()> numCount){
                    throw new ServiceException("投注赛道号码个数不可以大于" + numCount);
                }
            }
        }

        for(int i=0; i<betNumberArg.length; i++){
            Float bigDxds = getLimitAmountByKey(limitAmountMap,"big_dxds");

            if(betType == 1){
                if(tema.contains(betNumberArg[i].trim())){
                    List<String> special = Arrays.asList("3", "4", "18", "19");
                    Float recordAmount = gameTenballMap.get("type1Num"+betNumberArg[i].trim())!=null?(Float) gameTenballMap.get("type1Num"+betNumberArg[i].trim()):0f;
                    if(special.contains(betNumberArg[i].trim())){
                        if(getLimitAmountByKey(limitAmountMap,"big_num_special").compareTo(money + recordAmount)<0){
                            throw new ServiceException("特殊号码投注金额不可以大于" + getLimitAmountByKey(limitAmountMap,"big_num_special"));
                        }
                    }else{
                        if(getLimitAmountByKey(limitAmountMap,"sum_num_special").compareTo(money + recordAmount)<0){
                            throw new ServiceException("特殊号码投注金额不可以大于" + getLimitAmountByKey(limitAmountMap,"sum_num_special"));
                        }
                    }
                }

                if(bigSmall.contains(betNumberArg[i].trim())){
                    if("单".equals(betNumberArg[i].trim()) && bigDxds.compareTo(money + gameTenballRecord.getType1Single()) < 0){
                        throw new ServiceException("和值单金额不可以大于" + bigDxds);
                    }
                    if("双".equals(betNumberArg[i].trim()) && bigDxds.compareTo(money + gameTenballRecord.getType1Double()) < 0){
                        throw new ServiceException("和值双金额不可以大于" + bigDxds);
                    }
                    if("大".equals(betNumberArg[i].trim()) && bigDxds.compareTo(money + gameTenballRecord.getType1Big()) < 0){
                        throw new ServiceException("和值大金额不可以大于" + bigDxds);
                    }
                    if("小".equals(betNumberArg[i].trim()) && bigDxds.compareTo(money + gameTenballRecord.getType1Small()) < 0){
                        throw new ServiceException("和值小金额不可以大于" + bigDxds);
                    }
                }
            }else{
                if(rank.contains(betNumberArg[i].trim())){
                    //赛道号码金额判断
                    Object recordAmountObject = gameTenballMap.get("type"+(betType - 1) + "Num" +betNumberArg[i].trim());
                    Float recordAmount = recordAmountObject!=null?(Float) recordAmountObject:0f;
                    if(getLimitAmountByKey(limitAmountMap,"big_num").compareTo(money + recordAmount)<0){
                        throw new ServiceException("赛道号码注金额不可以大于" + getLimitAmountByKey(limitAmountMap,"big_num"));
                    }
                }

                if(bigSmall.contains(betNumberArg[i].trim())){

                    Object singleRecordAmountObject = gameTenballMap.get("type"+(betType - 1) + "Single");
                    Float singleRecordAmount = singleRecordAmountObject!=null?(Float) singleRecordAmountObject:0f;
                    if("单".equals(betNumberArg[i].trim()) && bigDxds.compareTo(money + singleRecordAmount) < 0){
                        throw new ServiceException("赛道单金额不可以大于" + bigDxds);
                    }

                    Object doubleRecordAmountObject = gameTenballMap.get("type"+(betType - 1) + "Double");
                    Float doubleRecordAmount = doubleRecordAmountObject!=null?(Float) doubleRecordAmountObject:0f;
                    if("双".equals(betNumberArg[i].trim()) && bigDxds.compareTo(money + doubleRecordAmount) < 0){
                        throw new ServiceException("赛道双金额不可以大于" + bigDxds);
                    }

                    Object bigRecordAmountObject = gameTenballMap.get("type"+(betType - 1) + "Big");
                    Float bigRecordAmount = bigRecordAmountObject!=null?(Float) bigRecordAmountObject:0f;
                    if("大".equals(betNumberArg[i].trim()) && bigDxds.compareTo(money + bigRecordAmount) < 0){
                        throw new ServiceException("赛道大金额不可以大于" + bigDxds);
                    }

                    Object smallRecordAmountObject = gameTenballMap.get("type"+(betType - 1) + "Small");
                    Float smallRecordAmount = smallRecordAmountObject!=null?(Float) smallRecordAmountObject:0f;
                    if("小".equals(betNumberArg[i].trim()) && bigDxds.compareTo(money + smallRecordAmount) < 0){
                        throw new ServiceException("赛道小金额不可以大于" + bigDxds);
                    }
                }

                if(longTiger.contains(betNumberArg[i].trim())){

                    Object loongRecordAmountObject = gameTenballMap.get("type"+(betType - 1) + "Loong");
                    Float loongRecordAmount = loongRecordAmountObject!=null?(Float) loongRecordAmountObject:0f;
                    if("龙".equals(betNumberArg[i].trim()) && bigDxds.compareTo(money + loongRecordAmount) < 0){
                        throw new ServiceException("龙金额不可以大于" + bigDxds);
                    }

                    Object tigerRecordAmountObject = gameTenballMap.get("type"+(betType - 1) + "Tiger");
                    Float tigerRecordAmount = tigerRecordAmountObject!=null?(Float) tigerRecordAmountObject:0f;
                    if("虎".equals(betNumberArg[i].trim()) && bigDxds.compareTo(money + tigerRecordAmount) < 0){
                        throw new ServiceException("虎金额不可以大于" + bigDxds);
                    }
                }
            }
        }
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

    @Override
    @Transactional
    public Long addTenBallsAutoBetRecord(Long userId, AddAutoBetRecordReqVO vo) {
        SysGame gameInfo = sysGameService.selectSysGameByGameId(vo.getGameId());
        GameAutoBetRecord autoBetRecord = new GameAutoBetRecord();
        autoBetRecord.setUserId(userId);
        autoBetRecord.setStartPeriods(vo.getPeriods());
        autoBetRecord.setNowPeriods(vo.getPeriods());
        autoBetRecord.setGameId(vo.getGameId());
        autoBetRecord.setGameName(gameInfo.getGameName());
        autoBetRecord.setAutoBetType(vo.getType());
        autoBetRecord.setAutoBetNumber(vo.getNumber());
        autoBetRecord.setWinStopStatus(vo.getWinStopStatus());
        autoBetRecord.setAutoBetCount(vo.getAutoBetCount());
        autoBetRecord.setAutoBetTimes(vo.getAutoBetTimes());
        autoBetRecord.setAutoBetMoney(vo.getMoney());
        autoBetRecord.setRemainCount(vo.getAutoBetCount() - 1);
        autoBetRecord.setCountMoney(vo.getMoney());
        gameAutoBetRecordService.insertGameAutoBetRecord(autoBetRecord);

        TenBallsAddMultiBetRecordReqVO reqVO = new TenBallsAddMultiBetRecordReqVO();
        List<TenBallsMultiBetRecordReqVO> multiBetRecordList = new ArrayList<>();
        TenBallsMultiBetRecordReqVO multiBetRecordReqVO = new TenBallsMultiBetRecordReqVO();
        multiBetRecordReqVO.setType(vo.getType());
        multiBetRecordReqVO.setNumber(vo.getNumber());
        multiBetRecordReqVO.setMoney(vo.getMoney());
        multiBetRecordReqVO.setAutoBetRecordId(autoBetRecord.getId());
        multiBetRecordList.add(multiBetRecordReqVO);

        reqVO.setGameId(vo.getGameId());
        reqVO.setPeriods(vo.getPeriods());
        reqVO.setRecordList(multiBetRecordList);
        reqVO.setAutoBetFlg("1");
        Long lastRecordId = addTenBallsMultiBetRecord(userId,reqVO);
        return lastRecordId;
    }
}
