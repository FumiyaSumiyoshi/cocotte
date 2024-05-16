import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

//  bootstrapのインポート
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.min.js'

createApp(App).use(store).use(router).mount('#app')

//  ページングのため追記
createApp(App).use(router).mount('#app')
