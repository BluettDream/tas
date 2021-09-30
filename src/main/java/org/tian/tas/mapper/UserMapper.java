package org.tian.tas.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.tian.tas.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @Entity org.tian.tas.entity.User
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {
    //根据用户名查询用户
    User getByName(String name);
}




