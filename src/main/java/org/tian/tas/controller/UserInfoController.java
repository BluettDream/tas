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
        User oldUser = userService.getById(user.getId());
        user.setPassword(SecureUtil.md5().digestHex(user.getPassword()));       //密码加密
        if(oldUser != null){
            User repeatNameUser = userService.getByName(user.getName());
            if(repeatNameUser != null){                                         //查到相同名称用户
                if(repeatNameUser.getPassword().equals(user.getPassword())){    //用户密码相同,表明用户想修改昵称
                    return new CommonResVO(444,"error");
                }
            }
            String oldName = oldUser.getName();                                 //用户可以修改用户名或密码
            if (userService.updateById(user)) {
                return new CommonResVO(200,"success",oldName);
            }
        }
        return new CommonResVO(403,"error");
    }
}
