package org.tian.tas.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.tian.tas.entity.User;
import org.tian.tas.service.StudentService;
import org.tian.tas.service.TeacherService;
import org.tian.tas.service.UserService;
import org.tian.tas.mapper.UserMapper;
import org.springframework.stereotype.Service;

/**
 *
 */
@Service
@Log4j2
public class UserServiceImpl extends ServiceImpl<UserMapper, User>
    implements UserService{

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;

    @Override
    public User getByName(String name) {
        return userMapper.getByName(name);
    }

    @Override
    public String getRealNameByRole(String role, String userName) {
        String realName;
        log.info("角色为:{},用户名为:{}",role,userName);
        switch (role){
            case "student":
                realName = studentService.getById(userName).getName();
                break;
            case "teacher":
                realName = teacherService.getById(userName).getName();
                break;
            default:
                realName = "error";
                break;
        }
        return realName;
    }


}




