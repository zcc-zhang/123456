package cn.hyj.controller;

import cn.hyj.entity.OrderInformation;
import cn.hyj.entity.User;
import cn.hyj.service.OrderInformationService;
import cn.hyj.utils.SplitString;
import com.sun.org.apache.xpath.internal.objects.XObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.swing.plaf.IconUIResource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
    public String orderList(Model model, @SessionAttribute("user") User user,@RequestParam(defaultValue = "1") Integer status){

        List<OrderInformation>  orderInformationList = orderInformationService.queryByIdStatus(user.getUserId());
        Integer daiPrice = 0;   //1.待付款
        Integer daiShouH=0; //2.待收货
        Integer daiFaH=0;   //3.派件中
        Integer accomplish=0;  //5.已完成

        if (orderInformationList != null){//判断集合是否为空
            //图片路径分割
            orderInformationList.forEach(orderInformation -> {
               List<String> img = SplitString.splitStringToList(orderInformation.getCommodityImg());
               orderInformation.setCommodityImg(img.get(0));
            });

            for (int i=0;i<orderInformationList.size();i++){

                //判断每个状态各有几个
                Integer count = orderInformationList.get(i).getStatus();
                if (count == 1) {
                    daiPrice++;
                }else if(count == 2){
                    daiFaH++;
                }else if(count == 3){
                    daiShouH++;
                }else if(count == 5){
                    accomplish++;
                }
            }
            for (int i=0; i<orderInformationList.size();i++){
                    if(orderInformationList.get(i).getStatus()!=status){
                        orderInformationList.remove(i);
                    }
                }
        }
            model.addAttribute("orderList",orderInformationList);
            model.addAttribute("daiPrice",daiPrice);//1.待付款
            model.addAttribute("daiShouH",daiShouH);//2.待收货
            model.addAttribute("daiFaH",daiFaH);    //3.派件中
            model.addAttribute("accomplish",accomplish);//5.已完成
        return "User_Orderform";
    }

    /**
     * 新增订单
     * @param orderInformation
     * @return
     */
    public String addOrder(OrderInformation orderInformation){

        orderInformationService.insertSelective(orderInformation);
        return "User_Orderform";
    }

    /**
     * 删除订单
     * @param orderFormId
     */
    @RequestMapping("/deleteOrder")
    public String deleteOrder(Integer orderFormId)
    {
        orderInformationService.deleteByPrimaryKey(orderFormId);

        return "User_Orderform";
    }


}
