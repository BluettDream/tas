package org.tian.tas.service;

import org.tian.tas.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 *
 */
public interface UserService extends IService<User> {

    //根据用户名查询用户
    User getByName(String name);

}
