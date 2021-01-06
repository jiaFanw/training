<%--
  Created by IntelliJ IDEA.
  User: jishengnan
  Date: 2021/1/1
  Time: 9:17 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>组织考试</title>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap/table/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap-tab.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-tab.css">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-xs-6 col-sm-12">
                发布时间：<input type="date" id="startTime" name="startTime">——<input type="date"
                                                                                 id="endTime" name="endTime">
            </div>
            <br>
            <br>
            <div class="col-xs-6 col-sm-6">
                考试名称：<input type="text" id="testname" placeholder="请输入考试名称">
            </div>
            <div class="col-xs-6 col-sm-2">
                内容
                <select id="teststatus">
                    <option value="">全部</option>
                    <option value="1">未开始</option>
                    <option value="2">进行中</option>
                    <option value="3">已完成</option>
                </select>
            </div>
            <div class="col-xs-6 col-sm-4">
                <input type="button" id="selbysome" value="查询">&nbsp;<input type="button" id="clean" value="重置">&nbsp;<input type="button" id="addtest" value="添加考试 " onclick="addTestjsp()">
            </div>
        </div>
    </div>
    <table id="selectAllExaminationsBySome"></table>
    <div class="modal fade" id="selectOneExaminationsByTestId" aria-labelledby="myModalLabel"
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
                        <div class="form-group">
                            <div class="col-sm-12">
                                <table class="table">
                                    <tbody>
                                    <tr>
                                        <td>考试试卷</td>
                                        <td id="testnameform"></td>
                                    </tr>
                                    <tr>
                                        <td>考试日期</td>
                                        <td id="testdateform"></td>
                                    </tr>
                                    <tr>
                                        <td id>考试时间</td>
                                        <td id="testtimeform"></td>
                                    </tr>
                                    <tr id = "cankaorenyuan1">
                                        <td id="cankaorenyuan">参考人员</td>
                                    </tr>
                                    <tr>
                                        <td id>可考次数</td>
                                        <td id="testtimeform1"></td>
                                    </tr>
                                    <tr>
                                        <td id>及格分数</td>
                                        <td id="passmark"></td>
                                    </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
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
        updateTestStatus()
        bootstrapselectAllExaminationsAll()
    })
    //动态修改考试状态
    function updateTestStatus(){
        $.ajax({
            url: "/OrganizingExaminations/updateTestStatus",
            data: {},
            async:false,
            type: "post",
            dataType: "json",
            success: function (data) {
            }
        });
    }
    //全查
    function bootstrapselectAllExaminationsAll() {
        $("#selectAllExaminationsBySome").bootstrapTable({
            url: '/OrganizingExaminations/selectAllExaminationsBySome',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",//发送到服务器的编码类型
            method: "post",
            striped: true,
            async:false,
            search: true,
            sidePagination: "client",//分页方式 'client'为客户端分页
            cache: false,//是否使用缓存
            queryParams: function (param) {//请求参数 封装的表格对象
            },
            columns: [
                {
                    field: 'testname',
                    title: '考试名称'
                }, {
                    field: 'testdate',
                    title: '考试日期',
                }, {
                    title: '考试时间',
                    formatter: function (value,row,index) {
                        var starttime=row.teststarttime.substring(11,16)
                        var endtime=row.testendtime.substring(11,16)
                        return starttime + "-----" +endtime;
                    }
                }, {
                    field: 'teststatus',
                    title: '点赞',
                    formatter: function (value, row, index) {
                        if (value == "1") {
                            return "未开始";
                        } else if (value == "2" ) {
                            return "进行中";
                        }else if (value == "3"){
                            return "已完成"
                        }
                    }
                }, {
                    field: 'teststatus',
                    title: '查看详情',
                    formatter: function (value, row, index) {
                        if (value == "1" ){
                            return "<a href='javascript:selectOneExaminationsByTestId(" + row.testid + ")'>查看详情</a> <a href='javascript:deleteExaminationsByTestid(" + row.testid + ")'>删除</a> <a href='javascript:selectOneQuestionCountOfQuestionBankByPaperID(" + row.testid + ")'>编辑</a>  <a href='javascript:selectOneAnswerOfExaminationsByTestPaperID(" + row.testpaperid + ")'>查看试卷</a>";
                        }else  if (value == "2" ){
                            return "<a href='javascript:selectOneExaminationsByTestId(" + row.testid + ")'>查看详情</a>  <a href='javascript:selectOneAnswerOfExaminationsByTestPaperID(" + row.testpaperid + ")'>查看试卷</a>";
                        }else if (value == "3" ){
                            return "<a href='javascript:selectOneExaminationsByTestId(" + row.testid + ")'>查看详情</a> <a href='javascript:deleteExaminationsByTestid(" + row.testid + ")'>删除</a> <a href='javascript:selectOneAnswerOfExaminationsByTestPaperID(" + row.testpaperid + ")'>查看试卷</a>";
                        }

                    }
                }
            ]
        });
    }


    //重置
    $("#clean").click(function () {
        $("#startTime").val("")
        $("#endTime").val("")
        $("#testpaper").val("")
        $("#selectAllExaminationsBySome").bootstrapTable("destroy")
        bootstrapselectAllExaminationsAll()
    })

    //条件查询
    $("#selbysome").click(function () {
        $("#selectAllExaminationsBySome").bootstrapTable("destroy")
        var teststatus = $("#teststatus").val()
        var testname = $("#testname").val()
        var startTime = $("#startTime").val()
        var endTime = $("#endTime").val()
        $("#selectAllExaminationsBySome").bootstrapTable({
            url: '/OrganizingExaminations/selectAllExaminationsBySome',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",//发送到服务器的编码类型
            method: "post",
            striped: true,
            search: true,
            sidePagination: "client",//分页方式 'client'为客户端分页
            cache: false,//是否使用缓存
            queryParams: function (param) {//请求参数 封装的表格对象
                return{
                    teststatus:teststatus,
                    testname:testname,
                    startTime:startTime,
                    endTime:endTime
                }
            },
            columns: [
                {
                    field: 'testname',
                    title: '考试名称'
                }, {
                    field: 'testdate',
                    title: '考试日期',
                }, {
                    title: '考试时间',
                    formatter: function (value,row,index) {
                        var starttime=row.teststarttime.substring(11,16)
                        var endtime=row.testendtime.substring(11,16)
                        return starttime + "-----" +endtime;
                    }
                }, {
                    field: 'teststatus',
                    title: '点赞',
                    formatter: function (value, row, index) {
                        if (value == "1") {
                            return "未开始";
                        } else if (value == "2" ) {
                            return "进行中";
                        }else if (value == "3"){
                            return "已完成"
                        }
                    }
                }, {
                    field: 'teststatus',
                    title: '查看详情',
                    formatter: function (value, row, index) {
                        if (value == "1" ){
                            return "<a href='javascript:selectOneExaminationsByTestId(" + row.testid + ")'>查看详情</a> <a href='javascript:deleteExaminationsByTestid(" + row.testid + ")'>删除</a> <a href='javascript:selectOneAnswerOfExaminationsByTestPaperID(" + row.testpaperid + ")'>查看试卷</a> <a href='javascript:selectOneQuestionCountOfQuestionBankByPaperID(" + row.testid + ")'>编辑</a>";
                        }else  if (value == "2" ){
                            return "<a href='javascript:selectOneExaminationsByTestId(" + row.testid + ")'>查看详情</a> <a href='javascript:selectOneAnswerOfExaminationsByTestPaperID(" + row.testpaperid + ")'>查看试卷</a>";
                        }else if (value == "3" ){
                            return "<a href='javascript:selectOneExaminationsByTestId(" + row.testid + ")'>查看详情</a> <a href='javascript:deleteExaminationsByTestid(" + row.testid + ")'>删除</a> <a href='javascript:selectOneAnswerOfExaminationsByTestPaperID(" + row.testpaperid + ")'>查看试卷</a>";
                        }

                    }
                }
            ]
        });
    })
    //删除考试
    function deleteExaminationsByTestid(testid) {
        $.ajax({
            url: "/OrganizingExaminations/deleteExaminationsByTestid",
            data: {testid:testid},
            async:true,
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data){
                    alert("删除成功")
                    $("#selectAllQuestionBankBySome").bootstrapTable("refresh")
                }
            }
        });
    }
    // 查看详情
    function selectOneExaminationsByTestId(testid) {
        $(".a").empty()
        $.ajax({
            url: "/OrganizingExaminations/selectOneExaminationsByTestId",
            data: {testid:testid},
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data){
                    $("#testnameform").html(data.testname)
                    $("#testdateform").html(data.testdate)
                    var start =  data.teststarttime.substring(11,16)
                    var end =  data.testendtime.substring(11,16)
                    $("#testtimeform").html(start+"---"+end)
                    $("#testtimeform1").html(data.testtime)
                    $("#passmark").html(data.passmark)
                    $("#selectOneExaminationsByTestId").modal('show');
                }
            }
        })
        $.ajax({
            url: "/OrganizingExaminations/selectOneExaminationsByTestIdCount",
            data: {testid:testid},
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data){
                    var a = data.renshu
                    $("#cankaorenyuan").attr("rowspan",a)
                }
            }
        });

        $.ajax({
            url: "/OrganizingExaminations/selectOneExaminationsByTestIdStu",
            data: {testid:testid},
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data){
                    $("#cankaorenyuan1").append("<tr class='a'><td>"+data[0].truename+"</td></tr>")
                    for (let i = 1; i < data.length; i++) {
                        $("#cankaorenyuan1").after("<tr class='a'><td>"+data[i].truename+"</td></tr>")
                    }
                }
            }
        });
    }
    function selectOneAnswerOfExaminationsByTestPaperID(testpaperid) {
        window.location.href = "/jsps/OrganizingExaminations/answer.jsp?testpaperid="+testpaperid;
    }
    function addTestjsp() {
        window.location.href = "/jsps/OrganizingExaminations/OrganizingExaminationsAddTest.jsp";
    }

</script>
</body>
</html>
