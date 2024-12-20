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

export function listNowCashBackDetail(query) {
  return request({
    url: '/system/userwin/nowCashBackDetailList',
    method: 'get',
    params: query
  })
}

export function listNoCashBackDetail(query) {
  return request({
    url: '/system/userwin/noCashBackDetailList',
    method: 'get',
    params: query
  })
}

export function listCashBackedDetail(query) {
  return request({
    url: '/system/userwin/cashBackedDetailList',
    method: 'get',
    params: query
  })
}

export function selectCashBackedTotalMoney(query) {
  return request({
    url: '/system/userwin/selectCashBackedTotalMoney',
    method: 'get',
    params: query
  })
}

export function cashBackAllRecord(data) {
  return request({
    url: '/system/userwin/cashBackAllRecord',
    method: 'post',
    data: data
  })
}

export function cashBackByUser(data) {
  return request({
    url: '/system/userwin/cashBackByUser',
    method: 'post',
    data: data
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
export function listUserReport(query) {
  return request({
    url: '/system/userwin/listUserReport',
    method: 'get',
    params: query
  })
}
export function listGameReport(query) {
  return request({
    url: '/system/userwin/listGameReport',
    method: 'get',
    params: query
  })
}
export function listCollectReport(query) {
  return request({
    url: '/system/userwin/listCollectReport',
    method: 'get',
    params: query
  })
}
