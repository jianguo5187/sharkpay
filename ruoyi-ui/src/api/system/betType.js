import request from '@/utils/request'

// 查询游戏玩法列表
export function listBetType(query) {
  return request({
    url: '/system/betType/list',
    method: 'get',
    params: query
  })
}

// 查询游戏玩法详细
export function getBetType(betTypeId) {
  return request({
    url: '/system/betType/' + betTypeId,
    method: 'get'
  })
}

// 新增游戏玩法
export function addBetType(data) {
  return request({
    url: '/system/betType',
    method: 'post',
    data: data
  })
}

// 修改游戏玩法
export function updateBetType(data) {
  return request({
    url: '/system/betType',
    method: 'put',
    data: data
  })
}

// 删除游戏玩法
export function delBetType(betTypeId) {
  return request({
    url: '/system/betType/' + betTypeId,
    method: 'delete'
  })
}

// 查询有效的游戏玩法列表
export function getValidBetType(data) {
  return request({
    url: '/system/betType/getValidBetType',
    method: 'post',
    data: data
  })
}
