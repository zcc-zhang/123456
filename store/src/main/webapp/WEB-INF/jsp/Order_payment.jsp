<%@ page language="java" import="java.util.*"
		 contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/src/css/dialog.css" type="text/css">
	<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/fonts/iconfont.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.reveal.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.sumoselect.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/common_js.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/footer.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.jumpto.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/src/jquery.dialog.min.js"></script>
	<title>订单确认</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		window.asd = $('.SlectBox').SumoSelect({
			csvDispCount : 3
		});
		window.test = $('.testsel').SumoSelect({
			okCancelInMulti : true
		});
	});

</script>
<body>
<!--顶部图层-->
<div id="header_top">
	<div id="top">
		<div class="Inside_pages">
			<div class="Collection">
				下午好，欢迎光临锦宏颜！<em></em><a href="#">收藏我们</a>
			</div>
			<div class="hd_top_manu clearfix">
				<ul class="clearfix">
					<li class="hd_menu_tit zhuce" data-addclass="hd_menu_hover">欢迎光临本店！
						<a href="${pageContext.request.contextPath }/login.jsp" class="red">
							<c:if test="${ not empty user.username}">
								${user.username} <style>#registered{display: none}</style>
							</c:if>
							<c:if test="${empty user.username}">
								[请登录]
							</c:if> </a>
						<c:if test="${empty user.username}">
							新用户
						</c:if>
						<a href="${pageContext.request.contextPath }/registered.jsp"class="red" id='registered'>[免费注册]</a>
					</li>
					<li class="hd_menu_tit" data-addclass="hd_menu_hover">
						<a href="${pageContext.request.contextPath }/orderInformationServlet">我的订单</a>
					</li>
					<li class="hd_menu_tit" data-addclass="hd_menu_hover">
						<a href="${pageContext.request.contextPath }/Cart.jsp">购物车</a>
					</li>
					<li class="hd_menu_tit" data-addclass="hd_menu_hover">
						<a href="#">联系我们</a></li>
					<li class="hd_menu_tit list_name" data-addclass="hd_menu_hover">
						<a href="#" class="hd_menu">客户服务</a>
						<div class="hd_menu_list">
							<ul>
								<li><a
										href="${pageContext.request.contextPath }/Feedback.jsp">常见问题</a></li>
								<li><a href="#">在线退换货</a></li>
								<li><a href="#">在线投诉</a></li>
								<li><a href="#">配送范围</a></li>
							</ul>
						</div></li>
					<li class="hd_menu_tit phone_c" data-addclass="hd_menu_hover"><a
							href="#" class="hd_menu "><em class="iconfont icon-shouji"></em>手机版</a>
						<div class="hd_menu_list erweima">
							<ul>
								<img src="${pageContext.request.contextPath}/images/erweima.png" width="100px" height="100" />
							</ul>
						</div></li>
				</ul>
			</div>
		</div>
	</div>
	<!--样式-->
	<!--顶部样式2-->
	<div id="header " class="header page_style">
		<div class="logo">
			<a href="index.html"><img src="${pageContext.request.contextPath}/images/logo.png" /></a>
		</div>
		<!--结束图层-->
		<div class="Search">
			<p>
				<input name="" type="text" class="text" /><input name=""
																 type="submit" value="搜 索" class="Search_btn" />
			</p>
			<p class="Words">
				<a href="#">苹果</a><a href="#">香蕉</a><a href="#">菠萝</a><a href="#">西红柿</a><a
					href="#">橙子</a><a href="#">苹果</a>
			</p>
		</div>
		<!--购物车样式-->
		<div class="hd_Shopping_list" id="Shopping_list">
			<div class="s_cart">
				<em class="iconfont icon-cart2"></em><a href="#">我的购物车</a> <i
					class="ci-right">&gt;</i><i class="ci-count" id="shopping-amount">0</i>
			</div>
			<div class="dorpdown-layer">
				<div class="spacer"></div>
				<!--<div class="prompt"></div><div class="nogoods"><b></b>购物车中还没有商品，赶紧选购吧！</div>-->
				<ul class="p_s_list">
					<li>
						<div class="img">
							<img src="${pageContext.request.contextPath}/images/tianma.png">
						</div>
						<div class="content">
							<p>
								<a href="#">产品名称</a>
							</p>
							<p>颜色分类:紫花8255尺码:XL</p>
						</div>
						<div class="Operations">
							<p class="Price">￥55.00</p>
							<p>
								<a href="#">删除</a>
							</p>
						</div>
					</li>
				</ul>
				<div class="Shopping_style">
					<div class="p-total">
						共<b>1</b>件商品 共计<strong>￥ 515.00</strong>
					</div>
					<a href="#" title="去购物车结算" id="btn-payforgoods" class="Shopping">去购物车结算</a>
				</div>
			</div>
		</div>
	</div>
	<!--菜单导航样式-->
	<div id="Menu" class="clearfix">
		<div class="index_style clearfix">
			<div id="allSortOuterbox" class="display">
				<div class="t_menu_img"></div>
				<div class="Category">
					<a href="#"><em></em>所有产品分类</a>
				</div>
				<div class="hd_allsort_out_box_new">
					<!--左侧栏目开始-->
					<ul class="Menu_list">
						<li class="name">
							<div class="Menu_name">
								<a href="product_list.html">面部护理</a> <span>&lt;</span>
							</div>
							<div class="link_name">
								<p>
									<a href="Product_Detailed.html">茅台</a> <a href="#">五粮液</a> <a
										href="#">郎酒</a> <a href="#">剑南春</a>
								</p>
							</div>
							<div class="menv_Detail">
								<div class="cat_pannel clearfix">
									<div class="hd_sort_list">
										<dl class="clearfix" data-tpc="1">
											<dt>
												<a href="#">面膜<i>></i></a>
											</dt>
											<dd>
												<a href="#">撕拉面膜</a><a href="#">面膜贴</a><a href="#">免洗面膜</a><a
													href="#">水洗面膜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="2">
											<dt>
												<a href="#">洁面<i>></i></a>
											</dt>
											<dd>
												<a href="#">洁面摩丝</a><a href="#">洁面乳 </a><a href="#">洁面啫哩/胶</a><a
													href="#">面部去角质/磨砂</a><a href="#">洁面膏/霜</a><a href="#">洁肤皂</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="3">
											<dt>
												<a href="#">化妆水<i>></i></a>
											</dt>
											<dd>
												<a href="#"> 喷雾</a><a href="#"> 精华水</a><a href="#"> 柔肤水</a><a
													href="#">爽肤水</a><a href="#">收敛水/紧肤水</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">眼部护理<i>></i></a>
											</dt>
											<dd>
												<a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a
													href="#">眼霜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">眼部护理<i>></i></a>
											</dt>
											<dd>
												<a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a
													href="#">眼霜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">防晒<i>></i></a>
											</dt>
											<dd>
												<a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a
													href="#">眼霜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">唇部护理<i>></i></a>
											</dt>
											<dd>
												<a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a
													href="#">眼霜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">乳液/面霜<i>></i></a>
											</dt>
											<dd>
												<a href="#"> 乳液</a><a href="#"> 面霜</a><a href="#">按摩霜</a><a
													href="#">面部啫喱</a><a href="#">凝露/凝胶</a>
											</dd>
										</dl>
									</div>
									<div class="Brands">
										<a href="#" class="logo_Brands"><img
												src="product/logo/34.jpg" /></a> <a href="#"
																					class="logo_Brands"><img src="product/logo/42.jpg" /></a> <a
											href="#" class="logo_Brands"><img
											src="product/logo/152.jpg" /></a> <a href="#"
																				 class="logo_Brands"><img src="product/logo/156.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="product/logo/458.jpg" /></a> <a href="#"
																					 class="logo_Brands"><img src="product/logo/339.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="product/logo/245.jpg" /></a> <a href="#"
																					 class="logo_Brands"><img src="product/logo/199.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="product/logo/618.jpg" /></a> <a href="#"
																					 class="logo_Brands"><img src="product/logo/644.jpg" /></a>
										<a href="#" class="AD_3"><img src="product/ad/2.jpg" /></a>
									</div>
								</div>
								<!--品牌-->
							</div>
						</li>
						<li class="name">
							<div class="Menu_name">
								<a href="#">身体护理</a><span>&lt;</span>
							</div>
							<div class="link_name">
								<a href="Product_Detailed.html"> 面霜</a><a href="#">眼霜</a><a
									href="#"> 面膜</a><a href="#">护肤套装</a>

							</div>
							<div class="menv_Detail">
								<div class="cat_pannel clearfix"></div>
							</div>
						</li>
						<li class="name">
							<div class="Menu_name">
								<a href="#">香水彩妆</a><span>&lt;</span>
							</div>
							<div class="link_name">
								<a href="#">卸妆 </a><a href="#">防晒</a><a href="#">BB</a> <a
									href="#">女士香水</a>
							</div>
							<div class="menv_Detail">
								<div class="cat_pannel clearfix"></div>
							</div>
						</li>
						<li class="name">
							<div class="Menu_name">
								<a href="#">洗发护发</a><span>&lt;</span>
							</div>
							<div class="link_name">
								<a href="#">洗发</a><a href="#">护发</a><a href="#">沐浴</a><a
									href="#">润肤乳</a>
							</div>
							<div class="menv_Detail">
								<div class="cat_pannel clearfix"></div>
							</div>
						</li>
						<li class="name">
							<div class="Menu_name">
								<a href="#">女性护理</a><span>&lt;</span>
							</div>
							<div class="link_name">
								<a href="#">洁面</a><a href="#">坚果炒货</a><a href="#">乳液</a> <a
									href="#"> 面霜</a>
							</div>
							<div class="menv_Detail">
								<div class="cat_pannel clearfix"></div>
							</div>
						</li>
						<li class="name">
							<div class="Menu_name">
								<a href="#">男性护理</a><span>&lt;</span>
							</div>
							<div class="link_name">
								<a href="#">洁面</a><a href="#">坚果炒货</a><a href="#">乳液</a> <a
									href="#"> 面霜</a>
							</div>
							<div class="menv_Detail">
								<div class="cat_pannel clearfix"></div>
							</div>
						</li>
						<li class="name">
							<div class="Menu_name">
								<a href="#">推荐品牌</a><span>&lt;</span>
							</div>
							<div class="link_name">
								<a href="#">欧莱雅</a><a href="#"> 菲诗小铺</a><a href="#"> 雅诗兰黛</a>
							</div>
							<div class="menv_Detail">
								<div class="cat_pannel clearfix"></div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<script>$("#allSortOuterbox").slide({
				titCell : ".Menu_list li",
				mainCell : ".menv_Detail",
			});
			</script>
			<!--菜单栏-->
			<div class="Navigation" id="Navigation">
				<ul class="Navigation_name">
					<li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
					<li><a href="${pageContext.request.contextPath}/Footprint.jsp">日常护理</a></li>
					<li><a href="${pageContext.request.contextPath}/Must_see.jsp">每日必看</a></li>
					<li><a href="${pageContext.request.contextPath}/showCommodityListServlet">产品列表</a></li>
					<li><a href="${pageContext.request.contextPath}/Buy_Brands.jsp">限时团购</a></li>
					<li><a href="${pageContext.request.contextPath}/diy.jsp">礼品DIY</a></li>
					<li><a href="${pageContext.request.contextPath}/Group_buy.jsp">品牌团购</a></li>
					<li><a href="#">联系我们</a></li>
					<li><a href="${pageContext.request.contextPath}/index.jsp">简洁版</a></li>
				</ul>
			</div>
			<script>$("#Navigation").slide({
				titCell : ".Navigation_name li"
			});
			</script>
		</div>
	</div>
</div>
<!--订单确认样式-->
<div id="Orders" class="Inside_pages  clearfix">
	<div class="Process">
		<img src="${pageContext.request.contextPath}/images/Process_img_02.png" />
	</div>
	<div class="Orders_style clearfix">
		<div class="address clearfix">
			<div class="title">收货人信息</div>
			<div class="adderss_list clearfix">
				<div class="title_name">
					选择收货地址 <a href="#">+添加地址</a>
				</div>
				<div class="list" id="select">
					<ul class="confirm active">
						<div class="default">默认地址</div>
						<div class="adderss_operating">
							<div class="Operate">
								<a href="#" class="delete_btn"></a> <a href="#"
																	   class="modify_btn"></a>
							</div>
						</div>
						<div class="user_address">
							<li>${addressList[0].name }</li>
							<li>${addressList[0].address }</li>
							<li class="Postcode">${addressList[0].postal }</li>
							<li>${addressList[0].moblie}</li>
						</div>
					</ul>
					<c:forEach items="${addressList }" begin="1" var='list'>
						<ul class="">
							<div class="adderss_operating">
								<div class="Operate">
									<a href="#" class="delete_btn"></a> <a href="#"
																		   class="modify_btn"></a>
								</div>
							</div>
							<div class="user_address">
								<li>${list.name }</li>
								<li>${list.address }</li>
								<li class="Postcode">${list.postal }</li>
								<li>${list.moblie}</li>
							</div>
						</ul>
					</c:forEach>
					<!--  <ul class="">
          <div class="adderss_operating">
         <div class="Operate"><a href="#" class="delete_btn"></a> <a href="#" class="modify_btn"></a></div>
        </div>
         <div class="user_address">
        <li>小张</li>
        <li>四川成都高新区创业路10号3栋1单元1102式</li>
        <li class="Postcode">610043</li>
        <li>18908269130</li>
        </div>
        </ul> -->
					<!--   <ul class="">
          <div class="adderss_operating">
         <div class="Operate"><a href="#" class="delete_btn"></a> <a href="#" class="modify_btn"></a></div>
        </div>
         <div class="user_address">
        <li>小张</li>
        <li>四川成都高新区创业路10号3栋1单元1102式</li>
        <li class="Postcode">610043</li>
        <li>18908269130</li>
        </div>
        </ul>
        </div>
       </div> -->
					<!--收货地址样式-->
					<!-- <div class="Shipping_address">
   <ul class="detailed">
    <li><label>收货人姓名</label><span>张晓</span></li>
    <li><label>电子邮件</label><span>4567454@qq.com</span></li>
    <li><label>详细地址</label><span>四川成都武侯区簇景西路20号3栋1单元302号</span></li>
    <li><label>邮政编码</label><span></span></li>
    <li><label>移动电话</label><span></span></li>
     <li><label>固定电话</label><span></span></li>
   </ul>
 </div>-->
				</div>
				<form class="form" method="post"
					  action="${pageContext.request.contextPath}/shoppingTrolley/paymentOrderFrom">
					<fieldset>
						<!--快递选择-->
						<div class="express_delivery" style="width: 1160px;height: 167px">
							<div class="title_name">选择快递方式</div>

							<ul class="dowebok">
								<li><input type="radio" name="radio" data-labelauty="圆通快递">
									<div class="description">
										<em class="arrow"></em>
										<p>到付价格=现付价格*1.25
											，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
										<p>资费：15元</p>
										<p class="Note">满68元包邮</p>
										<p>
											<a href="#">点击查看是否在配送范围内</a>
										</p>
									</div></li>
								<li><input type="radio" name="radio" data-labelauty="中通快递">
									<div class="description">
										<em class="arrow"></em>
										<p>到付价格=现付价格*1.25
											，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
										<p>资费：15元</p>
										<p class="Note">满68元包邮</p>
									</div></li>
								<li><input type="radio" name="radio" data-labelauty="申通快递">
									<div class="description">
										<em class="arrow"></em>
										<p>到付价格=现付价格*1.25
											，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
										<p>资费：15元</p>
										<p class="Note">满68元包邮</p>
									</div></li>
								<li><input type="radio" name="radio"
										   data-labelauty="邮政EMS">
									<div class="description">
										<em class="arrow"></em>
										<p>到付价格=现付价格*1.25
											，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
										<p>资费：15元</p>
										<p class="Note">满68元包邮</p>
									</div></li>
								<li><input type="radio" name="radio" data-labelauty="城际快递">
									<div class="description">
										<em class="arrow"></em>
										<p>到付价格=现付价格*1.25
											，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
										<p>资费：同城包邮</p>

									</div></li>
								<li><input type="radio" name="radio" data-labelauty="韵达快递">
									<div class="description">
										<em class="arrow"></em>
										<p>到付价格=现付价格*1.25
											，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
										<p>资费：15元</p>
										<p class="Note">满68元包邮</p>
									</div></li>
								<li><input type="radio" name="radio" data-labelauty="国通快递">
									<div class="description">
										<em class="arrow"></em>
										<p>到付价格=现付价格*1.25
											，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
										<p>资费：15元</p>
										<p class="Note">满68元包邮</p>
									</div></li>
								<li><input type="radio" name="radio" data-labelauty="顺丰快递">
									<div class="description">
										<em class="arrow"></em>
										<p>到付价格=现付价格*1.25
											，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
										<p>资费：15元</p>
										<p class="Note">满88元包邮</p>
									</div></li>
								<li><input type="radio" name="radio" data-labelauty="邮政小包">
									<div class="description">
										<em class="arrow"></em>
										<p>到付价格=现付价格*1.25
											，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
										<p>资费：15元</p>
										<p class="Note">满68元包邮</p>
									</div></li>
								<li><input type="radio" name="radio" data-labelauty="天天快递">
									<div class="description">
										<em class="arrow"></em>
										<p>到付价格=现付价格*1.25
											，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
										<p>资费：15元</p>
										<p class="Note">满68元包邮</p>
									</div></li>
							</ul>

						</div>

						<!--付款方式-->
						<div class="payment">
							<div class="title_name">支付方式</div>
							<ul>
								<li><input type="radio" name="radio1"
										   data-labelauty="余额支付"></li>
								<li><input type="radio" name="radio1" data-labelauty="支付宝"></li>
								<li><input type="radio" name="radio1" data-labelauty="财付通"></li>
								<li><input type="radio" name="radio1"
										   data-labelauty="银联支付"></li>
								<li><input type="radio" name="radio1"
										   data-labelauty="货到付款"></li>
							</ul>
						</div>
						<!--发票样式-->
						<div class="invoice_style">
							<ul>
								<li class="invoice_left"><input name="" type="checkbox"
																value="" data-labelauty="是否开发票" /></li>
								<li class="invoice_left"><select name="somename"
																 class="SlectBox" onclick="console.log($(this).val())"
																 onchange="console.log('change is firing')">
									<option disabled="disabled" selected="selected">发票类型</option>
									<option value="办公用品">办公用品</option>
									<option value="食品">食品</option>
									<option value="20元红包">20元红包</option>
									<option value="50元红包">50元红包</option>
									<option value="100元红包">100元红包</option>
									<option value="200元红包">200元红包</option>
								</select></li>
								<li class="invoice_left">发票抬头 <input name="" type="text"
																	 class="text_info" /></li>
								<li class="invoice_left"><select name="somename"
																 class="SlectBox" onclick="console.log($(this).val())"
																 onchange="console.log('change is firing')">
									<option disabled="disabled" selected="selected">发票内容</option>
									<option value="办公用品">办公用品</option>
									<option value="食品">食品</option>
									<option value="数码配件">数码配件</option>
									<option value="电脑">电脑</option>
									<option value="手机">手机</option>
									<option value="200元红包">200元红包</option>
								</select></li>
							</ul>
						</div>
						<!--产品列表-->
						<div class="Product_List">
							<div class="envelopes">
								选择已有红包<select name="somename" class="SlectBox"
											  onclick="console.log($(this).val())"
											  onchange="console.log('change is firing')">
								<option disabled="disabled" selected="selected">选择红包金额</option>
								<!--placeholder-->
								<option value="5元红包">5元红包</option>
								<option value="10元红包">10元红包</option>
								<option value="20元红包">20元红包</option>
								<option value="50元红包">50元红包</option>
								<option value="100元红包">100元红包</option>
								<option value="200元红包">200元红包</option>
							</select> 或者输入红包序列号<input name="" type="text" class="text_number" /><input
									type="submit" class="verification_btn" value="验证序列号" />
							</div>
							<table>
								<thead>
								<tr class="title">
									<td class="name">商品名称</td>
									<td class="price">商品价格</td>
									<td class="Preferential">优惠价</td>
									<td class="Quantity">购买数量</td>
									<td class="Money">金额</td>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${trolleyList}" var="trolleyList">
									<tr class="commodity">
										<td class="Product_info"><a href="#"><img
												src="${ trolleyList.commodity.commodityImg}" width="100px"
												height="100px" /></a> <a href="#" class="product_name">${trolleyList.commodity.productName }</a>
										</td>
										<td><i>￥</i>${trolleyList.commodity.commodityPrice }</td>
										<td><i>￥</i>${trolleyList.commodity.commodityPrice }</td>
										<td>${trolleyList.count }</td>
										<td class="Moneys"><i>￥</i><i>${trolleyList.sum}</i></td>
									</tr>
								</c:forEach>
								<!-- <tr>
                                    <td class="Product_info"><a href="#"><img
                                            src="Product/p_11.jpg" width="100px" height="100px" /></a> <a
                                        href="#" class="product_name">麻阳冰糖橙子甜橙冰糖柑8斤新鲜水果甜过永兴冰糖橙赣南脐橙包邮</a>
                                    </td>
                                    <td><i>￥</i>123.00</td>
                                    <td><i>￥</i>112.00</td>
                                    <td>2</td>
                                    <td class="Moneys"><i>￥</i>224.00</td>
                                </tr> -->
								<!-- <tr>
                                    <td class="Product_info"><a href="#"><img
                                            src="Product/p_12.jpg" width="100px" height="100px" /></a> <a
                                        href="#" class="product_name">麻阳冰糖橙子甜橙冰糖柑8斤新鲜水果甜过永兴冰糖橙赣南脐橙包邮</a>
                                    </td>
                                    <td><i>￥</i>123.00</td>
                                    <td><i>￥</i>112.00</td>
                                    <td>2</td>
                                    <td class="Moneys"><i>￥</i>224.00</td>
                                </tr> -->
								</tbody>
							</table>
							<div class="Pay_info">
								<label>订单留言</label><input name="orderFromleave" type="text"
														  onkeyup="checkLength(this);" class="text_name " /> <span
									class="wordage">剩余字数：<span id="sy" style="color:Red;">50</span></span>
							</div>
							<!--价格-->
							<div class="price_style">
								<div class="right_direction">
									<ul>
										<li><label>商品总价</label><i>￥</i><span id='sum'></span></li>
										<input name="sum" type="hidden"/>
										<li><label>优惠金额</label><i>￥</i><span>-0</span></li>
										<li><label>配&nbsp;&nbsp;送&nbsp;&nbsp;费</label><i>￥</i><span>0</span></li>
										<li class="shiji_price"><label>实&nbsp;&nbsp;付&nbsp;&nbsp;款</label><i>￥</i><span></span></li>
									</ul>
									<div class="btn">
										<input name="submit" type="submit" value="提交订单"
											   class="submit_btn" /> <input name="" type="button"
																			value="返回购物车" class="return_btn" />
									</div>
									<!-- <div class="integral right">
                                        待订单确认后，你将获得<span>345</span>积分
                                    </div> -->
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<div class="slogen">
		<div class="index_style">
			<ul class="wrap">
				<li><a href="#"><img src="${pageContext.request.contextPath}/images/slogen_34.png"
									 data-bd-imgshare-binded="1"></a> <b>安全保证</b> <span>多重保障机制
							认证商城</span></li>
				<li><a href="#"><img src="${pageContext.request.contextPath}/images/slogen_28.png"
									 data-bd-imgshare-binded="2"></a> <b>正品保证</b> <span>正品行货
							放心选购</span></li>
				<li><a href="#"><img src="${pageContext.request.contextPath}/images/slogen_30.png"
									 data-bd-imgshare-binded="3"></a> <b>七天无理由退换</b> <span>七天无理由保障消费权益</span>
				</li>
				<li><a href="#"><img src="${pageContext.request.contextPath}/images/slogen_31.png"
									 data-bd-imgshare-binded="4"></a> <b>天天低价</b> <span>价格更低，质量更可靠</span>
				</li>
			</ul>
		</div>
	</div>
	<!--底部图层-->
	<div class="phone_style">
		<div class="index_style">
			<span class="phone_number"><em class="iconfont icon-dianhua"></em>400-4565-345</span><span
				class="phone_title">客服热线 7X24小时 贴心服务</span>
		</div>
	</div>
	<div class="footerbox clearfix">
		<div class="clearfix">
			<div class="">
				<dl>
					<dt>新手上路</dt>
					<dd>
						<a href="#">售后流程</a>
					</dd>
					<dd>
						<a href="#">购物流程</a>
					</dd>
					<dd>
						<a href="#">订购方式</a>
					</dd>
					<dd>
						<a href="#">隐私声明 </a>
					</dd>
					<dd>
						<a href="#">推荐分享说明 </a>
					</dd>
				</dl>
				<dl>
					<dt>配送与支付</dt>
					<dd>
						<a href="#">保险需求测试</a>
					</dd>
					<dd>
						<a href="#">专题及活动</a>
					</dd>
					<dd>
						<a href="#">挑选保险产品</a>
					</dd>
					<dd>
						<a href="#">常见问题 </a>
					</dd>
				</dl>
				<dl>
					<dt>售后保障</dt>
					<dd>
						<a href="#">保险需求测试</a>
					</dd>
					<dd>
						<a href="#">专题及活动</a>
					</dd>
					<dd>
						<a href="#">挑选保险产品</a>
					</dd>
					<dd>
						<a href="#">常见问题 </a>
					</dd>
				</dl>
				<dl>
					<dt>支付方式</dt>
					<dd>
						<a href="#">保险需求测试</a>
					</dd>
					<dd>
						<a href="#">专题及活动</a>
					</dd>
					<dd>
						<a href="#">挑选保险产品</a>
					</dd>
					<dd>
						<a href="#">常见问题 </a>
					</dd>
				</dl>
				<dl>
					<dt>帮助中心</dt>
					<dd>
						<a href="#">保险需求测试</a>
					</dd>
					<dd>
						<a href="#">专题及活动</a>
					</dd>
					<dd>
						<a href="#">挑选保险产品</a>
					</dd>
					<dd>
						<a href="#">常见问题 </a>
					</dd>
				</dl>
			</div>
		</div>
		<div class="text_link">
			<p>
				<a href="#">关于我们</a>｜ <a href="#">公开信息披露</a>｜ <a href="#">加入我们</a>｜
				<a href="#">联系我们</a>｜ <a href="#">版权声明</a>｜ <a href="#">隐私声明</a>｜ <a
					href="#">网站地图</a>
			</p>
			<p>蜀ICP备11017033号 Copyright ©2011 成都福际生物技术有限公司 All Rights
				Reserved. Technical support:CDDGG Group</p>
		</div>
	</div>
	<!--右侧菜单栏购物车样式-->
	<div class="fixedBox">
		<ul class="fixedBoxList">
			<li class="fixeBoxLi user"><a href="${pageContext.request.contextPath}/profile"> <span
					class="fixeBoxSpan iconfont icon-yonghu"></span> <strong>用户</strong></a>
			</li>
			<li class="fixeBoxLi cart_bd" style="display:block;" id="cartboxs">
				<a href="${pageContext.request.contextPath}/shoppingTrolley/queryShoppingTrolley"><p class="good_cart">${commodityCount}</p> <span
						class="fixeBoxSpan iconfont icon-cart"></span> <strong>购物车</strong>
					<div class="cartBox">
						<div class="bjfff"></div>
						<div class="message">购物车内暂无商品，赶紧选购吧</div>
					</div></a>
			</li>
			<li class="fixeBoxLi Service "><span
					class="fixeBoxSpan iconfont icon-service"></span> <strong>客服</strong>
				<div class="ServiceBox">
					<div class="bjfffs"></div>
					<dl onclick="javascript:;">
						<dt>
							<img src="${pageContext.request.contextPath}/images/Service1.png">
						</dt>
						<dd>
							<strong>QQ客服1</strong>
							<p class="p1">9:00-22:00</p>
							<p class="p2">
								<a
										href="http://wpa.qq.com/msgrd?v=3&amp;uin=123456&amp;site=DGG三端同步&amp;menu=yes">点击交谈</a>
							</p>
						</dd>
					</dl>
					<dl onclick="javascript:;">
						<dt>
							<img src="${pageContext.request.contextPath}/images/Service1.png">
						</dt>
						<dd>
							<strong>QQ客服1</strong>
							<p class="p1">9:00-22:00</p>
							<p class="p2">
								<a
										href="http://wpa.qq.com/msgrd?v=3&amp;uin=123456&amp;site=DGG三端同步&amp;menu=yes">点击交谈</a>
							</p>
						</dd>
					</dl>
				</div></li>
			<li class="fixeBoxLi code cart_bd " style="display:block;"
				id="cartboxs"><span class="fixeBoxSpan iconfont icon-erweima"></span>
				<strong>微信</strong>
				<div class="cartBox">
					<div class="bjfff"></div>
					<div class="QR_code">
						<p>
							<img src="${pageContext.request.contextPath}/images/erweim.jpg" width="150px" height="150px"
								 style=" margin-top:10px;" />
						</p>
						<p>微信扫一扫，关注我们</p>
					</div>
				</div></li>

			<li class="fixeBoxLi Home"><a href="${pageContext.request.contextPath}/shoppingCollection/commodityList"> <span
					class="fixeBoxSpan iconfont  icon-shoucang"></span> <strong>收藏</strong>
			</a></li>
			<li class="fixeBoxLi Home"><a href="./"> <span
					class="fixeBoxSpan iconfont  icon-zuji"></span> <strong>足迹</strong>
			</a></li>
			<li class="fixeBoxLi Home"><a href="./"> <span
					class="fixeBoxSpan iconfont  icon-fankui"></span> <strong>反馈</strong>
			</a></li>
			<li class="fixeBoxLi BackToTop"><span
					class="fixeBoxSpan iconfont icon-top"></span> <strong>返回顶部</strong>
			</li>
		</ul>
	</div>
	<script type="text/javascript">
		function checkLength(which) {
			var maxChars = 50; //
			if (which.value.length > maxChars) {
				alert("您出入的字数超多限制!");
				// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
				which.value = which.value.substring(0, maxChars);
				return false;
			} else {
				var curr = maxChars - which.value.length; //250 减去 当前输入的
				document.getElementById("sy").innerHTML = curr.toString();
				return true;
			}
		}
	</script>
	<script>
		$(function() {

			$(".form").submit(function(){
				var name=$('.user_address li').eq(0).text();
				if(name=='' || name==undefined)
				{
					$.sendWarningToTop('收货地址不能为空', 3000, function() {
						console.log('sendWarningToTop closed');
					});
					return false;
				}
				return true;
			});

			$(':input').labelauty();
			$('.dowebok li').click(expressage);
			/*******判断是哪家快递********/
			function expressage(){
				$('.dowebok li').each(function(index,dom){
					var _class=$(dom).html();
					console.log(_class);
				});
			}
			/*******计算总价*******/
			function sum() {
				var sum = 0;

				$('.commodity').each(function() {
					sum += parseInt($(this).children('.Moneys').children('i').eq(1).text());//获取每个商品的总价
				})
				$('#sum').text(sum);
				$('.shiji_price').find('span').text(sum);
				$('input[name=sum]').val(sum);
			}
			sum();
		});
	</script>
</body>
</html>
