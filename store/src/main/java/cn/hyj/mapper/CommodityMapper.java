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

    /**
     * 修改商品个别字段
     * @param record
     * @return
     */
    void updateByPrimaryKeySelective(Commodity record);

    int updateByPrimaryKeyWithBLOBs(Commodity record);

    int updateByPrimaryKey(Commodity record);

    List<Commodity> selectAll(@Param("commodityAttribute") String commodityAttribute,
                              @Param("max")Integer maxNumber,
                              @Param("min")Integer minNumber);

    List<Commodity> selectRandomGeneration(Integer nums);

    /**
     * 类型id查询商品
     * @param commodityTypeId
     * @param productName
     * @return
     */
    List<Commodity> queryByCommodityType(@Param("commodityTypeId") Integer commodityTypeId,@Param("productName") String productName);

    int selectCount();
}