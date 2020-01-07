<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">

		<!-- 公共样式 开始 -->
		<link rel="shortcut icon" href="images/favicon.ico" />
		<link rel="bookmark" href="images/favicon.ico" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/base.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/iconfont.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/administrators/framework/jquery-1.11.3.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/layui/css/layui.css">
		<!--[if lt IE 9]>
		<script src="${pageContext.request.contextPath}/administrators/framework/html5shiv.min.js" ></script>
		<script src="${pageContext.request.contextPath}/administrators/framework/respond.min.js"></script>
	    <![endif]-->
		<script type="text/javascript" src="${pageContext.request.contextPath}/administrators/layui/layui.js"></script>
		<!-- 滚动条插件 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/jquery.mCustomScrollbar.css">
		<script src="${pageContext.request.contextPath}/administrators/framework/jquery-ui-1.10.4.min.js"></script>
		<script src="${pageContext.request.contextPath}/administrators/framework/jquery.mousewheel.min.js"></script>
		<script src="${pageContext.request.contextPath}/administrators/framework/jquery.mCustomScrollbar.min.js"></script>
		<script src="${pageContext.request.contextPath}/administrators/framework/cframe.js"></script>
		<!-- 仅供所有子页面使用 -->
		<!-- 公共样式 结束 -->

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/frameStyle.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/administrators/framework/frame.js"></script>

	</head>
	<script>
	</script>

	<body>
		<!-- 左侧菜单 - 开始 -->
		<div class="frameMenu">
			<div class="logo">
			</div>
			<div class="menu">
				<ul>
					<li>
						<a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-shangpin left"></i>商品管理<i class="iconfont icon-dajiantouyou right"></i></a>
						<dl>
							<dt><a href="javascript:void(0)" onclick="menuCAClick('${pageContext.request.contextPath}/commodityType/queryCommodityType',this)">分类列表</a></dt>
							<dt><a href="javascript:void(0)" onclick="menuCAClick('${pageContext.request.contextPath}/administrators/tgls/goodsManage/goods_list.jsp',this)">基本商品库</a></dt>
							<dt><a href="javascript:void(0)" onclick="menuCAClick('${pageContext.request.contextPath}/administrators/tgls/goodsManage/goods_add.jsp',this)">添加商品</a></dt>
						</dl>
					</li>
					<li>
						<a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-icon left"></i>报表模块<i class="iconfont icon-dajiantouyou right"></i></a>
						<dl>
							<dt><a href="javascript:void(0)" onclick="menuCAClick('${pageContext.request.contextPath}/administrators/tgls/reportForm/reportForm1.jsp',this)">订单统计报表</a></dt>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		<!-- 左侧菜单 - 结束 -->

		<div class="main">
			<!-- 头部栏 - 开始 -->
			<div class="frameTop">
				<div class="topMenu">
					<ul>
						<li>
							<a href="javascript:void(0)" onclick="menuCAClick('${pageContext.request.contextPath}/administrators/tgls/modify_password.jsp',this)"><i class="iconfont icon-yonghu1"></i>管理员</a>
						</li>
						<li>
							<a href="javascript:void(0)" onclick="menuCAClick('${pageContext.request.contextPath}/administrators/tgls/modify_password.jsp',this)"><i class="iconfont icon-xiugaimima"></i>修改密码</a>
						</li>
						<li>
							<a href="#"><i class="iconfont icon-084tuichu"></i>注销</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- 头部栏 - 结束 -->

			<!-- 核心区域 - 开始 -->
			<div class="frameMain">
				<div class="title" id="frameMainTitle">
					<span><i class="iconfont icon-xianshiqi"></i>后台首页</span>
				</div>
				<div class="con">
					<iframe id="mainIframe" src="${pageContext.request.contextPath}/administrators/tgls/goodsManage/goods_list.jsp" scrolling="no"></iframe>
				</div>
			</div>
			<!-- 核心区域 - 结束 -->
		</div>
	</body>
</html>