package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Userwin;
import com.ruoyi.system.domain.vo.*;

/**
 * 用户盈亏Service接口
 * 
 * @author ruoyi
 * @date 2024-03-24
 */
public interface IUserwinService 
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
     * 批量删除用户盈亏
     * 
     * @param ids 需要删除的用户盈亏主键集合
     * @return 结果
     */
    public int deleteUserwinByIds(Long[] ids);

    /**
     * 删除用户盈亏信息
     * 
     * @param id 用户盈亏主键
     * @return 结果
     */
    public int deleteUserwinById(Long id);

    public Userwin selectTodayUserwin(Long gameId,Long userId);

    public List<UserTotalRankListRespVO> selectUserTotalRankList(Userwin userwin);

    public List<UserGameWinRankListRespVO> selectUserGameRankList(Userwin userwin);

    public List<CashBackDetailListRespVO> selectCashBackDetailList(Userwin userwin);

    public void cashBackYestoday(Long userId);

    public void cashBackUser(Long userId,Userwin userwin);

    public List<CashBackDetailListRespVO> selectCashBackList(Userwin userwin);

    public List<CommissionDetailListRespVO> selectCommissionDetailList(Userwin userwin);

    public void commissionYestoday(Long userId);

    public void commissionUser(Long userId,Userwin userwin);

    public List<TotalReportRespVO> selectTotalReportLis(Userwin userwin);

    public List<UserReportRespVO> selectUserReportLis(Userwin userwin);

    public List<GameReportRespVO> selectGameReportLis(Userwin userwin);

    public List<CollectReportRespVO> selectCollectReportLis(Userwin userwin);
}
