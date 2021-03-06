<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考试中心-判卷人</title>
</head>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/vue/element/index.css">
<script src="${pageContext.request.contextPath }/static/vue/element/index.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
<meta http-equiv="Content-Type" content="application/msword; charset=gb2312"/>
<body>
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
            :data="markPapersData"
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
                label="操作">
            <template slot-scope="scope">
                <el-link type="primary" @click="detail(scope.row.testpaperid)">考试详情</el-link>
                <el-link type="primary" @click="daochu()">导出试卷</el-link>
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
                markPapersData:[],
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
            //判卷人需要批改的试卷
            axios
                .post("/WJF/markPapers",{
                    testpaperid:''
                })
                .then(function (res) {
                    console.log("----")
                    console.log(res)
                    _this.markPapersData=res.data;
                })

        },
        /*方法函数  事件等*/
        methods: {
            detail(testpaperid){
                location.href="/jsps/wjf/center_detail.jsp?testpaperid="+testpaperid;
            },
            daochu() {
                var _this = this;
                this.$confirm('是否导出?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    var pdf = new jsPDF('', 'pt', 'a4');
                pdf.internal.scaleFactor = 2; //调节打印大小，数字越大打印越小
                var options = {
                    pagesplit: true //设置是否自动分页
                };
                $('#answer').css("background", "#fff")//如果导出的pdf为黑色背景，需要将导出的html模块内容背景 设置成白色。
                var printHtml = $('#answer').get(0);   // 通过id获取div内容
                pdf.addHTML(printHtml, 15, 15, options, function () {
                    pdf.save('123.pdf');
                });
            })
            }


        }
    });
</script>
</html>
