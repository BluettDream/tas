import { createRouter, createWebHashHistory, createWebHistory } from 'vue-router'
import Index from '../views/Index'
import Login from '../views/Login'
import LeavingMessage from '../views/LeavingMessage'

const routes = [
  {
    path: '/login',
    component: Login
  },
  {
    path: '/index',
    component: Index,
    children: [
      {
      path: 'leavingMessage',
      component: LeavingMessage,
      children: [
        {
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
    }
  ],
  },
]

const router = createRouter({
  history: createWebHistory('/tas/'),
  routes
})



export default router
