package cn.hyj.controller;

import cn.hyj.entity.Administrator;
import cn.hyj.service.AdministratorService;
import org.bouncycastle.math.raw.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * 管理员的Controller
 */
@Controller
@RequestMapping("/manage")
@SessionAttributes(value = {"admin"})
public class AdministratorController {

    @Autowired
    private AdministratorService administratorService;

    /**
     * 登录验证
     * @param name 管理员名称
     * @param password 密码
     * @param model
     * @return 字符串
     */
    @RequestMapping("/login")
    public String login(@RequestParam("name") String name,@RequestParam("password") String password, Model model){

        Administrator administrator = administratorService.queryAdmin(name,password);
        if(administrator!=null){
            model.addAttribute("admin",administrator);
            return "forward:/administrators/frame.jsp";
        }else if(administrator == null){
            return "redirect:/manage/frame";
        }
        return "";
    }

    /**
     * 修改密码
     * @param oldPassword 原密码
     * @param password 要修改的密码
     * @param admin
     * @return
     */
    @RequestMapping("/changePassword")
    @ResponseBody
    public String changePassword(@RequestParam("oldPassword") String oldPassword,@RequestParam("password") String password, @SessionAttribute("admin") Administrator admin){

        if (oldPassword.equals(admin.getPassword())){
                administratorService.changePassword(admin.getId(),password);
                return "0";//修改成功！
        }else{
            return "1";//密码输入错误
        }
    }

}
