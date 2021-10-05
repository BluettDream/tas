package org.tian.tas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.tian.tas.entity.Course;
import org.tian.tas.service.CourseService;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Blue
 * @date 2021/10/3
 */
@RestController
@RequestMapping("/achievement")
public class AchievementController {

    @Autowired
    private CourseService courseService;

    @GetMapping("/course/{teacherNum}")
    public List<String> getCourseName(@PathVariable("teacherNum") Integer teacherNum){
        if(teacherNum == 0){   //管理员获取所有课程
            List<String> cn = new ArrayList<>();
            List<Course> courseList = courseService.list();
            courseList.forEach(ele -> {
                cn.add(ele.getName());
            });
            return cn;
        }
        return courseService.selectCNByTeacherNum(teacherNum);
    }
}
