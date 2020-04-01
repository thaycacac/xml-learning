export default {
  availableProducts(state, getters) {
    return state.products.filter(product => product.quantityInStock._text > 0)
  },
  cartProducts(state) {
    return state.cart.map(cartItem => {
      const product = state.products.find(product => product.id._text === cartItem.id)
      return {
        id: product.id._text,
        title: product.name._text,
        price: product.price._text,
        image: product.image._text,
        quantity: cartItem.quantity
      }
    })
  },
  cartTotal(state, getters) {
    return getters.cartProducts.reduce((total,product) => total + product.price * product.quantity, 0)
  },

  productInStock() {
    return(product) => {
      return parseInt(product.quantityInStock._text) > 0
    }
  },
  user(state) {
    return state.user
  }
}
