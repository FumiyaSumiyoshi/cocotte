<template>
  <div>
    <h1>Menu</h1>

    <router-link v-bind:to="{name: 'menuRoulette', params: {id: 'wait'}}" class="btn btn-primary">献立ルーレット</router-link>

    <!-- <router-link to="/menuRoulette" class="btn btn-primary">献立ルーレット</router-link> -->
    <router-link to="/menuSearch" class="btn btn-primary">絞り込み検索</router-link>
    <p>{{ message2 }}</p>
    <ul class="list">
        <li class="item">
            <p>{{ message1 }}</p>
            <!-- <img src="../assets/1.png"> -->
            <!-- <img src="../assets/supagra.png" width="193" height="130"> -->
            <!-- <article id="content_area">
            </article> -->
            <img id="png1" width="193" height="130">
            <router-link v-bind:to="{name: 'crudRecipes', params: {id: 'detail'}}" class="btn btn-primary">この料理を作る🍽</router-link>
        </li>
        <li class="item"><img src="../assets/2.png"><router-link v-bind:to="{name: 'crudRecipes', params: {id: 'detail'}}" class="btn btn-primary">この料理を作る🍽</router-link></li>
        <li class="item"><img src="../assets/3.png"><router-link v-bind:to="{name: 'crudRecipes', params: {id: 'detail'}}" class="btn btn-primary">この料理を作る🍽</router-link></li>
        <li class="item"><img src="../assets/4.png"><router-link v-bind:to="{name: 'crudRecipes', params: {id: 'detail'}}" class="btn btn-primary">この料理を作る🍽</router-link></li>
        <li class="item"><img src="../assets/5.png"><router-link v-bind:to="{name: 'crudRecipes', params: {id: 'detail'}}" class="btn btn-primary">この料理を作る🍽</router-link></li>
        <li class="item"><img src="../assets/6.png"><router-link v-bind:to="{name: 'crudRecipes', params: {id: 'detail'}}" class="btn btn-primary">この料理を作る🍽</router-link></li>
        <li class="item"><img src="../assets/7.png"><router-link v-bind:to="{name: 'crudRecipes', params: {id: 'detail'}}" class="btn btn-primary">この料理を作る🍽</router-link></li>
        <li class="item"><img src="../assets/8.png"><router-link v-bind:to="{name: 'crudRecipes', params: {id: 'detail'}}" class="btn btn-primary">この料理を作る🍽</router-link></li>
        <li class="item"><img src="../assets/9.png"><router-link v-bind:to="{name: 'crudRecipes', params: {id: 'detail'}}" class="btn btn-primary">この料理を作る🍽</router-link></li>
        <li class="item"><img src="../assets/10.png"><router-link v-bind:to="{name: 'crudRecipes', params: {id: 'detail'}}" class="btn btn-primary">この料理を作る🍽</router-link></li>
        <li class="item"><img src="../assets/11.png"><router-link v-bind:to="{name: 'crudRecipes', params: {id: 'detail'}}" class="btn btn-primary">この料理を作る🍽</router-link></li>
        <li class="item"><img src="../assets/12.png"><router-link v-bind:to="{name: 'crudRecipes', params: {id: 'detail'}}" class="btn btn-primary">この料理を作る🍽</router-link></li>
    </ul>
    <div id="data-container"></div>
    <ul class="pagination">
        <li>
        <button id="prev">前へ</button>
        </li>
        <li>
        <button id="next">次へ</button>
        </li>
    </ul>
  </div>
  <router-link v-bind:to="{name: 'crudRecipes', params: {id: 'create'}}" class="btn btn-primary">新規メニュー登録</router-link>
</template>

<script>
export default {
  data () {
    fetch('http://localhost:3000/cocotte/menu')
      .then((response) => response.json())
      .then((data) => {
        this.message1 = data[0][1]
        this.message2 = data[0][2]

        document.getElementById('png1').setAttribute('src', '/img/supagra.3e04d3e4.png')

        // // img要素を作成
        // const imgElement = document.createElement('img')
        // imgElement.src = '../assets/2.png'
        // imgElement.width = 193
        // imgElement.height = 130

        // // 指定した要素にimg要素を挿入
        // const contentArea = document.getElementById('content_area')
        // contentArea.appendChild(imgElement)
      })
    return {
      message1: '',
      message2: ''
    }
  }
}
</script>

<style>
ul {
    list-style: none;
}
.list {
    list-style-type: none;
    padding: 0;
    margin: 0;
    display: flex;
    flex-wrap: wrap;
}
.item {
    background-color: gray;
    color: white;
    margin: 5px;
    width: calc(50% - 10px);
}
.pagination {
    display: flex;
    justify-content: center;
    align-items: center;
    list-style: none;
    margin: 0;
    padding: 0;
}
.pagination li {
    margin: 0 5px;
}
.pagination button {
    border: none;
    background-color: transparent;
    cursor: pointer;
}
</style>
