import Vue from 'vue'
import Router from 'vue-router'
import index from '@/sections/index'
import cart from '@/sections/cart'
import love from '@/sections/love'
import novel from '@/sections/novel'
import product from '@/sections/product'
import me from '@/sections/me'
import SideMainLayout from '@/layout/SideMainLayout'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'index',
      component: SideMainLayout,
      children: [
        {
          path: '/',
          component: index
        },
        {
          path: '/ngon-tinh',
          name: 'love',
          component: love
        },
        {
          path: '/tieu-thuyet',
          name: 'novel',
          component: novel
        }
      ]
    },
    {
      path: '/products/:id',
      name: 'product',
      component: product
    },
    {
      path: '/me',
      name: 'me',
      component: me
    },
    {
      path: '/cart',
      name: 'cart',
      component: cart
    }
  ]
})
