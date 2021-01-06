<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/6
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static/layui-v2.5.6/layui/css/layui.css" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<h1>文章标题:</h1>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width: 300px;height: 50px" id="title">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>文章内容</legend>
</fieldset>

<textarea class="layui-textarea" id="LAY_demo1" style="display: none">

</textarea>

<div class="site-demo-button" style="margin-top: 20px;">
    <button class="layui-btn site-demo-layedit" data-type="content">获取编辑器内容</button>
    <button class="layui-btn site-demo-layedit" data-type="text">获取编辑器纯文本内容</button>
    <button class="layui-btn site-demo-layedit" data-type="selection">获取编辑器选中内容</button>
</div>

<%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>自定义工具栏</legend>
</fieldset>

<div style="margin-bottom: 20px; width: 500px;">
    <textarea class="layui-textarea" id="LAY_demo2" style="display: none"></textarea>
</div>--%>

<script src="/static/layui-v2.5.6/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('layedit', function () {
        var layedit = layui.layedit
            , $ = layui.jquery;

        //构建一个默认的编辑器
        var index = layedit.build('LAY_demo1');

        //编辑器外部操作
        var active = {
            content: function () {
                alert(layedit.getContent(index)); //获取编辑器内容

            }
            , text: function () {
                alert(layedit.getText(index)); //获取编辑器纯文本内容
                $.get({
                    url:"/WZD/articleAdd",
                    data:{title:$("#title").val(),str:layedit.getText(index)},
                    dataType:"json",
                    success:function (data){
                        if (data!=0){
                            alert("添加成功");
                            window.location.href="/jsps/article/article.jsp";
                        }

                    }
                })
            }
            , selection: function () {
                alert(layedit.getSelection(index));
            }
        };

        $('.site-demo-layedit').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //自定义工具栏
        layedit.build('LAY_demo2', {
            tool: ['face', 'link', 'unlink', '|', 'left', 'center', 'right']
            , height: 100
        })
    });
</script>

</body>
</html>