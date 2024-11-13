import request from '@/utils/request'

// 查询管理员操作记录列表
export function listAdminLog(query) {
  return request({
    url: '/system/adminLog/list',
    method: 'get',
    params: query
  })
}

// 查询管理员操作记录详细
export function getAdminLog(id) {
  return request({
    url: '/system/adminLog/' + id,
    method: 'get'
  })
}

// 新增管理员操作记录
export function addAdminLog(data) {
  return request({
    url: '/system/adminLog',
    method: 'post',
    data: data
  })
}

// 修改管理员操作记录
export function updateAdminLog(data) {
  return request({
    url: '/system/adminLog',
    method: 'put',
    data: data
  })
}

// 删除管理员操作记录
export function delAdminLog(id) {
  return request({
    url: '/system/adminLog/' + id,
    method: 'delete'
  })
}
