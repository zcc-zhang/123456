package cn.hyj.controller;

import cn.hyj.entity.ShippingAddress;
import cn.hyj.service.ShippingAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShippingAddressController {

    @Autowired
    private ShippingAddressService shippingAddressService;

    @RequestMapping("/insertShippingAddress")
    public String insert(ShippingAddress address){

        shippingAddressService.insert(address);

        return "User_address";
    }
}
