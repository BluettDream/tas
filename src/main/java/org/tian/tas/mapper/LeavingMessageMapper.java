package org.tian.tas.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;
import org.tian.tas.entity.LeavingMessage;

import java.util.List;
import java.util.Map;

/**
 * @Entity org.tian.tas.entity.LeavingMessage
 */
@Mapper
public interface LeavingMessageMapper extends BaseMapper<LeavingMessage> {

    //分页查询
    IPage<LeavingMessage> selectPageVo(Page<?> page, String sender, String receiver, String title, String content,String startTime, String endTime,String user);

    //标题查询
    List<String> selectDistinctTitle(String sender, String receiver);

    //删除留言
    Boolean updateByIds(List<String> ids);

    //根据搜索条件查询
    List<String> selectByQueryString(String sender,String receiver,String query,String queryString);

    //更新留言信息的发送人和接收人
    Boolean updateUserName(String userRole,String userName,String oldName);

    //获取每个月留言总数
    @MapKey(value = "month")
    List<Map<String,Integer>> selectEveryMonthMessage(String receiver, int year);
}




