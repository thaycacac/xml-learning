<template>
  <aside>
    <div class="aside-block">
      <label for="pricerange">Lọc theo giá: <span>{{ pricerange | currency}}</span></label>
      <input
        class="slider"
        id="pricerange"
        tabindex="0"
        :value="pricerange"
        type="range"
        :min="min"
        :max="max"
        step="1000"
        @input="updateHighPrice($event)"
      />
      <span class="min">{{ min | currency }}</span>
      <span class="max">{{ max | currency}}</span>
    </div>
    <div class="aside-block">
        <h4>Sản phẩm đang Sale</h4>
        <label class="checkbox-control">
          <span class="label-name">Check sale</span>
          <input type="checkbox" v-model="check" @change="updateSale">
          <div class="checkbox-box"></div>
        </label>
    </div>
    <div class="aside-block">
      <h4>Thaycacac</h4>
      <p>A fresh approach to shopping.</p>
    </div>
  </aside>
</template>

<script>
import store from '@/store/index'
export default {
  name: 'Sidebar',
  data() {
    return {
      min: 0,
      max: 150000,
      check: this.checked
    };
  },
  computed: {
    pricerange() {
      return this.$store.state.highprice
    },
    checked() {
      return this.$store.state.sale;
    }
  },
  methods: {
    updateHighPrice($event) {
      this.$store.commit('setHighPrice', $event.target.value)
    },
    updateSale() {
      this.$store.commit('toggleSale');
    }
  }

}
</script>

<style lang="css">
  .aside-block {
    padding: 40px 0;
    border-bottom: 1px solid #eee;
    font-size: 15px;
  }
  .min {
    float: left;
  }
  .max {
    float: right;
  }

  .aside-block h4 {
    margin-bottom: 10px;
  }
  .checkbox-control {
    position: relative;
    display: inline-block;
  }
  .checkbox-box {
    width: 18px;
    height: 18px;
    border: 2px solid #131313;
    position: relative;
    cursor: pointer;
    float: left;
    top: 2px;
    margin-right: 10px;
  }

  input[type="checkbox"] {
    opacity: 0;
    position: absolute;
  }

  input[type="checkbox"]:hover ~ .checkbox-box, input[type="checkbox"]:focus ~ .checkbox-box, input[type="checkbox"]:checked ~ .checkbox-box{
    border-color: #5044ff;
  }

  input[type="checkbox"]:checked ~ .checkbox-box::before {
    content: '';
    position: absolute;
    width: 10px;
    height: 10px;
    top: 2px;
    left: 2px;
    background: #5044ff;
  }

</style>
