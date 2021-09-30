package org.tian.tas.controller;

import lombok.extern.log4j.Log4j2;
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
@Log4j2
public class LoginController {

    @Autowired
    private UserService userService;

    @GetMapping("/tas")
    public void enter(HttpServletResponse response) throws IOException {
        response.sendRedirect("index.html");
    }

    @PostMapping("/login")
    @ResponseBody
    public String login(@RequestBody User user,HttpServletResponse response){
        User user1 = userService.getByName(user.getName());
        if(null != user1){
            if(user1.getIsRegistered() && user.getPassword().equals(user1.getPassword())
            && user.getRole().equals(user1.getRole())){
                response.setHeader("token",user1.getId());
                response.setHeader("roleNum", String.valueOf(user1.getRoleNum()));
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
        if(userService.save(user)){
            response.setHeader("token",id);
            return "success";
        }
        return "error";
    }

}
