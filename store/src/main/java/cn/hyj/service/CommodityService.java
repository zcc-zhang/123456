package cn.hyj.service;

import cn.hyj.entity.Commodity;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 商品业务逻辑层
 *
 * @author Administrator
 *
 */
public interface CommodityService {
    /**
     * 查询全部
     * @return
     */
    List<Commodity> queryAll(String commodityPrice,  String commodityAttribute);

    Commodity queryByPrimaryKey(Integer primaryKey);
}
