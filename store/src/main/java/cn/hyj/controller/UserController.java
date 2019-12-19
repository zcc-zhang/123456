package cn.hyj.controller;

import cn.hyj.entity.ShoppingTrolley;
import cn.hyj.entity.User;
import cn.hyj.exception.MailException;
import cn.hyj.service.ShoppingTrolleyService;
import cn.hyj.service.UserService;
import cn.hyj.utils.MailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@RequestMapping("/user/")
@Controller
@SessionAttributes(value = {"user","code","shoppingTrolleys"})
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

        User user = userService.userLoginVerify(username,password);
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
            userService.userRegister(user);//保存数据库
        }
        return "login";
    }


}
