<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/fonts/iconfont.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/passwordIntensity.css" type="text/css">
	<!--CSS RESET-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/src/css/dialog.css" type="text/css">
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/common_js.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/footer.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/lrtk.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/src/jquery.dialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/passwordIntensity.js"></script>
	<title>用户注册</title>
	<script type="text/javascript">
			
				$(function() {
					var show_num = [];
					draw(show_num);
					$("#canvas").on('click', function() {
						draw(show_num);
					});
					$('#chreck').on('click', function() {
						draw(show_num);
					});
					$("input[name='username']").blur(checkUser);
					$("input[name='password']").blur(checkPwd);
					$("input[name='rePassword']").blur(checkPasswords)
					$("input[name='email']").blur(checlEmail)
					/*
					*验证用户输入是否合法
					*/
					$("#buyerFrom").submit(function() {
						var flag = true;
			
						if (!checkUser()) {
							flag = false;
						}
						if (!checkPwd()) {
							flag = false;
						}
						if (!checkPasswords()) {
							flag = false;
						}
						if (!checlEmail()) {
							flag = false;
						}
						if(!callBack())
						{
							flag=false;	
						}
						if (!checkCode()) {
							flag = false;
						}
						if (flag) {
							if ($("input[type=checkbox]").is(':checked')) {
								message();
							} else {
								flag = false;
								$.sendWarningToTop('您还未勾选用户协议！', 3000, function() {
									console.log('sendWarningToTop closed');
								});
							}
						}
			
						return flag;
					});
					/****提示信息****/
					function message() {
						$.sendSuccessToTop('激活码已发送至您的邮箱请注意查收', 3000, function() {
							console.log('sendSuccessToTop closed')
						});
			
					}
					$(".l_ipt").keyup(checkCode);
					function checkCode() {
						var val = $(".l_ipt").val();
						var num = show_num.join("");
						if (val == '') {
							$('#message').html('<font color="blue">请输入验证码!</font>');
							return false;
						} else if (val == num) {
							$('#message').html('<font color="green">验证成功!');
							return true;
						//			$(".l_ipt").val('');
						// draw(show_num);
						} else {
							$('#message').html('<font color="red">验证码输入错误请重新输入!</font>');
							return false;
						//				$(".l_ipt").val('');
						// draw(show_num);
						}
					}
					/**
					 * 校验用户
					 */
					function checkUser() {
						var $user = $("input[name='username']").val();
						if ($user == null || "" == $user.trim()) {
							$.sendWarningToTop('用户名不能为空', 3000, function() {
								console.log('sendWarningToTop closed');
							});
							return false;
						}
						$.sendSuccessToTop('用户名校验成功', 3000, function() {
							console.log('sendSuccessToTop closed');
						});
						return true;
					}
			
					/**
					 * 校验密码
					 */
					function checkPwd() {
						var $regPass = /^[a-zA-Z0-9.@#!$%]{4,16}$/;
						var $pass = $("input[name='password']").val();
						if ($regPass.test($pass) == false) {
							$.sendWarningToTop('密码由英文字母和数字组成的4-16位字符，以字母开头', 3000, function() {
								console.log('sendWarningToTop closed');
							});
							return false;
						}
						$.sendSuccessToTop('密码校验成功', 3000, function() {
							console.log('sendSuccessToTop closed');
						});
						return true;
					}
					/**
					 * 确认密码
					 * */
					function checkPasswords() {
						var $repwd = $("input[name='rePassword']").val();
						var $pwd = $("input[name='password']").val();
						var $prompt = $("#repwd_prompt");
						if ($repwd.trim() == $pwd.trim()) {
							$prompt.html("");
							return true;
						} else {
							$.sendWarningToTop('两次输入的密码不一致', 3000, function() {
								console.log('sendWarningToTop closed');
							});
							return false;
						}
					}
			
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
						
						$.ajax({ //校验邮箱
							url : "${pageContext.request.contextPath}/userServlet",
							type : "post",
							data : {
								'flag' : 'email',
								'email' : $email
							},
							success : callBack
						});
						return true;
					}
					function callBack(data)
					{
						if (data == '1') {
							$.sendWarningToTop('邮箱已被注册', 3000, function() {
								console.log('sendWarningToTop closed');
							});
							return false;
						} else {
							$.sendSuccessToTop('邮箱校验成功', 3000, function() {
								console.log('sendSuccessToTop closed');
							});
							return true;
						}
					}
				});
				//莽聰聼忙聢聬氓鹿露忙赂虏忙聼聯氓聡潞茅陋聦猫炉聛莽聽聛氓聸戮氓陆垄
				function draw(show_num) {
					var canvas_width = $('#canvas').width(); //获取canvas长
					var canvas_height = $('#canvas').height(); //获取canvas高
					var canvas = document.getElementById("canvas"); //获取canvas控件
					var context = canvas.getContext("2d"); //返回一个用于在画布上绘图的环境（2D）
					canvas.width = canvas_width; //设置长
					canvas.height = canvas_height; //设置高
					var sCode = "a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z,A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0"; //定义验证码中会出现的字符
					var aCode = sCode.split(","); //去除，
					var aLength = aCode.length; //拿acode数组的长度
					for (var i = 0; i < 4; i++) { //生成四位随机数
						var j = Math.floor(Math.random() * aLength); //得到随机索引访问数组
						// var deg = Math.random() * 30 * Math.PI / 180;//盲潞搂莽聰聼0~30盲鹿聥茅聴麓莽職聞茅職聫忙聹潞氓录搂氓潞娄
						var deg = Math.random() - 0.5; //让字体展示出倾斜的样子
						var txt = aCode[j]; //根据随机数作为索引访问数组-->循环四次的到完整的验证码
						show_num[i] = txt.toLowerCase();
						var x = 10 + i * 20; //忙重新映射画布上的x轴 位置。
						var y = 20 + Math.random() * 8; //重新映射画布上的 y轴 位置。
						context.font = "bold 23px 新宋体"; //设置字体
						context.translate(x, y); //把当前画布的原点移到(x,y),后面的操作都以(x,y)作为参照点，默认原点为(0,0)
						context.rotate(deg); //字体倾斜
						context.fillStyle = randomColor(); //以随机颜色填充该控件
						context.fillText(txt, 0, 0); // 画布上绘制填色的文本。文本的默认颜色是黑色。
						context.rotate(-deg); //旋转当前的绘图。
						context.translate(-x, -y);
					}
					for (var i = 0; i <= 5; i++) { //干扰线
						context.strokeStyle = randomColor();
						context.beginPath();
						context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
						context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
						context.stroke();
					}
			
					for (var i = 0; i <=30; i++) { //干扰点
						context.strokeStyle = randomColor();
						context.beginPath();
						var x = Math.random() * canvas_width;
						var y = Math.random() * canvas_height;
						context.moveTo(x, y);
						context.lineTo(x + 1, y + 1);
						context.stroke();
					}
				}
				/**生成随机颜色**/
				function randomColor() {
					var r = Math.floor(Math.random() * 256);
					var g = Math.floor(Math.random() * 256);
					var b = Math.floor(Math.random() * 256);
					return "rgb(" + r + "," + g + "," + b + ")";
				}
	</script>
	<style type="text/css">
#canvas {
	vertical-align: middle;
	box-sizing: border-box;
	border: 1px solid #ddd;
	cursor: pointer;
	height: 40px;
	margin-left: 5px;
	margin-bottom: 3px;
}

</style>
</head>

<body>
	<div class="log_bg">
		<div class="top">
			<div class="logo">
				<div class="logo_link">
					<a href="Index.html"><img src="images/logo.png"></a>
				</div>
				<div class="phone">
					免费咨询热线：<b>400-567-4556</b>
				</div>
			</div>
		</div>
		<div class="regist">
			<div class="log_img">
				<img src="images/imgbg_03.png" width="611" height="425" />
			</div>
			<div class="reg_c" id="registered">

				<div class="bd">
					<ul>
						<form id='buyerFrom'
							action="${pageContext.request.contextPath}/user//registerCode"
							method="post">
							<table border="0"
								style="width:720px; font-size:14px; margin-top:20px;"
								cellspacing="0" cellpadding="0">
								<tbody>
									<tr height="50" valign="top">
										<td width="95">&nbsp;</td>
										<td><span class="fl" style="font-size:24px;">注册</span> <span
											class="fr">已有商城账号，<a
												href="${pageContext.request.contextPath}/login.jsp"
												style="color:#ff4e00;">我要登录</a></span></td>
										<tr height="50">
										<td align="right"><font color="#ff4e00">*</font>&nbsp;用户名&nbsp;</td>
											<td><input type="text" name="username" class="l_user"></td>
										</tr>
										<tr height="50">
											<td align="right"><font color="#ff4e00">*</font>&nbsp;密码
												&nbsp;</td> &nbsp;
											</td>
											<td><input type="password" name="password" class="l_pwd"><span><div
															class="ywz_zhuce_xiaoxiaobao">
															<div class="ywz_zhuce_huixian" id="pwdLevel_1">弱</div>
															<div class="ywz_zhuce_huixian" id="pwdLevel_2">中</div>
															<div class="ywz_zhuce_huixian" id="pwdLevel_3">强</div>
														</div> </span></td>
										</tr>
										<tr height="50">
											<td align="right"><font color="#ff4e00">*</font>&nbsp;确认密码
												&nbsp;</td>
											<td><input type="password" name="rePassword"
												class="l_pwd"></td>
										</tr>
										<tr height="50">
											<td align="right"><font color="#ff4e00">*</font>&nbsp;邮箱
												&nbsp;</td>
											<td><input type="text" name="email" value=""
												class="l_email"></td>
										</tr>
										<tr height="50">
											<td align="right"><font color="#ff4e00">*</font>&nbsp;验证码
												&nbsp;</td>

											<td><input type="text" value="" class="l_ipt"><canvas
														id="canvas" width="100" height="30"></canvas><a
													id="chreck" href="javascript:void(0)"
													style="font-size:12px; font-family:'宋体'; margin-left: 2px">换一张</a></td>
										</tr>
										<tr id="mess" height="50">
											<td>&nbsp;</td>
											<td><span id='message'></span></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td style="font-size:12px; padding-top:20px;"><span
												style="font-family:'宋体';" class="fl"> <label
													class="r_rad"><input type="checkbox"
														checked="checked"></label><label class="r_txt">我已阅读并接受《用户协议》</label>
											</span></td>
										</tr>
										<tr height="60">
											<td>&nbsp;</td>
											<td><input type="submit" value="立即注册" class="log_btn" /></td>
										</tr>
								</tbody>
							</table>
						</form>
					</ul>

				</div>
			</div>

			<script>
				jQuery("#registered").slide({
					trigger : "click"
				});
			</script>
		</div>
		<div class="btmbg">
			<div class="btm">
				备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com Copyright © 2015-2018
				Technical Support: Dgg Group <br>
			</div>
		</div>
	</div>
</body>
</html>
