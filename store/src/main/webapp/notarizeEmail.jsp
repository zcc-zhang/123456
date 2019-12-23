<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="p_AFMaximized" dir="ltr" lang="zh-CN">
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

<title>宏颜锦 | 帐户确认</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myprofile-responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myprofile-skin-desktop-c70szf--d-webkit-537-d-ltr-d--s-n-c.css">
<style type="text/css">
body {
	padding: 0;
	margin: 0;
	overflow-x: hidden;
	height: 100vh;
	background-color: #9f9eac;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100%25' height='100%25' viewBox='0 0 1600 800'%3E%3Cg %3E%3Cpath fill='%23aeadbc' d='M486 705.8c-109.3-21.8-223.4-32.2-335.3-19.4C99.5 692.1 49 703 0 719.8V800h843.8c-115.9-33.2-230.8-68.1-347.6-92.2C492.8 707.1 489.4 706.5 486 705.8z'/%3E%3Cpath fill='%23bdbccc' d='M1600 0H0v719.8c49-16.8 99.5-27.8 150.7-33.5c111.9-12.7 226-2.4 335.3 19.4c3.4 0.7 6.8 1.4 10.2 2c116.8 24 231.7 59 347.6 92.2H1600V0z'/%3E%3Cpath fill='%23cdccdd' d='M478.4 581c3.2 0.8 6.4 1.7 9.5 2.5c196.2 52.5 388.7 133.5 593.5 176.6c174.2 36.6 349.5 29.2 518.6-10.2V0H0v574.9c52.3-17.6 106.5-27.7 161.1-30.9C268.4 537.4 375.7 554.2 478.4 581z'/%3E%3Cpath fill='%23dcdbee' d='M0 0v429.4c55.6-18.4 113.5-27.3 171.4-27.7c102.8-0.8 203.2 22.7 299.3 54.5c3 1 5.9 2 8.9 3c183.6 62 365.7 146.1 562.4 192.1c186.7 43.7 376.3 34.4 557.9-12.6V0H0z'/%3E%3Cpath fill='%23ecebff' d='M181.8 259.4c98.2 6 191.9 35.2 281.3 72.1c2.8 1.1 5.5 2.3 8.3 3.4c171 71.6 342.7 158.5 531.3 207.7c198.8 51.8 403.4 40.8 597.3-14.8V0H0v283.2C59 263.6 120.6 255.7 181.8 259.4z'/%3E%3Cpath fill='%23dcdbee' d='M1600 0H0v136.3c62.3-20.9 127.7-27.5 192.2-19.2c93.6 12.1 180.5 47.7 263.3 89.6c2.6 1.3 5.1 2.6 7.7 3.9c158.4 81.1 319.7 170.9 500.3 223.2c210.5 61 430.8 49 636.6-16.6V0z'/%3E%3Cpath fill='%23cdccdd' d='M454.9 86.3C600.7 177 751.6 269.3 924.1 325c208.6 67.4 431.3 60.8 637.9-5.3c12.8-4.1 25.4-8.4 38.1-12.9V0H288.1c56 21.3 108.7 50.6 159.7 82C450.2 83.4 452.5 84.9 454.9 86.3z'/%3E%3Cpath fill='%23bdbccc' d='M1600 0H498c118.1 85.8 243.5 164.5 386.8 216.2c191.8 69.2 400 74.7 595 21.1c40.8-11.2 81.1-25.2 120.3-41.7V0z'/%3E%3Cpath fill='%23aeadbc' d='M1397.5 154.8c47.2-10.6 93.6-25.3 138.6-43.8c21.7-8.9 43-18.8 63.9-29.5V0H643.4c62.9 41.7 129.7 78.2 202.1 107.4C1020.4 178.1 1214.2 196.1 1397.5 154.8z'/%3E%3Cpath fill='%239f9eac' d='M1315.3 72.4c75.3-12.6 148.9-37.1 216.8-72.4h-723C966.8 71 1144.7 101 1315.3 72.4z'/%3E%3C/g%3E%3C/svg%3E");
	/* background by SVGBackgrounds.com */
	background-attachment: fixed;
	background-position: center;
	background-size: cover;
}
</style>
<link rel="stylesheet" href="css/reset.css" type="text/css">
<link rel="stylesheet" href="src/css/dialog.css" type="text/css">
<script src="src/jquery.dialog.min.js"></script>
</head>

<body class="x288 x13d p_AFMaximized">
	<form action="${pageContext.request.contextPath}/user//register"
		method="post" id="myFrom">
		<input type="hidden" name="code" value="${param.mailcode}" />
	</form>
	<div></div>
	<div></div>

	<div class="x1a" id="pgl0">
		<div>
			<span class="x1a" id="createaccount:dc12:pgl1"><div
					class="x247 xt7" id="createaccount:dc12:content">
					<table border="0" cellpadding="0" cellspacing="0"
						class="xuk p_AFCore p_AFDefault" role="presentation"
						style="font-size:1px;line-height:1px;height:7px" summary=""
						width="0">
						<tbody>
							<tr></tr>
						</tbody>
					</table>
					<div class="xvl p_AFCore p_AFDefault">
						<div class="x5s p_AFCore p_AFDefault"
							id="createaccount:dc12:content::content">
							<span class="x24h">请查看您的电子邮件</span>
							<div id="createaccount:dc12:sp1" style="margin-top:32px"></div>
							<span class="x24e">要使用您的帐户，请先确认您的电子邮件地址。</span>
							<div id="createaccount:dc12:sp3" style="margin-top:20px"></div>
							<span class="x24b">我们已向
								${user.email}发送了电子邮件，其中附有确认电子邮件地址的按钮。</span>
							<div id="createaccount:dc12:sp4" style="margin-top:20px"></div>
							<span class="x24b">您是否已收到该电子邮件？如果没有，请最晚在 3 天之内检查您的垃圾邮件夹或<a
								href="#">请求向您发送新的确认电子邮件</a>。如果您未能在
								3 天之内确认您的电子邮件地址，您将需要创建一个新帐户。如果您有问题，请参阅<a
								href="#">帐户帮助</a>。
							</span>
							<div id="createaccount:dc12:s4" style="margin-top:32px"></div>
						</div>
					</div>
					<div class="xvd p_AFCore p_AFDefault"></div>
				</div></span>
		</div>
	</div>
	<div></div>
	<div></div>
	﻿
	<footer class="sso-footer-wrap">
		<a href="#" target="_blank">帐户帮助</a> | <a href="#" target="_blank">订阅</a>
		| <a href="#" target="_blank">取消订阅</a> | <a href="#" target="_blank">使用条款和隐私</a>
		|

	</footer>
</body>
<script type="text/javascript">
	
	function submitForm() {
		var frm = document.getElementById("myFrom");
		var $code = $("input[name='code']").val();
		if ($code.trim() != "" && $code != null) {
			$.sendSuccessToTop('注册成功!将在3秒钟之后跳转到登录页面', 3000, function() {
				console.log('sendSuccessToTop closed')
			});
			setTimeout(function(){frm.submit()}, 3000);
			
		}

	}
	submitForm();
</script>

</html>