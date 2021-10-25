package org.tian.tas.service;

import org.tian.tas.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 *
 */
public interface UserService extends IService<User> {

    /**
     * 根据用户名查询用户
     * @param name
     * @return user
     */
    User getByName(String name);

    /**
     * 根据角色和用户名查找真实姓名
     * @param role 角色
     * @param userName 用户名
     * @return string
     */
    String getRealNameByRole(String role,String userName);
}
