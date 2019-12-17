package cn.hyj.controller;

import cn.hyj.entity.Commodity;
import cn.hyj.service.CommodityService;
import cn.hyj.utils.SplitString;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

/**
 * 商品controller
 */
@RequestMapping("/commodity/")
@Controller
public class CommodityController {

    @Autowired
    private CommodityService commodityService;

    @RequestMapping("/toPage")
    public String commodityList(Map<String, Object> map
            , @RequestParam(defaultValue = "1", value = "currentPage") Integer pageCode
            , String commodityAttribute, String commodityPrice) {
        PageHelper.startPage(pageCode, 16);//设置分页 每页16条数据
        List<Commodity> commodities = commodityService.queryAll(commodityPrice,commodityAttribute);//全部数据
        commodities.forEach(commodity -> {
            List<String> strings = SplitString.splitStringToList(commodity.getCommodityImg());//根据,号分割字符串
            commodity.setCommodityImg(strings.get(0));//取出第一张图片
        });
        PageInfo<Commodity> commodityPageInfo = new PageInfo<Commodity>(commodities);
        commodities = commodityPageInfo.getList();//重新给集合赋值
        Integer totalPage = commodityPageInfo.getPages();//总页数
        Integer totals=totalPage;
        if (pageCode == 1) {//如果为第一页
            totalPage = 4;//在页面生成4个页码
        } else {
            if (pageCode + 3 > totalPage) {//如果一组页码大于总页数则不继续扩充
                pageCode = totalPage - 3;
            }
        }
        map.put("pageCode", pageCode);//当前页
        map.put("total", totalPage);//假总页数
        map.put("totals",totals);//真总页数
        map.put("CommodityList", commodities);//商品集合
        System.out.println(pageCode);
        System.out.println(totals);
        return "product_list";
    }

    /**
     * 查看商品详情信息
     * @param model
     * @param commodityId
     * @return
     */
    @RequestMapping("/particularsView")
    public String particularsView(Model model,Integer commodityId){
        Commodity commodity = commodityService.queryByPrimaryKey(commodityId);//商品
        List<String> commodityImg = SplitString.splitStringToList(commodity.getCommodityImg());
        model.addAttribute("commodity",commodity);
        model.addAttribute("commodityImg",commodityImg);
        return "Product_Detailed";
    }
}
