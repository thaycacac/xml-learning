<template>
  <section class="furniture">
    <h1>Thể loại: Ngôn Tình</h1>
    <ProductList category="Ngôn Tình"/>
  </section>
</template>

<script>
import ProductList from '@/components/ProductList'
import SideMainLayout from '@/layout/SideMainLayout'

export default {
  name: 'index',
  components: {
    ProductList,
    SideMainLayout
  }
}
</script>

<style>
</style>
