package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.ImFriend;

/**
 * 好友Mapper接口
 * 
 * @author ruoyi
 * @date 2024-11-07
 */
public interface ImFriendMapper 
{
    /**
     * 查询好友
     * 
     * @param id 好友主键
     * @return 好友
     */
    public ImFriend selectImFriendById(Long id);

    /**
     * 查询好友列表
     * 
     * @param imFriend 好友
     * @return 好友集合
     */
    public List<ImFriend> selectImFriendList(ImFriend imFriend);

    /**
     * 新增好友
     * 
     * @param imFriend 好友
     * @return 结果
     */
    public int insertImFriend(ImFriend imFriend);

    /**
     * 修改好友
     * 
     * @param imFriend 好友
     * @return 结果
     */
    public int updateImFriend(ImFriend imFriend);

    /**
     * 删除好友
     * 
     * @param id 好友主键
     * @return 结果
     */
    public int deleteImFriendById(Long id);

    /**
     * 批量删除好友
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteImFriendByIds(Long[] ids);

    public int updateImFriendRemark(ImFriend imFriend);
}
