package cn.hyj.service.impl;

import cn.hyj.entity.OrderInformation;
import cn.hyj.mapper.OrderInformationMapper;
import cn.hyj.service.OrderInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 订单业务逻辑实现层
 *
 * @author Administrator
 *
 */
@Service
public class OrderInformationServiceImpl implements OrderInformationService {

    @Autowired
    private OrderInformationMapper orderInformationMapper;

    @Override
    public int insertSelective(OrderInformation record) {
        return orderInformationMapper.insertSelective(record);
    }

    @Override
    public int deleteByPrimaryKey(Integer orderFormId) {
        return orderInformationMapper.deleteByPrimaryKey(orderFormId);
    }

    @Override
    public List<OrderInformation> queryByIdStatus(Integer id, Integer status) {
        return orderInformationMapper.queryByIdStatus(id,status);
    }


}
