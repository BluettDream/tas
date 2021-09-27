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
     * 留言人用户名
     */
    private String lmPersonName;

    /**
     * 留言时间
     */
    private Date lmDate;

    /**
     * 留言标题
     */
    private String lmTitle;

    /**
     * 留言内容
     */
    private String lmContent;

    /**
     * 留言信息接收者
     */
    private String receiver;

    /**
     * 数据是否已删除(0未删除,1已删除)
     */
    private Object isDeleted;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}