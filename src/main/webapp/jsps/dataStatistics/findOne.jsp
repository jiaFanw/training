<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/4
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap/table/bootstrap-table.js"></script>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/bootstrap/table/bootstrap-table.css">
    <script>
        $(function () {

            var testpaperid =${param.testpaperid};

            /*给input赋值*/
            $.ajax({
                url: "/WZD/dataTable2",
                data: {id: testpaperid},
                dataType: "json",
                success: function (data) {
                    $("#testpapername").val(data.testpapername);
                    $("#testdate").val(data.testdate);
                    $("#teststarttime").val(data.teststarttime);
                    $("#testendtime").val(data.testendtime);
                }
            })

            $.ajax({
                url: "/WZD/tgrs",
                data: {id: testpaperid},
                dataType: "json",
                success: function (data) {
                    $("#tgrs").val(data);
                }
            })

            $.ajax({
                url: "/WZD/tgl",
                data: {id: testpaperid},
                dataType: "json",
                success: function (data) {
                    $("#tgl").val(data.tgl);
                }
            })

            $.ajax({
                url: "/WZD/pjf",
                data: {id: testpaperid},
                dataType: "json",
                success: function (data) {
                    $("#pjf").val(data);
                }
            })

            $.ajax({
                url: "/WZD/cjrs",
                data: {id: testpaperid},
                dataType: "json",
                success: function (data) {
                    $("#cjrs").val(data);
                }
            })

            $.ajax({
                url: "/WZD/wcjrs",
                data: {id: testpaperid},
                dataType: "json",
                success: function (data) {
                    $("#wcjrs").val(data);
                }
            })

            $("#showWho").click(function () {
                $("#abc").bootstrapTable({
                    url: "/WZD/showWho?id=" + testpaperid,
                    method: 'post',// 提交方式
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",// 发送到服务器的编码类型
                    pageNumber: 1,
                    pageSize: 10,
                    sortName: 'id',
                    pagination: true,
                    sortOrder: 'asc',
                    pagination: true,// 开启分页
                    sidePagination: "client",// 分页方式 'client'为客户端分页
                    cache: false,// 是否使用缓存
                    columns: [
                        {
                            field:'truename',
                            title:'名字'
                        },{
                            field:'jobnumber',
                            title:'工号'
                        },{
                            field:'username',
                            title:'账号'
                        },
                    ],
                })
                $("#myModal").modal("show");
            })

            $("#personInfo").bootstrapTable({
                url: "/WZD/personInfo?id=" + testpaperid,
                method: 'post',// 提交方式
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",// 发送到服务器的编码类型
                pageNumber: 1,
                pageSize: 10,
                sortName: 'id',
                pagination: true,
                sortOrder: 'asc',
                pagination: true,// 开启分页
                sidePagination: "client",// 分页方式 'client'为客户端分页
                cache: false,// 是否使用缓存
                columns: [
                    {
                        field: 'truename',
                        title: '名字'
                    }, {
                        field: 'jobnumber',
                        title: '工号'
                    },
                    {
                        field: 'follmark',
                        title: '总分'
                    },
                    {
                        field: 'passmark',
                        title: '及格分'
                    },
                    {
                        field: 'score',
                        title: '成绩'
                    },
                    {
                        title: '是否通过',
                        formatter:function (value,row,index) {
                            if (row.score>row.passmark){
                                return "√";
                            }
                            if (row.score<row.passmark){
                                return "×";
                            }
                        }
                    },
                ],
            })

        })
    </script>
</head>
<body>
试卷名称:<input type="text" id="testpapername" name="" class="">&nbsp;
考试日期:<input type="text" id="testdate" name="" class="">&nbsp;
开始时间:<input type="text" id="teststarttime" name="" class="">&nbsp;
结束时间:<input type="text" id="testendtime" name="" class="">&nbsp;<br/>
通过人数:<input type="text" id="tgrs" name="" class="">&nbsp;
通过率:<input type="text" id="tgl" name="" class="">&nbsp;
平均分:<input type="text" id="pjf" name="" class="">&nbsp;
应参加人数:<input type="text" id="cjrs" name="" class="">&nbsp;
未参加人数:<input type="text" id="wcjrs" name="" class="">&nbsp;
<input type="button" id="showWho" value="查看缺席人员">&nbsp;

<table id="personInfo">

</table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="height: 600px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    查看缺考人员
                </h4>
            </div>
            <div class="modal-body" overflow="auto" style="height: 300px">
                <table id="abc">

                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <%--<button type="button" class="btn btn-primary">
                    提交更改
                </button>--%>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
