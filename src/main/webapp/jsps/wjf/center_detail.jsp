<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考试详情</title>
</head>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/vue/element/index.css">
<script src="${pageContext.request.contextPath }/static/vue/element/index.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>
<style>
    .grid-content {
        border-radius: 4px;
        min-height: 36px;
        margin-top: 30px;
    }
</style>
<body>


<div id="detail">
    <template>
        <el-row>
            <el-col :span="4"><div class="grid-content bg-purple"></div></el-col>
            <el-col :span="4"><div class="grid-content bg-purple-light"></div></el-col>
            <el-col :span="4"><div class="grid-content bg-purple"></div></el-col>
            <el-col :span="4"><div class="grid-content bg-purple-light"></div></el-col>
            <el-col :span="3"><div class="grid-content bg-purple"></div></el-col>
            <el-col :span="5"><div class="grid-content bg-purple-light">
                <span v-if="show">
                    <el-button type="primary" @click="faBu">发布成绩</el-button>
                </span>
                <span v-if="show1">
                    <el-button type="info">已发布成绩</el-button>
                </span>
            </div></el-col>
        </el-row>

        <el-table
                :data="examData"
                border
                style="width: 100%">
            <el-table-column
                    prop="testpapername"
                    label="试卷名称">
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
                    prop="follmark"
                    label="总分">
            </el-table-column>
            <el-table-column
                    prop="passmark"
                    label="及格分">
            </el-table-column>
        </el-table>
    </template>
    <el-row>
        <el-col :span="24"><div class="grid-content" style="background-color: #F2F2F2;height: 60px;line-height: 60px;"><h2>人员列表</h2></div></el-col>
    </el-row>
    <template style="margin-top: 20px">
        <el-table
                :data="peopleData"
                border
                style="width: 100%">
            <el-table-column
                    prop="truename"
                    label="姓名">
            </el-table-column>
            <el-table-column
                    prop="jobnumber"
                    label="工号">
            </el-table-column>
            <el-table-column
                    prop="score"
                    label="成绩">
            </el-table-column>
            <el-table-column
                    label="判卷状态">
                <template slot-scope="scope">
                    <span v-if="scope.row.score != null">
                        已判卷
                    </span>
                    <span v-if="scope.row.score == null">
                        未判卷
                    </span>
                </template>
            </el-table-column>
            <el-table-column
                    label="操作">
                <template slot-scope="scope">
                    <span v-if="show1">
                         <el-link type="info">去判卷</el-link>
                    </span>
                    <span v-if="show">
                        <el-link type="primary" @click="goPanJuan(scope.row)">去判卷</el-link>
                    </span>
                </template>

            </el-table-column>
        </el-table>
    </template>


</div>
</body>
<script>
    function getQueryString(name) {
        var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
            return unescape(r[2]);
        }
        return null;
    }

    new Vue({
        el: '#detail',
        /*变量*/
        data () {
            return {
                examData:[],
                peopleData:[],
                show:true,
                show1:false,
                testpaperid:'',

            }
        },
        //页面加载成功时完成
        mounted: function(){
            var _this = this;
            _this.testpaperid = getQueryString("testpaperid")
            //考试的详细信息
            axios
                .post("/WJF/paper",{
                    testpaperid:_this.testpaperid
                })
                .then(function (res) {
                    _this.examData=res.data;
                })
            //获取当前考试参考人员
            axios
                .post("/WJF/testPeople",{
                    testpaperid:_this.testpaperid
                })
                .then(function (res) {
                    console.log(res.data)
                    console.log("----------")
                    _this.peopleData=res.data;
                    for (var i = 0; i < _this.peopleData.length; i++) {
                        if(_this.peopleData[i].show == 1){
                            _this.show=false,
                             _this.show1=true
                        }else{
                            _this.show=true,
                            _this.show1=false
                        }
                    }
                })


        },
        /*方法函数  事件等*/
        methods: {

            //去批改试卷
            goPanJuan(row){
                var _this = this;
                location.href="/jsps/wjf/answer.jsp?testpaperid="+_this.testpaperid+"&userid="+row.userid+"&biaoshi=pigai"
            },
            //发布成绩
            faBu(){
                var _this = this;
                        this.$confirm('是否发布成绩?发布后判卷结果将不可修改', '提示', {
                            confirmButtonText: '确定',
                            cancelButtonText: '取消',
                            type: 'warning'
                        }).then(()=> {
                            for (var i = 0; i < _this.peopleData.length; i++){
                                axios
                                    .post("/WJF/faBu", {
                                        testpaperid: _this.testpaperid,
                                        userId: _this.peopleData[i].userid
                                    })
                                    .then(function (res) {
                                        _this.show1 = true;
                                        _this.show = false;
                                    })
                            }
                        }).catch(() => {
                                this.$message({
                                type: 'info',
                                message: '已取消'
                            });
                        });





            }
        }
    });
</script>
</html>
