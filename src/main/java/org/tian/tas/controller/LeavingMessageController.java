package org.tian.tas.controller;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.tian.tas.entity.LeavingMessage;
import org.tian.tas.entity.User;
import org.tian.tas.entity.bo.SearchCondition;
import org.tian.tas.entity.vo.CommonResVO;
import org.tian.tas.service.LeavingMessageService;
import org.tian.tas.service.UserService;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author blue
 * @date 2021/9/29 11:05
 */
@RestController
@RequestMapping("/leavingMessage")
public class LeavingMessageController {

    @Autowired
    private LeavingMessageService messageService;
    @Autowired
    private UserService userService;

    @DeleteMapping("/")
    public String deleteData(@RequestParam("ids") String ids){
        String[] split = new String[ids.length()];
        if(ids.contains(",")){
            split = ids.split(",");
            if(messageService.deleteByIds(Arrays.asList(split))){
                return "success";
            }
        }
        split[0] = ids;
        if(messageService.deleteByIds(Arrays.asList(split))){
            return "success";
        }
        return "error";
    }

    @PatchMapping("/")
    public String changeData(@RequestBody LeavingMessage message){
        User user = userService.getByName(message.getReceiver());
        if(user != null && messageService.updateById(message)){
            return "success";
        }
        return "error";
    }

    @PostMapping("/")
    public String addData(@RequestBody LeavingMessage message){
        User user = userService.getByName(message.getReceiver());
        if(user == null) return "fail";
        if(messageService.save(message)){
            return "success";
        }
        return "error";
    }

    @PostMapping("/page/{userName}")
    public IPage<LeavingMessage> getPage(@PathVariable("userName") String userName,
                                         @RequestBody SearchCondition condition){
        //判断是全部留言还是个人留言
        return messageService.selectPage(new Page<LeavingMessage>(condition.getCurrentPage(), condition.getPageSize()),condition);
    }

    @PostMapping("/title/{userName}")
    public List<String> getTitle(@PathVariable("userName") String userName,
                                 @RequestBody SearchCondition condition){
        if(condition.getIsAll()){
            return messageService.selectDistinctTitle(userName,userName);
        }
        return messageService.selectDistinctTitle(userName,"");
    }

    @GetMapping("/{userName}/{query}")
    public List<String> getQueryData(@PathVariable("userName") String userName,
                                     @PathVariable("query") String query,
                                     @RequestParam("querystring") String queryString){
        //判断是否为全部留言,搜索条件有1则为全部留言
        if(Character.isDigit(query.charAt(query.length()-1)) && query.charAt(query.length()-1) == '1'){
            query = query.replace("1","");
            return messageService.selectByQueryString(userName,userName,query,queryString);
        }
        return messageService.selectByQueryString(userName,null,query,queryString);
    }

    @GetMapping("/{userName}")
    public CommonResVO getMessageEveryMonth(@PathVariable String userName){
        int year = DateUtil.date().year();
        List<Map<String, Integer>> monthMessage = messageService.selectEveryMonthMessage(userName, year);
        for(int i = 1;i <= 12;++i){
            for (Map<String, Integer> map : monthMessage) {
                if(!map.containsKey(i)){
                    HashMap<String,Integer> hashMap = new HashMap<>();
                    hashMap.put(String.valueOf(i),null);
                    monthMessage.add(hashMap);
                }
                break;
            }
        }
        return new CommonResVO(200,"success",monthMessage);
    }

}
