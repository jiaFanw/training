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
<script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js"></script>
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
                                    <el-radio-group v-model="danXuanAnswer[i]">
                                        <li style="list-style: none;"><el-radio label="A">{{daXuan.optiona}}</el-radio></li>
                                        <li style="list-style: none;"><el-radio label="B">{{daXuan.optionb}}</el-radio></li>
                                        <li style="list-style: none;"><el-radio label="C">{{daXuan.optionc}}</el-radio></li>
                                        <li style="list-style: none;"><el-radio label="D">{{daXuan.optiond}}</el-radio></li>
                                    </el-radio-group>
                                </ul>
                                <h4>分值：<span style="color: red">{{daXuan.score}}</span></h4>
                            </span>
                        </div>
                        <div v-if="duoXuanTi != ''" class="grid-content" id="duo">
                            <h3>多选题</h3>
                        </div>
                        <div v-if="panDuanti != ''" class="grid-content">
                            <h3>判断题</h3>
                            <span v-for="(panDuan,i) in panDuanti">
                                {{i+1}},{{panDuan.questionname}}
                                <ul>
                                    <el-radio-group v-model="panDuanAnswer[i]">
                                        <li style="list-style: none;"><el-radio label="正确">正确</el-radio></li>
                                        <li style="list-style: none;"><el-radio label="错误">错误</el-radio></li>
                                    </el-radio-group>
                                </ul>
                                <h4>分值：<span style="color: red">{{panDuan.score}}</span></h4>
                            </span>
                        </div>
                        <div v-if="tianKongTi != ''" class="grid-content">
                            <h3>填空题</h3>
                            <span v-for="(tianKong,i) in tianKongTi">
                                {{i+1}},{{tianKong.questionname}}<br/>
                                填空答案：<el-input style="width: 300px" v-model="tianKongAnswer[i]"></el-input>
                                <h4>分值：<span style="color: red">{{tianKong.score}}</span></h4>
                            </span>
                        </div>
                        <div v-if="jianDaTi != ''" class="grid-content">
                            <h3>简答题</h3>
                            <span v-for="(jianDa,i) in jianDaTi">
                                {{i+1}},{{jianDa.questionname}}
                                <el-input type="textarea" v-model="jianDaAnswer[i]"></el-input>
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
                jianDaAnswer:[],//简答题填写内容
                jianDaNum:'',//简答题填写内容
                danXuanAnswer:[],
                danXuantiNum:'',
                duoXuanAnswer:[],
                duoXuanNum:'',
                panDuanAnswer:[],
                panDuanNum:'',
                tianKongAnswer:[],
                tianKongNum:'',


            }
        },
        beforeCreate() {
            var _this = this;
            _this.testpaperid = getQueryString("testpaperid");
            axios
                .post("/WJF/duoXuan/"+_this.testpaperid)
                .then(function (res) {
                    _this.duoXuanTi=res.data;
                    _this.duoXuanNum= _this.duoXuanTi.length;
                    var aa = "";

                    for (var i =0;i< _this.duoXuanTi.length;i++) {
                        aa+="<span>"
                        aa+= i+1+","+_this.duoXuanTi[i].questionname
                        aa+="<ul>"
                        aa+="<li style='list-style: none;'><input type='checkbox' value='A' name='duoXuanAnswer"+i+"'>"+_this.duoXuanTi[i].optiona
                        aa+="</li><li style='list-style: none;'><input type='checkbox' value='B' name='duoXuanAnswer"+i+"'>"+_this.duoXuanTi[i].optionb
                        aa+="</li><li style='list-style: none;'><input type='checkbox' value='C' name='duoXuanAnswer"+i+"'>"+_this.duoXuanTi[i].optionc
                        aa+="</li><li style='list-style: none;'><input type='checkbox' value='D' name='duoXuanAnswer"+i+"'>"+_this.duoXuanTi[i].optiond+"</li>"
                        aa+="</ul>"
                        aa+="<h4>分值：<span style='color: red'>"+_this.duoXuanTi[i].score+"</span></h4>"
                        aa+="</span>"

                    }
                    $("#duo").append(aa);

                })

        },
        created() {
            var _this = this;
            _this.testpaperid = getQueryString("testpaperid");
            axios
                .post("/WJF/duoXuan/"+_this.testpaperid)
                .then(function (res) {
                    _this.duoXuanTi=res.data;
                    _this.duoXuanNum= _this.duoXuanTi.length;
                    var aa = "";
                    for (var i =0;i< _this.duoXuanTi.length;i++) {
                        aa+="<span>"
                        aa+= i+1+","+_this.duoXuanTi[i].questionname
                        aa+="<ul>"
                        aa+="<li style='list-style: none;'><input type='checkbox' value='A' name='duoXuanAnswer"+i+"'>"+_this.duoXuanTi[i].optiona
                        aa+="</li><li style='list-style: none;'><input type='checkbox' value='B' name='duoXuanAnswer"+i+"'>"+_this.duoXuanTi[i].optionb
                        aa+="</li><li style='list-style: none;'><input type='checkbox' value='C' name='duoXuanAnswer"+i+"'>"+_this.duoXuanTi[i].optionc
                        aa+="</li><li style='list-style: none;'><input type='checkbox' value='D' name='duoXuanAnswer"+i+"'>"+_this.duoXuanTi[i].optiond+"</li>"
                        aa+="</ul>"
                        aa+="<h4>分值：<span style='color: red'>"+_this.duoXuanTi[i].score+"</span></h4>"
                        aa+="</span>"

                    }
                    $("#duo").append(aa);

                })
        },
        //页面加载成功时完成
        mounted: function(){
            var _this = this;
            _this.testpaperid = getQueryString("testpaperid");
            axios
                .post("/WJF/kaoShi/"+_this.testpaperid)
                .then(function (res) {
                    _this.testpapername=res.data.testpapername;
                    _this.tiShu=res.data.tiShu;
                    _this.follmark=res.data.follmark;
                })

            //单选题
            axios
                .post("/WJF/danXuan/"+_this.testpaperid)
                .then(function (res) {
                    _this.daXuanTi=res.data;
                    _this.danXuantiNum=res.data.length;
                    for (var i =0;i< _this.daXuanTi.length;i++) {
                        _this.danXuanAnswer.push("danXuanAnswer"+i);
                    }
                })



            //判断题
            axios
                .post("/WJF/panDuan/"+_this.testpaperid)
                .then(function (res) {
                    _this.panDuanti=res.data;
                    _this.panDuanNum=_this.panDuanti.length;
                    for (var i =0;i< _this.panDuanti.length;i++) {
                        _this.panDuanAnswer.push("panDuanAnswer"+i);
                    }
                })
            //填空题
            axios
                .post("/WJF/tianKong/"+_this.testpaperid)
                .then(function (res) {
                    _this.tianKongTi=res.data;
                    _this.tianKongNum = _this.tianKongTi.length;
                    for (var i =0;i< _this.tianKongTi.length;i++) {
                        _this.tianKongAnswer.push("tianKongAnswer"+i);
                    }
                })
            //简答题
            axios
                .post("/WJF/jianDa/"+_this.testpaperid)
                .then(function (res) {
                    _this.jianDaTi=res.data;
                    _this.jianDaNum= _this.jianDaTi.length;
                    for (var i =0;i< _this.jianDaTi.length;i++) {
                        _this.jianDaAnswer.push("jianDaAnswer"+i);
                    }
                })
        },
        /*方法函数  事件等*/
        methods: {
            jiaoJuan(){
                var _this = this;
                var daAn = [];

                //单选选中的答案
                for (var i = 0; i <_this.danXuantiNum ; i++) {
                    daAn.push(_this.danXuanAnswer[i])
                }
                //多选选中的答案
                for (var i = 0; i <_this.duoXuanNum ; i++) {
                    var duo = '';
                    var name = document.getElementsByName('duoXuanAnswer'+i);
                    for(var j=0;j<name.length;j++){
                        if(name[j].checked==true){
                            duo+=name[j].value;
                        }
                    }
                    daAn.push(duo)
                }

                for (var i = 0; i <_this.panDuanNum ; i++) {
                    daAn.push(_this.panDuanAnswer[i])
                }

                for (var i = 0; i <_this.tianKongNum ; i++) {
                    daAn.push(_this.tianKongAnswer[i])
                }
                for (var i = 0; i <_this.jianDaNum ; i++) {
                    daAn.push(_this.jianDaAnswer[i])
                }

                console.log(daAn)
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
                            userId:_this.userId,
                            daAn:daAn
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
