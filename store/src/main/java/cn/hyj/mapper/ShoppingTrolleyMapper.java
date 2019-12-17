package cn.hyj.mapper;

import cn.hyj.entity.ShoppingTrolley;

public interface ShoppingTrolleyMapper {
    int deleteByPrimaryKey(Integer shoppingTrolleyId);

    int insert(ShoppingTrolley record);

    int insertSelective(ShoppingTrolley record);

    ShoppingTrolley selectByPrimaryKey(Integer shoppingTrolleyId);

    int updateByPrimaryKeySelective(ShoppingTrolley record);

    int updateByPrimaryKey(ShoppingTrolley record);

    ShoppingTrolley selectByUserId(Integer userId);
}