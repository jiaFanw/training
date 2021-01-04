<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考试中心-员工</title>
</head>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/vue/element/index.css">
<script src="${pageContext.request.contextPath }/static/vue/element/index.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>
<script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js"></script>
<body>
<input type="hidden" id="username" value="${user.username}">
<input type="hidden" id="userid" value="${user.userid}">
<div id="abc">

<template>


    <el-form ref="form" :inline="true" :model="form" label-width="80px">
        <el-form-item label="考试日期">
            <el-col :span="11">
                <el-date-picker type="date" placeholder="开始日期" v-model="form.date1" style="width: 100%;"></el-date-picker>
            </el-col>
            <el-col class="line" :span="2">-</el-col>
            <el-col :span="11">
                <el-date-picker type="date" placeholder="结束日期" v-model="form.date2" style="width: 100%;"></el-date-picker>
            </el-col>
        </el-form-item>
        <el-form-item label="试卷名称">
            <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item>
            <el-button type="primary">查询</el-button>
            <el-button>重置</el-button>
        </el-form-item>
    </el-form>



    <el-table
            :data="staffData"
            border
            style="width: 100%">
        <el-table-column
                prop="testpapername"
                label="试卷名称">
        </el-table-column>
        <el-table-column
                prop="follmark"
                label="总分">
        </el-table-column>
        <el-table-column
                prop="passmark"
                label="及格分">
        </el-table-column>
        <el-table-column
                prop="testdate"
                label="考试日期">
        </el-table-column>
        <el-table-column
                prop="test"
                label="开始时间-结束时间">
        </el-table-column>
        <el-table-column
                prop="score"
                label="成绩">
        </el-table-column>
        <el-table-column
                label="是否通过">
            <template slot-scope="scope">
                <span v-if="scope.row.score>=scope.row.passmark">
                    通过
                </span>
                <span v-if="scope.row.score<scope.row.passmark">
                    未通过
                </span>
            </template>
        </el-table-column>
        <el-table-column
                prop="paiming"
                label="排名">
        </el-table-column>
        <el-table-column
                label="操作">
            <template slot-scope="scope">
                <el-link type="primary" @click="chaKanDaJuan(scope.row)">查看答卷</el-link>
            </template>
        </el-table-column>
    </el-table>
</template>
</div>
</body>
<script>
    new Vue({
        el: '#abc',
        /*变量*/
        data () {
            return {
                staffData:[],
                form:{
                    name: '',
                    date1: '',
                    date2: '',
                }
            }
        },
        //页面加载成功时完成
        mounted: function(){
            var _this = this;
            //查看批改完成的试卷
            axios
                .post("/WJF/staffData",{
                    user:$("#username").val()
                })
                .then(function (res) {
                    console.log(res)
                    _this.staffData=res.data;
                })

        },
        /*方法函数  事件等*/
        methods: {
            chaKanDaJuan(row){
                console.log(row)
                location.href="/jsps/wjf/answer.jsp?testpaperid="+row.testpaperid+"&userid="+row.userid+"&biaoShi=chaKan";
            }

        }
    });
</script>
</html>
