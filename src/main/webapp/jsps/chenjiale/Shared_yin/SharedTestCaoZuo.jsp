<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript">
    function SharedViewID(questionid) {
        $("#ViewIDD").modal("show");
        $("#isnotshare1").hide();
        $("#shapplication").hide();
        $("#ownuser1").show();
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/CJL/SharedViewID',
            data: {"questionid": questionid},
            dataType: 'json',
            success: function (data) {
                $("input[name=questionid]").val(data.questionid);
                $("input[name=questionname]").val(data.questionname);
                $("#questiontype").val(data.questiontype);
                $("#questionclassifyid").val(data.questionclassifyid);
                $("input[name=optiona]").val(data.optiona);
                $("input[name=optionb]").val(data.optionb);
                $("input[name=optionc]").val(data.optionc);
                $("input[name=optiond]").val(data.optiond);
                $("input[name=answer]").val(data.answer);
                $("input[name=score]").val(data.score);
                $("input[name=createtime]").val(data.createtime);
                $("input[name=ownuser]").val(data.ownuser);
                if (data.questiontype == 3) {
                    document.getElementById("daan").style.display = "none";// none == 隐藏
                } else if (data.questiontype == 4) {
                    document.getElementById("daan").style.display = "none";
                } else if (data.questiontype == 5) {
                    document.getElementById("daan").style.display = "none";
                } else{
                    document.getElementById("daan").style.display = "";// "" == 不隐藏
                }
            }
        })
    }

    function SharedDeletePer(questionid) {
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/CJL/SharedDeletePer',
            data: {questionid: questionid},
            dataType: 'json',
            success: function (data) {
                if (data) {
                    $("#MyShareTable").bootstrapTable("refresh");
                } else {
                    alert("失败");
                    $("#MyShareTable").bootstrapTable("refresh");
                }
            }
        });
    }
</script>
<body>
</body>
</html>
