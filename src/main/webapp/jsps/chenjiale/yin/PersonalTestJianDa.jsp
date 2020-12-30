<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript">
    function jiandaok(){
        var questionid = $("input[name=questionid]");
        var questionname = $("input[name=questionname]");
        var questiontype = $("input[name=questiontype]");
        var questionclassifyid = $("input[name=questionclassifyid]");
        var answer = $("input[name=answer]");
        var score = $("input[name=score]");
        var createtime = $("input[name=createtime]");

        var data = new FormData($("#jianda")[0]);
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/CJL/danxuanAdd",
            data: data,
            datatype: "json",
            processData: false,
            contentType: false,
            success: function (data) {
                if (data) {
                    alert("成功");
                    $("#jiandamodal").modal('hide');
                    $("#xmyModal").modal('hide');
                    $("#Personal").bootstrapTable("refresh");
                } else {
                    alert("失败");
                }
            }
        });
    }

    function jianda(){
        $("#jiandamodal").modal("show")
    }
</script>
<body>
<%--简答--%>
<div class="modal fade" id="jiandamodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" class="form-horizontal" role="form" id="jianda">

                <input type="hidden" class="control" name="questionid">

                <div class="form-group col-xs-6" style="margin-left: 150px">
                    <label class="col-xs-4 control-label"></label>
                    *试题内容<textarea class="form-control" name="questionname" rows="3"></textarea>
                </div>

                <div class="form-group">
                    <div class="col-xs-4" style="margin-left: 210px">
                        <select class="form-control" name="questiontype">
                            <%--<option value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单选</option>--%>
                            <%--<option value="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;多选</option>--%>
                            <%--<option value="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;判断</option>--%>
                            <%--<option value="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;填空</option>--%>
                            <option value="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;简答</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-xs-4" style="margin-left: 210px">
                        <select class="form-control" name="questionclassifyid">
                            <option value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;语文</option>
                            <option value="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数学</option>
                            <option value="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;英语</option>
                            <option value="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;物理</option>
                            <option value="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;化学</option>
                            <option value="6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;政治</option>
                            <option value="7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历史</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-4 control-label">答案：</label>
                    <div class="col-xs-4">
                        <input type="text" class="form-control" name="answer">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-4 control-label">分数：</label>
                    <div class="col-xs-4">
                        <input type="text" class="form-control" name="score">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-4 control-label">添加时间：</label>
                    <div class="col-xs-4">
                        <input type="date" class="form-control" name="createtime">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="jiandaok()">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
