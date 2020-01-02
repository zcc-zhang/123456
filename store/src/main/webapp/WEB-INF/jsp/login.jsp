<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/src/css/dialog.css" type="text/css">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/fonts/iconfont.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/common_js.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/footer.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/lrtk.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/src/jquery.dialog.min.js"></script>
<title>用户登陆</title>
</head>
<body>
<div class="log_bg">
 <div class="top">
   <div class="logo"><div class="logo_link"><a href="index"><img src="${pageContext.request.contextPath}/images/logo.png"></a></div><div class="phone">免费咨询热线：<b>400-567-4556</b></div></div>

  </div>
 <div class="login">
   <div class="log_img"><img src="${pageContext.request.contextPath}/images/imgbg_03.png" width="611" height="425"></div>
   <div class="log_c">
    <form action="${pageContext.request.contextPath }/user/login" method="post">
    <table border="0"  cellspacing="0" cellpadding="0">
              <tbody><tr height="50" valign="top">
              	<td width="55">&nbsp;</td>
                <td>
                	<span class="fl" style="font-size:24px;">
	                	<c:if test="">登入</c:if>
	                	<c:if test="${message==1}">
	                		<script>
	                		$.sendWarningToTop('用户名或密码输入错误！', 3000, function() {
								console.log('sendWarningToTop closed');
								$("input[name=username]").focus(function(){
									$(this).select();
								});
								$("input[name=password]").focus(function(){
									$(this).select();
								});
							});
	                		</script>
	                	</c:if>
	                	<c:if test="${message==2}">
	                		<script>
	                		$.sendWarningToTop('请先登录！', 3000, function() {
								console.log('sendWarningToTop closed');
								$("input[name=username]").focus(function(){
									$(this).select();
								});
								$("input[name=password]").focus(function(){
									$(this).select();
								});
							});
	                		</script>
	                	</c:if>
                	</span>
                    <span class="fr">还没有商城账号，<a href="${pageContext.request.contextPath}/registered" style="color:#ff4e00;">立即注册</a></span>
                </td>
              </tr>
              <tr height="70">
                <td>用户名</td>
                <td><input type="text" value="" class="l_user" name ="username" /></td>
              </tr>
              <tr height="70">
                <td>密&nbsp; &nbsp; 码</td>
                <td><input type="password" value="" class="l_pwd" name ="password"></td>
              </tr>
              <tr>
              	<td>&nbsp;</td>
                <td style="font-size:12px; padding-top:20px;">
                	<span style="font-family:'宋体';" class="fl">
                    	<label class="r_rad"><input type="checkbox" checked="checked"></label><label class="r_txt">请保存我这次的登录信息</label>
                    </span>
                    <span class="fr"><a href="${pageContext.request.contextPath}/resetPassword" style="color:#ff4e00;">忘记密码</a></span>
                </td>
              </tr>
              <tr height="60">
              	<td>&nbsp;</td>
                <td><input type="submit" value="登录" class="log_btn" name="login"></td>
              </tr>
            </tbody></table>
    </form>
   </div>
 </div>
 <div class="btmbg">
    <div class="btm">
        备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br>

    </div>    	
</div>
</div>
</body>
</html>
