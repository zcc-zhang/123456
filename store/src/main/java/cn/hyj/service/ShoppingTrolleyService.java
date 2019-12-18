package cn.hyj.service;

import cn.hyj.entity.ShoppingTrolley;

import java.util.List;


/**
 * 购物车业务逻辑层
 *
 * @author Administrator
 *
 */
public interface ShoppingTrolleyService {

    ShoppingTrolley selectByUserId(Integer userId);

}
