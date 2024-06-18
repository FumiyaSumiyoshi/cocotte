<template>
 <!-- <div> -->
    <!--
    <p>{{ $route.params.id }}</p>
    -->
  <div v-if="$route.params.id === 'create'">
    <div class="container">
      <div class="upload-section">
          <input id="name" type="text" placeholder="料理名">
          <div id="photo">
              <img id="preview" src="" alt="写真をアップロード">
          </div>
          <div id="choice">
              <!--
              <input type="file" accept="image/*" id="imageUpload" onchange="previewImage(event)">
              -->
              <input type="file" accept='image/*' multiple="multiple" onchange="previews(this);">
          </div>
      </div>
      <div class="recipe-section">
          <textarea placeholder="レシピ"></textarea>
          <div>
        <label for="countrySelect">#ジャンル</label>
        <select v-model="selectedCountry" @change="fetchStates">
          <option v-for="country in genres" :key="country.id" :value="country.id">
            {{ country.name }}
          </option>
        </select>
        <br>
        <label for="countrySelect">#味</label>
        <select v-model="selectedState" @change="fetchCities">
          <option v-for="state in states" :key="state.id" :value="state.id">
            {{ state.name }}
          </option>
        </select>
        <br>
        <label for="countrySelect">#調理時間目安</label>
        <select v-model="selectedCity">
          <option v-for="city in cities" :key="city.id" :value="city.id">
            {{ city.name }}
          </option>
        </select>
      </div>
      </div>
    </div>
    <!-- <input type="file" accept="image/*" id="imageUpload"> -->
      <div class="text-center">
        <router-link v-bind:to="{name: 'processComplete', params: {id: 'create'}}" class="btn btn-primary">登録する</router-link>
      </div>
      <div class="right">
        <router-link to="/" class="btn btn-primary">メニュー一覧画面へ</router-link>
      </div>
  </div>
  <div v-if="$route.params.id === 'detail'">
    <div class="container">
      <div class="upload-section">
          <input id="name" type="text" placeholder="料理名">
          <div id="photo">
              <img id="preview" src="" alt="写真をアップロード">
          </div>
          <div id="choice">
              <!--
              <input type="file" accept="image/*" id="imageUpload" onchange="previewImage(event)">
              -->
              <input type="file" accept='image/*' multiple="multiple" onchange="previews(this);">
          </div>
      </div>
      <div class="recipe-section">
          <textarea placeholder="レシピ"></textarea>
          <div>
        <label for="countrySelect">#ジャンル</label>
        <select v-model="selectedCountry" @change="fetchStates">
          <option v-for="country in genres" :key="country.id" :value="country.id">
            {{ country.name }}
          </option>
        </select>
        <br>
        <label for="countrySelect">#味</label>
        <select v-model="selectedState" @change="fetchCities">
          <option v-for="state in states" :key="state.id" :value="state.id">
            {{ state.name }}
          </option>
        </select>
        <br>
        <label for="countrySelect">#調理時間目安</label>
        <select v-model="selectedCity">
          <option v-for="city in cities" :key="city.id" :value="city.id">
            {{ city.name }}
          </option>
        </select>
      </div>
      </div>
    </div>
    <!-- <input type="file" accept="image/*" id="imageUpload"> -->
      <div class="text-center">
        <router-link v-bind:to="{name: 'crudRecipes', params: {id: 'edit'}}" class="btn btn-primary">レシピの編集</router-link>
        <router-link v-bind:to="{name: 'processComplete', params: {id: 'delete'}}" class="btn btn-primary">レシピの削除</router-link>
      </div>
      <div class="right">
        <router-link to="/" class="btn btn-primary">メニュー一覧画面へ</router-link>
      </div>
  </div>
  <!-- </div> -->
  <div v-if="$route.params.id === 'edit'">
    <div class="container">
      <div class="upload-section">
          <input id="name" type="text" placeholder="料理名">
          <div id="photo">
              <img id="preview" src="" alt="写真をアップロード">
          </div>
          <div id="choice">
              <!--
              <input type="file" accept="image/*" id="imageUpload" onchange="previewImage(event)">
              -->
              <input type="file" accept='image/*' multiple="multiple" onchange="previews(this);">
          </div>
      </div>
      <div class="recipe-section">
          <textarea placeholder="レシピ"></textarea>
          <div>
        <label for="countrySelect">#ジャンル</label>
        <select v-model="selectedCountry" @change="fetchStates">
          <option v-for="country in genres" :key="country.id" :value="country.id">
            {{ country.name }}
          </option>
        </select>
        <br>
        <label for="countrySelect">#味</label>
        <select v-model="selectedState" @change="fetchCities">
          <option v-for="state in states" :key="state.id" :value="state.id">
            {{ state.name }}
          </option>
        </select>
        <br>
        <label for="countrySelect">#調理時間目安</label>
        <select v-model="selectedCity">
          <option v-for="city in cities" :key="city.id" :value="city.id">
            {{ city.name }}
          </option>
        </select>
      </div>
      </div>
    </div>
    <!-- <input type="file" accept="image/*" id="imageUpload"> -->
      <div class="text-center">
        <router-link v-bind:to="{name: 'processComplete', params: {id: 'edit'}}" class="btn btn-primary">更新</router-link>
        <router-link v-bind:to="{name: 'crudRecipes', params: {id: 'edit'}}" class="btn btn-primary">編集取消</router-link>
      </div>
      <div class="right">
        <router-link to="/" class="btn btn-primary">メニュー一覧画面へ</router-link>
      </div>
  </div>
</template>

<script>
// 選択した画像ファイルのプレビューを生成する関数を定義します。
function previews (obj) {
  // 選択した全てのファイルに対してループ処理をします。
  for (let i = 0; i < obj.files.length; i++) {
    // FileReaderオブジェクトを作成します。これによりブラウザ上でファイルを読み込むことが可能になります。
    const fileReader = new FileReader()
    // onloadイベントハンドラを設定します。ファイルが正常に読み込まれたときに呼び出されます。
    fileReader.onload = (e) => {
      // 読み込んだ画像ファイルをData URLとしてimg要素に設定します。
      // これにより、選択した画像がブラウザ上でプレビュー表示されます。
      document.querySelector('#photo').innerHTML += '<img src="' + e.target.result + '">'
    }
    // ファイルをData URLとして読み込みます。
    fileReader.readAsDataURL(obj.files[i])
  }
}
</script>

<style>
/* #name {
} */
.container {
  display: flex;
  justify-content: space-between;
  width: 1000px; /* 希望する横幅に変更 */
  margin: 0 auto; /* 中央揃え */
  margin-bottom: 60px;
}
.upload-section, .recipe-section {
  width: 45%;
}
.upload-section {
  text-align: center;
}
.upload-section img {
  width: 300px;
  height: 300px;
  border: 1px solid #000;
  margin-bottom: 10%;
}
input[type="text"], textarea {
  width: 60%;
  padding: 5px;
  margin: 5px 0;
  box-sizing: border-box;
}
textarea {
  width: 400px;
  height: 450px;
}
/** メニュー一覧画面へボタンの配置start */
.right {
  text-align: right;
  padding: 5px 100px 30px 20px;
}
/** メニュー一覧画面へボタンの配置end */
#preview {
  margin-top: 50px;
  max-width: 100%;
  max-height: 100%;
}
/** プレースホルダーを中央寄せ */
::placeholder {
  text-align: center;
  align-items:center;
}

.recipe-section {
  text-align: center;
}

#choice {
  text-align: center;
  padding-left: 100px;
}

</style>
