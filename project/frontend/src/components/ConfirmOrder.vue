<template>
  <button class="button-nav" id="show-modal" @click="showModal = !showModal">Thanh toán
    <modal v-if="showModal">
      <h3 slot="header">Xác nhận thông tin
        <span class="close" @click="showModal = true">X</span>
      </h3>
      <div slot="body">
        <input v-model="userInfo.fullname" type="text" class="input" placeholder="fullname" disabled>
        <input v-model="userInfo.phone" type="text" class="input" placeholder="phone" disabled>
        <input v-model="userInfo.email" type="text" class="input" placeholder="email" disabled>
        <textarea name="" id="" cols="57" rows="5" v-model="userInfo.address" />
        <textarea name="" id="" cols="57" rows="5" v-model="userInfo.comment" />
      </div>
      <button slot="footer" @click="confirmOrder">
        Hoàn tất thanh toán
      </button>
    </modal>
  </button>
</template>

<script>
import modal from './modal'
import { createOrder, createOrderDetail } from '@/api'
import axios from 'axios'
import { mapGetters, mapMutations } from 'vuex'

export default {
  data() {
    return {
      showModal: false,
      userInfo: null
    }
  },
  components: {
    modal
  },
  computed: {
    ...mapGetters([
      'user',
      'cartProducts'
    ])
  },
  mounted() {
    this.userInfo = { ...this.user, comment: '' }
  },
  methods: {
    ...mapMutations([
      'emptyCart'
    ]),
    formatDate() {
      var d = new Date(),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear()
        if (month.length < 2) 
            month = '0' + month
        if (day.length < 2) 
            day = '0' + day
        return [year, month, day].join('-')
    },
    async confirmOrder() {
      const { data } = await createOrder({
        customerId: this.userInfo.id,
        orderDate: this.formatDate(),
        comment: this.userInfo.comment
      })
      const orderId = parseInt(data.replace('<int>', '').replace('</int>', ''));
      await this.cartProducts.forEach(async e => {
        await createOrderDetail({
          orderID: orderId,
          productID: e.id,
          quantity: e.quantity
        })
      })
      this.emptyCart()
      this.$router.push('/')
    }
  }
}
</script>