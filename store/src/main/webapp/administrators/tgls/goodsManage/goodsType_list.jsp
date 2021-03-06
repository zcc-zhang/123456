
<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
    <meta name="renderer" content="webkit">
    <!--国产浏览器高速模式-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>穷在闹市出品</title>

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/iconfont.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/administrators/framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/layui/css/layui.css"
          media="all">
    <script src="${pageContext.request.contextPath}/administrators/layui/layui.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/administrators/layui/lay/modules/tree.js"></script>

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
</head>
<style>
    input[type="text"] {
        border: none;
    }
</style>
<body>
<div class="cBody">
    <div class="console">
        <form class="layui-form">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="name" required lay-verify="required" placeholder="输入分类名称"
                           autocomplete="off" class="layui-input">
                </div>
                <a class="layui-btn" lay-submit lay-filter="formDemo" @click="showGoodsTypeByName($event)">检索</a>
            </div>
        </form>
    </div>

    <table class="layui-table">
        <thead>
        <tr>
            <th>分类编号</th>
            <th>分类</th>
            <th>父分类</th>
            <th>子分类</th>
            <th>描述</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="(item,index) in goodsTypes">
            <td>{{index+1}}<input type="hidden" name="commodityTypeId" :value="item.commodityTypeId"/></td>
            <td><input type="text" :value="item.commodityType" class="layui-input" readonly/></td>
            <td v-if="item.type === null">暂无父分类</td>
            <td v-else>{{item | formatGoodsType}}</td>
            <td>
                <a class="layui-btn layui-btn-xs" @click="showChild(item,$event)">点击查看子分类</a>
                <span></span>
            </td>
            <td>暂无详细描述</td>
            <td>
                <button class="layui-btn layui-btn-xs" @click="changeType($event)">修改</button>
                <button class="layui-btn layui-btn-xs layui-btn-normal" @click="addType(item.commodityTypeId)">添加子级分类
                </button>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            </td>
        </tr>
        </tbody>
    </table>

    <!-- layUI 分页模块 -->
    <div id="pages">
    </div>
</div>

</body>

<script>
    const app = new Vue({
        el: ".cBody",
        data: {
            goodsTypes: [],
            childType: [],
            flag: false
        },
        methods: {
            addType(commodityTypeId) {
                let _this = this;
                layui.use("layer", () => {
                    //弹出框
                    layer.prompt({
                        title: '请输入你要添加的子分类',
                        formType: 3
                    }, function (commodityTypeName, index) {
                        axios({
                            url: "${pageContext.request.contextPath}/commodityType/saveCommodityType",
                            params: {
                                commodityTypeName: commodityTypeName,
                                type: commodityTypeId
                            }
                        }).then(res => {
                            if (res.data.code === '200') {
                                layer.close(index);
                                layer.alert('添加成功', {
                                    icon: 1,
                                });
                                _this.goodsTypes.push(res.data.commodityType);
                            }
                        });

                    });
                });
            },
            showChild(item, event) {
                const typeID = item.commodityTypeId;//父级id
                const child = this.goodsTypes.filter(type => {//筛选出子分类
                    return type.type === typeID;
                });
                this.childType = child;
                var str = "";
                this.childType.forEach(type => {
                    str += type.commodityType + ",";
                })
                if (str === "") {
                    str = "该分类暂无子分类";
                }
                $(event.currentTarget).next().html(str);
            },
            /******添加修改按钮并将文本改为可修改*******/
            changeType(event) {
                $(event.currentTarget).parent().siblings().children("input[type=text]").removeAttr("readonly");
                $(event.currentTarget).parent().siblings().children("input[type=text]").select();
                if (!this.flag) {//避免用户重复修改
                    $(event.currentTarget).parent().append("<button class=\"layui-btn layui-btn-xs change\"" +
                        " onclick='updateCommodityType(this)'>确认修改</button>");
                    this.flag = true;
                } else {
                    if ($(event.currentTarget).siblings(".change").html() === undefined) {
                        $(event.currentTarget).parent().append("<button class=\"layui-btn layui-btn-xs change\" " +
                            "onclick='updateCommodityType(this)'>确认修改</button>");
                    }
                }
            },
            /**********点击检索按钮************/
            showGoodsTypeByName(event){
                const _this=this;
                const  name=$(event.currentTarget).prev().find("input[name=name]").val();
                axios({
                    url : "${pageContext.request.contextPath}/commodityType/likeTypeName",
                    params : {name}
                }).then(res=>{
                    _this.goodsTypes=res.data.typeList;
                })
            }
        },
        mounted() {
            axios({
                url: "${pageContext.request.contextPath}/commodityType/queryCommodityType"
            }).then(result => {
                this.goodsTypes = result.data;
            });
        },
        filters: {
            /**********筛选父元素***********/
            formatGoodsType(obj) {
                let goodTypeID = obj.type;
                let goodsType = app.goodsTypes.filter(type => {
                    return type.commodityTypeId === goodTypeID;
                });
                return goodsType[0].commodityType;
            },
            /*********筛选子元素**********/
            formatChildElement(obj) {
                console.log(obj);
            }
        }
    });
    layui.use("form", () => {
        const form = layui.form;

    });

    function updateCommodityType(obj) {
        console.log(app.goodsTypes);

        let commodityTypeId = $(obj).parent().siblings(":first").find("input[name=commodityTypeId]").val();
        let commodityTypeName = $(obj).parent().siblings("td").children("input[type=text]").val();
        console.log(commodityTypeId, "改变的id");
        let index = 0;
        for (let i = 0; i < app.goodsTypes.length; i++) {
            if (app.goodsTypes[i].commodityTypeId === parseInt(commodityTypeId)) {
                index = i;
            }
        }
        axios({
            url: "${pageContext.request.contextPath}/commodityType/changeCommodityType",
            params: {
                commodityTypeId,
                commodityType: commodityTypeName
            }
        }).then(result => {
            if (result.data.code === 200) {
                layui.use("layer", () => {
                    layer.msg("修改成功");
                });
                app.goodsTypes[index].commodityType = commodityTypeName;//修改数组中的值
                let res = app.goodsTypes[index];
                app.$set(app.goodsTypes, index, res);//保证数据是响应式的
                $(obj).parent().siblings("td").children("input[type=text]").attr("readonly", "readonly");
                $(obj).remove();
            }
        });
    }
</script>
</html>