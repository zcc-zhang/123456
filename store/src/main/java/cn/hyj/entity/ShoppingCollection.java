package cn.hyj.entity;

/**
 * 收藏
 */
public class ShoppingCollection {
    private Integer shoppingCollectionId;

    private Integer commodityId;

    private Integer userId;

    private Integer status;

    private Commodity commodity;

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

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

}