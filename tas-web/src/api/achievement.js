import axios from "axios"

//获取教师所教课程名称
export function getCourse(teacherNum){
    return axios({
        url:"/tas/achievement/course/"+teacherNum,
        method: "GET"
    })
}

//提交学生成绩信息
export function postAchievement(datas){
    return axios({
        url:"/tas/achievement/",
        method: "POST",
        data: datas,
        headers:{
            'Content-Type': 'application/json;charset=UTF-8'
        }
    })
}

//获取成绩单
export function getScoreReport(studentNumber,teacherNum){
    return axios({
        url: "/tas/achievement/score?studentNum="+studentNumber+"&teacherNum="+teacherNum,
        method: "GET"
    })
}