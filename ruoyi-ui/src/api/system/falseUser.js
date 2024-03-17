import request from '@/utils/request'

// 查询投注机器人列表
export function listFalseUser(query) {
  return request({
    url: '/system/falseUser/list',
    method: 'get',
    params: query
  })
}

// 查询投注机器人详细
export function getFalseUser(id) {
  return request({
    url: '/system/falseUser/' + id,
    method: 'get'
  })
}

// 新增投注机器人
export function addFalseUser(data) {
  return request({
    url: '/system/falseUser',
    method: 'post',
    data: data
  })
}

// 修改投注机器人
export function updateFalseUser(data) {
  return request({
    url: '/system/falseUser',
    method: 'put',
    data: data
  })
}

// 删除投注机器人
export function delFalseUser(id) {
  return request({
    url: '/system/falseUser/' + id,
    method: 'delete'
  })
}
