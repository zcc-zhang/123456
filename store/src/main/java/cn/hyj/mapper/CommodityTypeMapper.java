package cn.hyj.mapper;

import cn.hyj.entity.CommodityType;

import java.util.List;

public interface CommodityTypeMapper {

    //查询所有商品类型[模糊名称查询]
    List<CommodityType> queryCommodityType(String commodityType);

    //查询商品类型名称
    List<CommodityType> queryCommodityTypeName();

    //删除
    void deleteByPrimaryKey(Integer commodityTypeId);

    //添加
    int insertSelective(CommodityType record);


    CommodityType selectByPrimaryKey(Integer commodityTypeId);

    int updateByPrimaryKeySelective(CommodityType record);

    int updateByPrimaryKey(CommodityType record);
}