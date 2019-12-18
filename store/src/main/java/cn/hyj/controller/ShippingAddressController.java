package cn.hyj.controller;

import cn.hyj.entity.ShippingAddress;
import cn.hyj.service.ShippingAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("/shippingAddress")
/**
 * 收货地址的controller
 */
public class ShippingAddressController {

    @Autowired
    private ShippingAddressService shippingAddressService;

    @RequestMapping("/insertShippingAddress")
    public String insert(ShippingAddress address) {

        shippingAddressService.insert(address);

        return "User_address";
    }
    /**
     * 收货地址列表
     * @param model
     * @return
     */
    public String addressList(Model model){

        return "User_address";
    }

    /**
     * 添加收货地址
     * @param shippingAddress
     * @param province
     * @param city
     * @param county
     * @return
     */
    @RequestMapping("/addAddress")
    public String addAddress(ShippingAddress shippingAddress,String province,String city,String county){
        StringBuilder address=new StringBuilder(province).append(city).append(county).append(shippingAddress.getAddress());//最终地址
        shippingAddress.setAddress(address.toString());
        return "";
    }

    /**
     * 修改收货地址
     * @param shippingAddress
     * @param province
     * @param city
     * @param county
     * @return
     */
    @RequestMapping("/changeAddress")
    public String changeAddress(ShippingAddress shippingAddress,String province,String city,String county){
        StringBuilder address=new StringBuilder(province).append(city).append(county).append(shippingAddress.getAddress());//最终地址
        shippingAddress.setAddress(address.toString());
        return "";
    }

    /**
     * 删除收货地址
     * @param addressId
     * @return
     */
    public String delete(Integer addressId){

        return "";
    }
}
