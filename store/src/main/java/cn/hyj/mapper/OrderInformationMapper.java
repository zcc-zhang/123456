package cn.hyj.mapper;

import cn.hyj.entity.OrderInformation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderInformationMapper {

    List<OrderInformation> queryByIdStatus(Integer userId);

    int deleteByPrimaryKey(Integer orderFormId);

    int insert(OrderInformation record);

    int insertSelective(OrderInformation record);

    OrderInformation selectByPrimaryKey(Integer orderFormId);

    int updateByPrimaryKeySelective(OrderInformation record);

    int updateByPrimaryKey(OrderInformation record);
}