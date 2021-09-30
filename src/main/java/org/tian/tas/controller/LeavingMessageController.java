package org.tian.tas.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.tian.tas.entity.LeavingMessage;
import org.tian.tas.entity.User;
import org.tian.tas.entity.bo.SearchCondition;
import org.tian.tas.service.LeavingMessageService;
import org.tian.tas.service.UserService;

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
    @Autowired
    private UserService userService;

    @PatchMapping("/")
    public String changeData(@RequestBody LeavingMessage message){
        User user = userService.getByName(message.getReceiver());
        if(user != null && messageService.updateById(message)){
            return "success";
        }
        return "error";
    }

    @PostMapping("/page/{userName}")
    public IPage<LeavingMessage> getPage(@PathVariable("userName") String userName,
                                         @RequestBody SearchCondition condition){
        Page<Object> page = new Page<>(condition.getCurrentPage(), condition.getPageSize());
        log.info("{}",condition);
        //判断是全部留言还是个人留言
        if(condition.getIsAll()){
            return messageService.selectPage(page,userName,userName, condition.getTitle(), condition.getStartTime(),condition.getEndTime());
        }
        return messageService.selectPage(page,userName,"", condition.getTitle(), condition.getStartTime(), condition.getEndTime());
    }

    @PostMapping("/title/{userName}")
    public List<String> getTitle(@PathVariable("userName") String userName,
                                 @RequestBody SearchCondition condition){
        if(condition.getIsAll()){
            return messageService.selectDistinctTitle(userName,userName);
        }
        return messageService.selectDistinctTitle(userName,"");
    }

}
