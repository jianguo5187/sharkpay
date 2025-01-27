package com.ruoyi.system.service.impl;

import com.ruoyi.system.service.WebSocketMessageService;
import com.ruoyi.system.service.WebSocketServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Map;

@Service
public class WebSocketMessageServiceImpl implements WebSocketMessageService {

    @Autowired
    private WebSocketServer webSocketService;

    @Override
    public void sendMessageToAllOnlineUser(Long gameId, Long fromUserId, String message){
        try {
            if(fromUserId != null){
                webSocketService.sendMessageByGameIdToAllOnlineUser(gameId.toString(),fromUserId.toString(), message);
            }else{
                webSocketService.sendMessageByGameIdToAllOnlineUser(gameId.toString(),null, message);
            }
        } catch (IOException e) {
//            throw new RuntimeException(e);
        }
    }

    @Override
    public void sendMessageToUser(Long gameId, Long toUserId, String message) {
        try {
            webSocketService.sendMessageToUser(gameId.toString(),toUserId.toString(), message);
        } catch (IOException e) {
//            throw new RuntimeException(e);
        }
    }

    @Override
    public Map<String, Map<String, String>> getGameUserIdMap() {
        return webSocketService.getGameUserIdMap();
    }

    @Override
    public Map<String, String> getGameOnlineUserIdMap(String gameId) {
        return webSocketService.getGameOnlineUserIdMap(gameId);
    }
}
