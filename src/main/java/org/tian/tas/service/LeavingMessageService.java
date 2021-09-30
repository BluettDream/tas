package org.tian.tas.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import org.tian.tas.entity.LeavingMessage;

import java.util.List;

/**
 *
 */
public interface LeavingMessageService extends IService<LeavingMessage> {

    //分页查询
    IPage<LeavingMessage> selectPage(Page<?> page, String sender, String receiver, String title, String startTime, String endTime);

    //标题查询
    List<String> selectDistinctTitle(String sender, String receiver);

    //删除留言
    Boolean deleteByIds(List<String> ids);
}
