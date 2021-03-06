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
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="author" content="穷在闹市" />
		<!-- 作者 -->
		<meta name="revised" content="穷在闹市.v3, 2019/05/01" />
		<!-- 定义页面的最新版本 -->
		<meta name="description" content="网站简介" />
		<!-- 网站简介 -->
		<meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />

		<!-- 公共样式 开始 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/base.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/iconfont.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/administrators/framework/jquery-1.11.3.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
		<!-- 滚动条插件 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/jquery.mCustomScrollbar.css">
		<script src="${pageContext.request.contextPath}/administrators/framework/jquery-ui-1.10.4.min.js"></script>
		<script src="${pageContext.request.contextPath}/administrators/framework/jquery.mousewheel.min.js"></script>
		<script src="${pageContext.request.contextPath}/administrators/framework/jquery.mCustomScrollbar.min.js"></script>
		<script src="${pageContext.request.contextPath}/administrators/framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
		<script src="${pageContext.request.contextPath}/administrators/js/axios.js"></script>
		<!-- 公共样式 结束 -->

	</head>

	<body>
		<div class="cBody">
			<form id="addForm" class="layui-form" >
				<div class="layui-form-item">
					<label class="layui-form-label">原始密码</label>
					<div class="layui-input-inline shortInput">
						<input type="password" name="oldPassword" required lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">新密码</label>
					<div class="layui-input-inline shortInput">
						<input type="password" name="password" required lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">确认新密码</label>
					<div class="layui-input-inline shortInput">
						<input type="password" name="password2" required lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="loginBut">确认修改</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>

			<script>
				layui.use(['form',"layer"], function() {
					var form = layui.form;
					var layer=layui.layer;
					//监听提交
					form.on('submit(loginBut)', function (data) {
						console.log(data.field);
						if(data.field.password === data.field.password2){
							axios({
								url : "${pageContext.request.contextPath}/manage/changePassword",
								params : data.field
							}).then(res=>{
								console.log(typeof res.data);
								if(res.data === 1){
									layer.msg("原密码输入错误");
								}else if(res.data === 0){
									layer.alert('修改成功', {
										icon: 1,
									});
									parent.location.href="${pageContext.request.contextPath}/manage/frame"
								}
							})
						}else{
							layer.msg("两次输入的密码不一致");
						}

						return false;
					});

				});

			</script>

		</div>
	</body>

</html>