<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工考试页面</title>
</head>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/vue/element/index.css">
<script src="${pageContext.request.contextPath }/static/vue/element/index.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>
<body>
<div id="exam">
    <template>
        <el-table
                :data="examTableData"
                border
                style="width: 100%">
            <el-table-column
                    prop="testname"
                    label="考试名称">
            </el-table-column>
            <el-table-column
                    prop="testdate"
                    label="考试日期"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="test"
                    label="考试时间">
            </el-table-column>
            <el-table-column
                    prop="testtime"
                    label="进入考试次数">
            </el-table-column>
            <el-table-column
                    label="操作">
                <template slot-scope="scope">
                    <el-button type="success" @click="enterExam(scope.row)">进入考试</el-button>
                </template>
            </el-table-column>
        </el-table>
    </template>
</div>
</body>
<script>
    new Vue({
        el: '#exam',
        data () {
            return {
                examTableData:[],
            }
        },
        //页面加载成功时完成
        mounted: function(){
            var user = 'ls';
            var _this = this;

            axios
                .get("/WJF/getExam/"+user)
                .then(function (res) {
                    console.log(res)
                    _this.examTableData=res.data;
                })
        },
        /*方法函数  事件等*/
        methods: {
            enterExam(row) {
                console.log(row)
                var aData = new Date();
                if(Date.parse(row.teststarttime) > aData){
                    alert("未到考试时间！");
                }else if(Date.parse(row.testendtime) < aData){
                    alert("考试时间已过！")
                }else if(Date.parse(row.teststarttime) < aData && Date.parse(row.testendtime) > aData){
                    if(row.testtime <0){
                        alert("考试次数已用完");
                    }else{
                        axios
                            .post("/WJF/reduceNum",{
                                testId : row.testid,
                                userId : row.userid
                            })
                            .then(function (res) {
                                location.href="/jsps/answer.jsp?testpaperid="+row.testpaperid+"&testId="+row.testid+"&userId"+row.userid;
                            })
                    }
                }

            }
        }
    });

</script>
</html>
