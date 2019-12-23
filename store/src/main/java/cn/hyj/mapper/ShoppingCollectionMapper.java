package cn.hyj.mapper;

import cn.hyj.entity.ShoppingCollection;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShoppingCollectionMapper {

    //删除
    int deleteByPrimaryKey(Integer shoppingCollectionId);
    //收藏商品
    int insertSelective(ShoppingCollection record);
    //查询商品
    List<ShoppingCollection> QueryByIdCommodity(Integer userId);

    Boolean commodityEixs(@Param("userId") Integer userId,@Param("commodityId") Integer commodityId);

    int insert(ShoppingCollection record);

    ShoppingCollection selectByPrimaryKey(Integer shoppingCollectionId);

    int updateByPrimaryKeySelective(ShoppingCollection record);

    int updateByPrimaryKey(ShoppingCollection record);
}