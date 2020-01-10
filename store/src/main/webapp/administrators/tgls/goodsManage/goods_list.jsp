<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/iconfont.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/administrators/framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/administrators/layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/administrators/css/jquery.mCustomScrollbar.css">
    <script src="${pageContext.request.contextPath}/administrators/framework/jquery-ui-1.10.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/administrators/framework/jquery.mousewheel.min.js"></script>
    <script src="${pageContext.request.contextPath}/administrators/framework/jquery.mCustomScrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/administrators/framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <script src="${pageContext.request.contextPath}/administrators/js/vue.js"></script>
    <script src="${pageContext.request.contextPath}/administrators/js/axios.js"></script>
    <!-- 公共样式 结束 -->

    <style>
        .layui-table img {
            max-width: none;
        }
    </style>

</head>

<body>
<div id="app">
    <div class="cBody">
        <div class="console">
            <form class="layui-form">
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <input type="text" name="productName"   placeholder="输入商品名称"
                               autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline">
                        <select name="quiz" lay-filter="numberOneType">
                            <option value="">一级分类</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="erji" lay-filter="numberTwoType">
                            <option value="">二级分类</option>
                        </select>
                    </div>
                    <a class="layui-btn"  @click="queryClick">检索</a>
                    <a class="layui-btn">导出商品</a>
                </div>
            </form>
        </div>

        <table class="layui-table">
            <thead>
            <tr>
                <th>商品名称</th>
                <th>商品图片</th>
                <th>参考价格</th>
                <th>商品单位</th>
                <th>一级分类</th>
                <th>二级分类</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="(item,index) in goodsList">
                <td>{{item.productName}}</td>
                <td><img :src="item.commodityImg" width="20" height="20"
                         onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
                <td>{{item.commodityPrice}}</td>
                <td>{{item.commodityWeight}}</td>
                <td>{{item.commodityType | formatGoodsType}}</td>
                <td v-if="item.commodityType.type === null">暂无二级分类</td>
                <td v-else>{{item.commodityType.commodityType}}</td>
                <td>
                    <input type="hidden" name="goodsID" :value="item.commodityId"/>
                    <button class="layui-btn layui-btn-xs" onclick="updateBut(this)">修改</button>
                    <button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
                    <button class="layui-btn layui-btn-xs layui-btn-danger" @click="delGoods($event)" :value="index">删除</button>
                </td>
            </tr>
        </table>
        <!-- layUI 分页模块 -->
        <div id="pages">

        </div>
    </div>
</div>
<script>
    const app = new Vue({
        el: "#app",
        data: {
            goodsList: [],     //商品集合,
            totalPage: 0,      //总页数,
            count: 0,           //商品总数
            goodsType: []//商品类型
        },
        created() {
        },
        methods: {
            delGoods(dom){
                var obj=$(dom.currentTarget).parent().parent();
                let commodityId = $(dom.currentTarget).parent().children(":first").val();
                axios({
                    url : "${pageContext.request.contextPath}/commodity/update",
                    params : {
                        commodityID : commodityId
                    }
                }).then(result=>{
                    if (result.data === 1){
                        layui.use("layer",()=>{
                            layer.msg("删除成功");
                        });
                        obj.remove();//删除改行 和后台数据保持一致
                    }
                });

            },
            baseDataInit(res) {
                //基本数据请求
                this.goodsList = res.data.goodsList;
                this.totalPage = res.data.totalPage;
                this.count = res.data.count;
                let _this=this;
                layui.use('laypage', () => {
                    let laypage = layui.laypage;
                    laypage.render({
                        elem: "pages",
                        count: _this.count,
                        layout: ['count', 'prev', 'page', 'next', 'limit', 'skip'],
                        jump: (obj) => {
                            axios({
                                url: "${pageContext.request.contextPath}/commodity/queryByTypeId",
                                params: {
                                    pageCode: obj.curr,
                                    pageSize: obj.limit,
                                }
                            }).then(res => {
                                _this.goodsList = res.data.goodsList
                            })
                        }
                    });
                });
            },
            goodsTypeInit(res) {
                this.goodsType = res.data;
                var _this = this;
                layui.use('form', function () {
                    var form = layui.form;
                    //填充下拉框
                    $.each(_this.goodsType, (index, dom) => {
                        /*if (dom.type === null) $("select[name=quiz]").append(new Option(dom.commodityType, dom.commodityTypeId));
                        else $("select[name=erji]").append(new Option(dom.commodityType, dom.type));*/
                        let elem=new Option(dom.commodityType, dom.commodityTypeId);
                        if (!dom.type) {
                            elem.setAttribute("data",dom.commodityTypeId);
                            $("select[name=quiz]").append(elem);
                        } else {
                            elem.setAttribute("data",dom.type);
                            $("select[name=erji]").append(elem);
                        }
                    });
                    //实现联动
                    layui.form.on("select(numberOneType)", function (data) {
                        let children = $(data.elem).children("option[value="+data.value+"]");
                        $("select[name=erji]").html('');
                        for (let i = 0; i < _this.goodsType.length; i++) {

                            if (_this.goodsType[i].type === parseInt(children.attr("data"))) {

                                $("select[name=erji]").append(new Option(_this.goodsType[i].commodityType, _this.goodsType[i].commodityTypeId));
                            }
                        }
                        form.render("select");
                    });
                    form.render("select");
                });
            },
            //点击查询按钮
            queryClick(){
                let name=$("input[name=productName]").val();//商品名字
                let commodityTypeId=$("select[name=erji]").val() === null ? $("select[name=quiz]").val() : $("select[name=erji]").val();//商品类型
                axios({
                    url: "${pageContext.request.contextPath}/commodity/queryByTypeId",
                    params: {
                        productName : name,
                        commodityTypeId :commodityTypeId
                    }
                }).then(res=>{
                    let _this=this;
                    layui.use('laypage', () => {
                        let laypage = layui.laypage;
                        laypage.render({
                            elem: "pages",
                            count: res.data.goodsList.length,
                            layout: ['count', 'prev', 'page', 'next', 'limit', 'skip'],
                            jump: () => {
                                _this.goodsList=res.data.goodsList;
                            }
                        });
                    });
                })
            }
        },
        mounted() {
            //发送并发请求 请求列表页的基本数据
            axios.all([axios({
                url: "${pageContext.request.contextPath}/commodity/queryByTypeId"
            }), axios({
                url: "${pageContext.request.contextPath}/commodityType/queryCommodityType"
            })]).then(axios.spread((baseData, goodsTypes) => {
                this.baseDataInit(baseData);
                this.goodsTypeInit(goodsTypes);
            }));
        },
        filters : {
            /*******显示一级分类********/
            formatGoodsType(obj){
                if(obj.type===null){
                    return obj.commodityType;
                }else{
                    let ts = app.goodsType.filter(type =>{
                        return type.commodityTypeId===obj.type;
                    });
                    return ts[0].commodityType;
                }
            },

        }
    })
</script>

<script>
    //修改规格
    function specificationsBut() {
        layui.use('layer', function () {
            var layer = layui.layer;

            //iframe层-父子操作
            layer.open({
                type: 2,
                area: ['70%', '60%'],
                fixed: false, //不固定
                maxmin: true,
                content: 'specifications_list.jsp'
            });
        });

    }

    //修改按钮
    var updateFrame = null;

    function updateBut(obj) {
        let val = $(obj).prev().val();
        window.PartitionId=val;//向子窗体传递数据
        layui.use('layer', function () {
            var layer = layui.layer;
            //iframe层-父子操作
            updateFrame = layer.open({
                title: "商品信息修改",
                type: 2,
                area: ['70%', '60%'],
                scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                maxmin: true,
                content: 'goods_update.jsp'
            });
        });
    }

</script>

</body>

</html>