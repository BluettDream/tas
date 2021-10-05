package org.tian.tas.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.tian.tas.entity.Course;

import java.util.List;

/**
 * @Entity org.tian.tas.entity.Course
 */
@Mapper
public interface CourseMapper extends BaseMapper<Course> {

    //根据教师编号获取教师对应教学课程
    List<String> selectCNByTeacherNum(Integer teacherNum);
}




