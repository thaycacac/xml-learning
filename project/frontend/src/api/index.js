import request from './request'

export function getProducts() {
  return request({
    url: '/products',
    method: 'get'
  })
}
