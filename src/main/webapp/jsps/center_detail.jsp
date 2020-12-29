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
            <el-col :span="4"><div class="grid-content bg-purple"></div></el-col>
            <el-col :span="4"><div class="grid-content bg-purple-light"><el-button type="primary">发布成绩</el-button></div></el-col>
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
                <el-link type="primary" @click="goPanJuan">去判卷</el-link>
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


            }
        },
        //页面加载成功时完成
        mounted: function(){
            var _this = this;
            var testpaperid = getQueryString("testpaperid")
            axios
                .post("/WJF/paper",{
                    testpaperid:testpaperid
                })
                .then(function (res) {
                    console.log(res)
                    _this.examData=res.data;
                })
            axios
                .post("/WJF/testPeople",{
                    testpaperid:testpaperid
                })
                .then(function (res) {
                    console.log(res)
                    _this.peopleData=res.data;
                })

        },
        /*方法函数  事件等*/
        methods: {
            goPanJuan(){

            }
        }
    });
</script>
</html>
