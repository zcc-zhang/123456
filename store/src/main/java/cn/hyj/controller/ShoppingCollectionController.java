package cn.hyj.controller;

import cn.hyj.entity.ShoppingCollection;
import cn.hyj.entity.User;
import cn.hyj.service.GoodsCollectionService;
import cn.hyj.utils.SplitString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@SessionAttributes(value = "user")
@RequestMapping("/shoppingCollection")
public class ShoppingCollectionController {

    @Autowired
    private GoodsCollectionService goodsCollectionService;

    /**
     * add收藏商品
     * @param commodityID
     * @return 0：异常  1：添加成功 2.收藏商品已存在
     */
    @RequestMapping(value = "/addCollectionCommodity")
    @ResponseBody
    public String addCollectionCommodity(Integer commodityID, @SessionAttribute("user") User user){
        try {
            ShoppingCollection sc = new ShoppingCollection();
            sc.setCommodityId(commodityID);//商品id
            sc.setUserId(user.getUserId());//用户id
            //保存数据前判断【收藏商品】是否存在
            if(!commodityEixs(user.getUserId(),commodityID)){
                goodsCollectionService.insertSelective(sc);//保存数据
                return "1";
            }else{
                return "2";
            }
        }catch (Exception e){
            e.printStackTrace();
            return "0";
        }
    }

    /**
     * 判断收藏的商品是否存在
     * @param userId 用户id
     * @param commodityId 商品id
     * @return false：收藏商品已存在，true：不存在
     */
    public Boolean commodityEixs(Integer userId,Integer commodityId){
        return goodsCollectionService.commodityEixs(userId, commodityId);
    }

    /**
     * 收藏商品的列表
     * @param modelMap
     * @return
     */
    @RequestMapping("/commodityList")
    public String commodityList(ModelMap modelMap){
        User user = (User) modelMap.getAttribute("user");//取出session中数据
        List<ShoppingCollection> collectionList = goodsCollectionService.QueryByIdCommodity(user.getUserId());//根据用户id查询出所有数据
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
     * @param id 收藏商品id
     * @return
     */
    @RequestMapping("/deleteByID")
    public String deleteByID(Integer id){
        try{
            goodsCollectionService.deleteByPrimaryKey(id);//根据id删除
            return "1";
        }catch (Exception e){
            e.printStackTrace();
            return "0";
        }
    }
}
