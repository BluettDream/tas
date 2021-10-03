package org.tian.tas.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName course
 */
@TableName(value ="course")
@Data
public class Course implements Serializable {
    /**
     * 课程编号
     */
    @TableId
    private String num;

    /**
     * 课程名
     */
    private String name;

    /**
     * 教师编号
     */
    private Integer teacherNum;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}