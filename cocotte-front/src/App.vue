<template>
  <div id="app">
    <img src="./assets/apiTitle.png">
    <!--
    <router-view />
    <ApiTest />
    -->
    <!--
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link>
    -->
    <!-- 重要： router-viewタグがそれぞれのリンク先に紐づいた内容を表示してくれる。-->
    <!-- ↓3.31_Ruby疎通確認のため活性化(成功) -->
    <ApiTest />
    <DbTest />
    <!-- ↑3.31_Ruby疎通確認のため活性化(成功) -->
    <router-view/>
  </div>
</template>

<script>
import ApiTest from './components/ApiTest.vue'
// import MenuList from './views/MenuListAAAA.vue'
import DbTest from './views/DbTest.vue'

export default {
  name: 'App',
  components: {
    ApiTest,
    DbTest
    // MenuList
  }
}

</script>
