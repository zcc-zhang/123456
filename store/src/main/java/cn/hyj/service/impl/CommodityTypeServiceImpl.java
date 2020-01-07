package cn.hyj.service.impl;

import cn.hyj.entity.CommodityType;
import cn.hyj.mapper.CommodityTypeMapper;
import cn.hyj.service.CommodityTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商品业务逻辑实现层
 *
 * @author Administrator
 *
 */
@Service
public class CommodityTypeServiceImpl implements CommodityTypeService {

    @Autowired
    private CommodityTypeMapper commodityTypeMapper;

    @Override
    public List<CommodityType> queryCommodityType(String commodityType) {
        return commodityTypeMapper.queryCommodityType(commodityType);
    }

    @Override
    public void insertSelective(CommodityType record) {
        commodityTypeMapper.insertSelective(record);
    }

    @Override
    public void deleteByPrimaryKey(Integer commodityTypeId) {
        commodityTypeMapper.deleteByPrimaryKey(commodityTypeId);
    }
}
