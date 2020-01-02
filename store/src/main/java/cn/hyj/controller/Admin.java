package cn.hyj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class Admin {

    @RequestMapping("/index")
    public String getIndex(){
        return "redirect:/administrators/frame.jsp";
    }

}
