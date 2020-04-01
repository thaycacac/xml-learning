import Vue from 'vue'
import Vuex from 'vuex'
import actions from './actions'
import getters from './getters'
import mutations from './mutations'

Vue.use(Vuex)

export default new Vuex.Store({
  state : { // = data
    products:[],
    cart:[],
    cartItems:0,
    checkoutStatus: null,
    highprice: 100000,
    sale: false,
    user: {
      id: 2,
      fullname: 'Phạm Ngọc Hòa',
      phone: '0968038714',
      address: '35 Lương Ngọc Quyến, Hàng Buồm, Hoàn Kiếm, Hà Nội',
      email: 'thaycacac@gmail.com'
    }
  },
  getters,
  actions,
  mutations
})
