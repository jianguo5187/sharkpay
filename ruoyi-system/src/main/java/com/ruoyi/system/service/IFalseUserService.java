package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FalseUser;

/**
 * 投注机器人Service接口
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
public interface IFalseUserService 
{
    /**
     * 查询投注机器人
     * 
     * @param id 投注机器人主键
     * @return 投注机器人
     */
    public FalseUser selectFalseUserById(Long id);

    /**
     * 查询投注机器人列表
     * 
     * @param falseUser 投注机器人
     * @return 投注机器人集合
     */
    public List<FalseUser> selectFalseUserList(FalseUser falseUser);

    /**
     * 新增投注机器人
     * 
     * @param falseUser 投注机器人
     * @return 结果
     */
    public int insertFalseUser(FalseUser falseUser);

    /**
     * 修改投注机器人
     * 
     * @param falseUser 投注机器人
     * @return 结果
     */
    public int updateFalseUser(FalseUser falseUser);

    /**
     * 批量删除投注机器人
     * 
     * @param ids 需要删除的投注机器人主键集合
     * @return 结果
     */
    public int deleteFalseUserByIds(Long[] ids);

    /**
     * 删除投注机器人信息
     * 
     * @param id 投注机器人主键
     * @return 结果
     */
    public int deleteFalseUserById(Long id);
}
