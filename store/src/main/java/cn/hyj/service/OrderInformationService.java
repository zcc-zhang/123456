package cn.hyj.service;

import cn.hyj.entity.OrderInformation;

import java.util.List;


/**
 * 订单信息业务逻辑层
 *
 * @author Administrator
 *
 */
public interface OrderInformationService {

    //添加
    int insertSelective(OrderInformation record);

    //删除
    int deleteByPrimaryKey(Integer orderFormId);

    //查询
    List<OrderInformation> queryByIdStatus(Integer id);
}
