<template>
  <div class="shopping-cart">
    <div v-if="products === null" class="empty-cart">
      <p>Loading...</p>
    </div>
    <div v-else class="shopping-cart-items">
      <ul>
        <li v-for="product in products" class="cart-product-card" :key="product.id">
          <img :src="product.image._text" :alt="`Image of ${product.name._text}`">
          <span class="product-title">{{product.name._text}}</span>
          <span class="product-price"> {{product.price._text | currency}}</span>
          <span class="product-cart-quantity">Quantity: {{product.quantity._text}}</span>
        </li>
      </ul>
      <div class="cart-checkout">
        <h3>Tổng tiền: </h3>
        <p class="total-price">{{ total | currency}}</p>
      </div>
    </div>
  </div>
</template>

<script>
import {mapState, mapGetters, mapActions} from 'vuex'
import { getProductsInOrder } from '@/api'
import parser from 'xml-js'

export default {
  data() {
    return {
      products: null,
      total: 0
    }
  },
  async mounted() {
    const { data } = await getProductsInOrder(this.$route.params.id);
    const dataFormat = JSON.parse(parser.xml2json(data, { compact: true, ignoreCdata: true })).ArrayOfOrderDetailDTO.OrderDetailDTO
    console.log(dataFormat);
    this.products = dataFormat
    this.total =  dataFormat.reduce((exp, curr) => {
      return exp + parseInt(curr.quantity._text) * parseInt(curr.price._text)
    }, 0)
  }
}
</script>

<style lang="css" scoped>
.empty-cart {
  position: absolute;
  top: 45%;
  left: 50%;
  transform: translate(-50%,-45%);
}

.empty-cart p {
  margin-bottom: 30px;
}

.shopping-cart-items {
  display: flex;
  flex-direction: row;
}

ul {
  display: flex;
  flex-wrap: wrap;
  max-width: 800px;
  flex: 2;
  padding-left: 0;
  justify-content: center;
}

.cart-checkout {
  flex: 1;
  justify-content: center;
}

.total-price {
  font-size: 40px !important;
  color: #B83280;
}

.cart-checkout p {
  margin-top: 10px;
  margin-bottom: 20px;
  font-size: 18px;
}

.cart-product-card {
  display: flex;
  flex-direction: column;
  margin-right: 40px;
  margin-bottom: 40px;
}
.product-price {
  margin-bottom: 5px;
}

img {
  width: 180px;
  height: 240px;
}

@media(max-width: 600px) {
  .shopping-cart-items {
    flex-direction: column;
  }

  .cart-product-card {
    margin-right: 0px;
  }
  ul {
    justify-content: space-around;
  }

  img {
    width: auto;
  }
}
</style>
