package cn.hyj.service;

import cn.hyj.entity.ShippingAddress;
import java.util.List;


/**
 * 收货地址业务逻辑层
 *
 * @author Administrator
 *
 */
public interface ShippingAddressService {

    //添加收货地址
    int insert(ShippingAddress record);

    //id查询收货地址列表
    List<ShippingAddress> queryByUserID(Integer shippingAddressId);
    //id查询一个收货地址
    ShippingAddress queryById(Integer id);
    //删除
    int deleteByPrimaryKey(Integer shippingAddressId);

    void updateByPrimaryKeySelective(ShippingAddress shippingAddress);

}
