package cn.hyj.test;

import cn.hyj.utils.MailUtils;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MailTest {

    @Test
    public void testSendMail() throws Exception{
        ApplicationContext applicationContext=new ClassPathXmlApplicationContext("beans.xml");
        MailUtils mailUtils=(MailUtils) applicationContext.getBean("mailUtils");
    }
}
