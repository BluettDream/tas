package org.tian.tas.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.tian.tas.entity.User;
import org.tian.tas.entity.bo.SearchCondition;
import org.tian.tas.entity.vo.LM;
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
    private UserService userService;
    @Autowired
    private LeavingMessageService messageService;

    @PostMapping("/page/{userId}")
    public IPage<LM> getPage(@PathVariable("userId") String userId,
                             @RequestBody SearchCondition condition){
        List<User> userList = userService.list();
        IPage<LM> iPage = null;
        Page<Object> page = new Page<>(condition.getCurrentPage(), condition.getPageSize());
        //判断是全部留言还是自己留言
        log.info("{}",condition);
        if(condition.getIsAll()){
            if(condition.getTitle() != "" && condition.getStartTime() == ""){   //根据标题查询
                iPage = messageService.selectAllByTitle(page,userId,userId,condition.getTitle());
            }else if(condition.getTitle() == "" && condition.getStartTime() != ""){  //根据日期查询
                iPage = messageService.selectAllByDate(page,userId,userId, condition.getStartTime(), condition.getEndTime());
            }else if(condition.getTitle() != "" && condition.getStartTime() != ""){  //根据标题和日期查询
                messageService.selectAllByTitleAndDate(page,userId,userId, condition.getTitle(), condition.getStartTime(), condition.getEndTime());
            }else{   //直接查询
                iPage = messageService.selectAll(page,userId,userId);
            }
        }else{
            if(condition.getTitle() != "" && condition.getStartTime() == ""){   //根据标题查询
                iPage = messageService.selectMineByTitle(page,userId,condition.getTitle());
            }else if(condition.getTitle() == "" && condition.getStartTime() != ""){  //根据日期查询
                iPage = messageService.selectMineByDate(page,userId, condition.getStartTime(), condition.getEndTime());
            }else if(condition.getTitle() != "" && condition.getStartTime() != ""){  //根据标题和日期查询
                messageService.selectMineByTitleAndDate(page,userId, condition.getTitle(), condition.getStartTime(), condition.getEndTime());
            }else{   //直接查询
                iPage = messageService.selectMine(page,userId);
            }
        }
        if(iPage == null) return new Page<>();
        List<LM> lmList = iPage.getRecords();
        //遍历用户表
        for (User user : userList) {
            //遍历查询结果
            for (LM lm : lmList) {
                //如果发送者ID与当前用户相等，设置发送者为该用户名
                if(lm.getSender().equals(user.getId())){
                    lm.setSender(user.getName());
                }
                //如果接收者ID与当前用户相等，设置发送者为该用户名
                if(lm.getReceiver().equals(user.getId())){
                    lm.setReceiver(user.getName());
                }
            }
        }
        return iPage.setRecords(lmList);
    }

    @PostMapping("/title/{userId}")
    public List<String> getTitle(@PathVariable("userId") String userId,
                                 @RequestBody SearchCondition condition){
        if(condition.getIsAll()){
            return messageService.selectAllTitle(userId,userId);
        }
        return messageService.selectMyTitle(userId);
    }

}
