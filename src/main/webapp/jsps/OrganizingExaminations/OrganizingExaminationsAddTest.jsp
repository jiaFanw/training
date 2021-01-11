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
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/table/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-tab.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap-tab.css">
</head>
<body>
<%--第一步--%>
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
            <table hidden id="testuserlistselect" border="1" width="500px">
                <tr id="adduserstart">
                    <td>工号</td>
                    <td>姓名</td>
                    <td>操作</td>
                </tr>
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
<%--随机试卷--%>
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
                <option value="">全部</option>
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
        <label for="testname" class="col-sm-2 control-label">出题方式</label>
        <div class="col-sm-10">
            抽选试题
            <br>
            单选题:<input type="text" id="danxuan">,每道题<input type="text" id="danxuanfenshu" readonly
                                                           value="5">分<br><br><br><input type="hidden" id="danxuanzongshu">
            多选题:<input type="text" id="duoxuan">,每道题<input type="text" id="duoxuanfenshu" readonly
                                                           value="5">分<br><br><br><input type="hidden" id="duoxuanzongshu">
            填空题:<input type="text" id="tiankong">,每道题<input type="text" id="tiankongfenshu" readonly
                                                            value="5">分<br><br><br><input type="hidden" id="tiankongzongshu">
            判断题:<input type="text" id="panduan">,每道题<input type="text" id="panduanfenshu" readonly
                                                           value="5">分<br><br><br><input type="hidden" id="panduanzongshu">
            简答题:<input type="text" id="jianda">,每道题<input type="text" id="jiandafenshu" readonly value="25">分<br><br><br><input type="hidden" id="jiandazongshu">
        </div>
    </div>

    <div class="form-group">
        <label for="testname" class="col-sm-2 control-label">及格分数</label>
        <div class="col-sm-10">
            <input type="text" id="passmark"
                   placeholder="请输入及格分数">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;满分<input type="text" id="follmark"
                                                                                            readonly>
        </div>
    </div>
    <center>
        <input type="button" id="return1" value="返回">
        <input type="button" id="finish1" value="完成">
    </center>
</form>
<%--固定试卷--%>
<form class="form-horizontal" role="form" id="secondstep2">
    <div class="form-group">
        <label for="testpapername" class="col-sm-2 control-label">试卷名称</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="testpapername1"
                   placeholder="请输入试卷名称">
        </div>
    </div>

    <div class="form-group">
        <label for="testname" class="col-sm-2 control-label">出题方式</label>
        <div class="col-sm-10">
            固定试题
            <br>
            <input id="selectQuestion" value="选择试题" type="button">
            <center>
                <table hidden id="QuestionListadd" border="1" width="800px">
                    <tr id="addquestionstart">
                        <td>序号</td>
                        <td>试题类型</td>
                        <td>试题内容</td>
                        <td>试题分类</td>
                        <td>分数</td>
                        <td>操作</td>
                    </tr>
                </table>
            </center>
        </div>
    </div>


    <div class="form-group">
        <label for="testname" class="col-sm-2 control-label">及格分数</label>
        <div class="col-sm-10">
            <input type="text" id="passmark1"
                   placeholder="请输入及格分数">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;满分<input type="text" id="follmark1" value="" readonly>
        </div>
    </div>
    <center>
        <input type="button" id="return2" value="返回">
        <input type="button" id="finish2"
               value="完成">
    </center>
</form>
<%--选择固定试卷随机试卷模态框--%>
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
<%--添加人员模态框--%>
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
                <form class="form-horizontal" role="form" novalidate="novalidate">

                    <select id="selectArea">
                        <option value="">全部</option>
                        <option value="1">吉林</option>
                        <option value="2">黑龙江</option>
                        <option value="3">辽宁</option>
                        <option value="4">内蒙古</option>
                        <option value="5">河北</option>
                        <option value="6">北京</option>
                        <option value="7">天津</option>
                        <option value="8">山东</option>
                    </select>
                    <input id="selectAreainput" value="查询" type="button">
                    <center>
                        <table id="selectAreaUserList">
                        </table>
                    </center>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="adduser">添加</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--固定试卷的模态框--%>
<div class="modal fade" id="selectGudingQuestion" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width: 1000px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" novalidate="novalidate">
                    试题分类：<select id="selectQuestionClassily">
                    <option value="">全部</option>
                    <option value="1">语文</option>
                    <option value="2">数学</option>
                    <option value="3">英语</option>
                    <option value="4">物理</option>
                    <option value="5">化学</option>
                    <option value="6">政治</option>
                    <option value="7">历史</option>
                </select>
                    试题类型：<select id="selectQuestionType">
                    <option value="">全部</option>
                    <option value="1">单选</option>
                    <option value="2">多选</option>
                    <option value="3">判断</option>
                    <option value="4">填空</option>
                    <option value="5">简答</option>
                </select>
                    <input id="selectQuestionClassilyinput" value="查询" type="button">
                    <center>
                        <table id="selectQuestionList">
                        </table>
                    </center>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="addquestion">添加</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>
    $(function () {
        $("#secondstep1").hide()
        $("#secondstep2").hide()

        $('#danxuan').bind('input propertychange', function() {
            var danxuanzongfen = $("#danxuan").val()*$("#danxuanfenshu").val()
            var duoxuanzongfen = $("#duoxuan").val()*$("#duoxuanfenshu").val()
            var panduanzongfen = $("#panduan").val()*$("#panduanfenshu").val()
            var tiankongzongfen = $("#tiankong").val()*$("#tiankongfenshu").val()
            var jiandazongfen = $("#jianda").val()*$("#jiandafenshu").val()
            suijizongfen = parseInt(danxuanzongfen) +parseInt(duoxuanzongfen)+parseInt(panduanzongfen)+parseInt(tiankongzongfen)+parseInt(jiandazongfen)
            console.log(suijizongfen)
            $("#follmark").val(suijizongfen)

        });
        $('#duoxuan').bind('input propertychange', function() {
            var danxuanzongfen = $("#danxuan").val()*$("#danxuanfenshu").val()
            var duoxuanzongfen = $("#duoxuan").val()*$("#duoxuanfenshu").val()
            var panduanzongfen = $("#panduan").val()*$("#panduanfenshu").val()
            var tiankongzongfen = $("#tiankong").val()*$("#tiankongfenshu").val()
            var jiandazongfen = $("#jianda").val()*$("#jiandafenshu").val()
            suijizongfen = parseInt(danxuanzongfen) +parseInt(duoxuanzongfen)+parseInt(panduanzongfen)+parseInt(tiankongzongfen)+parseInt(jiandazongfen)
            console.log(suijizongfen)
            $("#follmark").val(suijizongfen)
        });
        $('#panduan').bind('input propertychange', function() {
            var danxuanzongfen = $("#danxuan").val()*$("#danxuanfenshu").val()
            var duoxuanzongfen = $("#duoxuan").val()*$("#duoxuanfenshu").val()
            var panduanzongfen = $("#panduan").val()*$("#panduanfenshu").val()
            var tiankongzongfen = $("#tiankong").val()*$("#tiankongfenshu").val()
            var jiandazongfen = $("#jianda").val()*$("#jiandafenshu").val()
            suijizongfen = parseInt(danxuanzongfen) +parseInt(duoxuanzongfen)+parseInt(panduanzongfen)+parseInt(tiankongzongfen)+parseInt(jiandazongfen)
            console.log(suijizongfen)
            $("#follmark").val(suijizongfen)
        });
        $('#tiankong').bind('input propertychange', function() {
            var danxuanzongfen = $("#danxuan").val()*$("#danxuanfenshu").val()
            var duoxuanzongfen = $("#duoxuan").val()*$("#duoxuanfenshu").val()
            var panduanzongfen = $("#panduan").val()*$("#panduanfenshu").val()
            var tiankongzongfen = $("#tiankong").val()*$("#tiankongfenshu").val()
            var jiandazongfen = $("#jianda").val()*$("#jiandafenshu").val()
            suijizongfen = parseInt(danxuanzongfen) +parseInt(duoxuanzongfen)+parseInt(panduanzongfen)+parseInt(tiankongzongfen)+parseInt(jiandazongfen)
            console.log(suijizongfen)
            $("#follmark").val(suijizongfen)
        });
        $('#jianda').bind('input propertychange', function() {
            var danxuanzongfen = $("#danxuan").val()*$("#danxuanfenshu").val()
            var duoxuanzongfen = $("#duoxuan").val()*$("#duoxuanfenshu").val()
            var panduanzongfen = $("#panduan").val()*$("#panduanfenshu").val()
            var tiankongzongfen = $("#tiankong").val()*$("#tiankongfenshu").val()
            var jiandazongfen = $("#jianda").val()*$("#jiandafenshu").val()
            suijizongfen = parseInt(danxuanzongfen) +parseInt(duoxuanzongfen)+parseInt(panduanzongfen)+parseInt(tiankongzongfen)+parseInt(jiandazongfen)
            console.log(suijizongfen)
            $("#follmark").val(suijizongfen)
        });
    })
    var suijizongfen = 0
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
        $("#selectExamUser").modal("show")
        $("#selectAreaUserList").bootstrapTable({
            url: '/OrganizingExaminations/selectAreaUserList',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",//发送到服务器的编码类型
            method: "post",
            striped: true,
            async: false,
            search: true,
            sidePagination: "client",//分页方式 'client'为客户端分页
            cache: false,//是否使用缓存
            queryParams: function (param) {//请求参数 封装的表格对象
            },
            columns: [
                {
                    field: 'a',
                    checkbox: true
                },
                {
                    field: 'userid',
                    title: '序号'
                },
                {
                    field: 'truename',
                    title: '名称'
                }, {
                    field: 'jobnumber',
                    title: '工号',
                }
            ]
        });
    })
    //关联人员条件搜索
    $("#selectAreainput").click(function () {
        $("#selectAreaUserList").bootstrapTable("destroy")
        var areaid = $("#selectArea").val()
        $("#selectAreaUserList").bootstrapTable({
            url: '/OrganizingExaminations/selectAreaUserList',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",//发送到服务器的编码类型
            method: "post",
            striped: true,
            async: false,
            search: true,
            sidePagination: "client",//分页方式 'client'为客户端分页
            cache: false,//是否使用缓存
            queryParams: function (param) {//请求参数 封装的表格对象
                return {
                    areaid: areaid
                }
            },
            columns: [
                {
                    field: 'a',
                    checkbox: true
                },
                {
                    field: 'userid',
                    title: '序号'
                },
                {
                    field: 'truename',
                    title: '名称'
                }, {
                    field: 'jobnumber',
                    title: '工号',
                }
            ]
        });
    })
    //从添bootstraptable加至table
    $("#adduser").click(function () {
        $("#adduserstart").nextAll().empty()
        var selected = $("#selectAreaUserList").bootstrapTable('getSelections');
        var truenames = new Array();
        var jobnumbers = new Array();
        var userids = new Array();
        for (var i = 0; i < selected.length; i++) {
            truenames[i] = selected[i].truename;
            jobnumbers[i] = selected[i].jobnumber;
            userids[i] = selected[i].userid;
        }
        $("#testuserlistselect").show()
        for (var i = 0; i < selected.length; i++) {
            $("#testuserlistselect").append(
                "<tr id='" + userids[i] + "'>" +
                "<td>" + truenames[i] + "</td>" +
                "<td>" + jobnumbers[i] + "</td>" +
                "<td>" +
                "<a  href='javascript:delecttablebyuserid(" + userids[i] + ")'>" + "删除" + "</a>" +
                "</td></tr>"
            )
        }
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
    //删除table中tr
    function delecttablebyuserid(userid) {
        $("#" + userid + "").empty()
    }
    //固定试卷试题全查
    $("#selectQuestion").click(function () {
        $("#selectGudingQuestion").modal("show")
        $("#selectQuestionList").bootstrapTable({
            url: '/OrganizingExaminations/selectQuestionList',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",//发送到服务器的编码类型
            method: "post",
            striped: true,
            async: false,
            search: true,
            sidePagination: "client",//分页方式 'client'为客户端分页
            cache: false,//是否使用缓存
            queryParams: function (param) {//请求参数 封装的表格对象
            },
            columns: [
                {
                    field: 'a',
                    checkbox: true
                },
                {
                    field: 'questionid',
                    title: '序号'
                },
                {
                    field: 'questiontype',
                    title: '试题类型',
                    formatter: function (value, row, index) {
                        if (row.questiontype == 1) {
                            return "单选"
                        } else if (row.questiontype == 2) {
                            return "多选"
                        }else if (row.questiontype == 3) {
                            return "判断"
                        }else if (row.questiontype == 4) {
                            return "填空"
                        }else if (row.questiontype == 5) {
                            return "简答"
                        }
                    }
                }, {
                    field: 'questionname',
                    title: '试题名称',
                    formatter: function (value, row, index) {
                        var aaa = row.questionname;
                        if (aaa.length <= 20) {
                            return aaa
                        } else {
                            return aaa.substring(0, 20) + "......"
                        }
                    }
                }, {
                    field: 'questionclassifyid',
                    title: '试题分类',
                    formatter: function (value, row, index) {
                        if (row.questionclassifyid == 1) {
                            return "语文"
                        } else if (row.questionclassifyid == 2) {
                            return "数学"
                        }else if (row.questionclassifyid == 3) {
                            return "英语"
                        }else if (row.questionclassifyid == 4) {
                            return "物理"
                        }else if (row.questionclassifyid == 5) {
                            return "化学"
                        }else if (row.questionclassifyid == 6) {
                            return "政治"
                        }else if (row.questionclassifyid == 7) {
                            return "历史"
                        }
                    }
                }, {
                    field: 'score',
                    title: '分数'
                }
            ]
        });
    })
    //固定试卷试题条件查询
    $("#selectQuestionClassilyinput").click(function () {
        $("#selectQuestionList").bootstrapTable("destroy")
        var selectQuestionClassily = $("#selectQuestionClassily").val()
        var selectQuestionType = $("#selectQuestionType").val()
        $("#selectQuestionList").bootstrapTable({
            url: '/OrganizingExaminations/selectQuestionList',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",//发送到服务器的编码类型
            method: "post",
            striped: true,
            async: false,
            search: true,
            sidePagination: "client",//分页方式 'client'为客户端分页
            cache: false,//是否使用缓存
            queryParams: function (param) {//请求参数 封装的表格对象
                return{
                    questionclassifyid:selectQuestionClassily,
                    questiontype:selectQuestionType
                }
            },
            columns: [
                {
                    field: 'a',
                    checkbox: true
                },
                {
                    field: 'questionid',
                    title: '序号'
                },
                {
                    field: 'questiontype',
                    title: '试题类型',
                    formatter: function (value, row, index) {
                        if (row.questiontype == 1) {
                            return "单选"
                        } else if (row.questiontype == 2) {
                            return "多选"
                        }else if (row.questiontype == 3) {
                            return "判断"
                        }else if (row.questiontype == 4) {
                            return "填空"
                        }else if (row.questiontype == 5) {
                            return "简答"
                        }
                    }
                }, {
                    field: 'questionname',
                    title: '试题名称',
                    formatter: function (value, row, index) {
                        var aaa = row.questionname;
                        if (aaa.length <= 20) {
                            return aaa
                        } else {
                            return aaa.substring(0, 20) + "......"
                        }
                    }
                }, {
                    field: 'questionclassifyid',
                    title: '试题分类',
                    formatter: function (value, row, index) {
                        if (row.questionclassifyid == 1) {
                            return "语文"
                        } else if (row.questionclassifyid == 2) {
                            return "数学"
                        }else if (row.questionclassifyid == 3) {
                            return "英语"
                        }else if (row.questionclassifyid == 4) {
                            return "物理"
                        }else if (row.questionclassifyid == 5) {
                            return "化学"
                        }else if (row.questionclassifyid == 6) {
                            return "政治"
                        }else if (row.questionclassifyid == 7) {
                            return "历史"
                        }
                    }
                }, {
                    field: 'score',
                    title: '分数'
                }
            ]
        });
    })
    //从添bootstraptable加至table
    $("#addquestion").click(function () {
        $("#addquestionstart").nextAll().empty()
        var selected = $("#selectQuestionList").bootstrapTable('getSelections');
        var questionids = new Array();
        var questiontypes = new Array();
        var questionnames = new Array();
        var questionclassifyids = new Array();
        var scores = new Array();
        for (var i = 0; i < selected.length; i++) {
            questionids[i] = selected[i].questionid;
            if (selected[i].questionname.length<=20){
                questionnames[i] = selected[i].questionname;
            }else {
                questionnames[i] = selected[i].questionname.substring(0,20)+"......";
            }
            if (selected[i].questiontype == 1){
                questiontypes[i] = "单选"
            }else if (selected[i].questiontype == 2){
                questiontypes[i] = "多选"
            }else if (selected[i].questiontype == 3){
                questiontypes[i] = "判断"
            }else if (selected[i].questiontype == 4){
                questiontypes[i] = "填空"
            }else if (selected[i].questiontype == 5){
                questiontypes[i] = "简答"
            }
            if (selected[i].questionclassifyid == 1){
                questionclassifyids[i] = "语文"
            }else if (selected[i].questionclassifyid == 2){
                questionclassifyids[i] = "数学"
            }else if (selected[i].questionclassifyid == 3){
                questionclassifyids[i] = "英语"
            }else if (selected[i].questionclassifyid == 4){
                questionclassifyids[i] = "物理"
            }else if (selected[i].questionclassifyid == 5){
                questionclassifyids[i] = "化学"
            }else if (selected[i].questionclassifyid == 6){
                questionclassifyids[i] = "政治"
            }else if (selected[i].questionclassifyid == 7){
                questionclassifyids[i] = "历史"
            }
            scores[i] = selected[i].score;
        }
        $("#QuestionListadd").show()
        var a = 0;
        for (var i = 0; i < selected.length; i++) {
            $("#QuestionListadd").append(
                "<tr id='" + questionids[i] + "'>" +
                "<td>" + questionids[i] + "</td>" +
                "<td>" + questiontypes[i] + "</td>" +
                "<td>" + questionnames[i] + "</td>" +
                "<td>" + questionclassifyids[i] + "</td>" +
                "<td>" + scores[i] + "</td>" +
                "<td>" +
                "<a  href='javascript:delecetablebyuserid(" + questionids[i] +","+ scores[i]+ ")'>" + "删除" + "</a>" +
                "</td></tr>"
            )
            a = a+parseInt(scores[i]);
        }
        $("#follmark1").val(a);
    })
    //删除table中tr
    function delecetablebyuserid(questionids,scores) {
        $("#" + questionids + "").empty();
        var score = $("#follmark1").val()
        $("#follmark1").val(score-parseInt(scores))
    }
    //点击单选测试是否有值
    $("#danxuan").click(function () {
        var questionclassifyid = $("#questiontype").val()
        if (questionclassifyid==""){
            alert("请选择题类型")
        }else {
            $.ajax({
                url: "/OrganizingExaminations/selectDanxuanCount",
                data: {questionclassifyid:questionclassifyid},
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data) {
                        $("#danxuanzongshu").val(data.danxuancount)
                    }
                }
            });
        }
    })
    $("#danxuan").blur(function () {
        var danxuan = $("#danxuan").val()
        var danxuanzongshu = $("#danxuanzongshu").val()
        if(danxuan>danxuanzongshu&&danxuanzongshu!=0&&danxuan==""){
            setTimeout(function () {
                $("#danxuan").val(0)
                alert("已超过题库数量")
                $("#danxuan").focus()
            },1000)
        }
    })
    //点击多选测试是否有值
    $("#duoxuan").click(function () {
        var questionclassifyid = $("#questiontype").val()
        if (questionclassifyid==""){
            alert("请选择题类型")
        }else {
            $.ajax({
                url: "/OrganizingExaminations/selectDuoxuanCount",
                data: {questionclassifyid:questionclassifyid},
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data) {
                        $("#duoxuanzongshu").val(data.duoxuangeshu)
                    }
                }
            });
        }
    })
    $("#duoxuan").blur(function () {
        var duoxuan = $("#duoxuan").val()
        var duoxuanzongshu = $("#duoxuanzongshu").val()
        if(duoxuan>duoxuanzongshu){
            setTimeout(function () {
                $("#duoxuan").val(0)
                alert("已超过题库数量")
                $("#duoxuan").focus()
            },1000)
        }
    })
    //点击填空测试是否有值
    $("#tiankong").click(function () {
        var questionclassifyid = $("#questiontype").val()
        if (questionclassifyid==""){
            alert("请选择题类型")
        }else {
            $.ajax({
                url: "/OrganizingExaminations/selecttiankongCount",
                data: {questionclassifyid:questionclassifyid},
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data) {
                        $("#tiankongzongshu").val(data.tiankonggeshu)
                    }
                }
            });
        }
    })
    $("#tiankong").blur(function () {
        var tiankong = $("#tiankong").val()
        var tiankongzongshu = $("#tiankongzongshu").val()
        if(tiankong>tiankongzongshu){
            setTimeout(function () {
                $("#tiankong").val(0)
                alert("已超过题库数量")
                $("#tiankong").focus()
            },1000)
        }
    })
    //点击判断测试是否有值
    $("#panduan").click(function () {
        var questionclassifyid = $("#questiontype").val()
        if (questionclassifyid==""){
            alert("请选择题类型")
        }else {
            $.ajax({
                url: "/OrganizingExaminations/selectPanduanCount",
                data: {questionclassifyid:questionclassifyid},
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data) {
                        $("#panduanzongshu").val(data.panduangeshu)
                    }
                }
            });
        }
    })
    $("#panduan").blur(function () {
        var panduan = $("#panduan").val()
        var panduanzongshu = $("#panduanzongshu").val()
        if(panduan>panduanzongshu){
            setTimeout(function () {
                $("#panduan").val(0)
                alert("已超过题库数量")
                $("#panduan").focus()
            },1000)
        }
    })
    //点击简答测试是否有值
    $("#jianda").click(function () {
        var questionclassifyid = $("#questiontype").val()
        if (questionclassifyid==""){
            alert("请选择题类型")
        }else {
            $.ajax({
                url: "/OrganizingExaminations/selectjiandaCount",
                data: {questionclassifyid:questionclassifyid},
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data) {
                        $("#jiandazongshu").val(data.jiandageshu)
                    }
                }
            });
        }
    })
    $("#jianda").blur(function () {
        var jianda = $("#jianda").val()
        var jiandazongshu = $("#jiandazongshu").val()
        if(jianda>jiandazongshu){
            setTimeout(function () {
                $("#jianda").val(0)
                alert("已超过题库数量")
                $("#jiandazongshu").focus()
            },1000)
        }
    })


</script>

</body>
</html>
