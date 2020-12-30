<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
    function daoru() {
        $("#BMDAORU").modal("show")
    }

    function daoruOk(){
        var data=new FormData($("#DaoRuForm")[0]);
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/CJL/DaoRu",
            dataType:"json",
            data:data,
            processData: false,
            contentType: false,
            success:function (data) {
                if (data) {
                    alert("导入成功!");
                    window.location.href="../PersonalTest.jsp";
                }else{
                    alert("导入失败!");
                    window.location.href="../PersonalTest.jsp";
                }
            }
        })
    }

    /*------------------------------------------------------------------------------------------------------------------*/

    function BMDC() {
        $("#BMDAOCHU").modal("show")
    }

    function daochuOk(){
        if($("Input[id='poi1']:checked").val()){
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/CJL/DaoChu",
                dataType:"json",
                data:{},
                success:function (data) {
                    if (data) {
                        alert("导出成功!请在D:\\tools\\bgs\\temp\\dalipu_1808A\\Daochu下查看!");
                        $("#BMDAOCHU").modal("hide");
                    }else{
                        alert("导出失败!");
                        $("#BMDAOCHU").modal("hide");
                    }
                }
            })
        }else {
            var TableOptions = $("#Personal").bootstrapTable("getOptions");
            var pageNumber = TableOptions.pageNumber;
            var pageSize = TableOptions.pageSize;
            $.ajax({
                url:"${pageContext.request.contextPath}/CJL/DaoChu",
                type:"post",
                dataType:"json",
                data:{pageNumber:pageNumber,pageSize:pageSize},
                success:function (data) {
                    if (data) {
                        alert("导出成功!请在D:\\tools\\bgs\\temp\\dalipu_1808A\\Daochu下查看!");
                        $("#BMDAOCHU").modal("hide");
                    }else{
                        alert("导出失败!");
                        $("#BMDAOCHU").modal("hide");
                    }
                }
            })
        }
    }
</script>
<body>
<%--导入--%>
<div class="modal fade" id="BMDAORU" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <form class="form-horizontal" id="DaoRuForm" role="form" enctype="multipart/form-data">
                    <input type="hidden" name="DaoRu" id="DaoRu">
                    <input type="file" name="file" id="a">
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="daoruOk()">完成</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>
</div>


<%--导出modal--%>
<div class="modal fade" id="BMDAOCHU" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                导出数据
            </div>

            <div id="dc">
                <input type="hidden" name="DAOCHU" id="DAOCHU">
                <input type="radio" name="poi" value="2" id="poi1">全部<br>
                <input type="radio" name="poi" value="1" id="poi2">当前页&nbsp;&nbsp;
            </div>

            <div class="modal-footer" id="div-left">
                <button type="button" data-dismiss="modal" class="btn btn-default" onclick="daochuOk()">确认</button>
                <button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
            </div>

        </div>
    </div>
</div>
</body>
</html>
