package org.tian.tas.controller;

import cn.hutool.crypto.SecureUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tian.tas.entity.User;
import org.tian.tas.service.UserService;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

/**
 * @author blue
 * @date 2021/9/27 12:46
 */
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @GetMapping("/tas")
    public void enter(HttpServletResponse response) throws IOException {
        response.sendRedirect("/tas/home");
    }

    @PostMapping("/tas/login")
    @ResponseBody
    public String login(@RequestBody User user,HttpServletResponse response){
        User dataBaseUser = userService.getByName(user.getName());
        if(null != dataBaseUser){
            String hexPassword = SecureUtil.md5().digestHex(user.getPassword());
            if(dataBaseUser.getIsRegistered() && hexPassword.equals(dataBaseUser.getPassword())
            && user.getRole().equals(dataBaseUser.getRole())){
                response.setHeader("token",dataBaseUser.getId());
                response.setHeader("roleNum", String.valueOf(dataBaseUser.getRoleNum()));
                return "success";
            }
        }
        return "error";
    }

    @PostMapping("/tas/register")
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
