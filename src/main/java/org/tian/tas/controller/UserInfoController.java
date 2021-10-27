package org.tian.tas.controller;

import cn.hutool.crypto.SecureUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.tian.tas.entity.User;
import org.tian.tas.entity.vo.CommonResVO;
import org.tian.tas.service.UserService;

/**
 * @author tianmh
 * @date create by 2021/10/27 13:47
 */
@RestController
@RequestMapping("/user")
public class UserInfoController {

    @Autowired
    private UserService userService;

    @PutMapping("/")
    public CommonResVO modifyUser(@RequestBody User user){
        String oldName = userService.getById(user.getId()).getName();
        user.setPassword(SecureUtil.md5().digestHex(user.getPassword()));
        if (userService.updateById(user)) {
            return new CommonResVO(200,"success",oldName);
        }
        return new CommonResVO(403,"error");
    }
}
