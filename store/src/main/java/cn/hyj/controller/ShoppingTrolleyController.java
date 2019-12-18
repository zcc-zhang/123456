package cn.hyj.controller;

import cn.hyj.entity.Commodity;
import cn.hyj.service.CommodityService;
import cn.hyj.service.ShoppingTrolleyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/shoppingTrolley")
@Controller
public class ShoppingTrolleyController {

    @Autowired
    private CommodityService commodityService;

    @Autowired
    private ShoppingTrolleyService shoppingTrolleyService;


<<<<<<< HEAD
    public String addCommodity(Integer commodityID){
        Commodity commodity = commodityService.queryByPrimaryKey(commodityID);

=======
    @RequestMapping("/addCommodity")
    public String addCommodity(Integer commodityID){
        Commodity commodity = commodityService.queryByPrimaryKey(commodityID);//查询出该商品
>>>>>>> 2b0e3ebc4085f436b0e598c49edfc777d080c27b
        return "";
    }
}
