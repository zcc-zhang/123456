package cn.hyj.service.impl;

import cn.hyj.entity.ShippingAddress;
import cn.hyj.service.ShippingAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 收货地址业务逻辑实现层
 *
 * @author Administrator
 *
 */
@Service
public class ShippingAddressServiceImpl implements ShippingAddressService {

    @Autowired
    private ShippingAddressService shippingAddressService;

    @Override
    public int insert(ShippingAddress record) {
        return shippingAddressService.insert(record);
    }

    @Override
    public ShippingAddress selectByPrimaryKey(Integer shippingAddressId) {
        return shippingAddressService.selectByPrimaryKey(shippingAddressId);
    }

    @Override
    public int deleteByPrimaryKey(Integer shippingAddressId) {
        return shippingAddressService.deleteByPrimaryKey(shippingAddressId);
    }
}
