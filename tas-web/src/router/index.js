import {
  createRouter,
  createWebHashHistory,
  createWebHistory
} from 'vue-router'
import store from '../store/index'
import Index from '../views/Index'
import Login from '../views/Login'
import LeavingMessage from '../views/leavingMessage/LeavingMessage'
import Achievement from '../views/achievement/Achievement'
const routes = [
  {
    path: '/login',
    component: Login
  },
  {
    path: '/',
    component: Index,
    redirect: '/home',
    children: [
      {
        path: 'home',
        component: () => import('../views/Home'),
      },
      {
      path: 'leavingmessage',
      component: LeavingMessage,
      children: [{
          path: 'all',
          component: () => import('../views/leavingMessage/All'),
        },
        {
          path: 'increase',
          component: () => import('../views/leavingMessage/Increase'),
        },
        {
          path: 'mine',
          component: () => import('../views/leavingMessage/Mine'),
        },
      ]
    },
    {
      path: 'achievement',
      component: Achievement,
      children: [
        {
          path: 'add',
          component: () => import('../views/achievement/Add')
        },
        {
          path: 'query',
          component: () => import('../views/achievement/Query')
        }
      ]
    }],
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  // history: createWebHashHistory(process.env.BASE_URL),
  routes
})

// 白名单
const whiteList = ['/login', '/404'];

router.beforeEach((to, from, next) => {
  let token = localStorage.getItem("token");
  if (token != null) { //校验通过
    store.commit("userMutation");
    next()
  } else {
    //校验不通过
    if (whiteList.indexOf(to.path) != -1) {
      next() //路径在白名单中
    } else {
      next("/login") //路径不在白名单中
    }
  }
})

export default router