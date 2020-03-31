import request from './request'

export function getProducts() {
  return request({
    url: '/products',
    method: 'get'
  })
}

export function login({ username, password }) {
  const dataFormat = `<UserDTO><username>${username}</username><password>${password}</password></UserDTO>`
  return request({
    url: '/user',
    data: dataFormat
  })
}