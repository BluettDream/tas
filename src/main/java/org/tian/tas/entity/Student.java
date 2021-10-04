package org.tian.tas.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName student
 */
@TableName(value ="student")
@Data
public class Student implements Serializable {
    /**
     * 学生用户名
     */
    @TableId
    private String userName;

    /**
     * 学生姓名
     */
    private String name;

    /**
     * 学生学号
     */
    private Integer studentNum;

    /**
     * 学生所在班级
     */
    private String studentClass;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}