<%@ page language="java" import="java.util.*"
         contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/fonts/iconfont.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/common_js.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/footer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/lrtk.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/date.js" type="text/javascript"></script>
    <title>用户中心</title>
</head>
<script type="text/javascript">

    writeCurrentDate();
    $(document).ready(function () {
        $(".transaction_manage").eq(0).trigger('click');
        setInterval(showTime, 1000);

        function timer(obj, txt) {
            obj.text(txt);
        }

        function showTime() {
            var today = new Date();
            var weekday = new Array(7)
            weekday[0] = "星期日"
            weekday[1] = "星期一"
            weekday[2] = "星期二"
            weekday[3] = "星期三"
            weekday[4] = "星期四"
            weekday[5] = "星期五"
            weekday[6] = "星期六"
            var y = today.getFullYear() + "年";
            var month = today.getMonth() + 1 + "月";
            var td = today.getDate();
            var d = weekday[today.getDay()];
            var h = today.getHours();
            var m = today.getMinutes();
            var s = today.getSeconds();
            timer($("#y"), y + month);
            //timer($("#MH"),month);
            timer($("h1"), td);
            timer($("#D"), d);
            timer($("#H"), h);
            timer($("#M"), m);
            timer($("#S"), s);
        }
    })
</script>
<body>
<!--顶部图层-->
<div id="header_top">
    <div id="top">
        <div class="Inside_pages">
            <div class="Collection">
                下午好，欢迎光临锦宏颜！<em></em><a href="${pageContext.request.contextPath}/shoppingCollection/commodityList">收藏我们</a>
            </div>
            <div class="hd_top_manu clearfix">
                <ul class="clearfix">
                    <li class="hd_menu_tit zhuce" data-addclass="hd_menu_hover">欢迎光临本店！
                        <a href="${pageContext.request.contextPath }/login.jsp"
                           class="red"> <c:if test="${ not empty user.username}">
                            ${user.username}
                            <style>
                                #registered {
                                    display: none
                                }
                            </style>
                        </c:if> <c:if test="${empty user.username}">
                            [请登录]
                        </c:if>
                        </a> <c:if test="${empty user.username}">
                            新用户
                        </c:if> <a href="${pageContext.request.contextPath }/registered"
                                   class="red" id='registered'>[免费注册]</a>
                    </li>
                    <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a
                            href="${pageContext.request.contextPath }/orderInformationServlet">我的订单</a>
                    </li>
                    <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a
                            href="${pageContext.request.contextPath }/Cart.jsp">购物车</a></li>
                    <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a
                            href="#">联系我们</a></li>
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
                        </div>
                    </li>
                    <li class="hd_menu_tit phone_c" data-addclass="hd_menu_hover"><a
                            href="#" class="hd_menu "><em class="iconfont icon-shouji"></em>手机版</a>
                        <div class="hd_menu_list erweima">
                            <ul>
                                <img src="${pageContext.request.contextPath}/images/erweima.png" width="100px" height="100"/>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--样式-->
    <!--顶部样式2-->
    <div id="header " class="header page_style">
        <div class="logo">
            <a href="index.html"><img src="${pageContext.request.contextPath}/images/logo.png"/></a>
        </div>
        <!--结束图层-->
        <div class="Search">
            <p>
                <input name="" type="text" class="text"/><input name=""
                                                                type="submit" value="搜 索" class="Search_btn"/>
            </p>
            <p class="Words">
                <a href="#">苹果</a><a href="#">香蕉</a><a href="#">菠萝</a><a href="#">西红柿</a><a
                    href="#">橙子</a><a href="#">苹果</a>
            </p>
        </div>
        <!--购物车样式-->
        <div class="hd_Shopping_list" id="Shopping_list">
            <div class="s_cart">
                <em class="iconfont icon-cart2"></em><a href="${pageContext.request.contextPath}/shoppingTrolley/queryShoppingTrolley">我的购物车</a> <i
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
                    <a href="${pageContext.request.contextPath}/shoppingTrolley/queryShoppingTrolley" title="去购物车结算" id="btn-payforgoods" class="Shopping">去购物车结算</a>
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
                                                src="${pageContext.request.contextPath}/product/logo/34.jpg"/></a> <a href="#"
                                                                                   class="logo_Brands"><img
                                            src="${pageContext.request.contextPath}/product/logo/42.jpg"/></a> <a
                                            href="#" class="logo_Brands"><img
                                            src="${pageContext.request.contextPath}/product/logo/152.jpg"/></a> <a href="#"
                                                                                class="logo_Brands"><img
                                            src="${pageContext.request.contextPath}/product/logo/156.jpg"/></a>
                                        <a href="#" class="logo_Brands"><img
                                                src="${pageContext.request.contextPath}/product/logo/458.jpg"/></a> <a href="#"
                                                                                    class="logo_Brands"><img
                                            src="${pageContext.request.contextPath}/product/logo/339.jpg"/></a>
                                        <a href="#" class="logo_Brands"><img
                                                src="${pageContext.request.contextPath}/product/logo/245.jpg"/></a> <a href="#"
                                                                                    class="logo_Brands"><img
                                            src="${pageContext.request.contextPath}/product/logo/199.jpg"/></a>
                                        <a href="#" class="logo_Brands"><img
                                                src="${pageContext.request.contextPath}/product/logo/618.jpg"/></a> <a href="#"
                                                                                    class="logo_Brands"><img
                                            src="${pageContext.request.contextPath}/product/logo/644.jpg"/></a>
                                        <a href="#" class="AD_3"><img src="${pageContext.request.contextPath}/product/ad/2.jpg"/></a>
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
                titCell: ".Menu_list li",
                mainCell: ".menv_Detail",
            });
            </script>
            <!--菜单栏-->
            <div class="Navigation" id="Navigation">
                <ul class="Navigation_name">
                    <li><a href="${pageContext.request.contextPath}/index">首页</a></li>
                    <li><a
                            href="${pageContext.request.contextPath}/Footprint.jsp">日常护理</a></li>
                    <li><a href="${pageContext.request.contextPath}/Must_see.jsp">每日必看</a></li>
                    <li><a
                            href="${pageContext.request.contextPath}/commodity//toPage">产品列表</a></li>
                    <li><a
                            href="${pageContext.request.contextPath}/Buy_Brands.jsp">限时团购</a></li>
                    <li><a href="${pageContext.request.contextPath}/diy.jsp">礼品DIY</a></li>
                    <li><a
                            href="${pageContext.request.contextPath}/Group_buy.jsp">品牌团购</a></li>
                    <li><a href="#">联系我们</a></li>
                    <li><a href="${pageContext.request.contextPath}/index">简洁版</a></li>
                </ul>
            </div>
            <script>$("#Navigation").slide({
                titCell: ".Navigation_name li"
            });
            </script>
        </div>
    </div>
</div>
<!--用户中心样式-->
<div class="user_style clearfix">
    <div class="user_center clearfix">
        <!--左侧菜单图层-->
        <div class="left_style">
            <div class="menu_style">
                <div class="user_title">用户中心</div>
                <div class="user_Head">
                    <div class="user_portrait">
                        <a href="#" title="修改头像" class="btn_link"></a> <img src="${user.headPortrait}" />
                        <div class="background_img"></div>
                    </div>
                    <div class="user_name">
                        <p>
                            <span class="name">${user.username}</span> <a
                                href="${pageContext.request.contextPath}/User_changePassword">[修改密码]</a>
                        </p>
                        <script>writeCurrentDate();</script>
                        <span id="date">
								访问时间：
								</span>
                    </div>
                </div>
                <!--菜单列表图层-->
                <dl class="accountSideOption1">
                    <dt class="transaction_manage">
                        <em class="icon_1"></em>订单中心
                    </dt>
                    <dd>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/shoppingCollection/commodityList"> 我的订单</a></li>
                            <li><a href="${pageContext.request.contextPath}/shippingAddress/addressList">收货地址</a></li>
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
                            <li><a
                                    href="${pageContext.request.contextPath}/profile">
                                用户信息</a></li>
                            <li><a
                                    href="${pageContext.request.contextPath}/showCollectCommodityList">
                                我的收藏</a></li>
                            <li><a href="javascript:void(0)"> 我的留言</a></li>
                            <li><a href="javascript:void(0)">我的标签</a></li>
                            <!-- <li> <a href="user.php?act=affiliate"> 我的推荐</a></li> -->
                            <li><a href="javascript:void(0)"> 我的评论</a></li>
                        </ul>
                    </dd>
                </dl>
                <dl class="accountSideOption1">
                    <dt class="transaction_manage">
                        <em class="icon_3"></em>账户中心
                    </dt>
                    <dd>
                        <ul>
                            <li><a href="javascript:void(0)">我的红包</a></li>
                            <!--<a href="user.php?act=group_buy">我的团购</a>-->
                            <li><a href="javascript:void(0)"> 跟踪包裹</a></li>
                            <li><a href="javascript:void(0)"> 资金管理</a></li>
                        </ul>
                    </dd>
                </dl>
            </div>
        </div>
        <!--右侧内容图层-->
        <div class="right_style">
            <div class="r_user_style">
                <div class="Notice">
                    <i class="icon_Notice"></i><span>系统最新公告:</span>为了更好地服务于【每日鲜】的会员朋友及读者
                    发表意见。
                </div>
                <!--账户信息图层样式-->
                <div class="Account_info">
                    <div class="u_date">
                        <h4 id="y" class="years"></h4>
                        <h1></h1>
                        <h4 id="D"></h4>
                    </div>
                    <div class="user_name_info">
                        <ul>
                            <!--<li class="us_one">
        <div class="name left">用户名:<b>胡海天堂</b>,  欢迎你 <a href="#" class="link_user">[修改密码]</a>  </div>
        <div class="right time"> <span>上次访问时间：2015-5-21 10:23</span></div>
      </li>-->
                            <li class="us_two">
                                <dl>
                                    <dt class="left">余额：</dt>
                                    <dd>
                                        ￥<b>0</b>元
                                    </dd>
                                </dl>
                                <dl>
                                    <dt class="left">积分：</dt>
                                    <dd>
                                        <b>2355</b>分 &nbsp;<a href="#" class="link_user">[积分兑换]</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt class="left">红包：</dt>
                                    <dd>
                                        <b>2</b>个
                                    </dd>
                                </dl>
                            </li>
                            <li class="us_Order">
                                <dl>
                                    <dt class="left">未完成：</dt>
                                    <dd>
                                        <a href="#">无</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt class="left">已完成：</dt>
                                    <dd>
                                        <a href="#">2</a><a href="#" class="Address">[收货地址管理]</a>
                                    </dd>
                                </dl>
                            </li>
                            <li class="us_grade">
                                <dl>
                                    <dt class="left">等级：</dt>
                                    <dd>
                                        <b class="">普通会员</b><a href="#">[查看会员等级规则]</a>
                                    </dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--订单信息样式-->
                <div class="user_info_p_s clearfix">
                    <div class="left_user_cont">
                        <div class="us_Orders left clearfix">
                            <div class="Orders_name">
                                <div class="title_name">
                                    <div class="Records">购买记录</div>
                                    <div class="right select">只记录你最近30天的购买记录</div>
                                </div>
                            </div>
                            <table>
                                <thead>
                                <tr>
                                    <th>产品名称</th>
                                    <th>数量</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty orderInformations}">
                                    <c:forEach items="${orderInformations}" var="orderList">
                                        <tr>
                                            <td class="img_link"><a href="#" class="img"><img
                                                    src="${orderList.commodityImg}" width="80" height="80"></a> <a
                                                    href="#" class="title">${orderList.productName}</a></td>
                                            <td>1</td>
                                            <c:if test="${orderList.status ==1 }">
                                                <td>待付款</td>
                                            </c:if>
                                            <c:if test="${orderList.status ==2}">
                                                <td>待发货</td>
                                            </c:if>
                                            <c:if test="${orderList.status ==3 }">
                                                <td>待收货</td>
                                            </c:if>
                                            <c:if test="${orderList.status ==4 }">
                                                <td>完成</td>
                                            </c:if>
                                            <td><a href="#">查看</a></td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty orderInformations}">
                                    <tr>
                                        <td><img src="${pageContext.request.contextPath}/big/123456789.PNG"/></td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                            <div class="us_jls">共2条记录</div>
                        </div>
                    </div>
                    <!--右侧记录样式-->
                    <div class="right_user_recording">
                        <div class="us_Record">
                            <div id="Record_p" class="Record_p">
                                <div class="title_name">
                                    <span class="name left">浏览历史</span> <span
                                        class="pageState right"><span>1</span>/9</span>
                                </div>
                                <div class="hd">
                                    <a class="next">&lt;</a> <a class="prev">&gt;</a>
                                </div>
                                <div class="bd">
                                    <ul>
                                        <c:forEach items="${history}" var="history">
                                            <li>
                                                <div class="p_width">
                                                    <div class="pic">
                                                        <a href="javascript:void(0)"><img
                                                                src="${history.commodityImg}"/></a>
                                                    </div>
                                                    <div class="title">
                                                        <a href="#">${history.productName}</a>
                                                    </div>
                                                    <div class="Purchase_info">
                                                        <span class="p_Price">￥${history.commodityPrice}</span> <a
                                                            href="#" class="Purchase">立即购买</a>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>

                        </div>
                        <script type="text/javascript">jQuery("#Record_p").slide({
                            mainCell: ".bd ul",
                            effect: "leftLoop",
                            vis: 1,
                            autoPlay: false
                        });
                        </script>
                    </div>
                </div>
                <!--收藏商品-->
                <div class="Collections_p">
                    <div class="title_name">收藏的商品</div>
                    <div id="Collect_Product" class="Collect_Products">
                        <div class="hd">
                            <a class="next">&lt;</a> <a class="prev">&gt;</a>
                        </div>
                        <div class="bd">
                            <ul>
                                <c:forEach items="${goodsCollectionList }" var="goodsCollectionList">
                                    <li>
                                        <div class="pic">
                                            <a href=""><img src="${goodsCollectionList.commodityImg}"></a>
                                        </div>
                                        <div class="title">
                                            <a href="#">${goodsCollectionList.productName }</a>
                                        </div>
                                        <div class="p_Price">￥${goodsCollectionList.commodityPrice}</div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                    <script type="text/javascript">jQuery("#Collect_Product").slide({
                        mainCell: ".bd ul",
                        effect: "leftLoop",
                        vis: 5,
                        autoPlay: false
                    });
                    </script>
                </div>
                <!--结束-->
            </div>
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
            <a href="${pageContext.request.contextPath}/shoppingTrolley/queryShoppingTrolley"><p
                    class="good_cart">${shoppingTrolleys.stream().count()}</p> <span
                    class="fixeBoxSpan iconfont icon-cart"></span> <strong>购物车</strong>
                <div class="cartBox">
                    <div class="bjfff"></div>
                    <div class="message">购物车内暂无商品，赶紧选购吧</div>
                </div>
            </a>
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
            </div>
        </li>
        <li class="fixeBoxLi code cart_bd " style="display:block;"
            id="cartboxs"><span class="fixeBoxSpan iconfont icon-erweima"></span>
            <strong>微信</strong>
            <div class="cartBox">
                <div class="bjfff"></div>
                <div class="QR_code">
                    <p>
                        <img src="${pageContext.request.contextPath}/images/erweim.jpg" width="150px" height="150px"
                             style=" margin-top:10px;"/>
                    </p>
                    <p>微信扫一扫，关注我们</p>
                </div>
            </div>
        </li>

        <li class="fixeBoxLi Home"><a href="/shoppingCollection/commodityList"> <span
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
