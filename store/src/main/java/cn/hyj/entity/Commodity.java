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
}