import request from '@/utils/request'

// 查询支付方式列表
export function listPayment(query) {
  return request({
    url: '/system/payment/list',
    method: 'get',
    params: query
  })
}

// 查询支付方式详细
export function getPayment(id) {
  return request({
    url: '/system/payment/' + id,
    method: 'get'
  })
}

// 新增支付方式
export function addPayment(data) {
  return request({
    url: '/system/payment',
    method: 'post',
    data: data
  })
}

// 修改支付方式
export function updatePayment(data) {
  return request({
    url: '/system/payment',
    method: 'put',
    data: data
  })
}

// 删除支付方式
export function delPayment(id) {
  return request({
    url: '/system/payment/' + id,
    method: 'delete'
  })
}
