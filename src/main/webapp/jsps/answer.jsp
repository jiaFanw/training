<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生答题页面</title>
</head>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/vue/element/index.css">
<script src="${pageContext.request.contextPath }/static/vue/element/index.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>
<body>
<div id="answer">
    <el-row style="margin-top: 20px">
        <el-col :span="4"><div class="grid-content"></div></el-col>
        <el-col :span="16">
            <div style="border: 1px solid black;">
                <el-row>
                    <el-col :span="10"><div class="grid-content"></div></el-col>
                    <el-col :span="9"><div class="grid-content"><h2>{{testpapername}}</h2></div></el-col>
                    <el-col :span="5"><div class="grid-content" style="margin-top: 20px">
                        试题共<span style="color: red">{{tiShu}}</span>道，共<span style="color: red">{{follmark}}</span>分</div></el-col>
                </el-row>
                <el-row>
                    <el-col :span="1"><div class="grid-content"></div></el-col>
                    <el-col :span="23">
                        <div v-if="daXuanTi != ''" class="grid-content">
                            <h3>单选题</h3>
                            <span v-for="(daXuan,i) in daXuanTi">
                                {{i+1}},{{daXuan.questionname}}
                                <ul>
                                    <li style="list-style: none;"><input type="radio" name="answer" value="A"/>{{daXuan.optiona}}</li>
                                    <li style="list-style: none;"><input type="radio" name="answer" value="B"/>{{daXuan.optionb}}</li>
                                    <li style="list-style: none;"><input type="radio" name="answer" value="C"/>{{daXuan.optionc}}</li>
                                    <li style="list-style: none;"><input type="radio" name="answer" value="D"/>{{daXuan.optiond}}</li>
                                </ul>
                                <h4>分值：<span style="color: red">{{daXuan.score}}</span></h4>
                            </span>
                        </div>
                        <div v-if="duoXuanTi != ''" class="grid-content">
                            <h3>多选题</h3>
                            <span v-for="(duoXuan,i) in duoXuanTi">
                                {{i+1}},{{duoXuan.questionname}}
                                <ul>
                                    <li style="list-style: none;"><el-checkbox  label="A">{{duoXuan.optiona}}</el-checkbox ></li>
                                    <li style="list-style: none;"><el-checkbox  label="B">{{duoXuan.optionb}}</el-checkbox ></li>
                                    <li style="list-style: none;"><el-checkbox  label="C">{{duoXuan.optionc}}</el-checkbox ></li>
                                    <li style="list-style: none;"><el-checkbox  label="D">{{duoXuan.optiond}}</el-checkbox ></li>
                                </ul>
                                <h4>分值：<span style="color: red">{{duoXuan.score}}</span></h4>
                            </span>
                        </div>
                        <div v-if="panDuanti != ''" class="grid-content">
                            <h3>判断题</h3>
                            <span v-for="(panDuan,i) in panDuanti">
                                {{i+1}},{{panDuan.questionname}}
                                <ul>
                                    <li style="list-style: none;"><el-radio label="1">正确</el-radio></li>
                                    <li style="list-style: none;"><el-radio label="2">错误</el-radio></li>
                                </ul>
                                <h4>分值：<span style="color: red">{{panDuan.score}}</span></h4>
                            </span>
                        </div>
                        <div v-if="tianKongTi != ''" class="grid-content">
                            <h3>填空题</h3>
                            <span v-for="(tianKong,i) in tianKongTi">
                                {{i+1}},{{tianKong.questionname}}<br/>
                                填空答案：<el-input style="width: 300px"></el-input>
                                <h4>分值：<span style="color: red">{{tianKong.score}}</span></h4>
                            </span>
                        </div>
                        <div v-if="jianDaTi != ''" class="grid-content">
                            <h3>简答题</h3>
                            <span v-for="(jianDa,i) in jianDaTi">
                                {{i+1}},{{jianDa.questionname}}
                                <el-input type="textarea" v-model="jianDaAnswer"></el-input>
                                <h4>分值：<span style="color: red">{{jianDa.score}}</span></h4>
                            </span>
                        </div>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="10"><div class="grid-content"></div></el-col>
                    <el-col :span="8"><div class="grid-content"><el-button type="success" style="width: 200px" @click="jiaoJuan">交卷</el-button></div></el-col>
                    <el-col :span="6"><div class="grid-content"></div></el-col>
                </el-row>
            </div>
        </el-col>
        <el-col :span="4"><div class="grid-content bg-purple"></div></el-col>
    </el-row>
</div>
</body>
<style>
    .grid-content {
        border-radius: 4px;
        min-height: 36px;
    }
</style>
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
        el: '#answer',
        data () {
            return {
                testpapername:'',
                tiShu:'',
                follmark:'',
                daXuanTi:[],//单选题
                duoXuanTi:[],//多选题
                panDuanti:[],//判断题
                tianKongTi:[],//填空题
                jianDaTi:[],//简答题
                testpaperid:'',
                testId:'',
                userId:'',
                jianDaAnswer:'',//简答题填写内容

            }
        },
        //页面加载成功时完成
        mounted: function(){
            var _this = this;
            _this.testpaperid = getQueryString("testpaperid");
            axios
                .post("/WJF/kaoShi/"+_this.testpaperid)
                .then(function (res) {
                    console.log(res.data)
                    _this.testpapername=res.data.testpapername;
                    _this.tiShu=res.data.tiShu;
                    _this.follmark=res.data.follmark;
                })

            axios
                .post("/WJF/danXuan/"+_this.testpaperid)
                .then(function (res) {
                    console.log(res.data)
                    _this.daXuanTi=res.data;
                })
            axios
                .post("/WJF/duoXuan/"+_this.testpaperid)
                .then(function (res) {
                    console.log(res.data)
                    _this.duoXuanTi=res.data;
                })
            axios
                .post("/WJF/panDuan/"+_this.testpaperid)
                .then(function (res) {
                    console.log(res.data)
                    _this.panDuanti=res.data;
                })
            axios
                .post("/WJF/tianKong/"+_this.testpaperid)
                .then(function (res) {
                    console.log(res.data)
                    _this.tianKongTi=res.data;
                })
            axios
                .post("/WJF/jianDa/"+_this.testpaperid)
                .then(function (res) {
                    console.log(res.data)
                    _this.jianDaTi=res.data;
                })
        },
        /*方法函数  事件等*/
        methods: {
            jiaoJuan(){
                var _this = this;
                _this.testId = getQueryString("testId");
                _this.userId = getQueryString("userId");
                this.$confirm('是否确认交卷?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    axios
                        .post('/WJF/jiaoJuan',{
                            testpaperid:_this.testpaperid,
                            testId:_this.testId,
                            userId:_this.userId
                        })
                        .then(function (res) {
                            location.href="/jsps/jiaoJuanSuccess.jsp";
                        });
                })
            },
        }
    });

</script>
</html>
