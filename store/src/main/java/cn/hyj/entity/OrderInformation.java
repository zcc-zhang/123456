package cn.hyj.entity;

import java.math.BigDecimal;
import java.util.Date;

public class OrderInformation {
    private Integer orderFormId;

    private Integer id;

    private String productName;

    private String commodityAttribute;

    private BigDecimal commodityPrice;

    private Integer commodityCount;

    private BigDecimal commodityFreight;

    private BigDecimal subtotal;

    private BigDecimal price;

    private Date placeAnOrderDate;

    private Date paymentTime;

    private Date affirmDate;

    private String logisticsId;

    private Integer status;

    public Integer getOrderFormId() {
        return orderFormId;
    }

    public void setOrderFormId(Integer orderFormId) {
        this.orderFormId = orderFormId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName == null ? null : productName.trim();
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

    public Integer getCommodityCount() {
        return commodityCount;
    }

    public void setCommodityCount(Integer commodityCount) {
        this.commodityCount = commodityCount;
    }

    public BigDecimal getCommodityFreight() {
        return commodityFreight;
    }

    public void setCommodityFreight(BigDecimal commodityFreight) {
        this.commodityFreight = commodityFreight;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Date getPlaceAnOrderDate() {
        return placeAnOrderDate;
    }

    public void setPlaceAnOrderDate(Date placeAnOrderDate) {
        this.placeAnOrderDate = placeAnOrderDate;
    }

    public Date getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(Date paymentTime) {
        this.paymentTime = paymentTime;
    }

    public Date getAffirmDate() {
        return affirmDate;
    }

    public void setAffirmDate(Date affirmDate) {
        this.affirmDate = affirmDate;
    }

    public String getLogisticsId() {
        return logisticsId;
    }

    public void setLogisticsId(String logisticsId) {
        this.logisticsId = logisticsId == null ? null : logisticsId.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}