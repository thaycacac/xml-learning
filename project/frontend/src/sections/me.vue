<template>
  <transition name="fade" tag="div">
    <div class="shopping-cart-wrap">
      <h1>
        <router-link to="/" class="goto-back">Trang chủ</router-link> > 
        <span class="detail-product">Trang cá nhân</span>
      </h1>
      <p v-if="orders === null">Loading...</p>
      <div v-else class="wrap-history flex" v-for="order in orders" :key="order.id._text">
        <div class="col">
          <span class="label">
            Order ID
          </span>
           <router-link to="/orders/1">#{{ order.id._text }}</router-link>
        </div>
        <div class="col">
          <span class="label">
            Order Date
          </span>
          <span>{{ order.orderDate._text }}</span>
        </div>
        <div class="col">
          <span class="label">
            Ship Date
          </span>
          <span>{{ order.shipDate._text }}</span>
        </div>
        <div class="col">
          <span class="label">
            Status
          </span>
          <span class="status" :class="{
            'done': order.status._text === 'done',
            'ship': order.status._text === 'shipping',
            'cancel': order.status._text === 'cancel'
            }">{{ order.status._text }}</span>
        </div>
        <div class="col col-comment">
          <span class="label">
            Comment
          </span>
          <span class="comment">
            {{ order.comment._text }}
          </span>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
import { getOrders } from '@/api'
import parser from 'xml-js'
import { mapGetters } from 'vuex'

export default {
  data() {
    return {
      user: null,
      orders: null
    }
  },
  async mounted() {
    const { data } = await getOrders(2);
    const dataFormat = JSON.parse(parser.xml2json(data, { compact: true, ignoreCdata: true })).ArrayOfOrder.Order
    console.log(dataFormat);
    this.orders = dataFormat
  },
  computed: {
    ...mapGetters(['user'])
  }
  // methods : {
  //   ...mapActions({
  //     addProductToCart: 'addProductToCart'
  //   })
  // }
}
</script>
