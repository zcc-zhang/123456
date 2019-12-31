package cn.hyj.controller;

import cn.hyj.entity.Administrator;
import cn.hyj.service.AdministratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * 管理员的Controller
 */
@Controller
@RequestMapping("/admin")
@SessionAttributes(value = {"admin"})
public class AdministratorController {

    @Autowired
    private AdministratorService administratorService;

    /**
     * 登录验证
     * @param adminName 管理员名称
     * @param password 密码
     * @param model
     * @return 字符串
     */
    @RequestMapping("/login")
    @ResponseBody
    public Administrator login(@RequestParam("adminName") String adminName,@RequestParam("password") String password, Model model){

        Administrator administrator = administratorService.queryAdmin(adminName,password);

        if (adminName.trim().equals("") || password.trim().equals("")){
           // return "1"; //1:管理员名名或密码为空
        }else if (adminName.equals(administrator.getAdminName()) || password.equals(administrator.getPassword())){
            //return "2";//2:管理员名或密码不正确
        }else{
            //登录成功
            System.out.println(administrator);

        }
        return administrator;
    }

    /**
     * 修改密码
     * @param thisPassword 原密码
     * @param password 要修改的密码
     * @param admin 管理员对象
     * @return
     */
    @RequestMapping("/changePassword")
    @ResponseBody
    public String changePassword(String thisPassword,String password,@SessionAttribute("admin") Administrator admin){

        if (thisPassword.equals(admin.getPassword())){
            try{
                administratorService.changePassword(admin.getId(),password);
                return "1";//修改成功！
            }catch (Exception e){
                e.printStackTrace();
                return "0";//出现错误！
            }
        }else{
            return "2";//原密码不一致！
        }
    }





}
