<template>
  <div>
    <h1>メニュー検索</h1>
    <div class="box">
      <div class="text-center">
        <p>検索条件</p>
        <br>
        <div class="character-counter">
          <p>名前に◯◯を持つ</p>
          <textarea v-model="text" @input="updateCounter" class="fixed-size" maxlength="10"></textarea>
          <p>{{ currentLength }}/{{ maxLength }}</p>
        </div>
        <br>
        <div>
          <label for="countrySelect">#ジャンル</label>
          <br>
          <select v-model="selectedCountry" @change="fetchStates">
            <option v-for="country in genres" :key="country.id" :value="country.id">
              {{ country.name }}
            </option>
          </select>
          <br>
          <label for="countrySelect">#味</label>
          <br>
          <select v-model="selectedState" @change="fetchCities">
            <option v-for="state in states" :key="state.id" :value="state.id">
              {{ state.name }}
            </option>
          </select>
          <br>
          <label for="countrySelect">#調理時間目安</label>
          <br>
          <select v-model="selectedCity">
            <option v-for="city in cities" :key="city.id" :value="city.id">
              {{ city.name }}
            </option>
          </select>
        </div>
        <br>
        <router-link to="/" class="btn btn-primary">検索</router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      text: '',
      maxLength: 10,
      currentLength: 0,
      genres: [
        { id: 1, name: '煮物' },
        { id: 2, name: '焼き物' },
        { id: 3, name: '炒め物' },
        { id: 4, name: '蒸し料理' },
        { id: 5, name: '冷たい物' }
      ],
      states: [
        { id: 1, name: '辛い' },
        { id: 2, name: '塩辛い' },
        { id: 3, name: '酸っぱい' },
        { id: 4, name: '甘い' },
        { id: 5, name: '苦い' }
      ],
      cities: [
        { id: 1, name: '10分' },
        { id: 2, name: '20分' },
        { id: 3, name: '30分' },
        { id: 4, name: '40分' },
        { id: 5, name: '50分' },
        { id: 5, name: '60分' }
      ],
      selectedCountry: null,
      selectedState: null,
      selectedCity: null
    }
  },
  methods: {
    updateCounter () {
      this.currentLength = this.text.length
    }
    // fetchStates () {
    //   // Mock data - replace with actual API call
    //   if (this.selectedCountry === 1) {
    //     this.states = [
    //       { id: 1, name: 'State 1-1' },
    //       { id: 2, name: 'State 1-2' }
    //     ]
    //   } else if (this.selectedCountry === 2) {
    //     this.states = [
    //       { id: 3, name: 'State 2-1' },
    //       { id: 4, name: 'State 2-2' }
    //     ]
    //   }
    //   this.selectedState = null
    //   this.cities = []
    // },
    // fetchCities () {
    //   // Mock data - replace with actual API call
    //   if (this.selectedState === 1) {
    //     this.cities = [
    //       { id: 1, name: 'City 1-1-1' },
    //       { id: 2, name: 'City 1-1-2' }
    //     ]
    //   } else if (this.selectedState === 2) {
    //     this.cities = [
    //       { id: 3, name: 'City 1-2-1' },
    //       { id: 4, name: 'City 1-2-2' }
    //     ]
    //   } else if (this.selectedState === 3) {
    //     this.cities = [
    //       { id: 5, name: 'City 2-1-1' },
    //       { id: 6, name: 'City 2-1-2' }
    //     ]
    //   } else if (this.selectedState === 4) {
    //     this.cities = [
    //       { id: 7, name: 'City 2-2-1' },
    //       { id: 8, name: 'City 2-2-2' }
    //     ]
    //   }
    //   this.selectedCity = null
    // }
  }
}
</script>

<style>
.box {
/*影の指定*/
box-shadow: 0px 0px 15px 0px rgba(98,98,98,0.8);
padding:10px;
/*横幅の指定*/
max-width: 500px;
/*要素の中央寄せ*/
margin: 0 auto;
}
textarea.fixed-size {
  width: 180px;  /* 幅を300ピクセルに固定 */
  height: 30px; /* 高さを200ピクセルに固定 */
  resize: none;  /* リサイズを禁止 */
}
</style>
