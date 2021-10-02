import {
    createApp
} from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import zhCn from 'element-plus/es/locale/lang/zh-cn'
import axios from 'axios'
import dayjs from 'dayjs'

const app = createApp(App)
app.config.globalProperties.axios = axios

app.use(store).use(router).use(ElementPlus, {
    locale: zhCn,
    zIndex: 1000
}).use(dayjs).mount('#app')