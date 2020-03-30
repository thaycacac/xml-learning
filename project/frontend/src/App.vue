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
import { getListProduct } from '@/api'
import parser from 'xml-js'

export default {
  name: 'App',
  components: {
    Footer,
    TopNavigation
  },
  methods: {
    async test() {
      const { data } = await getListProduct();
      console.log(JSON.parse(parser.xml2json(data, { compact: true, ignoreCdata: true })));
      console.log(data)
    }
  }
}
</script>
<style> @import './assets/styles.css'; </style>
