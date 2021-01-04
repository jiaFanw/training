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
<script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js"></script>
<body>
<input type="hidden" id="username" value="${user.username}">
<input type="hidden" id="userid" value="${user.userid}">
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
            var user = $("#username").val();
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
                    if(row.testtime <= 0){
                        alert("考试次数已用完");
                    }
                    else{
                        //考试次数等于3时，表示员工没有参与过考试，直接进入考试
                        if(row.testtime == 3){
                            axios
                                .post("/WJF/reduceNum",{
                                    testId : row.testid,
                                    userId : row.userid
                                })
                                .then(function (res) {
                                    location.reload();
                                    window.open("/jsps/wjf/answer.jsp?testpaperid="+row.testpaperid+"&testId="+row.testid+"&userId="+row.userid+"&num="+row.testtime, '_blank');
                                })
                        }else {
                            //考试次数<3时，表示员工已经参加过考试，再次进入考试，将会覆盖上次答题的答案
                            this.$confirm('是否再次参加考试(上次答题成绩将作废)?', '提示', {
                                confirmButtonText: '确定',
                                cancelButtonText: '取消',
                                type: 'warning'
                            }).then(() => {
                                axios
                                    .post("/WJF/reduceNum",{
                                        testId : row.testid,
                                        userId : row.userid
                                    })
                                    .then(function (res) {
                                        location.reload();
                                        window.open("/jsps/wjf/answer.jsp?testpaperid="+row.testpaperid+"&testId="+row.testid+"&userId="+row.userid+"&num="+row.testtime, '_blank');
                                    })
                        }).catch(() => {
                                this.$message({
                                type: 'info',
                                message: '已取消'
                            });
                        });
                        }

                    }
                }

            }
        }
    });

</script>
</html>
