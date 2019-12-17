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
@Service("shoppingTrolleyService")
public class ShoppingTrolleyServiceImpl implements ShoppingTrolleyService {

    @Autowired
    private ShoppingTrolleyMapper shoppingTrolleyMapper;

    @Override
    public ShoppingTrolley selectByUserId(Integer userId) {
        return  shoppingTrolleyMapper.selectByUserId(userId);
    }
}
