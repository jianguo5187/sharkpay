import request from '@/utils/request'
import kefuRequest from '@/utils/kefuRequest'

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

export function selectUserTotalAmount(query) {
  return request({
    url: '/system/app/getUserTotalAmount',
    method: 'get',
    params: query
  })
}

export function getKefuNoReadCnt(data) {
  return kefuRequest({
    url: '/noAuthKefuNoReadCnt',
    method: 'post',
    data: data
  })
}
