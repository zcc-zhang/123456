package cn.hyj.controller;

import cn.hyj.entity.ShoppingCollection;
import cn.hyj.entity.User;
import cn.hyj.service.GoodsCollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

@Controller
@SessionAttributes(value = "user")
@RequestMapping("/shoppingCollection")
public class ShoppingCollectionController {

    @Autowired
    private GoodsCollectionService goodsCollectionService;
    /**
     * 收藏商品
     * @param commodityId
     * @return
     */
    @RequestMapping("/collectionCommodity")
    public String collectionCommodity(Integer commodityId){


        return "";
    }

    /**
     * 收藏商品的列表
     * @param modelMap
     * @return
     */
    @RequestMapping("/commodityList")
    public String commodityList(ModelMap modelMap){

        User user = (User) modelMap.getAttribute("user");//取出session中数据
        System.out.println(user);
        List<ShoppingCollection> collectionList = goodsCollectionService.QueryByIdCommodity(user.getUserId());
        modelMap.addAttribute("collectionList",collectionList);

        return "User_Collect";
    }

    /**
     * 删除收藏商品
     * @param id
     * @return
     */
    @RequestMapping("/delectByID")
    public String delectByID(Integer id){
        return "";
    }
}
