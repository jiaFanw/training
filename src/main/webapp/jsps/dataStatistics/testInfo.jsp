<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/1
  Time: 10:00
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
            $("#dataTable").bootstrapTable({
                url: "/WZD/dataTable",
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
                        title:'考试表id',
                        field:'testid'
                    },
                    {
                        title:'试卷名称',
                        field:'testpapername'
                    },
                    {
                        title:'考试日期',
                        field:'testdate'
                    },
                    {
                        title:'开始时间',
                        field:'teststarttime'
                    },
                    {
                        title:'结束时间',
                        field:'testendtime'
                    },
                    {
                        title:'参加人数',
                        formatter:function (value,row,index) {
                            var id=row.testpaperid;
                            var a;
                            $.ajax({
                                url:"/WZD/cjrs",
                                dataType:"json",
                                data:{id:id},
                                type:"post",
                                async: false,
                                success:function (data) {
                                    a=data;
                                }
                            })
                            return a;
                        }
                    },
                    {
                        title:'通过人数',
                        formatter:function (value,row,index) {
                            var id=row.testpaperid;
                            var a;
                            $.ajax({
                                url:"/WZD/tgrs",
                                dataType:"json",
                                data:{id:id},
                                type:"post",
                                async: false,
                                success:function (data) {
                                   a=data;
                                }

                            })
                            return a;
                        }
                    },
                    {
                        title:'通过率',
                        formatter:function (value,row,index) {
                            var id=row.testpaperid;
                            var ab;
                            $.ajax({
                                url:"/WZD/tgl",
                                dataType:"json",
                                data:{id:id},
                                type:"post",
                                async: false,
                                success:function (data) {
                                    if (data!=null){
                                        ab=data.tgl;
                                    }

                                }
                            })
                            return ab;
                        }
                    },
                    {
                        title:'平均分',
                        formatter:function (value,row,index) {
                            var id=row.testpaperid;
                            var a;
                            $.ajax({
                                url:"/WZD/pjf",
                                dataType:"json",
                                data:{id:id},
                                type:"post",
                                async: false,
                                success:function (data) {
                                a=data;
                                }
                            })
                            return a;
                        }
                    },
                    {
                        title:'操作',
                        formatter:function (value,row,index) {
                            return "<button onclick='Info2(\""+row.testpaperid+"\")'>查看详情</button>"
                        }
                    },
                ],
            })
        })
        function Info2(testpaperid) {
            if (testpaperid!=null&&testpaperid!=undefined){
                window.location.href="/jsps/dataStatistics/findOne?testpaperid="+testpaperid;
            }
        }
    </script>
</head>
<body>

<table id="dataTable">

</table>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">考试详情</h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" ></button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>
