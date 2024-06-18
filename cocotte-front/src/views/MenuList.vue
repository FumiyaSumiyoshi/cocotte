<template>
  <div>
    <h1 class="center">Menu</h1>
    <div class="container2">
      <div class="btns2">
        <router-link v-bind:to="{name: 'menuRoulette', params: {id: 'wait'}}" class="btn btn-primary">献立ルーレット</router-link>
      </div>
      <div class="btns3">
        <router-link to="/menuSearch" id="btn1" class="btn btn-primary">絞り込み検索</router-link>
      </div>
    </div>
  </div>
  <div class="paging">
    <ul class="list">
      <li v-for="(item, index) in paginatedItems" :key="index" class="item">
        <div class="container">
          <div>
            <p class="Margin">{{ item.title }}</p>
            <img class="Margin" :src="item.image" width="193" height="130">
          </div>
          <div>
            <div class="Margin2">
              <p>ジャンル：{{ item.genre }}</p>
              <p>味：{{ item.taste }}</p>
              <p>調理時間目安：{{ item.cookingTime }}分</p>
            </div>
            <router-link v-bind:to="{name: 'crudRecipes', params: {id: 'detail'}}" class="btn btn-primary">この料理を作る🍽</router-link>
          </div>
        </div>
      </li>
    </ul>
    <div class="center">
      <button @click="goToFirstPage" class="arrow green">top</button>
      <button @click="prevPage" class="arrow blue">back</button>
      <button @click="nextPage" class="arrow blue">next</button>
      <button @click="goToLastPage" class="arrow green">last</button>
    </div>
  </div>
  <div class="btns">
    <router-link v-bind:to="{name: 'crudRecipes', params: {id: 'create'}}" class="btn btn-primary">新規メニュー登録</router-link>
  </div>
</template>

<script>
import { defineComponent, ref, computed, onMounted } from 'vue'

export default defineComponent({
  setup () {
    // データのリファレンス
    const items = ref(
      // ここが今定数になっているが「取得してきた配列の数」にしたい。
      Array.from({ length: 10 }, () => ({
        title: '',
        image: '',
        genre: '',
        taste: '',
        cookingTime: ''
      }))
    )
    const currentPage = ref(1)
    const itemsPerPage = 4 // 1ページあたりの項目数

    const totalPages = computed(() => {
      return Math.ceil(items.value.length / itemsPerPage)
    })

    const paginatedItems = computed(() => {
      const start = (currentPage.value - 1) * itemsPerPage
      const end = start + itemsPerPage
      return items.value.slice(start, end)
    })

    const nextPage = () => {
      if (currentPage.value < totalPages.value) {
        currentPage.value++
      }
    }

    const prevPage = () => {
      if (currentPage.value > 1) {
        currentPage.value--
      }
    }

    const goToFirstPage = () => {
      currentPage.value = 1
    }

    const goToLastPage = () => {
      currentPage.value = totalPages.value
    }

    // データをフェッチしてmessage1をitemsのtitleに設定
    const fetchData = async () => {
      try {
        const response = await fetch('http://localhost:3000/cocotte/menu')
        const data = await response.json()
        // 取得したデータを使用してitemsのタイトルを更新
        for (let i = 0; i < 11; i++) {
          items.value[i].title = data[i][1]
          items.value[i].image = data[i][2]
          items.value[i].genre = data[i][4]
          items.value[i].taste = data[i][5]
          items.value[i].cookingTime = data[i][6]
        }
      } catch (error) {
        console.error('Error fetching data:', error)
      }
    }

    // コンポーネントがマウントされた後にデータをフェッチ
    onMounted(fetchData)

    return {
      items,
      currentPage,
      totalPages,
      paginatedItems,
      nextPage,
      prevPage,
      goToFirstPage,
      goToLastPage
    }
  }
})
</script>

<style>
/** メニューリストの調整start */
ul {
    /** 各メニューの横幅を設定 */
    width: 70%;
    list-style: none;
}
p {
  margin-top: 0px;
  margin-bottom: 0px;
}
.list {
    list-style-type: none;
    padding: 0;
    margin: auto;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
}
/** メニューリストの調整end */

/** 料理名と画像の間start */
.Margin {
  margin-top: 30px;
  margin-right: 20px;
  margin-bottom: 0px;
  margin-left: 30px;
}
.Margin2 {
  margin-top: 70px;
  margin-bottom: 30px;
}
/** 料理名と画像の間end */

/** 料理名と画像の間start */
.MarginSerch {
  text-align: right;
}
.MarginSerch2 {
  margin-top: 70px;
  margin-bottom: 30px;
}
/** 料理名と画像の間end */

.item {
    box-shadow: 0px 0px 15px 0px rgba(98,98,98,0.8);
    color: black;
    margin: 30px;
    height: 250px;
}
.pagination {
    display: flex;
    justify-content: center;
    list-style: none;
    margin: auto;
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

.btns {
    text-align: right;
    padding: 5px 300px 30px 0px;
}

.btns2 {
  margin: auto;
  text-align: right;
  padding: 5px 0px 30px 20px;
  margin-right: 30px;
}
.btns3 {
  text-align: right;
  padding: 5px 300px 30px 0px;
}

.center {
    text-align: center;
}

.container {
  display: flex;
}

.container2 {
  display: flex;
}

/** ページングのボタンSTART */
.arrow {
  margin: 5px;
  padding: 10px;
  font-size: 16px;
  cursor: pointer;
  align-items: center;
}

.green {
  background-color: lightgreen;
}

.blue {
  background-color: lightblue;
}
/** ページングのボタンEND */

.paging {
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>
