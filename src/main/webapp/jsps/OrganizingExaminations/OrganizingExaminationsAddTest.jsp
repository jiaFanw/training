<%--
  Created by IntelliJ IDEA.
  User: jishengnan
  Date: 2021/1/6
  Time: 9:15 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加考试</title>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap/table/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap-tab.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-tab.css">
</head>
<body>
<form class="form-horizontal" role="form" id="firststep">
    <div class="form-group">
        <label for="testname" class="col-sm-2 control-label">考试名称</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="testname"
                   placeholder="请输入考试名称">
        </div>
    </div>
    <div class="form-group">
        <label for="testdate" class="col-sm-2 control-label">考试日期</label>
        <div class="col-sm-10">
            <input type="date" class="form-control" id="testdate"
                   placeholder="请输入考试日期">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">考试时间</label>
        <div class="col-sm-4">
            <input type="datetime-local" class="form-control" id="teststarttime"
                   placeholder="请输入开始时间">
        </div>

        <div class="col-sm-2">
            --------------------------------------------
        </div>

        <div class="col-sm-4">
            <input type="datetime-local" class="form-control" id="testendtime"
                   placeholder="结束时间">
        </div>
    </div>

    <div class="form-group">
        <label for="testname" class="col-sm-2 control-label">参考人员</label>
        <div class="col-sm-10">
            <input type="button" id="TestUserListall" value="关联人员">
        </div>
    </div>

    <div class="form-group">
        <center>
            <table hidden id="testuserlistselect">
            </table>
        </center>
    </div>

    <div class="form-group">
        <label for="testtime" class="col-sm-2 control-label">进入考试次数</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="testtime"
                   placeholder="请输入考试次数">
        </div>
    </div>
    <center>
        <input type="button" id="fisrtnextstep"
               value="下一步">
    </center>
</form>
<form class="form-horizontal" role="form" id="secondstep1">
    <div class="form-group">
        <label for="testpapername" class="col-sm-2 control-label">试卷名称</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="testpapername"
                   placeholder="请输入试卷名称">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">试题类型</label>
        <div class="col-sm-4">
            <select id="questiontype">
                <option value="1">语文</option>
                <option value="2">数学</option>
                <option value="3">英语</option>
                <option value="4">物理</option>
                <option value="5">化学</option>
                <option value="6">政治</option>
                <option value="7">历史</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="testname" class="col-sm-2 control-label">参考人员</label>
        <div class="col-sm-10">
            抽选试题
            <br>
            单选题:<input type="text" id="danxuan">,每道题<input type="text" id="danxuanfenshu" readonly
                                                           value="3"><br><br><br>
            多选题:<input type="text" id="duoxuan">,每道题<input type="text" id="duoxuanfenshu" readonly
                                                           value="3"><br><br><br>
            填空题:<input type="text" id="tiankong">,每道题<input type="text" id="tiankongfenshu" readonly
                                                            value="2"><br><br><br>
            判断题:<input type="text" id="panduan">,每道题<input type="text" id="panduanfenshu" readonly
                                                           value="4"><br><br><br>
            简答题:<input type="text" id="jianda">,每道题<input type="text" id="jiandafenshu" readonly value="10"><br><br><br>
        </div>
    </div>


    <div class="form-group">
        <label for="testname" class="col-sm-2 control-label">及格分数</label>
        <div class="col-sm-10">
            <input type="text" id="passmark"
                   placeholder="请输入及格分数">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;满分<input type="text" id="follmark"
                                                                                            placeholder="请输入及格分数">
        </div>
    </div>
    <center>
        <input type="button" id="return1" value="返回">
        <input type="button" id="finish1" value="完成">
    </center>
</form>
<form class="form-horizontal" role="form" id="secondstep2">
    <div class="form-group">
        <label for="testpapername" class="col-sm-2 control-label">试卷名称</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="testpapername1"
                   placeholder="请输入试卷名称">
        </div>
    </div>

    <div class="form-group">
        <label for="testname" class="col-sm-2 control-label">参考人员</label>
        <div class="col-sm-10">
            固定试题
            <br>
            <input id="selectQuestion" value="选择试题" type="button">
            <table id="QuestionListadd"></table>
        </div>
    </div>


    <div class="form-group">
        <label for="testname" class="col-sm-2 control-label">及格分数</label>
        <div class="col-sm-10">
            <input type="text" id="passmark1"
                   placeholder="请输入及格分数">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;满分<input type="text" id="follmark1"
                                                                                            placeholder="请输入及格分数">
        </div>
    </div>
    <center>
        <input type="button" id="return2" value="返回">
        <input type="button" id="finish2"
               value="完成">
    </center>
</form>
<div class="modal fade" id="selectExamType" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width: 1000px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="SelOneModalForm" novalidate="novalidate">
                    <center>
                        <input id="guding" value="固定试卷" type="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
                            id="suiji" value="随机试卷" type="button">
                    </center>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<div class="modal fade" id="selectExamUser" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width: 1000px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form"  novalidate="novalidate">
                    <center>
                        <table></table>
                    </center>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>
    $(function () {
        $("#secondstep1").hide()
        $("#secondstep2").hide()
    })

    //选择试卷类型
    $("#fisrtnextstep").click(function () {
        $("#selectExamType").modal("show")
    })
    //固定试卷页面
    $("#guding").click(function () {
        $("#firststep").hide()
        $("#secondstep1").hide()
        $("#secondstep2").show()
        $("#selectExamType").modal("hide")
    })
    //打开随机界面
    $("#suiji").click(function () {
        $("#firststep").hide()
        $("#secondstep2").hide()
        $("#secondstep1").show()
        $("#selectExamType").modal("hide")
    })
    //返回上一步
    $("#return1").click(function () {
        $("#firststep").show()
        $("#secondstep2").hide()
        $("#secondstep1").hide()
    })
    //返回上一步
    $("#return2").click(function () {
        $("#firststep").show()
        $("#secondstep2").hide()
        $("#secondstep1").hide()
    })
    //关联人员总列表
    $("#TestUserListall").click(function () {

    })

    //提交
    $("#finish1").click(function () {
        var test = {};
        test["testname"] = $("#testname").val()
        test["testdate"] = $("#testdate").val()
        test["teststarttime"] = $("#teststarttime").val().substring(0, 10) + " " + $("#teststarttime").val().substring(11, 16) + ":00"
        test["testendtime"] = $("#testendtime").val().substring(0, 10) + " " + $("#teststarttime").val().substring(11, 16) + ":00"
        test["testtime"] = $("#testtime").val()
        test["teststatus"] = 0

        $.ajax({
            url: "/OrganizingExaminations/addExaminationsTest",
            data: test,
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data > 0) {
                    alert("添加成功")
                }
            }
        });
    })

</script>

</body>
</html>
