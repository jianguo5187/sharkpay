import request from '@/utils/request'

// 查询入口域名列表
export function listEntryDomain(query) {
  return request({
    url: '/system/entryDomain/list',
    method: 'get',
    params: query
  })
}

// 查询入口域名详细
export function getEntryDomain(entryDomainId) {
  return request({
    url: '/system/entryDomain/' + entryDomainId,
    method: 'get'
  })
}

// 新增入口域名
export function addEntryDomain(data) {
  return request({
    url: '/system/entryDomain',
    method: 'post',
    data: data
  })
}

// 修改入口域名
export function updateEntryDomain(data) {
  return request({
    url: '/system/entryDomain',
    method: 'put',
    data: data
  })
}

// 删除入口域名
export function delEntryDomain(entryDomainId) {
  return request({
    url: '/system/entryDomain/' + entryDomainId,
    method: 'delete'
  })
}
