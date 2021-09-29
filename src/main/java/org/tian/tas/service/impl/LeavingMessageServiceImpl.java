package org.tian.tas.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tian.tas.entity.LeavingMessage;
import org.tian.tas.entity.vo.LM;
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
    public IPage<LM> selectMine(Page<?> page, String sender) {
        return leavingMessageMapper.selectPageVo(page,sender,null,null,null,null);
    }

    @Override
    public IPage<LM> selectMineByTitle(Page<?> page, String sender, String title) {
        return leavingMessageMapper.selectPageVo(page,sender,null,title,null,null);
    }

    @Override
    public IPage<LM> selectMineByDate(Page<?> page, String sender, String startTime, String endTime) {
        return leavingMessageMapper.selectPageVo(page,sender,null,null,startTime,endTime);
    }

    @Override
    public IPage<LM> selectMineByTitleAndDate(Page<?> page, String sender, String title, String startTime, String endTime) {
        return leavingMessageMapper.selectPageVo(page,sender,null,title,startTime,endTime);
    }

    @Override
    public IPage<LM> selectAll(Page<?> page, String sender, String receiver) {
        return leavingMessageMapper.selectPageVo(page,sender,receiver,null,null,null);
    }

    @Override
    public IPage<LM> selectAllByTitle(Page<?> page, String sender, String receiver, String title) {
        return leavingMessageMapper.selectPageVo(page,sender,receiver,title,null,null);
    }

    @Override
    public IPage<LM> selectAllByDate(Page<?> page, String sender, String receiver, String startTime, String endTime) {
        return leavingMessageMapper.selectPageVo(page,sender,receiver,null,startTime,endTime);
    }

    @Override
    public IPage<LM> selectAllByTitleAndDate(Page<?> page, String sender, String receiver, String title, String startTime, String endTime) {
        return leavingMessageMapper.selectPageVo(page,sender,receiver,title,startTime,endTime);
    }

    @Override
    public List<String> selectMyTitle(String sender) {
        return leavingMessageMapper.selectDistinctTitle(sender,null);
    }

    @Override
    public List<String> selectAllTitle(String sender, String receiver) {
        return leavingMessageMapper.selectDistinctTitle(sender,receiver);
    }
}




