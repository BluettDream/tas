package org.tian.tas.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.tian.tas.entity.User;
import org.tian.tas.service.UserService;
import org.tian.tas.mapper.UserMapper;
import org.springframework.stereotype.Service;

/**
 *
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User>
    implements UserService{

    @Autowired
    private UserMapper userMapper;

    @Override
    public User getByName(String name) {
        return userMapper.getByName(name);
    }
}




