import axios from "axios"

let userId = sessionStorage.getItem("id")

//获取对应页面数据
export function getPage(searchCondition){
    return axios({
        url: "/api/leavingMessage/page/"+userId,
        method:"POST",
        data: searchCondition,
        headers: {
            'Content-Type':'application/json;charset=UTF-8'
        }
    })
}

export function updateData(datas){
    return axios({
        url: "/api/leavingMessage/title/"+userId,
        method:"POST",
        data: datas,
        headers: {
            'Content-Type':'application/json;charset=UTF-8'
        }
    })
}

export function getTitle(datas){
    return axios({
        url: "/api/leavingMessage/title/"+userId,
        method:"POST",
        data: datas,
        headers: {
            'Content-Type':'application/json;charset=UTF-8'
        }
    })
}