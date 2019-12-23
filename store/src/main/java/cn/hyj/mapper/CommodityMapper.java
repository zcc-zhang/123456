package cn.hyj.mapper;

import cn.hyj.entity.Commodity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommodityMapper {

    /**
     * 销量排行
     * @return
     */
    List<Commodity> selectByCommodityEvaluation();

    int deleteByPrimaryKey(Integer commodityId);

    int insert(Commodity record);

    int insertSelective(Commodity record);

    Commodity selectByPrimaryKey(Integer commodityId);

    int updateByPrimaryKeySelective(Commodity record);

    int updateByPrimaryKeyWithBLOBs(Commodity record);

    int updateByPrimaryKey(Commodity record);

    List<Commodity> selectAll(@Param("commodityAttribute") String commodityAttribute,
                              @Param("max")Integer maxNumber,
                              @Param("min")Integer minNumber);
}