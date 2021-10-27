package org.tian.tas.controller;

import cn.hutool.crypto.SecureUtil;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tian.tas.entity.User;
import org.tian.tas.service.UserService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

/**
 * @author blue
 * @date 2021/9/27 12:46
 */
@Controller
@Log4j2
public class LoginController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public void enter(HttpServletResponse response) throws IOException {
        response.sendRedirect("/tas/home");
    }

    @PostMapping("/login")
    @ResponseBody
    public String login(@RequestBody User user,HttpServletResponse response){
        User dataBaseUser = userService.getByName(user.getName());
        if(null != dataBaseUser){
            log.info("{}用户登录密码:{}",user.getName(),user.getPassword());
            String hexPassword = SecureUtil.md5().digestHex(user.getPassword());
            if(dataBaseUser.getIsRegistered() && hexPassword.equals(dataBaseUser.getPassword())
            && user.getRole().equals(dataBaseUser.getRole())){
                response.setHeader("token",dataBaseUser.getId());
                response.setHeader("roleNum", String.valueOf(dataBaseUser.getRoleNum()));
                String realName = userService.getRealNameByRole(dataBaseUser.getRole(), dataBaseUser.getName());
                if(!realName.equals("error")) response.addCookie(new Cookie("realName",realName));
                return "success";
            }
        }
        return "error";
    }

    @PostMapping("/register")
    @ResponseBody
    public String register(@RequestBody User user,HttpServletResponse response){
        String id = UUID.randomUUID().toString().replace("-", "").toLowerCase();
        user.setId(id);
        user.setIsRegistered(true);
        user.setPassword(SecureUtil.md5().digestHex(user.getPassword()));
        if(userService.save(user)){
            response.setHeader("token",id);
            return "success";
        }
        return "error";
    }

}
