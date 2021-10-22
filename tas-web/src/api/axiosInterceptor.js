import axios from "axios";

axios.interceptors.request.use(config => {
    let token = sessionStorage.getItem("token");
    if (token) {  // 判断是否存在token，如果存在的话，则每个http header都加上token
        config.headers.Authorization = token;
    }
    return config;
},error => {
    Promise.reject(error);
})

axios.interceptors.response.use(result=>{
    console.log(result);
    let data = result.data;
    //只要前台被拦截的请求里面含这两个参数，那么就跳转到登录界面
    if(!data.success && data.msg==="NoUser")
        location.href = "login.html";
    return result;
},error => {
    Promise.reject(error);
});