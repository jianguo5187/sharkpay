package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.RobotBetOption;

/**
 * 投注话术Mapper接口
 * 
 * @author ruoyi
 * @date 2024-12-02
 */
public interface RobotBetOptionMapper 
{
    /**
     * 查询投注话术
     * 
     * @param id 投注话术主键
     * @return 投注话术
     */
    public RobotBetOption selectRobotBetOptionById(Long id);

    /**
     * 查询投注话术列表
     * 
     * @param robotBetOption 投注话术
     * @return 投注话术集合
     */
    public List<RobotBetOption> selectRobotBetOptionList(RobotBetOption robotBetOption);

    /**
     * 新增投注话术
     * 
     * @param robotBetOption 投注话术
     * @return 结果
     */
    public int insertRobotBetOption(RobotBetOption robotBetOption);

    /**
     * 修改投注话术
     * 
     * @param robotBetOption 投注话术
     * @return 结果
     */
    public int updateRobotBetOption(RobotBetOption robotBetOption);

    /**
     * 删除投注话术
     * 
     * @param id 投注话术主键
     * @return 结果
     */
    public int deleteRobotBetOptionById(Long id);

    /**
     * 批量删除投注话术
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRobotBetOptionByIds(Long[] ids);
}
