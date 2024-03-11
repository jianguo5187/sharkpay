package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.SysChat;
import com.ruoyi.common.core.vo.req.ChatContentReqVO;
import com.ruoyi.common.core.vo.req.ChatHistoryReqVO;
import com.ruoyi.common.core.vo.req.ChatUpdateReadedReqVO;
import com.ruoyi.common.core.vo.resp.ChatUserListRespVO;
import com.ruoyi.system.mapper.SysChatMapper;
import com.ruoyi.system.service.ISysChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 聊天信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-12-28
 */
@Service
public class SysChatServiceImpl implements ISysChatService 
{
    @Autowired
    private SysChatMapper sysChatMapper;

    /**
     * 查询聊天信息
     * 
     * @param chatId 聊天信息主键
     * @return 聊天信息
     */
    @Override
    public SysChat selectSysChatByChatId(Long chatId)
    {
        return sysChatMapper.selectSysChatByChatId(chatId);
    }

    /**
     * 查询聊天信息列表
     * 
     * @param sysChat 聊天信息
     * @return 聊天信息
     */
    @Override
    public List<SysChat> selectSysChatList(SysChat sysChat)
    {
        return sysChatMapper.selectSysChatList(sysChat);
    }

    /**
     * 新增聊天信息
     * 
     * @param sysChat 聊天信息
     * @return 结果
     */
    @Override
    public int insertSysChat(SysChat sysChat)
    {
        return sysChatMapper.insertSysChat(sysChat);
    }

    /**
     * 修改聊天信息
     * 
     * @param sysChat 聊天信息
     * @return 结果
     */
    @Override
    public int updateSysChat(SysChat sysChat)
    {
        return sysChatMapper.updateSysChat(sysChat);
    }

    /**
     * 批量删除聊天信息
     * 
     * @param chatIds 需要删除的聊天信息主键
     * @return 结果
     */
    @Override
    public int deleteSysChatByChatIds(Long[]  chatIds)
    {
        return sysChatMapper.deleteSysChatByChatIds(chatIds);
    }

    /**
     * 删除聊天信息信息
     * 
     * @param chatId 聊天信息主键
     * @return 结果
     */
    @Override
    public int deleteSysChatByChatId(Long chatId)
    {
        return sysChatMapper.deleteSysChatByChatId(chatId);
    }



    /**
     * 查询聊天用户信息列表
     *
     * @param userId 聊天用户ID
     * @return 聊天用户信息集合
     */
    public List<ChatUserListRespVO> selectChatUserListByUserId(Long userId,Long deptId,Long parentUserId){return sysChatMapper.selectChatUserListByUserId(userId,deptId,parentUserId);};


    /**
     * 查询聊天信息列表
     *
     * @return 聊天信息集合
     */
    public List<ChatUserListRespVO> selectChatContentList(ChatContentReqVO vo){
        return sysChatMapper.selectChatContentList(vo.getChatFromUser(),vo.getChatToUser(), (vo.getPageNumber()-1)*20);
    }

    /**
     * 修改消息为已读
     *
     * @return 结果
     */
    public int updateChatReaded(ChatUpdateReadedReqVO vo){
        return sysChatMapper.updateChatReaded(vo.getChatFromUser(), vo.getChatToUser());
    }
    /**
     * 查询聊天历史信息列表
     *
     * @param vo 聊天信息
     * @return 聊天信息集合
     */
    public List<SysChat> historyList(ChatHistoryReqVO vo){
        return sysChatMapper.historyList(vo.getChatFromUser(),vo.getChatToUser(),(vo.getPageNumber()-1)*vo.getPageRowCount(),vo.getPageRowCount());
    }
}
