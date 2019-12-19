package cn.hyj.controller;

import cn.hyj.entity.ShippingAddress;
import cn.hyj.entity.User;
import cn.hyj.service.ShippingAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.List;
import java.util.Map;


/**
 * 收货地址的controller
 */
@Controller
@RequestMapping("/shippingAddress")
public class ShippingAddressController {


    @Autowired
    private ShippingAddressService shippingAddressService;

    /**
     * 收货地址列表
     * @param model
     * @return
     */
    @RequestMapping("/addressList")
    public String addressList(Model model, @SessionAttribute(value = "user") User user){
        List<ShippingAddress> shippingAddresses = shippingAddressService.queryByUserID(user.getUserId());//登录用户的地址列表
        model.addAttribute("addresslist",shippingAddresses);
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
    public String addAddress(ShippingAddress shippingAddress,String province,String city,String county,@SessionAttribute(value = "user") User user){
        StringBuilder address=new StringBuilder(province).append(city).append(county).append(shippingAddress.getAddress());//最终地址
        shippingAddress.setAddress(address.toString());

        shippingAddress.setId(user.getUserId());
        shippingAddress.setStatus(1);
        shippingAddressService.insert(shippingAddress);
        return "User_address";
    }


    /**
     * 修改收货地址
     * @param shippingAddress
     * @param province
     * @param city
     * @param county
     */
    @ResponseBody
    @RequestMapping("/updateAddress")
    public String updateAddress(ShippingAddress shippingAddress,String province,String city,String county){

        StringBuilder builder=new StringBuilder(province).append(city).append(county);
        shippingAddress.setAddress(builder.append(shippingAddress.getAddress()).toString());
        try {
            shippingAddressService.updateByPrimaryKeySelective(shippingAddress);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
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
