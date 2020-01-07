<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<title>穷在闹市出品</title>

		<!-- 公共样式 开始 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/iconfont.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/framework/jquery-1.11.3.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
		<!-- 滚动条插件 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.mCustomScrollbar.css">
		<script src="${pageContext.request.contextPath}/framework/jquery-ui-1.10.4.min.js"></script>
		<script src="${pageContext.request.contextPath}/framework/jquery.mousewheel.min.js"></script>
		<script src="${pageContext.request.contextPath}/framework/jquery.mCustomScrollbar.min.js"></script>
		<script src="${pageContext.request.contextPath}/framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
		<!-- 公共样式 结束 -->

	</head>

	<body>
		<div class="cBody">
			<div class="console">
				<form class="layui-form" action="">
					<div class="layui-form-item">
						<div class="layui-input-inline">
							<input type="text" name="name" required lay-verify="required" placeholder="输入分类名称" autocomplete="off" class="layui-input">
						</div>
						<button class="layui-btn" lay-submit lay-filter="formDemo">检索</button>
					</div>
				</form>

				<script>
					layui.use(['form','jquery','layer'], function() {
						var form = layui.form;
						var $ = layui.jquery;
						var layer = layui.layer;
						//监听提交
						form.on('submit(*)', function(data) {
							$.ajax({
								url:'${pageContext.request.contextPath}/commodityType/likeTypeName',
								type:'post',
								async:false,
								date:{'name':$('input[name=name]').val()},
								success:function (data) {
									if(data == 1){
											//查询出来的数据
									}else{
										layer.msg('暂时没有此类型名称！',{time:2000,icon:5});
									}
								}
							})
						});
					});
				</script>
			</div>
			
			<table class="layui-table">
				<thead>
					<tr>
						<th>名称</th>
						<th>描述</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="item in goodsList">
						<td>${type.commodityType}</td>
						<td>${type.type}</td>
						<td>
							<button class="layui-btn layui-btn-xs">修改</button>
							<button class="layui-btn layui-btn-xs layui-btn-normal">添加二级分类</button>
							<button class="layui-btn layui-btn-xs layui-btn-warm">查看二级分类</button>
						</td>
					</tr>
				</tbody>
			</table>
			
			<!-- layUI 分页模块 -->
			<div id="pages"></div>
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
                                          url:"${pageContext.request.contextPath}/commodityType/queryCommodityType",
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
                            //点击查询按钮
                            queryClick(){
                                let name=$("input[name=name]").val();//类型名称
                                axios({
                                    url: "${pageContext.request.contextPath}/commodity/likeTypeName",
                                    params: {
                                        name : name,
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
                                url: "${pageContext.request.contextPath}/commodity/likeTypeName"
                            }), axios({
                                url: "${pageContext.request.contextPath}/commodityType/queryCommodityType"
                            })]).then(axios.spread((baseData, goodsTypes) => {
                                this.baseDataInit(baseData);
                            this.goodsTypeInit(goodsTypes);
                        }));
                        }
				});
			</script>
			<script>
				layui.use(['laypage', 'layer'], function() {
					var laypage = layui.laypage,
						layer = layui.layer;
				
					//总页数大于页码总数
					laypage.render({
					    elem: 'pages'
					    ,count: 100
					    ,layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
					    ,jump: function(obj){
					      console.log(obj)
					    }
					});
				});
			</script>
		</div>
	</body>

</html>