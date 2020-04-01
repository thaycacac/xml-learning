<template>
  <transition name="fade" tag="div">
    <div class="shopping-cart-wrap">
      <h1>Chi tiết sản phẩm</h1>
      <p v-if="product.length === 0">Loading...</p>
      <div v-else class="flex">
        <div class="image-product">
          <img :src="product.image._text" alt="image product" class="image-product">
        </div>
        <div class="wrap-left">
          <div class="flex info-product">
            <div class="text-left">
              <h3 class="title-product">
                {{ product.name._text }}
              </h3>
              <p class="price-product">{{ product.price._text | currency }}</p>
            </div>
            <div>
              <button @click="addProductToCart(product)">Thêm vào giỏ hàng</button>
              <p class="category-product">{{ product.category._text }}</p>
            </div>
          </div>
          <p class="description">
            {{ product.description._text }}
          </p>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
import { getProduct } from '@/api'
import parser from 'xml-js'
import { mapActions } from 'vuex'

export default {
  data() {
    return {
      product: {}
    }
  },
  async mounted() {
    const { data } = await getProduct(this.$route.params.id)
    const dataFormat = JSON.parse(parser.xml2json(data, { compact: true, ignoreCdata: true })).Product
    this.product = dataFormat
  },
  methods : {
    ...mapActions({
      addProductToCart: 'addProductToCart'
    }),
  }
}
</script>
