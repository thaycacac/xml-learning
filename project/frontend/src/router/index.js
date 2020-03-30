import Vue from 'vue'
import Router from 'vue-router'
import index from '@/sections/index'
import cart from '@/sections/cart'
import love from '@/sections/love'
import novel from '@/sections/novel'
import SideMainLayout from '@/layout/SideMainLayout'

Vue.use(Router)

export default new Router({
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
      path: '/cart',
      name: 'cart',
      component: cart
    }
  ]
})
