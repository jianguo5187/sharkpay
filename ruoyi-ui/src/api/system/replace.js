import request from '@/utils/request'

// 查询广告轮播图列表
export function listReplace(query) {
  return request({
    url: '/system/replace/list',
    method: 'get',
    params: query
  })
}

// 查询广告轮播图详细
export function getReplace(replaceId) {
  return request({
    url: '/system/replace/' + replaceId,
    method: 'get'
  })
}

// 新增广告轮播图
export function addReplace(data) {
  return request({
    url: '/system/replace',
    method: 'post',
    data: data
  })
}

// 修改广告轮播图
export function updateReplace(data) {
  return request({
    url: '/system/replace',
    method: 'put',
    data: data
  })
}

// 删除广告轮播图
export function delReplace(replaceId) {
  return request({
    url: '/system/replace/' + replaceId,
    method: 'delete'
  })
}
