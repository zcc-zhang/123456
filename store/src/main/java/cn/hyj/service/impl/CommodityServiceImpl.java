package cn.hyj.service.impl;

import cn.hyj.entity.Commodity;
import cn.hyj.mapper.CommodityMapper;
import cn.hyj.service.CommodityService;
import cn.hyj.utils.SplitString;
import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.INTERNAL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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
    public List<Commodity> queryAll( String commodityAttribute,String pruductName,Integer max,Integer min) {
        return commodityMapper.selectAll(commodityAttribute,pruductName,max,min);
    }

    @Override
    public List<Commodity> selectProductName() {
        return commodityMapper.selectProductName();
    }

    @Override
    public Commodity queryByPrimaryKey(Integer primaryKey) {
        return commodityMapper.selectByPrimaryKey(primaryKey);
    }

    @Override
    public List<Commodity> queryByCommodityEvaluation() {
        return commodityMapper.selectByCommodityEvaluation();
    }

    public List<Integer> randomNumber() {
        List<Integer> nums=new ArrayList<Integer>();
        Random random = new Random();//随机生成
        for (int i = 0; i < 6; i++) {
            Integer num = random.nextInt(74);
            nums.add(num);
        }
        return  nums;
    }
    @Override
    public List<Commodity> randomGenerationLimitBuy() {
        return this.randomGeneration1F();
    }

    @Override
    public List<Commodity> randomGeneration1F() {
        List<Integer> nums=this.randomNumber();
        List<Commodity> commodities =commodityMapper.selectRandomGeneration(6);
        commodities.forEach(commodity ->
                commodity.setCommodityImg(SplitString.splitString(commodity.getCommodityImg())[0]));
        return commodities;
    }

    @Override
    public List<Commodity> randomGeneration2F() {
        return this.randomGeneration1F();
    }


    @Override
    public List<Commodity> guessYouLike() {
        List<Commodity> commodities = commodityMapper.selectRandomGeneration(8);
        commodities.forEach(commodity -> {
            commodity.setCommodityImg(SplitString.splitString(commodity.getCommodityImg())[0]);
        });
        return commodities;
    }

    @Override
    public int insertSelective(Commodity commodity) {
        return commodityMapper.insertSelective(commodity);
    }

    @Override
    public List<Commodity> queryByCommodityType(Integer commodityTypeId,String productName) {
        return commodityMapper.queryByCommodityType(commodityTypeId,productName);
    }

    @Override
    public void updateByPrimaryKeySelective(Commodity record) {
         commodityMapper.updateByPrimaryKeySelective(record);
    }


}
