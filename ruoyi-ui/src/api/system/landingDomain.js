import request from '@/utils/request'

// 查询落地域名列表
export function listLandingDomain(query) {
  return request({
    url: '/system/landingDomain/list',
    method: 'get',
    params: query
  })
}

// 查询落地域名详细
export function getLandingDomain(landingDomainId) {
  return request({
    url: '/system/landingDomain/' + landingDomainId,
    method: 'get'
  })
}

// 新增落地域名
export function addLandingDomain(data) {
  return request({
    url: '/system/landingDomain',
    method: 'post',
    data: data
  })
}

// 修改落地域名
export function updateLandingDomain(data) {
  return request({
    url: '/system/landingDomain',
    method: 'put',
    data: data
  })
}

// 删除落地域名
export function delLandingDomain(landingDomainId) {
  return request({
    url: '/system/landingDomain/' + landingDomainId,
    method: 'delete'
  })
}
