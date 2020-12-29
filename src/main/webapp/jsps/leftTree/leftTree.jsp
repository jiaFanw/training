<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/layui.css" >
<style type="text/css">
    #index-container,html,body{
        margin:0px;
        padding:0px;
    }
    #index-container{
        width:100%;
        height:auto;

    }

    #index-navigationbar{
        width:100%;
        height:60px;
    }

    #index-navigationbar ul{
        padding-left:77%;
    }

    #index-commonmenu{
        width: 15%;
        height:519px;
        float: left;
    }
    #indixe-tab{
        width:84.9%;
        height: 150px;
        float: right;
    }
</style>
</head>
<body>
<!--首页容器-->
<div id="index-container">
    <ul class="layui-nav" style="text-algin:left;background-color: black;">
        <strong style="color: white">考试培训系统</strong>
    </ul>
    <!--信息菜单-->
    <div id="index-navigationbar">

        <ul class="layui-nav" style="text-algin:right;background-color: black;">

            <li class="layui-nav-item">
                <a href="">控制台<span class=" layui-badge">1</span></a>
            </li>
            <li class="layui-nav-item">
                <a href="">个人中心<span class=" layui-badge-dot"></span></a>
            </li>
            <li class="layui-nav-item" lay-unselect="">
                <a href="javascript:;" ><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" >修改信息</a></dd>
                    <dd><a href="javascript:;" >安全管理</a></dd>
                    <dd><a href="javascript:logout()" >退出</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <!--操作菜单-->
    <div id="index-commonmenu">
        <ul class="layui-nav layui-nav-tree" lay-filter="demo" style="margin-right:10px;height:538px;">

        </ul>
    </div>
    <iframe src="" name="iframe_a" width="1600px" height="600px"></iframe>
    <!--页面选项卡-->
    <div id="indixe-tab">

        <div class="layui-tab" lay-allowClose="true" lay-filter="demo1" style="margin:0px;padding:0px;">
            <ul class="layui-tab-title">

            </ul>
            <div class="layui-tab-content" style="margin:0px;padding:0px;">

            </div>
        </div>
    </div>

    <div style="clear: both">

    </div>

</div>

</body>
</html>
<script type="text/javascript" src="/static/layui-v2.5.6/layui/layui.js"></script>
<script src="/static/js/jquery-3.4.1.min.js"></script>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element;

        element.on('nav(demo)', function(elem){
            //console.log(elem.getAttribute("meun_id")); //得到当前点击的DOM对象
            var id=$(this).attr("meun_id");
            if(typeof(id)!="undefined"){
                console.log('进入方法');
                element.tabAdd('demo1', {
                    title: '新选项'+ (Math.random()*1000|0) //用于演示
                    ,content: '<iframe src="test.html" style="width:100%;height:491px;" scrolling="auto" frameborder="0"></iframe>'
                    ,id: id//实际使用一般是规定好的id，这里以时间戳模拟下z
                })
                element.tabChange('demo1', id);
            }
        });
        //获取所有的菜单
        $.ajax({
            type:"GET",
            url:"http://localhost:8089/menu/leftTree",
            dataType:"json",
            success:function(data){
                //先添加所有的主材单
                $.each(data,function(i,obj){
                    var content='<li class="layui-nav-item">';
                    content+='<a href="'+obj.url+'" target="iframe_a">'+obj.powername+'</a>';
                    //这里是添加所有的子菜单
                    content+=loadchild(obj);
                    content+='</li>';
                    $(".layui-nav-tree").append(content);
                });
                element.init();
            },
            error:function(jqXHR){
                alert("发生错误："+ jqXHR.status);
            }
        });

        //组装子菜单的方法
        function loadchild(obj){
            if(obj==null){
                return;
            }

            var content='';
            if(obj.children!=null && obj.children.length>0){
                content+='<dl class="layui-nav-child">';
            }else{
                content+='<dl>';
            }

            if(obj.children!=null && obj.children.length>0){
                $.each(obj.children,function(i,note){
                    content+='<dd>';
/*如果没有子级 返回带路径的a*/
                    if(note.children==null){
                        content+='<a href="'+note.url+'" target="iframe_a">'+note.powername+'</a>';
                        return;
                    }
                    /*有子级就返回无路径的a 保证下拉功能正常使用*/
                    content+='<a >'+note.powername+'</a>';
                    content+=loadchild(note);
                    content+='</dd>';
                });

                content+='</dl>';
            }
            console.log(content);
            return content;
        }

    });
    function logout(){
        <%session.invalidate();%>
        window.location.href="/jsps/login/login.jsp";
    }
</script>