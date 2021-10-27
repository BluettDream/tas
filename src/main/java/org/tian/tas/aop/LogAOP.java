package org.tian.tas.aop;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.util.Arrays;

/**
 * @author TianMH
 * @date 2021/10/6 11:04
 */
@Aspect
@Component
@Log4j2
public class LogAOP {

    @Pointcut(value = "execution(* org.tian.tas.controller.*.*(..))")
    public void executePrintLog(){}

    @Around(value = "executePrintLog()")
    public Object aroundLog(ProceedingJoinPoint pjp){
        Object obj = null;
        try {
            Object[] oldArgs = pjp.getArgs();                    //获取执行方法参数
            String methodName = pjp.getSignature().getName();    //获取执行方法名
            ObjectMapper mapper = new ObjectMapper();
            //排除ServletRequest和ServletResponse参数导致打印参数异常的影响,获取新的参数对象数组
            Object[] newArgs = Arrays.stream(oldArgs).filter(arg -> !(arg instanceof ServletRequest || arg instanceof ServletResponse)).toArray();
            log.info("进入{}()方法,入参:{}",methodName,mapper.writeValueAsString(newArgs));
            obj = pjp.proceed();
            try{
                log.info("退出{}()方法,返回值:{}",methodName,obj.toString());
            }catch (NullPointerException e){
                log.info("{}()方法入参为空",methodName);
            }
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        return obj;
    }
}
