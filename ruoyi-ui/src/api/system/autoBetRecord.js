import request from '@/utils/request'

// 查询追号列表
export function listAutoBetRecord(query) {
  return request({
    url: '/system/autoBetRecord/list',
    method: 'get',
    params: query
  })
}

// 查询追号详细
export function getAutoBetRecord(id) {
  return request({
    url: '/system/autoBetRecord/' + id,
    method: 'get'
  })
}

// 新增追号
export function addAutoBetRecord(data) {
  return request({
    url: '/system/autoBetRecord',
    method: 'post',
    data: data
  })
}

// 修改追号
export function updateAutoBetRecord(data) {
  return request({
    url: '/system/autoBetRecord',
    method: 'put',
    data: data
  })
}

// 删除追号
export function delAutoBetRecord(id) {
  return request({
    url: '/system/autoBetRecord/' + id,
    method: 'delete'
  })
}
