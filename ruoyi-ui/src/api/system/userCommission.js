import request from '@/utils/request'

// 查询用户佣金列表
export function listUserCommission(query) {
  return request({
    url: '/system/userCommission/list',
    method: 'get',
    params: query
  })
}

// 查询用户佣金详细
export function getUserCommission(id) {
  return request({
    url: '/system/userCommission/' + id,
    method: 'get'
  })
}

// 新增用户佣金
export function addUserCommission(data) {
  return request({
    url: '/system/userCommission',
    method: 'post',
    data: data
  })
}

// 修改用户佣金
export function updateUserCommission(data) {
  return request({
    url: '/system/userCommission',
    method: 'put',
    data: data
  })
}

// 删除用户佣金
export function delUserCommission(id) {
  return request({
    url: '/system/userCommission/' + id,
    method: 'delete'
  })
}
