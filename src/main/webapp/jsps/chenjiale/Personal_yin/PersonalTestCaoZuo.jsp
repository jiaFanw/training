<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript">
    function Application(){
        var questionid2 = $("#questionid2").val();
        var isnotshare = $("#isnotshare").val();
        var data = {
            questionid: questionid2,
            isnotshare: isnotshare
        };
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/CJL/ApplicationSH',
            data: JSON.stringify(data),
            dataType: 'json',
            processData: false,
            contentType: 'application/json;charset=utf-8', //2、设置请求头信息。3、后台用模型接参数
            success: function (data) {
                if (data) {
                    alert("申请成功");
                    $("#Personal").bootstrapTable("Personal");
                } else {
                    alert("申请失败");
                }
            }
        });
    }

    function preUpOK() {
        var questionid = $("#questionid").val();
        var questionname = $("#questionname").val();
        var questiontype = $("#questiontype2").val();
        var questionclassifyid = $("#questionclassifyid2").val();
        var optiona = $("#optiona").val();
        var optionb = $("#optionb").val();
        var optionc = $("#optionc").val();
        var optiond = $("#optiond").val();
        var answer = $("#answer").val();
        var score = $("#score").val();
        var data = {
            questionid: questionid,
            questionname: questionname,
            questiontype: questiontype,
            questionclassifyid: questionclassifyid,
            optiona: optiona,
            optionb: optionb,
            optionc: optionc,
            optiond: optiond,
            answer: answer,
            score: score
        };
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/CJL/preup',
            data: JSON.stringify(data),
            dataType: 'json',
            processData: false,
            contentType: 'application/json;charset=utf-8', //2、设置请求头信息。3、后台用模型接参数
            success: function (data) {
                if (data) {
                    alert("修改成功");
                    $("#Personal").bootstrapTable("refresh");
                } else {
                    alert("失败");
                }
            }
        });
    }


    function edit(questionid) {
        $("#perUp").modal('show')
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/CJL/ViewID',
            data: {"questionid": questionid},
            dataType: 'json',
            success: function (data) {
                $("input[name=questionid]").val(data.questionid);
                $("input[name=questionname]").val(data.questionname);
                $("#questiontype2").val(data.questiontype);
                $("#questionclassifyid2").val(data.questionclassifyid);
                $("input[name=optiona]").val(data.optiona);
                $("input[name=optionb]").val(data.optionb);
                $("input[name=optionc]").val(data.optionc);
                $("input[name=optiond]").val(data.optiond);
                $("input[name=answer]").val(data.answer);
                $("input[name=score]").val(data.score);
                $("input[name=createusername]").val(data.createusername);
                $("input[name=ownuser]").val(data.ownuser);
                $("input[name=resolve]").val(data.resolve);
                if (data.questiontype == 3) {
                    document.getElementById("xiugaimodal").style.display = "none";// none == 隐藏
                } else if (data.questiontype == 4) {
                    document.getElementById("xiugaimodal").style.display = "none";
                } else if (data.questiontype == 5) {
                    document.getElementById("xiugaimodal").style.display = "none";
                } else if (data.questiontype == 1 || data.questiontype == 2) {
                    document.getElementById("xiugaimodal").style.display = "";// "" == 不隐藏
                }
            }
        })
    }

    function ViewID(questionid) {
        $("#ViewIDD").modal('show')
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/CJL/ViewID',
            data: {"questionid": questionid},
            dataType: 'json',
            success: function (data) {
                $("input[name=questionid]").val(data.questionid);
                $("input[name=questionname]").val(data.questionname);
                $("#questiontype").val(data.questiontype);
                $("#questionclassifyid").val(data.questionclassifyid);
                $("input[name=optiona]").val(data.optiona);
                $("input[name=optionb]").val(data.optionb);
                $("input[name=optionc]").val(data.optionc);
                $("input[name=optiond]").val(data.optiond);
                $("input[name=answer]").val(data.answer);
                $("input[name=score]").val(data.score);
                $("input[name=createtime]").val(data.createtime);
                $("input[name=createusername]").val(data.createusername);
                $("input[name=ownuser]").val(data.ownuser);
                $("input[name=resolve]").val(data.resolve);
                $("input[name=isnotshare]").val(data.isnotshare);
                if (data.questiontype == 3) {
                    document.getElementById("daan").style.display = "none";// none == 隐藏
                } else if (data.questiontype == 4) {
                    document.getElementById("daan").style.display = "none";
                } else if (data.questiontype == 5) {
                    document.getElementById("daan").style.display = "none";
                } else{
                    document.getElementById("daan").style.display = "";// "" == 不隐藏
                }
                if (data.isnotshare == '已共享' || data.isnotshare == '审核中') {
                    $("#shapplication").hide();
                }else{
                    $("#shapplication").show();
                }
            }
        })
    }

    function deletePer(questionid) {
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/CJL/perDel',
            data: {questionid: questionid},
            dataType: 'json',
            success: function (data) {
                if (data) {
                    $("#Personal").bootstrapTable("refresh");
                } else {
                    alert("失败");
                    $("#Personal").bootstrapTable("refresh");
                }
            }
        });
    }

    var a = ${user.roleid}
    $(function (){
        if (a == 4){
            $("#shapplication").hide()
        }
    })
</script>
<body>
<div class="modal fade" id="ViewIDD" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" class="form-horizontal" role="form" id="asd">

                <input type="hidden" class="control" id="questionid2" name="questionid">

                <input type="hidden" class="control" name="createusername">
                <input type="hidden" class="control" name="ownuser">
                <input type="hidden" class="control" name="resolve">

                <div class="form-group">
                    <label class="col-xs-4 control-label">试题内容</label>
                    <div class="col-xs-4">
                        <input type="text" readonly="readonly" class="form-control" name="questionname"
                               style="height: 50px;width: 300px">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-4 control-label">试题类型</label>
                    <div class="col-xs-4">
                        <select id="questiontype" disabled="disabled" name="questiontype" class="form-control">
                            <option value="1">单选</option>
                            <option value="2">多选</option>
                            <option value="3">判断</option>
                            <option value="4">填空</option>
                            <option value="5">简答</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-4 control-label">科目</label>
                    <div class="col-xs-4">
                        <select id="questionclassifyid" disabled="disabled" name="questionclassifyid"
                                class="form-control">
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

                <div id="daan">
                    <div class="form-group">
                        <label class="col-xs-4 control-label">A：</label>
                        <div class="col-xs-4">
                            <input type="text" readonly="readonly" class="form-control" name="optiona">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-4 control-label">B：</label>
                        <div class="col-xs-4">
                            <input type="text" readonly="readonly" class="form-control" name="optionb">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-4 control-label">C：</label>
                        <div class="col-xs-4">
                            <input type="text" readonly="readonly" class="form-control" name="optionc">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-4 control-label">D：</label>
                        <div class="col-xs-4">
                            <input type="text" readonly="readonly" class="form-control" name="optiond">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-4 control-label">正确答案：</label>
                    <div class="col-xs-4">
                        <input type="text" readonly="readonly" class="form-control" name="answer">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-4 control-label">分数：</label>
                    <div class="col-xs-4">
                        <input type="text" readonly="readonly" class="form-control" name="score">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-4 control-label">添加时间：</label>
                    <div class="col-xs-4">
                        <input type="text" readonly="readonly" class="form-control" name="createtime">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-4 control-label">是否共享：</label>
                    <div class="col-xs-4">
                        <input type="text" readonly="readonly" class="form-control" id="isnotshare" name="isnotshare">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="shapplication" onclick="Application()">申请共享</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </form>
        </div>
    </div>
</div>


<%--修改modal--%>
<div class="modal fade" id="perUp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" class="form-horizontal" role="form" id="zxc">

                <input type="hidden" class="control" id="questionid" name="questionid">

                <input type="hidden" class="control" name="createusername">
                <input type="hidden" class="control" name="ownuser">
                <input type="hidden" class="control" name="resolve">

                <div class="form-group">
                    <label class="col-xs-4 control-label">试题内容</label>
                    <div class="col-xs-4">
                        <input type="text" class="form-control" id="questionname" name="questionname"
                               style="height: 50px;width: 300px">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-4 control-label">试题类型</label>
                    <div class="col-xs-4">
                        <select id="questiontype2" name="questiontype" class="form-control">
                            <option value="1">单选</option>
                            <option value="2">多选</option>
                            <option value="3">判断</option>
                            <option value="4">填空</option>
                            <option value="5">简答</option>
                        </select>
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-xs-4 control-label">科目</label>
                    <div class="col-xs-4">
                        <select id="questionclassifyid2" name="questionclassifyid" class="form-control">
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

                <div id="xiugaimodal">
                    <div class="form-group">
                        <label class="col-xs-4 control-label">A：</label>
                        <div class="col-xs-4">
                            <input type="text" class="form-control" id="optiona" name="optiona">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-4 control-label">B：</label>
                        <div class="col-xs-4">
                            <input type="text" class="form-control" id="optionb" name="optionb">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-4 control-label">C：</label>
                        <div class="col-xs-4">
                            <input type="text" class="form-control" id="optionc" name="optionc">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-4 control-label">D：</label>
                        <div class="col-xs-4">
                            <input type="text" class="form-control" id="optiond" name="optiond">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-4 control-label">正确答案：</label>
                    <div class="col-xs-4">
                        <input type="text" class="form-control" id="answer" name="answer">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-4 control-label">分数：</label>
                    <div class="col-xs-4">
                        <input type="text" class="form-control" id="score" name="score">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="preUpOK()">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
