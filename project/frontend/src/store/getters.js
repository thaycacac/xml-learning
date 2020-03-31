import shop from '@/api/shop'

export default {
  availableProducts(state, getters) {
    return state.products.filter(product => product.quantityInStock._text > 0)
  },
  cartProducts(state) {
    return state.cart.map(cartItem => {
      const product = state.products.find(product => product.id === cartItem.id)
      return {
        title: product.title,
        price: product.price,
        img: product.img,
        quantity: cartItem.quantity
      }
    })
  },
  cartTotal(state, getters) {
    return getters.cartProducts.reduce((total,product) => total + product.price * product.quantity, 0)
  },

  productInStock() {
    return(product) => {
      return product.quantityInStock._text > 0
    }
  }
}
