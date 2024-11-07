package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ImFriendMapper;
import com.ruoyi.system.domain.ImFriend;
import com.ruoyi.system.service.IImFriendService;

/**
 * 好友Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-11-07
 */
@Service
public class ImFriendServiceImpl implements IImFriendService 
{
    @Autowired
    private ImFriendMapper imFriendMapper;

    /**
     * 查询好友
     * 
     * @param id 好友主键
     * @return 好友
     */
    @Override
    public ImFriend selectImFriendById(Long id)
    {
        return imFriendMapper.selectImFriendById(id);
    }

    /**
     * 查询好友列表
     * 
     * @param imFriend 好友
     * @return 好友
     */
    @Override
    public List<ImFriend> selectImFriendList(ImFriend imFriend)
    {
        return imFriendMapper.selectImFriendList(imFriend);
    }

    /**
     * 新增好友
     * 
     * @param imFriend 好友
     * @return 结果
     */
    @Override
    public int insertImFriend(ImFriend imFriend)
    {
        return imFriendMapper.insertImFriend(imFriend);
    }

    /**
     * 修改好友
     * 
     * @param imFriend 好友
     * @return 结果
     */
    @Override
    public int updateImFriend(ImFriend imFriend)
    {
        return imFriendMapper.updateImFriend(imFriend);
    }

    /**
     * 批量删除好友
     * 
     * @param ids 需要删除的好友主键
     * @return 结果
     */
    @Override
    public int deleteImFriendByIds(Long[] ids)
    {
        return imFriendMapper.deleteImFriendByIds(ids);
    }

    /**
     * 删除好友信息
     * 
     * @param id 好友主键
     * @return 结果
     */
    @Override
    public int deleteImFriendById(Long id)
    {
        return imFriendMapper.deleteImFriendById(id);
    }
}
