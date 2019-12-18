package cn.hyj.mapper;

import cn.hyj.entity.OrderInformation;

import java.util.List;

public interface OrderInformationMapper {

    List<OrderInformation> queryByIdStatus(Integer id,Integer status);

    int deleteByPrimaryKey(Integer orderFormId);

    int insert(OrderInformation record);

    int insertSelective(OrderInformation record);

    OrderInformation selectByPrimaryKey(Integer orderFormId);

    int updateByPrimaryKeySelective(OrderInformation record);

    int updateByPrimaryKey(OrderInformation record);
}