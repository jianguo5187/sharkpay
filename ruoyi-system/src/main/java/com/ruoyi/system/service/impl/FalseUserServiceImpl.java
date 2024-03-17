package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FalseUserMapper;
import com.ruoyi.system.domain.FalseUser;
import com.ruoyi.system.service.IFalseUserService;

/**
 * 投注机器人Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-03-17
 */
@Service
public class FalseUserServiceImpl implements IFalseUserService 
{
    @Autowired
    private FalseUserMapper falseUserMapper;

    /**
     * 查询投注机器人
     * 
     * @param id 投注机器人主键
     * @return 投注机器人
     */
    @Override
    public FalseUser selectFalseUserById(Long id)
    {
        return falseUserMapper.selectFalseUserById(id);
    }

    /**
     * 查询投注机器人列表
     * 
     * @param falseUser 投注机器人
     * @return 投注机器人
     */
    @Override
    public List<FalseUser> selectFalseUserList(FalseUser falseUser)
    {
        return falseUserMapper.selectFalseUserList(falseUser);
    }

    /**
     * 新增投注机器人
     * 
     * @param falseUser 投注机器人
     * @return 结果
     */
    @Override
    public int insertFalseUser(FalseUser falseUser)
    {
        falseUser.setCreateTime(DateUtils.getNowDate());
        return falseUserMapper.insertFalseUser(falseUser);
    }

    /**
     * 修改投注机器人
     * 
     * @param falseUser 投注机器人
     * @return 结果
     */
    @Override
    public int updateFalseUser(FalseUser falseUser)
    {
        falseUser.setUpdateTime(DateUtils.getNowDate());
        return falseUserMapper.updateFalseUser(falseUser);
    }

    /**
     * 批量删除投注机器人
     * 
     * @param ids 需要删除的投注机器人主键
     * @return 结果
     */
    @Override
    public int deleteFalseUserByIds(Long[] ids)
    {
        return falseUserMapper.deleteFalseUserByIds(ids);
    }

    /**
     * 删除投注机器人信息
     * 
     * @param id 投注机器人主键
     * @return 结果
     */
    @Override
    public int deleteFalseUserById(Long id)
    {
        return falseUserMapper.deleteFalseUserById(id);
    }
}
