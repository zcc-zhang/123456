package cn.hyj.controller;

import cn.hyj.entity.ShoppingTrolley;
import cn.hyj.entity.User;
import cn.hyj.exception.MailException;
import cn.hyj.service.ShoppingTrolleyService;
import cn.hyj.service.UserService;
import cn.hyj.utils.MailUtils;
import cn.hyj.utils.SplitString;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.MultipartFilter;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@RequestMapping("/user/")
@Controller
@SessionAttributes(value = {"user","code","shoppingTrolleys","sendCode"})
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private ShoppingTrolleyService shoppingTrolleyService;

    /**
     * 登录
     * @param username 用户名
     * @param password 密码
     * @return
     */
    @RequestMapping("login")
    public String login(@RequestParam("username") String username, @RequestParam("password") String password,Model model,
                        HttpServletRequest request){

        User user = userService.userLoginVerify(username,SplitString.encode(password));
        Integer message=0;
        if (username.equals("") && password.equals("")){
            message=2;//message为2，username和password为空
        }else if(user==null){
            message=1;//为1，用户名或密码有错
        }else{
            model.addAttribute("user",user);
            List<ShoppingTrolley> shoppingTrolleys = shoppingTrolleyService.selectByUserId(user.getUserId());//购物车商品集合
            model.addAttribute("shoppingTrolleys",shoppingTrolleys);
            //登录成功
            return "redirect:/index";
        }
        model.addAttribute("message",message);
        return "login";//转发
    }

    @Autowired
    private MailUtils mailUtils;

    /**
     * 获取验证码
     *
     * @param user 用户
     * @return
     */
    @RequestMapping("/registerCode")
    public String register(User user, Model model) throws MailException, ParseException {
        Integer activationCode = (int) ((Math.random() * 9 + 1) * 1000);//激活码

        Date date = new Date();//获取当前时间
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = simpleDateFormat.format(date);
        user.setRegister(simpleDateFormat.parse(format));
        user.setStatus(1);
        try {
            mailUtils.sendActiveMail(user.getEmail(), activationCode.toString(), "registered");//发送邮件
        } catch (Exception e) {
            e.printStackTrace();
            throw new MailException("发送邮箱失败!");
        }
        model.addAttribute("user", user);//将用户对象放入session作用域中
        model.addAttribute("code", activationCode);//把验证码放入session作用域中
        return "forward:/notarizeEmail.jsp";
    }


    /***
     * 重置密码
     * @param password
     * @param email
     * @param code
     * @param modelMap
     * @return
     */
    @RequestMapping("/resetPassword")
    @ResponseBody
    public String resetPassword(String password,String email,String code,String type,ModelMap modelMap,Model model) throws Exception{
        if("email".equals(type)){
            Boolean flag =userService.queryUserByEmail(email);
            if(flag){
                return email;
            }else {
                return "1";
            }
        }else if("sendCode".equals(type)){
            Integer activationCode = (int) ((Math.random() * 9 + 1) * 1000);//激活码
            try {
                mailUtils.sendActiveMail(email,activationCode.toString(),"resetPassword");
                model.addAttribute("sendCode",activationCode);
                return "1";
            } catch (Exception e) {
                e.printStackTrace();
                throw new MailException("发送邮箱失败!");
            }
        }else if("checkCode".equals(type)){
            Integer checkCode=(Integer) model.getAttribute("sendCode");//发送过去的验证码
            if (!checkCode.equals(Integer.parseInt(code))){
                return "1";
            }
        }else if("password".equals(type)){
            try {
                userService.resettingUserPasswordByEmail(email,SplitString.encode(password));
                return "1";
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException(e);
            }
        }
        return "";
    }

    /**
     * 注册
     *
     * @param code
     * @return
     */
    @RequestMapping("/register")
    public String register(@RequestParam("code") String code, ModelMap modelMap) {
        Integer _code = (Integer) modelMap.getAttribute("code");//取出session中的验证码
        User user = (User) modelMap.getAttribute("user");//取出session中的user对象
        if (_code.toString().equals(code)) {
            user.setPassword(SplitString.encode(user.getPassword()));//密码加密【使用MD5】
            userService.userRegister(user);//保存数据库
        }
        return "login";
    }

    /**
     * 修改用户信息
     * @param
     * @return
     */
    @RequestMapping("/upload")
    @ResponseBody
    public void upload(MultipartFile fileField,HttpServletRequest request) throws IOException {
        String path=request.getServletContext().getRealPath("/userHeadPortrait");//
        File file=new File(path);
        if(!file.exists()){
            file.mkdirs();
        }
        String fileName=fileField.getName();//获得名字
        // 获得原始名称
        String originalFilename = fileField.getOriginalFilename();
        fileField.transferTo(new File(file,originalFilename));//保存
    }

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @RequestMapping("/changeInfo")
    @ResponseBody
    public User changeInfo(User user,@RequestParam( value = "headImgPath",required = false) String fileField){
        if(fileField!=null){
            user.setHeadPortrait(SplitString.subPath(fileField,"jdbc"));
        }
        userService.userUpdateInformation(user);
        return user;
    }

    /**
     * 修改密码
     * @param thispassword 原密码
     * @param password 要修改的密码
     * @param modelMap
     * @return
     */
    @RequestMapping("/changePassword")
    @ResponseBody
    public String changePassword(String thispassword,String password,ModelMap modelMap){

        User user = (User) modelMap.getAttribute("user");//取出session中的user对象
        //判断密码是否相同
        if(thispassword.equals(user.getPassword())){
            try {
                user.setPassword(SplitString.encode(password));//密码【使用MD5加密】
                userService.updateByPrimaryKeySelective(user);
                //登录成功
                return "1";
            }catch (Exception e){
                e.printStackTrace();
                //异常
                return "-1";
            }
        }else{
            return "0";
        }
    }




}
