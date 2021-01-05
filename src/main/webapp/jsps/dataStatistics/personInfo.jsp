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

            $("#personTable").bootstrapTable({
                url: "/WZD/personInfo",
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
                        field: 'truename',
                        title: '姓名'
                    },
                    {
                        field: 'jobnumber',
                        title: '工号'
                    },
                    {
                        field: 'testtime',
                        title: '参加考试次数'
                    },
                    {
                        field: '',
                        title: '通过考试次数'
                    },
                    {
                        field: '',
                        title: '通过率'
                    },
                    {
                        title: '操作',
                        formatter: function (value, row, index) {
                            return "<button onclick='personInfo(\"" + row.jobnumber + "\")'>查看详情 </button>"
                        }
                    },
                ],
            })
        })
function personInfo(jobnumber){
    $("#abcd").bootstrapTable({
        url: "/WZD/personInfo2?jobnumber="+jobnumber,
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
                field: 'testpapername',
                title: '试卷名称'
            }, {
                field: 'follmark',
                title: '总分'
            }, {
                field: 'passmark',
                title: '及格分'
            }, {
                field: 'score',
                title: '成绩'
            },{
                title:'是否通过',
                formatter:function (value,row,index) {
                    if (row.score>row.passmark){
                        return "√"
                    }
                    if (row.score<row.passmark){
                        return "×"
                    }
                }
            }
        ],
    })
    $("#myModal2").modal("show");
}

    </script>
</head>
<body>
<%--//考生分析table--%>
<table id="personTable">

</table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="height: 600px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    考试列表
                </h4>
            </div>
            <div class="modal-body" overflow="auto" style="height: 300px">
          <%--      //考生对应的所有考试table--%>
                <table id="abcd">

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
