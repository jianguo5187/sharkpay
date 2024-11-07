package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ImUserMapper;
import com.ruoyi.system.domain.ImUser;
import com.ruoyi.system.service.IImUserService;

/**
 * 用户Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-11-07
 */
@Service
public class ImUserServiceImpl implements IImUserService 
{
    @Autowired
    private ImUserMapper imUserMapper;

    /**
     * 查询用户
     * 
     * @param id 用户主键
     * @return 用户
     */
    @Override
    public ImUser selectImUserById(Long id)
    {
        return imUserMapper.selectImUserById(id);
    }

    /**
     * 查询用户列表
     * 
     * @param imUser 用户
     * @return 用户
     */
    @Override
    public List<ImUser> selectImUserList(ImUser imUser)
    {
        return imUserMapper.selectImUserList(imUser);
    }

    /**
     * 新增用户
     * 
     * @param imUser 用户
     * @return 结果
     */
    @Override
    public int insertImUser(ImUser imUser)
    {
        return imUserMapper.insertImUser(imUser);
    }

    /**
     * 修改用户
     * 
     * @param imUser 用户
     * @return 结果
     */
    @Override
    public int updateImUser(ImUser imUser)
    {
        return imUserMapper.updateImUser(imUser);
    }

    /**
     * 批量删除用户
     * 
     * @param ids 需要删除的用户主键
     * @return 结果
     */
    @Override
    public int deleteImUserByIds(Long[] ids)
    {
        return imUserMapper.deleteImUserByIds(ids);
    }

    /**
     * 删除用户信息
     * 
     * @param id 用户主键
     * @return 结果
     */
    @Override
    public int deleteImUserById(Long id)
    {
        return imUserMapper.deleteImUserById(id);
    }
}
