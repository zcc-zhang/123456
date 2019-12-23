<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/css/dialog.css">
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/fonts/iconfont.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/common_js.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/footer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/lrtk.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/src/jquery.dialog.min.js"></script>
    <title>产品列表</title>
    <script type="text/javascript">
        $(function () {
            $(".Navigation_name li").eq(0).removeClass("on");
            $(".Navigation_name li").eq(3).addClass("on");
            var pageCode = "${param.currentPage}"; //获取点击页码
            if (pageCode == "") //如果等于空
            {
                $(".Pagination a").eq(0).addClass('on'); //默认给第一个页码加上样式
            } else {
                var arr = $(".Pagination a"); //得到页码数组
                $(arr).each(function () {
                    var str = $(this).text();
                    if (str == pageCode) {
                        $(this).addClass("on");
                    }
                });
            }

            $(".Pagination a").on('click', function () {
                var content = $(this).text();
                switch (content) {
                    case '下一页':
                        $(this).next().addClass("on"); //给下一个元素增加样式
                        break;
                    case '上一页':
                        $(this).prev().addClass("on"); //给上一个元素增加样式
                        break;
                    case '尾页':
                        $(this).find(":last").addClass("on"); //给最后一个元素增加样式
                        break;
                    case '首页':
                        $(this).find(":first").addClass("on"); //给第一个一个元素增加样式
                        break;
                    default:
                        $(this).addClass("on"); //单击普通页码
                        break;
                }
                $(this).siblings().removeClass("on"); //移除兄弟元素的样式

            });
            /***************加入购物车****************/
            $(".shop_cart").on("click", function () {
                var dataStr = $(this).parent().siblings("#myFrom").serialize();
                $.ajax({
                    url: "${pageContext.request.contextPath}/shoppingTrolley/addCommodity",
                    data: dataStr,
                    type: "post",
                    success: callBack
                });

                function callBack(data) {
                    if (data === "1") {
                        $.sendSuccessToTop('成功将该商品加入购物车', 3000, function () {
                            console.log('sendSuccessToTop closed')
                        });
                    } else if (data == "0") {
                        $.sendWarningToTop('出现未知错误请稍后重试!！', 3000, function () {
                            console.log('sendWarningToTop closed');
                        });
                    }
                }
            });
            /***单击收藏的ajax***/
            $(".Collect").bind("click", function () {
                var dataStr = $(this).parent().siblings("#myFrom").serialize();
                $.ajax(
                    {
                        url: "${pageContext.request.contextPath}/shoppingCollection/collectionCommodity",
                        data: dataStr,
                        type: "post",
                        success: callBack
                    });

                function callBack(data) {
                    if (data == "1") {
                        $.sendSuccessToTop('成功收藏该商品', 3000, function () {
                            console.log('sendSuccessToTop closed')
                        });
                    } else if (data == "0") {
                        $.sendWarningToTop('出现未知错误请稍后重试！！！', 3000, function () {
                            console.log('sendWarningToTop closed');
                        });
                    } else if (data == '2') {
                        $.sendWarningToTop('已经收藏过该商品了!！', 3000, function () {
                            console.log('sendWarningToTop closed');
                        });
                    }
                }
            });

        });
    </script>
</head>
<script type="text/javascript" charset="UTF-8">
    //点击效果start
    function infonav_more_down(index) {
        var inHeight = ($("div[class='p_f_name infonav_hidden']").eq(index).find('p').length) * 30; //先设置了P的高度，然后计算所有P的高度
        if (inHeight > 60) {
            $("div[class='p_f_name infonav_hidden']").eq(index).animate({
                height: inHeight
            });
            $(".infonav_more").eq(index).replaceWith('<p class="infonav_more"><a class="more"  onclick="infonav_more_up(' + index + ');return false;" href="javascript:">收起<em class="pulldown"></em></a></p>');
        } else {
            return false;
        }
    }

    function infonav_more_up(index) {
        var infonav_height = 85;
        $("div[class='p_f_name infonav_hidden']").eq(index).animate({
            height: infonav_height
        });
        $(".infonav_more").eq(index).replaceWith('<p class="infonav_more"> <a class="more" onclick="infonav_more_down(' + index + ');return false;" href="javascript:">更多<em class="pullup"></em></a></p>');
    }

    function onclick(event) {
        info_more_down();
        return false;
    }

    //点击效果end
    //
</script>
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
                        <a href="${pageContext.request.contextPath }/registered.jsp" class="red"
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
                <em class="iconfont icon-cart2"></em><a href="#">我的购物车</a> <i
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
                                                src="${pageContext.request.contextPath}/product/logo/34.jpg"/></a> <a
                                            href="#"
                                            class="logo_Brands"><img
                                            src="${pageContext.request.contextPath}/product/logo/42.jpg"/></a> <a
                                            href="#" class="logo_Brands"><img
                                            src="${pageContext.request.contextPath}/product/logo/152.jpg"/></a> <a
                                            href="#"
                                            class="logo_Brands"><img
                                            src="${pageContext.request.contextPath}/product/logo/156.jpg"/></a>
                                        <a href="#" class="logo_Brands"><img
                                                src="${pageContext.request.contextPath}/product/logo/458.jpg"/></a> <a
                                            href="#"
                                            class="logo_Brands"><img
                                            src="${pageContext.request.contextPath}/product/logo/339.jpg"/></a>
                                        <a href="#" class="logo_Brands"><img
                                                src="${pageContext.request.contextPath}/product/logo/245.jpg"/></a> <a
                                            href="#"
                                            class="logo_Brands"><img
                                            src="${pageContext.request.contextPath}/product/logo/199.jpg"/></a>
                                        <a href="#" class="logo_Brands"><img
                                                src="${pageContext.request.contextPath}/product/logo/618.jpg"/></a> <a
                                            href="#"
                                            class="logo_Brands"><img
                                            src="${pageContext.request.contextPath}/product/logo/644.jpg"/></a>
                                        <a href="#" class="AD_3"><img
                                                src="${pageContext.request.contextPath}/product/ad/2.jpg"/></a>
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
                    <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/browsingHistoryServlet">日常护理</a></li>
                    <li><a href="${pageContext.request.contextPath}/Must_see.jsp">每日必看</a></li>
                    <li><a href="${pageContext.request.contextPath}/showCommodityListServlet">产品列表</a></li>
                    <li><a href="${pageContext.request.contextPath}/Buy_Brands.jsp">限时团购</a></li>
                    <li><a href="${pageContext.request.contextPath}/Group_buy.jsp">品牌团购</a></li>
                    <li><a href="#">联系我们</a></li>
                    <li><a href="${pageContext.request.contextPath}/index.jsp">简洁版</a></li>
                </ul>
            </div>
            <script>$("#Navigation").slide({
                titCell: ".Navigation_name li"
            });
            </script>
        </div>
    </div>
</div>
<!--内容样式-->
<div class="Inside_pages">

    <!--位置-->
    <div class="Location_link">
        <em></em><a href="#">进口食品、进口牛</a> &lt; <a href="#">进口饼干/糕点</a>
    </div>
    <!--筛选样式-->
    <div id="Filter_style">
        <!--推荐-->
        <div class="page_recommend">
            <div class="hd">
                <em></em>今日推荐
                <ul></ul>
            </div>
            <div class="bd">
                <ul>
                    <li>
                        <div class="img">
                            <a href="#"><img src="${pageContext.request.contextPath}/product/p_4.jpg" width="120"
                                             height="120"/></a>
                        </div>
                        <div class="pro_info">
                            <a href="#">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
                            <p class="Price">￥231.00</p>
                            <p class="Sales">
                                热销：<b>1234</b>件
                            </p>
                        </div>
                    </li>
                    <li>
                        <div class="img">
                            <a href="#"><img src="${pageContext.request.contextPath}/product/p_4.jpg" width="120"
                                             height="120"/></a>
                        </div>
                        <div class="pro_info">
                            <a href="#">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
                            <p class="Price">￥231.00</p>
                            <p class="Sales">
                                热销：<b>1234</b>件
                            </p>
                        </div>
                    </li>
                    <li>
                        <div class="img">
                            <a href="#"><img src="${pageContext.request.contextPath}/product/p_4.jpg" width="120"
                                             height="120"/></a>
                        </div>
                        <div class="pro_info">
                            <a href="#">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
                            <p class="Price">￥231.00</p>
                            <p class="Sales">
                                热销：<b>1234</b>件
                            </p>
                        </div>
                    </li>
                    <li>
                        <div class="img">
                            <a href="#"><img src="${pageContext.request.contextPath}/product/p_4.jpg" width="120"
                                             height="120"/></a>
                        </div>
                        <div class="pro_info">
                            <a href="#">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
                            <p class="Price">￥231.00</p>
                            <p class="Sales">
                                热销：<b>1234</b>件
                            </p>
                        </div>
                    </li>
                    <li>
                        <div class="img">
                            <a href="#"><img src="${pageContext.request.contextPath}/product/p_4.jpg" width="120"
                                             height="120"/></a>
                        </div>
                        <div class="pro_info">
                            <a href="#">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
                            <p class="Price">￥231.00</p>
                            <p class="Sales">
                                热销：<b>1234</b>件
                            </p>
                        </div>
                    </li>
                </ul>
            </div>
            <a class="next" href="javascript:void(0)"><em
                    class="iconfont icon-left"></em></a> <a class="prev"
                                                            href="javascript:void(0)"><em
                class="iconfont icon-right"></em></a>
        </div>
        <script type="text/javascript">
            jQuery(".page_recommend").slide({
                titCell: ".hd ul",
                mainCell: ".bd ul",
                autoPage: true,
                effect: "left",
                autoPlay: true,
                vis: 4,
                trigger: "click"
            });
        </script>
        <div class="Filter">
            <div class="Filter_list clearfix">
                <div class="Filter_title">
                    <span>品牌：</span>
                </div>
                <div class="Filter_Entire">
                    <a href="#">全部</a>
                </div>
                <div class="p_f_name infonav_hidden">
                    <p>
                        <a href="#" title="莱家/Loacker">莱家/Loacker </a> <a href="#"
                                                                          title="">丽芝士/Richeese</a> <a href="#"
                                                                                                       title="白色恋人/SHIROI KOIBITO ">白色恋人/SHIROI
                        KOIBITO </a> <a
                            href="#">爱时乐/Astick </a> <a href="#">利葡/LiPO </a> <a href="#">友谊牌/Tipo
                    </a> <a href="#"> 三立/SANRITSU </a> <a href="#"> 皇冠/Danisa </a>
                    </p>
                    <p>
                        <a href="#">丹麦蓝罐/Kjeldsens</a> <a href="#">茱莉/Julie's </a> <a
                            href="#">向日葵/Sunflower </a> <a href="#">福多/fudo </a> <a href="#">非凡农庄/PEPPER...
                    </a> <a href="#">凯尔森/Kelsen </a> <a href="#"> 蜜兰诺/Milano </a> <a
                            href="#">壹格/EgE </a>
                    </p>
                    <p>
                        <a href="#">沃尔克斯/Walkers </a> <a href="#">澳门永辉/MACAU...</a> <a
                            href="#" title="莱家/Loacker">莱家/Loacker </a> <a href="#" title="">丽芝士/Richeese</a>
                        <a href="#" title="白色恋人/SHIROI KOIBITO ">白色恋人/SHIROI KOIBITO
                        </a> <a href="#">爱时乐/Astick </a> <a href="#">利葡/LiPO </a> <a href="#">友谊牌/Tipo
                    </a>
                    </p>
                    <p>
                        <a href="#"> 三立/SANRITSU </a> <a href="#"> 皇冠/Danisa </a> <a
                            href="#">丹麦蓝罐/Kjeldsens</a> <a href="#">茱莉/Julie's </a> <a
                            href="#">向日葵/Sunflower </a> <a href="#">福多/fudo </a> <a href="#">非凡农庄/PEPPER...
                    </a> <a href="#">凯尔森/Kelsen </a>
                    </p>
                    <p>
                        <a href="#"> 蜜兰诺/Milano </a> <a href="#">壹格/EgE </a> <a href="#">沃尔克斯/Walkers
                    </a> <a href="#">澳门永辉/MACAU...</a> <a href="#" title="莱家/Loacker">莱家/Loacker
                    </a> <a href="#" title="">丽芝士/Richeese</a> <a href="#"
                                                                  title="白色恋人/SHIROI KOIBITO ">白色恋人/SHIROI KOIBITO </a>
                        <a
                                href="#">爱时乐/Astick </a>
                    </p>

                </div>
                <p class="infonav_more">
                    <a href="#" class="more"
                       onclick="infonav_more_down(0);return false;">更多<em
                            class="pullup"></em></a>
                </p>
            </div>
            <div class="Filter_list clearfix">
                <div class="Filter_title">
                    <span>包装方式：</span>
                </div>
                <div class="Filter_Entire">
                    <a href="#">全部</a>
                </div>
                <div class="p_f_name">
                    <a href="#">袋装</a> <a
                        href="${pageContext.request.contextPath}/commodity//toPage?commodityAttribute=盒装">盒装</a>
                    <a
                            href="${pageContext.request.contextPath}/commodity//toPage?commodityAttribute=瓶装">瓶装</a>
                    <a href="#">礼盒装</a> <a href="#">散装(称重)</a>
                </div>
            </div>
            <div class="Filter_list clearfix">
                <div class="Filter_title">
                    <span>价格：</span>
                </div>
                <div class="Filter_Entire">
                    <a href="#">全部</a>
                </div>
                <div class="p_f_name">
                    <a
                            href="${pageContext.request.contextPath}/commodity//toPage?min=0&max=50">0-50</a>
                    <a
                            href="${pageContext.request.contextPath}/commodity//toPage?min=50&max=150">50-150</a>
                    <a
                            href="${pageContext.request.contextPath}/commodity//toPage?min=150&max=500">150-500</a>
                    <a
                            href="${pageContext.request.contextPath}/commodity//toPage?min=500&max=1000">500-1000</a>
                    <a
                            href="${pageContext.request.contextPath}/commodity//toPage?max=1000">1000以上</a>
                </div>
            </div>
        </div>
    </div>
    <!--样式-->
    <div class="scrollsidebar side_green clearfix" id="scrollsidebar">
        <div class="show_btn" id="rightArrow">
            <span></span>
        </div>
        <div class="page_left_style side_content">
            <!--浏览记录-->
            <div class="side_title">
                <a title="隐藏" class="close_btn"><span></span></a>
            </div>
            <div class=" side_list">
                <div class="Record">
                    <div class="title_name">浏览记录</div>
                    <ul>
                        <c:forEach items="${historyList}" var='historyList' end='2'>
                            <li><a href="javascript:void(0)">
                                <p>
                                    <img src="${historyList.commodityImg}">
                                </p>
                                <p class="p_name">${historyList.productName}</p>
                            </a>
                                <p>
                                    <span class="p_Price left">价格:<b>￥${historyList.commodityPrice}</b></span><span
                                        class="p_Sales right">销量：${historyList.commodityEvaluation}件</span>
                                </p></li>
                        </c:forEach>
                        <!-- <li><a href="#">
                                <p>
                                    <img src="${pageContext.request.contextPath}/product/p_32.jpg">
                                </p>
                                <p class="p_name">商品名称</p>
                        </a>
                            <p>
                                <span class="p_Price left">价格:<b>￥5.30</b></span><span
                                    class="p_Sales right">销量：2345件</span>
                            </p></li>
                        <li><a href="#">
                                <p>
                                    <img src="${pageContext.request.contextPath}/product/p_30.jpg">
                                </p>
                                <p class="p_name">商品名称</p>
                        </a>
                            <p>
                                <span class="p_Price left">价格:<b>￥5.30</b></span><span
                                    class="p_Sales right">销量：2345件</span>
                            </p></li>
                        <li><a href="#">
                                <p>
                                    <img src="${pageContext.request.contextPath}/product/p_34.jpg">
                                </p>
                                <p class="p_name">商品名称</p>
                        </a>
                            <p>
                                <span class="p_Price left">价格:<b>￥5.30</b></span><span
                                    class="p_Sales right">销量：2345件</span>
                            </p></li> -->
                    </ul>
                </div>
                <!--销售排行-->
                <div class="pro_ranking">
                    <div class="title_name">
                        <em></em>销量排行
                    </div>
                    <div class="ranking_list">
                        <ul id="tabRank">
                            <c:forEach items="${list}" var='list' varStatus="idxStatus">
                                <li class="t_p on"><em class="icon_ranking">${idxStatus.index+1 }</em>
                                    <dt>
                                        <h3>
                                            <a href="#">${list.productName}</a>
                                        </h3>
                                    </dt>
                                    <dd class="clearfix">
                                        <a href="#"><img src="${list.commodityImg }" width="90"
                                                         height="90"/></a> <span
                                            class="Price">￥${list.commodityPrice}</span>
                                    </dd>
                                </li>
                            </c:forEach>
                            <!-- <li class="t_p on"><em class="icon_ranking">1</em>
                                <dt>
                                    <h3>
                                        <a href="#">韩束墨菊深度补水八件套（补水保湿 深层）</a>
                                    </h3>
                                </dt>
                                <dd class="clearfix">
                                    <a href="#"><img src="${pageContext.request.contextPath}/product/p_29.jpg" width="90"
                                        height="90" /></a> <span class="Price">￥23.00</span>
                                </dd></li>
                            <li class="t_p"><em class="icon_ranking">2</em>
                                <dt>
                                    <h3>
                                        <a href="#">韩束墨菊深度补水八件套（补水保湿 深层）</a>
                                    </h3>
                                </dt>
                                <dd class="clearfix">
                                    <a href="#"><img src="${pageContext.request.contextPath}/product/p_29.jpg" width="90"
                                        height="90" /></a> <span class="Price">￥23.00</span>
                                </dd></li>
                            <li class="t_p"><em class="icon_ranking">3</em>
                                <dt>
                                    <h3>
                                        <a href="#">韩束墨菊深度补水八件套（补水保湿 深层）</a>
                                    </h3>
                                </dt>
                                <dd class="clearfix">
                                    <a href="#"><img src="${pageContext.request.contextPath}/product/p_29.jpg" width="90"
                                        height="90" /></a> <span class="Price">￥23.00</span>
                                </dd></li>
                            <li class="t_p"><em class="icon_ranking">4</em>
                                <dt>
                                    <h3>
                                        <a href="#">韩束墨菊深度补水八件套（补水保湿 深层）</a>
                                    </h3>
                                </dt>
                                <dd class="clearfix">
                                    <a href="#"><img src="${pageContext.request.contextPath}/product/p_29.jpg" width="90"
                                        height="90" /></a> <span class="Price">￥23.00</span>
                                </dd></li>
                            <li class="t_p"><em class="icon_ranking">5</em>
                                <dt>
                                    <h3>
                                        <a href="#">韩束墨菊深度补水八件套（补水保湿 深层）</a>
                                    </h3>
                                </dt>
                                <dd class="clearfix">
                                    <a href="#"><img src="${pageContext.request.contextPath}/product/p_29.jpg" width="90"
                                        height="90" /></a> <span class="Price">￥23.00</span>
                                </dd></li>
                            <li class="t_p"><em class="icon_ranking">6</em>
                                <dt>
                                    <h3>
                                        <a href="#">韩束墨菊深度补水八件套（补水保湿 深层）</a>
                                    </h3>
                                </dt>
                                <dd class="clearfix">
                                    <a href="#"><img src="${pageContext.request.contextPath}/product/p_29.jpg" width="90"
                                        height="90" /></a> <span class="Price">￥23.00</span>
                                </dd></li>
                            <li class="t_p"><em class="icon_ranking">7</em>
                                <dt>
                                    <h3>
                                        <a href="#">韩束墨菊深度补水八件套（补水保湿 深层）</a>
                                    </h3>
                                </dt>
                                <dd class="clearfix">
                                    <a href="#"><img src="${pageContext.request.contextPath}/product/p_29.jpg" width="90"
                                        height="90" /></a> <span class="Price">￥23.00</span>
                                </dd></li>
                            <li class="t_p"><em class="icon_ranking">8</em>
                                <dt>
                                    <h3>
                                        <a href="#">韩束墨菊深度补水八件套（补水保湿 深层）</a>
                                    </h3>
                                </dt>
                                <dd class="clearfix">
                                    <a href="#"><img src="${pageContext.request.contextPath}/product/p_29.jpg" width="90"
                                        height="90" /></a> <span class="Price">￥23.00</span>
                                </dd></li>
                            <li class="t_p"><em class="icon_ranking">9</em>
                                <dt>
                                    <h3>
                                        <a href="#">韩束墨菊深度补水八件套（补水保湿 深层）</a>
                                    </h3>
                                </dt>
                                <dd class="clearfix">
                                    <a href="#"><img src="${pageContext.request.contextPath}/product/p_29.jpg" width="90"
                                        height="90" /></a> <span class="Price">￥23.00</span>
                                </dd></li>
                            <li class="t_p"><em class="icon_ranking">10</em>
                                <dt>
                                    <h3>
                                        <a href="#">韩束墨菊深度补水八件套（补水保湿 深层）</a>
                                    </h3>
                                </dt>
                                <dd class="clearfix">
                                    <a href="#"><img src="${pageContext.request.contextPath}/product/p_29.jpg" width="90"
                                        height="90" /></a> <span class="Price">￥23.00</span>
                                </dd></li> -->
                        </ul>
                    </div>
                </div>
                <script type="text/javascript">
                    jQuery("#tabRank li").hover(function () {
                        jQuery(this).addClass("on").siblings().removeClass("on")
                    }, function () {
                    });
                    jQuery("#tabRank").slide({
                        titCell: "dt h3",
                        autoPlay: false,
                        effect: "left",
                        delayTime: 300
                    });
                </script>
            </div>
        </div>
        <div class="page_right_style">
            <!--排序样式-->
            <script type="text/javascript">
                $(function () {
                    $("#scrollsidebar").fix({
                        float: 'left',
                        //minStatue : true,
                        skin: 'green',
                        durationTime: 600
                    });
                });
            </script>
            <div id="Sorted" class="fixToTop">
                <div class="Sorted">
                    <div class="Sorted_style">
                        <a href="#" class="on">综合<i class="iconfont icon-pullup"></i></a>
                        <a href="#">销量<i class="iconfont icon-pullup"></i></a> <a
                            href="#">价格<i class="iconfont icon-pullup"></i></a> <a href="#">新品<i
                            class="iconfont icon-pullup"></i></a>
                    </div>
                    <!--产品搜索-->
                    <div class="product_search">
                        <input name="" type="text" class="search_text" value="请输入你要搜索的产品"
                               onfocus="this.value=''" onblur="if(!value){value=defaultValue;}"><input
                            name="" type="submit" value="" class="search_btn">
                    </div>
                    <!--页数-->
                    <div class="s_Paging">
                        <span> ${page.pageStartNo }/${page.pageEndNo }</span>
                        <c:if test="${page.pageStartNo>1}">
                            <a
                                    href="${pageContext.request.contextPath}/showCommodityListServlet?currentPage=${page.currentPage - 1}"
                                    class="on">&lt;</a>
                        </c:if>
                        <c:if
                                test="${page.currentPage != page.totalPage && page.currentPage>0}">
                            <a
                                    href="${pageContext.request.contextPath}/showCommodityListServlet?currentPage=${page.currentPage + 1}">&gt;</a>
                        </c:if>

                    </div>
                </div>
            </div>
            <!--结束-->
            <!--产品列表样式-->
            <div class="p_list  clearfix">
                <ul>
                    <c:forEach items="${CommodityList}" var="list">
                        <li class="gl-item">
                            <div class="Borders">
                                <div class="img">
                                    <a href="#"><img src="${list.commodityImg}"
                                                     style="width:220px;height:220px"></a>
                                </div>
                                <form id="myFrom">
                                    <input type="hidden" name="commodityID" value="${list.commodityId}"/>
                                </form>
                                <div class="Price">
                                    <b>¥${list.commodityPrice}</b><span>[${list.commodityWeight}g]</span>
                                </div>
                                <div class="name">
                                    <a
                                            href="${pageContext.request.contextPath}/commodity//particularsView?commodityId=${list.commodityId}">${list.productName}</a>
                                </div>
                                <div class="Review">
                                    已有<a href="#">${list.commodityEvaluation}</a>评论
                                </div>
                                <div class="p-operate">
                                    <a href="javascript:void(0)" class="p-o-btn Collect"><em></em>收藏</a> <a
                                        href="javascript:void(0)"
                                        class="p-o-btn shop_cart"><em></em>加入购物车</a>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <div class="Paging">
                    <div class="Pagination">

                        <c:if test="${pageCode >1}">
                            <a
                                    href="${pageContext.request.contextPath}/commodity//toPage?currentPage=1">首页</a>
                            <a
                                    href="${pageContext.request.contextPath}/commodity//toPage
								?currentPage=${pageCode - 1}"
                                    class="pn-prev disabled">上一页</a>
                        </c:if>
                        <c:forEach begin="1" end="${total}" var='pageCode'>
                            <a href="${pageContext.request.contextPath}/commodity//toPage?currentPage=${pageCode}">${pageCode}</a>
                        </c:forEach>
                        <!--
                        <a href="#" class="on">1</a> <a href="#">2</a> <a href="#">3</a>
                        <a href="#">4</a>-->
                        <c:if test="${pageCode != total &&  total != 0}">
                            <a href="${pageContext.request.contextPath}/commodity//toPage?currentPage=${pageCode + 1}">下一页</a>
                            <a href="${pageContext.request.contextPath}/commodity//toPage?currentPage=${total}">尾页</a>
                        </c:if>

                    </div>
                </div>
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
        <li class="fixeBoxLi user"><a href="${pageContext.request.contextPath}/user_Center"> <span
                class="fixeBoxSpan iconfont icon-yonghu"></span> <strong>用户</strong></a>
        </li>
        <li class="fixeBoxLi cart_bd" style="display:block;" id="cartboxs">
            <a href="${pageContext.request.contextPath}/shoppingTrolley/queryShoppingTrolley"><p
                    class="good_cart">${commodityCount}</p> <span
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
<script>
    $(document.querySelector("#tabRank li")).mouseover();
</script>
</html>