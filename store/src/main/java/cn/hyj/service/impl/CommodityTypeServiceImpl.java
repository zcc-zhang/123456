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
    public List<CommodityType> queryCommodityType() {
        return commodityTypeMapper.queryCommodityType();
    }

    @Override
    public void saveCommodityType(CommodityType commodityType) {
        commodityTypeMapper.insertSelective(commodityType);
    }

    @Override
    public CommodityType queryByPrimaryKey(Integer commodityTypeId) {
        return commodityTypeMapper.selectByPrimaryKey(commodityTypeId);
    }

    @Override
    public void changeByID(CommodityType commodityType) {
        commodityTypeMapper.updateByPrimaryKeySelective(commodityType);
    }
}
