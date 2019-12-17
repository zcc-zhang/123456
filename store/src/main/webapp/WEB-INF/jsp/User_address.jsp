<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet"
			href="${pageContext.request.contextPath}/css/sweetalert.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/src/css/dialog.css">
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/fonts/iconfont.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/common_js.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/footer.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/lrtk.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/data.js"></script>
<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/sweetalert-dev.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/province.js"></script>
<script src="${pageContext.request.contextPath}/src/jquery.dialog.min.js"></script>
<script type="text/javascript">

	$(function(){
		/******单击删除图标*********/
		$(".del").on('click',function(){
			var id=$(this).parent().next().text();//获取id
			var dom=$(this).parent().parent();//地址
			console.log('id:',id,'dom:',dom);
			swal({
				title : "您确定要删除此商品吗",
				text : "删除后将无法恢复，请谨慎操作！",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "是的，我要删除！",
				cancelButtonText : "让我再考虑一下…",
				closeOnConfirm : false,
				closeOnCancel : false
			},
				function(isConfirm) {
					if (isConfirm) {
						swal({
							title : "删除成功！",
							text : "您已经永久删除了这条信息。",
							type : "success"
						}, function() {
							
							$.ajax({
								url : "${pageContext.request.contextPath}/delAddressServlet",
								data : {
									'id' : id
								},
								type : "post",
								success:function()
								{
									dom.remove();
								}
							});
							
						});
					} else {
						swal({
							title : "已取消",
							text : "您取消了删除操作！",
							type : "error"
						});
					}
				}
			);
		});
		var $bool = false;
		if ('${bool}'!=null && '${bool}'!='') {
			$bool = '${bool}';
		}
		if ($bool) {
			$("#one").html("修改地址");
			$("#two").val("修改地址");
		}
	});
	/**
	function insertUpdate(){
		var $name = $("input[name='name']").val();//姓名
		var $moblie = $("input[name='moblie']").val();//手机号
		var $address = $("input[name='address']").val();//详细地址
		var $postal = $("input[name='postal']").val();//邮编
		var $provid = $("input[name='province']").val();//省
		var $cityid = $("input[name='city']").val();//市
		var $areaid = $("input[name='county']").val();//县
		if ($("#two").val() == "修改地址") {
			var $shippingAddressID =$("#shipping_address_ID").text();
			window.location.href="${pageContext.request.contextPath}/updateAddressServlet?name="+$name+"&moblie="+$moblie+"&address="+$address+"&postal="+$postal+"&id="+$shippingAddressID;
		}else if($("#two").val() == "添加地址"){
			$address = $provid+$cityid+$areaid+$address; //拼接
			window.location.href="${pageContext.request.contextPath}/shippingAddressServlet?name="+$name+"&moblie="+$moblie+"&address="+$address+"&postal="+$postal+"&flag=flag";
		}
		
	}**/
	var defaults = {
		s1 : 'provid',
		s2 : 'cityid',
		s3 : 'areaid',
		v1 : null,
		v2 : null,
		v3 : null
	};
	
	$(function() {
		/**
		 * 校验邮箱
		 */
		function checlEmail() {
			var $email = $("input[name='email']").val();
			var $regEmail = /^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/;
			if ($regEmail.test($email) == false) {
				$.sendWarningToTop('邮箱格式输入不正确', 3000, function() {
					console.log('sendWarningToTop closed');
				});
				return false;
			}
			$.sendSuccessToTop('邮箱校验成功', 3000, function() {
				console.log('sendSuccessToTop closed');
			});
			return true;
		}
		/**
		 * 校验用户
		 */
		function checkUser() {
			var $user = $("input[name='name']").val();
			if ($user == null || "" == $user.trim()) {
				$.sendWarningToTop('姓名不能为空', 3000, function() {
					console.log('sendWarningToTop closed');
				});
				return false;
			}
			$.sendSuccessToTop('姓名校验成功', 3000, function() {
				console.log('sendSuccessToTop closed');
			});
			return true;
		}
		/**验证手机号**/
		function checkMoblie()
		{
			var $phone=$("input[name='moblie']").val();
			var $regMoblie=/^1[3456789]\d{9}$/;
			if($regMoblie.test($phone)==false)
			{
				$.sendWarningToTop('手机号输入有误', 3000, function() {
					console.log('sendWarningToTop closed');
				});
				return false;
			}
			$.sendSuccessToTop('手机号校验成功', 3000, function() {
				console.log('sendSuccessToTop closed');
			});
			return true;
		}
		/**详细地址**/
		function checkAddress()
		{
			var $address = $("input[name='address']").val();
			if ($address == null || "" == $address.trim()) {
				$.sendWarningToTop('详细地址不能为空', 3000, function() {
					console.log('sendWarningToTop closed');
				});
				return false;
			}
			$.sendSuccessToTop('详细地址校验成功', 3000, function() {
				console.log('sendSuccessToTop closed');
			});
			return true;
		}
		/***地址添加成功**/
		function message()
		{
			$.sendSuccessToTop('添加新地址成功！', 3000, function() {
				console.log('sendSuccessToTop closed');
			});
		}
		$("input[name='name']").blur(checkUser);
		$("input[name='email']").blur(checlEmail)
		$("input[name='moblie']").blur(checkMoblie);
		$(".Add_btn").on('click', function() {
			var flag=true;
			if(!checlEmail())
			{
				flag=false;
			}
			if(!checkUser())
			{
				flag=false;
			}
			if(!checlEmail())
			{
				flag=false;
			}
			if(!checkAddress())
			{
				flag=false;
			}
			if(flag)
			{
				message();
				var str=$(".layui-form").serialize();
				var two=$("#two").val();
				if(two=='添加地址')
				{
					$.ajax({
						url : "${pageContext.request.contextPath}/shippingAddressServlet?flag=flag",
						type : 'post',
						data : str,
						success:callBack
					});
				}else
				{//修改地址信息
					var $shippingAddressID =$("#shipping_address_ID").text();
					$.ajax({
						url : "${pageContext.request.contextPath}/updateAddressServlet?id="+$shippingAddressID,
						type : 'post',
						data : str,
						success:function(data)
						{
							if(data=='1')
							{
								window.location.href="${pageContext.request.contextPath}/shippingAddressServlet";
							}else
							{
								$.sendWarningToTop('修改失败', 3000, function() {
									console.log('sendWarningToTop closed');
								});
							}
						}
					});
				}
				
			
			}
		});
		function callBack()
		{
			window.location.reload();
		}
		
	});
	
	
		
		
	
</script>
<title>用户中心-地址管理</title>
</head>

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
									<img src="images/erweima.png" width="100px" height="100" />
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
				<a href="index.html"><img src="images/logo.png" /></a>
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
								<img src="images/tianma.png">
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
			</div>
				<script>$("#Navigation").slide({
						titCell : ".Navigation_name li"
					});
				</script>
			</div>
		</div>
	</div>
	<!--地址管理样式-->
	<div class="user_style clearfix">
		<div class="user_center">
			<!--左侧菜单图层-->
			<div class="left_style">
				<div class="menu_style">
					<div class="user_title">用户中心</div>
					<div class="user_Head">
						<div class="user_portrait">
							<a href="#" title="修改头像" class="btn_link"></a> <img
								src="images/people.png">
								<div class="background_img"></div>
						</div>
						<div class="user_name">
							<p>
								<span class="name">化海天堂</span><a href="#">[修改密码]</a>
							</p>
							<p>访问时间：2016-1-21 10:23</p>
						</div>
					</div>
					<!--菜单列表图层-->
					<dl class="accountSideOption1">
						<dt class="transaction_manage">
							<em class="icon_1"></em>订单中心
						</dt>
						<dd>
							<ul>
								<li><a href="User_Orderform.html"> 我的订单</a></li>
								<li><a href="User_address.html">收货地址</a></li>
								<li><a href="user.php?act=booking_list"> 缺货登记</a></li>
							</ul>
						</dd>
					</dl>
					<dl class="accountSideOption1">
						<dt class="transaction_manage">
							<em class="icon_2"></em>会员中心
						</dt>
						<dd>
							<ul>
								<li><a href="user.php?act=profile"> 用户信息</a></li>
								<li><a href="User_Collect.html"> 我的收藏</a></li>
								<li><a href="user.php?act=message_list"> 我的留言</a></li>
								<li><a href="user.php?act=tag_list">我的标签</a></li>
								<!-- <li> <a href="user.php?act=affiliate"> 我的推荐</a></li> -->
								<li><a href="user.php?act=comment_list"> 我的评论</a></li>
							</ul>
						</dd>
					</dl>
					<dl class="accountSideOption1">
						<dt class="transaction_manage">
							<em class="icon_3"></em>账户中心
						</dt>
						<dd>
							<ul>
								<li><a href="user.php?act=bonus">我的红包</a></li>
								<!--<a href="user.php?act=group_buy">我的团购</a>-->
								<li><a href="user.php?act=track_packages"> 跟踪包裹</a></li>
								<li><a href="user.php?act=account_log"> 资金管理</a></li>
							</ul>
						</dd>
					</dl>
					<dl class="accountSideOption1">
						<dt class="transaction_manage">
							<em class="icon_4"></em>分销中心
						</dt>
						<dd>
							<ul>
								<li><a href="user.php?act=myshop">店铺管理</a></li>
								<li><a href="user.php?act=myguide">我的盟友</a></li>
								<li><a href="user.php?act=myaccount"> 我的佣金</a></li>
								<li><a href="user.php?act=account_raply">申请提现</a></li>
							</ul>
						</dd>
					</dl>
				</div>
			</div>
			<!--右侧样式-->
			<div class="right_style">
				<div class="user_title_name">
					<span>地址管理</span>
				</div>
				<div class="frame user_address clearfix">
					<!--地址列表-->
					<div class="Address_List clearfix">
						<!--地址类表-->
						<c:if test="${not empty addresslist }">
							<c:forEach var="list" items="${addresslist }">
								<ul class="Address_info">
									<div class="address_title">
										<a href="${pageContext.request.contextPath}/updateAddressServlet?id=${list.id }" class="modify" title="修改信息">
										</a>地址信息 <a href="javascript:over('0')" class="delete "><i class="iconfont icon-close"></i></a>
										<a href="#" style="position:absolute; top:0; right:-50; width:380px;" title="删除信息" class="del"><img src="img/del.png"/></a>
									</div>
									
									<p style="display: none">${list.id }</p>
									<li>${list.name }</li>
									<li>${list.address }</li>
									<li>${list.moblie }</li>
									<li>${list.postal }</li>
								</ul>
							</c:forEach>
						</c:if>
					</div>
					<!--下拉选择地址样式-->
					<link href="Threelinkage/linkage.css" rel="stylesheet"
						type="text/css" />

					<form action="shippingAddressServlet?flag=User_address"
						method="post" class="layui-form">
						<div class="Add_Addresss">
							<div class="title_name">
								<i></i><span id="one">添加地址</span>
								<span id="shipping_address_ID" style="display: none;">${address.id }</span>
							</div>
							<table>
								<tr>
									<div class="layui-form-item">
										<label class="layui-form-label">选择地区</label>
										<div class="layui-input-inline">
											<select name="provid" lay-filter="provid">
												<option value="">请选择省</option>
											</select>
										</div>
										<div class="layui-input-inline">
											<select name="cityid" lay-filter="cityid">
												<option value="">请选择市</option>
											</select>
										</div>
										<div class="layui-input-inline">
											<select name="areaid" lay-filter="areaid">
												<option value="">请选择县/区</option>
											</select>
										</div>
									</div>
								</tr>
								<tr>
									<td class="label_name">收件人姓名</td>
									<td><input name="name" type="text" class="Add-text" value="${address.name }" /><i>（必填）</i></td>
									<td class="label_name">电子邮箱</td>
									<td><input name="email" type="text" class="Add-text" /><i>（选填）</i></td>
								</tr>
								<tr>
									<td class="label_name">手&nbsp;&nbsp;机</td>
									<td><input name="moblie" type="text" class="Add-text" value="${address.moblie }" /><i>（必填）</i></td>
									<td class="label_name">性&nbsp;&nbsp;别</td>
									
									<td>
										<c:if test="${address.sex }=='男'">
										<label class="sex"> 
											<input type="radio"
													name="RadioGroup1" value="1" id="RadioGroup1_0"
													class="select" />男</label>
										</c:if>	
										<c:if test="${address.sex }=='女'">						
											 <label class="sex"><input type="radio"
													name="RadioGroup1" value="2" id="RadioGroup1_1"
													class="select" />女</label><i>（选填）</i>
										</c:if>
									</td>
								</tr>
								<tr>
									<td class="label_name">邮&nbsp;&nbsp;编</td>
									<td><input name="postal" type="text" class="Add-text" value="${address.postal }" /><i>（选填）</i></td>
									<td class="label_name">固定电话</td>
									<td><input name="moblie" type="text" class="Add-text" /><i>（选填）</i></td>
									
								</tr>
								<tr>
									<td class="label_name">详细地址</td>
									<td><input type="text" name="address" class="Add-text" value="${address.address }" />
									</td>
									<td class="label_name"></td>
									<td></td>
								</tr>
							</table>
							<div class="address_Note">
								<span>注：</span>只能添加5个收货地址信息。请勿用假名填写地址，如造成损失由收货人自己承担。
							</div>
							<div class="btn">
								<input name="1" type="button" value="添加地址"  class="Add_btn" id="two"/>
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="slogen">
		<div class="index_style">
			<ul class="wrap">
				<li><a href="#"><img src="images/slogen_34.png"
						data-bd-imgshare-binded="1"></a> <b>安全保证</b> <span>多重保障机制
						认证商城</span></li>
				<li><a href="#"><img src="images/slogen_28.png"
						data-bd-imgshare-binded="2"></a> <b>正品保证</b> <span>正品行货
						放心选购</span></li>
				<li><a href="#"><img src="images/slogen_30.png"
						data-bd-imgshare-binded="3"></a> <b>七天无理由退换</b> <span>七天无理由保障消费权益</span>
				</li>
				<li><a href="#"><img src="images/slogen_31.png"
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
							<img src="images/Service1.png">
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
							<img src="images/Service1.png">
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
							<img src="images/erweim.jpg" width="150px" height="150px"
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
