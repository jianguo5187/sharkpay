import request from '@/utils/request'

// 查询实时投注列表
export function listRecharge(query) {
  return request({
    url: '/system/usermoney/listRecharge',
    method: 'get',
    params: query
  })
}

// 同意申请
export function agreeApply(data) {
  return request({
    url: '/system/usermoney/agreeRechargeApply',
    method: 'post',
    data: data
  })
}

// 拒绝申请
export function refuseApply(data) {
  return request({
    url: '/system/usermoney/refuseRechargeApply',
    method: 'post',
    data: data
  })
}

// 管理员上分
export function adminRecharge(data) {
  return request({
    url: '/system/usermoney/adminRecharge',
    method: 'post',
    data: data
  })
}

export function listUserMoneyUpTotal(query) {
  return request({
    url: '/system/usermoney/listUserMoneyUpTotal',
    method: 'get',
    params: query
  })
}

export function noApproveRechargeCnt(query) {
  return request({
    url: '/system/usermoney/getNoApproveRechargeCnt',
    method: 'get',
    params: query
  })
}

// 流水统计列表
export function listUserFlowMoney(query) {
  return request({
    url: '/system/usermoney/listUserFlowMoney',
    method: 'get',
    params: query
  })
}

export function updateUpDownAmount(data) {
  return request({
    url: '/system/usermoney/updateUpDownAmount',
    method: 'post',
    data: data
  })
}
