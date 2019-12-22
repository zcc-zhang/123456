package cn.hyj.controller;

import cn.hyj.entity.ShoppingCollection;
import cn.hyj.entity.User;
import cn.hyj.service.GoodsCollectionService;
import cn.hyj.utils.SplitString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
        List<ShoppingCollection> collectionList = goodsCollectionService.QueryByIdCommodity(user.getUserId());
        //图片路径分割
        collectionList.forEach(shoppingCollection ->{
            List<String> img = SplitString.splitStringToList(shoppingCollection.getCommodity().getCommodityImg());
            shoppingCollection.getCommodity().setCommodityImg(img.get(0));
        });
        modelMap.addAttribute("collectionList",collectionList);

        return "User_Collect";
    }

    /**
     * 删除收藏商品
     * @param id
     * @return
     */
    @RequestMapping("/deleteByID")
    public String deleteByID(Integer id){

        try{
            goodsCollectionService.deleteByPrimaryKey(id);
            return "User_Collect";
        }catch (Exception e){
            e.printStackTrace();
            return "0";
        }
    }
}
