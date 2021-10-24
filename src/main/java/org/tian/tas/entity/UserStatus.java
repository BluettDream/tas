package org.tian.tas.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * @TableName user_status
 */
@TableName(value ="user_status")
@Data
public class UserStatus implements Serializable {
    /**
     * 用户id,即token
     */
    @TableId
    private String userId;

    /**
     * 用户登录状态
     */
    private Object loginStatus;

    /**
     * 用户登录系统时间
     */
    private Date loginTime;

    /**
     * 用户登出系统时间
     */
    private Date logoutTime;

    /**
     * 允许用户登录系统停留时间
     */
    private Date loginPermitTime;

    /**
     * 用户登录所需token
     */
    private String token;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}