package cn.hyj.controller;

import cn.hyj.entity.OrderInformation;
import cn.hyj.service.OrderInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 订单controller
 */
@Controller
@RequestMapping("/orderInformation")
public class OrderInformationController {

    @Autowired
    private OrderInformationService orderInformationService;

    /**
     * 订单列表
     * @param model
     * @return
     */
    @RequestMapping("/orderList")
    public String orderList(Model model){

        return "User_Orderform";
    }

    /**
     * 新增订单
     * @param orderInformation
     * @return
     */
    public String addOrder(OrderInformation orderInformation){

        return "User_Orderform";
    }

    /**
     * 删除订单
     * @param id
     */
    public void deleteOrder(Integer id)
    {

    }


}
