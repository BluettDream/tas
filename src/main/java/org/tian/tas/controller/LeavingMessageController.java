package org.tian.tas.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.tian.tas.entity.LeavingMessage;
import org.tian.tas.entity.bo.SearchCondition;
import org.tian.tas.service.LeavingMessageService;

import java.util.List;

/**
 * @author blue
 * @date 2021/9/29 11:05
 */
@RestController
@Log4j2
@RequestMapping("/leavingMessage")
public class LeavingMessageController {

    @Autowired
    private LeavingMessageService messageService;

    @PostMapping("/page/{userName}")
    public IPage<LeavingMessage> getPage(@PathVariable("userName") String userName,
                                         @RequestBody SearchCondition condition){
        IPage<LeavingMessage> iPage;
        Page<Object> page = new Page<>(condition.getCurrentPage(), condition.getPageSize());
        //判断是全部留言还是自己留言
        log.info("{}",condition);
        if(condition.getIsAll()){
            if(condition.getTitle() != "" && condition.getStartTime() == ""){   //根据标题查询
                iPage = messageService.selectAllByTitle(page,userName,userName,condition.getTitle());
            }else if(condition.getTitle() == "" && condition.getStartTime() != ""){  //根据日期查询
                iPage = messageService.selectAllByDate(page,userName,userName, condition.getStartTime(), condition.getEndTime());
            }else if(condition.getTitle() != "" && condition.getStartTime() != ""){  //根据标题和日期查询
                iPage = messageService.selectAllByTitleAndDate(page,userName,userName, condition.getTitle(), condition.getStartTime(), condition.getEndTime());
            }else{   //直接查询
                iPage = messageService.selectAll(page,userName,userName);
            }
        }else{
            if(condition.getTitle() != "" && condition.getStartTime() == ""){   //根据标题查询
                iPage = messageService.selectMineByTitle(page,userName,condition.getTitle());
            }else if(condition.getTitle() == "" && condition.getStartTime() != ""){  //根据日期查询
                iPage = messageService.selectMineByDate(page,userName, condition.getStartTime(), condition.getEndTime());
            }else if(condition.getTitle() != "" && condition.getStartTime() != ""){  //根据标题和日期查询
                iPage = messageService.selectMineByTitleAndDate(page,userName, condition.getTitle(), condition.getStartTime(), condition.getEndTime());
            }else{   //直接查询
                iPage = messageService.selectMine(page,userName);
            }
        }
        return iPage;
    }

    @PostMapping("/title/{userName}")
    public List<String> getTitle(@PathVariable("userName") String userName,
                                 @RequestBody SearchCondition condition){
        if(condition.getIsAll()){
            return messageService.selectAllTitle(userName,userName);
        }
        return messageService.selectMyTitle(userName);
    }

}
