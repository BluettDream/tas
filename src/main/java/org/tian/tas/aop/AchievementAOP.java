package org.tian.tas.aop;

import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.tian.tas.entity.Student;
import org.tian.tas.entity.Teacher;
import org.tian.tas.entity.User;
import org.tian.tas.service.StudentService;
import org.tian.tas.service.TeacherService;
import org.tian.tas.service.UserService;

/**
 * @author TianMH
 * @date 2021/10/5 16:47
 */
@Aspect
@Component
@Log4j2
public class AchievementAOP {

    @Autowired
    private UserService userService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private StudentService studentService;

    @Pointcut(value = "execution(* org.tian.tas.controller.LoginController.register(..))")
    public void executeRegister(){}

    @AfterReturning(pointcut = "executeRegister()",returning = "result")
    public void afterRegisterReturn(JoinPoint joinPoint,String result){
        if(result.equals("success")){
            User user = (User) joinPoint.getArgs()[0];
            switch (user.getRole()){
                case "teacher":
                    teacherService.save(new Teacher(user.getName(), user.getRealName(), user.getRoleNum(), user.getDepartment()));
                    break;
                case "student":
                    studentService.save(new Student(user.getName(), user.getRealName(), user.getRoleNum(), user.getStuClass()));
                    break;
            }
        }

    }

}
