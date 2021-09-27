package org.tian.tas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author blue
 * @date 2021/9/27 12:46
 */
@Controller
public class LoginController {

    @GetMapping("/")
    public void login(HttpServletResponse response) throws IOException {
        response.sendRedirect("login");
    }

}
