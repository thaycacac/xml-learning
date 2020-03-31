<template>
  <div id="app">
    <TopNavigation/>
    <div class="content-wrapper">
      <router-view/>
      <button @click="test">Test</button>
    </div>
    <Footer/>
  </div>
</template>

<script>
import TopNavigation from '@/components/TopNavigation'
import Footer from '@/components/Footer'
import { getProducts } from '@/api'
import parser from 'xml-js'

export default {
  name: 'App',
  components: {
    Footer,
    TopNavigation
  },
  methods: {
    async test() {
      const { data } = await getProducts();
      console.log(JSON.parse(parser.xml2json(data, { compact: true, ignoreCdata: true })).ArrayOfProduct.Product);
    }
  }
}
</script>
<style> @import './assets/styles.css'; </style>
