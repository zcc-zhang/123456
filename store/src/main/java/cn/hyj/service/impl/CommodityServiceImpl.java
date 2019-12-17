package cn.hyj.service.impl;

import cn.hyj.entity.Commodity;
import cn.hyj.mapper.CommodityMapper;
import cn.hyj.service.CommodityService;
import org.apache.ibatis.annotations.Param;
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
public class CommodityServiceImpl implements CommodityService {
    @Autowired
    private CommodityMapper commodityMapper;

    @Override
    public List<Commodity> queryAll( String commodityPrice,  String commodityAttribute) {
        return commodityMapper.selectAll(commodityPrice,commodityAttribute);
    }

    @Override
    public Commodity queryByPrimaryKey(Integer primaryKey) {
        return commodityMapper.selectByPrimaryKey(primaryKey);
    }
}
