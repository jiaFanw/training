<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人试题库</title>
    <link href="Content/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/static/bootstrap/table/bootstrap-table.min.css">
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">

    <script type="text/javascript" src="/static/js/jquery-3.4.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="/static/bootstrap/table/bootstrap-table.min.js"></script>
    <script src="/static/bootstrap/table/bootstrap-table-zh-CN.js"></script>
    <script src="Content/bootstrap-select/js/bootstrap-select.min.js"></script>
</head>
<style>
    .class1 {
        height: 60%;
        margin-top: 100px;
    }
</style>
<body>
<div class="class1">
    <%--<div style="margin: 0px 0px -34px 1120px">
        <button type="button" class="btn btn-default" id="Mytiku">我的题库</button>
        <button type="button" class="btn btn-default" id="tiku">题库</button>
    </div>--%>
    <div style="margin: 0px 0px -45px 800px">
        <button type="button" class="btn btn-default" id="addti" onclick="PerAdd()">新增试题</button>
    </div>
    <table id="Personal"></table>
</div>
<div class="modal fade" id="xmyModal" style="margin: 0px 0px 0px 600px">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" style="text-align: center">
                <button type="button" class="btn btn-default" onclick="danxuan()">单选</button>
                <button type="button" class="btn btn-default" onclick="duoxuan()">多选</button>
                <button type="button" class="btn btn-default" onclick="panduan()">判断</button>
                <button type="button" class="btn btn-default" onclick="tiankong()">填空</button>
                <button type="button" class="btn btn-default" onclick="jianda()">简答</button>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $("#Personal").bootstrapTable({
            url: "${pageContext.request.contextPath }/CJL/MyQuestionBank",
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
                    title: '标准答案'/*,
                    formatter: function (value, row, index) {
                        if (row.answer == '1') {
                            return '正确';
                        } else if (row.answer == '2'){
                            return '错误';
                        }
                    }*/
                }, {
                    field: 'score',
                    title: '分数'
                }, {
                    title: "操作",
                    formatter: function (value, row, index) {
                        return "<a href='javascript:ViewID(" + row.questionid + ")'>查看</a>";
                    }
                }, {
                    title: "操作",
                    formatter: function (value, row, index) {
                        return "<a href='javascript:edit(" + row.questionid + ")'>编辑</a>";
                    }
                }, {
                    title: "操作",
                    formatter: function (value, row, index) {
                        return "<a href='javascript:deletePer(" + row.questionid + ")'>删除</a>";
                    }
                }
            ]
        });

        /*$("#tiku").click(function (){
            $.ajax({
                type: "post",
                url: "{pageContext.request.contextPath }/CJL/QuestionBank",
                dataType:"json",
                success : function(json) {
                    $("#Personal").bootstrapTable('load', json);
                }
            });
        })

        $("#Mytiku").click(function (){
            $.ajax({
                type: "post",
                url: "{pageContext.request.contextPath }/CJL/MyQuestionBank",
                dataType:"json",
                success : function(json) {
                    $("#Personal").bootstrapTable('load', json);
                }
            });
        })*/
    })

    var a = ${user.roleid}
    $(function (){
        if (a == 4){
            $("#addti").hide()
        }
    })

    function PerAdd(){
        $("#xmyModal").modal("show")
    }

    function removeStyle() {
        $("input[name='questionname']").val("").focus();
        $("input[name='optiona']").val("").focus();
        $("input[name='optionb']").val("").focus();
        $("input[name='optionc']").val("").focus();
        $("input[name='optiond']").val("").focus();
        /*$("input[name='answer']").val("").focus();*/
        $("input[name='score']").val("").focus();
        $("input[name='createtime']").val("").focus();
    }
</script>
<%@include file="/jsps/chenjiale/Personal_yin/PersonalTestPoi.jsp"%>
<%@include file="/jsps/chenjiale/Personal_yin/PersonalTestDanXuan.jsp" %>
<%@include file="/jsps/chenjiale/Personal_yin/PersonalTestDuoXuan.jsp" %>
<%@include file="/jsps/chenjiale/Personal_yin/PersonalTestPanDuan.jsp" %>
<%@include file="/jsps/chenjiale/Personal_yin/PersonalTestTianKong.jsp" %>
<%@include file="/jsps/chenjiale/Personal_yin/PersonalTestJianDa.jsp" %>
<%@include file="/jsps/chenjiale/Personal_yin/PersonalTestCaoZuo.jsp" %>
</html>
