package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysChat;
import com.ruoyi.common.core.vo.req.ChatContentReqVO;
import com.ruoyi.common.core.vo.req.ChatHistoryReqVO;
import com.ruoyi.common.core.vo.req.ChatUpdateReadedReqVO;
import com.ruoyi.common.core.vo.resp.ChatUserListRespVO;

import java.util.List;

/**
 * 聊天信息Service接口
 * 
 * @author ruoyi
 * @date 2023-12-28
 */
public interface ISysChatService 
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
     * 批量删除聊天信息
     * 
     * @param chatIds 需要删除的聊天信息主键集合
     * @return 结果
     */
    public int deleteSysChatByChatIds(Long[]  chatIds);

    /**
     * 删除聊天信息信息
     * 
     * @param chatId 聊天信息主键
     * @return 结果
     */
    public int deleteSysChatByChatId(Long chatId);


    /**
     * 查询聊天用户信息列表
     *
     * @param userId 聊天用户ID
     * @return 聊天用户信息集合
     */
    public List<ChatUserListRespVO> selectChatUserListByUserId(Long userId,Long deptId,Long parentUserId);

    /**
     * 查询聊天信息列表
     *
     * @return 聊天信息集合
     */
    public List<ChatUserListRespVO> selectChatContentList(ChatContentReqVO vo);


    /**
     * 修改消息为已读
     *
     * @return 结果
     */
    public int updateChatReaded(ChatUpdateReadedReqVO vo);
    /**
     * 查询聊天历史信息列表
     *
     * @param vo 聊天信息
     * @return 聊天信息集合
     */
    public List<SysChat> historyList(ChatHistoryReqVO vo);
}
