import axios from "axios"

export function getCourse(teacherNum){
    return axios({
        url:"/tas/achievement/course/"+teacherNum,
        method: "GET"
    })
}