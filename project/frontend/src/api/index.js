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

export function createOrder({ customerId, orderDate, comment }) {
  const dataFormat = `<Order><customerId>${customerId}</customerId><orderDate>${orderDate}</orderDate><comment>${comment}</comment></Order>`
  return request({
    url: '/order',
    data: dataFormat,
    method: 'post'
  })
}

export function createOrderDetail({ orderID, productID, quantity }) {
  const dataFormat = `<OrderCreateDTO><orderID>${orderID}</orderID><productID>${productID}</productID><quantity>${quantity}</quantity></OrderCreateDTO>`
  return request({
    url: '/order/detail',
    data: dataFormat,
    method: 'post'
  })
}