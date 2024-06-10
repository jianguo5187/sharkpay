import request from '@/utils/request'

export function listUserTotalRank(query) {
  return request({
    url: '/system/userwin/listUserTotalRank',
    method: 'get',
    params: query
  })
}
export function listUserGameRank(query) {
  return request({
    url: '/system/userwin/listUserGameRank',
    method: 'get',
    params: query
  })
}

export function listCashBackDetail(query) {
  return request({
    url: '/system/userwin/cashBackDetailList',
    method: 'get',
    params: query
  })
}

export function cashBackYestoday(data) {
  return request({
    url: '/system/userwin/cashBackYestoday',
    method: 'post',
    data: data
  })
}

export function cashBackUser(data) {
  return request({
    url: '/system/userwin/cashBackUser',
    method: 'post',
    data: data
  })
}
export function listCashBackList(query) {
  return request({
    url: '/system/userwin/cashBackList',
    method: 'get',
    params: query
  })
}

export function listCommissionDetail(query) {
  return request({
    url: '/system/userwin/commissionDetailList',
    method: 'get',
    params: query
  })
}

export function commissionYestoday(data) {
  return request({
    url: '/system/userwin/commissionYestoday',
    method: 'post',
    data: data
  })
}

export function commissionUser(data) {
  return request({
    url: '/system/userwin/commissionUser',
    method: 'post',
    data: data
  })
}
export function listTotalReport(query) {
  return request({
    url: '/system/userwin/listTotalReport',
    method: 'get',
    params: query
  })
}
