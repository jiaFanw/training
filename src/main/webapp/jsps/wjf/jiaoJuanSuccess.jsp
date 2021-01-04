<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js"></script>
<body>
<div>
    <h1>提交成功！</h1>
    <span >5秒钟后该页面将自动关闭！</span><br>

</div>
<script>
    var i = 10;
    function  clock() {
        i = i-5;
        document.title="本窗口将在"+i+"秒后关闭";
        if(i>0){
            setTimeout("clock();",1000);
        }else{
            self.close();
        }
    }

    clock();
</script>
</body>
</html>
