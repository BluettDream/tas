package org.tian.tas.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 
 * @TableName student
 */
@TableName(value ="student")
@Data
@AllArgsConstructor
@NoArgsConstructor
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