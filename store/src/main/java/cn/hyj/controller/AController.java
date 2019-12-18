package cn.hyj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 实现页面间的跳转
 */
@Controller
public class AController {

    /**
     * 登录
     * @return
     *
     * 多岁的
     */
//    @RequestMapping("/login")
//    public String login(){
//        return "login";
//    }

    /**
     * 注册
     * @return
     */
    @RequestMapping("/registered")
    public String registered(){
        return "registered";
    }

    /**
     *
     * @return
     */
    @RequestMapping("/Cart")
    public String Cart(){
        return "Cart";
    }

    /**
     * 常见问题
     * @return
     */
    @RequestMapping("User_Orderform")
    public String User_Orderform(){
        return "User_Orderform";
    }

}
