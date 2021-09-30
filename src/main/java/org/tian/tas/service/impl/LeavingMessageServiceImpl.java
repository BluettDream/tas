package org.tian.tas.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tian.tas.entity.LeavingMessage;
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
    public IPage<LeavingMessage> selectPage(Page<?> page, String sender, String receiver, String title, String startTime, String endTime) {
        if(!title.equals("") && startTime.equals("")){   //根据标题查询
            //查询所有留言
            if(!receiver.equals("")) return leavingMessageMapper.selectPageVo(page,sender,receiver,title,null,null);
            //查询个人留言
            return leavingMessageMapper.selectPageVo(page,sender,null,title,null,null);
        }else if(title.equals("") && !startTime.equals("")){  //根据日期查询
            if(!receiver.equals("")) return leavingMessageMapper.selectPageVo(page,sender,receiver,null,startTime,endTime);
            return leavingMessageMapper.selectPageVo(page,sender,null,null,startTime,endTime);
        }else if(!title.equals("") && !startTime.equals("")){  //根据标题和日期查询
            if(!receiver.equals("")) return leavingMessageMapper.selectPageVo(page,sender,receiver,title,startTime,endTime);
            return leavingMessageMapper.selectPageVo(page,sender,null,title,startTime,endTime);
        }else{         //查询全部
            if(!receiver.equals("")) return leavingMessageMapper.selectPageVo(page,sender,receiver,null,null,null);
            return leavingMessageMapper.selectPageVo(page,sender,null,null,null,null);
        }
    }

    @Override
    public List<String> selectDistinctTitle(String sender, String receiver) {
        if(!receiver.equals("")){   //查询全部留言
            return leavingMessageMapper.selectDistinctTitle(sender,receiver);
        }
        //查询个人留言
        return leavingMessageMapper.selectDistinctTitle(sender,null);
    }

}




