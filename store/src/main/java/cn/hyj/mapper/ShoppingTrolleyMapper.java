package cn.hyj.mapper;

import cn.hyj.entity.ShoppingTrolley;
import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.INTERNAL;

import java.util.List;

public interface ShoppingTrolleyMapper {

    int deleteByCommodityId(@Param("commodityId") Integer shoppingTrolleyId);

    int insert(ShoppingTrolley record);

    int insertSelective(ShoppingTrolley record);

    ShoppingTrolley selectByPrimaryKey(Integer shoppingTrolleyId);

    int updateByPrimaryKeySelective(ShoppingTrolley record);

    int updateByPrimaryKey(ShoppingTrolley record);

    List<ShoppingTrolley> selectByUserId(@Param("userId") Integer userId);

    void deleteByUserId(Integer userID);
}