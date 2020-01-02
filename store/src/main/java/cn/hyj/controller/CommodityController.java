package cn.hyj.controller;

import cn.hyj.entity.Administrator;
import cn.hyj.entity.Commodity;
import cn.hyj.entity.CommodityType;
import cn.hyj.entity.User;
import cn.hyj.service.CommodityService;
import cn.hyj.utils.CookieUtil;
import cn.hyj.utils.SplitString;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * 商品controller
 */
@SessionAttributes(value = {"user","shoppingTrolleys"})
@RequestMapping("/commodity")
@Controller
public class CommodityController {

    @Autowired
    private CommodityService commodityService;

    @Autowired
    private CookieUtil cookieUtil;

    /**
     * 商品列表
     * @param map
     * @param pageCode
     * @param commodityAttribute
     * @param min
     * @param max
     * @param request
     * @return
     */
    @RequestMapping("/toPage")
    public String commodityList(Map<String, Object> map
            , @RequestParam(defaultValue = "1", value = "currentPage") Integer pageCode
            , String commodityAttribute
            ,Integer min
            ,Integer max
            ,HttpServletRequest request) {

        PageHelper.startPage(pageCode, 16);//设置分页 每页16条数据
        List<Commodity> commodities = commodityService.queryAll(commodityAttribute,max,min);//全部数据
        commodities.forEach(commodity -> {
            List<String> strings = SplitString.splitStringToList(commodity.getCommodityImg());//根据,号分割字符串
            commodity.setCommodityImg(strings.get(0));//取出第一张图片
        });
        PageInfo<Commodity> commodityPageInfo = new PageInfo<Commodity>(commodities);
        commodities = commodityPageInfo.getList();//重新给集合赋值
        Integer totalPage = commodityPageInfo.getPages();//总页数


        List<Commodity> historyList= cookieUtil.historyCommodityList(request.getCookies());//浏览记录
        if(historyList!=null && !historyList.isEmpty()){
            historyList.forEach(commodity -> commodity.setCommodityImg(SplitString.splitString(commodity.getCommodityImg())[0]));
        }
        request.setAttribute("historyList", historyList);
        map.put("pageCode", pageCode);//当前页
        map.put("total", totalPage);//总页数
        map.put("CommodityList", commodities);//商品集合
        map.put("list",this.salesRanking());
        return "product_list";
    }

    StringBuffer buffer=new StringBuffer();
    /**
     * 查看商品详情信息
     * @param model
     * @param commodityId
     * @return
     */
    @RequestMapping("/particularsView")
    public String particularsView(Model model, Integer commodityId, HttpServletRequest request, HttpServletResponse response){

        if(buffer.length()>0){//如果buffer大于0
            buffer.append("#").append(commodityId.toString());
        }else{
            buffer.append(commodityId.toString());
        }
        response.addCookie(new Cookie("commodityId",buffer.toString()));
        Commodity commodity = commodityService.queryByPrimaryKey(commodityId);//商品
        List<String> commodityImg = SplitString.splitStringToList(commodity.getCommodityImg());
        model.addAttribute("commodity",commodity);
        model.addAttribute("commodityImg",commodityImg);

        return "Product_Detailed";
    }


    @RequestMapping("/browsingHistory")
    public String browsingHistory(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception{

        User user=(User)modelMap.getAttribute("user") ;
        if(user==null)
        {
            request.setAttribute("message", "2");
            return "login";
        }
        List<Commodity> commodities=cookieUtil.historyCommodityList(request.getCookies());
        commodities.forEach(commodity -> commodity.setCommodityImg(SplitString.splitString(commodity.getCommodityImg())[0]));
        Set<Commodity> set=new HashSet<Commodity>(commodities);//去重
        List<Commodity> list=new ArrayList<Commodity>(set);
        request.setAttribute("history", list);
        return "Footprint";
    }

    /**
     * 浏览历史
     * @return
     */
    public List<Commodity> salesRanking(){
         List<Commodity> list=commodityService.queryByCommodityEvaluation();
         list.forEach(commodity -> commodity.setCommodityImg(SplitString.splitString(commodity.getCommodityImg())[0]));
         return  list;
    }

    /**
     * 添加商品
     * @param commodity
     * @return
     */
    @RequestMapping("insert")
    public Commodity insertCommodity(Commodity commodity){

        commodityService.insertSelective(commodity);

        return commodity;
    }

    /**
     * 根据【类型,名称模糊】查询商品
     * @return
     */
    @RequestMapping("/queryByTypeId")
    @ResponseBody
    public List<Commodity> queryByIdCommodityType(Integer commodityTypeId,String productName
                                            ,@RequestParam(defaultValue = "1",value = "currentPage") Integer pageCode){

            PageHelper.startPage(pageCode,16);//分页，每页16条数据
            List<Commodity> commodityList = commodityService.queryByCommodityType(commodityTypeId,productName);//查询全部数据
            //分割字符串
            commodityList.forEach(commodity -> {
               commodity.setCommodityImg(SplitString.splitString(commodity.getCommodityImg())[0]);//取出第一张图片
            });
            PageInfo<Commodity> pageInfo = new PageInfo<Commodity>(commodityList);
            commodityList = pageInfo.getList();//重新赋值给集合-
            Integer totalPage = pageInfo.getPages();//总页数


            return commodityList;
    }

    /**
     * 删除商品【修改商品状态】
     * status 0:删除 1:正常 2:已下架
     * @param commodityID
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public String updateCommodityById(Integer commodityID){

        Commodity commodit = new Commodity();
        commodit.setCommodityId(commodityID);//商品id
        commodit.setCommodityStatus(0);//状态
        try{
            commodityService.updateByPrimaryKeySelective(commodit);
            return "1";//修改成功
        }catch (Exception e){
            e.printStackTrace();
            return "0";//异常
        }
    }


}
