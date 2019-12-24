package cn.hyj.service.impl;

import cn.hyj.entity.ShoppingTrolley;
import cn.hyj.mapper.ShoppingTrolleyMapper;
import cn.hyj.service.ShoppingTrolleyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 * 购物车业务逻辑实现层
 *
 * @author Administrator
 *
 */
@Service
public class ShoppingTrolleyServiceImpl implements ShoppingTrolleyService {

    @Autowired
    private ShoppingTrolleyMapper shoppingTrolleyMapper;


    @Override
    public List<ShoppingTrolley> selectByUserId(Integer userId) {
        return shoppingTrolleyMapper.selectByUserId(userId);
    }

    @Override
    public void insert(ShoppingTrolley record) {
        System.out.println(record);
        List<ShoppingTrolley> trolleys = this.selectByUserId(record.getUserId());
        boolean flag=true;
            for (int i=0;i<trolleys.size();i++)
            {
                if(trolleys.get(i).getCommodityId().equals(record.getCommodityId())){
                    trolleys.get(i).setCount(trolleys.get(i).getCount()+1);
                    this.updateByPrimaryKey(trolleys.get(i));
                    flag=false;
                }
            }
            if(flag){
                shoppingTrolleyMapper.insert(record);
            }
    }

    @Override
    public int updateByPrimaryKey(ShoppingTrolley record) {
        return shoppingTrolleyMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public void deleteByPrimaryKey(Integer commodityId) {
         shoppingTrolleyMapper.deleteByCommodityId(commodityId);
    }

    @Override
    public void EmptyShoppingCart(Integer userID) {
        shoppingTrolleyMapper.deleteByUserId(userID);
    }

}
