package org.tian.tas.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import org.tian.tas.entity.LeavingMessage;
import org.tian.tas.entity.vo.LM;

import java.util.List;

/**
 *
 */
public interface LeavingMessageService extends IService<LeavingMessage> {

    //分页查询我的留言
    IPage<LM> selectMine(Page<?> page, String sender);

    //根据标题分页查询我的留言
    IPage<LM> selectMineByTitle(Page<?> page, String sender,String title);

    //根据日期分页查询我的留言
    IPage<LM> selectMineByDate(Page<?> page, String sender,String startTime,String endTime);

    //根据标题和日期分页查询我的留言
    IPage<LM> selectMineByTitleAndDate(Page<?> page, String sender,String title,String startTime,String endTime);

    //分页查询全部留言
    IPage<LM> selectAll(Page<?> page, String sender,String receiver);

    //根据标题分页查询全部留言
    IPage<LM> selectAllByTitle(Page<?> page, String sender,String receiver,String title);

    //根据日期分页查询全部留言
    IPage<LM> selectAllByDate(Page<?> page, String sender,String receiver,String startTime,String endTime);

    //根据标题和日期分页查询全部留言
    IPage<LM> selectAllByTitleAndDate(Page<?> page, String sender,String receiver,String title,String startTime,String endTime);

    //查询我的标题
    List<String> selectMyTitle(String sender);

    //查询所有标题
    List<String> selectAllTitle(String sender,String receiver);
}
