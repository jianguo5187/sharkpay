package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.UserwinMapper;
import com.ruoyi.system.domain.Userwin;
import com.ruoyi.system.service.IUserwinService;

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
}
