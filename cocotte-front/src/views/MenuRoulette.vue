<template>
  <div>
    <h1>新規メニュー登録</h1>
    <p>煮込みハンバーグ</p>
    <p>{{ $route.params.id }}</p>
    <div v-if="$route.params.id === 'wait'">
      <p>w</p>
      <p>a</p>
      <p>i</p>
      <p>t</p>
      <router-link v-bind:to="{name: 'processComplete', params: {id: 'create'}}" class="btn btn-primary">登録する</router-link>
    </div>
    <div v-if="$route.params.id === 'detail'">
      <p>d</p>
      <p>e</p>
      <p>t</p>
      <p>a</p>
      <p>i</p>
      <p>l</p>
      <router-link v-bind:to="{name: 'crudRecipes', params: {id: 'edit'}}" class="btn btn-primary">レシピの編集</router-link>
      <router-link v-bind:to="{name: 'processComplete', params: {id: 'delete'}}" class="btn btn-primary">レシピの削除</router-link>
    </div>
  </div>
  <div v-if="$route.params.id === 'edit'">
      <p>e</p>
      <p>d</p>
      <p>i</p>
      <p>t</p>
      <router-link v-bind:to="{name: 'processComplete', params: {id: 'edit'}}" class="btn btn-primary">登録する</router-link>
    </div>
</template>
