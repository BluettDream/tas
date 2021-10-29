package org.tian.tas.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tian.tas.entity.LeavingMessage;
import org.tian.tas.entity.bo.EveryMonthMessageBO;
import org.tian.tas.entity.bo.SearchCondition;
import org.tian.tas.mapper.LeavingMessageMapper;
import org.tian.tas.service.LeavingMessageService;

import java.util.ArrayList;
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
            if(condition.getSender().equals("admin")){  //管理员用户查询所有
                return leavingMessageMapper.selectPageVo(
                        page,"","",
                        condition.getTitle(),
                        condition.getContent(),
                        condition.getStartTime(),
                        condition.getEndTime(),
                        condition.getQueryUser());
            }
            return leavingMessageMapper.selectPageVo(
                    page,
                    condition.getSender(),
                    condition.getReceiver(),
                    condition.getTitle(),
                    condition.getContent(),
                    condition.getStartTime(),
                    condition.getEndTime(),
                    condition.getQueryUser());
        }
        //查询个人留言
        return leavingMessageMapper.selectPageVo(
                page,
                condition.getSender(), "",
                condition.getTitle(),
                condition.getContent(),
                condition.getStartTime(),
                condition.getEndTime(),
                condition.getQueryUser());
    }

    @Override
    public List<String> selectDistinctTitle(String sender, String receiver) {
        if(!receiver.equals("")){   //查询全部留言
            if(sender.equals("admin")){
                return leavingMessageMapper.selectDistinctTitle(null,null);
            }
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
        if(sender.equals("admin")) return leavingMessageMapper.selectByQueryString(null,null,query,queryString);
        if(receiver != null) return leavingMessageMapper.selectByQueryString(sender,receiver,query,queryString);
        return leavingMessageMapper.selectByQueryString(sender,null,query,queryString);
    }

    @Override
    public Boolean updateUserName(String userRole,String userName,String oldName) {
        return leavingMessageMapper.updateUserName(userRole,userName,oldName);
    }

    @Override
    public List<Integer> selectEveryMonthMessage(String receiver, int year) {
        List<EveryMonthMessageBO> monthMessage = leavingMessageMapper.selectEveryMonthMessage(receiver, year);
        List<Integer> result = new ArrayList<>();
        int j = 0,n = monthMessage.size();
        for (int i = 1; i <= 12; ++i) {
            if(j < n){
                EveryMonthMessageBO messageBO = monthMessage.get(j);
                if(messageBO.getMonth() == i){
                    result.add(messageBO.getValue());
                    ++j;
                    continue;
                }
            }
            result.add(null);
        }
        return result;
    }

}




