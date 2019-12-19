package cn.hyj.service.impl;

import cn.hyj.entity.ShoppingCollection;
import cn.hyj.mapper.ShoppingCollectionMapper;
import cn.hyj.mapper.ShoppingTrolleyMapper;
import cn.hyj.service.GoodsCollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商品业务逻辑实现层
 *
 * @author Administrator
 *
 */
@Service
public class GoodsCollectionServiceImpl implements GoodsCollectionService {

    @Autowired
    private ShoppingCollectionMapper shoppingCollectionMapper;

    @Override
    public int deleteByPrimaryKey(Integer shoppingCollectionId) {
        return shoppingCollectionMapper.deleteByPrimaryKey(shoppingCollectionId);
    }

    @Override
    public int insertSelective(ShoppingCollection record) {

        return shoppingCollectionMapper.insertSelective(record);
    }

    @Override
    public List<ShoppingCollection> QueryByIdCommodity(Integer userId) {
        return shoppingCollectionMapper.QueryByIdCommodity(userId);
    }
}
