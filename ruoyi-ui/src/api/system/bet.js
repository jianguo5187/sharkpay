import request from '@/utils/request'

// 查询实时投注列表
export function listBetRealTime(query) {
  return request({
    url: '/system/betRecord/listBetRealTime',
    method: 'get',
    params: query
  })
}

// 删除游戏投注项
export function adminCancelBetRecord(betRecordId) {
  return request({
    url: '/system/betRecord/adminCancel/' + betRecordId,
    method: 'delete'
  })
}
