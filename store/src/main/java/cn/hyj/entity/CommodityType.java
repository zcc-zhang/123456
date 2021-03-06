package cn.hyj.entity;


import java.io.Serializable;

/**
 * 商品类型
 */
public class CommodityType implements Serializable {

    private Integer commodityTypeId;

    private String commodityType;

    private Integer type;

    public Integer getCommodityTypeId() {
        return commodityTypeId;
    }

    public void setCommodityTypeId(Integer commodityTypeId) {
        this.commodityTypeId = commodityTypeId;
    }

    public String getCommodityType() {
        return commodityType;
    }

    public void setCommodityType(String commodityType) {
        this.commodityType = commodityType == null ? null : commodityType.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "CommodityType{" +
                "commodityTypeId=" + commodityTypeId +
                ", commodityType='" + commodityType + '\'' +
                ", type=" + type +
                '}';
    }
}