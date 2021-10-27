import axios from "axios";

export function modifyUser(datas){
    return axios({
        url: "/tas/user/",
        method: "PUT",
        data:datas,
        headers: {
            'Content-Type':'application/json;charset=UTF-8'
        }
    })
}