<template>
  <div id="app">
    <TopNavigation/>
    <div class="content-wrapper">
      <router-view/>
      <button @click="test">Test</button>
      <modal />
    </div>
    <Footer/>
  </div>
</template>

<script>
import Modal from '@/components/Modal'
import TopNavigation from '@/components/TopNavigation'
import Footer from '@/components/Footer'
import { getProducts } from '@/api'
import parser from 'xml-js'

export default {
  name: 'App',
  components: {
    Footer,
    TopNavigation,
    Modal
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
