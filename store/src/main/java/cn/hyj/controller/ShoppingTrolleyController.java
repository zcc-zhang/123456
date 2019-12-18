package cn.hyj.controller;

import cn.hyj.entity.Commodity;
import cn.hyj.entity.ShoppingTrolley;
import cn.hyj.entity.User;
import cn.hyj.service.CommodityService;
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

import java.util.List;

@RequestMapping("/shoppingTrolley")
@Controller
@SessionAttributes(value = {"shoppingTrolleys"})
public class ShoppingTrolleyController {

    @Autowired
    private CommodityService commodityService;

    @Autowired
    private ShoppingTrolleyService shoppingTrolleyService;

    @RequestMapping("/queryShoppingTrolley")
    public String queryShoppingTrolley(Integer commodityID, @SessionAttribute("user") User user, Model model){
        List<ShoppingTrolley> shoppingTrolleys = shoppingTrolleyService.selectByUserId(user.getUserId());
        shoppingTrolleys.forEach(shoppingTrolley ->
                shoppingTrolley.getCommodity().setCommodityImg(SplitString.splitString(shoppingTrolley.getCommodity().getCommodityImg())[0])
        );
        model.addAttribute("shoppingTrolleys",shoppingTrolleys);
        return "Cart";
    }

    /**
     * 添加商品到购物车
     */
    @RequestMapping("/addCommodity")
    @ResponseBody
    public String addCommodity(Integer commodityID,@SessionAttribute("user") User user){

        ShoppingTrolley shoppingTrolley=new ShoppingTrolley();
        shoppingTrolley.setCommodityId(commodityID);
        shoppingTrolley.setUserId(user.getUserId());
        try {
            shoppingTrolleyService.insert(shoppingTrolley);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @RequestMapping("/changeCount")
    public void changeCount(Integer count,Integer commodityID,ModelMap modelMap){

        List<ShoppingTrolley> shoppingTrolleyms=(List<ShoppingTrolley>) modelMap.getAttribute("shoppingTrolleys");
        shoppingTrolleyms.forEach(shoppingTrolley -> {
            if(shoppingTrolley.getCommodityId().equals(commodityID)){
                shoppingTrolley.setCount(count);
            }
        });
        modelMap.addAttribute("shoppingTrolleys",shoppingTrolleyms);
    }
}
