package org.tian.tas.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.tian.tas.entity.Course;
import org.tian.tas.service.CourseService;
import org.tian.tas.mapper.CourseMapper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 */
@Service
public class CourseServiceImpl extends ServiceImpl<CourseMapper, Course>
    implements CourseService{

    @Autowired
    private CourseMapper courseMapper;
    @Override
    public List<Course> selectCNByTeacherNum(Integer teacherNum) {
        return courseMapper.selectCNByTeacherNum(teacherNum);
    }
}




