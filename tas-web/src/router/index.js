import {
  createRouter,
  createWebHashHistory,
  createWebHistory
} from 'vue-router'
import Index from '../views/Index'
import Login from '../views/Login'
import LeavingMessage from '../views/LeavingMessage'

const routes = [{
    path: '/',
    redirect: '/index'
  },
  {
    path: '/login',
    component: Login
  },
  {
    path: '/index',
    component: Index,
    children: [{
      path: 'leavingmessage',
      component: LeavingMessage,
      children: [{
          path: 'all',
          component: () => import('../components/LeavingMessage/AllLeavingMessage'),
        },
        {
          path: 'increase',
          component: () => import('../components/LeavingMessage/IncreaseLeavingMessage'),
        },
        {
          path: 'mine',
          component: () => import('../components/LeavingMessage/MyLeavingMessage'),
        },
      ]
    }],
  },
]

const router = createRouter({
  // history: createWebHistory(process.env.BASE_URL),
  history: createWebHashHistory(process.env.BASE_URL),
  routes
})

let token = localStorage.getItem("token");
let id = sessionStorage.getItem("id");
// 白名单
const whiteList = ['/login', '/error'];
router.beforeEach((to, from, next) => {
  if (token != null && id != null && token == id) { //校验通过
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