import request from './request'

export function getListProduct() {
  return request({
    url: '/products',
    method: 'get'
  })
}
