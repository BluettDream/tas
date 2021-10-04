package org.tian.tas.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.tian.tas.entity.Student;
import org.tian.tas.service.StudentService;
import org.tian.tas.mapper.StudentMapper;
import org.springframework.stereotype.Service;

/**
 *
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student>
    implements StudentService{

}




