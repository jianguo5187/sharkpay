import request from '@/utils/request'

// 查询游戏投注项列表
export function listBetItem(query) {
  return request({
    url: '/system/betItem/list',
    method: 'get',
    params: query
  })
}
export function betItemList(query) {
  return request({
    url: '/system/betItem/betItemList',
    method: 'get',
    params: query
  })
}

// 查询游戏投注项详细
export function getBetItem(betItemId) {
  return request({
    url: '/system/betItem/' + betItemId,
    method: 'get'
  })
}

// 新增游戏投注项
export function addBetItem(data) {
  return request({
    url: '/system/betItem',
    method: 'post',
    data: data
  })
}

// 修改游戏投注项
export function updateBetItem(data) {
  return request({
    url: '/system/betItem',
    method: 'put',
    data: data
  })
}

// 删除游戏投注项
export function delBetItem(betItemId) {
  return request({
    url: '/system/betItem/' + betItemId,
    method: 'delete'
  })
}
