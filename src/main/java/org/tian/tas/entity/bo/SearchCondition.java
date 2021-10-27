package org.tian.tas.entity.bo;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author blue
 * @date 2021/9/29 14:31
 */
@Data
@NoArgsConstructor
public class SearchCondition {
    private String sender;          //留言发送人用户名
    private String receiver;        //留言接收人用户名
    private String queryUser;       //查询接收人的用户名
    private Integer currentPage;    //当前页面
    private Integer pageSize;       //页面大小
    private String title;           //留言标题
    private String content;         //留言内容
    private String startTime;       //留言开始时间
    private String endTime;         //留言结束时间
    private Boolean isAll;          //是否查询全部
}
