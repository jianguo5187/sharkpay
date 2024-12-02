package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.RobotBetOptionMapper;
import com.ruoyi.system.domain.RobotBetOption;
import com.ruoyi.system.service.IRobotBetOptionService;

/**
 * 投注话术Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-12-02
 */
@Service
public class RobotBetOptionServiceImpl implements IRobotBetOptionService 
{
    @Autowired
    private RobotBetOptionMapper robotBetOptionMapper;

    /**
     * 查询投注话术
     * 
     * @param id 投注话术主键
     * @return 投注话术
     */
    @Override
    public RobotBetOption selectRobotBetOptionById(Long id)
    {
        return robotBetOptionMapper.selectRobotBetOptionById(id);
    }

    /**
     * 查询投注话术列表
     * 
     * @param robotBetOption 投注话术
     * @return 投注话术
     */
    @Override
    public List<RobotBetOption> selectRobotBetOptionList(RobotBetOption robotBetOption)
    {
        return robotBetOptionMapper.selectRobotBetOptionList(robotBetOption);
    }

    /**
     * 新增投注话术
     * 
     * @param robotBetOption 投注话术
     * @return 结果
     */
    @Override
    public int insertRobotBetOption(RobotBetOption robotBetOption)
    {
        robotBetOption.setCreateTime(DateUtils.getNowDate());
        return robotBetOptionMapper.insertRobotBetOption(robotBetOption);
    }

    /**
     * 修改投注话术
     * 
     * @param robotBetOption 投注话术
     * @return 结果
     */
    @Override
    public int updateRobotBetOption(RobotBetOption robotBetOption)
    {
        robotBetOption.setUpdateTime(DateUtils.getNowDate());
        return robotBetOptionMapper.updateRobotBetOption(robotBetOption);
    }

    /**
     * 批量删除投注话术
     * 
     * @param ids 需要删除的投注话术主键
     * @return 结果
     */
    @Override
    public int deleteRobotBetOptionByIds(Long[] ids)
    {
        return robotBetOptionMapper.deleteRobotBetOptionByIds(ids);
    }

    /**
     * 删除投注话术信息
     * 
     * @param id 投注话术主键
     * @return 结果
     */
    @Override
    public int deleteRobotBetOptionById(Long id)
    {
        return robotBetOptionMapper.deleteRobotBetOptionById(id);
    }
}
