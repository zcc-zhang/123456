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
    List<Commodity> queryAll(String commodityPrice,  Integer maxNumber, Integer minNumber);

    Commodity queryByPrimaryKey(Integer primaryKey);

    /**
     * 销量排行
     * @return
     */
    List<Commodity> queryByCommodityEvaluation();

    /**
     * 随机限时团购商品
     * @return
     */
    List<Commodity> randomGenerationLimitBuy();

    /**
     * 随机 脸部护理1F
     * @return
     */
    List<Commodity> randomGeneration1F();

    /**
     * 2F
     * @return
     */
    List<Commodity> randomGeneration2F();

    /**
     * 猜你喜欢
     * @return
     */
    List<Commodity> guessYouLike();

    /**
     * 添加商品
     * @param commodity
     * @return
     */
    int insertSelective(Commodity commodity);

    /**
     * 类型ID查询商品
     * @param commodityTypeId
     * @return
     */
    List<Commodity> queryByCommodityType(Integer commodityTypeId,String productName);

    /**
     * 修改商品个别字段
     * @param record
     * @return
     */
    void updateByPrimaryKeySelective(Commodity record);

}
