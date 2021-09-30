import axios from "axios"

let userName = JSON.parse(localStorage.getItem("user")).name;

//获取对应页面数据
export function getPage(searchCondition){
    return axios({
        url: "/api/leavingMessage/page/"+userName,
        method:"POST",
        data: searchCondition,
        headers: {
            'Content-Type':'application/json;charset=UTF-8'
        }
    })
}

export function updateData(datas){
    return axios({
        url: "/api/leavingMessage/title/"+userName,
        method:"POST",
        data: datas,
        headers: {
            'Content-Type':'application/json;charset=UTF-8'
        }
    })
}

export function getTitle(datas){
    return axios({
        url: "/api/leavingMessage/title/"+userName,
        method:"POST",
        data: datas,
        headers: {
            'Content-Type':'application/json;charset=UTF-8'
        }
    })
}