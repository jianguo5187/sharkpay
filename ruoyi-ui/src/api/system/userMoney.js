import request from '@/utils/request'

export function listCommissionList(query) {
  return request({
    url: '/system/usermoney/listCommissionList',
    method: 'get',
    params: query
  })
}

export function noApproveUpAndDownCnt(query) {
  return request({
    url: '/system/usermoney/noApproveUpAndDownCnt',
    method: 'get',
    params: query
  })
}
