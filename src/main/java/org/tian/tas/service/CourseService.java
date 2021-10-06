package org.tian.tas.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.tian.tas.entity.Course;

import java.util.List;

/**
 *
 */
public interface CourseService extends IService<Course> {

    //根据教师编号获取教师对应教学课程
    List<Course> selectCNByTeacherNum(Integer teacherNum);

}
