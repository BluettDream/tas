import axios from "axios"

//获取对应页面数据
export function getPage(searchCondition){
    let userName = JSON.parse(localStorage.getItem("user")).name;
    return axios({
        url: "/api/leavingMessage/page/"+userName,
        method:"POST",
        data: searchCondition,
        headers: {
            'Content-Type':'application/json;charset=UTF-8'
        }
    })
}

//修改数据
export function changeData(datas) {
    return axios({
        url: "/api/leavingMessage/",
        method: "PATCH",
        data: datas,
        headers: {
            'Content-Type': 'application/json'
        },
    })
}

//获取标题
export function getTitle(datas){
    let userName = JSON.parse(localStorage.getItem("user")).name;
    return axios({
        url: "/api/leavingMessage/title/"+userName,
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
        url: "/api/leavingMessage/?ids="+ids,
        method: "DELETE"
    })
}