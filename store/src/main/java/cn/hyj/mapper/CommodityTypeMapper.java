package cn.hyj.mapper;

import cn.hyj.entity.CommodityType;

import java.util.List;

public interface CommodityTypeMapper {

    //查询所有商品类型
    List<CommodityType> queryCommodityType();

    int deleteByPrimaryKey(Integer commodityTypeId);

    int insert(CommodityType record);

    int insertSelective(CommodityType record);

    CommodityType selectByPrimaryKey(Integer commodityTypeId);

    int updateByPrimaryKeySelective(CommodityType record);

    int updateByPrimaryKey(CommodityType record);
}