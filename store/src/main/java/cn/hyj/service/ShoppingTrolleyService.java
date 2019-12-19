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

   // 根据id查询
    List<ShoppingTrolley> selectByUserId(Integer userId);
    //添加
    void insert(ShoppingTrolley record);
    //【更改状态】
    int updateByPrimaryKey(ShoppingTrolley record);

    void deleteByPrimaryKey(Integer shoppingTrolleyId);
}
