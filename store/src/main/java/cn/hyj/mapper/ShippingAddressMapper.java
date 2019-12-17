package cn.hyj.mapper;

import cn.hyj.entity.ShippingAddress;

public interface ShippingAddressMapper {
    int deleteByPrimaryKey(Integer shippingAddressId);

    int insert(ShippingAddress record);

    int insertSelective(ShippingAddress record);

    ShippingAddress selectByPrimaryKey(Integer shippingAddressId);

    int updateByPrimaryKeySelective(ShippingAddress record);

    int updateByPrimaryKey(ShippingAddress record);
}