<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/6
  Time: 11:13
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
            $("#articleTable").bootstrapTable({
                url: "/WZD/article",
                method: 'post',// 提交方式
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",// 发送到服务器的编码类型
                pageNumber: 1,
                pageSize: 5,
                sortName: 'id',
                pagination: true,
                sortOrder: 'asc',
                pagination: true,// 开启分页
                sidePagination: "client",// 分页方式 'client'为客户端分页
                cache: false,// 是否使用缓存
                columns: [
                    {
                        title: "文章标题",
                        field: "title"
                    }, {
                        title: "创建时间",
                        field: "creatime"
                    }, {
                        title: "操作",
                        formatter: function (value, row, index) {
                            return "<button onclick='showA(\"" + index + "\")'>查看/修改</button>&nbsp;" +
                                "<button onclick='del(\"" + row.id + "\")'>删除</button>&nbsp;"

                        }
                    }
                ],
            })
        })

        function del(id) {
            $.ajax({
                url:"/WZD/deleteById",
                data:{id:id},
                dataType:"json",
                success:function (data){
                    if (data!=0){
                        alert("删除成功");
                        window.location.reload();
                    }
                }
            })
        }

        function showA(index) {
            var rows = $("#articleTable").bootstrapTable("getData")[index];

            $("#title").val(rows.title);
            $("#info").val(rows.info);
            $("#creatime").val(rows.creatime);
            if (rows.ifshare == 1) {
                $("#share1").prop("checked", true);
                $("#share0").prop("checked", false);
            }
            if (rows.ifshare == 0) {
                $("#share0").prop("checked", true);
                $("#share1").prop("checked", false);
            }
            $("#myModal3").modal("show")
        }

        function add() {
                window.location.href="/jsps/article/articleAdd.jsp"
        }
    </script>
</head>
<body>
<button onclick="add()">新增</button>
<table id="articleTable">

</table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="height: 600px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    查看文章详情
                </h4>
            </div>
            <div class="modal-body" overflow="auto" style="height: 300px">
                文章标题:<input type="text" id="title" class="form-control">
                文章详情:<input type="text" id="info" class="form-control">
                创建时间:<input type="text" id="creatime" class="form-control" disabled>
                是否共享:<input type="radio" name="ifshare" id="share0" value="0">未共享<input type="radio" name="ifshare"
                                                                                        id="share1" value="1">已共享
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
