package com.ruoyi.system.service;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.system.domain.SysChat;
import com.ruoyi.common.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


/**
 * @author websocket服务
 */
@ServerEndpoint(value = "/websocket/{gameId}/{userId}")
@Component//将WebSocketServer注册为spring的一个bean
public class WebSocketServer {

    private static final Logger log = LoggerFactory.getLogger(WebSocketServer.class);

    /**
     * 记录当前在线连接游戏的客户端的session
     */
    public static final Map<String, Map<String, Session>> gameUserIdAndSessionMap = new ConcurrentHashMap<>();

    /**
     * 记录当前在线连接游戏的客户端的session
     */
    public static final Map<String, Map<String, String>> gameUserIdMap = new ConcurrentHashMap<>();

//    /**
//     * 记录当前在线连接的客户端的session
//     */
//    public static final Map<String, Session> userIdAndSessionMap = new ConcurrentHashMap<>();
    /**
     * 记录正在进行的聊天的发出者和接收者
     */
    public static final Map<String, Integer> fromToMap = new ConcurrentHashMap<>();
    /**
     * 用户Session保留时间，如果超过该时间，用户还没有给服务端发送消息，认为用户下线，删除其Session
     * 注意：该时间需要比客户端的心跳时间更长
     */
    private static final long expire = 600000;

    // websocket为多例模式，无法直接注入，需要换成下面的方式
//    @Autowired
//    RabbitTemplate rabbitTemplate;

    private static RabbitTemplate rabbitTemplate;

    @Autowired
    public void setRabbitTemplate(RabbitTemplate rabbitTemplate) {
        WebSocketServer.rabbitTemplate = rabbitTemplate;
    }

//    @Autowired
//    private static DelayQueueManager delayQueueManager;
//
//    @Autowired
//    public void setDelayQueueManager(DelayQueueManager delayQueueManager) {
//        WebSocketServer.delayQueueManager = delayQueueManager;
//    }
    private static ISysChatService chatService;

    @Autowired
    public void setChatService(ISysChatService chatService) {
        WebSocketServer.chatService = chatService;
    }

    /**
     * 浏览器和服务端连接建立成功之后会调用这个方法
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("gameId") String gameId, @PathParam("userId") String userId) throws IOException{
        String onlineKey = gameId + "&" + userId;
        Map<String, Session> gameSessionMap = new ConcurrentHashMap<>();
        Map<String, String> gameMap = new ConcurrentHashMap<>();
        if(gameUserIdAndSessionMap.containsKey(gameId)){
            gameSessionMap = gameUserIdAndSessionMap.get(gameId);
            if(!gameSessionMap.containsKey(userId)){
                gameSessionMap.put(userId,session);
                gameMap.put(userId,userId);
            }
        }else{
            gameSessionMap.put(userId,session);
            gameMap.put(userId,userId);
        }

        gameUserIdAndSessionMap.put(gameId,gameSessionMap);
        gameUserIdMap.put(gameId,gameMap);
//        log.info("有新用户加入，gameId={}，userId={}, 当前游戏在线人数为：{}", gameId, userId, gameSessionMap.size());
//        gameUserIdAndSessionMap.put(onlineKey,session);

//        userIdAndSessionMap.put(onlineKey, session);
        // 建立延时任务，如果到expire时间，客户端还是没有和服务器有任何交互的话，就删除该用户的session，表示该用户下线
//        delayQueueManager.put(new DelayTask(userId, expire));
//        log.info("有新用户加入，gameId={}，userId={}, 当前在线人数为：{}", gameId, userId, userIdAndSessionMap.size());

//        SysChat fromNoChat = new SysChat();
//        fromNoChat.setToUserId(Long.parseLong(userId));
//        fromNoChat.setIsRead("0");
//        fromNoChat.setDelFlag("0");
//        List<SysChat> noReadList = chatService.selectSysChatList(fromNoChat);
//        if(noReadList != null){
//            for(SysChat noReadChat : noReadList){
//                sendMessageTo(noReadChat.getFromUserId().toString(),userId,noReadChat.getContent());
////                noReadChat.setIsRead("1");
////                chatService.updateSysChat(noReadChat);
//            }
//        }
    }


    public void sendMessageTo(String gameId, String userId, String to, String message) throws IOException {
        // 根据to来获取相应的session，然后通过session将消息内容转发给相应的用户
//        String onlineKey = gameId + "&" + to;
//        Session toSession = userIdAndSessionMap.get(onlineKey);
//        if (toSession != null) {
//
//            JSONObject jsonObject = new JSONObject();
//
//            // 将json字符串转化为json对象
//            JSONObject messageObj = JSON.parseObject(message);
//
//            // 设置消息来源的用户名
//            jsonObject.put("from", userId);
//            // 设置消息类型
//            jsonObject.put("type", messageObj.get("type"));
//            // 设置消息内容
//            jsonObject.put("content", messageObj.get("message"));
//            if(messageObj.get("bussineType") != null){
//                // 设置消息业务类型
//                jsonObject.put("bussineType", messageObj.get("bussineType"));
//                // 设置消息业务ID
//                jsonObject.put("bussineId", messageObj.get("bussineId"));
//            }
//
//            // 服务端发送消息给目标客户端
//            this.sendMessage(jsonObject.toString(), toSession);
//            log.info("发送消息给用户 {} ，消息内容是：{} ", toSession, jsonObject.toString());
//        }
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(Session session, @PathParam("gameId") String gameId, @PathParam("userId") String userId) {
        String onlineKey = gameId + "&" + userId;
        Map<String, Session> gameSessionMap = gameUserIdAndSessionMap.get(gameId);
        Map<String, String> gameMap = gameUserIdMap.get(gameId);

        gameSessionMap.remove(userId);
        gameMap.remove(userId);
        if(gameSessionMap.size() == 0){
            gameUserIdAndSessionMap.remove(gameId);
            gameUserIdMap.remove(gameId);
        }
//        log.info("有一连接关闭，移除gameId={}userId={}的用户session, 当前游戏在线人数为：{}", gameId, userId, gameSessionMap.size());

//        userIdAndSessionMap.remove(onlineKey);
//        log.info("有一连接关闭，移除gameId={}userId={}的用户session, 当前在线人数为：{}", gameId, userId, userIdAndSessionMap.size());
    }

    /**
     * 发生错误的时候会调用这个方法
     */
    @OnError
    public void onError(Session session, Throwable error) {
        log.error("发生错误");
        error.printStackTrace();
    }

    /**
     * 服务端发送消息给客户端
     */
    public void sendMessage(String message, Session toSession) {
        try {
//            log.info("服务端给客户端[{}]发送消息{}", toSession.getId(), message);
            toSession.getBasicRemote().sendText(message);
        } catch (Exception e) {
//            log.error("服务端发送消息给客户端失败", e);
        }
    }

    /**
     * 根据发送消息到所有当前在线游戏ID
     *
     */
    public void sendMessageByGameIdToAllOnlineUser(String gameId, String fromUserId, String message) throws IOException {
        if(gameUserIdAndSessionMap.containsKey(gameId)){
            Map<String, Session> gameSessionMap = gameUserIdAndSessionMap.get(gameId);

            for(String key : gameSessionMap.keySet()){
                // 消息不推送给自己
                if(!StringUtils.isEmpty(fromUserId) && StringUtils.equals(key,fromUserId)){
                    continue;
                }
                Session toSession = gameSessionMap.get(key);
                // 服务端发送消息给目标客户端
                this.sendMessage(message, toSession);
//                log.info("发送消息给用户 {} ，消息内容是：{} ", toSession, message);
            }
        }
    }

    /**
     * 发送消息到给指定用户
     *
     */
    public void sendMessageToUser(String gameId, String toUserId, String message) throws IOException {
        if(gameUserIdAndSessionMap.containsKey(gameId)){
            Map<String, Session> gameSessionMap = gameUserIdAndSessionMap.get(gameId);
            if(gameSessionMap.containsKey(toUserId)){
                Session toSession = gameSessionMap.get(toUserId);
                // 服务端发送消息给目标客户端
                this.sendMessage(message, toSession);
            }
        }
    }

    public Map<String, Map<String, String>> getGameUserIdMap(){
        return gameUserIdMap;
    }

    public Map<String, String> getGameOnlineUserIdMap(String gameId){
        return gameUserIdMap.get(gameId);
    }

    /**
     * onMessage方法是一个消息的中转站
     * 1、首先接受浏览器端socket.send发送过来的json数据
     * 2、然后解析其数据，找到消息要发送给谁
     * 3、最后将数据发送给相应的人
     *
     * @param message 客户端发送过来的消息 数据格式：{"chatFromUserId":"user1","chatToUserId":"admin","content":"你好呀","avatar":"xxxx"}
     */
    @OnMessage
    public void onMessage(String message, Session session, @PathParam("gameId") String gameId, @PathParam("userId") String userId) {
//        log.info("服务端接收到 {} 的消息，消息内容是:{}", userId, message);

        // 收到用户的信息，删除之前的延时任务，创建新的延时任务
//        delayQueueManager.put(new DelayTask(userId, expire));
        String onlineKey = gameId + "&" + userId;

        // 可能用户挂机了一段时间，被下线了，后面又重新回来发信息了，需要重新将用户和session添加字典中
        Map<String, Session> gameSessionMap = new ConcurrentHashMap<>();
        if(gameUserIdAndSessionMap.containsKey(gameId)){
            gameSessionMap = gameUserIdAndSessionMap.get(gameId);
            if(!gameSessionMap.containsKey(userId)){
                gameSessionMap.put(userId,session);
                gameUserIdAndSessionMap.put(gameId,gameSessionMap);
            }
        }else{
            gameSessionMap.put(userId,session);
            gameUserIdAndSessionMap.put(gameId,gameSessionMap);
        }

//        if (!userIdAndSessionMap.containsKey(onlineKey)) {
//            // 可能用户挂机了一段时间，被下线了，后面又重新回来发信息了，需要重新将用户和session添加字典中
//            userIdAndSessionMap.put(onlineKey, session);
//        }

        // 将json字符串转化为json对象
        JSONObject obj = JSON.parseObject(message);
        String type = (String) obj.get("type");
        if(StringUtils.equals(type,"chat")){

            // 获取消息的内容
            String text = (String) obj.get("content");
            // 查看消息要发送给哪个用户
            String to = obj.get("chatToUserId").toString();
            // 封装数据发送给消息队列
            SysChat chat = new SysChat();
            chat.setFromUserId(Long.parseLong(userId));
            chat.setToUserId(Long.parseLong(to));
            chat.setContent(text);

            // 根据to来获取相应的session，然后通过session将消息内容转发给相应的用户
//            String toOnlineKey = gameId + "&" + to;
            Session toSession = gameSessionMap.get(to);
            chat.setIsRead("0"); //未读
            if (toSession != null) {

                JSONObject jsonObject = new JSONObject();
                // 设置消息来源的用户名
                jsonObject.put("chatFromUserId", userId);
                // 设置消息内容
                jsonObject.put("content", text);
                // 消息类型是聊天内容
                jsonObject.put("type", "chat");
                // 服务端发送消息给目标客户端
                this.sendMessage(jsonObject.toString(), toSession);
//                log.info("发送消息给用户 {} ，消息内容是：{} ", toSession, jsonObject.toString());
//                if (fromToMap.containsKey(toFromKey)) {
//                    chat.setIsRead("1"); //已读
//                }
            } else {

//                log.info("发送失败，未找到用户 {} 的session", to);
            }

            chatService.insertSysChat(chat);
        }
//            rabbitTemplate.convertAndSend(RabbitMqConstant.CHAT_STORAGE_EXCHANGE, RabbitMqConstant.CHAT_STORAGE_ROUTER_KEY, chat);
//        }
    }

}