import request from '@/utils/request'

// 查询3球特殊赔率列表
export function listOdds(query) {
  return request({
    url: '/system/odds/list',
    method: 'get',
    params: query
  })
}

// 查询3球特殊赔率详细
export function getOdds(mixedOddsId) {
  return request({
    url: '/system/odds/' + mixedOddsId,
    method: 'get'
  })
}

// 新增3球特殊赔率
export function addOdds(data) {
  return request({
    url: '/system/odds',
    method: 'post',
    data: data
  })
}

// 修改3球特殊赔率
export function updateOdds(data) {
  return request({
    url: '/system/odds',
    method: 'put',
    data: data
  })
}

// 删除3球特殊赔率
export function delOdds(mixedOddsId) {
  return request({
    url: '/system/odds/' + mixedOddsId,
    method: 'delete'
  })
}

export function getGameOddsInfo(query) {
  return request({
    url: '/system/odds/getGameOddsInfo',
    method: 'get',
    params: query
  })
}

