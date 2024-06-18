<template>
    <!--
    <h1>ルーレット結果</h1>
    -->
    <div class="Margin2"></div>
    <div class="text-center">
      <p>以下の献立が選ばれました！</p>
      <ul class="list">
          <li class="item">
          <div class="container">
            <div>
              <p class="Margin">麻婆豆腐</p>
              <img class="Margin" src="../assets/28.png" width="193" height="130">
            </div>
            <div>
              <div class="Margin2">
                <p>ジャンル：煮物</p>
                <p>味：辛い</p>
                <p>調理時間目安：15分</p>
              </div>
              <router-link v-bind:to="{name: 'crudRecipes', params: {id: 'detail'}}" class="btn btn-primary">この料理を作る🍽</router-link>
            </div>
          </div>
        </li>
      </ul>
      <router-link to="/" class="btn btn-primary">メニュー一覧画面へ</router-link>
    </div>
</template>
<style>
ul {
  list-style: none;
}
.container {
  display: flex;
}
/** 料理名と画像の間start */
.MarginSerch {
  text-align: right;
}
.MarginSerch2 {
  margin-top: 70px;
  margin-bottom: 30px;
}
/** 料理名と画像の間end */
</style>
