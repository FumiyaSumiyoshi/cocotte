import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import MenuList from '../views/MenuList.vue'

const routes: Array<RouteRecordRaw> = [
  // {
  //   path: '/',
  //   name: 'home',
  //   component: HomeView
  // },

  {
    path: '/crudRecipes/:id',
    name: 'crudRecipes',
    // component: PageTest
    component: () => import(/* webpackChunkName: "about" */ '../views/CrudRecipes.vue'),
    props: true
  },
  {
    path: '/menuSearch',
    name: 'menuSearch',
    component: () => import(/* webpackChunkName: "about" */ '../views/MenuSearch.vue'),
    props: true
  },
  {
    path: '/menuRoulette/:id',
    name: 'menuRoulette',
    component: () => import(/* webpackChunkName: "about" */ '../views/MenuRoulette.vue'),
    props: true
  },
  {
    path: '/',
    name: 'menuList',
    // component: MenuList
    component: () => import(/* webpackChunkName: "about" */ '../views/MenuList.vue')
  },
  {
    path: '/processComplete/:id',
    name: 'processComplete',
    component: () => import(/* webpackChunkName: "about" */ '../views/ProcessComplete.vue')
  },

  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
