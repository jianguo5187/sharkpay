import request from '@/utils/request'

// 查询投注话术列表
export function listRobotBetOption(query) {
  return request({
    url: '/system/robotBetOption/list',
    method: 'get',
    params: query
  })
}

// 查询投注话术详细
export function getRobotBetOption(id) {
  return request({
    url: '/system/robotBetOption/' + id,
    method: 'get'
  })
}

// 新增投注话术
export function addRobotBetOption(data) {
  return request({
    url: '/system/robotBetOption',
    method: 'post',
    data: data
  })
}

// 修改投注话术
export function updateRobotBetOption(data) {
  return request({
    url: '/system/robotBetOption',
    method: 'put',
    data: data
  })
}

// 删除投注话术
export function delRobotBetOption(id) {
  return request({
    url: '/system/robotBetOption/' + id,
    method: 'delete'
  })
}
