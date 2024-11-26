package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.BetRecord;
import com.ruoyi.system.domain.vo.BetRealTimeReqVO;
import com.ruoyi.system.domain.vo.BetRealTimeRespVO;

/**
 * 投注单Service接口
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public interface IBetRecordService 
{
    /**
     * 查询投注单
     * 
     * @param betId 投注单主键
     * @return 投注单
     */
    public BetRecord selectBetRecordByBetId(Long betId);

    /**
     * 查询投注单列表
     * 
     * @param betRecord 投注单
     * @return 投注单集合
     */
    public List<BetRecord> selectBetRecordList(BetRecord betRecord);

    /**
     * 新增投注单
     * 
     * @param betRecord 投注单
     * @return 结果
     */
    public int insertBetRecord(BetRecord betRecord);

    /**
     * 修改投注单
     * 
     * @param betRecord 投注单
     * @return 结果
     */
    public int updateBetRecord(BetRecord betRecord);

    /**
     * 批量删除投注单
     * 
     * @param betIds 需要删除的投注单主键集合
     * @return 结果
     */
    public int deleteBetRecordByBetIds(Long[] betIds);

    /**
     * 删除投注单信息
     * 
     * @param betId 投注单主键
     * @return 结果
     */
    public int deleteBetRecordByBetId(Long betId);


    public int updateLotteryResult(BetRecord betRecord);

    public List<BetRealTimeRespVO> selectBetRealTimeList(BetRealTimeReqVO vo);

    public void adminCancelBetRecord(Long userId, Long betId);

    public Float selectUserTodayBetAmountTotal(Long userId);
}
