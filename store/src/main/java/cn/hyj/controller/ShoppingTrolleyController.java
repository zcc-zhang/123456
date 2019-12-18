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


    public String addCommodity(Integer commodityID){
        Commodity commodity = commodityService.queryByPrimaryKey(commodityID);

        return "";
    }
}
