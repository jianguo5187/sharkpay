import request from '@/utils/request'

// 查询开奖列表
export function listBetkj(query) {
  return request({
    url: '/system/betkj/list',
    method: 'get',
    params: query
  })
}

// 查询开奖详细
export function getBetkj(id) {
  return request({
    url: '/system/betkj/' + id,
    method: 'get'
  })
}

// 手动修复开奖数据
export function repair(data) {
  return request({
    url: '/system/betkj/betRepair',
    method: 'post',
    data: data
  })
}

// 手动开奖
export function handleLottery(data) {
  return request({
    url: '/system/betkj/handleLottery',
    method: 'post',
    data: data
  })
}

export function listUserWinGameBet(query) {
  return request({
    url: '/system/betkj/listUserWinGameBet',
    method: 'get',
    params: query
  })
}

export function userDeduct(data) {
  return request({
    url: '/system/betkj/betUserDeduct',
    method: 'post',
    data: data
  })
}

// 自开奖重开
export function reOpen(data) {
  return request({
    url: '/system/betkj/reOpen',
    method: 'post',
    data: data
  })
}

// 自开奖修改开奖号码
export function editOpenCode(data) {
  return request({
    url: '/system/betkj/editOpenCode',
    method: 'post',
    data: data
  })
}

// 延迟开奖
export function sleepOpenCode(data) {
  return request({
    url: '/system/betkj/sleepOpenCode',
    method: 'post',
    data: data
  })
}

// 查询最后一条未开奖记录
export function getLastNoOpenRecord(query) {
  return request({
    url: '/system/betkj/getLastNoOpenRecord',
    method: 'get',
    params: query
  })
}
