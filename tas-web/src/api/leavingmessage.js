import axios from "axios"

//获取对应页面留言
export function getPage(searchCondition){
    let userName = JSON.parse(localStorage.getItem("user")).name;
    return axios({
        url: "/tas/leavingMessage/page/"+userName,
        method:"POST",
        data: searchCondition,
        headers: {
            'Content-Type':'application/json;charset=UTF-8'
        }
    })
}

//修改留言
export function changeData(datas) {
    return axios({
        url: "/tas/leavingMessage/",
        method: "PATCH",
        data: datas,
        headers: {
            'Content-Type': 'application/json;charset=UTF-8'
        },
    })
}

//添加留言
export function addData(datas){
    return axios({
        url: "/tas/leavingMessage/",
        method:"POST",
        data: datas,
        headers: {
            'Content-Type':'application/json;charset=UTF-8'
        }
    })
}

//删除留言
export function deleteData(ids) {
    return axios({
        url: "/tas/leavingMessage/?ids="+ids,
        method: "DELETE"
    })
}

//获取标题
export function getTitle(datas){
    let userName = JSON.parse(localStorage.getItem("user")).name;
    return axios({
        url: "/tas/leavingMessage/title/"+userName,
        method:"POST",
        data: datas,
        headers: {
            'Content-Type':'application/json;charset=UTF-8'
        }
    })
}

//获取搜索内容
export function getQueryData(query,queryString){
    let userName = JSON.parse(localStorage.getItem("user")).name;
    return axios({
        url: "/tas/leavingMessage/"+userName+"/"+query+"?querystring="+queryString,
        method: "GET"
    })
}