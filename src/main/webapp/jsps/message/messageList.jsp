<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/30
  Time: 8:26
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
        $(function (){
            $("#messageTable").bootstrapTable({
                url:"/WZD/messageList",
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
                        field:'id',
                        title:'id'
                    },{
                        field: 'status',
                        title: '状态',
                        formatter:function (value, row, index) {
                            if (value==1){
                                return "已读";
                            }
                            if (value==0){
                                return "未读";
                            }
                        }
                    },{
                        field: 'username',
                        title: '用户名'
                    },{
                        field: 'sentTime',
                        title: '发送时间',
                        formatter: function (value, row, index) {
                            return changeDateFormat(value)
                        }
                    },{
                        field: 'category',
                        title: '类别'
                    },{
                        title:'操作',
                        formatter:function (value,row,index) {
                           /* return "<a href='"+Info(row.questionid,row.username,row.sentTime)+"'>详情</a>"*/
                            return "<button class=\"btn btn-primary btn-lg\" data-toggle=\"modal\" data-target=\"#myModal\" onclick='"+Info(row.questionid,row.username,row.sentTime,row.category)+"'>开始演示模态框</button>"
                        }
                    }
                ],
            })
        })

        function changeDateFormat(cellval) {
            var dateVal = cellval + "";
            if (cellval != null) {
                var date = new Date(parseInt(dateVal.replace("/Date(", "").replace(")/", ""), 10));
                var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
                var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
                var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
                var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
                var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
                return date.getFullYear() + "-" + month + "-" + currentDate + " " + hours + ":" + minutes + ":" + seconds;
            }
        }

        function Info(questionid,username,sentTime,category){
            $.ajax({
                url: "/WZD/findById",
                data:{questionid:questionid},
                dataType:"json",
                success:function (data){
                    $("#questionname").val(data.questionname);
                    $("#optiona").val(data.optiona);
                    $("#optionb").val(data.optionb);
                    $("#optionc").val(data.optionc);
                    $("#optiond").val(data.optiond);
                    $("#category").val(category);
                    $("#username").val(username);
                    $("#sentTime").val(sentTime);
                }
            })
        }
    </script>
</head>
<body>

<table id="messageTable">

</table>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">试题详情</h4>
            </div>
            <div class="modal-body">
                试题内容:<input type="text" id="questionname" class="form-control">
                A:<input type="text" id="optiona" class="form-control">
                B:<input type="text" id="optionb" class="form-control">
                C:<input type="text" id="optionc" class="form-control">
                D:<input type="text" id="optiond" class="form-control">
                试题分类:<input type="text" id="category" class="form-control">
                发送人:<input type="text" id="username" class="form-control">
                发送时间<input type="text" id="sentTime" class="form-control">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="true" >允许共享</button>
                <button type="button" class="btn btn-primary" id="false" >不允许共享</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>
