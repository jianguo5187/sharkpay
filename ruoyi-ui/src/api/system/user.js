import request from '@/utils/request'
import { parseStrEmpty } from "@/utils/ruoyi";

// 查询用户列表
export function listUser(query) {
  return request({
    url: '/system/user/list',
    method: 'get',
    params: query
  })
}

// 查询用户详细
export function getUser(userId) {
  return request({
    url: '/system/user/' + parseStrEmpty(userId),
    method: 'get'
  })
}

// 新增用户
export function addUser(data) {
  return request({
    url: '/system/user',
    method: 'post',
    data: data
  })
}

// 修改用户
export function updateUser(data) {
  return request({
    url: '/system/user',
    method: 'put',
    data: data
  })
}

// 删除用户
export function delUser(userId) {
  return request({
    url: '/system/user/' + userId,
    method: 'delete'
  })
}

// 用户密码重置
export function resetUserPwd(userId, password) {
  const data = {
    userId,
    password
  }
  return request({
    url: '/system/user/resetPwd',
    method: 'put',
    data: data
  })
}
// 用户支付密码重置
export function resetUserPayPwd(userId, payPassword) {
  const data = {
    userId,
    payPassword
  }
  return request({
    url: '/system/user/resetPayPwd',
    method: 'put',
    data: data
  })
}

// 用户状态修改
export function changeUserStatus(userId, status) {
  const data = {
    userId,
    status
  }
  return request({
    url: '/system/user/changeStatus',
    method: 'put',
    data: data
  })
}

// 查询用户个人信息
export function getUserProfile() {
  return request({
    url: '/system/user/profile',
    method: 'get'
  })
}

// 修改用户个人信息
export function updateUserProfile(data) {
  return request({
    url: '/system/user/profile',
    method: 'put',
    data: data
  })
}

// 用户密码重置
export function updateUserPwd(oldPassword, newPassword) {
  const data = {
    oldPassword,
    newPassword
  }
  return request({
    url: '/system/user/profile/updatePwd',
    method: 'put',
    params: data
  })
}

// 用户头像上传
export function uploadAvatar(data) {
  return request({
    url: '/system/user/profile/avatar',
    method: 'post',
    data: data
  })
}

// 查询授权角色
export function getAuthRole(userId) {
  return request({
    url: '/system/user/authRole/' + userId,
    method: 'get'
  })
}

// 保存授权角色
export function updateAuthRole(data) {
  return request({
    url: '/system/user/authRole',
    method: 'put',
    params: data
  })
}

// 查询部门下拉树结构
export function deptTreeSelect() {
  return request({
    url: '/system/user/deptTree',
    method: 'get'
  })
}

// 用户列表
export function selectAllUser() {
  return request({
    url: '/system/app/getAllUserList',
    method: 'get',
  })
}
// 查询用户列表
export function listAgentUser(query) {
  return request({
    url: '/system/user/agentUserList',
    method: 'get',
    params: query
  })
}

// 获取LOGO图片地址
export function getLogoImg(query) {
  return request({
    url: '/system/app/getLogoImg',
    method: 'get',
    params: query
  })
}

// 用户头像上传
export function updateLogoImg(data) {
  return request({
    url: '/system/app/updateLogoImg',
    method: 'post',
    data: data
  })
}

// 用户备注名修改
export function resetUserRemarkName(userId, remarkName) {
  const data = {
    userId,
    remarkName
  }
  return request({
    url: '/system/user/updateUserRemarkName',
    method: 'put',
    data: data
  })
}

// 合并用户
export function mergeUser(data) {
  return request({
    url: '/system/user/mergeUser',
    method: 'post',
    data: data
  })
}


// 获取客服聊天图片地址
export function getChatImg(query) {
  return request({
    url: '/system/app/getChatImg',
    method: 'get',
    params: query
  })
}

// 客服聊天图片上传
export function updateChatImg(data) {
  return request({
    url: '/system/app/updateChatImg',
    method: 'post',
    data: data
  })
}
