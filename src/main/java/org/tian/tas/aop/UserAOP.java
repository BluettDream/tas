package org.tian.tas.aop;

import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.tian.tas.entity.User;
import org.tian.tas.entity.vo.CommonResVO;
import org.tian.tas.service.LeavingMessageService;

/**
 * @author tianmh
 * @date create by 2021/10/27 14:35
 */
@Aspect
@Component
@Log4j2
public class UserAOP {

    @Autowired
    private LeavingMessageService leavingMessageService;

    @Pointcut(value = "execution(* org.tian.tas.controller.UserInfoController.modifyUser(..))")
    public void executeModify(){}

    @AfterReturning(pointcut = "executeModify()",returning = "result")
    public void afterModifyReturn(JoinPoint joinPoint, CommonResVO result){
        if(result.getStatus().equals("success") && result.getCode() == 200){
            User user = (User) joinPoint.getArgs()[0];              //获取前端传入新用户名
            String oldName = String.valueOf(result.getData());      //获取老用户名
            if(!user.getName().equals(oldName)){                    //用户名更改时进行留言更新
                if(!leavingMessageService.updateUserName("sender", user.getName(),oldName)){
                    log.error("留言发送用户{}更新失败!",user.getName());
                    return;
                }
                if(!leavingMessageService.updateUserName("receiver", user.getName(),oldName)){
                    log.error("留言接收用户{}更新失败!",user.getName());
                    return;
                }
                log.info("{}留言发送用户名和接收用户名更新成功",user.getName());
            }
        }
    }

}
