package com.ruoyi.system.service;

import java.util.Map;

public interface WebSocketMessageService {

    public void sendMessageToAllOnlineUser(Long gameId, Long fromUserId, String message);

    public void sendMessageToUser(Long gameId, Long toUserId, String message);

    public Map<String, Map<String, String>> getGameUserIdMap();

    public Map<String, String> getGameOnlineUserIdMap(String gameId);
}
