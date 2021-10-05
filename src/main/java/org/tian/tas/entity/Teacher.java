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
 * @TableName teacher
 */
@TableName(value ="teacher")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Teacher implements Serializable {
    /**
     * 教师用户名
     */
    @TableId
    private String userName;

    /**
     * 教师姓名
     */
    private String name;

    /**
     * 教师工号
     */
    private Integer teacherNum;

    /**
     * 教师所在部门
     */
    private String department;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}