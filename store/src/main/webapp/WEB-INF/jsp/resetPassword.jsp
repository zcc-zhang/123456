<%@ page language="java" import="java.util.*"
		 contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/HyUDBWebSDK-p1.3.css" />
	<title></title>
	<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/fonts/iconfont.css" rel="stylesheet" type="text/css" />
	<!--CSS RESET-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/src/css/dialog.css" type="text/css">
	<script src="${pageContext.request.contextPath}/js/jquery.min.1.8.2.js"></script>
	<script src="${pageContext.request.contextPath}/src/jquery.dialog.min.js"></script>

</head>
<script type="text/javascript">
	$(function() {
		$('input[name=acct]').blur(checkEmail);

		var countdown = 60; //时效
		/***************验证码计时****************/
		function settime(val) {
			if (countdown == 0) { //如果计时器时效为0则可以重新获取
				val.innerHTML = "获取验证码"; //设置按钮提示文字
				countdown = 60; //重新设置计时器时效
			} else {
				val.innerHTML = "重新发送(" + countdown + ")";
				countdown--;
				setTimeout(function() {
					settime(val)
				}, 1000)
			}

		}
		/***********发送验证码**************/
		function sendCode() {
			$.ajax({
				url : "${pageContext.request.contextPath}/resetPasswordServlet", //发送验证码
				type : "post",
				data : {
					'type' : 'checkCode'
				},
				success : function(data) {
					if (data == '1') { //发送成功给用户提示
						$.sendSuccessToTop('验证码已发送至您的邮箱请注意查收', 3000, function() {
							console.log('sendSuccessToTop closed')
						});
					}
				}
			});
		}
		/************验证密码************/
		function checkPassword() {
			var password = $('input[name=passwd]').val();
			var $reg = /^(?![\d]+$)(?![a-zA-Z]+$)(?![^\da-zA-Z]+$).{6,20}$/;
			if ($reg.test(password) == false) {
				$.sendWarningToTop('密码格式不正确,请输入6-20位至少两种字符组合密码', 3000, function() {
					console.log('sendWarningToTop closed');
				});
				return false;
			}
			return true;
		}
		/********验证邮箱***********/
		function checkEmail() {
			var email = $('input[name=acct]').val();
			var $reg = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
			if ($reg.test(email) == false) {
				$.sendWarningToTop('邮箱格式不正确', 3000, function() {
					console.log('sendWarningToTop closed');
				});
				return false;
			}
			$.ajax({ //发送请求
				url : "${pageContext.request.contextPath}/resetPasswordServlet",
				type : "post",
				data : {
					'email' : email,
					'type' : 'email'
				},
				success : function(data) {
					if (data == email) {
						$('.UDBSdkReg-phoneMask').text(email);
					} else {
						$.sendWarningToTop('邮箱不存在', 3000, function() {
							console.log('sendWarningToTop closed');
						});
						return false;
					}
				}
			});
			return true;
		}
		/*******发送修改密码请求*******/
		function resetPass() {
			var password = $('input[name=passwd]').val();
			$.ajax({
				url : "${pageContext.request.contextPath}/resetPasswordServlet",
				type : "post",
				data : {
					'password' : password,'type':'password'
				},
				success : function(data) {
					if (data == '1') {
						$('.UDBSdkReg-button').parent().hide();
						$('.UDBSdkReg-succ').show();
						$('.UDBSdkReg-nav').removeClass('.findnav-2').addClass('findnav-3');
					}

				}
			});
		}
		/*************验证邮箱验证码***************/
		function checkCode() {
			var code = $('input[name=code]').val();
			$.ajax({
				url : "${pageContext.request.contextPath}/resetPasswordServlet",
				type : "post",
				data : {
					'code' : code,
					'type' : "code"
				},
				success : function(data) {
					if (data == '0') {
						return true;
					} else if(data=='1'){
						$.sendWarningToTop('验证码输入有误请重新输入', 3000, function() {
							console.log('sendWarningToTop closed');
						});
						return false;
					}
				}
			});
			return true;
		}
		$('.UDBSdkReg-button').click(function() { //点击下一步
			var type = $(this).attr('step'); //获取属性
			if (type == 1) { //为1则验证邮箱
				if (checkEmail()) {
					$('.UDBSdkReg-nav').removeClass('.findnav-1').addClass('findnav-2'); //改变进度栏
					$(this).parent().hide(); //隐藏当前验证邮箱的进度
					$('.focusout').show();
				}
			} else if (type == 2) {
				$('.UDBSdkReg-button').removeClass('.UDBSdkReg-button');
			}

		});
		$('.code').on('click', function() {
			if ($(this).text() == '获取验证码') {
				sendCode(); //向指定邮箱发送验证码
			}
			settime($('.focusout').children('.clearItem').children('.code').get(0)); //计时
			$('.UDBSdkReg-button').unbind().click(function() { //为下一步按钮添加click事件
				var flag=true;
				if(!checkCode()) flag=false;
				if(!checkPassword()) flag=false;
				if(flag)
				{
					resetPass();
				}
			});
		});


	});
</script>
<style>
	.focusout, .UDBSdkReg-succ {
		display: none;
	}

	.UDBSdkReg-nav {
		margin-top: 200px;
	}
</style>

<body>
<div class="top">
	<div class="logo">
		<div class="logo_link">
			<a href="Index.html"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
		</div>
		<div class="phone">
			免费咨询热线：<b>400-567-4556</b>
		</div>
	</div>
</div>
<div class="section UDBSdkReg" module="find" type="portal">
	<div class="UDBSdkReg-nav findnav-1"></div>
	<div class="UDBSdkReg-content">
		<div class="UDBSdkReg-item clearItem">
			<i class="acctIcon"></i> <input
				class="acctInput spacenot chinesenot" type="text" name="acct"
				maxlength="50" placeholder="请输入邮箱"> <i class="clear"></i>
		</div>
		<div class="UDBSdkReg-error UDBSdkReg-none"></div>
		<div class="UDBSdkReg-button" step="1" runing="0">下一步</div>
	</div>
	<div class="UDBSdkReg-content UDBSdkReg-none focusout">
		<p>
			验证码将发送到<span class="UDBSdkReg-phoneMask"></span>
		</p>
		<div class="UDBSdkReg-item clearItem UDBSdkReg-none">
			<i class="phoneIcon"></i> <input
				class="phoneInput focusnot blur active number" type="text"
				name="phone" maxlength="16" ext="" placeholder="请输入对应的邮箱">
			<i class="clear cearCode"></i>
		</div>
		<div class="UDBSdkReg-item clearItem">
			<i class="codeIcon"></i> <input class="codeInput number" type="text"
											name="code" codetype="2" maxlength="6" placeholder="请输入验证码"
											oncontextmenu="return false" oncopy="return false"
											onpaste="return false" oncut="return false"> <span
				class="code focusnot " enable="1">获取验证码</span> <i class="clear"></i>
		</div>
		<div class="UDBSdkReg-item clearItem">
			<i class="passwdIcon"></i> <input class="passwdInput spacenot"
											  type="password" name="passwd" maxlength="20" bntlength="6"
											  placeholder="请设置6-20位至少两种字符组合密码" oncontextmenu="return false"
											  oncopy="return false" onpaste="return false" oncut="return false">
			<i class="clear"></i>
		</div>
		<div class="UDBSdkReg-error UDBSdkReg-none"></div>
		<div class="UDBSdkReg-button focusnot" step="2" runing="0">下一步</div>
		<p style="text-align: center;font-size: 12px;">
			无法收到验证码？ <a href="https://aq.huya.com/p/appeal/appeal.html"
						target="_blank" style="color: #45A3F2;">点此进行申诉</a>
		</p>
	</div>
	<div class="UDBSdkReg-content UDBSdkReg-succ UDBSdkReg-none">
		<div class="icon"></div>
		<p class="hint">密码已重置</p>
		<div class="button">
			<a href="login.jsp">重新登录</a>
		</div>
	</div>
</div>

<div class="btmbg">
	<div class="btm">
		备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com Copyright © Technical
		Support: Dgg Group <br>
	</div>
</div>
</body>

</html>