<%--
  Created by IntelliJ IDEA.
  User: jishengnan
  Date: 2020/12/29
  Time: 10:38 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>试卷库</title>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap/table/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap-tab.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-tab.css">
</head>
<body>
<input type="hidden" id="truename" value="${user.truename}">
<input type="hidden" id="userid" value="${user.userid}">
<div class="container">
    <div class="row">
        <div class="col-xs-6 col-sm-12">
            共享时间：<input type="date" id="startTime" name="startTime">——<input type="date"
                                                                             id="endTime" name="endTime">
        </div>
        <br>
        <br>
        <div class="col-xs-6 col-sm-6">
            试卷名称：<input type="text" id="paperName" placeholder="请输入试卷名称">
        </div>
        <div class="col-xs-6 col-sm-2">
            内容
            <select id="collectionstates">
                <option value="0">全部</option>
                <option value="1">我的收藏</option>
            </select>
        </div>
        <div class="col-xs-6 col-sm-4">
            <input type="button" id="selbysome" value="查询"><input type="button" id="clean" value="重置">
            <%--<input type="button" id="daochu" value="导出">--%>
        </div>

    </div>
</div>
<table id="selectAllQuestionBankBySome"></table>
<div class="modal fade" id="selectOneQuestionCountOfQuestionBankByPaperID" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width: 1000px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">项目信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="SelOneModalForm" novalidate="novalidate">
                    <input type="hidden" id="formpaperoid">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <table class="table">
                                <caption>
                                    试卷名称：<span id="tablepapername"></span>&nbsp;&nbsp;&nbsp;创建者：<span id="tablecreateuser"></span>
                                </caption>
                                <thead>
                                <tr>
                                    <th>单选题</th>
                                    <th>多选题</th>
                                    <th>判断</th>
                                    <th>填空</th>
                                    <th>简答</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td id="tabledanxuan"></td>
                                    <td id="tableduoxuan"></td>
                                    <td id="tablepanduan"></td>
                                    <td id="tabletiankong"></td>
                                    <td id="tablejianda"></td>
                                </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="selpaperquestion">查看详情</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>
    $(function () {
        bootstrapselectAllQuestionAll()
    })

    //全查
    function bootstrapselectAllQuestionAll() {
        var truename = $("#truename").val()
        $("#selectAllQuestionBankBySome").bootstrapTable({
            url: '/QuestionBank/selectAllQuestionBankBySome',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",//发送到服务器的编码类型
            method: "post",
            striped: true,
            search: true,
            sidePagination: "client",//分页方式 'client'为客户端分页
            cache: false,//是否使用缓存
            queryParams: function (param) {//请求参数 封装的表格对象
                return {
                    truename: truename
                }
            },
            columns: [
                {
                    field: 'checked',
                    checkbox: true,
                    align: 'center',
                }, {
                    field: 'papername',
                    title: '试卷名称'
                }, {
                    field: 'createuser',
                    title: '创建者',
                }, {
                    field: 'sharetime',
                    title: '分享时间'
                }, {
                    field: 'assiststates',
                    title: '点赞',
                    formatter: function (value, row, index) {
                        if (value == 0) {
                            return "<a href='javascript:updateAssistStatus(" + row.paperid + ")' '>未点赞</a>";//通过值判断男女
                        } else if (value == 1) {
                            return "<a href='javascript:updateAssistStatus(" + row.paperid + ")' '>已点赞</a>";
                        }
                    }
                }, {
                    field: 'collectionstates',
                    title: '收藏',
                    formatter: function (value, row, index) {
                        if (value == 0) {
                            return "<a href='javascript:updateCollectionStatus(" + row.paperid + ")' '>未收藏</a>";//通过值判断男女
                        } else if (value == 1) {
                            return "<a href='javascript:updateCollectionStatus(" + row.paperid + ")' '>已收藏</a>";
                        }
                    }
                }, {
                    title: '查看详情',
                    formatter: function (value, row, index) {
                        return "<a href='javascript:selectOneQuestionCountOfQuestionBankByPaperID(" + row.paperid + ")' '>操作</a>";//通过值判断男女
                    }
                }
            ]
        });
    }

    //点赞
    function updateAssistStatus(paperid) {
        var userid = $("#userid").val()
        $.ajax({
            url: "/QuestionBank/updateAssistStatus",
            data: {
                paperid: paperid,
                userid: userid
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data) {
                    alert("修改成功")
                    $("#selectAllQuestionBankBySome").bootstrapTable("refresh")
                } else {
                    alert("修改失败！")
                }
            }
        });
    }

    //点赞
    function updateAssistStatus(paperid) {
        var userid = $("#userid").val()
        $.ajax({
            url: "/QuestionBank/updateAssistStatus",
            data: {
                paperid: paperid,
                userid: userid
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data) {
                    alert("修改成功")
                    $("#selectAllQuestionBankBySome").bootstrapTable("refresh")
                } else {
                    alert("修改失败！")
                }
            }
        });
    }

    //收藏
    function updateCollectionStatus(paperid) {
        var userid = $("#userid").val()
        $.ajax({
            url: "/QuestionBank/updateCollectionStatus",
            data: {
                paperid: paperid,
                userid: userid
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data) {
                    alert("修改成功")
                    $("#selectAllQuestionBankBySome").bootstrapTable("refresh")
                } else {
                    alert("修改失败！")
                }
            }
        });
    }

    //重置
    $("#clean").click(function () {
        $("#startTime").val("")
        $("#endTime").val("")
        $("#paperName").val("")
        bootstrapselectAllQuestionAll()
    })

    //重置
    $("#selbysome").click(function () {
        $("#selectAllQuestionBankBySome").bootstrapTable("destroy")
        var truename = $("#truename").val()
        var collectionstates = $("#collectionstates").val()
        var papername = $("#paperName").val()
        var startTime = $("#startTime").val()
        var endTime = $("#endTime").val()

        $("#selectAllQuestionBankBySome").bootstrapTable({
            url: '/QuestionBank/selectAllQuestionBankBySome',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",//发送到服务器的编码类型
            method: "post",
            striped: true,
            search: true,
            sidePagination: "client",//分页方式 'client'为客户端分页
            cache: false,//是否使用缓存
            queryParams: function (param) {//请求参数 封装的表格对象
                return {
                    truename: truename,
                    collectionstates: collectionstates,
                    paperName: papername,
                    startTime: startTime,
                    endTime: endTime
                }
            },
            columns: [
                {
                    checkbox: true,
                    align: 'center',
                }, {
                    field: 'papername',
                    title: '试卷名称'
                }, {
                    field: 'createuser',
                    title: '创建者',
                }, {
                    field: 'sharetime',
                    title: '分享时间'
                }, {
                    field: 'assiststates',
                    title: '点赞',
                    formatter: function (value, row, index) {
                        if (value == 0) {
                            return "<a href='javascript:updateAssistStatus(" + row.paperid + ")' '>未点赞</a>";//通过值判断男女
                        } else if (value == 1) {
                            return "<a href='javascript:updateAssistStatus(" + row.paperid + ")' '>已点赞</a>";
                        }
                    }
                }, {
                    field: 'collectionstates',
                    title: '收藏',
                    formatter: function (value, row, index) {
                        if (value == 0) {
                            return "<a href='javascript:updateCollectionStatus(" + row.paperid + ")' '>未收藏</a>";//通过值判断男女
                        } else if (value == 1) {
                            return "<a href='javascript:updateCollectionStatus(" + row.paperid + ")' '>已收藏</a>";
                        }
                    }
                }, {
                    title: '查看详情',
                    formatter: function (value, row, index) {
                        return "<a href='javascript:selectOneQuestionCountOfQuestionBankByPaperID(" + row.paperid + ")' '>操作</a>";//通过值判断男女
                    }
                }
            ]
        });
    })

    function selectOneQuestionCountOfQuestionBankByPaperID(paperid) {
        $("#formpaperoid").val(paperid)
        $.ajax({
            url: "/QuestionBank/selectOneQuestionCountOfQuestionBankByPaperID",
            data: {
                paperid: paperid
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data) {
                    $("#tablecreateuser").html(data.createuser);
                    $("#tablepapername").html(data.papername);
                    $("#tabledanxuan").html(data.danxuan);
                    $("#tableduoxuan").html(data.duoxuan);
                    $("#tablepanduan").html(data.panduan);
                    $("#tabletiankong").html(data.tiankong);
                    $("#tablejianda").html(data.jianda);
                    $("#selectOneQuestionCountOfQuestionBankByPaperID").modal('show');
                }
            }
        });
    }

    $("#selpaperquestion").click(function () {
        var testpaperid = $("#formpaperoid").val()
        window.location.href = "http://localhost:8089/jsps/QusetionBank/answer.jsp?testpaperid="+testpaperid;
    })
</script>
</body>
</html>
