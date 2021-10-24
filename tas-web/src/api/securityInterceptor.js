import axios from "axios";
import router from "../router";

axios.interceptors.request.use(config => {
    let token = localStorage.getItem("token");
    if (token != null) {  // 判断是否存在token，如果存在的话，则每个http header都加上token
        config.headers.Authorization = token;
    }else{
        alert("登录信息失效，请重新登录")
        router.push("/login");
    }
    return config;
},error => {
    Promise.reject(error);
})

axios.interceptors.response.use(result=>{
    let data = result.data;
    //只要前台被拦截的请求里面含这两个参数，那么就跳转到登录界面
    if(data.status=="error" || data.code =="403")
        router.push("/login");
    return result;
},error => {
    Promise.reject(error);
});

export default axios