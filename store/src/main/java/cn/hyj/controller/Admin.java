package cn.hyj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/manage")
@Controller
public class Admin {

    @RequestMapping("/index")
    public String getIndex(){
        return "redirect:/administrators/frame.jsp";
    }
    @RequestMapping("/frame")
    public String getLogin(){
        return  "redirect:/administrators/login.jsp";
    }

}
