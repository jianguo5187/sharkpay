package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysAdminRecord;
import com.ruoyi.system.domain.SysGame;
import com.ruoyi.system.domain.Usermoney;
import com.ruoyi.system.domain.Userwin;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.mapper.UserwinMapper;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 用户盈亏Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
@Service
public class UserwinServiceImpl implements IUserwinService 
{
    @Autowired
    private UserwinMapper userwinMapper;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private IUsermoneyService usermoneyService;

    @Autowired
    private ISysAdminRecordService sysAdminRecordService;

    /**
     * 查询用户盈亏
     * 
     * @param id 用户盈亏主键
     * @return 用户盈亏
     */
    @Override
    public Userwin selectUserwinById(Long id)
    {
        return userwinMapper.selectUserwinById(id);
    }

    /**
     * 查询用户盈亏列表
     * 
     * @param userwin 用户盈亏
     * @return 用户盈亏
     */
    @Override
    public List<Userwin> selectUserwinList(Userwin userwin)
    {
        return userwinMapper.selectUserwinList(userwin);
    }

    /**
     * 新增用户盈亏
     * 
     * @param userwin 用户盈亏
     * @return 结果
     */
    @Override
    public int insertUserwin(Userwin userwin)
    {
        userwin.setCreateTime(DateUtils.getNowDate());
        return userwinMapper.insertUserwin(userwin);
    }

    /**
     * 修改用户盈亏
     * 
     * @param userwin 用户盈亏
     * @return 结果
     */
    @Override
    public int updateUserwin(Userwin userwin)
    {
        userwin.setUpdateTime(DateUtils.getNowDate());
        return userwinMapper.updateUserwin(userwin);
    }

    /**
     * 批量删除用户盈亏
     * 
     * @param ids 需要删除的用户盈亏主键
     * @return 结果
     */
    @Override
    public int deleteUserwinByIds(Long[] ids)
    {
        return userwinMapper.deleteUserwinByIds(ids);
    }

    /**
     * 删除用户盈亏信息
     * 
     * @param id 用户盈亏主键
     * @return 结果
     */
    @Override
    public int deleteUserwinById(Long id)
    {
        return userwinMapper.deleteUserwinById(id);
    }

    @Override
    public Userwin selectTodayUserwin(Long gameId,Long userId) {
        return userwinMapper.selectTodayUserwin(gameId,userId);
    }

    @Override
    public List<UserTotalRankListRespVO> selectUserTotalRankList(Userwin userwin) {
        List<UserGameWinRankListRespVO> userGameWinRankList = userwinMapper.selectUserGameWinRankList(userwin);
        List<UserTotalRankListRespVO> respVO = new ArrayList<>();

        Map<Long,UserTotalRankListRespVO> userTotalRankMap = new HashMap<>();
//        Map<String, UserGameTotalRankListRespVO> userGameRankMap = new HashMap<>();

        for(UserGameWinRankListRespVO userGameWinRankListRespVO :userGameWinRankList){
            UserTotalRankListRespVO vo = new UserTotalRankListRespVO();
            if(userTotalRankMap.containsKey(userGameWinRankListRespVO.getUserId())){
                vo = userTotalRankMap.get(userGameWinRankListRespVO.getUserId());
            }else{

                vo.setTotalWinMoney(0f);
                vo.setTotalCashBackMoney(0f);
                vo.setTotalBetMoney(0f);
                vo.setJnd20(0f);
                vo.setJnd28(0f);
                vo.setJnd32(0f);
                vo.setJspc28(0f);
                vo.setBt28(0f);
                vo.setMssc(0f);
                vo.setAzxy52(0f);
                vo.setAzxy5(0f);
                vo.setAzxy10(0f);
                vo.setAzxy102(0f);
                vo.setXyft(0f);
                vo.setJssc(0f);
                vo.setJsft(0f);
                vo.setJssc(0f);
                vo.setJssc2(0f);
                vo.setXyft2(0f);

            }
            vo.setUserId(userGameWinRankListRespVO.getUserId());
            vo.setNickName(userGameWinRankListRespVO.getNickName());
            vo.setRealName(userGameWinRankListRespVO.getRealName());
            vo.setRemarkName(userGameWinRankListRespVO.getRemarkName());
            vo.setUserAmount(userGameWinRankListRespVO.getUserAmount());
            vo.setTotalWinMoney(vo.getTotalWinMoney() +  userGameWinRankListRespVO.getWinMoney());
            vo.setTotalCashBackMoney(vo.getTotalCashBackMoney() +  userGameWinRankListRespVO.getCashBackMoney());
            vo.setTotalBetMoney(vo.getTotalBetMoney() +  userGameWinRankListRespVO.getBigSmallMoney() + userGameWinRankListRespVO.getOtherMoney());

            if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"jnd20")){
                vo.setJnd20(vo.getJnd20() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"jnd28")){
                vo.setJnd28(vo.getJnd28() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"jnd32")){
                vo.setJnd32(vo.getJnd32() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"jspc28")){
                vo.setJspc28(vo.getJspc28() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"bt28")){
                vo.setBt28(vo.getBt28() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"mssc")){
                vo.setMssc(vo.getMssc() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"azxy52")){
                vo.setAzxy52(vo.getAzxy52() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"azxy5")){
                vo.setAzxy5(vo.getAzxy5() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"azxy10")){
                vo.setAzxy10(vo.getAzxy10() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"azxy102")){
                vo.setAzxy102(vo.getAzxy102() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"xyft")){
                vo.setXyft(vo.getXyft() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"jssc")){
                vo.setJssc(vo.getJssc() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"jsft")){
                vo.setJsft(vo.getJsft() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"jssc2")){
                vo.setJssc(vo.getJssc() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"jsssc")){
                vo.setJssc2(vo.getJssc2() +  userGameWinRankListRespVO.getWinMoney());
            }else if(StringUtils.equals(userGameWinRankListRespVO.getGameMarkId(),"xyft2")){
                vo.setXyft2(vo.getXyft2() +  userGameWinRankListRespVO.getWinMoney());
            }
            userTotalRankMap.put(userGameWinRankListRespVO.getUserId(),vo);
//            UserGameTotalRankListRespVO userGameRankVo = new UserGameTotalRankListRespVO();
//            if(userGameRankMap.containsKey(userGameWinRankListRespVO.getUserId() + "_" + userGameWinRankListRespVO.getGameId())){
//                userGameRankVo = userGameRankMap.get(userGameWinRankListRespVO.getUserId() + "_" + userGameWinRankListRespVO.getGameId());
//            }
        }
        for(Map.Entry<Long,UserTotalRankListRespVO> entry: userTotalRankMap.entrySet()){
            respVO.add(entry.getValue());
        }

        return respVO;
    }

    @Override
    public List<UserGameWinRankListRespVO> selectUserGameRankList(Userwin userwin) {
        SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");

        return userwinMapper.selectUserGameWinRankList(userwin).stream().map(f->{
            f.setTotalBetMoney(f.getBigSmallMoney() + f.getOtherMoney() - f.getDeductMoney());
            String winTime = sd.format(f.getWinTime());
            f.setRecordCount(userwinMapper.selectUserGameWinDateCount(f.getUserId(), f.getGameId(), winTime, f.getGameRecord()));
            return f;
        }).collect(Collectors.toList());
    }

    @Override
    public List<CashBackDetailListRespVO> selectCashBackDetailList(Userwin userwin) {
        return userwinMapper.selectCashBackDetailList(userwin).stream().map(f->{
            if(f.getCashBackMoney().compareTo(0f) > 0){
                f.setCashBackStatus("1");
            }else{
                f.setCashBackStatus("0");
            }
            return f;
        }).collect(Collectors.toList());
    }

    @Override
    public void cashBackYestoday(Long userId) {
        List<Userwin> yestodayNoCashBackList = userwinMapper.selectYestodayNoCashBackList();
        cashBack(yestodayNoCashBackList,userId);
    }

    public void cashBack(List<Userwin> userWinList, Long adminUserId){

        SysGame sysGameSearch = new SysGame();
        sysGameSearch.setStatus("0"); //有效
        List<SysGame> gameList = sysGameService.selectSysGameList(sysGameSearch);

        Map<Long , SysGame> gameMap = gameList.stream()
                .collect(Collectors.toMap(
                        SysGame::getGameId,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        for(Userwin userwin : userWinList){

            SysUser user = userService.selectUserById(userwin.getUserId());
            SysGame gameInfo = gameMap.get(userwin.getGameId());

            Float gameCashback = 0f;

            if(StringUtils.equals(gameInfo.getGameType(),"3")){
                if(user.getThreeBallCashback().compareTo(0f) == 0){
                    gameCashback = 0f; //不返水
                }else if(user.getThreeBallCashback().compareTo(100f) == 0){
                    gameCashback = gameInfo.getGameCashback(); //使用游戏定义的返水比率
                }else{
                    gameCashback = user.getThreeBallCashback(); //使用用户定义的反水比率
                }
            }else if(StringUtils.equals(gameInfo.getGameType(),"5")){
                if(user.getFiveBallCashback().compareTo(0f) == 0){
                    gameCashback = 0f; //不返水
                }else if(user.getFiveBallCashback().compareTo(100f) == 0){
                    gameCashback = gameInfo.getGameCashback(); //使用游戏定义的返水比率
                }else{
                    gameCashback = user.getFiveBallCashback(); //使用用户定义的反水比率
                }
            }else if(StringUtils.equals(gameInfo.getGameType(),"10")){
                if(user.getTenBallCashback().compareTo(0f) == 0){
                    gameCashback = 0f; //不返水
                }else if(user.getTenBallCashback().compareTo(100f) == 0){
                    gameCashback = gameInfo.getGameCashback(); //使用游戏定义的返水比率
                }else{
                    gameCashback = user.getTenBallCashback(); //使用用户定义的反水比率
                }
            }

            Float amont = userwin.getBigSmallMoney() + userwin.getOtherMoney() - userwin.getDeductMoney();
            Float resutAmont = amont * gameCashback / 100;
            Float money = BigDecimal.valueOf(resutAmont).setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();

            Float userMoney = user.getAmount() + money;
            user.setAmount(userMoney);
            userService.updateUserAmount(user);

            Usermoney usermoney = new Usermoney();
            usermoney.setUserId(userwin.getUserId());
            usermoney.setCashContent(userwin.getGameName() + "投注返水");
            usermoney.setCashMoney(money);
            usermoney.setUserBalance(userMoney);
            usermoney.setType("16");
            usermoney.setGameId(userwin.getGameId());
            usermoney.setGameName(userwin.getGameName());
            usermoneyService.insertUsermoney(usermoney);

            userwinMapper.updateCashBackMoneyById(userwin.getId(),money);

            SysAdminRecord sysAdminRecord = new SysAdminRecord();
            sysAdminRecord.setType(5);//返水发放
            sysAdminRecord.setIsAgree("0");
            sysAdminRecord.setOriginId(usermoney.getId());
            sysAdminRecord.setAdminUserId(adminUserId);
            sysAdminRecordService.insertSysAdminRecord(sysAdminRecord);
        }
    }

    @Override
    public void cashBackUser(Long userId, Userwin userwin) {

        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        String winTime = sd.format(userwin.getWinTime());
        List<Userwin> userWinList = userwinMapper.selectUserWinListByDay(userwin.getUserId(),userwin.getGameId(),winTime);
        cashBack(userWinList,userId);
    }

    @Override
    public List<CashBackDetailListRespVO> selectCashBackList(Userwin userwin) {
        return userwinMapper.selectCashBackList(userwin);
    }

    @Override
    public List<CommissionDetailListRespVO> selectCommissionDetailList(Userwin userwin) {
        return userwinMapper.selectCommissionDetailList(userwin).stream().map(f->{
            if(f.getCommissionMoney().compareTo(0f) > 0){
                f.setCommissionStatus("1");
            }else{
                f.setCommissionStatus("0");
            }
            return f;
        }).collect(Collectors.toList());
    }

    @Override
    public void commissionYestoday(Long userId) {
        List<Userwin> yestodayNoCommissionList = userwinMapper.selectYestodayNoCommissionList();
        commission(yestodayNoCommissionList,userId);
    }

    public void commission(List<Userwin> userWinList, Long adminUserId){

        SysGame sysGameSearch = new SysGame();
        sysGameSearch.setStatus("0"); //有效
        List<SysGame> gameList = sysGameService.selectSysGameList(sysGameSearch);

        Map<Long , SysGame> gameMap = gameList.stream()
                .collect(Collectors.toMap(
                        SysGame::getGameId,
                        Function.identity(),
                        (existing, replacement) -> existing // 保留现有的值，忽略替换值
                ));

        for(Userwin userwin : userWinList){

            SysUser user = userService.selectUserById(userwin.getUserId());
            if(user.getParentUserId() == null || user.getParentUserId() == 0){
                continue;
            }
            SysGame gameInfo = gameMap.get(userwin.getGameId());

            SysUser parentUser = userService.selectUserById(user.getParentUserId());


            Float gameCommission = 0f;
            if(StringUtils.equals(gameInfo.getGameType(),"3")){
                if(user.getThreeBallCommission().compareTo(0f) == 0){
                    gameCommission = 0f; //不返水
                }else if(user.getThreeBallCommission().compareTo(100f) == 0){
                    gameCommission = gameInfo.getGameCommission(); //使用游戏定义的佣金比率
                }else{
                    gameCommission = user.getThreeBallCommission(); //使用用户定义的佣金比率
                }
            }else if(StringUtils.equals(gameInfo.getGameType(),"5")){
                if(user.getFiveBallCommission().compareTo(0f) == 0){
                    gameCommission = 0f; //不返水
                }else if(user.getFiveBallCommission().compareTo(100f) == 0){
                    gameCommission = gameInfo.getGameCommission(); //使用游戏定义的佣金比率
                }else{
                    gameCommission = user.getFiveBallCommission(); //使用用户定义的佣金比率
                }
            }else if(StringUtils.equals(gameInfo.getGameType(),"10")){
                if(user.getTenBallCommission().compareTo(0f) == 0){
                    gameCommission = 0f; //不返水
                }else if(user.getTenBallCommission().compareTo(100f) == 0){
                    gameCommission = gameInfo.getGameCommission(); //使用游戏定义的佣金比率
                }else{
                    gameCommission = user.getTenBallCommission(); //使用用户定义的佣金比率
                }
            }

            Float amont = userwin.getBigSmallMoney() + userwin.getOtherMoney() - userwin.getDeductMoney();
            Float resutAmont = amont * gameCommission / 100;
            Float money = BigDecimal.valueOf(resutAmont).setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();

            Float userMoney = parentUser.getAmount() + money;
            parentUser.setAmount(userMoney);
            userService.updateUserAmount(parentUser);

            Usermoney usermoney = new Usermoney();
            usermoney.setUserId(parentUser.getUserId());
            usermoney.setCashContent(userwin.getGameName() + "投注返佣前金额：" + amont.toString());
            usermoney.setCashMoney(money);
            usermoney.setUserBalance(userMoney);
            usermoney.setType("11");
            usermoney.setGameId(userwin.getGameId());
            usermoney.setGameName(userwin.getGameName());
            usermoney.setRemark("下线佣金");
            usermoneyService.insertUsermoney(usermoney);

            userwinMapper.updateCommissionById(userwin.getId(),money);

            SysAdminRecord sysAdminRecord = new SysAdminRecord();
            sysAdminRecord.setType(6);//佣金发放
            sysAdminRecord.setIsAgree("0");
            sysAdminRecord.setOriginId(usermoney.getId());
            sysAdminRecord.setAdminUserId(adminUserId);
            sysAdminRecordService.insertSysAdminRecord(sysAdminRecord);
        }
    }

    @Override
    public void commissionUser(Long userId, Userwin userwin) {

        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        String winTime = sd.format(userwin.getWinTime());
        List<Userwin> userWinList = userwinMapper.selectUserWinListByDay(userwin.getUserId(),userwin.getGameId(),winTime);
        commission(userWinList,userId);
    }

    @Override
    public List<TotalReportRespVO> selectTotalReportLis() {
        return userwinMapper.selectTotalReportLis();
    }
}
