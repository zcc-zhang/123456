package cn.hyj.service.impl;

import cn.hyj.entity.ShippingAddress;
import cn.hyj.mapper.ShippingAddressMapper;
import cn.hyj.service.ShippingAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 收货地址业务逻辑实现层
 *
 * @author Administrator
 *
 */
@Service
public class ShippingAddressServiceImpl implements ShippingAddressService {

    @Autowired
    private ShippingAddressMapper shippingAddressMapper;

    @Override
    public int insert(ShippingAddress record) {
        return shippingAddressMapper.insertSelective(record);
    }

    @Override
    public List<ShippingAddress> queryByUserID(Integer userId) {
        return shippingAddressMapper.selectByUserId(userId);
    }

    @Override
    public ShippingAddress queryById(Integer id) {
        return shippingAddressMapper.selectByPrimaryKey(id);
    }

    @Override
    public int deleteByPrimaryKey(Integer shippingAddressId) {
        return shippingAddressMapper.deleteByPrimaryKey(shippingAddressId);
    }

    @Override
    public void updateByPrimaryKeySelective(ShippingAddress shippingAddress) {
        shippingAddressMapper.updateByPrimaryKeySelective(shippingAddress);
    }
}
