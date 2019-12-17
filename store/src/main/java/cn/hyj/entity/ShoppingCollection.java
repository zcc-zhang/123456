package cn.hyj.entity;

public class ShoppingCollection {
    private Integer shoppingCollectionId;

    private Integer commodityId;

    private Integer userId;

    private Integer status;

    public Integer getShoppingCollectionId() {
        return shoppingCollectionId;
    }

    public void setShoppingCollectionId(Integer shoppingCollectionId) {
        this.shoppingCollectionId = shoppingCollectionId;
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
}