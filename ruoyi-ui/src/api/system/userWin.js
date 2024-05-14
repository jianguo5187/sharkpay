import request from '@/utils/request'

export function listUserTotalRank(query) {
  return request({
    url: '/system/userwin/listUserTotalRank',
    method: 'get',
    params: query
  })
}
export function listUserGameRank(query) {
  return request({
    url: '/system/userwin/listUserGameRank',
    method: 'get',
    params: query
  })
}
