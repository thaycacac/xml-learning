import request from './request'

export function getProducts() {
  return request({
    url: '/products',
    method: 'get'
  })
}

export function getProduct(id) {
  return request({
    url: `/products/${id}`,
    method: 'get'
  })
}

export function getOrders(id) {
  return request({
    url: `/user/orders/${id}`,
    method: 'get'
  })
}

export function getProductsInOrder(id) {
  return request({
    url: `/order/${id}`,
    method: 'get'
  })
}



export function login({ username, password }) {
  const dataFormat = `<UserDTO><username>${username}</username><password>${password}</password></UserDTO>`
  return request({
    url: '/user',
    data: dataFormat,
    method: 'post'
  })
}