package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.vo.RecordSumRespVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.JssscrecordMapper;
import com.ruoyi.system.domain.Jssscrecord;
import com.ruoyi.system.service.IJssscrecordService;

/**
 * 极速时时彩下注Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@Service
public class JssscrecordServiceImpl implements IJssscrecordService 
{
    @Autowired
    private JssscrecordMapper jssscrecordMapper;

    /**
     * 查询极速时时彩下注
     * 
     * @param id 极速时时彩下注主键
     * @return 极速时时彩下注
     */
    @Override
    public Jssscrecord selectJssscrecordById(Long id)
    {
        return jssscrecordMapper.selectJssscrecordById(id);
    }

    /**
     * 查询极速时时彩下注列表
     * 
     * @param jssscrecord 极速时时彩下注
     * @return 极速时时彩下注
     */
    @Override
    public List<Jssscrecord> selectJssscrecordList(Jssscrecord jssscrecord)
    {
        return jssscrecordMapper.selectJssscrecordList(jssscrecord);
    }

    /**
     * 新增极速时时彩下注
     * 
     * @param jssscrecord 极速时时彩下注
     * @return 结果
     */
    @Override
    public int insertJssscrecord(Jssscrecord jssscrecord)
    {
        jssscrecord.setCreateTime(DateUtils.getNowDate());
        return jssscrecordMapper.insertJssscrecord(jssscrecord);
    }

    /**
     * 修改极速时时彩下注
     * 
     * @param jssscrecord 极速时时彩下注
     * @return 结果
     */
    @Override
    public int updateJssscrecord(Jssscrecord jssscrecord)
    {
        jssscrecord.setUpdateTime(DateUtils.getNowDate());
        return jssscrecordMapper.updateJssscrecord(jssscrecord);
    }

    /**
     * 批量删除极速时时彩下注
     * 
     * @param ids 需要删除的极速时时彩下注主键
     * @return 结果
     */
    @Override
    public int deleteJssscrecordByIds(Long[] ids)
    {
        return jssscrecordMapper.deleteJssscrecordByIds(ids);
    }

    /**
     * 删除极速时时彩下注信息
     * 
     * @param id 极速时时彩下注主键
     * @return 结果
     */
    @Override
    public int deleteJssscrecordById(Long id)
    {
        return jssscrecordMapper.deleteJssscrecordById(id);
    }

    @Override
    public int updateJssscrecordTotalAmountByPeriodId(Jssscrecord jssscrecord) {
        return jssscrecordMapper.updateJssscrecordTotalAmountByPeriodId(jssscrecord);
    }

    @Override
    public RecordSumRespVo selectSumRecordByPeriodId(Long periodId) {
        return jssscrecordMapper.selectSumRecordByPeriodId(periodId);
    }
}
