import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import Home from '../views/Home.vue'
import Publisher from '../views/Publisher.vue'
import Survey from '../views/Survey.vue'

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/surveys/:id',
    name: 'Survey',
    component: Survey
  },
  {
    path: '/publisher',
    name: 'Publisher',
    component: Publisher
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
