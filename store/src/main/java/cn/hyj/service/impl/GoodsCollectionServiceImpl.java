package cn.hyj.service.impl;

import cn.hyj.entity.ShoppingCollection;
import cn.hyj.service.GoodsCollectionService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * 商品业务逻辑实现层
 *
 * @author Administrator
 *
 */
public class GoodsCollectionServiceImpl implements GoodsCollectionService {

    @Autowired
    private GoodsCollectionService goodsCollectionService;

    @Override
    public int deleteByPrimaryKey(Integer shoppingCollectionId) {
        return goodsCollectionService.deleteByPrimaryKey(shoppingCollectionId);
    }

    @Override
    public int insertSelective(ShoppingCollection record) {
        return goodsCollectionService.insertSelective(record);
    }

    @Override
    public List<ShoppingCollection> QueryByIdCommodity(Integer userId) {
        return goodsCollectionService.QueryByIdCommodity(userId);
    }
}
