package cn.hyj.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Component;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 邮箱工具类
 */
@Component("mailUtils")
public class MailUtils {

    @Autowired
    private JavaMailSenderImpl mailSender;

    /***
     * 发送邮件
     * @param receiveMailAccount 收件人
     * @param mailActiveCode 验证码
     */
    public void sendActiveMail(String receiveMailAccount, String mailActiveCode,String type) throws Exception{

        MimeMessage  simpleMailMessage=designMail(receiveMailAccount,mailActiveCode,type);
        try {
            mailSender.send(simpleMailMessage);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     *
     * @param receiveMail   收件人邮箱
     * @param mailActiveCode 激活码
     * @param title  标题
     * @param content 内容
     * @param activeUrl 确认地址
     * @return
     * @throws Exception
     */
    private MimeMessage createMimeMessage(String receiveMail,
                                          String mailActiveCode,
                                          String title,
                                          StringBuilder content,
                                          String activeUrl) throws Exception {
        // 创建邮件
        MimeMessage message = this.mailSender.createMimeMessage();
        // 发件人
        message.setFrom(this.mailSender.getUsername());
        // 3. To: 收件人（可以增加多个收件人、抄送、密送）
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "会员用户", "utf-8"));
        // 邮件主题
        message.setSubject(title, "utf-8");
        // String
        // activeUrl="http://localhost:8080/store/notarizeEmail.jsp?mailcode="+mailActiveCode;
        activeUrl = activeUrl + mailActiveCode;
        // 5. Content: 邮件正文（可以使用html标签）
        message.setContent(content.toString(), "text/html;charset=UTF-8");
        // 6. 设置发件时间
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 转换日期
        sdf.format(date);
        message.setSentDate(date);

        message.saveChanges();//保存设置
        return message;

    }

    /**
     * 根据类型设计邮件
     *
     * @param receiveMailAccount
     * @param mailActiveCode
     * @param type
     * @throws Exception
     */
    private MimeMessage  designMail(String receiveMailAccount, String mailActiveCode, String type) throws Exception {
        String title = null;// 标题

        String activeUrl = null;// 确定信息页面的URL

        StringBuilder content = null;// 内容

        if ("registered".equals(type))// 如果是注册
        {
            title = "宏颜锦商城账户激活邮件";
            activeUrl = "http://localhost:8080/store/notarizeEmail.jsp?mailcode=" + mailActiveCode;
            content = new StringBuilder("您好，感谢您在宏颜锦注册帐户！")// 拼接邮件内容
                    .append("<br/>")
                    .append("请确认您的电子邮箱地址")
                    .append("<br/>")
                    .append("点击下方链接进行验证:")
                    .append("<br/>")
                    .append("<a href = ")
                    .append(activeUrl)
                    .append(">" + activeUrl)
                    .append("</a>");
        } else if ("resetPassword".equals(type)) {
            title = "宏颜锦商城账户密码重置邮件";
            content = new StringBuilder("修改密码的验证码为:")
                    .append(mailActiveCode)// 拼接邮件内容
                    .append("<br/>")
                    .append("打死都不要告诉别人哦")
                    .append("<br/>")
                    .append("<font color=red size=20px>如果您没有修改密码的操作,请忽略此条短信</font>");
        }
        MimeMessage  mimeMessage = createMimeMessage(receiveMailAccount, mailActiveCode, title, content, activeUrl);
        return mimeMessage ;
    }
}
