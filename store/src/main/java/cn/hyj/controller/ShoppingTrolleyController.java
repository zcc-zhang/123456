package cn.hyj.controller;

import cn.hyj.entity.ShippingAddress;
import cn.hyj.entity.ShoppingTrolley;
import cn.hyj.entity.User;
import cn.hyj.service.ShippingAddressService;
import cn.hyj.service.ShoppingTrolleyService;
import cn.hyj.utils.SplitString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 购物车controller
 */
@RequestMapping("/shoppingTrolley")
@Controller
@SessionAttributes(value = {"shoppingTrolleys","commodityID","count","change","user"})
public class ShoppingTrolleyController {

    @Autowired
    private ShoppingTrolleyService shoppingTrolleyService;

    @Autowired
    private ShippingAddressService shippingAddressService;

    /**
     * 显示购物车信息
     * @param commodityID
     * @param count
     * @param change
     * @param user
     * @param model
     * @param modelMap
     * @param id
     * @return
     */
    @RequestMapping("/queryShoppingTrolley")
    public String queryShoppingTrolley(Integer commodityID, Integer count, String change, @SessionAttribute("user") User user, Model model, ModelMap modelMap, Integer id) {
        List<ShoppingTrolley> shoppingTrolleys = shoppingTrolleyService.selectByUserId(user.getUserId());//购物车商品集合
        shoppingTrolleys.forEach(shoppingTrolley ->
                shoppingTrolley.getCommodity().setCommodityImg(SplitString.splitString(shoppingTrolley.getCommodity().getCommodityImg())[0])
        );
        List<ShoppingTrolley> trolleys = null;//空集合
        if (change == null || commodityID == null || count == null) {
            change = (String) modelMap.getAttribute("change");
            commodityID = (Integer) modelMap.getAttribute("commodityID");
            count = (Integer) modelMap.getAttribute("count");

        }
        if (change != null && !"".equals(change.trim()) && "change".equals(change)) {//购物车集合改变时
            trolleys = (List<ShoppingTrolley>) modelMap.getAttribute("shoppingTrolleys");
            if (trolleys != null && !trolleys.isEmpty()) {
                shoppingTrolleys = trolleys;
            }
            for (int i = 0; i < shoppingTrolleys.size(); i++) {
                if (shoppingTrolleys.get(i).getCommodityId().equals(commodityID)) {
                    model.addAttribute("count", count);
                    model.addAttribute("commodityID", commodityID);
                    model.addAttribute("change", change);
                    shoppingTrolleys.get(i).setCount(count);
                    model.addAttribute("shoppingTrolleys", shoppingTrolleys);
                }
            }
            trolleys = (List<ShoppingTrolley>) modelMap.getAttribute("shoppingTrolleys");
        } else if ("delete".equals(change)) {//删除session中列表的元素
            for (int i = 0; i < shoppingTrolleys.size(); i++) {
                if (shoppingTrolleys.get(i).getCommodityId().equals(id))// 找到匹配元素
                {
                    shoppingTrolleys.remove(i);// 移除该商品
                }
            }
            trolleys = (List<ShoppingTrolley>) modelMap.getAttribute("shoppingTrolleys");
        }
        if (trolleys != null && !trolleys.isEmpty()) {//如果修改过的集合不为空
            model.addAttribute("shoppingTrolleys", trolleys);
        } else {
            model.addAttribute("shoppingTrolleys", shoppingTrolleys);
        }
        return "Cart";
    }

    /**
     * 添加商品到购物车
     */
    @RequestMapping("/addCommodity")
    @ResponseBody
    public String addCommodity(Integer commodityId,Integer count,@SessionAttribute("user") User user) {
        try {
            ShoppingTrolley shoppingTrolley = new ShoppingTrolley();
            shoppingTrolley.setCommodityId(commodityId);//商品id
            shoppingTrolley.setUserId(user.getUserId());//用户id
            shoppingTrolley.setCount(count);//数量

            shoppingTrolleyService.insert(shoppingTrolley);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    /**
     * 更改商品数量
     *
     * @param commodityId
     * @param count
     * @param userId
     * @param shoppingTrolleyId
     */
    @RequestMapping("/renewalCart")
    public void RenewalCart(Integer commodityId, Integer count, Integer userId, Integer shoppingTrolleyId) {
        try {
            ShoppingTrolley shoppingTrolley = new ShoppingTrolley();
            shoppingTrolley.setCount(count);
            shoppingTrolley.setCommodityId(commodityId);
            shoppingTrolley.setUserId(userId);
            shoppingTrolley.setShoppingTrolleyId(shoppingTrolleyId);
            shoppingTrolleyService.updateByPrimaryKey(shoppingTrolley);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除商品
     *
     * @param
     */
    @RequestMapping("/removeCommodity")
    @ResponseBody
    public String removeCommodity(Integer commodityId) {
        try {
            shoppingTrolleyService.deleteByPrimaryKey(commodityId);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    /**
     * 清空购物车【结算】
     * @param modelMap
     * @return
     */
    @RequestMapping("/emptyCart")
    public String emptyCart(ModelMap modelMap){
        User user=(User)modelMap.getAttribute("user");
        List<ShippingAddress> shippingAddresses = shippingAddressService.queryByUserID(user.getUserId());
        List<ShoppingTrolley> shoppingTrolleys=(List<ShoppingTrolley>) modelMap.getAttribute("shoppingTrolleys");
        shoppingTrolleys.forEach(shoppingTrolley -> shoppingTrolley.setSum());
        modelMap.addAttribute("trolleyList",shoppingTrolleys);
        modelMap.addAttribute("addressList",shippingAddresses);
        return "Order_payment";
    }

    /**
     * 结算购物车
     * @param sum
     * @param orderFromleave
     * @param model
     * @return
     */
    @RequestMapping("/paymentOrderFrom")
    public String paymentOrderFrom(Integer sum,String orderFromleave,Model model){

        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd ");
        String describe=dateFormat.format(new Date())+"购物车结算";//商品描述
        model.addAttribute("describe",describe);
        model.addAttribute("sum",sum);
        model.addAttribute("leave",orderFromleave);
        return "forward:/payment.jsp";
    }
}
