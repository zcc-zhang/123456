package cn.hyj.controller;

import cn.hyj.entity.Commodity;
import cn.hyj.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 随机显示商品
 */
@Controller
public class Index {


    @Autowired
    private CommodityService commodityService;

    @RequestMapping("/index")
    public String index(Model model){
        model.addAttribute("limitBuy",commodityService.randomGenerationLimitBuy());//团购
        model.addAttribute("generation2F",commodityService.randomGeneration2F());//2F
        model.addAttribute("generation1F",commodityService.randomGeneration1F());//1F
        model.addAttribute("guessYouLike",commodityService.guessYouLike());//猜你喜欢
        model.addAttribute("productNames",commodityService.selectProductName());//商品名称
        return "/index";
    }
}
