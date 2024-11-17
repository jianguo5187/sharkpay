import request from '@/utils/request'

// 查询佣金转出审核列表
export function listCommissionTransfer(query) {
  return request({
    url: '/system/commissionTransfer/list',
    method: 'get',
    params: query
  })
}

// 查询佣金转出审核详细
export function getCommissionTransfer(id) {
  return request({
    url: '/system/commissionTransfer/' + id,
    method: 'get'
  })
}

// 新增佣金转出审核
export function addCommissionTransfer(data) {
  return request({
    url: '/system/commissionTransfer',
    method: 'post',
    data: data
  })
}

// 修改佣金转出审核
export function updateCommissionTransfer(data) {
  return request({
    url: '/system/commissionTransfer',
    method: 'put',
    data: data
  })
}

// 删除佣金转出审核
export function delCommissionTransfer(id) {
  return request({
    url: '/system/commissionTransfer/' + id,
    method: 'delete'
  })
}


// 同意申请
export function agreeTransferApply(data) {
  return request({
    url: '/system/commissionTransfer/agreeTransferApply',
    method: 'post',
    data: data
  })
}

// 拒绝申请
export function refuseTransferApply(data) {
  return request({
    url: '/system/commissionTransfer/refuseTransferApply',
    method: 'post',
    data: data
  })
}
