package cn.hyj.utils;


import cn.hyj.entity.Commodity;
import cn.hyj.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.Cookie;
import java.util.ArrayList;
import java.util.List;


/**
 * 操作cook的工具类
 *
 * @author Administrator
 *
 */
@Component
public class CookieUtil {

	@Autowired
	private  CommodityService service;

	private CookieUtil( ) {

	}


	public  List<Commodity> historyCommodityList(Cookie[] cookies) {
		Commodity commodity = null;// 商品
		List<Commodity> list = new ArrayList<Commodity>();// 存放商品
		String[] commoditys = null;// 存放商品id
		for (int i = 0; i < cookies.length; i++) {// 遍历cookie
			if ("commodityId".equals(cookies[i].getName()))// 找到属于我想要的cookie元素
			{
				commoditys = cookies[i].getValue().split("#");// 分割成数组
			}
		}
		if (commoditys != null && commoditys.length > 0)// 数组不为空遍历
		{
			for (int i = 0; i < commoditys.length && !"".equals(commoditys[i].trim()); i++) {
				commodity = service.queryByPrimaryKey(Integer.parseInt(commoditys[i]));// 根据id查询指定商品
				if (list.size() == 0) {
					list.add(commodity);
				} else {
					if(list.contains(commodity))//如果集合中存在该元素
					{
						list.remove(commodity);//移除该元素
						list.add(0, commodity);
					}else{
						list.add(commodity);//不存在正常加
					}

				}

			}
		}
		return list;
	}
}
