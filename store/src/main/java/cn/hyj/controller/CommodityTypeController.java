package cn.hyj.controller;

import cn.hyj.entity.CommodityType;
import cn.hyj.mapper.CommodityTypeMapper;
import cn.hyj.service.CommodityService;
import cn.hyj.service.CommodityTypeService;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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
     * @return
     */
    @RequestMapping("/queryCommodityType")
    @ResponseBody
    public List<CommodityType> queryCommodityType(){

        List<CommodityType> list = commodityTypeService.queryCommodityType();

        return list;
    }





}
