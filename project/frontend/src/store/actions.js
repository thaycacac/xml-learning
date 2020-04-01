import { getProducts } from '@/api'
import parser from 'xml-js'

export default {
  async fetchProducts(context) {
    return new Promise(async function(resolve, reject) {
      const { data } = await getProducts()
      const products = JSON.parse(parser.xml2json(data, { compact: true, ignoreCdata: true })).ArrayOfProduct.Product
      context.commit('setProducts', products)
      resolve()
    })
  },

  addProductToCart(context, product) {
    if(context.getters.productInStock(product)){
      const cartItem  = context.state.cart.find(item => item.id === product.id._text)
      if(!cartItem) {
        context.commit('pushProductToCart',product.id._text)
      }
      else {
        context.commit('incrementItemQty',cartItem)
      }

      context.commit('decrementProductInventory',product)

    }
  }
}
