package cn.hyj.controller;

import cn.hyj.entity.CommodityType;
import cn.hyj.service.CommodityTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商品类型Controller
 */
@Controller
@RequestMapping("/commodityType")
public class CommodityTypeController {

    @Autowired
    private CommodityTypeService commodityTypeService;

    /**
     * 查询所有商品类型
     *
     * @return
     */
    @RequestMapping("/queryCommodityType")
    @ResponseBody
    public List<CommodityType> queryCommodityType() {

        List<CommodityType> list = commodityTypeService.queryCommodityType();

        return list;
    }

    /**
     * 新增一个商品类型
     *
     * @param
     * @return
     */
    @RequestMapping("/saveCommodityType")
    @ResponseBody
    public Map<String, Object> saveCommodityType(String commodityTypeName, Integer type) {
        CommodityType commodityType = new CommodityType();
        commodityType.setCommodityType(commodityTypeName);
        commodityType.setType(type);
        Map<String, Object> map = new HashMap<String, Object>();
        System.out.println(commodityType);
        try {
            commodityTypeService.saveCommodityType(commodityType);//保存一个商品类型
            CommodityType _commodityType = commodityTypeService.queryByPrimaryKey(commodityType.getCommodityTypeId());//查询插入的数据
            map.put("code", "200");//进行顺利 返回 200
            map.put("commodityType", _commodityType);//返回给前端
        } catch (Exception e) {
            map.put("code", "500");//出异常返回 500
            e.printStackTrace();
        }
        return map;
    }

    /**
     * 根据类型id修改类型明
     *
     * @param commodityType
     * @param
     */
    @RequestMapping("/changeCommodityType")
    @ResponseBody
    public Map<String, Object> changeCommodityTypeById(CommodityType commodityType) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            commodityTypeService.changeByID(commodityType);
            map.put("code",200);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("code",500);
        }
        return map;
    }


}
