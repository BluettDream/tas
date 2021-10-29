package org.tian.tas.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import org.tian.tas.entity.LeavingMessage;
import org.tian.tas.entity.bo.SearchCondition;

import java.util.List;

/**
 *
 */
public interface LeavingMessageService extends IService<LeavingMessage> {

    /**
     * 分页查询,根据条件获取对应页面数据
     * @param page 对象(当前页，页面需要显示几条数据)
     * @param condition 搜索条件对象
     * @return 根据搜索条件返回数据,并且返回分页信息
     */
    IPage<LeavingMessage> selectPage(Page<?> page, SearchCondition condition);

    /**
     * 标题查询
     * @param sender 留言发送人
     * @param receiver 留言接收人
     * @return 不重复的标题集合
     */
    List<String> selectDistinctTitle(String sender, String receiver);

    /**
     * 根据留言id集合删除留言
     * @param ids 留言id集合
     * @return boolean
     */
    Boolean deleteByIds(List<String> ids);

    /**
     * 根据搜索条件查询,返回查询结果
     * @param sender 留言发送人
     * @param receiver 留言接收人
     * @param query 搜索条件
     * @param queryString 搜索内容
     * @return string
     */
    List<String> selectByQueryString(String sender,String receiver,String query,String queryString);

    /**
     * 更新留言表中的用户名
     * @param userRole
     * @param userName
     * @return
     */
    Boolean updateUserName(String userRole,String userName,String oldName);

    /**
     * 获取每个月留言总数
     * @param receiver
     * @param year
     * @return
     */
    List<Integer> selectEveryMonthMessage(String receiver, int year);
}
