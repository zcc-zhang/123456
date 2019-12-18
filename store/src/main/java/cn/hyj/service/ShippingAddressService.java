package cn.hyj.service;

import cn.hyj.entity.ShippingAddress;
import org.springframework.stereotype.Service;

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

    //id查询
    ShippingAddress selectByPrimaryKey(Integer shippingAddressId);

    //删除
    int deleteByPrimaryKey(Integer shippingAddressId);

}
