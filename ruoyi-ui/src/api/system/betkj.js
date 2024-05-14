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
