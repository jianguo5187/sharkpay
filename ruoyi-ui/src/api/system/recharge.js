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
