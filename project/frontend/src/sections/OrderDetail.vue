<template>
  <transition name="fade" tag="div">
    <div class="shopping-cart-wrap">
      <h1>
        <router-link to="/" class="goto-back">Trang chủ</router-link> > 
        <span @click="$router.back()" class="goto-back">Lịch sử mua hàng</span> >
        <span class="detail-product">Chi tiết đơn hàng</span>
      </h1>
      <product-order/>
    </div>
  </transition>
</template>

<script>
import ProductOrder from '@/components/ProductOrder'

export default {
  name: 'cart',
  components: {
    ProductOrder
  }
}
</script>
