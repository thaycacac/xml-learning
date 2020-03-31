<template>
  <section class="decoration">
    <h1>Thể loại: Tiểu Thuyết</h1>
    <ProductList category="novel"/>
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

<style lang="css">
</style>
