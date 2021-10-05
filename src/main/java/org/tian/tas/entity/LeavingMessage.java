package org.tian.tas.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @TableName leaving_message
 */
@TableName(value ="leaving_message")
@Data
public class LeavingMessage implements Serializable {
    /**
     * 留言信息id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 留言发送者
     */
    private String sender;

    /**
     * 留言时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",locale = "zh",timezone = "GMT+8")
    private Date date;

    /**
     * 留言标题
     */
    private String title;

    /**
     * 留言内容
     */
    private String content;

    /**
     * 留言接收者
     */
    private String receiver;

    /**
     * 数据是否已删除(0未删除,1已删除)
     */
    private Object isDeleted;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}