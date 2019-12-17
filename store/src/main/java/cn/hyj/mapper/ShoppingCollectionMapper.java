package cn.hyj.mapper;

import cn.hyj.entity.ShoppingCollection;

public interface ShoppingCollectionMapper {
    int deleteByPrimaryKey(Integer shoppingCollectionId);

    int insert(ShoppingCollection record);

    int insertSelective(ShoppingCollection record);

    ShoppingCollection selectByPrimaryKey(Integer shoppingCollectionId);

    int updateByPrimaryKeySelective(ShoppingCollection record);

    int updateByPrimaryKey(ShoppingCollection record);
}