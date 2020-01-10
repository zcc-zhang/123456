package cn.hyj.entity;


import java.io.Serializable;

/**
 * 收货地址
 */
public class ShippingAddress implements Serializable {
    private Integer shippingAddressId;//逻辑主键

    private String name;//姓名

    private String moblie;//电话

    private String address;//地址

    private String postal;//邮箱编码

    private Integer id;//用户id

    private Integer status;//收货地址状态

    public Integer getShippingAddressId() {
        return shippingAddressId;
    }

    public void setShippingAddressId(Integer shippingAddressId) {
        this.shippingAddressId = shippingAddressId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getMoblie() {
        return moblie;
    }

    public void setMoblie(String moblie) {
        this.moblie = moblie == null ? null : moblie.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPostal() {
        return postal;
    }

    public void setPostal(String postal) {
        this.postal = postal == null ? null : postal.trim();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ShippingAddress{" +
                "shippingAddressId=" + shippingAddressId +
                ", name='" + name + '\'' +
                ", moblie='" + moblie + '\'' +
                ", address='" + address + '\'' +
                ", postal='" + postal + '\'' +
                ", id=" + id +
                ", status=" + status +
                '}';
    }
}