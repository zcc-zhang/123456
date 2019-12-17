<%@ page language="java" import="java.util.*"
		 contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/fonts/iconfont.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/common_js.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/footer.js" type="text/javascript"></script>
	<title>商城首页</title>
</head>
<body>
<!--顶部广告-->
<div class="p_f_name infonav_hidden"
	 style="background:url(${pageContext.request.contextPath}/images/top_AD_01.png) no-repeat; background-position:center; height:436px; width:100%">
	<div class="Menu_style">
		<p class="infonav_mores">
			<a href="#" class="more" href="javascript:"
			   onclick="infonav_more_down(0);return false;"><em
					class="iconfont icon-close2"></em></a>
		</p>
	</div>
</div>
<!--悬浮广告-->
<div class="mod_qr">
	<a href="#" class="mod_qr_bd"><img src="${pageContext.request.contextPath}/images/AD-p-3.jpg" /></a> <a
		href="javascript:void(0);" id="close" class="fixed_qr_close"><em
		class="iconfont icon-close2"></em></a>
</div>
<!--做成悬浮菜单样式-->
<div class="Suspension" id="left_nav">
	<div class="Suspension_top"></div>
	<div class="Suspension_menu">
		<ul>
			<li><a href="#" class="">每日必看</a></li>
			<li><a href="#" class="">爆款榜</a></li>
			<li><a href="#" class="">上新单品</a></li>
			<li><a href="#" class="">品牌团购</a></li>
		</ul>
	</div>
	<div class=""></div>
</div>

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
						<a href="${pageContext.request.contextPath }/shoppingTrolleyList">购物车</a>
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
				<em class="iconfont icon-cart2"></em><a href="${paheContext.request.contextPath}/shoppingTrolleyList">我的购物车</a> <i
					class="ci-right">&gt;</i><i class="ci-count" id="shopping-amount">${commodityCount}</i>
			</div>
			<div class="dorpdown-layer">
				<div class="spacer"></div>
				<!--<div class="prompt"></div><div class="nogoods"><b></b>购物车中还没有商品，赶紧选购吧！</div>-->
				<!-- <ul class="p_s_list">
						<li>
							<div class="img">
								<img src="${pageContext.request.contextPath}/images3/O1CN01EolndW1WKFGRmdAtc_!!0-item_pic.jpg_250x250.jpg_.webp.jpg">
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
					</ul> -->
				<!-- <div class="Shopping_style">
                    <div class="p-total">
                        共<b>1</b>件商品 共计<strong>￥55.00</strong>
                    </div>
                    <a href="#" title="去购物车结算" id="btn-payforgoods" class="Shopping">去购物车结算</a>
                </div> -->
			</div>
		</div>
	</div>
	<!--菜单导航样式-->
	<div id="Menu" class="clearfix">
		<div class="index_style clearfix">
			<div id="allSortOuterbox">
				<div class="t_menu_img"></div>
				<div class="Category">
					<a href="#"><em></em>所有产品分类</a>
				</div>
				<div class="hd_allsort_out_box_new">
					<!--左侧栏目开始-->
					<ul class="Menu_list">
						<li class="name">
							<div class="Menu_name">
								<a href="product_list.html">面部护理</a> <span></span>
							</div>
							<div class="link_name">
								<p>
									<a href="Product_Detailed.html">面膜</a> <a href="#">洁面</a> <a
										href="#">防晒隔离</a> <a href="#">眼霜</a>
								</p>
							</div>
							<div class="menv_Detail">
								<div class="cat_pannel clearfix">
									<div class="hd_sort_list">
										<dl class="clearfix" data-tpc="1">
											<dt>
												<a href="#">面膜<i></i></a>
											</dt>
											<dd>
												<a href="#">撕拉面膜</a><a href="#">面膜贴</a><a href="#">免洗面膜</a><a
													href="#">水洗面膜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="2">
											<dt>
												<a href="#">洁面<i></i></a>
											</dt>
											<dd>
												<a href="#">洁面摩丝</a><a href="#">洁面乳 </a><a href="#">洁面啫哩/胶</a><a
													href="#">面部去角质/磨砂</a><a href="#">洁面膏/霜</a><a href="#">洁肤皂</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="3">
											<dt>
												<a href="#">化妆水<i></i></a>
											</dt>
											<dd>
												<a href="#"> 喷雾</a><a href="#"> 精华水</a><a href="#"> 柔肤水</a><a
													href="#">爽肤水</a><a href="#">收敛水/紧肤水</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">眼部护理<i></i></a>
											</dt>
											<dd>
												<a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a
													href="#">眼霜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">防晒<i></i></a>
											</dt>
											<dd>
												<a href="#"> 防嗮喷雾</a><a href="#"> 防晒霜</a><a href="#">防晒露</a><a
													href="#">防晒乳</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">唇部护理<i></i></a>
											</dt>
											<dd>
												<a href="#"> 润唇膏</a><a href="#">口红</a><a href="#">唇膜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">乳液/面霜<i></i></a>
											</dt>
											<dd>
												<a href="#"> 乳液</a><a href="#"> 面霜</a><a href="#">按摩霜</a><a
													href="#">面部啫喱</a><a href="#">凝露/凝胶</a>
											</dd>
										</dl>
									</div>
									<div class="Brands">
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/34.jpg" /></a> <a href="#"
																													   class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/42.jpg" /></a> <a
											href="#" class="logo_Brands"><img
											src="${pageContext.request.contextPath}/product/logo/152.jpg" /></a> <a href="#"
																													class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/156.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/458.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/339.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/245.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/199.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/618.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/644.jpg" /></a>
										<a href="#" class="AD_3"><img src="${pageContext.request.contextPath}/product/ad/2.jpg" /></a>
									</div>
								</div>
								<!--品牌-->
							</div>
						</li>
						<li class="name">
							<div class="Menu_name">
								<a href="#">身体护理</a><span></span>
							</div>
							<div class="link_name">
								<a href="Product_Detailed.html"> 洗发水</a><a href="#">沐浴露</a><a
									href="#">护发素</a><a href="#">护手霜</a>
							</div>
							<div class="menv_Detail">
								<div class="cat_pannel clearfix">
									<div class="hd_sort_list">
										<dl class="clearfix" data-tpc="1">
											<dt>
												<a href="#">洗发护发<i></i></a>
											</dt>
											<dd>
												<a href="#">洗发水</a><a href="#">护发露</a><a href="#">发膜</a><a
													href="#">精油</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="2">
											<dt>
												<a href="#">沐浴露<i></i></a>
											</dt>
											<dd>
												<a href="#">六神沐浴露</a><a href="#">男士沐浴露</a><a href="#">力士沐浴露</a><a
													href="#">沐浴露套装</a><a href="#">阿德达斯沐浴露</a><a href="#">多芬沐浴露</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="3">
											<dt>
												<a href="#">护发素<i></i></a>
											</dt>
											<dd>
												<a href="#"> 深层滋养</a><a href="#"> 乌黑亮泽</a><a href="#">
												清爽</a><a href="#">头皮护理</a><a href="#">损伤修复</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">护手霜<i></i></a>
											</dt>
											<dd>
												<a href="#"> 亮白</a><a href="#"> 修复</a><a href="#">舒缓护肤</a><a
													href="#">补水保湿</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">足部护理<i></i></a>
											</dt>
											<dd>
												<a href="#"> 护脚膏</a><a href="#"> 足贴</a><a href="#">脚膜</a><a
													href="#">脚霜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">口腔护理<i></i></a>
											</dt>
											<dd>
												<a href="#"> 凝胶</a><a href="#"> 牙线</a><a href="#">漱口水</a><a
													href="#">牙膏</a>
											</dd>
										</dl>
									</div>
									<div class="Brands">
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/34.jpg" /></a> <a href="#"
																													   class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/42.jpg" /></a> <a
											href="#" class="logo_Brands"><img
											src="${pageContext.request.contextPath}/product/logo/152.jpg" /></a> <a href="#"
																													class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/156.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/458.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/339.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/245.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/199.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/618.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/644.jpg" /></a>
										<a href="#" class="AD_3"><img src="${pageContext.request.contextPath}/product/ad/2.jpg" /></a>
									</div>
								</div>
							</div>
						</li>
						<li class="name">
							<div class="Menu_name">
								<a href="#">香水彩妆</a><span></span>
							</div>
							<div class="link_name">
								<a href="#">男士香水 </a><a href="#">彩妆</a><a href="#">女士香水</a>
								<!--  <a href="#">BB</a><a href="#">眼影</a><a href="#">腮红</a>-->

							</div>
							<div class="menv_Detail">
								<div class="cat_pannel clearfix">
									<div class="hd_sort_list">
										<dl class="clearfix" data-tpc="1">
											<dt>
												<a href="#">男士香水<i></i></a>
											</dt>
											<dd>
												<a href="#">花香调</a><a href="#">古龙香调</a><a href="#">东方香调</a><a
													href="#">混合香调</a><a href="#">海洋香调</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="2">
											<dt>
												<a href="#">女士香水<i></i></a>
											</dt>
											<dd>
												<a href="#">琥珀香调</a><a href="#">森林香调 </a><a href="#">花果香调</a><a
													href="#">淡香精</a><a href="#">浓香精</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="3">
											<dt>
												<a href="#">化妆水<i></i></a>
											</dt>
											<dd>
												<a href="#"> 喷雾</a><a href="#"> 精华水</a><a href="#"> 柔肤水</a><a
													href="#">爽肤水</a><a href="#">收敛水/紧肤水</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">BB/CC霜<i></i></a>
											</dt>
											<dd>
												<a href="#"> 哑光</a><a href="#"> 自然</a><a href="#">光泽</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">粉底<i></i></a>
											</dt>
											<dd>
												<a href="#"> 亮白</a><a href="#"> 遮瑕</a><a href="#">防嗮</a><a
													href="#">防水</a><a href="#">锁色</a><a href="#">隔离</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">腮红<i></i></a>
											</dt>
											<dd>
												<a href="#"> 红润起色</a><a href="#"> 提升气色</a><a href="#">提升肤色</a><a
													href="#">收敛毛孔</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">眼线<i></i></a>
											</dt>
											<dd>
												<a href="#"> 纤长</a><a href="#"> 不易脱妆</a><a href="#">修饰轮框</a><a
													href="#">眼部造型</a><a href="#">控油</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">睫毛膏<i></i></a>
											</dt>
											<dd>
												<a href="#"> 霜状</a><a href="#"> 膏状</a><a href="#">液体</a>
											</dd>
										</dl>
									</div>
									<div class="Brands">
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/34.jpg" /></a> <a href="#"
																													   class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/42.jpg" /></a> <a
											href="#" class="logo_Brands"><img
											src="${pageContext.request.contextPath}/product/logo/152.jpg" /></a> <a href="#"
																													class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/156.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/458.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/339.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/245.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/199.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/618.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/644.jpg" /></a>
										<a href="#" class="AD_3"><img src="${pageContext.request.contextPath}/product/ad/2.jpg" /></a>
									</div>
								</div>
							</div>
						</li>
						<li class="name">
							<div class="Menu_name">
								<a href="#">洗发护发</a><span></span>
							</div>
							<div class="link_name">
								<a href="#">洗发</a><a href="#">护发</a><a href="#">沐浴</a><a
									href="#">润肤乳</a>
							</div>
							<div class="menv_Detail">
								<div class="cat_pannel clearfix">
									<div class="hd_sort_list">
										<dl class="clearfix" data-tpc="1">
											<dt>
												<a href="#">洗发<i></i></a>
											</dt>
											<dd>
												<a href="#">洗发皂</a><a href="#">护发精油</a><a href="#">洗护发套装</a><a
													href="#">发膜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="2">
											<dt>
												<a href="#">沐浴<i></i></a>
											</dt>
											<dd>
												<a href="#"> 亮白</a><a href="#"> 清洁</a><a href="#"> 清爽</a><a
													href="#">渗透防护</a><a href="#">舒缓护肤</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="3">
											<dt>
												<a href="#">润肤乳<i></i></a>
											</dt>
											<dd>
												<a href="#"> 补水</a><a href="#"> 杀菌</a><a href="#"> 去角质</a><a
													href="#">抑菌</a><a href="#">控油</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">乳液/面霜<i></i></a>
											</dt>
											<dd>
												<a href="#"> 乳液</a><a href="#"> 面霜</a><a href="#">按摩霜</a><a
													href="#">面部啫喱</a><a href="#">凝露/凝胶</a>
											</dd>
										</dl>
									</div>
									<div class="Brands">
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/34.jpg" /></a> <a href="#"
																													   class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/42.jpg" /></a> <a
											href="#" class="logo_Brands"><img
											src="${pageContext.request.contextPath}/product/logo/152.jpg" /></a> <a href="#"
																													class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/156.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/458.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/339.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/245.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/199.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/618.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/644.jpg" /></a>
										<a href="#" class="AD_3"><img src="${pageContext.request.contextPath}/product/ad/2.jpg" /></a>
									</div>
								</div>
							</div>
						</li>
						<li class="name">
							<div class="Menu_name">
								<a href="#">女性护理</a><span></span>
							</div>
							<div class="link_name">
								<a href="#">洁面</a><a href="#">面部护肤</a><a href="#">乳液</a> <a
									href="#"> 面霜</a>
							</div>
							<div class="menv_Detail">
								<div class="cat_pannel clearfix">
									<div class="hd_sort_list">
										<dl class="clearfix" data-tpc="1">
											<dt>
												<a href="#">面膜<i></i></a>
											</dt>
											<dd>
												<a href="#">撕拉面膜</a><a href="#">面膜贴</a><a href="#">免洗面膜</a><a
													href="#">水洗面膜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="2">
											<dt>
												<a href="#">洁面<i></i></a>
											</dt>
											<dd>
												<a href="#">洁面摩丝</a><a href="#">洁面乳 </a><a href="#">洁面啫哩/胶</a><a
													href="#">面部去角质/磨砂</a><a href="#">洁面膏/霜</a><a href="#">洁肤皂</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="3">
											<dt>
												<a href="#">化妆水<i></i></a>
											</dt>
											<dd>
												<a href="#"> 喷雾</a><a href="#"> 精华水</a><a href="#"> 柔肤水</a><a
													href="#">爽肤水</a><a href="#">收敛水/紧肤水</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">眼部护理<i></i></a>
											</dt>
											<dd>
												<a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a
													href="#">眼霜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">眼部护理<i></i></a>
											</dt>
											<dd>
												<a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a
													href="#">眼霜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">防晒<i></i></a>
											</dt>
											<dd>
												<a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a
													href="#">眼霜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">唇部护理<i></i></a>
											</dt>
											<dd>
												<a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a
													href="#">眼霜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">乳液/面霜<i></i></a>
											</dt>
											<dd>
												<a href="#"> 乳液</a><a href="#"> 面霜</a><a href="#">按摩霜</a><a
													href="#">面部啫喱</a><a href="#">凝露/凝胶</a>
											</dd>
										</dl>
									</div>
									<div class="Brands">
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/34.jpg" /></a> <a href="#"
																													   class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/42.jpg" /></a> <a
											href="#" class="logo_Brands"><img
											src="${pageContext.request.contextPath}/product/logo/152.jpg" /></a> <a href="#"
																													class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/156.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/458.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/339.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/245.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/199.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/618.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/644.jpg" /></a>
										<a href="#" class="AD_3"><img src="${pageContext.request.contextPath}/product/ad/2.jpg" /></a>
									</div>
								</div>
							</div>
						</li>
						<li class="name">
							<div class="Menu_name">
								<a href="#">男性护理</a><span></span>
							</div>
							<div class="link_name">
								<a href="#">男士香水</a><a href="#">面部护理</a><a href="#">男士面膜</a>
							</div>
							<div class="menv_Detail">
								<div class="cat_pannel clearfix">
									<div class="hd_sort_list">
										<dl class="clearfix" data-tpc="1">
											<dt>
												<a href="#">男士香水<i></i></a>
											</dt>
											<dd>
												<a href="#">香膏</a><a href="#">淡香水</a><a href="#">浓香水</a><a
													href="#">清淡香水</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="2">
											<dt>
												<a href="#">洁面<i></i></a>
											</dt>
											<dd>
												<a href="#">洁面摩丝</a><a href="#">洁面乳 </a><a href="#">洁面啫哩/胶</a><a
													href="#">面部去角质/磨砂</a><a href="#">洁面膏/霜</a><a href="#">洁肤皂</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">眼部护理<i></i></a>
											</dt>
											<dd>
												<a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a
													href="#">眼霜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">眼部护理<i></i></a>
											</dt>
											<dd>
												<a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a
													href="#">眼霜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">防晒<i></i></a>
											</dt>
											<dd>
												<a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a
													href="#">眼霜</a>
											</dd>
										</dl>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">乳液/面霜<i></i></a>
											</dt>
											<dd>
												<a href="#"> 乳液</a><a href="#"> 面霜</a><a href="#">按摩霜</a><a
													href="#">面部啫喱</a><a href="#">凝露/凝胶</a>
											</dd>
										</dl>
									</div>
									<div class="Brands">
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/34.jpg" /></a> <a href="#"
																													   class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/42.jpg" /></a> <a
											href="#" class="logo_Brands"><img
											src="${pageContext.request.contextPath}/product/logo/152.jpg" /></a> <a href="#"
																													class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/156.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/458.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/339.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/245.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/199.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/618.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/644.jpg" /></a>
										<a href="#" class="AD_3"><img src="${pageContext.request.contextPath}/product/ad/2.jpg" /></a>
									</div>
								</div>
							</div>
						</li>
						<li class="name">
							<div class="Menu_name">
								<a href="#">推荐品牌</a><span></span>
							</div>
							<div class="link_name">
								<a href="#">欧莱雅</a><a href="#"> 菲诗小铺</a><a href="#"> 雅诗兰黛</a>
							</div>
							<div class="menv_Detail">
								<div class="cat_pannel clearfix">
									<div class="hd_sort_list">
										<dl class="clearfix" data-tpc="1">
											<dt>
												<a href="#">面部护肤套装<i></i></a>
											</dt>
											<dd>
												<a href="#">亮白</a><a href="#">深层清洁</a><a href="#">提亮肤色</a><a
													href="#">修复</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="2">
											<dt>
												<a href="#">洁面<i></i></a>
											</dt>
											<dd>
												<a href="#">洁面摩丝</a><a href="#">洁面乳 </a><a href="#">洁面啫哩/胶</a><a
													href="#">面部去角质/磨砂</a><a href="#">洁面膏/霜</a><a href="#">洁肤皂</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="3">
											<dt>
												<a href="#">化妆水<i></i></a>
											</dt>
											<dd>
												<a href="#"> 喷雾</a><a href="#"> 精华水</a><a href="#"> 柔肤水</a><a
													href="#">爽肤水</a><a href="#">收敛水/紧肤水</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">眼部护理<i></i></a>
											</dt>
											<dd>
												<a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a
													href="#">眼霜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">眼部护理<i></i></a>
											</dt>
											<dd>
												<a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a
													href="#">眼霜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">防晒<i></i></a>
											</dt>
											<dd>
												<a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a
													href="#">眼霜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">唇部护理<i></i></a>
											</dt>
											<dd>
												<a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a
													href="#">眼霜</a>
											</dd>
										</dl>
										<dl class="clearfix" data-tpc="4">
											<dt>
												<a href="#">乳液/面霜<i></i></a>
											</dt>
											<dd>
												<a href="#"> 乳液</a><a href="#"> 面霜</a><a href="#">按摩霜</a><a
													href="#">面部啫喱</a><a href="#">凝露/凝胶</a>
											</dd>
										</dl>
									</div>
									<div class="Brands">
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/34.jpg" /></a> <a href="#"
																													   class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/42.jpg" /></a> <a
											href="#" class="logo_Brands"><img
											src="${pageContext.request.contextPath}/product/logo/152.jpg" /></a> <a href="#"
																													class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/156.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/458.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/339.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/245.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/199.jpg" /></a>
										<a href="#" class="logo_Brands"><img
												src="${pageContext.request.contextPath}/product/logo/618.jpg" /></a> <a href="#"
																														class="logo_Brands"><img src="${pageContext.request.contextPath}/product/logo/644.jpg" /></a>
										<a href="#" class="AD_3"><img src="${pageContext.request.contextPath}/product/ad/2.jpg" /></a>
									</div>
								</div>
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
					<li><a href="${pageContext.request.contextPath}/browsingHistoryServlet">我的足迹</a></li>
					<li><a href="${pageContext.request.contextPath}/Must_see.jsp">每日必看</a></li>
					<li><a href="${pageContext.request.contextPath}/showCommodityListServlet">产品列表</a></li>
					<li><a href="${pageContext.request.contextPath}/Buy_Brands.jsp">限时团购</a></li>
					<li><a href="${pageContext.request.contextPath}/Group_buy.jsp">品牌团购</a></li>
					<li><a href="#">联系我们</a></li>
					<li><a href="${pageContext.request.contextPath}/index.jsp">简洁版</a></li>
				</ul>
			</div>
			<script>$("#Navigation").slide({
				titCell : ".Navigation_name li"
			});
			</script>
			<a href="#" class="link_bg"><img src="${pageContext.request.contextPath}/images/link_bg_03.png" /></a>
		</div>
	</div>
</div>
<!--幻灯片样式-->
<div id="slideBox" class="slideBox">
	<div class="hd">
		<ul class="smallUl"></ul>
	</div>
	<div class="bd">
		<ul>
			<li><a href="#" target="_blank"><div
					style="background:url(${pageContext.request.contextPath}/images2/TB1Gq5ufVY7gK0jSZKzSuuikpXa.jpg) no-repeat; background-position:center; width:100%; height:460px;"></div></a></li>
			<li><a href="#" target="_blank"><div
					style="background:url(${pageContext.request.contextPath}/images/AD-02.jpg) no-repeat rgb(207, 231, 255); background-position:center ; width:100%; height:460px;"></div></a></li>
			<li><a href="#" target="_blank"><div
					style="background:url(${pageContext.request.contextPath}/images/AD-03.jpg) no-repeat; background-position:center; width:100%; height:460px;"></div></a></li>
			<li><a href="#" target="_blank"><div
					style="background:url(${pageContext.request.contextPath}/images/AD-01.jpg) no-repeat #f7ddea; background-position:center; width:100%; height:460px;"></div></a></li>
			<li><a href="#" target="_blank"><div
					style="background:url(${pageContext.request.contextPath}/images/AD-04.jpg) no-repeat #e0f4ff; background-position:center; width:100%; height:460px;"></div></a></li>
		</ul>
	</div>
	<!-- 下面是前/后按钮代码，如果不需要删除即可 -->
	<a class="prev" href="javascript:void(0)"></a> <a class="next"
													  href="javascript:void(0)"></a>

</div>
<script type="text/javascript">
	jQuery(".slideBox").slide({
		titCell : ".hd ul",
		mainCell : ".bd ul",
		autoPlay : true,
		autoPage : true
	});
</script>
</div>
<div class="index_style clearfix">
	<!--广告-->
	<div class="p_Deals">
		<div class="Deals_title">
			<div class="title_name">
				<h1>美妆特卖</h1>
				<h2>-大牌火热热卖中-</h2>
			</div>
			<img src="${pageContext.request.contextPath}/images/AD-bg1_10.png" />
		</div>
		<div class="Deals_list">
			<ul class="products">
				<li><a href="#"><img src="${pageContext.request.contextPath}/images/AD-p-1.jpg" /><img
						src="${pageContext.request.contextPath}/images/title_img_13.png" class="title" /></a></li>
				<li><a href="#"><img src="${pageContext.request.contextPath}/images/AD-p-2.jpg" /><img
						src="${pageContext.request.contextPath}/images/title_img_14.png" class="title" /></a></li>
				<li><a href="#"><img src="${pageContext.request.contextPath}/images/AD-p-3.jpg" /><img
						src="${pageContext.request.contextPath}/images/title_img_15.png" class="title" /></a></li>
				<li><a href="#"><img src="${pageContext.request.contextPath}/images/AD-p-4.jpg" /><img
						src="${pageContext.request.contextPath}/images/title_img_16.png" class="title" /></a></li>
			</ul>
		</div>
	</div>
	<!--限时特卖-->
	<div class="Limit_p">
		<div class="Limit_title">
			<img src="${pageContext.request.contextPath}/images/Limit_img_20.png" />
			<div class="title_name">
				<h1>限时团购</h1>
				<h2>LIMIT BUY</h2>
				<h3>品牌限时优惠促销</h3>
			</div>
		</div>
		<div class="Limit_list">
			<ul class="p_t_list">
				<li><a href="#"><span>御泥坊 玫瑰滋养+红石榴亮颜美肤套装 </span><img
						src="${pageContext.request.contextPath}/product/p_9.jpg" width="180" height="170" /></a></li>
				<li><a href="#"><span>御泥坊 玫瑰滋养+红石榴亮颜美肤套装 </span><img
						src="${pageContext.request.contextPath}/product/p_7.jpg" width="180" height="170" /></a></li>
				<li><a href="#"><span>御泥坊 玫瑰滋养+红石榴亮颜美肤套装 </span><img
						src="${pageContext.request.contextPath}/product/p_11.jpg" width="180" height="170" /></a></li>

				<li><a href="#"><span>御泥坊 玫瑰滋养+红石榴亮颜美肤套装 </span><img
						src="${pageContext.request.contextPath}/product/p_19.jpg" width="180" height="170" /></a></li>
				<li><a href="#"><span>御泥坊 玫瑰滋养+红石榴亮颜美肤套装 </span><img
						src="${pageContext.request.contextPath}/product/p_29.jpg" width="180" height="170" /></a></li>
				<li><a href="#"><span>御泥坊 玫瑰滋养+红石榴亮颜美肤套装 </span><img
						src="${pageContext.request.contextPath}/product/p_20.jpg" width="180" height="170" /></a></li>
				<li class="Limit_name"><a href="#"><img
						src="${pageContext.request.contextPath}/images/bg_p_23.png" width="243" height="399" /></a></li>
			</ul>
		</div>
	</div>
	<!--品牌展示-->
	<div class="Brand_Show" id="Brand_Show">
		<div class="parHd  Toggle">
			<ul>
				<li>国际大牌<em></em></li>
				<li>推荐品牌<em></em></li>
				<li>国货精品<em></em></li>
			</ul>
		</div>
		<div class="parBd list">
			<div class="parBdIn">
				<ul>
					<li class="brand_list"><a href="#" class="brand_logo"><img
							src="${pageContext.request.contextPath}/product/logo/34.jpg" width="160" /><span>欧珀莱</span></a> <a
							href="#" class="brand_logo"><img src="${pageContext.request.contextPath}/product/logo/42.jpg"
															 width="160" /><span>欧珀莱</span></a> <a href="#" class="brand_logo"><img
							src="${pageContext.request.contextPath}/product/logo/152.jpg" width="160" /><span>欧珀莱</span></a> <a
							href="#" class="brand_logo"><img src="${pageContext.request.contextPath}/product/logo/156.jpg"
															 width="160" /><span>欧珀莱</span></a> <a href="#" class="brand_logo"><img
							src="${pageContext.request.contextPath}/product/logo/199.jpg" width="160" /><span>欧珀莱</span></a> <a
							href="#" class="brand_logo"><img src="${pageContext.request.contextPath}/product/logo/245.jpg"
															 width="160" /><span>欧珀莱</span></a> <a href="#" class="brand_logo"><img
							src="${pageContext.request.contextPath}/product/logo/339.jpg" width="160" /><span>欧珀莱</span></a> <a
							href="#" class="brand_logo"><img src="${pageContext.request.contextPath}/product/logo/458.jpg"
															 width="160" /><span>欧珀莱</span></a> <a href="#" class="brand_logo"><img
							src="${pageContext.request.contextPath}/product/logo/618.jpg" width="160" /><span>欧珀莱</span></a> <a
							href="#" class="brand_logo"><img src="${pageContext.request.contextPath}/product/logo/644.jpg"
															 width="160" /><span>欧珀莱</span></a></li>
					<li class="brand_ad">
						<div class="AD_slideBox" id="AD_slideBox">
							<div class="hd">
								<ul></ul>
							</div>
							<div class="bd">
								<ul>
									<li><a href="#"><img src="${pageContext.request.contextPath}/images/AD.png" /></a></li>
									<li><a href="#"><img src="${pageContext.request.contextPath}/images/AD1.jpg" /></a></li>
									<li><a href="#"><img src="${pageContext.request.contextPath}/images/AD2.jpg" /></a></li>
								</ul>
							</div>
						</div> <script type="text/javascript">
						jQuery(".AD_slideBox").slide({
							titCell : ".hd ul",
							mainCell : ".bd ul",
							autoPlay : true,
							autoPage : true,
							interTime : 5000
						});
					</script>
					</li>
				</ul>
				<ul>
					<li class="brand_list"><a href="#" class="brand_logo"><img
							src="${pageContext.request.contextPath}/product/logo/34.jpg" width="160" /><span>欧珀莱</span></a> <a
							href="#" class="brand_logo"><img src="${pageContext.request.contextPath}/product/logo/42.jpg"
															 width="160" /><span>欧珀莱</span></a> <a href="#" class="brand_logo"><img
							src="${pageContext.request.contextPath}/product/logo/152.jpg" width="160" /><span>欧珀莱</span></a> <a
							href="#" class="brand_logo"><img src="${pageContext.request.contextPath}/product/logo/156.jpg"
															 width="160" /><span>欧珀莱</span></a> <a href="#" class="brand_logo"><img
							src="${pageContext.request.contextPath}/product/logo/199.jpg" width="160" /><span>欧珀莱</span></a> <a
							href="#" class="brand_logo"><img src="${pageContext.request.contextPath}/product/logo/245.jpg"
															 width="160" /><span>欧珀莱</span></a> <a href="#" class="brand_logo"><img
							src="${pageContext.request.contextPath}/product/logo/339.jpg" width="160" /><span>欧珀莱</span></a> <a
							href="#" class="brand_logo"><img src="${pageContext.request.contextPath}/product/logo/458.jpg"
															 width="160" /><span>欧珀莱</span></a> <a href="#" class="brand_logo"><img
							src="${pageContext.request.contextPath}/product/logo/618.jpg" width="160" /><span>欧珀莱</span></a> <a
							href="#" class="brand_logo"><img src="${pageContext.request.contextPath}/product/logo/644.jpg"
															 width="160" /><span>欧珀莱</span></a></li>
				</ul>
				<ul>
					<li class="brand_list"><a href="#" class="brand_logo"><img
							src="${pageContext.request.contextPath}/product/logo/34.jpg" width="160" /><span>欧珀莱</span></a> <a
							href="#" class="brand_logo"><img src="${pageContext.request.contextPath}/product/logo/42.jpg"
															 width="160" /><span>欧珀莱</span></a> <a href="#" class="brand_logo"><img
							src="${pageContext.request.contextPath}/product/logo/152.jpg" width="160" /><span>欧珀莱</span></a> <a
							href="#" class="brand_logo"><img src="${pageContext.request.contextPath}/product/logo/156.jpg"
															 width="160" /><span>欧珀莱</span></a> <a href="#" class="brand_logo"><img
							src="${pageContext.request.contextPath}/product/logo/199.jpg" width="160" /><span>欧珀莱</span></a> <a
							href="#" class="brand_logo"><img src="${pageContext.request.contextPath}/product/logo/245.jpg"
															 width="160" /><span>欧珀莱</span></a> <a href="#" class="brand_logo"><img
							src="${pageContext.request.contextPath}/product/logo/339.jpg" width="160" /><span>欧珀莱</span></a> <a
							href="#" class="brand_logo"><img src="${pageContext.request.contextPath}/product/logo/458.jpg"
															 width="160" /><span>欧珀莱</span></a> <a href="#" class="brand_logo"><img
							src="${pageContext.request.contextPath}/product/logo/618.jpg" width="160" /><span>欧珀莱</span></a> <a
							href="#" class="brand_logo"><img src="${pageContext.request.contextPath}/product/logo/644.jpg"
															 width="160" /><span>欧珀莱</span></a></li>
				</ul>
			</div>
		</div>
		<a class="prev" href="javascript:void(0)"><em
				class="iconfont icon-left"></em></a> <a class="next"
														href="javascript:void(0)"><em class="iconfont icon-right"></em></a>
	</div>
	<script type="text/javascript">jQuery("#Brand_Show").slide({
		titCell : ".parHd li",
		mainCell : ".parBdIn",
		trigger : "click"
	});
	</script>

	<!--产品版块-->
	<div class="p_Section clearfix">
		<div class="Section_title">
			<div class="name">
				<em>1F</em>脸部护理
			</div>
			<div class="p_link">
				<a href="#">面膜</a> | <a href="#">补水</a> | <a href="#">祛痘</a> | <a
					href="#">美白</a> | <a href="#">防晒</a> |<a href="#">护肤套装</a> | <a
					href="#">洁面</a>
			</div>
		</div>
		<div class="Section_info clearfix">
			<div class="pro_ad_slide">
				<div class="hd">
					<ul></ul>
				</div>
				<div class="bd">
					<ul>
						<li><a href="#"><img
								src="${pageContext.request.contextPath}/images2/TB104MlMVXXXXaZXpXXXXXXXXXX-570-400.jpg"
								width="598" height="449" /></a></li>
						<li><a href="#"><img src="${pageContext.request.contextPath}/images/AD-p-5.jpg" width="598"
											 height="449" /></a></li>
					</ul>
				</div>
				<a class="prev" href="javascript:void(0)"><em class="arrow"></em></a>
				<a class="next" href="javascript:void(0)"><em class="arrow"></em></a>
			</div>
			<script type="text/javascript">
				jQuery(".pro_ad_slide").slide({
					titCell : ".hd ul",
					mainCell : ".bd ul",
					autoPlay : true,
					autoPage : true,
					interTime : 6000
				});
			</script>
			<!--产品列表-->
			<div class="pro_list">
				<ul>
					<li><a href="#"><img src="${pageContext.request.contextPath}/images2/4.jpg" width="180px"
										 height="150px" /></a> <a href="#" class="p_title_name">ZMC/植美村牛油果电动按摩眼霜淡化黑眼圈眼袋去脂肪粒细纹紧致</a>
						<div class="Numeral">
							<span class="price"><i>￥</i>98.00</span><span class="Sales">销量<i>545</i>件
								</span>
						</div></li>
					<li><a href="#"><img
							src="${pageContext.request.contextPath}/images3/O1CN01yybY5229k8fnFavxb_!!0-item_pic.jpg_250x250.jpg_.webp.jpg"
							width="180px" height="150px" /></a> <a href="#"
																   class="p_title_name">韩国wlab白雪公主王丽坤素颜霜学生专用少女正品W.Lab裸妆懒人霜</a>
						<div class="Numeral">
							<span class="price"><i>￥</i>1669</span><span class="Sales">销量<i>145</i>件
								</span>
						</div></li>
					<li><a href="#"><img
							src="${pageContext.request.contextPath}/images3/O1CN01EolndW1WKFGRmdAtc_!!0-item_pic.jpg_250x250.jpg_.webp.jpg"
							width="180px" height="150px" /></a> <a href="#"
																   class="p_title_name">HFP补水保湿亮肤套装 爽肤水乳液控油烟酰胺护肤化妆品正品男女士</a>
						<div class="Numeral">
							<span class="price"><i>￥</i>9.9</span><span class="Sales">销量<i>245</i>件
								</span>
						</div></li>
					<li><a href="#"><img
							src="${pageContext.request.contextPath}/images3/O1CN01VgpAFW1mLBw5N6rhO_!!0-item_pic.jpg_250x250.jpg_.webp.jpg"
							width="180px" height="150px" /></a> <a href="#"
																   class="p_title_name">红参蜗牛原液美白淡斑套装正品补水保湿水乳全套护肤化妆品学生女</a>
						<div class="Numeral">
							<span class="price"><i>￥</i>599.00</span><span class="Sales">销量<i>445</i>件
								</span>
						</div></li>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/p_5.jpg" width="180px"
										 height="150px" /></a> <a href="#" class="p_title_name">ECHOIN/百雀羚
						小雀幸静润补水保湿面膜 丰盈补水 自然润泽</a>
						<div class="Numeral">
							<span class="price"><i>￥</i>123.00</span><span class="Sales">销量<i>45</i>件
								</span>
						</div></li>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/p_6.jpg" width="180px"
										 height="150px" /></a> <a href="#" class="p_title_name">Olay玉兰油
						新生塑颜金纯活能水</a>
						<div class="Numeral">
							<span class="price"><i>￥</i>123.00</span><span class="Sales">销量<i>345</i>件
								</span>
						</div></li>
				</ul>
			</div>
			<div class="pro_ads">
				<ul>
					<li class="border"><a href="#"><img
							src="${pageContext.request.contextPath}/product/ad/1.jpg" width="198" height="140px" /></a></li>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/ad/2.jpg" width="198"
										 height="140px" /></a></li>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/ad/3.jpg" width="198"
										 height="140px" /></a></li>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/ad/4.jpg" width="198"
										 height="140px" /></a></li>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/ad/5.jpg" width="198"
										 height="140px" /></a></li>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/ad/6.jpg" width="198"
										 height="140px" /></a></li>
				</ul>
			</div>
			<div class="pro_logo">
				<a href="#"><img src="${pageContext.request.contextPath}/product/logo/34.jpg" width="112"
								 height="30" /></a> <a href="#"><img src="${pageContext.request.contextPath}/product/logo/42.jpg"
																	 width="112" height="30" /></a> <a href="#"><img
					src="${pageContext.request.contextPath}/product/logo/152.jpg" width="112" height="30" /></a> <a href="#"><img
					src="${pageContext.request.contextPath}/product/logo/156.jpg" width="112" height="30" /></a> <a href="#"><img
					src="${pageContext.request.contextPath}/product/logo/740.jpg" width="112" height="30" /></a> <a href="#"><img
					src="${pageContext.request.contextPath}/product/logo/741.png" width="112" height="30" /></a> <a href="#"><img
					src="${pageContext.request.contextPath}/product/logo/1663.jpg" width="112" height="30" /></a> <a href="#"><img
					src="${pageContext.request.contextPath}/product/logo/690.jpg" width="112" height="30" /></a> <a href="#"><img
					src="${pageContext.request.contextPath}/product/logo/1663.jpg" width="112" height="30" /></a> <a href="#"><img
					src="${pageContext.request.contextPath}/product/logo/1270.jpg" width="112" height="30" /></a>
			</div>
		</div>
	</div>
	<!--产品版块-->
	<div class="p_Section clearfix">
		<div class="Section_title">
			<div class="name">
				<em>1F</em>脸部护理
			</div>
			<div class="p_link">
				<a href="#">面膜</a> | <a href="#">补水</a> | <a href="#">祛痘</a> | <a
					href="#">美白</a> | <a href="#">防晒</a> |<a href="#">护肤套装</a> | <a
					href="#">洁面</a>
			</div>
		</div>
		<div class="Section_info clearfix">
			<div class="pro_ad_slide">
				<div class="hd">
					<ul></ul>
				</div>
				<div class="bd">
					<ul>
						<li><a href="#"><img
								src="${pageContext.request.contextPath}/images2/TB1XF.gJpXXXXaUXVXXXXXXXXXX-570-400.jpg"
								width="598" height="449" /></a></li>
						<li><a href="#"><img
								src="${pageContext.request.contextPath}/images2/TB1oHwXMVXXXXXnXVXXXXXXXXXX-570-400.jpg"
								width="598" height="449" /></a></li>
					</ul>
				</div>
				<a class="prev" href="javascript:void(0)"><em class="arrow"></em></a>
				<a class="next" href="javascript:void(0)"><em class="arrow"></em></a>
			</div>
			<script type="text/javascript">
				jQuery(".pro_ad_slide").slide({
					titCell : ".hd ul",
					mainCell : ".bd ul",
					autoPlay : true,
					autoPage : true,
					interTime : 6000
				});
			</script>
			<!--产品列表-->
			<div class="pro_list">
				<ul>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/p_1.jpg" width="180px"
										 height="150px" /></a> <a href="#" class="p_title_name">Olay玉兰油
						新生塑颜金纯活能水</a>
						<div class="Numeral">
							<span class="price"><i>￥</i>123.00</span><span class="Sales">销量<i>345</i>件
								</span>
						</div></li>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/p_2.jpg" width="180px"
										 height="150px" /></a> <a href="#" class="p_title_name">Olay玉兰油
						新生塑颜金纯活能水</a>
						<div class="Numeral">
							<span class="price"><i>￥</i>123.00</span><span class="Sales">销量<i>345</i>件
								</span>
						</div></li>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/p_3.jpg" width="180px"
										 height="150px" /></a> <a href="#" class="p_title_name">Olay玉兰油
						新生塑颜金纯活能水</a>
						<div class="Numeral">
							<span class="price"><i>￥</i>123.00</span><span class="Sales">销量<i>345</i>件
								</span>
						</div></li>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/p_4.jpg" width="180px"
										 height="150px" /></a> <a href="#" class="p_title_name">Olay玉兰油
						新生塑颜金纯活能水</a>
						<div class="Numeral">
							<span class="price"><i>￥</i>123.00</span><span class="Sales">销量<i>345</i>件
								</span>
						</div></li>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/p_5.jpg" width="180px"
										 height="150px" /></a> <a href="#" class="p_title_name">ECHOIN/百雀羚
						小雀幸静润补水保湿面膜 丰盈补水 自然润泽</a>
						<div class="Numeral">
							<span class="price"><i>￥</i>123.00</span><span class="Sales">销量<i>345</i>件
								</span>
						</div></li>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/p_6.jpg" width="180px"
										 height="150px" /></a> <a href="#" class="p_title_name">Olay玉兰油
						新生塑颜金纯活能水</a>
						<div class="Numeral">
							<span class="price"><i>￥</i>123.00</span><span class="Sales">销量<i>345</i>件
								</span>
						</div></li>
				</ul>
			</div>
			<div class="pro_ads">
				<ul>
					<li class="border"><a href="#"><img
							src="${pageContext.request.contextPath}/product/ad/1.jpg" width="198" height="140px" /></a></li>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/ad/2.jpg" width="198"
										 height="140px" /></a></li>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/ad/3.jpg" width="198"
										 height="140px" /></a></li>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/ad/4.jpg" width="198"
										 height="140px" /></a></li>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/ad/5.jpg" width="198"
										 height="140px" /></a></li>
					<li><a href="#"><img src="${pageContext.request.contextPath}/product/ad/6.jpg" width="198"
										 height="140px" /></a></li>
				</ul>
			</div>
			<div class="pro_logo">
				<a href="#"><img src="${pageContext.request.contextPath}/product/logo/34.jpg" width="112"
								 height="30" /></a> <a href="#"><img src="${pageContext.request.contextPath}/product/logo/42.jpg"
																	 width="112" height="30" /></a> <a href="#"><img
					src="${pageContext.request.contextPath}/product/logo/152.jpg" width="112" height="30" /></a> <a href="#"><img
					src="${pageContext.request.contextPath}/product/logo/156.jpg" width="112" height="30" /></a> <a href="#"><img
					src="${pageContext.request.contextPath}/product/logo/740.jpg" width="112" height="30" /></a> <a href="#"><img
					src="${pageContext.request.contextPath}/product/logo/741.png" width="112" height="30" /></a> <a href="#"><img
					src="${pageContext.request.contextPath}/product/logo/1663.jpg" width="112" height="30" /></a> <a href="#"><img
					src="${pageContext.request.contextPath}/product/logo/690.jpg" width="112" height="30" /></a> <a href="#"><img
					src="${pageContext.request.contextPath}/product/logo/1663.jpg" width="112" height="30" /></a> <a href="#"><img
					src="${pageContext.request.contextPath}/product/logo/1270.jpg" width="112" height="30" /></a>
			</div>
		</div>
	</div>
	<!--猜你喜欢样式-->
	<div class="like_p">
		<div class="title_name">
			<span>猜你喜欢</span>
		</div>
		<div class="list">
			<ul class="list_style">
				<li class="p_info_u"><a href="#" class="p_img"><img
						src="${pageContext.request.contextPath}/product/p_14.jpg" /></a> <a href="#" class="name">御泥坊
					玫瑰滋养+红石榴亮颜美肤套装 深层补水滋润 提亮肤色</a>
					<div class="Numeral">
						<span class="price"><i>￥</i>123.00</span><span class="Sales">销量<i>345</i>件
							</span>
					</div></li>
				<li class="p_info_u"><a href="#" class="p_img"><img
						src="${pageContext.request.contextPath}/product/p_15.jpg" /></a> <a href="#" class="name">御泥坊
					玫瑰滋养+红石榴亮颜美肤套装 深层补水滋润 提亮肤色</a>
					<div class="Numeral">
						<span class="price"><i>￥</i>123.00</span><span class="Sales">销量<i>345</i>件
							</span>
					</div></li>
				<li class="p_info_u"><a href="#" class="p_img"><img
						src="${pageContext.request.contextPath}/product/p_16.jpg" /></a> <a href="#" class="name">御泥坊
					玫瑰滋养+红石榴亮颜美肤套装 深层补水滋润 提亮肤色</a>
					<div class="Numeral">
						<span class="price"><i>￥</i>123.00</span><span class="Sales">销量<i>345</i>件
							</span>
					</div></li>
				<li class="p_info_u"><a href="#" class="p_img"><img
						src="${pageContext.request.contextPath}/product/p_17.jpg" /></a> <a href="#" class="name">御泥坊
					玫瑰滋养+红石榴亮颜美肤套装 深层补水滋润 提亮肤色</a>
					<div class="Numeral">
						<span class="price"><i>￥</i>123.00</span><span class="Sales">销量<i>345</i>件
							</span>
					</div></li>
				<li class="p_info_u"><a href="#" class="p_img"><img
						src="${pageContext.request.contextPath}/product/p_18.jpg" /></a> <a href="#" class="name">御泥坊
					玫瑰滋养+红石榴亮颜美肤套装 深层补水滋润 提亮肤色</a>
					<div class="Numeral">
						<span class="price"><i>￥</i>123.00</span><span class="Sales">销量<i>345</i>件
							</span>
					</div></li>
				<li class="p_info_u"><a href="#" class="p_img"><img
						src="${pageContext.request.contextPath}/product/p_19.jpg" /></a> <a href="#" class="name">御泥坊
					玫瑰滋养+红石榴亮颜美肤套装 深层补水滋润 提亮肤色</a>
					<div class="Numeral">
						<span class="price"><i>￥</i>123.00</span><span class="Sales">销量<i>345</i>件
							</span>
					</div></li>
				<li class="p_info_u"><a href="#" class="p_img"><img
						src="${pageContext.request.contextPath}/product/p_24.jpg" /></a> <a href="#" class="name">御泥坊
					玫瑰滋养+红石榴亮颜美肤套装 深层补水滋润 提亮肤色</a>
					<div class="Numeral">
						<span class="price"><i>￥</i>123.00</span><span class="Sales">销量<i>345</i>件
							</span>
					</div></li>
				<li class="p_info_u"><a href="#" class="p_img"><img
						src="${pageContext.request.contextPath}/product/p_26.jpg" /></a> <a href="#" class="name">御泥坊
					玫瑰滋养+红石榴亮颜美肤套装 深层补水滋润 提亮肤色</a>
					<div class="Numeral">
						<span class="price"><i>￥</i>123.00</span><span class="Sales">销量<i>345</i>件
							</span>
					</div></li>
			</ul>
		</div>
	</div>
</div>
<!---->
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
		<li class="fixeBoxLi user"><a href="${pageContext.request.contextPath}/skipUserCenterServlet"> <span
				class="fixeBoxSpan iconfont icon-yonghu"></span> <strong>用户</strong></a>
		</li>
		<li class="fixeBoxLi cart_bd" style="display:block;" id="cartboxs">
			<a href="${pageContext.request.contextPath}/shoppingTrolleyList"><p class="good_cart">${commodityCount}</p> <span
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

		<li class="fixeBoxLi Home"><a href="./"> <span
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
</body>
</html>
<script type="text/javascript">
	//浮动导航
	function float_nav(dom){
		var right_nav=$(dom);
		var nav_height=right_nav.height();
		function right_nav_position(bool){
			var window_height=$(window).height();
			var nav_top=(window_height-nav_height)/2;
			if(bool){
				right_nav.stop(true,false).animate({top:nav_top+$(window).scrollTop()},400);
			}else{
				right_nav.stop(true,false).animate({top:nav_top},300);
			}
			right_nav.show();
		}

		if(!+'\v1' && !window.XMLHttpRequest ){
			$(window).bind('scroll resize',function(){
				if($(window).scrollTop()>300){
					right_nav_position(true);
				}else{
					right_nav.hide();
				}
			})
		}else{
			$(window).bind('scroll resize',function(){
				if($(window).scrollTop()>300){
					right_nav_position();
				}else{
					right_nav.hide();
				}
			})
		}
	}
	float_nav('#float');
	float_nav('#left_nav');
</script>