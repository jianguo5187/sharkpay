import request from '@/utils/request'

// 查询聊天用户列表
export function listChatUser() {
  return request({
    url: '/system/chat/getChatUserlist',
    method: 'get'
  })
}

// 查询聊天记录列表
export function listChatContent(data) {
  return request({
    url: '/system/chat/getChatContentlist',
    method: 'post',
    data: data
  })
}

// 修改消息为已读
export function updateChatReaded(data) {
  return request({
    url: '/system/chat/updateChatRead',
    method: 'post',
    data: data
  })
}
