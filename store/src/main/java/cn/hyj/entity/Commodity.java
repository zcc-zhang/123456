package cn.hyj.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Commodity {
    private Integer commodityId;

    private String productName;

    private Integer commodityTypeId;

    private String commodityAttribute;

    private BigDecimal commodityPrice;

    private BigDecimal commodityFreight;

    private Integer merchantId;

    private Integer commodityStatus;

    private Date shelfTime;

    private Integer commodityWeight;

    private Integer commodityEvaluation;

    private Integer commodityNumber;

    private Integer inventory;

    private Integer collectNumber;

    private String commodityImg;



    public Integer getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(Integer commodityId) {
        this.commodityId = commodityId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName == null ? null : productName.trim();
    }

    public Integer getCommodityTypeId() {
        return commodityTypeId;
    }

    public void setCommodityTypeId(Integer commodityTypeId) {
        this.commodityTypeId = commodityTypeId;
    }

    public String getCommodityAttribute() {
        return commodityAttribute;
    }

    public void setCommodityAttribute(String commodityAttribute) {
        this.commodityAttribute = commodityAttribute == null ? null : commodityAttribute.trim();
    }

    public BigDecimal getCommodityPrice() {
        return commodityPrice;
    }

    public void setCommodityPrice(BigDecimal commodityPrice) {
        this.commodityPrice = commodityPrice;
    }

    public BigDecimal getCommodityFreight() {
        return commodityFreight;
    }

    public void setCommodityFreight(BigDecimal commodityFreight) {
        this.commodityFreight = commodityFreight;
    }

    public Integer getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(Integer merchantId) {
        this.merchantId = merchantId;
    }

    public Integer getCommodityStatus() {
        return commodityStatus;
    }

    public void setCommodityStatus(Integer commodityStatus) {
        this.commodityStatus = commodityStatus;
    }

    public Date getShelfTime() {
        return shelfTime;
    }

    public void setShelfTime(Date shelfTime) {
        this.shelfTime = shelfTime;
    }

    public Integer getCommodityWeight() {
        return commodityWeight;
    }

    public void setCommodityWeight(Integer commodityWeight) {
        this.commodityWeight = commodityWeight;
    }

    public Integer getCommodityEvaluation() {
        return commodityEvaluation;
    }

    public void setCommodityEvaluation(Integer commodityEvaluation) {
        this.commodityEvaluation = commodityEvaluation;
    }

    public Integer getCommodityNumber() {
        return commodityNumber;
    }

    public void setCommodityNumber(Integer commodityNumber) {
        this.commodityNumber = commodityNumber;
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public Integer getCollectNumber() {
        return collectNumber;
    }

    public void setCollectNumber(Integer collectNumber) {
        this.collectNumber = collectNumber;
    }

    public String getCommodityImg() {
        return commodityImg;
    }

    public void setCommodityImg(String commodityImg) {
        this.commodityImg = commodityImg == null ? null : commodityImg.trim();
    }

    public Commodity(Integer commodityId, String productName, Integer commodityTypeId, String commodityAttribute, BigDecimal commodityPrice, BigDecimal commodityFreight, Integer merchantId, Integer commodityStatus, Date shelfTime, Integer commodityWeight, Integer commodityEvaluation, Integer commodityNumber, Integer inventory, Integer collectNumber, String commodityImg) {
        this.commodityId = commodityId;
        this.productName = productName;
        this.commodityTypeId = commodityTypeId;
        this.commodityAttribute = commodityAttribute;
        this.commodityPrice = commodityPrice;
        this.commodityFreight = commodityFreight;
        this.merchantId = merchantId;
        this.commodityStatus = commodityStatus;
        this.shelfTime = shelfTime;
        this.commodityWeight = commodityWeight;
        this.commodityEvaluation = commodityEvaluation;
        this.commodityNumber = commodityNumber;
        this.inventory = inventory;
        this.collectNumber = collectNumber;
        this.commodityImg = commodityImg;
    }

    public Commodity() {
    }

    @Override
    public String toString() {
        return "Commodity{" +
                "commodityId=" + commodityId +
                ", productName='" + productName + '\'' +
                ", commodityTypeId=" + commodityTypeId +
                ", commodityAttribute='" + commodityAttribute + '\'' +
                ", commodityPrice=" + commodityPrice +
                ", commodityFreight=" + commodityFreight +
                ", merchantId=" + merchantId +
                ", commodityStatus=" + commodityStatus +
                ", shelfTime=" + shelfTime +
                ", commodityWeight=" + commodityWeight +
                ", commodityEvaluation=" + commodityEvaluation +
                ", commodityNumber=" + commodityNumber +
                ", inventory=" + inventory +
                ", collectNumber=" + collectNumber +
                ", commodityImg='" + commodityImg + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Commodity commodity = (Commodity) o;

        if (commodityId != null ? !commodityId.equals(commodity.commodityId) : commodity.commodityId != null)
            return false;
        if (productName != null ? !productName.equals(commodity.productName) : commodity.productName != null)
            return false;
        if (commodityTypeId != null ? !commodityTypeId.equals(commodity.commodityTypeId) : commodity.commodityTypeId != null)
            return false;
        if (commodityAttribute != null ? !commodityAttribute.equals(commodity.commodityAttribute) : commodity.commodityAttribute != null)
            return false;
        if (commodityPrice != null ? !commodityPrice.equals(commodity.commodityPrice) : commodity.commodityPrice != null)
            return false;
        if (commodityFreight != null ? !commodityFreight.equals(commodity.commodityFreight) : commodity.commodityFreight != null)
            return false;
        if (merchantId != null ? !merchantId.equals(commodity.merchantId) : commodity.merchantId != null) return false;
        if (commodityStatus != null ? !commodityStatus.equals(commodity.commodityStatus) : commodity.commodityStatus != null)
            return false;
        if (shelfTime != null ? !shelfTime.equals(commodity.shelfTime) : commodity.shelfTime != null) return false;
        if (commodityWeight != null ? !commodityWeight.equals(commodity.commodityWeight) : commodity.commodityWeight != null)
            return false;
        if (commodityEvaluation != null ? !commodityEvaluation.equals(commodity.commodityEvaluation) : commodity.commodityEvaluation != null)
            return false;
        if (commodityNumber != null ? !commodityNumber.equals(commodity.commodityNumber) : commodity.commodityNumber != null)
            return false;
        if (inventory != null ? !inventory.equals(commodity.inventory) : commodity.inventory != null) return false;
        if (collectNumber != null ? !collectNumber.equals(commodity.collectNumber) : commodity.collectNumber != null)
            return false;
        return commodityImg != null ? commodityImg.equals(commodity.commodityImg) : commodity.commodityImg == null;
    }

    @Override
    public int hashCode() {
        int result = commodityId != null ? commodityId.hashCode() : 0;
        result = 31 * result + (productName != null ? productName.hashCode() : 0);
        result = 31 * result + (commodityTypeId != null ? commodityTypeId.hashCode() : 0);
        result = 31 * result + (commodityAttribute != null ? commodityAttribute.hashCode() : 0);
        result = 31 * result + (commodityPrice != null ? commodityPrice.hashCode() : 0);
        result = 31 * result + (commodityFreight != null ? commodityFreight.hashCode() : 0);
        result = 31 * result + (merchantId != null ? merchantId.hashCode() : 0);
        result = 31 * result + (commodityStatus != null ? commodityStatus.hashCode() : 0);
        result = 31 * result + (shelfTime != null ? shelfTime.hashCode() : 0);
        result = 31 * result + (commodityWeight != null ? commodityWeight.hashCode() : 0);
        result = 31 * result + (commodityEvaluation != null ? commodityEvaluation.hashCode() : 0);
        result = 31 * result + (commodityNumber != null ? commodityNumber.hashCode() : 0);
        result = 31 * result + (inventory != null ? inventory.hashCode() : 0);
        result = 31 * result + (collectNumber != null ? collectNumber.hashCode() : 0);
        result = 31 * result + (commodityImg != null ? commodityImg.hashCode() : 0);
        return result;
    }
}