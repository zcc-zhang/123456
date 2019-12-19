package cn.hyj.service.impl;

import cn.hyj.entity.ShoppingTrolley;
import cn.hyj.mapper.ShoppingTrolleyMapper;
import cn.hyj.service.ShoppingTrolleyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * 购物车业务逻辑实现层
 *
 * @author Administrator
 *
 */
@Service
public class ShoppingTrolleyServiceImpl implements ShoppingTrolleyService {

    @Autowired
    private ShoppingTrolleyMapper shoppingTrolleyMapper;

    @Override
    public ShoppingTrolley selectByUserId(Integer userId) {
        return  shoppingTrolleyMapper.selectByUserId(userId);
    }

    @Override
    public int insert(ShoppingTrolley record) {
        return shoppingTrolleyMapper.insert(record);
    }

    @Override
    public int updateByPrimaryKey(ShoppingTrolley record) {
        return shoppingTrolleyMapper.updateByPrimaryKey(record);
    }

}
