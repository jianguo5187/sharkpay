package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.SysChat;
import com.ruoyi.common.core.vo.resp.ChatUserListRespVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 聊天信息Mapper接口
 * 
 * @author ruoyi
 * @date 2023-12-28
 */
public interface SysChatMapper 
{
    /**
     * 查询聊天信息
     * 
     * @param chatId 聊天信息主键
     * @return 聊天信息
     */
    public SysChat selectSysChatByChatId(Long chatId);

    /**
     * 查询聊天信息列表
     * 
     * @param sysChat 聊天信息
     * @return 聊天信息集合
     */
    public List<SysChat> selectSysChatList(SysChat sysChat);

    /**
     * 新增聊天信息
     * 
     * @param sysChat 聊天信息
     * @return 结果
     */
    public int insertSysChat(SysChat sysChat);

    /**
     * 修改聊天信息
     * 
     * @param sysChat 聊天信息
     * @return 结果
     */
    public int updateSysChat(SysChat sysChat);

    /**
     * 删除聊天信息
     * 
     * @param chatId 聊天信息主键
     * @return 结果
     */
    public int deleteSysChatByChatId(Long chatId);

    /**
     * 批量删除聊天信息
     * 
     * @param chatIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysChatByChatIds(Long[]  chatIds);


    /**
     * 查询聊天用户信息列表
     *
     * @param userId 聊天用户ID
     * @param deptId 聊天用户部门ID
     * @return 聊天用户信息集合
     */
    public List<ChatUserListRespVO> selectChatUserListByUserId(@Param("userId")Long userId,@Param("deptId")Long deptId,@Param("parentUserId")Long parentUserId);


    /**
     * 查询聊天信息列表
     *
     * @return 聊天信息集合
     */
    public List<ChatUserListRespVO> selectChatContentList(@Param("chatFromUser")Long chatFromUser, @Param("chatToUser")Long chatToUser, @Param("pageNumber")Integer pageNumber);

    /**
     * 修改消息为已读
     *
     * @return 结果
     */
    public int updateChatReaded(@Param("chatFromUser")Long chatFromUser, @Param("chatToUser")Long chatToUser);

    /**
     * 查询聊天历史信息列表
     *
     * @return 聊天信息集合
     */
    public List<SysChat> historyList(@Param("chatFromUser")Long chatFromUser, @Param("chatToUser")Long chatToUser, @Param("pageNumber")Integer pageNumber, @Param("pageRowCount")Integer pageRowCount);
}
