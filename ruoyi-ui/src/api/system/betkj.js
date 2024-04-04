import request from '@/utils/request'

// 查询开奖列表
export function listBetkj(query) {
  return request({
    url: '/system/betkj/list',
    method: 'get',
    params: query
  })
}

// 查询开奖详细
export function getBetkj(id) {
  return request({
    url: '/system/betkj/' + id,
    method: 'get'
  })
}

