<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
    <meta name="renderer" content="webkit">
    <!--国产浏览器高速模式-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="穷在闹市"/>
    <!-- 作者 -->
    <meta name="revised" content="穷在闹市.v3, 2019/05/01"/>
    <!-- 定义页面的最新版本 -->
    <meta name="description" content="网站简介"/>
    <!-- 网站简介 -->
    <meta name="keywords" content="搜索关键字，以半角英文逗号隔开"/>

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/iconfont.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/administrators/framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/administrators/layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/administrators/css/jquery.mCustomScrollbar.css">
    <script src="${pageContext.request.contextPath}/administrators/framework/jquery-ui-1.10.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/administrators/framework/jquery.mousewheel.min.js"></script>
    <script src="${pageContext.request.contextPath}/administrators/framework/frame.js"></script>
    <script src="${pageContext.request.contextPath}/administrators/framework/jquery.mCustomScrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/administrators/framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <script src="${pageContext.request.contextPath}/administrators/js/vue.js"></script><!-- 仅供所有子页面使用 -->
    <script src="${pageContext.request.contextPath}/administrators/js/axios.js"></script><!-- 仅供所有子页面使用 -->

    <style>
        .layui-form-label {
            width: 100px;
        }

        .layui-input-block {
            margin-left: 130px;
        }

        .layui-form {
            margin-right: 30%;
        }

        .layui-upload {
            margin-left: 55px;
        }
    </style>

</head>

<body>
<div class="cBody">
    <form id="addForm" class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">商品名称</label>
            <div class="layui-input-block">
                <input type="text" name="productName" required lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-upload">
                <button type="button" class="layui-btn layui-btn-normal" id="testList">选择商品图片</button>
                <div class="layui-upload-list">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th>文件名</th>
                            <th>大小</th>
                            <th>状态</th>
                            <th>预览</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="demoList"></tbody>
                    </table>
                </div>
                <button type="button" class="layui-btn" id="testListAction">开始上传</button>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="hidden" name="commodityImg" required  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单位</label>
            <div class="layui-input-block">
                <input type="text" name="commodityWeight" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">参考价格</label>
            <div class="layui-input-block">
                <input type="text" name="commodityPrice" required lay-verify="required|number" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">型号</label>
            <div class="layui-input-block">
                <input type="text" name="password" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">规格</label>
            <div class="layui-input-block">
                <input type="text" name="commodityAttribute" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">库存</label>
            <div class="layui-input-block">
                <input type="text" name="inventory" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">分类</label>
            <div class="layui-input-inline">
                <select name="oneCommodityTypeId" lay-filter="numberOneType">
                    <option value="">一级分类</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="twoCommodityTypeId" lay-filter="numberTwoType">
                    <option value="">二级分类</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="radio" name="commodityStatus" value="1" title="上架" checked>
                <input type="radio" name="commodityStatus" value="2" title="下架" >
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submitBut">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    $(function () {


    })
    const app=new Vue({
       el : ".cBody",
       data : {

       },
       methods:{
           btnClick(){
           },
           /********初始化商品类型*********/
           goodsTypeInit(res){
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
                           $("select[name=oneCommodityTypeId]").append(elem);
                       } else {
                           elem.setAttribute("data",dom.type);
                           $("select[name=twoCommodityTypeId]").append(elem);
                       }
                   });
                   //实现联动
                   layui.form.on("select(numberOneType)", function (data) {
                       let children = $(data.elem).children("option[value="+data.value+"]");
                       $("select[name=twoCommodityTypeId]").html('');
                       for (let i = 0; i < _this.goodsType.length; i++) {

                           if (_this.goodsType[i].type === parseInt(children.attr("data"))) {

                               $("select[name=twoCommodityTypeId]").append(new Option(_this.goodsType[i].commodityType, _this.goodsType[i].commodityTypeId));
                           }
                       }
                       form.render("select");
                   });
                   form.render("select");
               });
           }
       },
       mounted(){
           axios({
               url : "${pageContext.request.contextPath}/commodityType/queryCommodityType"
           }).then(result=>{
               this.goodsTypeInit(result);
           });
       }
    });
</script>
<script>
    layui.use(['upload', 'form', 'layer'], function () {
        var form = layui.form;
        var upload = layui.upload;
        var layer = layui.layer;
        //监听提交
        //监听提交
        form.on('submit(submitBut)', function (data) {
            axios({
                url : "${pageContext.request.contextPath}/commodity/save",
                params : data.field
            }).then(res=>{
                console.log(res);
                if(res.data === 1){
                  layer.msg("添加成功快去商品列表查看吧");
                  document.querySelector(".layui-btn-primary").click();
                  form.render();
                  $("#demoList").html('');
                }
            })
            return false;
        });
        form.verify({
            //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
            ZHCheck: [
                /^[\u0391-\uFFE5]+$/
                , '只允许输入中文'
            ]
        });
        //多文件列表示例
        var demoListView = $('#demoList')
            , uploadListIns = upload.render({
            elem: '#testList'
            , url: '${pageContext.request.contextPath}/commodity/uploads'
            , accept: 'file'
            , multiple: true
            , auto: false
            , bindAction: '#testListAction'
            , choose: function (obj) {
                var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                //读取本地文件
                obj.preview(function (index, file, result) {
                    var tr = $(['<tr id="upload-' + index + '">'
                        , '<td>' + file.name + '</td>'
                        , '<td>' + (file.size / 1014).toFixed(1) + 'kb</td>'
                        , '<td>等待上传</td>'
                        , '<td align="center"><img src="' + result + '" alt="' + file.name + '" class="layui-upload-img" width="100px" height="100px"></td>'
                        , '<td>'
                        , '<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
                        , '<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
                        , '</td>'
                        , '</tr>'].join(''));

                    //单个重传
                    tr.find('.demo-reload').on('click', function () {
                        obj.upload(index, file);
                    });

                    //删除
                    tr.find('.demo-delete').on('click', function () {
                        delete files[index]; //删除对应的文件
                        tr.remove();
                        uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                    });

                    demoListView.append(tr);
                });
            }
            , done: function (res, index, upload) {
                if (res.code == 0) { //上传成功
                    $("input[name=commodityImg]").val($("input[name=commodityImg]").val()+res.imgName);
                    console.log(res.imgName);
                    console.log($("input[name=commodityImg]").val());
                    var tr = demoListView.find('tr#upload-' + index)
                        , tds = tr.children();
                    tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                    tds.eq(3).html(''); //清空操作
                    return delete this.files[index]; //删除文件队列已经上传成功的文件
                }
                this.error(index, upload);
            }
            , error: function (index, upload) {
                var tr = demoListView.find('tr#upload-' + index)
                    , tds = tr.children();
                tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
            }
        });


    })
</script>
</html>