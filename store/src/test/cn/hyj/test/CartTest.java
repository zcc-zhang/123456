package cn.hyj.test;

import cn.hyj.entity.ShoppingTrolley;
import cn.hyj.service.ShoppingTrolleyService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CartTest {

    @Test
    public void testSelectByUserId(){
        ApplicationContext applicationContext=new ClassPathXmlApplicationContext("beans.xml");
        ShoppingTrolleyService shoppingTrolleyService=(ShoppingTrolleyService) applicationContext.getBean("shoppingTrolleyService");
        ShoppingTrolley shoppingTrolley = shoppingTrolleyService.selectByUserId(1);
        System.out.println(shoppingTrolley);

    }
}
