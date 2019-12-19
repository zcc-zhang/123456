package cn.hyj.controller;

import cn.hyj.entity.ShoppingTrolley;
import cn.hyj.entity.User;
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
@SessionAttributes(value = {"shoppingTrolleys","commodityID","count","change"})
public class ShoppingTrolleyController {

    @Autowired
    private ShoppingTrolleyService shoppingTrolleyService;

    @RequestMapping("/queryShoppingTrolley")
    public String queryShoppingTrolley(Integer commodityID,Integer count,String change, @SessionAttribute("user") User user, Model model,ModelMap modelMap,Integer id){
        List<ShoppingTrolley> shoppingTrolleys = shoppingTrolleyService.selectByUserId(user.getUserId());//购物车商品集合
        shoppingTrolleys.forEach(shoppingTrolley ->
                shoppingTrolley.getCommodity().setCommodityImg(SplitString.splitString(shoppingTrolley.getCommodity().getCommodityImg())[0])
        );
        List<ShoppingTrolley> trolleys=null;//空集合
        if(change==null || commodityID==null || count ==null){
            change=(String)modelMap.getAttribute("change");
            commodityID=(Integer)modelMap.getAttribute("commodityID");
            count=(Integer)modelMap.getAttribute("count");

        }
        if(change!=null && !"".equals(change.trim()) && "change".equals(change)){//购物车集合改变时
            trolleys=(List<ShoppingTrolley>) modelMap.getAttribute("shoppingTrolleys");
            if(trolleys!=null && !trolleys.isEmpty()){
                shoppingTrolleys=trolleys;
            }
            for(int i=0;i<shoppingTrolleys.size();i++){
                if(shoppingTrolleys.get(i).getCommodityId().equals(commodityID)){
                    model.addAttribute("count",count);
                    model.addAttribute("commodityID",commodityID);
                    model.addAttribute("change",change);
                    shoppingTrolleys.get(i).setCount(count);
                    model.addAttribute("shoppingTrolleys",shoppingTrolleys);
                }
            }
            trolleys=(List<ShoppingTrolley>) modelMap.getAttribute("shoppingTrolleys");
        }else if("delete".equals(change)){//删除session中列表的元素
            for (int i = 0; i < shoppingTrolleys.size(); i++) {
                if (shoppingTrolleys.get(i).getCommodityId().equals(id))// 找到匹配元素
                {
                    shoppingTrolleys.remove(i);// 移除该商品
                }
            }
            trolleys=(List<ShoppingTrolley>) modelMap.getAttribute("shoppingTrolleys");
        }
        if(trolleys!=null && !trolleys.isEmpty()){//如果修改过的集合不为空
            model.addAttribute("shoppingTrolleys",trolleys);
        }else{
            model.addAttribute("shoppingTrolleys",shoppingTrolleys);

        }
        return "Cart";
    }

    /**
     * 添加商品到购物车
     */
    @RequestMapping("/addCommodity")
    @ResponseBody
    public String addCommodity(Integer commodityID,@SessionAttribute("user") User user){
        try {
                ShoppingTrolley shoppingTrolley=new ShoppingTrolley();
                shoppingTrolley.setCommodityId(commodityID);
                shoppingTrolley.setUserId(user.getUserId());

                shoppingTrolleyService.insert(shoppingTrolley);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    /**
     * 更改商品数量
     * @param commodityId
     * @param count
     * @param userId
     * @param shoppingTrolleyId
     */
    @RequestMapping("/renewalCart")
    public void RenewalCart(Integer commodityId,Integer count,Integer userId,Integer shoppingTrolleyId){
        try {
            ShoppingTrolley shoppingTrolley=new ShoppingTrolley();
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
     * @param
     */
    @RequestMapping("/removeCommodity")
    @ResponseBody
    public String removeCommodity(Integer commodityId){
        try {
            shoppingTrolleyService.deleteByPrimaryKey(commodityId);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }
}
