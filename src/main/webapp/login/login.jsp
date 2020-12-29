<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/28
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
<script src="${pageContext.request.contextPath }/static/element/index.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>
<script>
    $(function (){
        $("#btn1").click(function (){

            $.ajax({
                url:"/user/login",
                data:{username:$("#username").val(),password:$("#password").val()},
                dataType:"json",
                success:function (data){
                    if (data!=null){
                        alert("登陆成功");
                    }
                }
            })
        })
    })
</script>
<body>
    用户名:<input type="text" id="username"><br/>
    密码:<input type="password" id="password"><br/>
<input type="button" value="登录" id="btn1">
</body>
</html>
