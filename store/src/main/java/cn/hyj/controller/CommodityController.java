package cn.hyj.controller;

import cn.hyj.entity.Commodity;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * 商品controller
 */
@SessionAttributes(value = {"user"})
@RequestMapping("/commodity")
@Controller
public class CommodityController {

    @Autowired
    private CommodityService commodityService;

    @Autowired
    private CookieUtil cookieUtil;

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

}
