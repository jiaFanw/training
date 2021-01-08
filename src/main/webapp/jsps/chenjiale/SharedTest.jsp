<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>共享题库</title>
    <link href="Content/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Content/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/bootstrap/table/bootstrap-table.min.css">
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">

    <script type="text/javascript" src="/static/js/jquery-3.4.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="/static/bootstrap/table/bootstrap-table.min.js"></script>
    <script src="/static/bootstrap/table/bootstrap-table-zh-CN.js"></script>
    <script src="Content/bootstrap-select/js/bootstrap-select.min.js"></script>
</head>
<style>
    .class2 {
        height: 60%;
        margin-top: 100px;
    }
</style>
<script type="text/javascript">
    $(function () {
        $("#Shared").bootstrapTable({
            url: "${pageContext.request.contextPath }/CJL/SharedQuestionBank",
            pageNumber: 1,
            pageSize: 10,
            pageList: [5,10,30],
            pagination: true,
            sidePagination: 'client',
            striped: true,
            search: true,
            queryParams: function (param) {
                return {
                    limit: param.limit,
                    offset: param.offset
                }
            },
            columns: [
                {
                    field: 'questionname',
                    title: '试题内容'
                }, {
                    field: 'questionclassifyname',
                    title: '分类'
                }, {
                    field: 'questiontype',
                    title: '试题类型'
                }, {
                    field: 'answer',
                    title: '标准答案'
                }, {
                    field: 'score',
                    title: '分数'
                }, {
                    title: "操作",
                    formatter: function (value, row, index) {
                        return "<a href='javascript:SharedShenHe(" + index + ")'>查看</a>";
                    }
                }
            ]
        });

        $("#gongxiangsh").click(function (){
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath }/CJL/SharedQuestionBankshenhe",
                dataType:"json",
                success : function(json) {
                    $("#Shared").bootstrapTable('load', json);
                }
            });
        })

        $("#gongxiang").click(function (){
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath }/CJL/SharedQuestionBank",
                dataType:"json",
                success : function(json) {
                    $("#Shared").bootstrapTable('load', json);
                }
            });
        })
    })

    var a = ${user.roleid}
        $(function (){
            if (a == 1){
                $("#gongxiang").hide()
            }else if (a == 4){
                $("#tjzwdtk").hide()
            }
        })
</script>
<body>
<div class="class2">
    <div style="margin: 0px 0px -45px 700px">
        <button type="button" class="btn btn-default" id="gongxiang">共享题库</button>
        <button type="button" class="btn btn-default" id="gongxiangsh">共享题库未审核</button>
    </div>
    <table id="Shared"></table>
</div>
</body>
<%@include file="/jsps/chenjiale/Shared_yin/SharedTestReview.jsp" %>
</html>
