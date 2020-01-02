<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
		<!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
		<meta name="renderer" content="webkit">
		<!--国产浏览器高速模式-->
		<!-- 作者 -->
		<!-- 定义页面的最新版本 -->
		<!-- 网站简介 -->

		<!-- 公共样式 开始 -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/administrators/images/favicon.ico" />
		<link rel="bookmark" href="${pageContext.request.contextPath}/administrators/images/favicon.ico" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/base.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/iconfont.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/administrators/framework/jquery-1.11.3.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/layui/css/layui.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/administrators/layui/layui.js"></script>
		<!-- 公共样式 结束 -->

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/login1.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/administrators/js/login1.js"></script>
	</head>

	<body>
		<div class="loginBg"></div>
		<div class="login_main">
			<div class="box">
				<div class="left">
				</div>
				<div class="right">
					<form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/manage/login" method="post">
						<div class="layui-form-item">
							<label class="layui-form-label login_title"><i class="iconfont icon-gerenzhongxin-denglu"></i></label>
							<div class="layui-input-block login_input">
								<input type="text" name="name" required lay-verify="required" autocomplete="off" placeholder="请输入您的用户名" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label login_title"><i class="iconfont icon-mima1"></i></label>
							<div class="layui-input-block login_input">
								<input type="password" name="password" required lay-verify="required" autocomplete="off" placeholder="请输入密码" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<button class="layui-btn layui-btn-fluid login_but" lay-submit lay-filter="loginBut" @click="login">登 录</button>
						</div>
						<div class="layui-form-item">

						</div>
					</form>
				</div>
			</div>
		</div>
		<script>
		</script>
		<script>
			layui.use('form', function() {
				var form = layui.form;
				//监听提交
				form.on('submit(loginBut)', function(data) {
					layer.msg(JSON.stringify(data.field));
					return true;
				});
				//监听用户类型，改变风格
				function Carousel(data) {
					if(data === 1) {
						$(".loginBg").css("background", "url('${pageContext.request.contextPath}/images/login_admin_bg.jpg')");
						$(".login_but").css("cssText", "background-color:#57c201 !important");
					}
					if(data === 2) {
						$(".loginBg").css("background", "url('${pageContext.request.contextPath}/administrators/images/login_sh_bg.jpg')");
						$(".login_but").css("cssText", "background-color:#16c6f9 !important");
					}
					if(data === 3) {
						$(".loginBg").css("background", "url('${pageContext.request.contextPath}/administrators/images/login_fj_bg.jpg')");
						$(".login_but").css("cssText", "background-color:#ffd205 !important");
					}
				}
				var i = 1;
				setInterval(() => {
					if(i == 3) {
						i = 1;
					}
					i++;
					Carousel(i);
				},2500);
			});
		</script>
	</body>

</html>