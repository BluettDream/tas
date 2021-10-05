package org.tian.tas.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tian.tas.entity.LeavingMessage;
import org.tian.tas.entity.bo.SearchCondition;
import org.tian.tas.mapper.LeavingMessageMapper;
import org.tian.tas.service.LeavingMessageService;

import java.util.List;

/**
 *
 */
@Service
public class LeavingMessageServiceImpl extends ServiceImpl<LeavingMessageMapper, LeavingMessage>
    implements LeavingMessageService{

    @Autowired
    private LeavingMessageMapper leavingMessageMapper;

    @Override
    public IPage<LeavingMessage> selectPage(Page<?> page, SearchCondition condition) {
        if(condition.getIsAll()){  //查询全部留言
            return leavingMessageMapper.selectPageVo(page, condition.getSender(), condition.getReceiver(), condition.getTitle(), condition.getContent(), condition.getStartTime(), condition.getEndTime());
        }
        //查询个人留言
        return leavingMessageMapper.selectPageVo(page, condition.getSender(), "", condition.getTitle(), condition.getContent(), condition.getStartTime(), condition.getEndTime());
    }

    @Override
    public List<String> selectDistinctTitle(String sender, String receiver) {
        if(!receiver.equals("")){   //查询全部留言
            return leavingMessageMapper.selectDistinctTitle(sender,receiver);
        }
        //查询个人留言
        return leavingMessageMapper.selectDistinctTitle(sender,null);
    }

    @Override
    public Boolean deleteByIds(List<String> ids) {
        return leavingMessageMapper.updateByIds(ids);
    }

    @Override
    public List<String> selectByQueryString(String sender, String receiver,String query, String queryString) {
        if(receiver != null) return leavingMessageMapper.selectByQueryString(sender,receiver,query,queryString);
        return leavingMessageMapper.selectByQueryString(sender,null,query,queryString);
    }

}




