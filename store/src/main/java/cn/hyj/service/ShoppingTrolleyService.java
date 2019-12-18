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
    int insert(ShoppingTrolley record);
    //删除【更改状态】
    int updateByPrimaryKey(ShoppingTrolley record);

}
