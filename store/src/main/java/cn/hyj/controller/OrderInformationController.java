package cn.hyj.controller;

import cn.hyj.entity.*;
import cn.hyj.service.OrderInformationService;
import cn.hyj.service.ShippingAddressService;
import cn.hyj.service.ShoppingTrolleyService;
import cn.hyj.utils.SplitString;
import com.sun.org.apache.xpath.internal.objects.XObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.IconUIResource;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static javax.swing.text.html.CSS.getAttribute;

/**
 * 订单controller
 */
@Controller
@RequestMapping("/orderInformation")
@SessionAttributes({"user","shoppingTrolleys","trolleyList"})
public class OrderInformationController {

    @Autowired
    private OrderInformationService orderInformationService;

    @Autowired
    private ShoppingTrolleyService shoppingTrolleyService;

    @Autowired
    private ShippingAddressService shippingAddressService;

    /**
     * 订单列表
     * @param model
     * @return
     */
    @RequestMapping("/orderList")
    public String orderList(Model model, @SessionAttribute("user") User user,@RequestParam(defaultValue = "1") Integer status){

        List<OrderInformation>  orderInformationList = orderInformationService.queryByIdStatus(user.getUserId());//此用户的所有订单信息
        int daiPrice = 0;   //1.待付款
        int daiShouH=0; //2.待收货
        int daiFaH=0;   //3.派件中
        int accomplish=0;  //5.已完成
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


    /**
     * 【立即购买】 商品
     * @param commodity 商品实体类
     * @param count 商品总数量
     * @param modelMap
     * @return 如若不立即支付，就返回订单确认页面
     */
    @RequestMapping("/buyNowCommodity")
    public String buyNowCommodity(Commodity commodity, Integer count, ModelMap modelMap, HttpSession session,Model model){

        commodity.setCommodityImg(SplitString.splitString(commodity.getCommodityImg())[0]);//图片路径分割
        User user = (User) modelMap.getAttribute("user");
        List<ShippingAddress> shippingAddresses = shippingAddressService.queryByUserID(user.getUserId());//获取收货地址
        List<ShoppingTrolley> shoppingTrolleyList = new ArrayList<>();//new一个购物车的集合
        ShoppingTrolley shoppingTrolley=new ShoppingTrolley();//new购物车实体类

        shoppingTrolley.setCommodity(commodity);//商品实体类
        shoppingTrolley.setUserId(user.getUserId());//用户id
        shoppingTrolley.setCount(count);//商品总数量
        shoppingTrolley.setCommodityId(commodity.getCommodityId());//商品id
        shoppingTrolley.setSum();//总价

        shoppingTrolleyList.add(shoppingTrolley); //添加到购物车集合中
//        modelMap.addAttribute("trolleyList",shoppingTrolleyList);//保存商品信息
        modelMap.addAttribute("addressList",shippingAddresses);//保存收货地址
        model.addAttribute("trolleyList",shoppingTrolleyList);
        session.setAttribute("ispayCart",false);
        return "Order_payment";
    }

    /**
     * 生成订单
     * @return
     */
    @RequestMapping("/createOrderForm")
    public String createOrderForm(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception {

        User user=(User)modelMap.getAttribute("user");
        if(user==null)
        {
            request.setAttribute("message", "2");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        String outTradeNo = request.getParameter("out_trade_no");//// 商户订单号
        String tradeNo = request.getParameter("trade_no");//// 支付宝交易号
        String totalAmount = request.getParameter("total_amount");//// 付款金额
        String affDate="1999-12-29 23:59:59";//未收货地址
        Boolean flag = (Boolean) request.getSession().getAttribute("ispayCart");
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");// 转换日期
        String dateStr = dateFormat.format(date);// 当前时间的字符串
        List<ShoppingTrolley>shoppingTrolleys=null;
        if (flag){
            shoppingTrolleys=(List<ShoppingTrolley>) modelMap.getAttribute("shoppingTrolleys");//购物车结算
        }else{
            shoppingTrolleys=(List<ShoppingTrolley>) modelMap.getAttribute("trolleyList");//单个商品结算
        }
        shoppingTrolleys.forEach(shoppingTrolley -> {
            try {
                OrderInformation orderInformation=new OrderInformation();
                orderInformation.setId(shoppingTrolley.getUserId());
                orderInformation.setCommodityImg(shoppingTrolley.getCommodity().getCommodityImg());
                orderInformation.setAffirmDate(dateFormat.parse(affDate));
                orderInformation.setCommodityAttribute(shoppingTrolley.getCommodity().getCommodityAttribute());
                orderInformation.setCommodityFreight(shoppingTrolley.getCommodity().getCommodityFreight());
                orderInformation.setCommodityCount(shoppingTrolley.getCount());
                orderInformation.setPaymentTime(new Date());
                orderInformation.setPrice( new BigDecimal(totalAmount));
                orderInformation.setStatus(3);
                orderInformation.setSubtotal(new BigDecimal("0"));
                orderInformation.setCommodityPrice(shoppingTrolley.getCommodity().getCommodityPrice());
                orderInformation.setLogisticsId(outTradeNo);
                orderInformation.setProductName(shoppingTrolley.getCommodity().getProductName());
                orderInformation.setPlaceAnOrderDate(new Date());
                orderInformationService.insertSelective(orderInformation);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            shoppingTrolleyService.EmptyShoppingCart(user.getUserId());

        });
        return "redirect:/orderInformation/orderList";
    }


}
