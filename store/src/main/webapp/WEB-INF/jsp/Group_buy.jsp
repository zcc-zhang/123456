<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" %>
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
    <script type="text/javascript">
        $(function () {
            $(".Navigation_name li").eq(0).removeClass("on");
            $(".Navigation_name li").eq(6).addClass("on");
        });
    </script>
    <title>限时团购</title>
</head>

<body>
<!--顶部图层-->
<div id="header_top">
    <div id="top">
        <div class="Inside_pages">
            <div class="Collection">下午好，欢迎光临锦宏颜！<em></em><a href="#">收藏我们</a></div>
            <div class="hd_top_manu clearfix">
                <ul class="clearfix">
                    <li class="hd_menu_tit zhuce" data-addclass="hd_menu_hover">欢迎光临本店！
                        <a href="${pageContext.request.contextPath }/login" class="red">
                            <c:if test="${ not empty user.username}">
                                ${user.username}
                                <style>#registered {
                                    display: none
                                }</style>
                            </c:if>
                            <c:if test="${empty user.username}">
                                [请登录]
                            </c:if> </a>
                        <c:if test="${empty user.username}">
                            新用户
                        </c:if>
                        <a href="${pageContext.request.contextPath }/registered" class="red"
                           id='registered'>[免费注册]</a>
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
                        </div>
                    </li>
                    <li class="hd_menu_tit phone_c" data-addclass="hd_menu_hover"><a
                            href="#" class="hd_menu "><em class="iconfont icon-shouji"></em>手机版</a>
                        <div class="hd_menu_list erweima">
                            <ul>
                                <img src="${pageContext.request.contextPath}/images/erweima.png" width="100px"
                                     height="100"/>
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
        <div class="logo"><a href="index.html"><img src="${pageContext.request.contextPath}/images/logo.png"/></a></div>
        <!--结束图层-->
        <div class="Search">
            <p><input name="" type="text" class="text"/><input name="" type="submit" value="搜 索" class="Search_btn"/>
            </p>
            <p class="Words"><a href="#">苹果</a><a href="#">香蕉</a><a href="#">菠萝</a><a href="#">西红柿</a><a href="#">橙子</a><a
                    href="#">苹果</a></p>
        </div>
        <!--购物车样式-->
        <div class="hd_Shopping_list" id="Shopping_list">
            <div class="s_cart"><em class="iconfont icon-cart2"></em><a href="#">我的购物车</a> <i
                    class="ci-right">&gt;</i><i class="ci-count" id="shopping-amount">0</i></div>
            <div class="dorpdown-layer">
                <div class="spacer"></div>
                <!--<div class="prompt"></div><div class="nogoods"><b></b>购物车中还没有商品，赶紧选购吧！</div>-->
                <ul class="p_s_list">
                    <li>
                        <div class="img"><img src="${pageContext.request.contextPath}/images/tianma.png"></div>
                        <div class="content"><p><a href="#">产品名称</a></p>
                            <p>颜色分类:紫花8255尺码:XL</p></div>
                        <div class="Operations">
                            <p class="Price">￥55.00</p>
                            <p><a href="#">删除</a></p></div>
                    </li>
                </ul>
                <div class="Shopping_style">
                    <div class="p-total">共<b>1</b>件商品　共计<strong>￥ 515.00</strong></div>
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
                <div class="Category"><a href="#"><em></em>所有产品分类</a></div>
                <div class="hd_allsort_out_box_new">
                    <!--左侧栏目开始-->
                    <ul class="Menu_list">
                        <li class="name">
                            <div class="Menu_name"><a href="product_list.html">面部护理</a> <span>&lt;</span></div>
                            <div class="link_name">
                                <p><a href="Product_Detailed.html">茅台</a> <a href="#">五粮液</a> <a href="#">郎酒</a> <a
                                        href="#">剑南春</a></p>
                            </div>
                            <div class="menv_Detail">
                                <div class="cat_pannel clearfix">
                                    <div class="hd_sort_list">
                                        <dl class="clearfix" data-tpc="1">
                                            <dt><a href="#">面膜<i>></i></a></dt>
                                            <dd><a href="#">撕拉面膜</a><a href="#">面膜贴</a><a href="#">免洗面膜</a><a href="#">水洗面膜</a>
                                            </dd>
                                        </dl>
                                        <dl class="clearfix" data-tpc="2">
                                            <dt><a href="#">洁面<i>></i></a></dt>
                                            <dd><a href="#">洁面摩丝</a><a href="#">洁面乳 </a><a href="#">洁面啫哩/胶</a><a
                                                    href="#">面部去角质/磨砂</a><a href="#">洁面膏/霜</a><a href="#">洁肤皂</a></dd>
                                        </dl>
                                        <dl class="clearfix" data-tpc="3">
                                            <dt><a href="#">化妆水<i>></i></a></dt>
                                            <dd><a href="#"> 喷雾</a><a href="#"> 精华水</a><a href="#"> 柔肤水</a><a href="#">爽肤水</a><a
                                                    href="#">收敛水/紧肤水</a></dd>
                                        </dl>
                                        <dl class="clearfix" data-tpc="4">
                                            <dt><a href="#">眼部护理<i>></i></a></dt>
                                            <dd><a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a href="#">眼霜</a>
                                            </dd>
                                        </dl>
                                        <dl class="clearfix" data-tpc="4">
                                            <dt><a href="#">眼部护理<i>></i></a></dt>
                                            <dd><a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a href="#">眼霜</a>
                                            </dd>
                                        </dl>
                                        <dl class="clearfix" data-tpc="4">
                                            <dt><a href="#">防晒<i>></i></a></dt>
                                            <dd><a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a href="#">眼霜</a>
                                            </dd>
                                        </dl>
                                        <dl class="clearfix" data-tpc="4">
                                            <dt><a href="#">唇部护理<i>></i></a></dt>
                                            <dd><a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a href="#">眼霜</a>
                                            </dd>
                                        </dl>
                                        <dl class="clearfix" data-tpc="4">
                                            <dt><a href="#">乳液/面霜<i>></i></a></dt>
                                            <dd><a href="#"> 乳液</a><a href="#"> 面霜</a><a href="#">按摩霜</a><a href="#">面部啫喱</a><a
                                                    href="#">凝露/凝胶</a></dd>
                                        </dl>
                                    </div>
                                    <div class="Brands">
                                        <a href="#" class="logo_Brands"><img
                                                src="${pageContext.request.contextPath}/product/logo/34.jpg"/></a>
                                        <a href="#" class="logo_Brands"><img
                                                src="${pageContext.request.contextPath}/product/logo/42.jpg"/></a>
                                        <a href="#" class="logo_Brands"><img
                                                src="${pageContext.request.contextPath}/product/logo/152.jpg"/></a>
                                        <a href="#" class="logo_Brands"><img
                                                src="${pageContext.request.contextPath}/product/logo/156.jpg"/></a>
                                        <a href="#" class="logo_Brands"><img
                                                src="${pageContext.request.contextPath}/product/logo/458.jpg"/></a>
                                        <a href="#" class="logo_Brands"><img
                                                src="${pageContext.request.contextPath}/product/logo/339.jpg"/></a>
                                        <a href="#" class="logo_Brands"><img
                                                src="${pageContext.request.contextPath}/product/logo/245.jpg"/></a>
                                        <a href="#" class="logo_Brands"><img
                                                src="${pageContext.request.contextPath}/product/logo/199.jpg"/></a>
                                        <a href="#" class="logo_Brands"><img
                                                src="${pageContext.request.contextPath}/product/logo/618.jpg"/></a>
                                        <a href="#" class="logo_Brands"><img
                                                src="${pageContext.request.contextPath}/product/logo/644.jpg"/></a>
                                        <a href="#" class="AD_3"><img
                                                src="${pageContext.request.contextPath}/product/ad/2.jpg"/></a>
                                    </div>
                                </div>
                                <!--品牌-->
                            </div>
                        </li>
                        <li class="name">
                            <div class="Menu_name"><a href="#">身体护理</a><span>&lt;</span></div>
                            <div class="link_name">
                                <a href="Product_Detailed.html"> 面霜</a><a href="#">眼霜</a><a href="#"> 面膜</a><a href="#">护肤套装</a>

                            </div>
                            <div class="menv_Detail">
                                <div class="cat_pannel clearfix">
                                </div>
                            </div>
                        </li>
                        <li class="name">
                            <div class="Menu_name"><a href="#">香水彩妆</a><span>&lt;</span></div>
                            <div class="link_name">
                                <a href="#">卸妆 </a><a href="#">防晒</a><a href="#">BB</a>
                                <a href="#">女士香水</a>
                            </div>
                            <div class="menv_Detail">
                                <div class="cat_pannel clearfix">
                                </div>
                            </div>
                        </li>
                        <li class="name">
                            <div class="Menu_name"><a href="#">洗发护发</a><span>&lt;</span></div>
                            <div class="link_name">
                                <a href="#">洗发</a><a href="#">护发</a><a href="#">沐浴</a><a href="#">润肤乳</a>
                            </div>
                            <div class="menv_Detail">
                                <div class="cat_pannel clearfix">
                                </div>
                            </div>
                        </li>
                        <li class="name">
                            <div class="Menu_name"><a href="#">女性护理</a><span>&lt;</span></div>
                            <div class="link_name">
                                <a href="#">洁面</a><a href="#">坚果炒货</a><a href="#">乳液</a>
                                <a href="#"> 面霜</a>
                            </div>
                            <div class="menv_Detail">
                                <div class="cat_pannel clearfix">
                                </div>
                            </div>
                        </li>
                        <li class="name">
                            <div class="Menu_name"><a href="#">男性护理</a><span>&lt;</span></div>
                            <div class="link_name">
                                <a href="#">洁面</a><a href="#">坚果炒货</a><a href="#">乳液</a>
                                <a href="#"> 面霜</a>
                            </div>
                            <div class="menv_Detail">
                                <div class="cat_pannel clearfix">
                                </div>
                            </div>
                        </li>
                        <li class="name">
                            <div class="Menu_name"><a href="#">推荐品牌</a><span>&lt;</span></div>
                            <div class="link_name">
                                <a href="#">欧莱雅</a><a href="#"> 菲诗小铺</a><a href="#"> 雅诗兰黛</a>
                            </div>
                            <div class="menv_Detail">
                                <div class="cat_pannel clearfix">
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <script>$("#allSortOuterbox").slide({titCell: ".Menu_list li", mainCell: ".menv_Detail",});</script>
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
            <script>$("#Navigation").slide({titCell: ".Navigation_name li"});</script>
        </div>
    </div>
</div>
<!--广告-->
<div style=" background-image:url(${pageContext.request.contextPath}/images/ADimg_02.png); background-position:center; background-repeat:no-repeat; height:400px;"></div>
<!--团购样式-->
<div class="Inside_pages">
    <!--团购列表样式-->
    <div class="group_buy  clearfix">
        <div class="group_list">
            <ul class="group_info">
                <li class="group_img"><a href="#"><img src="${pageContext.request.contextPath}/product/p_21.jpg"></a>
                </li>
                <li class="group_name">
                    <a href="#">透真玻尿酸多效保湿蚕丝面膜贴20片（补水保湿滋润护肤品套装女）</a>
                    <div class="group_content">松软蛋糕 棉花糖夹心 香甜软糯 松软可口</div>
                    <div class="group_Price"><span>团购价：</span><i>￥</i><em>45.00</em></div>
                    <div class="Original_Price">原价：￥65.20</div>
                    <a href="#" class="buy_botton">立即购买</a>
                </li>
            </ul>
        </div>
        <div class="group_list">
            <ul class="group_info">
                <li class="group_img"><a href="#"><img src="${pageContext.request.contextPath}/product/p_5.jpg"></a>
                </li>
                <li class="group_name">
                    <a href="#">好丽友 巧克力派48枚1.6kg 休闲零食大礼包</a>
                    <div class="group_content">松软蛋糕 棉花糖夹心 香甜软糯 松软可口</div>
                    <div class="group_Price"><span>团购价：</span><i>￥</i><em>45.00</em></div>
                    <div class="Original_Price">原价：￥65.20</div>
                    <a href="#" class="buy_botton">立即购买</a>
                </li>
            </ul>
        </div>
        <div class="group_list">
            <ul class="group_info">
                <li class="group_img"><a href="#"><img src="${pageContext.request.contextPath}/product/p_15.jpg"></a>
                </li>
                <li class="group_name">
                    <a href="#">好丽友 巧克力派48枚1.6kg 休闲零食大礼包</a>
                    <div class="group_content">松软蛋糕 棉花糖夹心 香甜软糯 松软可口</div>
                    <div class="group_Price"><span>团购价：</span><i>￥</i><em>45.00</em></div>
                    <div class="Original_Price">原价：￥65.20</div>
                    <a href="#" class="buy_botton">立即购买</a>
                </li>
            </ul>
        </div>
        <div class="group_list">
            <ul class="group_info">
                <li class="group_img"><a href="#"><img src="${pageContext.request.contextPath}/product/p_9.jpg"></a>
                </li>
                <li class="group_name">
                    <a href="#">好丽友 巧克力派48枚1.6kg 休闲零食大礼包</a>
                    <div class="group_content">松软蛋糕 棉花糖夹心 香甜软糯 松软可口</div>
                    <div class="group_Price"><span>团购价：</span><i>￥</i><em>45.00</em></div>
                    <div class="Original_Price">原价：￥65.20</div>
                    <a href="#" class="buy_botton">立即购买</a>
                </li>
            </ul>
        </div>
        <div class="group_list">
            <ul class="group_info">
                <li class="group_img"><a href="#"><img src="${pageContext.request.contextPath}/product/p_19.jpg"></a>
                </li>
                <li class="group_name">
                    <a href="#">好丽友 巧克力派48枚1.6kg 休闲零食大礼包</a>
                    <div class="group_content">松软蛋糕 棉花糖夹心 香甜软糯 松软可口</div>
                    <div class="group_Price"><span>团购价：</span><i>￥</i><em>45.00</em></div>
                    <div class="Original_Price">原价：￥65.20</div>
                    <a href="#" class="buy_botton">立即购买</a>
                </li>
            </ul>
        </div>
        <div class="group_list">
            <ul class="group_info">
                <li class="group_img"><a href="#"><img src="${pageContext.request.contextPath}/product/p_8.jpg"></a>
                </li>
                <li class="group_name">
                    <a href="#">好丽友 巧克力派48枚1.6kg 休闲零食大礼包</a>
                    <div class="group_content">松软蛋糕 棉花糖夹心 香甜软糯 松软可口</div>
                    <div class="group_Price"><span>团购价：</span><i>￥</i><em>45.00</em></div>
                    <div class="Original_Price">原价：￥65.20</div>
                    <a href="#" class="buy_botton">立即购买</a>
                </li>
            </ul>
        </div>
        <div class="group_list">
            <ul class="group_info">
                <li class="group_img"><a href="#"><img src="${pageContext.request.contextPath}/product/p_10.jpg"></a>
                </li>
                <li class="group_name">
                    <a href="#">好丽友 巧克力派48枚1.6kg 休闲零食大礼包</a>
                    <div class="group_content">松软蛋糕 棉花糖夹心 香甜软糯 松软可口</div>
                    <div class="group_Price"><span>团购价：</span><i>￥</i><em>45.00</em></div>
                    <div class="Original_Price">原价：￥65.20</div>
                    <a href="#" class="buy_botton">立即购买</a>
                </li>
            </ul>
        </div>
        <div class="group_list">
            <ul class="group_info">
                <li class="group_img"><a href="#"><img src="${pageContext.request.contextPath}/product/p_11.jpg"></a>
                </li>
                <li class="group_name">
                    <a href="#">好丽友 巧克力派48枚1.6kg 休闲零食大礼包</a>
                    <div class="group_content">松软蛋糕 棉花糖夹心 香甜软糯 松软可口</div>
                    <div class="group_Price"><span>团购价：</span><i>￥</i><em>45.00</em></div>
                    <div class="Original_Price">原价：￥65.20</div>
                    <a href="#" class="buy_botton">立即购买</a>
                </li>
            </ul>
        </div>

        <div class="group_list">
            <ul class="group_info">
                <li class="group_img"><a href="#"><img src="${pageContext.request.contextPath}/product/p_12.jpg"></a>
                </li>
                <li class="group_name">
                    <a href="#">好丽友 巧克力派48枚1.6kg 休闲零食大礼包</a>
                    <div class="group_content">松软蛋糕 棉花糖夹心 香甜软糯 松软可口</div>
                    <div class="group_Price"><span>团购价：</span><i>￥</i><em>45.00</em></div>
                    <div class="Original_Price">原价：￥65.20</div>
                    <a href="#" class="buy_botton">立即购买</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="slogen">
    <div class="index_style">
        <ul class="wrap">
            <li>
                <a href="#"><img src="${pageContext.request.contextPath}/images/slogen_34.png"
                                 data-bd-imgshare-binded="1"></a>
                <b>安全保证</b>
                <span>多重保障机制 认证商城</span>
            </li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/images/slogen_28.png"
                                 data-bd-imgshare-binded="2"></a>
                <b>正品保证</b>
                <span>正品行货 放心选购</span>
            </li>
            <li>
                <a href="#"><img src="${pageContext.request.contextPath}/images/slogen_30.png"
                                 data-bd-imgshare-binded="3"></a>
                <b>七天无理由退换</b>
                <span>七天无理由保障消费权益</span>
            </li>
            <li>
                <a href="#"><img src="${pageContext.request.contextPath}/images/slogen_31.png"
                                 data-bd-imgshare-binded="4"></a>
                <b>天天低价</b>
                <span>价格更低，质量更可靠</span>
            </li>
        </ul>
    </div>
</div>
<!--底部图层-->
<div class="phone_style">
    <div class="index_style">
        <span class="phone_number"><em class="iconfont icon-dianhua"></em>400-4565-345</span><span class="phone_title">客服热线 7X24小时 贴心服务</span>
    </div>
</div>
<div class="footerbox clearfix">
    <div class="clearfix">
        <div class="">
            <dl>
                <dt>新手上路</dt>
                <dd><a href="#">售后流程</a></dd>
                <dd><a href="#">购物流程</a></dd>
                <dd><a href="#">订购方式</a></dd>
                <dd><a href="#">隐私声明 </a></dd>
                <dd><a href="#">推荐分享说明 </a></dd>
            </dl>
            <dl>
                <dt>配送与支付</dt>
                <dd><a href="#">保险需求测试</a></dd>
                <dd><a href="#">专题及活动</a></dd>
                <dd><a href="#">挑选保险产品</a></dd>
                <dd><a href="#">常见问题 </a></dd>
            </dl>
            <dl>
                <dt>售后保障</dt>
                <dd><a href="#">保险需求测试</a></dd>
                <dd><a href="#">专题及活动</a></dd>
                <dd><a href="#">挑选保险产品</a></dd>
                <dd><a href="#">常见问题 </a></dd>
            </dl>
            <dl>
                <dt>支付方式</dt>
                <dd><a href="#">保险需求测试</a></dd>
                <dd><a href="#">专题及活动</a></dd>
                <dd><a href="#">挑选保险产品</a></dd>
                <dd><a href="#">常见问题 </a></dd>
            </dl>
            <dl>
                <dt>帮助中心</dt>
                <dd><a href="#">保险需求测试</a></dd>
                <dd><a href="#">专题及活动</a></dd>
                <dd><a href="#">挑选保险产品</a></dd>
                <dd><a href="#">常见问题 </a></dd>
            </dl>
        </div>
    </div>
    <div class="text_link">
        <p>
            <a href="#">关于我们</a>｜ <a href="#">公开信息披露</a>｜ <a href="#">加入我们</a>｜ <a href="#">联系我们</a>｜ <a
                href="#">版权声明</a>｜ <a href="#">隐私声明</a>｜ <a href="#">网站地图</a></p>
        <p>蜀ICP备11017033号 Copyright ©2011 成都福际生物技术有限公司 All Rights Reserved. Technical support:CDDGG Group</p>
    </div>
</div>
<!--右侧菜单栏购物车样式-->
<div class="fixedBox">
    <ul class="fixedBoxList">
        <li class="fixeBoxLi user"><a href="${pageContext.request.contextPath}/profile"> <span
                class="fixeBoxSpan iconfont icon-yonghu"></span> <strong>用户</strong></a>
        </li>
        <li class="fixeBoxLi cart_bd" style="display:block;" id="cartboxs">
            <a href="${pageContext.request.contextPath}/shoppingTrolley/queryShoppingTrolley"><p class="good_cart">${shoppingTrolleys.stream().count()}</p>
                <span
                        class="fixeBoxSpan iconfont icon-cart"></span> <strong>购物车</strong>
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

        <li class="fixeBoxLi Home"><a href="${pageContext.request.contextPath}/shoppingCollection/commodityList"> <span
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
