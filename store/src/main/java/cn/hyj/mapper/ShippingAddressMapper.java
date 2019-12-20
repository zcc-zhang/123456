package cn.hyj.mapper;

import cn.hyj.entity.ShippingAddress;

import java.util.List;

public interface ShippingAddressMapper {

    int deleteByPrimaryKey(Integer shippingAddressId);

    int insert(ShippingAddress record);

    int insertSelective(ShippingAddress record);

    List<ShippingAddress> selectByUserId(Integer shippingAddressId);

    ShippingAddress selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ShippingAddress record);

    int updateByPrimaryKey(ShippingAddress record);
}