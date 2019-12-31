<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
		<!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->

		<!-- 公共样式 开始 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/iconfont.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/administrators/framework/jquery-1.11.3.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/layui/css/layui.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/administrators/layui/layui.js"></script>
		<!-- 滚动条插件 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/jquery.mCustomScrollbar.css">
		<script src="${pageContext.request.contextPath}/administrators/framework/jquery-ui-1.10.4.min.js"></script>
		<script src="${pageContext.request.contextPath}/administrators/framework/jquery.mousewheel.min.js"></script>
		<script src="${pageContext.request.contextPath}/administrators/framework/jquery.mCustomScrollbar.min.js"></script>
		<script src="${pageContext.request.contextPath}/administrators/framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
		<!-- 公共样式 结束 -->
		
		<style>
			.layui-table img {
			    max-width: none;
			}
		</style>

	</head>

	<body>
		<div class="cBody">
			<div class="console">
				<form class="layui-form" action="">
					<div class="layui-form-item">
						<div class="layui-input-inline">
							<input type="text" name="name" required lay-verify="required" placeholder="输入商品名称" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-input-inline">
		                    <select name="provid" id="provid" lay-filter="provid">
		                        <option value="">一级分类</option>
		                    </select>
		                </div>
		                <div class="layui-input-inline">
		                    <select name="cityid" id="cityid" lay-filter="cityid">
		                        <option value="">二级分类</option>
		                    </select>
		                </div>
						<button class="layui-btn" lay-submit lay-filter="formDemo">检索</button>
						<a class="layui-btn">导入商品</a>
					</div>
				</form>

				<script>
					layui.use('form', function() {
						var form = layui.form;
				
						//监听提交
						form.on('submit(formDemo)', function(data) {
							layer.msg(JSON.stringify(data.field));
							return false;
						});
					});
				</script>
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
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC1.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
							<button class="layui-btn layui-btn-xs" >删除</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC2.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/administrators/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
					<tr>
						<td>HTML5</td>
						<td><img src="${pageContext.request.contextPath}/images/goodsPIC3.png" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/></td>
						<td>10</td>
						<td>斤</td>
						<td>技术</td>
						<td>CSS3</td>
						<td>
							<button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
							<button class="layui-btn layui-btn-xs" onclick="specificationsBut()">规格</button>
						</td>
					</tr>
				</tbody>
			</table>
			
			<!-- layUI 分页模块 -->
			<div id="pages">

			</div>
			<script>
				layui.use('laypage', function() {
					var laypage = layui.laypage;

					//总页数大于页码总数
					laypage.render({
					    elem: 'pages'
					    ,count: 100
					    ,layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
					    ,jump: function(obj){
//					      console.log(obj)
					    }
					});
				});
				//修改规格
				function specificationsBut(){
					layui.use('layer', function() {
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
				function updateBut(){
					layui.use('layer', function() {
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
		</div>
	</body>

</html>