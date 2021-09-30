package org.tian.tas.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 
 * @TableName user
 */
@TableName(value ="user")
@Data
public class User implements Serializable {
    /**
     * 用户id，唯一标识
     */
    @TableId
    private String id;

    /**
     * 用户名(唯一索引)
     */
    private String name;

    /**
     * 角色身份标识(管理员,老师,学生)
     */
    private String role;

    /**
     * 用户密码
     */
    private String password;

    /**
     * 用户是否注册,可用于注销用户
     */
    private Boolean isRegistered;

    /**
     * 用户身份号,老师和学生需要提供,管理员不需要
     */
    private Integer roleNum;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}