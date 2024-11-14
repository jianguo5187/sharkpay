package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Userwin;
import com.ruoyi.system.domain.vo.*;
import org.apache.ibatis.annotations.Param;

/**
 * 用户盈亏Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
public interface UserwinMapper 
{
    /**
     * 查询用户盈亏
     * 
     * @param id 用户盈亏主键
     * @return 用户盈亏
     */
    public Userwin selectUserwinById(Long id);

    /**
     * 查询用户盈亏列表
     * 
     * @param userwin 用户盈亏
     * @return 用户盈亏集合
     */
    public List<Userwin> selectUserwinList(Userwin userwin);

    /**
     * 新增用户盈亏
     * 
     * @param userwin 用户盈亏
     * @return 结果
     */
    public int insertUserwin(Userwin userwin);

    /**
     * 修改用户盈亏
     * 
     * @param userwin 用户盈亏
     * @return 结果
     */
    public int updateUserwin(Userwin userwin);

    /**
     * 删除用户盈亏
     * 
     * @param id 用户盈亏主键
     * @return 结果
     */
    public int deleteUserwinById(Long id);

    /**
     * 批量删除用户盈亏
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUserwinByIds(Long[] ids);

    public Userwin selectTodayUserwin(@Param("gameId")Long gameId, @Param("userId")Long userId);

    public int clearUserwin(@Param("gameId") Long gameId, @Param("userId") Long userId);

    public Float userRankEveryday(@Param("userId") Long userId,@Param("winTime") String winTime);

    public List<YkDetailRespVO> selectUserGameWinList(@Param("userId") Long userId,@Param("winTime") String winTime);

    public List<Userwin> selectUserWinListByDay(@Param("userId") Long userId,@Param("gameId") Long gameId,@Param("winTime") String winTime);

    public List<UserGameWinRankListRespVO> selectUserGameWinRankList(Userwin userwin);

    public int selectUserGameWinDateCount(@Param("userId") Long userId, @Param("gameId") Long gameId, @Param("winTime") String winTime, @Param("betRecordTableName") String betRecordTableName);

    public int updateUserDeductMoney(@Param("userId") Long userId, @Param("gameId") Long gameId, @Param("winTime") String winTime,@Param("plusFlg") String plusFlg,@Param("countMoney") Float countMoney);

    public List<CashBackDetailListRespVO> selectCashBackDetailList(Userwin userwin);

    public List<Userwin> selectYestodayNoCashBackList();

    public int updateCashBackMoneyById(@Param("id") Long id,@Param("cashBackMoney")Float cashBackMoney);

    public List<CashBackDetailListRespVO> selectCashBackList(Userwin userwin);

    public List<CommissionDetailListRespVO> selectCommissionDetailList(Userwin userwin);

    public List<Userwin> selectYestodayNoCommissionList();

    public int updateCommissionById(@Param("id") Long id,@Param("commissionMoney")Float commissionMoney);

    public Float selectBetWinToalAmount();

    public List<TotalReportRespVO> selectTotalReportLis(Userwin userwin);

    public List<CashbackReportRespVO> selectCashbackReportLis(@Param("userId") Long userId,@Param("filterDate")String filterDate);

    public List<CommissionReportRespVO> selectCommissionReportLis(@Param("userId") Long userId, @Param("filterDate")String filterDate);

    public List<UserReportRespVO> selectUserReportLis(Userwin userwin);

    public List<GameReportRespVO> selectGameReportLis(Userwin userwin);

    public List<CollectReportRespVO> selectCollectReportLis(Userwin userwin);

    public List<ChildReportRespVO> selectChildReportList(@Param("userId") Long userId);

    public List<Userwin> selectLessTodayNoCommissionList();

    public List<Userwin> selectLessTodayNoCashBackList();
}
