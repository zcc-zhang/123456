package cn.hyj.service;

import cn.hyj.entity.CommodityType;

import java.util.List;

/**
 * 商品业务逻辑层
 *
 * @author Administrator
 *
 */
public interface CommodityTypeService {

    //查询所有商品类型
    List<CommodityType> queryCommodityType();

    //添加
    void insertSelective(CommodityType record);

    //删除
    void deleteByPrimaryKey(Integer commodityTypeId);

}
