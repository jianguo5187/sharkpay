import request from '@/utils/request'

// 查询实时投注列表
export function selectHomePageData(query) {
  return request({
    url: '/system/app/getHomePageData',
    method: 'get',
    params: query
  })
}

export function selectImChatUrl(query) {
  return request({
    url: '/system/app/getImChatUrl',
    method: 'get',
    params: query
  })
}