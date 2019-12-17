package cn.hyj.mapper;

import cn.hyj.entity.OrderInformation;

public interface OrderInformationMapper {
    int deleteByPrimaryKey(Integer orderFormId);

    int insert(OrderInformation record);

    int insertSelective(OrderInformation record);

    OrderInformation selectByPrimaryKey(Integer orderFormId);

    int updateByPrimaryKeySelective(OrderInformation record);

    int updateByPrimaryKey(OrderInformation record);
}