import request from '@/utils/request'

// 查询实时投注列表
export function listPostal(query) {
  return request({
    url: '/system/usermoney/listPostal',
    method: 'get',
    params: query
  })
}

// 同意申请
export function agreeApply(data) {
  return request({
    url: '/system/usermoney/agreePostalApply',
    method: 'post',
    data: data
  })
}

// 拒绝申请
export function refuseApply(data) {
  return request({
    url: '/system/usermoney/refusePostalApply',
    method: 'post',
    data: data
  })
}

// 管理员下分
export function adminPostal(data) {
  return request({
    url: '/system/usermoney/adminPostal',
    method: 'post',
    data: data
  })
}

export function listUserMoneyDownTotal(query) {
  return request({
    url: '/system/usermoney/listUserMoneyDownTotal',
    method: 'get',
    params: query
  })
}
