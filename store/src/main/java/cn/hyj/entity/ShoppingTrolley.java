package cn.hyj.entity;

import java.util.List;

public class ShoppingTrolley {
    private Integer shoppingTrolleyId;//逻辑主键

    private Integer commodityId;//商品id

    private Integer userId;//用户id

    private Integer status;//商品状态

    private List<Commodity> commodities;//商品列表

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

    public List<Commodity> getCommodities() {
        return commodities;
    }

    public void setCommodities(List<Commodity> commodities) {
        this.commodities = commodities;
    }
}