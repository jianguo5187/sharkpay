package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.vo.BetRealTimeReqVO;
import com.ruoyi.system.domain.vo.BetRealTimeRespVO;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BetRecordMapper;

/**
 * 投注单Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@Service
public class BetRecordServiceImpl implements IBetRecordService 
{
    @Autowired
    private BetRecordMapper betRecordMapper;

    @Autowired
    private ISysGameService sysGameService;

    @Autowired
    private IGameThreeballRecordService gameThreeballRecordService;

    @Autowired
    private IGameFiveballRecordService gameFiveballRecordService;

    @Autowired
    private IGameTenballRecordService gameTenballRecordService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private IUsermoneyService usermoneyService;

    @Autowired
    private ISysAdminRecordService sysAdminRecordService;

    @Autowired
    private IGameAutoBetRecordService gameAutoBetRecordService;

    /**
     * 查询投注单
     * 
     * @param betId 投注单主键
     * @return 投注单
     */
    @Override
    public BetRecord selectBetRecordByBetId(Long betId)
    {
        return betRecordMapper.selectBetRecordByBetId(betId);
    }

    /**
     * 查询投注单列表
     * 
     * @param betRecord 投注单
     * @return 投注单
     */
    @Override
    public List<BetRecord> selectBetRecordList(BetRecord betRecord)
    {
        return betRecordMapper.selectBetRecordList(betRecord);
    }

    /**
     * 新增投注单
     * 
     * @param betRecord 投注单
     * @return 结果
     */
    @Override
    public int insertBetRecord(BetRecord betRecord)
    {
        betRecord.setCreateTime(DateUtils.getNowDate());
        return betRecordMapper.insertBetRecord(betRecord);
    }

    /**
     * 修改投注单
     * 
     * @param betRecord 投注单
     * @return 结果
     */
    @Override
    public int updateBetRecord(BetRecord betRecord)
    {
        betRecord.setUpdateTime(DateUtils.getNowDate());
        return betRecordMapper.updateBetRecord(betRecord);
    }

    /**
     * 批量删除投注单
     * 
     * @param betIds 需要删除的投注单主键
     * @return 结果
     */
    @Override
    public int deleteBetRecordByBetIds(Long[] betIds)
    {
        return betRecordMapper.deleteBetRecordByBetIds(betIds);
    }

    /**
     * 删除投注单信息
     * 
     * @param betId 投注单主键
     * @return 结果
     */
    @Override
    public int deleteBetRecordByBetId(Long betId)
    {
        return betRecordMapper.deleteBetRecordByBetId(betId);
    }

    @Override
    public int updateLotteryResult(BetRecord betRecord) {
        return betRecordMapper.updateLotteryResult(betRecord);
    }

    @Override
    public List<BetRealTimeRespVO> selectBetRealTimeList(BetRealTimeReqVO vo) {
        return betRecordMapper.selectBetRealTimeList(vo);
    }

    @Override
    public void adminCancelBetRecord(Long userId, Long betId) {
        BetRecord betRecord = selectBetRecordByBetId(betId);

        if(betRecord == null){
            throw new ServiceException("查无记录！");
        }

        if(!StringUtils.equals(betRecord.getIsDelete(),"0")){
            throw new ServiceException("投注已被撤销");
        }
        if(StringUtils.isNotEmpty(betRecord.getGameResult())){
            throw new ServiceException("投注已开奖");
        }

        SysGame gameInfo = sysGameService.selectSysGameByGameId(betRecord.getGameId());

        Float countMoeny = 0f;
        if(StringUtils.equals(gameInfo.getGameType(),"3")){
            // 3球
            GameThreeballRecord searchGameThreeballRecord = new GameThreeballRecord();
            searchGameThreeballRecord.setGameId(betRecord.getGameId());
            searchGameThreeballRecord.setUserId(betRecord.getUserId());
            searchGameThreeballRecord.setPeriods(betRecord.getPeriods());
            searchGameThreeballRecord.setStatus("0");
            List<GameThreeballRecord> gameThreeballRecordList = gameThreeballRecordService.selectGameThreeballRecordList(searchGameThreeballRecord);

            if(gameThreeballRecordList != null && gameThreeballRecordList.size() >0){
                gameThreeballRecordService.deleteGameThreeballRecordById(gameThreeballRecordList.get(0).getId());
                countMoeny = gameThreeballRecordList.get(0).getCountMoney();
            }else{
                throw new ServiceException("查无记录");
            }
        }else if(StringUtils.equals(gameInfo.getGameType(),"5")){
            // 5球
            GameFiveballRecord searchGameFiveballRecord = new GameFiveballRecord();
            searchGameFiveballRecord.setGameId(betRecord.getGameId());
            searchGameFiveballRecord.setUserId(betRecord.getUserId());
            searchGameFiveballRecord.setPeriods(betRecord.getPeriods());
            searchGameFiveballRecord.setStatus("0");
            List<GameFiveballRecord> gameFiveballRecordList = gameFiveballRecordService.selectGameFiveballRecordList(searchGameFiveballRecord);

            if(gameFiveballRecordList != null && gameFiveballRecordList.size() >0){
                gameFiveballRecordService.deleteGameFiveballRecordById(gameFiveballRecordList.get(0).getId());
                countMoeny = gameFiveballRecordList.get(0).getCountMoney();
            }else{
                throw new ServiceException("查无记录");
            }

        }else{
            // 10球
            GameTenballRecord searchGameTenballRecord = new GameTenballRecord();
            searchGameTenballRecord.setGameId(betRecord.getGameId());
            searchGameTenballRecord.setUserId(betRecord.getUserId());
            searchGameTenballRecord.setPeriods(betRecord.getPeriods());
            searchGameTenballRecord.setStatus("0");
            List<GameTenballRecord> gameTenballRecordList = gameTenballRecordService.selectGameTenballRecordList(searchGameTenballRecord);

            if(gameTenballRecordList != null && gameTenballRecordList.size() >0){
                gameTenballRecordService.deleteGameTenballRecordById(gameTenballRecordList.get(0).getId());
                countMoeny = gameTenballRecordList.get(0).getCountMoney();
            }else{
                throw new ServiceException("查无记录");
            }
        }

        // 因为都可以撤单，所以把追号任务都停了
        gameAutoBetRecordService.cancelAllAutoBetRecord(betRecord.getUserId(),betRecord.getGameId());

        SysUser user = userService.selectUserById(betRecord.getUserId());

        betRecordMapper.cancelBetRecordByPeriods(betRecord.getGameId(), betRecord.getPeriods(), betRecord.getUserId(), "1");

        Float userAmount = user.getAmount() + countMoeny;

        Usermoney usermoney = new Usermoney();
        usermoney.setUserId(betRecord.getUserId());
        usermoney.setGameId(betRecord.getGameId());
        usermoney.setGameName(betRecord.getGameName());
        usermoney.setRemark("管理员撤单");
        usermoney.setCashMoney(betRecord.getMoney());
        usermoney.setUserBalance(userAmount);
        usermoney.setType("111");
        usermoney.setCashContent(betRecord.getPeriods().toString());
        usermoneyService.insertUsermoney(usermoney);

        user.setAmount(userAmount);
        userService.updateUserAmount(user);

        SysAdminRecord sysAdminRecord = new SysAdminRecord();
        sysAdminRecord.setType(8);
        sysAdminRecord.setIsAgree("0");
        sysAdminRecord.setOriginId(betId);
        sysAdminRecord.setRemark("用户：" + user.getNickName() + "(" + betRecord.getUserId() + ")" + "第" + betRecord.getPeriods() + "期");
        sysAdminRecord.setAdminUserId(userId);

        sysAdminRecordService.insertSysAdminRecord(sysAdminRecord);
    }
}
