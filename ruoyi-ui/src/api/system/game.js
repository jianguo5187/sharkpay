import request from '@/utils/request'

// 查询游戏列表
export function listGame(query) {
  return request({
    url: '/system/game/list',
    method: 'get',
    params: query
  })
}

// 查询游戏详细
export function getGame(gameId) {
  return request({
    url: '/system/game/' + gameId,
    method: 'get'
  })
}

// 新增游戏
export function addGame(data) {
  return request({
    url: '/system/game',
    method: 'post',
    data: data
  })
}

// 修改游戏
export function updateGame(data) {
  return request({
    url: '/system/game',
    method: 'put',
    data: data
  })
}

// 删除游戏
export function delGame(gameId) {
  return request({
    url: '/system/game/' + gameId,
    method: 'delete'
  })
}

// 查询有效的游戏列表
export function getValidGame(query) {
  return request({
    url: '/system/game/getValidGame',
    method: 'get',
    params: query
  })
}


// 获取客服聊天图片地址
export function getGameLimitSetting(query) {
  return request({
    url: '/system/app/getGameLimitSetting',
    method: 'get',
    params: query
  })
}

// 客服聊天图片上传
export function updateGameLimitSetting(data) {
  return request({
    url: '/system/app/updatGameLimitSetting',
    method: 'post',
    data: data
  })
}
