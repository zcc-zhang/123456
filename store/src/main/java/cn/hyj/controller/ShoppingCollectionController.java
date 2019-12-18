package cn.hyj.controller;

import cn.hyj.service.GoodsCollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
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
     * @param model
     * @return
     */
    @RequestMapping("/commodityList")
    public String commodityList(Model model){

        return "";
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
