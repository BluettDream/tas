package org.tian.tas.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.tian.tas.entity.Course;
import org.tian.tas.entity.Score;
import org.tian.tas.service.CourseService;
import org.tian.tas.service.ScoreService;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Blue
 * @date 2021/10/3
 */
@RestController
@RequestMapping("/achievement")
@Log4j2
public class AchievementController {

    @Autowired
    private CourseService courseService;
    @Autowired
    private ScoreService scoreService;

    @GetMapping("/course/{teacherNum}")
    public List<Course> getCourseName(@PathVariable("teacherNum") Integer teacherNum){
        if(teacherNum == 0){   //管理员获取所有课程
            List<String> cn = new ArrayList<>();
            return courseService.list();
        }
        return courseService.selectCNByTeacherNum(teacherNum);
    }

    @PostMapping("/")
    public String getAchievementInfo(@RequestBody List<Score> scoreList){
        int flag = 0;
        for (Score score : scoreList) {
            Score repeatScore = scoreService.selectByCNumAndSName(score.getCourseNum(), score.getStudentNum());
            if(repeatScore != null) flag = 1;
            if(flag == 1) break;
        }
        if(flag == 1){     //查询到已经保存了成绩信息,不能保存了
            return "fail";
        }
        if(scoreService.saveBatch(scoreList)){
            return "success";
        }
        return "error";
    }
}
