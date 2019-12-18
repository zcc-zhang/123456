package cn.hyj.service;

import cn.hyj.entity.ShoppingCollection;

import java.util.List;


/**
 * 商品收藏业务逻辑层
 *
 * @author Administrator
 *
 */
public interface GoodsCollectionService {

    //删除
    int deleteByPrimaryKey(Integer shoppingCollectionId);
    //收藏商品
    int insertSelective(ShoppingCollection record);
    //查询商品
    List<ShoppingCollection> QueryByIdCommodity(Integer userId);
}
