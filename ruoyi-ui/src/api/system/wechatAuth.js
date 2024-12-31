import request from '@/utils/request'

// 查询授权域名列表
export function listWechatAuth(query) {
  return request({
    url: '/system/wechatAuth/list',
    method: 'get',
    params: query
  })
}

// 查询授权域名详细
export function getWechatAuth(wechatAuthId) {
  return request({
    url: '/system/wechatAuth/' + wechatAuthId,
    method: 'get'
  })
}

// 新增授权域名
export function addWechatAuth(data) {
  return request({
    url: '/system/wechatAuth',
    method: 'post',
    data: data
  })
}

// 修改授权域名
export function updateWechatAuth(data) {
  return request({
    url: '/system/wechatAuth',
    method: 'put',
    data: data
  })
}

// 删除授权域名
export function delWechatAuth(wechatAuthId) {
  return request({
    url: '/system/wechatAuth/' + wechatAuthId,
    method: 'delete'
  })
}
