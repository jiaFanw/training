<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript">
    function addMyQuestionBank(){
        var questionid = $("input[name=questionid]");
        var isnotshare = $("input[name=isnotshare]");
        var userid = $("input[name=userid]");
        var resolve = $("input[name=resolve]");
        var ownuser = $("input[name=ownuser]");
        var questionname = $("input[name=questionname]");
        var questiontype = $("input[name=questiontype]");
        var questionclassifyid = $("input[name=questionclassifyid]");
        var optiona = $("input[name=optiona]");
        var optionb = $("input[name=optionb]");
        var optionc = $("input[name=optionc]");
        var optiond = $("input[name=optiond]");
        var answer = $("input[name=answer]");
        var score = $("input[name=score]");
        var createtime = $("input[name=createtime]");
        var createusername = $("input[name=createusername]");

        var data = new FormData($("#shenheform")[0]);
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/CJL/AddShared",
            data: data,
            datatype: "json",
            processData: false,
            contentType: false,
            success: function (data) {
                if (data) {
                    alert("添加成功");
                    $("#Shared").bootstrapTable("refresh");

                } else {
                    alert("添加失败");
                }
            },error: function (data){
                alert("操作失败！该试题已存在我的题库中！")
            }
        });
    }

    function SharedShenHe(index){   //questionid 改 index
        var rows = $("#Shared").bootstrapTable("getData")[index]    //index可以定义多参数  #table名 其他固定
        var questionid = rows.questionid;   //定义携带的参数 与 ajax data对齐
        $("#Sharedshenhe").modal('show')
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
                $("input[name=userid]").val(data.userid);

                if (data.questiontype == 3) {
                    document.getElementById("daan").style.display = "none";// none == 隐藏
                } else if (data.questiontype == 4) {
                    document.getElementById("daan").style.display = "none";
                } else if (data.questiontype == 5) {
                    document.getElementById("daan").style.display = "none";
                } else {
                    document.getElementById("daan").style.display = "";// "" == 不隐藏
                }

                if (data.isnotshare == '已共享'){
                    $("#by").hide();
                    $("#turndown").hide();
                }else if (data.isnotshare == '审核中'){
                    $("#by").show();
                    $("#turndown").show();
                }

                var uid = ${user.userid};
                if(uid == data.userid){
                    $("#tjzwdtk").hide();
                }else{
                    $("#tjzwdtk").show();
                }
                if (a == 4){
                    $("#tjzwdtk").hide();
                }


                
            }
        })
    }

    function shby(){
        var questionid = $("#questionid").val();
        var isnotshare = $("#isnotshare").val();
        var data = {
            questionid: questionid,
            isnotshare: isnotshare
        };
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/CJL/SharedBy',
            data: JSON.stringify(data),
            dataType: 'json',
            processData: false,
            contentType: 'application/json;charset=utf-8', //2、设置请求头信息。3、后台用模型接参数
            success: function (data) {
                if (data) {
                    alert("审核通过");
                    $("#Shared").bootstrapTable("refresh");
                } else {
                    alert("审核失败");
                }
            }
        });
    }

    function shdown(){
        var questionid = $("#questionid").val();
        var isnotshare = $("#isnotshare").val();
        var data = {
            questionid: questionid,
            isnotshare: isnotshare
        };
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/CJL/SharedTurnDown',
            data: JSON.stringify(data),
            dataType: 'json',
            processData: false,
            contentType: 'application/json;charset=utf-8', //2、设置请求头信息。3、后台用模型接参数
            success: function (data) {
                if (data) {
                    alert("驳回成功");
                    $("#Shared").bootstrapTable("refresh");
                } else {
                    alert("驳回失败");
                }
            }
        });
    }

    var a = ${user.roleid}
    $(function (){
        if (a == 1){
            $("#turndown").hide()
            $("#by").hide()
            $("#gongxiangsh").hide()
        }
    })
</script>
<body>
<div class="modal fade" id="Sharedshenhe" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" class="form-horizontal" role="form" id="shenheform">

                <input type="hidden" class="control" id="questionid" name="questionid">
                <input type="hidden" class="control" id="isnotshare" name="isnotshare">
                <input type="hidden" class="control" id="userid" name="userid">
                <input type="hidden" class="control" id="resolve" name="resolve">
                <input type="hidden" class="control" id="ownuser" name="ownuser">

                <div class="form-group">
                    <label class="col-xs-4 control-label">试题内容</label>
                    <div class="col-xs-4">
                        <input type="text" readonly="readonly" id="questionname" class="form-control" name="questionname"
                               style="height: 50px;width: 300px">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-4 control-label">试题类型</label>
                    <div class="col-xs-4">
                        <select id="questiontype" readonly="readonly" name="questiontype" class="form-control">
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
                        <select id="questionclassifyid" readonly="readonly" name="questionclassifyid"
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
                    <label class="col-xs-4 control-label">创建人：</label>
                    <div class="col-xs-4">
                        <input type="text" readonly="readonly" class="form-control" id="createusername" name="createusername">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="tjzwdtk" onclick="addMyQuestionBank()">添加至我的题库</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="by" onclick="shby()">通过</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="turndown" onclick="shdown()">驳回</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
