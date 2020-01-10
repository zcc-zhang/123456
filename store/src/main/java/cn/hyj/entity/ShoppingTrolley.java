package cn.hyj.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

/**
 * 购物车
 */
public class ShoppingTrolley implements Serializable {
    private Integer shoppingTrolleyId;//逻辑主键

    private Integer commodityId;//商品id

    private Integer userId;//用户id

    private Integer status;//商品状态

    private Commodity commodity;//商品

    private Integer count;//商品数量

    private Integer sum;//总价

    public Integer getSum() {
        return sum;
    }

    public void setSum() {
        this.sum = commodity.getCommodityPrice().intValue()*count;
    }

    public Integer getShoppingTrolleyId() {
        return shoppingTrolleyId;
    }

    public void setShoppingTrolleyId(Integer shoppingTrolleyId) {
        this.shoppingTrolleyId = shoppingTrolleyId;
    }

    public Integer getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(Integer commodityId) {
        this.commodityId = commodityId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    @Override
    public String toString() {
        return "ShoppingTrolley{" +
                "shoppingTrolleyId=" + shoppingTrolleyId +
                ", commodityId=" + commodityId +
                ", userId=" + userId +
                ", status=" + status +
                ", commodity=" + commodity +
                ", count=" + count +
                '}';
    }


}